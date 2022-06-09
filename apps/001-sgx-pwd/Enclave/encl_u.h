#ifndef ENCL_U_H__
#define ENCL_U_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include <string.h>
#include "sgx_edger8r.h" /* for sgx_status_t etc. */


#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

#ifndef OCALL_PRINT_DEFINED__
#define OCALL_PRINT_DEFINED__
void SGX_UBRIDGE(SGX_NOCONVENTION, ocall_print, (const char* str));
#endif

sgx_status_t ecall_dummy(sgx_enclave_id_t eid, int* retval, int i);
sgx_status_t ecall_get_secret(sgx_enclave_id_t eid, int* retval, int* secret, char* pin);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
