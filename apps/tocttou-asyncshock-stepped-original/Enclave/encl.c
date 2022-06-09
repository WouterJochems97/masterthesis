#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>

static char data[] = {'g', 'o', 'o', 'd', ' ', 'd', 'a', 't', 'a', '\0'};
static int random_wait = 0;

void ecall_setup() {
	__uint16_t val; 
        sgx_read_rand((unsigned char *) &val, 4);
	random_wait = val;
}

void ecall_writer_thread() {
	for(int i = 0; i < 100000; i++);
	for(int j = 0; j < random_wait; j++);
	memcpy(data, "bad data", 10);
}

int ecall_checker_thread() {
	char *str = calloc(1, 10);
	if (strncmp("bad data", data, 9) != 0) {
		memcpy(str, data, 10);
		ocall_print_string(str);
		free(str);
		return 0;
	} else {
		ocall_print_string("Sorry, no access!\n");
		return -1;
	}
}
