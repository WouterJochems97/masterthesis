#include "encl_u.h"
#include <errno.h>

typedef struct ms_ecall_checker_thread_t {
	int ms_retval;
} ms_ecall_checker_thread_t;

typedef struct ms_ocall_print_string_t {
	const char* ms_str;
} ms_ocall_print_string_t;

static sgx_status_t SGX_CDECL encl_ocall_print_string(void* pms)
{
	ms_ocall_print_string_t* ms = SGX_CAST(ms_ocall_print_string_t*, pms);
	ocall_print_string(ms->ms_str);

	return SGX_SUCCESS;
}

static const struct {
	size_t nr_ocall;
	void * table[1];
} ocall_table_encl = {
	1,
	{
		(void*)encl_ocall_print_string,
	}
};
sgx_status_t ecall_setup(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 0, &ocall_table_encl, NULL);
	return status;
}

sgx_status_t ecall_writer_thread(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 1, &ocall_table_encl, NULL);
	return status;
}

sgx_status_t ecall_checker_thread(sgx_enclave_id_t eid, int* retval)
{
	sgx_status_t status;
	ms_ecall_checker_thread_t ms;
	status = sgx_ecall(eid, 2, &ocall_table_encl, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

