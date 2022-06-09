/*
 *  This file is part of the SGX-Step enclave execution control framework.
 *
 *  Copyright (C) 2017 Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>,
 *                     Raoul Strackx <raoul.strackx@cs.kuleuven.be>
 *
 *  SGX-Step is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  SGX-Step is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with SGX-Step. If not, see <http://www.gnu.org/licenses/>.
 */

    .data
    .global secret_str
    .align 0x1000   /* 4KiB */
secret_str:
    .ascii "SysTEX 2017" //len=11
    .space 0x100000 /* 1 MiB */

    .text
    .global my_strlen
    .align 0x1000   /* 4KiB */
    .type my_strlen,@function
my_strlen:
    mov    %rdi,%rax
1:  cmpb   $0x0,(%rax)
    je     2f
    inc    %rax
    jmp    1b
2:  sub    %rdi,%rax
    retq   
    .space 0x1000   /* 4KiB */

