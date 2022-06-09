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

int cipher;
int plain;
uint32_t mask = 0x10000;
uint16_t key = 0;
void *multiply_address;
void *modpow_address;
void *square_address;



void fault_handler(void *base_adrs) {
	if(base_adrs == modpow_address) {
		ASSERT(!mprotect((void *)modpow_address, 4096, PROT_READ | PROT_WRITE));
		ASSERT(!mprotect((void *)multiply_address, 4096, PROT_NONE));
		ASSERT(!mprotect((void *)square_address, 4096, PROT_NONE));
		return;
	}
	if(base_adrs == square_address) {
		ASSERT(!mprotect((void *)square_address, 4096, PROT_READ | PROT_WRITE));
		if(mask == 1) {mask = 0x10000;key=0;};
		ASSERT(!mprotect((void *)modpow_address, 4096, PROT_NONE));
		mask = mask >> 1;
		return;
	}
	if(base_adrs == multiply_address) {
		ASSERT(!mprotect((void *)multiply_address, 4096, PROT_READ | PROT_WRITE));
		ASSERT(!mprotect((void *)modpow_address, 4096, PROT_NONE));
		key |= mask;
		return;
	}
}

int main( int argc, char **argv) {
	sgx_launch_token_t token = {0};
	int updated = 0;

	SGX_ASSERT(sgx_create_enclave("./Enclave/encl.so", 1, &token, &updated, &eid, NULL));

	baseAddress = (uintptr_t) get_enclave_base();
	register_fault_handler(fault_handler);
	multiply_address = baseAddress + (20480/4096)*4096;
	modpow_address = baseAddress + (8255/4096)*4096;
	square_address = baseAddress + (12288/4096)*4096;

	
	
	
	
	SGX_ASSERT(ecall_rsa_encode(eid, &cipher, 1234));
	ASSERT(!mprotect((void *)modpow_address, 4096, PROT_NONE));
	SGX_ASSERT(ecall_rsa_decode(eid, &plain, &cipher));
	printf("Key retrieved: %d\n", key);;
	SGX_ASSERT( sgx_destroy_enclave( eid ) );
	info("all is well; exiting..");
	return 0;
}
