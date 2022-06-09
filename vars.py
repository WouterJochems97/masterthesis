
# general
imports = "#include <sgx_urts.h>\n" \
          "#include \"Enclave/encl_u.h\"\n" \
          "#include <signal.h>\n" \
          "#include <sys/mman.h>\n" \
          "#include <stdlib.h>\n" \
          "#include <stdio.h>\n" \
          "#include <unistd.h>\n" \
          "#include <pthread.h>\n" \
          "#include \"libsgxstep/apic.h\"\n" \
          "#include \"libsgxstep/pt.h\"\n" \
          "#include \"libsgxstep/sched.h\"\n" \
          "#include \"libsgxstep/enclave.h\"\n" \
          "#include \"libsgxstep/debug.h\"\n" \
          "#include \"libsgxstep/config.h\"\n" \
          "#include \"libsgxstep/idt.h\"\n\n"

variables = "sgx_enclave_id_t eid = 0;\nuintptr_t baseAddress;\n"

createEnclave = "\tsgx_launch_token_t token = {0};\n\tint updated = 0;\n\n" \
                "\tSGX_ASSERT(sgx_create_enclave(\"./Enclave/encl.so\", 1, &token, &updated, &eid, NULL));\n\n" \
                "\tbaseAddress = (uintptr_t) get_enclave_base();\n"

destroyEnclave = "\tSGX_ASSERT( sgx_destroy_enclave( eid ) );\n\tinfo(\"all is well; exiting..\");\n\treturn 0;\n"

def joinFuncMain(line):
    line = line.split()
    return "pthread_join(" + line[1] + ",NULL);\n"

# faults
addFaultHandler = "\tregister_fault_handler(fault_handler);\n"

def block(address):
    return "ASSERT(!mprotect((void *)" + address + ", 4096, PROT_NONE));"


def unBlock(address):
    return "ASSERT(!mprotect((void *)" + address + ", 4096, PROT_READ | PROT_WRITE));"



# single-stepping
stepVariables = "int irq_cnt = 0, do_irq = 1, fault_cnt = 0;\nuint64_t *pte_encl = NULL;\nuint64_t *pmd_encl = NULL;\nint stepFault = 1;\n\n"

aep1 = "void aep_cb_func(void) {\n" \
       "\tirq_cnt++;\n\n"


def aep2(address):
    return "\t\tdo_irq = 0;\n" \
           "\t\tASSERT(!mprotect((void *) " + address + ", 4096, PROT_NONE));\n" \
                                                        "\t\tapic_timer_deadline();\n\t}\n\n"


aep3 = "\tif ((irq_cnt > 100*500)) {\n\t\tdo_irq = 0;\n\t}\n\n" \
       "\tif (do_irq) {" \
       "\n\t*pmd_encl = MARK_NOT_ACCESSED( *pmd_encl );" \
       "\n\tapic_timer_irq( SGX_STEP_TIMER_INTERVAL );\n\t}\n}\n"

stepBegin = "\n\tattacker_config_runtime();\n" \
            "\tattacker_config_page_table();\n\n" \
            "\tidt_t idt = {0};\n" \
            "\tmap_idt(&idt);\n" \
            "\tinstall_kernel_irq_handler(&idt, __ss_irq_handler, IRQ_VECTOR);\n" \
            "\tapic_timer_oneshot(IRQ_VECTOR);\n"


def attacker_config_runtime():
    return "void attacker_config_runtime(void) {\n" \
           "\tASSERT( !claim_cpu(VICTIM_CPU) );\n" \
           "\tASSERT( !prepare_system_for_benchmark(PSTATE_PCT) );\n\n" \
           "\tregister_aep_cb(aep_cb_func);\n" \
           "\tregister_enclave_info();\n" \
           "\tprint_enclave_info();\n}\n\n"


def attacker_config_page_table(address):
    print("Hi u bent hier")
    return "void attacker_config_page_table(void) {\n" \
           "\tASSERT(pte_" + address + " = remap_page_table_level( (void *) " + address + "_address , PTE) );\n" \
           "\tASSERT(!mprotect((void *) " + address + "_address, 4096, PROT_NONE));\n" \
           "\tASSERT( pmd_encl = remap_page_table_level( get_enclave_base(), PMD) );\n}\n"

