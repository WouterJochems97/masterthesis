#include "encl_t.h"

#include "sgx_trts.h" /* for sgx_ocalloc, sgx_is_outside_enclave */
#include "sgx_lfence.h" /* for sgx_lfence */

#include <errno.h>
#include <mbusafecrt.h> /* for memcpy_s etc */
#include <stdlib.h> /* for malloc/free etc */

#define CHECK_REF_POINTER(ptr, siz) do {	\
	if (!(ptr) || ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define CHECK_UNIQUE_POINTER(ptr, siz) do {	\
	if ((ptr) && ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define CHECK_ENCLAVE_POINTER(ptr, siz) do {	\
	if ((ptr) && ! sgx_is_within_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define ADD_ASSIGN_OVERFLOW(a, b) (	\
	((a) += (b)) < (b)	\
)


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

static sgx_status_t SGX_CDECL sgx_ecall_dummy(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_ecall_dummy_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_ecall_dummy_t* ms = SGX_CAST(ms_ecall_dummy_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	ms->ms_retval = ecall_dummy(ms->ms_i);


	return status;
}

static sgx_status_t SGX_CDECL sgx_ecall_get_secret(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_ecall_get_secret_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_ecall_get_secret_t* ms = SGX_CAST(ms_ecall_get_secret_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	int* _tmp_secret = ms->ms_secret;
	size_t _len_secret = sizeof(int);
	int* _in_secret = NULL;
	char* _tmp_pin = ms->ms_pin;
	size_t _len_pin = ms->ms_pin_len ;
	char* _in_pin = NULL;

	CHECK_UNIQUE_POINTER(_tmp_secret, _len_secret);
	CHECK_UNIQUE_POINTER(_tmp_pin, _len_pin);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_secret != NULL && _len_secret != 0) {
		if ( _len_secret % sizeof(*_tmp_secret) != 0)
		{
			status = SGX_ERROR_INVALID_PARAMETER;
			goto err;
		}
		if ((_in_secret = (int*)malloc(_len_secret)) == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memset((void*)_in_secret, 0, _len_secret);
	}
	if (_tmp_pin != NULL && _len_pin != 0) {
		_in_pin = (char*)malloc(_len_pin);
		if (_in_pin == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		if (memcpy_s(_in_pin, _len_pin, _tmp_pin, _len_pin)) {
			status = SGX_ERROR_UNEXPECTED;
			goto err;
		}

		_in_pin[_len_pin - 1] = '\0';
		if (_len_pin != strlen(_in_pin) + 1)
		{
			status = SGX_ERROR_UNEXPECTED;
			goto err;
		}
	}

	ms->ms_retval = ecall_get_secret(_in_secret, _in_pin);
	if (_in_secret) {
		if (memcpy_s(_tmp_secret, _len_secret, _in_secret, _len_secret)) {
			status = SGX_ERROR_UNEXPECTED;
			goto err;
		}
	}

err:
	if (_in_secret) free(_in_secret);
	if (_in_pin) free(_in_pin);
	return status;
}

SGX_EXTERNC const struct {
	size_t nr_ecall;
	struct {void* ecall_addr; uint8_t is_priv; uint8_t is_switchless;} ecall_table[2];
} g_ecall_table = {
	2,
	{
		{(void*)(uintptr_t)sgx_ecall_dummy, 0, 0},
		{(void*)(uintptr_t)sgx_ecall_get_secret, 0, 0},
	}
};

SGX_EXTERNC const struct {
	size_t nr_ocall;
	uint8_t entry_table[1][2];
} g_dyn_entry_table = {
	1,
	{
		{0, 0, },
	}
};


sgx_status_t SGX_CDECL ocall_print(const char* str)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_str = str ? strlen(str) + 1 : 0;

	ms_ocall_print_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_ocall_print_t);
	void *__tmp = NULL;


	CHECK_ENCLAVE_POINTER(str, _len_str);

	if (ADD_ASSIGN_OVERFLOW(ocalloc_size, (str != NULL) ? _len_str : 0))
		return SGX_ERROR_INVALID_PARAMETER;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_ocall_print_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_ocall_print_t));
	ocalloc_size -= sizeof(ms_ocall_print_t);

	if (str != NULL) {
		ms->ms_str = (const char*)__tmp;
		if (_len_str % sizeof(*str) != 0) {
			sgx_ocfree();
			return SGX_ERROR_INVALID_PARAMETER;
		}
		if (memcpy_s(__tmp, ocalloc_size, str, _len_str)) {
			sgx_ocfree();
			return SGX_ERROR_UNEXPECTED;
		}
		__tmp = (void *)((size_t)__tmp + _len_str);
		ocalloc_size -= _len_str;
	} else {
		ms->ms_str = NULL;
	}
	
	status = sgx_ocall(0, ms);

	if (status == SGX_SUCCESS) {
	}
	sgx_ocfree();
	return status;
}

