#include "encl_u.h"
#include <errno.h>

typedef struct ms_ecall_dummy_t {
	int ms_retval;
	int ms_i;
} ms_ecall_dummy_t;

typedef struct ms_ecall_get_secret_t {
	int ms_retval;
	int* ms_secret;
	char* ms_pin;
	size_t ms_pin_len;
} ms_ecall_get_secret_t;

typedef struct ms_ocall_print_t {
	const char* ms_str;
} ms_ocall_print_t;

static sgx_status_t SGX_CDECL encl_ocall_print(void* pms)
{
	ms_ocall_print_t* ms = SGX_CAST(ms_ocall_print_t*, pms);
	ocall_print(ms->ms_str);

	return SGX_SUCCESS;
}

static const struct {
	size_t nr_ocall;
	void * table[1];
} ocall_table_encl = {
	1,
	{
		(void*)encl_ocall_print,
	}
};
sgx_status_t ecall_dummy(sgx_enclave_id_t eid, int* retval, int i)
{
	sgx_status_t status;
	ms_ecall_dummy_t ms;
	ms.ms_i = i;
	status = sgx_ecall(eid, 0, &ocall_table_encl, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t ecall_get_secret(sgx_enclave_id_t eid, int* retval, int* secret, char* pin)
{
	sgx_status_t status;
	ms_ecall_get_secret_t ms;
	ms.ms_secret = secret;
	ms.ms_pin = pin;
	ms.ms_pin_len = pin ? strlen(pin) + 1 : 0;
	status = sgx_ecall(eid, 1, &ocall_table_encl, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

