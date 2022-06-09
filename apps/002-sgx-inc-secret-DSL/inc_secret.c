#include <sgx_urts.h>
#include "Enclave/encl_u.h"
#include <signal.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include "libsgxstep/apic.h"
#include "libsgxstep/pt.h"
#include "libsgxstep/sched.h"
#include "libsgxstep/enclave.h"
#include "libsgxstep/debug.h"
#include "libsgxstep/config.h"
#include "libsgxstep/idt.h"

sgx_enclave_id_t eid = 0;
uintptr_t baseAddress;

int fault_fired = 0;
void *a_address;



void fault_handler(void *base_adrs) {
	if(base_adrs == a_address) {
		ASSERT(!mprotect((void *)a_address, 4096, PROT_READ | PROT_WRITE));
		fault_fired++;
	}
}

int main( int argc, char **argv) {
	sgx_launch_token_t token = {0};
	int updated = 0;

	SGX_ASSERT(sgx_create_enclave("./Enclave/encl.so", 1, &token, &updated, &eid, NULL));

	baseAddress = (uintptr_t) get_enclave_base();
	register_fault_handler(fault_handler);
	a_address = baseAddress + (53248/4096)*4096;

	
	ASSERT(!mprotect((void *)a_address, 4096, PROT_NONE));
	SGX_ASSERT(ecall_inc_secret(eid, 1));
	printf("secret=%d!!!!\n", fault_fired);
	SGX_ASSERT( sgx_destroy_enclave( eid ) );
	info("all is well; exiting..");
	return 0;
}