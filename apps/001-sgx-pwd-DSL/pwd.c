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

int tsc1;
int tsc2;
int med;
int secret=0;
int allowed=0;

void ocall_print(const char *str)
{
    info("ocall_print: enclave says: '%s'", str);
}

char *read_from_user(void)
{
    char *buffer = NULL;
    int len; size_t size;

    printf("Enter super secret password ('q' to exit): ");
    if ((len=getline(&buffer, &size, stdin)) != -1)
    {
        /* get rid of the terminating newline character */
        buffer[len-1]='\0';
        printf("--> You entered: '%s'\n", buffer);
        return buffer;
    }
    else
    {
        printf("--> failure to read line\n");
        return NULL;
    }
}

int compare(const void * a, const void * b) {
   return ( *(uint64_t*)a - *(uint64_t*)b );
}

void fault_handler(void *base_adrs) {
}

int main( int argc, char **argv) {
	sgx_launch_token_t token = {0};
	int updated = 0;

	SGX_ASSERT(sgx_create_enclave("./Enclave/encl.so", 1, &token, &updated, &eid, NULL));

	baseAddress = (uintptr_t) get_enclave_base();
	register_fault_handler(fault_handler);

	
	
	
	char *pwd;
	
	
	uint64_t diff[1000];
	while((pwd = read_from_user()) && strcmp(pwd, "q")) {;
	for (int j=0; j < 1000; j++) {;
	tsc1 = rdtsc_begin();
	SGX_ASSERT(ecall_get_secret(eid, &allowed, &secret, pwd));
	tsc2 = rdtsc_end();
	diff[j] = tsc2 - tsc1;
	;};
	if(allowed) {;
	printf("allowed\n");
	} else {;
	printf("denied\n");
	;};
	qsort(diff, 1000, sizeof(uint64_t), compare);
	med = diff[500];
	printf("time (med clock cycles): %lu\n", med);
	free(pwd);
	;};
	SGX_ASSERT( sgx_destroy_enclave( eid ) );
	info("all is well; exiting..");
	return 0;
}
