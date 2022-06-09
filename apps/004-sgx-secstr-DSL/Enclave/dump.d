
encl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <.plt>:
    1000:	ff 35 b2 bf 00 00    	pushq  0xbfb2(%rip)        # cfb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	ff 25 b4 bf 00 00    	jmpq   *0xbfb4(%rip)        # cfc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    100c:	0f 1f 40 00          	nopl   0x0(%rax)

Disassembly of section .plt.got:

0000000000001010 <_Z9pcl_entryPvS_@plt>:
    1010:	ff 25 ba bf 00 00    	jmpq   *0xbfba(%rip)        # cfd0 <_Z9pcl_entryPvS_>
    1016:	66 90                	xchg   %ax,%ax

0000000000001018 <ippcpSetCpuFeatures@plt>:
    1018:	ff 25 c2 bf 00 00    	jmpq   *0xbfc2(%rip)        # cfe0 <ippcpSetCpuFeatures>
    101e:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001020 <trts_access_version_dummy1>:
    1020:	48 8d 05 e9 bf 00 00 	lea    0xbfe9(%rip),%rax        # d010 <sgx_trts_version>
    1027:	c6 00 73             	movb   $0x73,(%rax)
    102a:	c3                   	retq   
    102b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001030 <tstdc_access_version_dummy1>:
    1030:	c6 05 09 c0 00 00 73 	movb   $0x73,0xc009(%rip)        # d040 <sgx_tstdc_version>
    1037:	48 8d 05 02 c0 00 00 	lea    0xc002(%rip),%rax        # d040 <sgx_tstdc_version>
    103e:	c3                   	retq   
    103f:	90                   	nop

0000000000001040 <tcrypto_access_version_dummy1>:
    1040:	c6 05 19 c0 00 00 73 	movb   $0x73,0xc019(%rip)        # d060 <sgx_tcrypto_version>
    1047:	48 8d 05 12 c0 00 00 	lea    0xc012(%rip),%rax        # d060 <sgx_tcrypto_version>
    104e:	c3                   	retq   
    104f:	90                   	nop

0000000000001050 <tservice_access_version_dummy1>:
    1050:	c6 05 29 c0 00 00 73 	movb   $0x73,0xc029(%rip)        # d080 <sgx_tservice_version>
    1057:	48 8d 05 22 c0 00 00 	lea    0xc022(%rip),%rax        # d080 <sgx_tservice_version>
    105e:	c3                   	retq   

000000000000105f <ecall_set_secret>:
    105f:	48 8d 15 9a df 00 00 	lea    0xdf9a(%rip),%rdx        # f000 <array>
    1066:	31 c0                	xor    %eax,%eax
    1068:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    106c:	48 ff c0             	inc    %rax
    106f:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    1075:	75 f1                	jne    1068 <ecall_set_secret+0x9>
    1077:	48 8b 05 82 bf 00 00 	mov    0xbf82(%rip),%rax        # d000 <secret_pt>
    107e:	40 88 38             	mov    %dil,(%rax)
    1081:	c3                   	retq   

0000000000001082 <ecall_get_secret_adrs>:
    1082:	48 8b 05 77 bf 00 00 	mov    0xbf77(%rip),%rax        # d000 <secret_pt>
    1089:	c3                   	retq   

000000000000108a <to_lower>:
    108a:	8d 57 bf             	lea    -0x41(%rdi),%edx
    108d:	40 88 f8             	mov    %dil,%al
    1090:	80 fa 19             	cmp    $0x19,%dl
    1093:	77 03                	ja     1098 <to_lower+0xe>
    1095:	8d 47 20             	lea    0x20(%rdi),%eax
    1098:	c3                   	retq   

0000000000001099 <ecall_to_lowercase>:
    1099:	55                   	push   %rbp
    109a:	53                   	push   %rbx
    109b:	48 83 cd ff          	or     $0xffffffffffffffff,%rbp
    109f:	31 c0                	xor    %eax,%eax
    10a1:	48 89 e9             	mov    %rbp,%rcx
    10a4:	48 89 fb             	mov    %rdi,%rbx
    10a7:	48 83 ec 08          	sub    $0x8,%rsp
    10ab:	f2 ae                	repnz scas %es:(%rdi),%al
    10ad:	48 89 df             	mov    %rbx,%rdi
    10b0:	48 89 c8             	mov    %rcx,%rax
    10b3:	48 f7 d0             	not    %rax
    10b6:	48 8d 34 28          	lea    (%rax,%rbp,1),%rsi
    10ba:	e8 91 02 00 00       	callq  1350 <sgx_is_outside_enclave>
    10bf:	85 c0                	test   %eax,%eax
    10c1:	74 2c                	je     10ef <ecall_to_lowercase+0x56>
    10c3:	31 f6                	xor    %esi,%esi
    10c5:	45 31 c0             	xor    %r8d,%r8d
    10c8:	48 89 e9             	mov    %rbp,%rcx
    10cb:	48 89 df             	mov    %rbx,%rdi
    10ce:	44 88 c0             	mov    %r8b,%al
    10d1:	f2 ae                	repnz scas %es:(%rdi),%al
    10d3:	48 f7 d1             	not    %rcx
    10d6:	48 ff c9             	dec    %rcx
    10d9:	48 39 f1             	cmp    %rsi,%rcx
    10dc:	76 11                	jbe    10ef <ecall_to_lowercase+0x56>
    10de:	0f be 3c 33          	movsbl (%rbx,%rsi,1),%edi
    10e2:	e8 a3 ff ff ff       	callq  108a <to_lower>
    10e7:	88 04 33             	mov    %al,(%rbx,%rsi,1)
    10ea:	48 ff c6             	inc    %rsi
    10ed:	eb d9                	jmp    10c8 <ecall_to_lowercase+0x2f>
    10ef:	58                   	pop    %rax
    10f0:	5b                   	pop    %rbx
    10f1:	5d                   	pop    %rbp
    10f2:	c3                   	retq   

00000000000010f3 <sgx_ecall_get_secret_adrs>:
    10f3:	48 85 ff             	test   %rdi,%rdi
    10f6:	74 28                	je     1120 <sgx_ecall_get_secret_adrs+0x2d>
    10f8:	53                   	push   %rbx
    10f9:	be 08 00 00 00       	mov    $0x8,%esi
    10fe:	48 89 fb             	mov    %rdi,%rbx
    1101:	e8 4a 02 00 00       	callq  1350 <sgx_is_outside_enclave>
    1106:	85 c0                	test   %eax,%eax
    1108:	75 07                	jne    1111 <sgx_ecall_get_secret_adrs+0x1e>
    110a:	b8 02 00 00 00       	mov    $0x2,%eax
    110f:	eb 0d                	jmp    111e <sgx_ecall_get_secret_adrs+0x2b>
    1111:	0f ae e8             	lfence 
    1114:	e8 69 ff ff ff       	callq  1082 <ecall_get_secret_adrs>
    1119:	48 89 03             	mov    %rax,(%rbx)
    111c:	31 c0                	xor    %eax,%eax
    111e:	5b                   	pop    %rbx
    111f:	c3                   	retq   
    1120:	b8 02 00 00 00       	mov    $0x2,%eax
    1125:	c3                   	retq   

0000000000001126 <sgx_ecall_set_secret>:
    1126:	48 85 ff             	test   %rdi,%rdi
    1129:	74 28                	je     1153 <sgx_ecall_set_secret+0x2d>
    112b:	53                   	push   %rbx
    112c:	be 01 00 00 00       	mov    $0x1,%esi
    1131:	48 89 fb             	mov    %rdi,%rbx
    1134:	e8 17 02 00 00       	callq  1350 <sgx_is_outside_enclave>
    1139:	85 c0                	test   %eax,%eax
    113b:	75 07                	jne    1144 <sgx_ecall_set_secret+0x1e>
    113d:	b8 02 00 00 00       	mov    $0x2,%eax
    1142:	eb 0d                	jmp    1151 <sgx_ecall_set_secret+0x2b>
    1144:	0f ae e8             	lfence 
    1147:	0f be 3b             	movsbl (%rbx),%edi
    114a:	e8 10 ff ff ff       	callq  105f <ecall_set_secret>
    114f:	31 c0                	xor    %eax,%eax
    1151:	5b                   	pop    %rbx
    1152:	c3                   	retq   
    1153:	b8 02 00 00 00       	mov    $0x2,%eax
    1158:	c3                   	retq   

0000000000001159 <sgx_ecall_to_lowercase>:
    1159:	48 85 ff             	test   %rdi,%rdi
    115c:	74 28                	je     1186 <sgx_ecall_to_lowercase+0x2d>
    115e:	53                   	push   %rbx
    115f:	be 08 00 00 00       	mov    $0x8,%esi
    1164:	48 89 fb             	mov    %rdi,%rbx
    1167:	e8 e4 01 00 00       	callq  1350 <sgx_is_outside_enclave>
    116c:	85 c0                	test   %eax,%eax
    116e:	75 07                	jne    1177 <sgx_ecall_to_lowercase+0x1e>
    1170:	b8 02 00 00 00       	mov    $0x2,%eax
    1175:	eb 0d                	jmp    1184 <sgx_ecall_to_lowercase+0x2b>
    1177:	0f ae e8             	lfence 
    117a:	48 8b 3b             	mov    (%rbx),%rdi
    117d:	e8 17 ff ff ff       	callq  1099 <ecall_to_lowercase>
    1182:	31 c0                	xor    %eax,%eax
    1184:	5b                   	pop    %rbx
    1185:	c3                   	retq   
    1186:	b8 02 00 00 00       	mov    $0x2,%eax
    118b:	c3                   	retq   
    118c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001190 <init_optimized_libs>:
    1190:	48 8d 05 09 bf 00 00 	lea    0xbf09(%rip),%rax        # d0a0 <g_enclave_state>
    1197:	83 38 01             	cmpl   $0x1,(%rax)
    119a:	0f 85 50 01 00 00    	jne    12f0 <init_optimized_libs+0x160>
    11a0:	55                   	push   %rbp
    11a1:	53                   	push   %rbx
    11a2:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
    11a9:	00 00 ff 
    11ac:	48 89 f5             	mov    %rsi,%rbp
    11af:	48 83 ec 08          	sub    $0x8,%rsp
    11b3:	48 85 c7             	test   %rax,%rdi
    11b6:	0f 85 d4 00 00 00    	jne    1290 <init_optimized_libs+0x100>
    11bc:	48 f7 c7 00 fe ff ff 	test   $0xfffffffffffffe00,%rdi
    11c3:	0f 84 ef 00 00 00    	je     12b8 <init_optimized_libs+0x128>
    11c9:	40 f6 c7 20          	test   $0x20,%dil
    11cd:	74 10                	je     11df <init_optimized_libs+0x4f>
    11cf:	48 89 f8             	mov    %rdi,%rax
    11d2:	83 e0 1f             	and    $0x1f,%eax
    11d5:	48 83 f8 1f          	cmp    $0x1f,%rax
    11d9:	0f 85 d9 00 00 00    	jne    12b8 <init_optimized_libs+0x128>
    11df:	40 f6 c7 40          	test   $0x40,%dil
    11e3:	74 10                	je     11f5 <init_optimized_libs+0x65>
    11e5:	48 89 f8             	mov    %rdi,%rax
    11e8:	83 e0 3f             	and    $0x3f,%eax
    11eb:	48 83 f8 3f          	cmp    $0x3f,%rax
    11ef:	0f 85 c3 00 00 00    	jne    12b8 <init_optimized_libs+0x128>
    11f5:	40 f6 c7 80          	test   $0x80,%dil
    11f9:	74 10                	je     120b <init_optimized_libs+0x7b>
    11fb:	48 89 f8             	mov    %rdi,%rax
    11fe:	83 e0 7f             	and    $0x7f,%eax
    1201:	48 83 f8 7f          	cmp    $0x7f,%rax
    1205:	0f 85 ad 00 00 00    	jne    12b8 <init_optimized_libs+0x128>
    120b:	f7 c7 00 01 00 00    	test   $0x100,%edi
    1211:	74 10                	je     1223 <init_optimized_libs+0x93>
    1213:	40 0f b6 c7          	movzbl %dil,%eax
    1217:	48 3d ff 00 00 00    	cmp    $0xff,%rax
    121d:	0f 85 95 00 00 00    	jne    12b8 <init_optimized_libs+0x128>
    1223:	f7 c7 00 02 00 00    	test   $0x200,%edi
    1229:	74 10                	je     123b <init_optimized_libs+0xab>
    122b:	48 89 f8             	mov    %rdi,%rax
    122e:	25 ff 01 00 00       	and    $0x1ff,%eax
    1233:	48 3d ff 01 00 00    	cmp    $0x1ff,%rax
    1239:	75 7d                	jne    12b8 <init_optimized_libs+0x128>
    123b:	f7 c7 00 04 00 00    	test   $0x400,%edi
    1241:	75 65                	jne    12a8 <init_optimized_libs+0x118>
    1243:	48 89 d0             	mov    %rdx,%rax
    1246:	83 e0 06             	and    $0x6,%eax
    1249:	48 83 f8 06          	cmp    $0x6,%rax
    124d:	74 79                	je     12c8 <init_optimized_libs+0x138>
    124f:	48 b8 ff 7f 12 86 08 	movabs $0xfffe200886127fff,%rax
    1256:	20 fe ff 
    1259:	48 21 c7             	and    %rax,%rdi
    125c:	48 8d 1d cd bb 00 00 	lea    0xbbcd(%rip),%rbx        # ce30 <g_cpu_feature_indicator>
    1263:	48 89 3b             	mov    %rdi,(%rbx)
    1266:	e8 a5 6b 00 00       	callq  7e10 <sgx_init_string_lib>
    126b:	85 c0                	test   %eax,%eax
    126d:	75 49                	jne    12b8 <init_optimized_libs+0x128>
    126f:	48 8b 3b             	mov    (%rbx),%rdi
    1272:	48 89 ee             	mov    %rbp,%rsi
    1275:	e8 a6 6d 00 00       	callq  8020 <sgx_init_crypto_lib>
    127a:	85 c0                	test   %eax,%eax
    127c:	0f 95 c0             	setne  %al
    127f:	48 83 c4 08          	add    $0x8,%rsp
    1283:	0f b6 c0             	movzbl %al,%eax
    1286:	f7 d8                	neg    %eax
    1288:	5b                   	pop    %rbx
    1289:	5d                   	pop    %rbp
    128a:	c3                   	retq   
    128b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1290:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffff,%rax
    1297:	ff ff 00 
    129a:	48 21 c7             	and    %rax,%rdi
    129d:	e9 1a ff ff ff       	jmpq   11bc <init_optimized_libs+0x2c>
    12a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12a8:	48 89 f8             	mov    %rdi,%rax
    12ab:	25 ff 03 00 00       	and    $0x3ff,%eax
    12b0:	48 3d ff 03 00 00    	cmp    $0x3ff,%rax
    12b6:	74 8b                	je     1243 <init_optimized_libs+0xb3>
    12b8:	48 83 c4 08          	add    $0x8,%rsp
    12bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12c1:	5b                   	pop    %rbx
    12c2:	5d                   	pop    %rbp
    12c3:	c3                   	retq   
    12c4:	0f 1f 40 00          	nopl   0x0(%rax)
    12c8:	81 e2 e0 00 00 00    	and    $0xe0,%edx
    12ce:	48 81 fa e0 00 00 00 	cmp    $0xe0,%rdx
    12d5:	74 85                	je     125c <init_optimized_libs+0xcc>
    12d7:	48 b8 ff ff ff b6 18 	movabs $0xfffee018b6ffffff,%rax
    12de:	e0 fe ff 
    12e1:	48 21 c7             	and    %rax,%rdi
    12e4:	e9 73 ff ff ff       	jmpq   125c <init_optimized_libs+0xcc>
    12e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12f5:	c3                   	retq   
    12f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    12fd:	00 00 00 

0000000000001300 <sgx_is_within_enclave>:
    1300:	48 8d 05 b9 7d 00 00 	lea    0x7db9(%rip),%rax        # 90c0 <g_global_data>
    1307:	48 8d 0d f2 ec ff ff 	lea    -0x130e(%rip),%rcx        # 0 <__ImageBase>
    130e:	48 85 f6             	test   %rsi,%rsi
    1311:	48 8b 40 08          	mov    0x8(%rax),%rax
    1315:	4c 8d 44 08 ff       	lea    -0x1(%rax,%rcx,1),%r8
    131a:	74 24                	je     1340 <sgx_is_within_enclave+0x40>
    131c:	48 83 ee 01          	sub    $0x1,%rsi
    1320:	48 01 fe             	add    %rdi,%rsi
    1323:	0f 93 c2             	setae  %dl
    1326:	48 39 cf             	cmp    %rcx,%rdi
    1329:	0f 93 c0             	setae  %al
    132c:	21 c2                	and    %eax,%edx
    132e:	31 c0                	xor    %eax,%eax
    1330:	4c 39 c6             	cmp    %r8,%rsi
    1333:	0f 96 c0             	setbe  %al
    1336:	21 d0                	and    %edx,%eax
    1338:	c3                   	retq   
    1339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1340:	48 89 fe             	mov    %rdi,%rsi
    1343:	ba 01 00 00 00       	mov    $0x1,%edx
    1348:	eb dc                	jmp    1326 <sgx_is_within_enclave+0x26>
    134a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001350 <sgx_is_outside_enclave>:
    1350:	48 8d 05 69 7d 00 00 	lea    0x7d69(%rip),%rax        # 90c0 <g_global_data>
    1357:	48 85 f6             	test   %rsi,%rsi
    135a:	48 8b 40 08          	mov    0x8(%rax),%rax
    135e:	74 10                	je     1370 <sgx_is_outside_enclave+0x20>
    1360:	48 83 ee 01          	sub    $0x1,%rsi
    1364:	48 01 fe             	add    %rdi,%rsi
    1367:	73 0a                	jae    1373 <sgx_is_outside_enclave+0x23>
    1369:	31 c0                	xor    %eax,%eax
    136b:	c3                   	retq   
    136c:	0f 1f 40 00          	nopl   0x0(%rax)
    1370:	48 89 fe             	mov    %rdi,%rsi
    1373:	48 8d 15 86 ec ff ff 	lea    -0x137a(%rip),%rdx        # 0 <__ImageBase>
    137a:	48 8d 44 10 ff       	lea    -0x1(%rax,%rdx,1),%rax
    137f:	48 39 c7             	cmp    %rax,%rdi
    1382:	0f 97 c0             	seta   %al
    1385:	48 39 f2             	cmp    %rsi,%rdx
    1388:	0f 97 c2             	seta   %dl
    138b:	09 d0                	or     %edx,%eax
    138d:	0f b6 c0             	movzbl %al,%eax
    1390:	c3                   	retq   
    1391:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1398:	00 00 00 
    139b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013a0 <sgx_ocalloc>:
    13a0:	53                   	push   %rbx
    13a1:	48 89 fb             	mov    %rdi,%rbx
    13a4:	48 83 ec 10          	sub    $0x10,%rsp
    13a8:	e8 c4 76 00 00       	callq  8a71 <get_thread_data>
    13ad:	4c 8d 05 0c 7d 00 00 	lea    0x7d0c(%rip),%r8        # 90c0 <g_global_data>
    13b4:	48 8b 70 20          	mov    0x20(%rax),%rsi
    13b8:	48 8d 3d 41 ec ff ff 	lea    -0x13bf(%rip),%rdi        # 0 <__ImageBase>
    13bf:	49 8b 40 08          	mov    0x8(%r8),%rax
    13c3:	48 8b 96 90 00 00 00 	mov    0x90(%rsi),%rdx
    13ca:	48 8d 4c 07 ff       	lea    -0x1(%rdi,%rax,1),%rcx
    13cf:	48 89 d0             	mov    %rdx,%rax
    13d2:	48 83 c0 07          	add    $0x7,%rax
    13d6:	0f 82 ad 00 00 00    	jb     1489 <sgx_ocalloc+0xe9>
    13dc:	48 39 c7             	cmp    %rax,%rdi
    13df:	77 09                	ja     13ea <sgx_ocalloc+0x4a>
    13e1:	48 39 ca             	cmp    %rcx,%rdx
    13e4:	0f 86 9f 00 00 00    	jbe    1489 <sgx_ocalloc+0xe9>
    13ea:	48 39 da             	cmp    %rbx,%rdx
    13ed:	0f 82 96 00 00 00    	jb     1489 <sgx_ocalloc+0xe9>
    13f3:	48 89 d1             	mov    %rdx,%rcx
    13f6:	4d 8b 40 08          	mov    0x8(%r8),%r8
    13fa:	48 29 d9             	sub    %rbx,%rcx
    13fd:	48 89 c8             	mov    %rcx,%rax
    1400:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
    1404:	48 85 db             	test   %rbx,%rbx
    1407:	4e 8d 44 07 ff       	lea    -0x1(%rdi,%r8,1),%r8
    140c:	75 72                	jne    1480 <sgx_ocalloc+0xe0>
    140e:	48 89 c3             	mov    %rax,%rbx
    1411:	48 39 df             	cmp    %rbx,%rdi
    1414:	77 05                	ja     141b <sgx_ocalloc+0x7b>
    1416:	4c 39 c0             	cmp    %r8,%rax
    1419:	76 6e                	jbe    1489 <sgx_ocalloc+0xe9>
    141b:	48 83 ea 01          	sub    $0x1,%rdx
    141f:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
    1426:	48 81 e1 00 f0 ff ff 	and    $0xfffffffffffff000,%rcx
    142d:	74 5a                	je     1489 <sgx_ocalloc+0xe9>
    142f:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    1434:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    1439:	48 39 d1             	cmp    %rdx,%rcx
    143c:	77 31                	ja     146f <sgx_ocalloc+0xcf>
    143e:	66 90                	xchg   %ax,%ax
    1440:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    1445:	48 89 96 90 00 00 00 	mov    %rdx,0x90(%rsi)
    144c:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    1451:	c6 02 00             	movb   $0x0,(%rdx)
    1454:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    1459:	48 81 ea 00 10 00 00 	sub    $0x1000,%rdx
    1460:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    1465:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    146a:	48 39 ca             	cmp    %rcx,%rdx
    146d:	73 d1                	jae    1440 <sgx_ocalloc+0xa0>
    146f:	48 89 86 90 00 00 00 	mov    %rax,0x90(%rsi)
    1476:	48 83 c4 10          	add    $0x10,%rsp
    147a:	5b                   	pop    %rbx
    147b:	c3                   	retq   
    147c:	0f 1f 40 00          	nopl   0x0(%rax)
    1480:	48 83 eb 01          	sub    $0x1,%rbx
    1484:	48 01 c3             	add    %rax,%rbx
    1487:	73 88                	jae    1411 <sgx_ocalloc+0x71>
    1489:	e8 12 79 00 00       	callq  8da0 <abort>
    148e:	66 90                	xchg   %ax,%ax

0000000000001490 <sgx_ocfree>:
    1490:	48 83 ec 08          	sub    $0x8,%rsp
    1494:	e8 d8 75 00 00       	callq  8a71 <get_thread_data>
    1499:	48 8d 0d 20 7c 00 00 	lea    0x7c20(%rip),%rcx        # 90c0 <g_global_data>
    14a0:	48 8b 70 20          	mov    0x20(%rax),%rsi
    14a4:	48 8b 40 08          	mov    0x8(%rax),%rax
    14a8:	48 8d 15 51 eb ff ff 	lea    -0x14af(%rip),%rdx        # 0 <__ImageBase>
    14af:	48 8b 49 08          	mov    0x8(%rcx),%rcx
    14b3:	48 8b 40 e8          	mov    -0x18(%rax),%rax
    14b7:	48 8d 7c 0a ff       	lea    -0x1(%rdx,%rcx,1),%rdi
    14bc:	48 89 c1             	mov    %rax,%rcx
    14bf:	48 83 c1 07          	add    $0x7,%rcx
    14c3:	72 16                	jb     14db <sgx_ocfree+0x4b>
    14c5:	48 39 ca             	cmp    %rcx,%rdx
    14c8:	77 05                	ja     14cf <sgx_ocfree+0x3f>
    14ca:	48 39 f8             	cmp    %rdi,%rax
    14cd:	76 0c                	jbe    14db <sgx_ocfree+0x4b>
    14cf:	48 89 86 90 00 00 00 	mov    %rax,0x90(%rsi)
    14d6:	48 83 c4 08          	add    $0x8,%rsp
    14da:	c3                   	retq   
    14db:	e8 c0 78 00 00       	callq  8da0 <abort>

00000000000014e0 <sgx_read_rand>:
    14e0:	41 56                	push   %r14
    14e2:	41 55                	push   %r13
    14e4:	41 54                	push   %r12
    14e6:	55                   	push   %rbp
    14e7:	53                   	push   %rbx
    14e8:	48 83 ec 10          	sub    $0x10,%rsp
    14ec:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    14f3:	00 00 
    14f5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    14fa:	31 c0                	xor    %eax,%eax
    14fc:	48 85 ff             	test   %rdi,%rdi
    14ff:	0f 84 cb 00 00 00    	je     15d0 <sgx_read_rand+0xf0>
    1505:	48 85 f6             	test   %rsi,%rsi
    1508:	48 89 f3             	mov    %rsi,%rbx
    150b:	0f 84 bf 00 00 00    	je     15d0 <sgx_read_rand+0xf0>
    1511:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
    1515:	49 89 fc             	mov    %rdi,%r12
    1518:	48 8d 35 a1 7b 00 00 	lea    0x7ba1(%rip),%rsi        # 90c0 <g_global_data>
    151f:	48 8d 0d da ea ff ff 	lea    -0x1526(%rip),%rcx        # 0 <__ImageBase>
    1526:	4c 01 e0             	add    %r12,%rax
    1529:	41 0f 92 c0          	setb   %r8b
    152d:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    1531:	48 89 c2             	mov    %rax,%rdx
    1534:	45 0f b6 c0          	movzbl %r8b,%r8d
    1538:	0f 82 da 00 00 00    	jb     1618 <sgx_read_rand+0x138>
    153e:	49 39 cc             	cmp    %rcx,%r12
    1541:	0f 82 d1 00 00 00    	jb     1618 <sgx_read_rand+0x138>
    1547:	48 8d 44 39 ff       	lea    -0x1(%rcx,%rdi,1),%rax
    154c:	48 39 d0             	cmp    %rdx,%rax
    154f:	0f 82 9b 00 00 00    	jb     15f0 <sgx_read_rand+0x110>
    1555:	4c 8d 6c 24 04       	lea    0x4(%rsp),%r13
    155a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    1561:	00 
    1562:	41 be 04 00 00 00    	mov    $0x4,%r14d
    1568:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    156f:	00 
    1570:	4c 89 ef             	mov    %r13,%rdi
    1573:	e8 09 78 00 00       	callq  8d81 <do_rdrand>
    1578:	85 c0                	test   %eax,%eax
    157a:	74 64                	je     15e0 <sgx_read_rand+0x100>
    157c:	48 83 fb 04          	cmp    $0x4,%rbx
    1580:	4c 89 f5             	mov    %r14,%rbp
    1583:	4c 89 e7             	mov    %r12,%rdi
    1586:	48 0f 46 eb          	cmovbe %rbx,%rbp
    158a:	4c 89 ee             	mov    %r13,%rsi
    158d:	48 89 ea             	mov    %rbp,%rdx
    1590:	49 01 ec             	add    %rbp,%r12
    1593:	e8 58 66 00 00       	callq  7bf0 <memcpy>
    1598:	48 29 eb             	sub    %rbp,%rbx
    159b:	75 d3                	jne    1570 <sgx_read_rand+0x90>
    159d:	b9 04 00 00 00       	mov    $0x4,%ecx
    15a2:	31 d2                	xor    %edx,%edx
    15a4:	be 04 00 00 00       	mov    $0x4,%esi
    15a9:	4c 89 ef             	mov    %r13,%rdi
    15ac:	e8 9f 66 00 00       	callq  7c50 <memset_s>
    15b1:	31 c0                	xor    %eax,%eax
    15b3:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    15b8:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    15bf:	00 00 
    15c1:	75 6a                	jne    162d <sgx_read_rand+0x14d>
    15c3:	48 83 c4 10          	add    $0x10,%rsp
    15c7:	5b                   	pop    %rbx
    15c8:	5d                   	pop    %rbp
    15c9:	41 5c                	pop    %r12
    15cb:	41 5d                	pop    %r13
    15cd:	41 5e                	pop    %r14
    15cf:	c3                   	retq   
    15d0:	b8 02 00 00 00       	mov    $0x2,%eax
    15d5:	eb dc                	jmp    15b3 <sgx_read_rand+0xd3>
    15d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    15de:	00 00 
    15e0:	b8 01 00 00 00       	mov    $0x1,%eax
    15e5:	eb cc                	jmp    15b3 <sgx_read_rand+0xd3>
    15e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    15ee:	00 00 
    15f0:	48 8b 46 08          	mov    0x8(%rsi),%rax
    15f4:	48 8d 74 01 ff       	lea    -0x1(%rcx,%rax,1),%rsi
    15f9:	48 39 d1             	cmp    %rdx,%rcx
    15fc:	0f 87 53 ff ff ff    	ja     1555 <sgx_read_rand+0x75>
    1602:	49 39 f4             	cmp    %rsi,%r12
    1605:	b8 02 00 00 00       	mov    $0x2,%eax
    160a:	0f 87 45 ff ff ff    	ja     1555 <sgx_read_rand+0x75>
    1610:	eb a1                	jmp    15b3 <sgx_read_rand+0xd3>
    1612:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1618:	4d 85 c0             	test   %r8,%r8
    161b:	48 8b 76 08          	mov    0x8(%rsi),%rsi
    161f:	b8 02 00 00 00       	mov    $0x2,%eax
    1624:	75 8d                	jne    15b3 <sgx_read_rand+0xd3>
    1626:	48 8d 74 31 ff       	lea    -0x1(%rcx,%rsi,1),%rsi
    162b:	eb cc                	jmp    15f9 <sgx_read_rand+0x119>
    162d:	e8 4e 2e 00 00       	callq  4480 <__stack_chk_fail>
    1632:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1639:	00 00 00 
    163c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001640 <check_static_stack_canary>:
    1640:	48 8d 05 d1 b7 00 00 	lea    0xb7d1(%rip),%rax        # ce18 <__intel_security_cookie>
    1647:	48 8b 00             	mov    (%rax),%rax
    164a:	48 39 87 58 fd fe ff 	cmp    %rax,-0x102a8(%rdi)
    1651:	0f 95 c0             	setne  %al
    1654:	0f b6 c0             	movzbl %al,%eax
    1657:	f7 d8                	neg    %eax
    1659:	c3                   	retq   
    165a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001660 <_ZL19sgx_accept_backwardmmm>:
    1660:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    1665:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
    1669:	41 ff 72 f8          	pushq  -0x8(%r10)
    166d:	55                   	push   %rbp
    166e:	48 89 e5             	mov    %rsp,%rbp
    1671:	41 55                	push   %r13
    1673:	41 54                	push   %r12
    1675:	41 52                	push   %r10
    1677:	53                   	push   %rbx
    1678:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
    167f:	48 89 bd 50 ff ff ff 	mov    %rdi,-0xb0(%rbp)
    1686:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
    168d:	00 00 00 00 
    1691:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1698:	00 00 
    169a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    169e:	31 c0                	xor    %eax,%eax
    16a0:	48 39 f2             	cmp    %rsi,%rdx
    16a3:	48 c7 85 60 ff ff ff 	movq   $0x0,-0xa0(%rbp)
    16aa:	00 00 00 00 
    16ae:	48 c7 85 68 ff ff ff 	movq   $0x0,-0x98(%rbp)
    16b5:	00 00 00 00 
    16b9:	48 c7 85 70 ff ff ff 	movq   $0x0,-0x90(%rbp)
    16c0:	00 00 00 00 
    16c4:	48 c7 85 78 ff ff ff 	movq   $0x0,-0x88(%rbp)
    16cb:	00 00 00 00 
    16cf:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
    16d6:	00 
    16d7:	48 c7 45 88 00 00 00 	movq   $0x0,-0x78(%rbp)
    16de:	00 
    16df:	76 2a                	jbe    170b <_ZL19sgx_accept_backwardmmm+0xab>
    16e1:	4c 8d ad 50 ff ff ff 	lea    -0xb0(%rbp),%r13
    16e8:	49 89 f4             	mov    %rsi,%r12
    16eb:	48 89 d3             	mov    %rdx,%rbx
    16ee:	66 90                	xchg   %ax,%ax
    16f0:	48 81 eb 00 10 00 00 	sub    $0x1000,%rbx
    16f7:	4c 89 ef             	mov    %r13,%rdi
    16fa:	48 89 de             	mov    %rbx,%rsi
    16fd:	e8 50 76 00 00       	callq  8d52 <do_eaccept>
    1702:	85 c0                	test   %eax,%eax
    1704:	75 2a                	jne    1730 <_ZL19sgx_accept_backwardmmm+0xd0>
    1706:	49 39 dc             	cmp    %rbx,%r12
    1709:	72 e5                	jb     16f0 <_ZL19sgx_accept_backwardmmm+0x90>
    170b:	31 c0                	xor    %eax,%eax
    170d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    1711:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    1718:	00 00 
    171a:	75 19                	jne    1735 <_ZL19sgx_accept_backwardmmm+0xd5>
    171c:	48 81 c4 90 00 00 00 	add    $0x90,%rsp
    1723:	5b                   	pop    %rbx
    1724:	41 5a                	pop    %r10
    1726:	41 5c                	pop    %r12
    1728:	41 5d                	pop    %r13
    172a:	5d                   	pop    %rbp
    172b:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    172f:	c3                   	retq   
    1730:	e8 6b 76 00 00       	callq  8da0 <abort>
    1735:	e8 46 2d 00 00       	callq  4480 <__stack_chk_fail>
    173a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001740 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0>:
    1740:	41 57                	push   %r15
    1742:	41 56                	push   %r14
    1744:	41 55                	push   %r13
    1746:	41 54                	push   %r12
    1748:	55                   	push   %rbp
    1749:	53                   	push   %rbx
    174a:	48 83 ec 08          	sub    $0x8,%rsp
    174e:	48 8d 2d 6b 79 00 00 	lea    0x796b(%rip),%rbp        # 90c0 <g_global_data>
    1755:	8b 85 30 01 00 00    	mov    0x130(%rbp),%eax
    175b:	85 c0                	test   %eax,%eax
    175d:	74 46                	je     17a5 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x65>
    175f:	0f b7 85 38 01 00 00 	movzwl 0x138(%rbp),%eax
    1766:	66 39 c2             	cmp    %ax,%dx
    1769:	0f 84 e1 00 00 00    	je     1850 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x110>
    176f:	41 89 d1             	mov    %edx,%r9d
    1772:	31 db                	xor    %ebx,%ebx
    1774:	eb 22                	jmp    1798 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x58>
    1776:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    177d:	00 00 00 
    1780:	89 d8                	mov    %ebx,%eax
    1782:	48 c1 e0 05          	shl    $0x5,%rax
    1786:	48 8d 54 05 00       	lea    0x0(%rbp,%rax,1),%rdx
    178b:	0f b7 92 38 01 00 00 	movzwl 0x138(%rdx),%edx
    1792:	66 44 39 ca          	cmp    %r9w,%dx
    1796:	74 28                	je     17c0 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x80>
    1798:	8b 85 30 01 00 00    	mov    0x130(%rbp),%eax
    179e:	83 c3 01             	add    $0x1,%ebx
    17a1:	39 d8                	cmp    %ebx,%eax
    17a3:	77 db                	ja     1780 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x40>
    17a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    17aa:	48 83 c4 08          	add    $0x8,%rsp
    17ae:	5b                   	pop    %rbx
    17af:	5d                   	pop    %rbp
    17b0:	41 5c                	pop    %r12
    17b2:	41 5d                	pop    %r13
    17b4:	41 5e                	pop    %r14
    17b6:	41 5f                	pop    %r15
    17b8:	c3                   	retq   
    17b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    17c0:	48 05 38 01 00 00    	add    $0x138,%rax
    17c6:	48 01 e8             	add    %rbp,%rax
    17c9:	74 da                	je     17a5 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x65>
    17cb:	4d 89 c6             	mov    %r8,%r14
    17ce:	49 89 cd             	mov    %rcx,%r13
    17d1:	49 89 ff             	mov    %rdi,%r15
    17d4:	49 89 f4             	mov    %rsi,%r12
    17d7:	e8 5a 72 00 00       	callq  8a36 <get_enclave_base>
    17dc:	49 89 d8             	mov    %rbx,%r8
    17df:	49 c1 e0 05          	shl    $0x5,%r8
    17e3:	49 01 e8             	add    %rbp,%r8
    17e6:	49 8b 90 40 01 00 00 	mov    0x140(%r8),%rdx
    17ed:	4c 01 ea             	add    %r13,%rdx
    17f0:	48 01 d0             	add    %rdx,%rax
    17f3:	41 8b 90 3c 01 00 00 	mov    0x13c(%r8),%edx
    17fa:	4c 39 f8             	cmp    %r15,%rax
    17fd:	77 a6                	ja     17a5 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x65>
    17ff:	4c 89 e6             	mov    %r12,%rsi
    1802:	48 c1 e2 0c          	shl    $0xc,%rdx
    1806:	48 c1 e6 0c          	shl    $0xc,%rsi
    180a:	48 01 c2             	add    %rax,%rdx
    180d:	4a 8d 3c 3e          	lea    (%rsi,%r15,1),%rdi
    1811:	48 39 d7             	cmp    %rdx,%rdi
    1814:	77 8f                	ja     17a5 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x65>
    1816:	31 c0                	xor    %eax,%eax
    1818:	4d 85 f6             	test   %r14,%r14
    181b:	74 8d                	je     17aa <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x6a>
    181d:	48 83 c3 0a          	add    $0xa,%rbx
    1821:	48 c1 e3 05          	shl    $0x5,%rbx
    1825:	48 01 dd             	add    %rbx,%rbp
    1828:	48 8b 55 10          	mov    0x10(%rbp),%rdx
    182c:	49 89 16             	mov    %rdx,(%r14)
    182f:	41 0f b7 90 3a 01 00 	movzwl 0x13a(%r8),%edx
    1836:	00 
    1837:	66 41 89 56 08       	mov    %dx,0x8(%r14)
    183c:	48 83 c4 08          	add    $0x8,%rsp
    1840:	5b                   	pop    %rbx
    1841:	5d                   	pop    %rbp
    1842:	41 5c                	pop    %r12
    1844:	41 5d                	pop    %r13
    1846:	41 5e                	pop    %r14
    1848:	41 5f                	pop    %r15
    184a:	c3                   	retq   
    184b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1850:	b8 38 01 00 00       	mov    $0x138,%eax
    1855:	31 db                	xor    %ebx,%ebx
    1857:	e9 6a ff ff ff       	jmpq   17c6 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0+0x86>
    185c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001860 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes>:
    1860:	41 57                	push   %r15
    1862:	49 89 f7             	mov    %rsi,%r15
    1865:	41 56                	push   %r14
    1867:	49 c1 e7 0c          	shl    $0xc,%r15
    186b:	41 55                	push   %r13
    186d:	41 54                	push   %r12
    186f:	4c 89 f8             	mov    %r15,%rax
    1872:	55                   	push   %rbp
    1873:	53                   	push   %rbx
    1874:	48 f7 d0             	not    %rax
    1877:	48 83 ec 28          	sub    $0x28,%rsp
    187b:	48 39 f8             	cmp    %rdi,%rax
    187e:	0f 82 35 01 00 00    	jb     19b9 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x159>
    1884:	48 89 fb             	mov    %rdi,%rbx
    1887:	48 89 cd             	mov    %rcx,%rbp
    188a:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    188f:	49 89 f4             	mov    %rsi,%r12
    1892:	e8 89 16 00 00       	callq  2f20 <get_heap_base>
    1897:	49 89 c5             	mov    %rax,%r13
    189a:	e8 01 17 00 00       	callq  2fa0 <get_heap_min_size>
    189f:	49 01 c5             	add    %rax,%r13
    18a2:	e8 99 16 00 00       	callq  2f40 <get_heap_size>
    18a7:	49 89 c6             	mov    %rax,%r14
    18aa:	e8 f1 16 00 00       	callq  2fa0 <get_heap_min_size>
    18af:	49 29 c6             	sub    %rax,%r14
    18b2:	4c 39 eb             	cmp    %r13,%rbx
    18b5:	72 39                	jb     18f0 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x90>
    18b7:	49 8d 04 1f          	lea    (%r15,%rbx,1),%rax
    18bb:	4b 8d 54 35 00       	lea    0x0(%r13,%r14,1),%rdx
    18c0:	48 39 d0             	cmp    %rdx,%rax
    18c3:	77 2b                	ja     18f0 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x90>
    18c5:	48 85 ed             	test   %rbp,%rbp
    18c8:	74 11                	je     18db <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x7b>
    18ca:	b8 08 00 00 00       	mov    $0x8,%eax
    18cf:	48 c7 45 00 03 02 00 	movq   $0x203,0x0(%rbp)
    18d6:	00 
    18d7:	66 89 45 08          	mov    %ax,0x8(%rbp)
    18db:	31 c0                	xor    %eax,%eax
    18dd:	48 83 c4 28          	add    $0x28,%rsp
    18e1:	5b                   	pop    %rbx
    18e2:	5d                   	pop    %rbp
    18e3:	41 5c                	pop    %r12
    18e5:	41 5d                	pop    %r13
    18e7:	41 5e                	pop    %r14
    18e9:	41 5f                	pop    %r15
    18eb:	c3                   	retq   
    18ec:	0f 1f 40 00          	nopl   0x0(%rax)
    18f0:	31 c9                	xor    %ecx,%ecx
    18f2:	49 89 e8             	mov    %rbp,%r8
    18f5:	ba 07 00 00 00       	mov    $0x7,%edx
    18fa:	4c 89 e6             	mov    %r12,%rsi
    18fd:	48 89 df             	mov    %rbx,%rdi
    1900:	e8 3b fe ff ff       	callq  1740 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0>
    1905:	85 c0                	test   %eax,%eax
    1907:	74 d2                	je     18db <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x7b>
    1909:	48 8d 05 48 b5 00 00 	lea    0xb548(%rip),%rax        # ce58 <rsrv_mem_min_size>
    1910:	48 8b 08             	mov    (%rax),%rcx
    1913:	48 8d 05 4e b5 00 00 	lea    0xb54e(%rip),%rax        # ce68 <rsrv_mem_base>
    191a:	48 8b 10             	mov    (%rax),%rdx
    191d:	48 01 ca             	add    %rcx,%rdx
    1920:	48 39 d3             	cmp    %rdx,%rbx
    1923:	72 18                	jb     193d <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0xdd>
    1925:	48 8d 05 34 b5 00 00 	lea    0xb534(%rip),%rax        # ce60 <rsrv_mem_size>
    192c:	49 01 df             	add    %rbx,%r15
    192f:	48 8b 00             	mov    (%rax),%rax
    1932:	48 29 c8             	sub    %rcx,%rax
    1935:	48 01 d0             	add    %rdx,%rax
    1938:	49 39 c7             	cmp    %rax,%r15
    193b:	76 88                	jbe    18c5 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x65>
    193d:	48 8d 15 7c 77 00 00 	lea    0x777c(%rip),%rdx        # 90c0 <g_global_data>
    1944:	8b 82 30 01 00 00    	mov    0x130(%rdx),%eax
    194a:	85 c0                	test   %eax,%eax
    194c:	74 40                	je     198e <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x12e>
    194e:	0f b7 82 38 01 00 00 	movzwl 0x138(%rdx),%eax
    1955:	66 3d 13 10          	cmp    $0x1013,%ax
    1959:	0f 84 3b 01 00 00    	je     1a9a <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x23a>
    195f:	31 c0                	xor    %eax,%eax
    1961:	eb 1e                	jmp    1981 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x121>
    1963:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1968:	41 89 c1             	mov    %eax,%r9d
    196b:	49 c1 e1 05          	shl    $0x5,%r9
    196f:	4a 8d 0c 0a          	lea    (%rdx,%r9,1),%rcx
    1973:	0f b7 89 38 01 00 00 	movzwl 0x138(%rcx),%ecx
    197a:	66 81 f9 13 10       	cmp    $0x1013,%cx
    197f:	74 47                	je     19c8 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x168>
    1981:	8b 8a 30 01 00 00    	mov    0x130(%rdx),%ecx
    1987:	83 c0 01             	add    $0x1,%eax
    198a:	39 c1                	cmp    %eax,%ecx
    198c:	77 da                	ja     1968 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x108>
    198e:	41 be 0e 00 00 00    	mov    $0xe,%r14d
    1994:	31 c9                	xor    %ecx,%ecx
    1996:	49 89 e8             	mov    %rbp,%r8
    1999:	44 89 f2             	mov    %r14d,%edx
    199c:	4c 89 e6             	mov    %r12,%rsi
    199f:	48 89 df             	mov    %rbx,%rdi
    19a2:	e8 99 fd ff ff       	callq  1740 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0>
    19a7:	85 c0                	test   %eax,%eax
    19a9:	0f 84 d1 00 00 00    	je     1a80 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x220>
    19af:	41 83 c6 01          	add    $0x1,%r14d
    19b3:	41 83 fe 13          	cmp    $0x13,%r14d
    19b7:	75 db                	jne    1994 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x134>
    19b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    19be:	e9 1a ff ff ff       	jmpq   18dd <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x7d>
    19c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    19c8:	49 81 c1 38 01 00 00 	add    $0x138,%r9
    19cf:	49 01 d1             	add    %rdx,%r9
    19d2:	74 ba                	je     198e <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x12e>
    19d4:	41 89 c1             	mov    %eax,%r9d
    19d7:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%rsp)
    19de:	00 
    19df:	49 c1 e1 05          	shl    $0x5,%r9
    19e3:	4e 8d 3c 0a          	lea    (%rdx,%r9,1),%r15
    19e7:	41 8b 87 3c 01 00 00 	mov    0x13c(%r15),%eax
    19ee:	83 f8 ff             	cmp    $0xffffffff,%eax
    19f1:	74 75                	je     1a68 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x208>
    19f3:	45 31 ed             	xor    %r13d,%r13d
    19f6:	eb 1b                	jmp    1a13 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x1b3>
    19f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    19ff:	00 
    1a00:	41 8b 87 3c 01 00 00 	mov    0x13c(%r15),%eax
    1a07:	41 83 c5 01          	add    $0x1,%r13d
    1a0b:	83 c0 01             	add    $0x1,%eax
    1a0e:	44 39 e8             	cmp    %r13d,%eax
    1a11:	76 55                	jbe    1a68 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x208>
    1a13:	49 8b 8f 40 01 00 00 	mov    0x140(%r15),%rcx
    1a1a:	45 89 ee             	mov    %r13d,%r14d
    1a1d:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    1a21:	49 8d 87 40 01 00 00 	lea    0x140(%r15),%rax
    1a28:	49 89 e8             	mov    %rbp,%r8
    1a2b:	4c 89 e6             	mov    %r12,%rsi
    1a2e:	48 89 df             	mov    %rbx,%rdi
    1a31:	49 0f af ce          	imul   %r14,%rcx
    1a35:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1a3a:	e8 01 fd ff ff       	callq  1740 <_ZL25check_dynamic_entry_rangePvmtmP24dynamic_flags_attributes.part.0>
    1a3f:	85 c0                	test   %eax,%eax
    1a41:	75 bd                	jne    1a00 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x1a0>
    1a43:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    1a48:	48 85 db             	test   %rbx,%rbx
    1a4b:	0f 84 8a fe ff ff    	je     18db <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x7b>
    1a51:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    1a56:	48 8b 16             	mov    (%rsi),%rdx
    1a59:	4c 0f af f2          	imul   %rdx,%r14
    1a5d:	4c 89 33             	mov    %r14,(%rbx)
    1a60:	e9 78 fe ff ff       	jmpq   18dd <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x7d>
    1a65:	0f 1f 00             	nopl   (%rax)
    1a68:	83 44 24 0c 01       	addl   $0x1,0xc(%rsp)
    1a6d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1a71:	83 f8 13             	cmp    $0x13,%eax
    1a74:	0f 85 6d ff ff ff    	jne    19e7 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x187>
    1a7a:	e9 3a ff ff ff       	jmpq   19b9 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x159>
    1a7f:	90                   	nop
    1a80:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    1a85:	48 85 db             	test   %rbx,%rbx
    1a88:	0f 84 4d fe ff ff    	je     18db <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x7b>
    1a8e:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    1a95:	e9 43 fe ff ff       	jmpq   18dd <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x7d>
    1a9a:	41 b9 38 01 00 00    	mov    $0x138,%r9d
    1aa0:	31 c0                	xor    %eax,%eax
    1aa2:	e9 28 ff ff ff       	jmpq   19cf <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes+0x16f>
    1aa7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1aae:	00 00 

0000000000001ab0 <_Z24get_dynamic_layout_by_idt>:
    1ab0:	48 8d 05 09 76 00 00 	lea    0x7609(%rip),%rax        # 90c0 <g_global_data>
    1ab7:	41 89 f8             	mov    %edi,%r8d
    1aba:	8b 90 30 01 00 00    	mov    0x130(%rax),%edx
    1ac0:	85 d2                	test   %edx,%edx
    1ac2:	74 38                	je     1afc <_Z24get_dynamic_layout_by_idt+0x4c>
    1ac4:	0f b7 90 38 01 00 00 	movzwl 0x138(%rax),%edx
    1acb:	66 39 d7             	cmp    %dx,%di
    1ace:	74 40                	je     1b10 <_Z24get_dynamic_layout_by_idt+0x60>
    1ad0:	31 d2                	xor    %edx,%edx
    1ad2:	eb 1b                	jmp    1aef <_Z24get_dynamic_layout_by_idt+0x3f>
    1ad4:	0f 1f 40 00          	nopl   0x0(%rax)
    1ad8:	89 d1                	mov    %edx,%ecx
    1ada:	48 c1 e1 05          	shl    $0x5,%rcx
    1ade:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
    1ae2:	0f b7 b6 38 01 00 00 	movzwl 0x138(%rsi),%esi
    1ae9:	66 44 39 c6          	cmp    %r8w,%si
    1aed:	74 11                	je     1b00 <_Z24get_dynamic_layout_by_idt+0x50>
    1aef:	8b 88 30 01 00 00    	mov    0x130(%rax),%ecx
    1af5:	83 c2 01             	add    $0x1,%edx
    1af8:	39 d1                	cmp    %edx,%ecx
    1afa:	77 dc                	ja     1ad8 <_Z24get_dynamic_layout_by_idt+0x28>
    1afc:	31 c0                	xor    %eax,%eax
    1afe:	c3                   	retq   
    1aff:	90                   	nop
    1b00:	48 81 c1 38 01 00 00 	add    $0x138,%rcx
    1b07:	48 01 c8             	add    %rcx,%rax
    1b0a:	c3                   	retq   
    1b0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1b10:	b9 38 01 00 00       	mov    $0x138,%ecx
    1b15:	eb f0                	jmp    1b07 <_Z24get_dynamic_layout_by_idt+0x57>
    1b17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1b1e:	00 00 

0000000000001b20 <is_dynamic_thread>:
    1b20:	48 83 ec 28          	sub    $0x28,%rsp
    1b24:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1b2b:	00 00 
    1b2d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1b32:	31 c0                	xor    %eax,%eax
    1b34:	48 85 ff             	test   %rdi,%rdi
    1b37:	74 27                	je     1b60 <is_dynamic_thread+0x40>
    1b39:	31 d2                	xor    %edx,%edx
    1b3b:	48 89 e1             	mov    %rsp,%rcx
    1b3e:	be 01 00 00 00       	mov    $0x1,%esi
    1b43:	e8 18 fd ff ff       	callq  1860 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes>
    1b48:	85 c0                	test   %eax,%eax
    1b4a:	75 14                	jne    1b60 <is_dynamic_thread+0x40>
    1b4c:	31 c0                	xor    %eax,%eax
    1b4e:	48 81 3c 24 00 01 00 	cmpq   $0x100,(%rsp)
    1b55:	00 
    1b56:	0f 94 c0             	sete   %al
    1b59:	eb 07                	jmp    1b62 <is_dynamic_thread+0x42>
    1b5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1b60:	31 c0                	xor    %eax,%eax
    1b62:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    1b67:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    1b6e:	00 00 
    1b70:	75 05                	jne    1b77 <is_dynamic_thread+0x57>
    1b72:	48 83 c4 28          	add    $0x28,%rsp
    1b76:	c3                   	retq   
    1b77:	e8 04 29 00 00       	callq  4480 <__stack_chk_fail>
    1b7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001b80 <is_dynamic_thread_exist>:
    1b80:	48 8d 05 a1 b2 00 00 	lea    0xb2a1(%rip),%rax        # ce28 <EDMM_supported>
    1b87:	8b 00                	mov    (%rax),%eax
    1b89:	85 c0                	test   %eax,%eax
    1b8b:	74 49                	je     1bd6 <is_dynamic_thread_exist+0x56>
    1b8d:	48 8d 0d 2c 75 00 00 	lea    0x752c(%rip),%rcx        # 90c0 <g_global_data>
    1b94:	8b 81 30 01 00 00    	mov    0x130(%rcx),%eax
    1b9a:	85 c0                	test   %eax,%eax
    1b9c:	74 36                	je     1bd4 <is_dynamic_thread_exist+0x54>
    1b9e:	0f b7 81 38 01 00 00 	movzwl 0x138(%rcx),%eax
    1ba5:	66 83 f8 12          	cmp    $0x12,%ax
    1ba9:	74 45                	je     1bf0 <is_dynamic_thread_exist+0x70>
    1bab:	31 c0                	xor    %eax,%eax
    1bad:	eb 18                	jmp    1bc7 <is_dynamic_thread_exist+0x47>
    1baf:	90                   	nop
    1bb0:	89 c2                	mov    %eax,%edx
    1bb2:	48 c1 e2 05          	shl    $0x5,%rdx
    1bb6:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
    1bba:	0f b7 b6 38 01 00 00 	movzwl 0x138(%rsi),%esi
    1bc1:	66 83 fe 12          	cmp    $0x12,%si
    1bc5:	74 19                	je     1be0 <is_dynamic_thread_exist+0x60>
    1bc7:	8b 91 30 01 00 00    	mov    0x130(%rcx),%edx
    1bcd:	83 c0 01             	add    $0x1,%eax
    1bd0:	39 c2                	cmp    %eax,%edx
    1bd2:	77 dc                	ja     1bb0 <is_dynamic_thread_exist+0x30>
    1bd4:	31 c0                	xor    %eax,%eax
    1bd6:	f3 c3                	repz retq 
    1bd8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1bdf:	00 
    1be0:	48 81 c2 38 01 00 00 	add    $0x138,%rdx
    1be7:	31 c0                	xor    %eax,%eax
    1be9:	48 01 d1             	add    %rdx,%rcx
    1bec:	0f 95 c0             	setne  %al
    1bef:	c3                   	retq   
    1bf0:	ba 38 01 00 00       	mov    $0x138,%edx
    1bf5:	eb f0                	jmp    1be7 <is_dynamic_thread_exist+0x67>
    1bf7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1bfe:	00 00 

0000000000001c00 <get_dynamic_stack_max_page>:
    1c00:	48 8d 0d b9 74 00 00 	lea    0x74b9(%rip),%rcx        # 90c0 <g_global_data>
    1c07:	8b 81 30 01 00 00    	mov    0x130(%rcx),%eax
    1c0d:	85 c0                	test   %eax,%eax
    1c0f:	74 3d                	je     1c4e <get_dynamic_stack_max_page+0x4e>
    1c11:	0f b7 81 38 01 00 00 	movzwl 0x138(%rcx),%eax
    1c18:	66 83 f8 07          	cmp    $0x7,%ax
    1c1c:	74 52                	je     1c70 <get_dynamic_stack_max_page+0x70>
    1c1e:	31 c0                	xor    %eax,%eax
    1c20:	eb 1d                	jmp    1c3f <get_dynamic_stack_max_page+0x3f>
    1c22:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1c28:	89 c2                	mov    %eax,%edx
    1c2a:	48 c1 e2 05          	shl    $0x5,%rdx
    1c2e:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
    1c32:	0f b7 b6 38 01 00 00 	movzwl 0x138(%rsi),%esi
    1c39:	66 83 fe 07          	cmp    $0x7,%si
    1c3d:	74 11                	je     1c50 <get_dynamic_stack_max_page+0x50>
    1c3f:	8b 91 30 01 00 00    	mov    0x130(%rcx),%edx
    1c45:	83 c0 01             	add    $0x1,%eax
    1c48:	39 c2                	cmp    %eax,%edx
    1c4a:	77 dc                	ja     1c28 <get_dynamic_stack_max_page+0x28>
    1c4c:	31 c0                	xor    %eax,%eax
    1c4e:	f3 c3                	repz retq 
    1c50:	48 81 c2 38 01 00 00 	add    $0x138,%rdx
    1c57:	48 01 ca             	add    %rcx,%rdx
    1c5a:	74 f0                	je     1c4c <get_dynamic_stack_max_page+0x4c>
    1c5c:	48 c1 e0 05          	shl    $0x5,%rax
    1c60:	48 01 c8             	add    %rcx,%rax
    1c63:	8b 80 3c 01 00 00    	mov    0x13c(%rax),%eax
    1c69:	c3                   	retq   
    1c6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1c70:	ba 38 01 00 00       	mov    $0x138,%edx
    1c75:	31 c0                	xor    %eax,%eax
    1c77:	eb de                	jmp    1c57 <get_dynamic_stack_max_page+0x57>
    1c79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001c80 <sgx_accept_forward>:
    1c80:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    1c85:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
    1c89:	41 ff 72 f8          	pushq  -0x8(%r10)
    1c8d:	55                   	push   %rbp
    1c8e:	48 89 e5             	mov    %rsp,%rbp
    1c91:	41 55                	push   %r13
    1c93:	41 54                	push   %r12
    1c95:	41 52                	push   %r10
    1c97:	53                   	push   %rbx
    1c98:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
    1c9f:	48 89 bd 50 ff ff ff 	mov    %rdi,-0xb0(%rbp)
    1ca6:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
    1cad:	00 00 00 00 
    1cb1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1cb8:	00 00 
    1cba:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1cbe:	31 c0                	xor    %eax,%eax
    1cc0:	48 39 d6             	cmp    %rdx,%rsi
    1cc3:	48 c7 85 60 ff ff ff 	movq   $0x0,-0xa0(%rbp)
    1cca:	00 00 00 00 
    1cce:	48 c7 85 68 ff ff ff 	movq   $0x0,-0x98(%rbp)
    1cd5:	00 00 00 00 
    1cd9:	48 c7 85 70 ff ff ff 	movq   $0x0,-0x90(%rbp)
    1ce0:	00 00 00 00 
    1ce4:	48 c7 85 78 ff ff ff 	movq   $0x0,-0x88(%rbp)
    1ceb:	00 00 00 00 
    1cef:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
    1cf6:	00 
    1cf7:	48 c7 45 88 00 00 00 	movq   $0x0,-0x78(%rbp)
    1cfe:	00 
    1cff:	73 2a                	jae    1d2b <sgx_accept_forward+0xab>
    1d01:	4c 8d ad 50 ff ff ff 	lea    -0xb0(%rbp),%r13
    1d08:	48 89 f3             	mov    %rsi,%rbx
    1d0b:	49 89 d4             	mov    %rdx,%r12
    1d0e:	66 90                	xchg   %ax,%ax
    1d10:	48 89 de             	mov    %rbx,%rsi
    1d13:	4c 89 ef             	mov    %r13,%rdi
    1d16:	e8 37 70 00 00       	callq  8d52 <do_eaccept>
    1d1b:	85 c0                	test   %eax,%eax
    1d1d:	75 31                	jne    1d50 <sgx_accept_forward+0xd0>
    1d1f:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
    1d26:	49 39 dc             	cmp    %rbx,%r12
    1d29:	77 e5                	ja     1d10 <sgx_accept_forward+0x90>
    1d2b:	31 c0                	xor    %eax,%eax
    1d2d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    1d31:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    1d38:	00 00 
    1d3a:	75 19                	jne    1d55 <sgx_accept_forward+0xd5>
    1d3c:	48 81 c4 90 00 00 00 	add    $0x90,%rsp
    1d43:	5b                   	pop    %rbx
    1d44:	41 5a                	pop    %r10
    1d46:	41 5c                	pop    %r12
    1d48:	41 5d                	pop    %r13
    1d4a:	5d                   	pop    %rbp
    1d4b:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    1d4f:	c3                   	retq   
    1d50:	e8 4b 70 00 00       	callq  8da0 <abort>
    1d55:	e8 26 27 00 00       	callq  4480 <__stack_chk_fail>
    1d5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001d60 <_Z18accept_post_removePVK9_layout_tS1_m>:
    1d60:	48 39 f7             	cmp    %rsi,%rdi
    1d63:	0f 83 d7 00 00 00    	jae    1e40 <_Z18accept_post_removePVK9_layout_tS1_m+0xe0>
    1d69:	41 56                	push   %r14
    1d6b:	41 55                	push   %r13
    1d6d:	41 54                	push   %r12
    1d6f:	49 89 d4             	mov    %rdx,%r12
    1d72:	55                   	push   %rbp
    1d73:	48 89 f5             	mov    %rsi,%rbp
    1d76:	53                   	push   %rbx
    1d77:	48 89 fb             	mov    %rdi,%rbx
    1d7a:	eb 19                	jmp    1d95 <_Z18accept_post_removePVK9_layout_tS1_m+0x35>
    1d7c:	0f 1f 40 00          	nopl   0x0(%rax)
    1d80:	0f b7 03             	movzwl (%rbx),%eax
    1d83:	f6 c4 10             	test   $0x10,%ah
    1d86:	75 58                	jne    1de0 <_Z18accept_post_removePVK9_layout_tS1_m+0x80>
    1d88:	48 83 c3 20          	add    $0x20,%rbx
    1d8c:	48 39 dd             	cmp    %rbx,%rbp
    1d8f:	0f 86 97 00 00 00    	jbe    1e2c <_Z18accept_post_removePVK9_layout_tS1_m+0xcc>
    1d95:	0f b7 03             	movzwl (%rbx),%eax
    1d98:	f6 c4 10             	test   $0x10,%ah
    1d9b:	75 e3                	jne    1d80 <_Z18accept_post_removePVK9_layout_tS1_m+0x20>
    1d9d:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
    1da1:	a8 10                	test   $0x10,%al
    1da3:	74 db                	je     1d80 <_Z18accept_post_removePVK9_layout_tS1_m+0x20>
    1da5:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    1da9:	4e 8d 2c 26          	lea    (%rsi,%r12,1),%r13
    1dad:	e8 84 6c 00 00       	callq  8a36 <get_enclave_base>
    1db2:	8b 53 04             	mov    0x4(%rbx),%edx
    1db5:	4a 8d 34 28          	lea    (%rax,%r13,1),%rsi
    1db9:	bf 10 04 00 00       	mov    $0x410,%edi
    1dbe:	48 c1 e2 0c          	shl    $0xc,%rdx
    1dc2:	48 01 f2             	add    %rsi,%rdx
    1dc5:	e8 b6 fe ff ff       	callq  1c80 <sgx_accept_forward>
    1dca:	85 c0                	test   %eax,%eax
    1dcc:	74 ba                	je     1d88 <_Z18accept_post_removePVK9_layout_tS1_m+0x28>
    1dce:	5b                   	pop    %rbx
    1dcf:	5d                   	pop    %rbp
    1dd0:	41 5c                	pop    %r12
    1dd2:	41 5d                	pop    %r13
    1dd4:	41 5e                	pop    %r14
    1dd6:	c3                   	retq   
    1dd7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1dde:	00 00 
    1de0:	8b 43 04             	mov    0x4(%rbx),%eax
    1de3:	85 c0                	test   %eax,%eax
    1de5:	74 a1                	je     1d88 <_Z18accept_post_removePVK9_layout_tS1_m+0x28>
    1de7:	45 31 f6             	xor    %r14d,%r14d
    1dea:	45 31 ed             	xor    %r13d,%r13d
    1ded:	48 8b 43 08          	mov    0x8(%rbx),%rax
    1df1:	0f b7 7b 02          	movzwl 0x2(%rbx),%edi
    1df5:	48 89 de             	mov    %rbx,%rsi
    1df8:	49 01 c5             	add    %rax,%r13
    1dfb:	f7 df                	neg    %edi
    1dfd:	4c 89 ea             	mov    %r13,%rdx
    1e00:	48 63 ff             	movslq %edi,%rdi
    1e03:	48 c1 e7 05          	shl    $0x5,%rdi
    1e07:	48 01 df             	add    %rbx,%rdi
    1e0a:	e8 51 ff ff ff       	callq  1d60 <_Z18accept_post_removePVK9_layout_tS1_m>
    1e0f:	85 c0                	test   %eax,%eax
    1e11:	75 bb                	jne    1dce <_Z18accept_post_removePVK9_layout_tS1_m+0x6e>
    1e13:	8b 43 04             	mov    0x4(%rbx),%eax
    1e16:	41 83 c6 01          	add    $0x1,%r14d
    1e1a:	44 39 f0             	cmp    %r14d,%eax
    1e1d:	77 ce                	ja     1ded <_Z18accept_post_removePVK9_layout_tS1_m+0x8d>
    1e1f:	48 83 c3 20          	add    $0x20,%rbx
    1e23:	48 39 dd             	cmp    %rbx,%rbp
    1e26:	0f 87 69 ff ff ff    	ja     1d95 <_Z18accept_post_removePVK9_layout_tS1_m+0x35>
    1e2c:	5b                   	pop    %rbx
    1e2d:	31 c0                	xor    %eax,%eax
    1e2f:	5d                   	pop    %rbp
    1e30:	41 5c                	pop    %r12
    1e32:	41 5d                	pop    %r13
    1e34:	41 5e                	pop    %r14
    1e36:	c3                   	retq   
    1e37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1e3e:	00 00 
    1e40:	31 c0                	xor    %eax,%eax
    1e42:	c3                   	retq   
    1e43:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1e4a:	00 00 00 
    1e4d:	0f 1f 00             	nopl   (%rax)

0000000000001e50 <apply_pages_within_exception>:
    1e50:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    1e55:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
    1e59:	41 ff 72 f8          	pushq  -0x8(%r10)
    1e5d:	55                   	push   %rbp
    1e5e:	48 89 e5             	mov    %rsp,%rbp
    1e61:	41 56                	push   %r14
    1e63:	41 55                	push   %r13
    1e65:	41 54                	push   %r12
    1e67:	41 52                	push   %r10
    1e69:	53                   	push   %rbx
    1e6a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
    1e71:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1e78:	00 00 
    1e7a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1e7e:	31 c0                	xor    %eax,%eax
    1e80:	48 85 ff             	test   %rdi,%rdi
    1e83:	0f 84 ca 00 00 00    	je     1f53 <apply_pages_within_exception+0x103>
    1e89:	31 c9                	xor    %ecx,%ecx
    1e8b:	31 d2                	xor    %edx,%edx
    1e8d:	48 89 fb             	mov    %rdi,%rbx
    1e90:	49 89 f4             	mov    %rsi,%r12
    1e93:	e8 c8 f9 ff ff       	callq  1860 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes>
    1e98:	85 c0                	test   %eax,%eax
    1e9a:	41 89 c5             	mov    %eax,%r13d
    1e9d:	0f 85 b0 00 00 00    	jne    1f53 <apply_pages_within_exception+0x103>
    1ea3:	49 c1 e4 0c          	shl    $0xc,%r12
    1ea7:	48 c7 85 50 ff ff ff 	movq   $0x20b,-0xb0(%rbp)
    1eae:	0b 02 00 00 
    1eb2:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
    1eb9:	00 00 00 00 
    1ebd:	49 01 dc             	add    %rbx,%r12
    1ec0:	48 c7 85 60 ff ff ff 	movq   $0x0,-0xa0(%rbp)
    1ec7:	00 00 00 00 
    1ecb:	48 c7 85 68 ff ff ff 	movq   $0x0,-0x98(%rbp)
    1ed2:	00 00 00 00 
    1ed6:	4c 39 e3             	cmp    %r12,%rbx
    1ed9:	48 c7 85 70 ff ff ff 	movq   $0x0,-0x90(%rbp)
    1ee0:	00 00 00 00 
    1ee4:	48 c7 85 78 ff ff ff 	movq   $0x0,-0x88(%rbp)
    1eeb:	00 00 00 00 
    1eef:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
    1ef6:	00 
    1ef7:	48 c7 45 88 00 00 00 	movq   $0x0,-0x78(%rbp)
    1efe:	00 
    1eff:	73 2a                	jae    1f2b <apply_pages_within_exception+0xdb>
    1f01:	4c 8d b5 50 ff ff ff 	lea    -0xb0(%rbp),%r14
    1f08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1f0f:	00 
    1f10:	48 89 de             	mov    %rbx,%rsi
    1f13:	4c 89 f7             	mov    %r14,%rdi
    1f16:	e8 37 6e 00 00       	callq  8d52 <do_eaccept>
    1f1b:	85 c0                	test   %eax,%eax
    1f1d:	75 3c                	jne    1f5b <apply_pages_within_exception+0x10b>
    1f1f:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
    1f26:	49 39 dc             	cmp    %rbx,%r12
    1f29:	77 e5                	ja     1f10 <apply_pages_within_exception+0xc0>
    1f2b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    1f2f:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    1f36:	00 00 
    1f38:	44 89 e8             	mov    %r13d,%eax
    1f3b:	75 23                	jne    1f60 <apply_pages_within_exception+0x110>
    1f3d:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
    1f44:	5b                   	pop    %rbx
    1f45:	41 5a                	pop    %r10
    1f47:	41 5c                	pop    %r12
    1f49:	41 5d                	pop    %r13
    1f4b:	41 5e                	pop    %r14
    1f4d:	5d                   	pop    %rbp
    1f4e:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    1f52:	c3                   	retq   
    1f53:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
    1f59:	eb d0                	jmp    1f2b <apply_pages_within_exception+0xdb>
    1f5b:	e8 40 6e 00 00       	callq  8da0 <abort>
    1f60:	e8 1b 25 00 00       	callq  4480 <__stack_chk_fail>
    1f65:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1f6c:	00 00 00 
    1f6f:	90                   	nop

0000000000001f70 <apply_EPC_pages>:
    1f70:	55                   	push   %rbp
    1f71:	53                   	push   %rbx
    1f72:	48 83 ec 28          	sub    $0x28,%rsp
    1f76:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1f7d:	00 00 
    1f7f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1f84:	31 c0                	xor    %eax,%eax
    1f86:	48 85 ff             	test   %rdi,%rdi
    1f89:	74 55                	je     1fe0 <apply_EPC_pages+0x70>
    1f8b:	31 d2                	xor    %edx,%edx
    1f8d:	48 89 e1             	mov    %rsp,%rcx
    1f90:	48 89 fd             	mov    %rdi,%rbp
    1f93:	48 89 f3             	mov    %rsi,%rbx
    1f96:	e8 c5 f8 ff ff       	callq  1860 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes>
    1f9b:	85 c0                	test   %eax,%eax
    1f9d:	75 41                	jne    1fe0 <apply_EPC_pages+0x70>
    1f9f:	48 c1 e3 0c          	shl    $0xc,%rbx
    1fa3:	f6 44 24 08 40       	testb  $0x40,0x8(%rsp)
    1fa8:	48 89 ee             	mov    %rbp,%rsi
    1fab:	48 8d 14 2b          	lea    (%rbx,%rbp,1),%rdx
    1faf:	bf 0b 02 00 00       	mov    $0x20b,%edi
    1fb4:	75 22                	jne    1fd8 <apply_EPC_pages+0x68>
    1fb6:	e8 a5 f6 ff ff       	callq  1660 <_ZL19sgx_accept_backwardmmm>
    1fbb:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    1fc0:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    1fc7:	00 00 
    1fc9:	75 1c                	jne    1fe7 <apply_EPC_pages+0x77>
    1fcb:	48 83 c4 28          	add    $0x28,%rsp
    1fcf:	5b                   	pop    %rbx
    1fd0:	5d                   	pop    %rbp
    1fd1:	c3                   	retq   
    1fd2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1fd8:	e8 a3 fc ff ff       	callq  1c80 <sgx_accept_forward>
    1fdd:	eb dc                	jmp    1fbb <apply_EPC_pages+0x4b>
    1fdf:	90                   	nop
    1fe0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fe5:	eb d4                	jmp    1fbb <apply_EPC_pages+0x4b>
    1fe7:	e8 94 24 00 00       	callq  4480 <__stack_chk_fail>
    1fec:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001ff0 <trim_EPC_pages>:
    1ff0:	48 85 ff             	test   %rdi,%rdi
    1ff3:	74 65                	je     205a <trim_EPC_pages+0x6a>
    1ff5:	55                   	push   %rbp
    1ff6:	53                   	push   %rbx
    1ff7:	31 c9                	xor    %ecx,%ecx
    1ff9:	31 d2                	xor    %edx,%edx
    1ffb:	48 89 f5             	mov    %rsi,%rbp
    1ffe:	48 89 fb             	mov    %rdi,%rbx
    2001:	48 83 ec 08          	sub    $0x8,%rsp
    2005:	e8 56 f8 ff ff       	callq  1860 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes>
    200a:	85 c0                	test   %eax,%eax
    200c:	75 45                	jne    2053 <trim_EPC_pages+0x63>
    200e:	48 c1 e5 0c          	shl    $0xc,%rbp
    2012:	48 89 df             	mov    %rbx,%rdi
    2015:	48 01 dd             	add    %rbx,%rbp
    2018:	48 89 ee             	mov    %rbp,%rsi
    201b:	e8 30 0e 00 00       	callq  2e50 <trim_range_ocall>
    2020:	48 89 ea             	mov    %rbp,%rdx
    2023:	48 89 de             	mov    %rbx,%rsi
    2026:	bf 10 04 00 00       	mov    $0x410,%edi
    202b:	e8 50 fc ff ff       	callq  1c80 <sgx_accept_forward>
    2030:	48 39 eb             	cmp    %rbp,%rbx
    2033:	73 17                	jae    204c <trim_EPC_pages+0x5c>
    2035:	0f 1f 00             	nopl   (%rax)
    2038:	48 89 df             	mov    %rbx,%rdi
    203b:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
    2042:	e8 69 0e 00 00       	callq  2eb0 <trim_range_commit_ocall>
    2047:	48 39 dd             	cmp    %rbx,%rbp
    204a:	77 ec                	ja     2038 <trim_EPC_pages+0x48>
    204c:	48 83 c4 08          	add    $0x8,%rsp
    2050:	5b                   	pop    %rbx
    2051:	5d                   	pop    %rbp
    2052:	c3                   	retq   
    2053:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2058:	eb f2                	jmp    204c <trim_EPC_pages+0x5c>
    205a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    205f:	c3                   	retq   

0000000000002060 <do_add_thread>:
    2060:	41 56                	push   %r14
    2062:	41 55                	push   %r13
    2064:	41 54                	push   %r12
    2066:	55                   	push   %rbp
    2067:	53                   	push   %rbx
    2068:	48 89 fb             	mov    %rdi,%rbx
    206b:	48 83 ec 10          	sub    $0x10,%rsp
    206f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2076:	00 00 
    2078:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    207d:	31 c0                	xor    %eax,%eax
    207f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2086:	00 
    2087:	e8 aa 69 00 00       	callq  8a36 <get_enclave_base>
    208c:	31 c9                	xor    %ecx,%ecx
    208e:	48 89 e2             	mov    %rsp,%rdx
    2091:	be 01 00 00 00       	mov    $0x1,%esi
    2096:	48 89 df             	mov    %rbx,%rdi
    2099:	48 89 c5             	mov    %rax,%rbp
    209c:	e8 bf f7 ff ff       	callq  1860 <_ZL19check_dynamic_rangePvmPmP24dynamic_flags_attributes>
    20a1:	85 c0                	test   %eax,%eax
    20a3:	75 51                	jne    20f6 <do_add_thread+0x96>
    20a5:	4c 8d 25 14 70 00 00 	lea    0x7014(%rip),%r12        # 90c0 <g_global_data>
    20ac:	41 8b 84 24 30 01 00 	mov    0x130(%r12),%eax
    20b3:	00 
    20b4:	85 c0                	test   %eax,%eax
    20b6:	74 3e                	je     20f6 <do_add_thread+0x96>
    20b8:	41 0f b7 84 24 38 01 	movzwl 0x138(%r12),%eax
    20bf:	00 00 
    20c1:	66 83 f8 0e          	cmp    $0xe,%ax
    20c5:	0f 84 ae 01 00 00    	je     2279 <do_add_thread+0x219>
    20cb:	31 c0                	xor    %eax,%eax
    20cd:	eb 18                	jmp    20e7 <do_add_thread+0x87>
    20cf:	90                   	nop
    20d0:	89 c2                	mov    %eax,%edx
    20d2:	48 c1 e2 05          	shl    $0x5,%rdx
    20d6:	49 8d 0c 14          	lea    (%r12,%rdx,1),%rcx
    20da:	0f b7 89 38 01 00 00 	movzwl 0x138(%rcx),%ecx
    20e1:	66 83 f9 0e          	cmp    $0xe,%cx
    20e5:	74 39                	je     2120 <do_add_thread+0xc0>
    20e7:	41 8b 94 24 30 01 00 	mov    0x130(%r12),%edx
    20ee:	00 
    20ef:	83 c0 01             	add    $0x1,%eax
    20f2:	39 c2                	cmp    %eax,%edx
    20f4:	77 da                	ja     20d0 <do_add_thread+0x70>
    20f6:	b8 01 00 00 00       	mov    $0x1,%eax
    20fb:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    2100:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    2107:	00 00 
    2109:	0f 85 76 01 00 00    	jne    2285 <do_add_thread+0x225>
    210f:	48 83 c4 10          	add    $0x10,%rsp
    2113:	5b                   	pop    %rbx
    2114:	5d                   	pop    %rbp
    2115:	41 5c                	pop    %r12
    2117:	41 5d                	pop    %r13
    2119:	41 5e                	pop    %r14
    211b:	c3                   	retq   
    211c:	0f 1f 40 00          	nopl   0x0(%rax)
    2120:	48 81 c2 38 01 00 00 	add    $0x138,%rdx
    2127:	4c 01 e2             	add    %r12,%rdx
    212a:	74 ca                	je     20f6 <do_add_thread+0x96>
    212c:	48 c1 e0 05          	shl    $0x5,%rax
    2130:	4c 8b 2c 24          	mov    (%rsp),%r13
    2134:	4c 01 e0             	add    %r12,%rax
    2137:	48 8b 80 40 01 00 00 	mov    0x140(%rax),%rax
    213e:	49 01 ed             	add    %rbp,%r13
    2141:	49 01 c5             	add    %rax,%r13
    2144:	4c 39 eb             	cmp    %r13,%rbx
    2147:	75 ad                	jne    20f6 <do_add_thread+0x96>
    2149:	41 be 0e 00 00 00    	mov    $0xe,%r14d
    214f:	90                   	nop
    2150:	41 8b 84 24 30 01 00 	mov    0x130(%r12),%eax
    2157:	00 
    2158:	85 c0                	test   %eax,%eax
    215a:	74 46                	je     21a2 <do_add_thread+0x142>
    215c:	41 0f b7 84 24 38 01 	movzwl 0x138(%r12),%eax
    2163:	00 00 
    2165:	66 44 39 f0          	cmp    %r14w,%ax
    2169:	0f 84 01 01 00 00    	je     2270 <do_add_thread+0x210>
    216f:	31 c0                	xor    %eax,%eax
    2171:	eb 20                	jmp    2193 <do_add_thread+0x133>
    2173:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2178:	89 c2                	mov    %eax,%edx
    217a:	48 c1 e2 05          	shl    $0x5,%rdx
    217e:	49 8d 0c 14          	lea    (%r12,%rdx,1),%rcx
    2182:	0f b7 89 38 01 00 00 	movzwl 0x138(%rcx),%ecx
    2189:	66 44 39 f1          	cmp    %r14w,%cx
    218d:	0f 84 85 00 00 00    	je     2218 <do_add_thread+0x1b8>
    2193:	41 8b 94 24 30 01 00 	mov    0x130(%r12),%edx
    219a:	00 
    219b:	83 c0 01             	add    $0x1,%eax
    219e:	39 c2                	cmp    %eax,%edx
    21a0:	77 d6                	ja     2178 <do_add_thread+0x118>
    21a2:	41 83 c6 01          	add    $0x1,%r14d
    21a6:	66 41 83 fe 13       	cmp    $0x13,%r14w
    21ab:	75 a3                	jne    2150 <do_add_thread+0xf0>
    21ad:	49 8d b4 24 e8 00 00 	lea    0xe8(%r12),%rsi
    21b4:	00 
    21b5:	ba 48 00 00 00       	mov    $0x48,%edx
    21ba:	48 89 df             	mov    %rbx,%rdi
    21bd:	e8 2e 5a 00 00       	callq  7bf0 <memcpy>
    21c2:	4c 89 e8             	mov    %r13,%rax
    21c5:	31 ff                	xor    %edi,%edi
    21c7:	48 89 de             	mov    %rbx,%rsi
    21ca:	48 29 e8             	sub    %rbp,%rax
    21cd:	48 01 43 10          	add    %rax,0x10(%rbx)
    21d1:	4c 89 e8             	mov    %r13,%rax
    21d4:	48 29 e8             	sub    %rbp,%rax
    21d7:	48 01 43 30          	add    %rax,0x30(%rbx)
    21db:	4c 89 e8             	mov    %r13,%rax
    21de:	48 29 e8             	sub    %rbp,%rax
    21e1:	48 01 43 38          	add    %rax,0x38(%rbx)
    21e5:	e8 56 0b 00 00       	callq  2d40 <sgx_ocall>
    21ea:	85 c0                	test   %eax,%eax
    21ec:	0f 85 04 ff ff ff    	jne    20f6 <do_add_thread+0x96>
    21f2:	49 8d 95 00 10 00 00 	lea    0x1000(%r13),%rdx
    21f9:	4c 89 ee             	mov    %r13,%rsi
    21fc:	bf 10 01 00 00       	mov    $0x110,%edi
    2201:	e8 5a f4 ff ff       	callq  1660 <_ZL19sgx_accept_backwardmmm>
    2206:	85 c0                	test   %eax,%eax
    2208:	0f 95 c0             	setne  %al
    220b:	0f b6 c0             	movzbl %al,%eax
    220e:	e9 e8 fe ff ff       	jmpq   20fb <do_add_thread+0x9b>
    2213:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2218:	48 81 c2 38 01 00 00 	add    $0x138,%rdx
    221f:	4c 01 e2             	add    %r12,%rdx
    2222:	0f 84 7a ff ff ff    	je     21a2 <do_add_thread+0x142>
    2228:	48 c1 e0 05          	shl    $0x5,%rax
    222c:	4c 01 e0             	add    %r12,%rax
    222f:	0f b7 90 3a 01 00 00 	movzwl 0x13a(%rax),%edx
    2236:	83 e2 20             	and    $0x20,%edx
    2239:	0f 84 63 ff ff ff    	je     21a2 <do_add_thread+0x142>
    223f:	48 8b 3c 24          	mov    (%rsp),%rdi
    2243:	8b b0 3c 01 00 00    	mov    0x13c(%rax),%esi
    2249:	48 8b 80 40 01 00 00 	mov    0x140(%rax),%rax
    2250:	48 01 ef             	add    %rbp,%rdi
    2253:	48 01 c7             	add    %rax,%rdi
    2256:	e8 15 fd ff ff       	callq  1f70 <apply_EPC_pages>
    225b:	85 c0                	test   %eax,%eax
    225d:	0f 84 3f ff ff ff    	je     21a2 <do_add_thread+0x142>
    2263:	e9 8e fe ff ff       	jmpq   20f6 <do_add_thread+0x96>
    2268:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    226f:	00 
    2270:	ba 38 01 00 00       	mov    $0x138,%edx
    2275:	31 c0                	xor    %eax,%eax
    2277:	eb a6                	jmp    221f <do_add_thread+0x1bf>
    2279:	ba 38 01 00 00       	mov    $0x138,%edx
    227e:	31 c0                	xor    %eax,%eax
    2280:	e9 a2 fe ff ff       	jmpq   2127 <do_add_thread+0xc7>
    2285:	e8 f6 21 00 00       	callq  4480 <__stack_chk_fail>
    228a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002290 <_pthread_thread_run>:
    2290:	31 c0                	xor    %eax,%eax
    2292:	c3                   	retq   
    2293:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    229a:	00 00 00 
    229d:	0f 1f 00             	nopl   (%rax)

00000000000022a0 <_ZL11do_save_tcsPv>:
    22a0:	55                   	push   %rbp
    22a1:	53                   	push   %rbx
    22a2:	48 89 fb             	mov    %rdi,%rbx
    22a5:	48 83 ec 18          	sub    $0x18,%rsp
    22a9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    22b0:	00 00 
    22b2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    22b7:	31 c0                	xor    %eax,%eax
    22b9:	48 83 3d 47 bd 00 00 	cmpq   $0x0,0xbd47(%rip)        # e008 <_ZL12g_tcs_cookie>
    22c0:	00 
    22c1:	74 4d                	je     2310 <_ZL11do_save_tcsPv+0x70>
    22c3:	bf 10 00 00 00       	mov    $0x10,%edi
    22c8:	e8 33 2a 00 00       	callq  4d00 <dlmalloc>
    22cd:	48 89 c2             	mov    %rax,%rdx
    22d0:	b8 01 00 00 00       	mov    $0x1,%eax
    22d5:	48 85 d2             	test   %rdx,%rdx
    22d8:	74 1e                	je     22f8 <_ZL11do_save_tcsPv+0x58>
    22da:	48 33 1d 27 bd 00 00 	xor    0xbd27(%rip),%rbx        # e008 <_ZL12g_tcs_cookie>
    22e1:	48 8b 05 28 bd 00 00 	mov    0xbd28(%rip),%rax        # e010 <_ZL10g_tcs_node>
    22e8:	48 89 15 21 bd 00 00 	mov    %rdx,0xbd21(%rip)        # e010 <_ZL10g_tcs_node>
    22ef:	48 89 42 08          	mov    %rax,0x8(%rdx)
    22f3:	31 c0                	xor    %eax,%eax
    22f5:	48 89 1a             	mov    %rbx,(%rdx)
    22f8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    22fd:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2304:	00 00 
    2306:	75 5a                	jne    2362 <_ZL11do_save_tcsPv+0xc2>
    2308:	48 83 c4 18          	add    $0x18,%rsp
    230c:	5b                   	pop    %rbx
    230d:	5d                   	pop    %rbp
    230e:	c3                   	retq   
    230f:	90                   	nop
    2310:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2317:	00 
    2318:	48 89 e5             	mov    %rsp,%rbp
    231b:	eb 0c                	jmp    2329 <_ZL11do_save_tcsPv+0x89>
    231d:	0f 1f 00             	nopl   (%rax)
    2320:	48 8b 04 24          	mov    (%rsp),%rax
    2324:	48 85 c0             	test   %rax,%rax
    2327:	75 1f                	jne    2348 <_ZL11do_save_tcsPv+0xa8>
    2329:	be 08 00 00 00       	mov    $0x8,%esi
    232e:	48 89 ef             	mov    %rbp,%rdi
    2331:	e8 aa f1 ff ff       	callq  14e0 <sgx_read_rand>
    2336:	85 c0                	test   %eax,%eax
    2338:	74 e6                	je     2320 <_ZL11do_save_tcsPv+0x80>
    233a:	b8 01 00 00 00       	mov    $0x1,%eax
    233f:	eb b7                	jmp    22f8 <_ZL11do_save_tcsPv+0x58>
    2341:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2348:	48 83 3d b8 bc 00 00 	cmpq   $0x0,0xbcb8(%rip)        # e008 <_ZL12g_tcs_cookie>
    234f:	00 
    2350:	0f 85 6d ff ff ff    	jne    22c3 <_ZL11do_save_tcsPv+0x23>
    2356:	48 89 05 ab bc 00 00 	mov    %rax,0xbcab(%rip)        # e008 <_ZL12g_tcs_cookie>
    235d:	e9 61 ff ff ff       	jmpq   22c3 <_ZL11do_save_tcsPv+0x23>
    2362:	e8 19 21 00 00       	callq  4480 <__stack_chk_fail>
    2367:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    236e:	00 00 

0000000000002370 <_ZL18add_static_threadsPVK9_layout_tS1_m>:
    2370:	48 39 f7             	cmp    %rsi,%rdi
    2373:	0f 83 cf 00 00 00    	jae    2448 <_ZL18add_static_threadsPVK9_layout_tS1_m+0xd8>
    2379:	41 56                	push   %r14
    237b:	41 55                	push   %r13
    237d:	41 54                	push   %r12
    237f:	49 89 d4             	mov    %rdx,%r12
    2382:	55                   	push   %rbp
    2383:	48 89 f5             	mov    %rsi,%rbp
    2386:	53                   	push   %rbx
    2387:	48 89 fb             	mov    %rdi,%rbx
    238a:	eb 11                	jmp    239d <_ZL18add_static_threadsPVK9_layout_tS1_m+0x2d>
    238c:	0f 1f 40 00          	nopl   0x0(%rax)
    2390:	48 83 c3 20          	add    $0x20,%rbx
    2394:	48 39 dd             	cmp    %rbx,%rbp
    2397:	0f 86 9b 00 00 00    	jbe    2438 <_ZL18add_static_threadsPVK9_layout_tS1_m+0xc8>
    239d:	0f b7 03             	movzwl (%rbx),%eax
    23a0:	f6 c4 10             	test   $0x10,%ah
    23a3:	75 13                	jne    23b8 <_ZL18add_static_threadsPVK9_layout_tS1_m+0x48>
    23a5:	48 8b 43 18          	mov    0x18(%rbx),%rax
    23a9:	f6 c4 01             	test   $0x1,%ah
    23ac:	74 0a                	je     23b8 <_ZL18add_static_threadsPVK9_layout_tS1_m+0x48>
    23ae:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
    23b2:	66 83 f8 03          	cmp    $0x3,%ax
    23b6:	74 50                	je     2408 <_ZL18add_static_threadsPVK9_layout_tS1_m+0x98>
    23b8:	0f b7 03             	movzwl (%rbx),%eax
    23bb:	f6 c4 10             	test   $0x10,%ah
    23be:	74 d0                	je     2390 <_ZL18add_static_threadsPVK9_layout_tS1_m+0x20>
    23c0:	8b 43 04             	mov    0x4(%rbx),%eax
    23c3:	85 c0                	test   %eax,%eax
    23c5:	74 c9                	je     2390 <_ZL18add_static_threadsPVK9_layout_tS1_m+0x20>
    23c7:	45 31 f6             	xor    %r14d,%r14d
    23ca:	45 31 ed             	xor    %r13d,%r13d
    23cd:	48 8b 43 08          	mov    0x8(%rbx),%rax
    23d1:	0f b7 7b 02          	movzwl 0x2(%rbx),%edi
    23d5:	48 89 de             	mov    %rbx,%rsi
    23d8:	49 01 c5             	add    %rax,%r13
    23db:	f7 df                	neg    %edi
    23dd:	4c 89 ea             	mov    %r13,%rdx
    23e0:	48 63 ff             	movslq %edi,%rdi
    23e3:	48 c1 e7 05          	shl    $0x5,%rdi
    23e7:	48 01 df             	add    %rbx,%rdi
    23ea:	e8 81 ff ff ff       	callq  2370 <_ZL18add_static_threadsPVK9_layout_tS1_m>
    23ef:	85 c0                	test   %eax,%eax
    23f1:	75 38                	jne    242b <_ZL18add_static_threadsPVK9_layout_tS1_m+0xbb>
    23f3:	8b 43 04             	mov    0x4(%rbx),%eax
    23f6:	41 83 c6 01          	add    $0x1,%r14d
    23fa:	44 39 f0             	cmp    %r14d,%eax
    23fd:	77 ce                	ja     23cd <_ZL18add_static_threadsPVK9_layout_tS1_m+0x5d>
    23ff:	eb 8f                	jmp    2390 <_ZL18add_static_threadsPVK9_layout_tS1_m+0x20>
    2401:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2408:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    240c:	4e 8d 2c 27          	lea    (%rdi,%r12,1),%r13
    2410:	e8 21 66 00 00       	callq  8a36 <get_enclave_base>
    2415:	4a 8d 3c 28          	lea    (%rax,%r13,1),%rdi
    2419:	e8 82 fe ff ff       	callq  22a0 <_ZL11do_save_tcsPv>
    241e:	85 c0                	test   %eax,%eax
    2420:	0f 84 6a ff ff ff    	je     2390 <_ZL18add_static_threadsPVK9_layout_tS1_m+0x20>
    2426:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    242b:	5b                   	pop    %rbx
    242c:	5d                   	pop    %rbp
    242d:	41 5c                	pop    %r12
    242f:	41 5d                	pop    %r13
    2431:	41 5e                	pop    %r14
    2433:	c3                   	retq   
    2434:	0f 1f 40 00          	nopl   0x0(%rax)
    2438:	5b                   	pop    %rbx
    2439:	31 c0                	xor    %eax,%eax
    243b:	5d                   	pop    %rbp
    243c:	41 5c                	pop    %r12
    243e:	41 5d                	pop    %r13
    2440:	41 5e                	pop    %r14
    2442:	c3                   	retq   
    2443:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2448:	31 c0                	xor    %eax,%eax
    244a:	c3                   	retq   
    244b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002450 <_ZL10trts_ecalljPv>:
    2450:	0f b6 05 b1 ab 00 00 	movzbl 0xabb1(%rip),%eax        # d008 <_ZL16g_is_first_ecall>
    2457:	41 54                	push   %r12
    2459:	55                   	push   %rbp
    245a:	48 89 f5             	mov    %rsi,%rbp
    245d:	53                   	push   %rbx
    245e:	89 fb                	mov    %edi,%ebx
    2460:	84 c0                	test   %al,%al
    2462:	0f 85 c8 00 00 00    	jne    2530 <_ZL10trts_ecalljPv+0xe0>
    2468:	83 fb fa             	cmp    $0xfffffffa,%ebx
    246b:	74 73                	je     24e0 <_ZL10trts_ecalljPv+0x90>
    246d:	4c 8d 25 6c a9 00 00 	lea    0xa96c(%rip),%r12        # cde0 <g_ecall_table>
    2474:	49 3b 1c 24          	cmp    (%r12),%rbx
    2478:	73 7e                	jae    24f8 <_ZL10trts_ecalljPv+0xa8>
    247a:	e8 f2 65 00 00       	callq  8a71 <get_thread_data>
    247f:	0f ae e8             	lfence 
    2482:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2486:	48 3b 50 10          	cmp    0x10(%rax),%rdx
    248a:	0f 84 80 00 00 00    	je     2510 <_ZL10trts_ecalljPv+0xc0>
    2490:	48 81 7a 20 44 49 43 	cmpq   $0x4f434944,0x20(%rdx)
    2497:	4f 
    2498:	0f 85 3e 01 00 00    	jne    25dc <_ZL10trts_ecalljPv+0x18c>
    249e:	48 8d 05 5b 6b 00 00 	lea    0x6b5b(%rip),%rax        # 9000 <g_dyn_entry_table>
    24a5:	48 8b 52 28          	mov    0x28(%rdx),%rdx
    24a9:	48 3b 10             	cmp    (%rax),%rdx
    24ac:	73 4a                	jae    24f8 <_ZL10trts_ecalljPv+0xa8>
    24ae:	49 0f af 14 24       	imul   (%r12),%rdx
    24b3:	48 01 d8             	add    %rbx,%rax
    24b6:	80 7c 02 08 00       	cmpb   $0x0,0x8(%rdx,%rax,1)
    24bb:	74 62                	je     251f <_ZL10trts_ecalljPv+0xcf>
    24bd:	48 c1 e3 04          	shl    $0x4,%rbx
    24c1:	31 f6                	xor    %esi,%esi
    24c3:	49 8b 5c 1c 08       	mov    0x8(%r12,%rbx,1),%rbx
    24c8:	48 89 df             	mov    %rbx,%rdi
    24cb:	e8 30 ee ff ff       	callq  1300 <sgx_is_within_enclave>
    24d0:	85 c0                	test   %eax,%eax
    24d2:	0f 84 e8 00 00 00    	je     25c0 <_ZL10trts_ecalljPv+0x170>
    24d8:	48 89 d8             	mov    %rbx,%rax
    24db:	eb 0a                	jmp    24e7 <_ZL10trts_ecalljPv+0x97>
    24dd:	0f 1f 00             	nopl   (%rax)
    24e0:	48 8d 05 a9 fd ff ff 	lea    -0x257(%rip),%rax        # 2290 <_pthread_thread_run>
    24e7:	0f ae e8             	lfence 
    24ea:	48 89 ef             	mov    %rbp,%rdi
    24ed:	5b                   	pop    %rbx
    24ee:	5d                   	pop    %rbp
    24ef:	41 5c                	pop    %r12
    24f1:	ff e0                	jmpq   *%rax
    24f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    24f8:	41 bc 01 10 00 00    	mov    $0x1001,%r12d
    24fe:	44 89 e0             	mov    %r12d,%eax
    2501:	5b                   	pop    %rbx
    2502:	5d                   	pop    %rbp
    2503:	41 5c                	pop    %r12
    2505:	c3                   	retq   
    2506:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    250d:	00 00 00 
    2510:	48 89 d8             	mov    %rbx,%rax
    2513:	48 c1 e0 04          	shl    $0x4,%rax
    2517:	41 80 7c 04 10 00    	cmpb   $0x0,0x10(%r12,%rax,1)
    251d:	74 9e                	je     24bd <_ZL10trts_ecalljPv+0x6d>
    251f:	41 bc 07 10 00 00    	mov    $0x1007,%r12d
    2525:	44 89 e0             	mov    %r12d,%eax
    2528:	5b                   	pop    %rbx
    2529:	5d                   	pop    %rbp
    252a:	41 5c                	pop    %r12
    252c:	c3                   	retq   
    252d:	0f 1f 00             	nopl   (%rax)
    2530:	e8 3c 65 00 00       	callq  8a71 <get_thread_data>
    2535:	48 8b 48 10          	mov    0x10(%rax),%rcx
    2539:	48 39 48 08          	cmp    %rcx,0x8(%rax)
    253d:	75 e0                	jne    251f <_ZL10trts_ecalljPv+0xcf>
    253f:	48 8d 3d be ba 00 00 	lea    0xbabe(%rip),%rdi        # e004 <_ZL10g_ife_lock>
    2546:	e8 d5 58 00 00       	callq  7e20 <sgx_spin_lock>
    254b:	0f b6 05 b6 aa 00 00 	movzbl 0xaab6(%rip),%eax        # d008 <_ZL16g_is_first_ecall>
    2552:	84 c0                	test   %al,%al
    2554:	74 52                	je     25a8 <_ZL10trts_ecalljPv+0x158>
    2556:	48 8d 05 cb a8 00 00 	lea    0xa8cb(%rip),%rax        # ce28 <EDMM_supported>
    255d:	8b 00                	mov    (%rax),%eax
    255f:	85 c0                	test   %eax,%eax
    2561:	74 39                	je     259c <_ZL10trts_ecalljPv+0x14c>
    2563:	48 8d 05 56 6b 00 00 	lea    0x6b56(%rip),%rax        # 90c0 <g_global_data>
    256a:	31 d2                	xor    %edx,%edx
    256c:	8b b0 30 01 00 00    	mov    0x130(%rax),%esi
    2572:	48 8d b8 38 01 00 00 	lea    0x138(%rax),%rdi
    2579:	48 c1 e6 05          	shl    $0x5,%rsi
    257d:	48 01 fe             	add    %rdi,%rsi
    2580:	e8 eb fd ff ff       	callq  2370 <_ZL18add_static_threadsPVK9_layout_tS1_m>
    2585:	85 c0                	test   %eax,%eax
    2587:	75 37                	jne    25c0 <_ZL10trts_ecalljPv+0x170>
    2589:	48 8d 3d 70 da ff ff 	lea    -0x2590(%rip),%rdi        # 0 <__ImageBase>
    2590:	e8 8b 19 00 00       	callq  3f20 <change_protection>
    2595:	85 c0                	test   %eax,%eax
    2597:	41 89 c4             	mov    %eax,%r12d
    259a:	75 2f                	jne    25cb <_ZL10trts_ecalljPv+0x17b>
    259c:	e8 2f 1d 00 00       	callq  42d0 <init_global_object>
    25a1:	c6 05 60 aa 00 00 00 	movb   $0x0,0xaa60(%rip)        # d008 <_ZL16g_is_first_ecall>
    25a8:	48 8d 3d 55 ba 00 00 	lea    0xba55(%rip),%rdi        # e004 <_ZL10g_ife_lock>
    25af:	e8 cc 58 00 00       	callq  7e80 <sgx_spin_unlock>
    25b4:	e9 af fe ff ff       	jmpq   2468 <_ZL10trts_ecalljPv+0x18>
    25b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    25c0:	41 bc 01 00 00 00    	mov    $0x1,%r12d
    25c6:	e9 33 ff ff ff       	jmpq   24fe <_ZL10trts_ecalljPv+0xae>
    25cb:	48 8d 3d 32 ba 00 00 	lea    0xba32(%rip),%rdi        # e004 <_ZL10g_ife_lock>
    25d2:	e8 a9 58 00 00       	callq  7e80 <sgx_spin_unlock>
    25d7:	e9 22 ff ff ff       	jmpq   24fe <_ZL10trts_ecalljPv+0xae>
    25dc:	e8 bf 67 00 00       	callq  8da0 <abort>
    25e1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    25e8:	00 00 00 
    25eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000025f0 <_Z30_random_stack_noinline_wrapperI9_status_tJjPvEJRiRS1_EET_PFS4_DpT0_EDpOT1_.isra.0.constprop.3>:
    25f0:	e9 5b fe ff ff       	jmpq   2450 <_ZL10trts_ecalljPv>
    25f5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    25fc:	00 00 00 
    25ff:	90                   	nop

0000000000002600 <_Z16_pthread_enabledv>:
    2600:	31 c0                	xor    %eax,%eax
    2602:	c3                   	retq   
    2603:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    260a:	00 00 00 
    260d:	0f 1f 00             	nopl   (%rax)

0000000000002610 <_Z24_pthread_tls_store_state9_status_t>:
    2610:	f3 c3                	repz retq 
    2612:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2619:	00 00 00 
    261c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002620 <_Z22_pthread_tls_get_statev>:
    2620:	31 c0                	xor    %eax,%eax
    2622:	c3                   	retq   
    2623:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    262a:	00 00 00 
    262d:	0f 1f 00             	nopl   (%rax)

0000000000002630 <_Z26_pthread_tls_store_contextPv>:
    2630:	f3 c3                	repz retq 
    2632:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2639:	00 00 00 
    263c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002640 <_Z20_pthread_wakeup_joinPv>:
    2640:	f3 c3                	repz retq 
    2642:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2649:	00 00 00 
    264c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002650 <_Z24_pthread_tls_destructorsv>:
    2650:	f3 c3                	repz retq 
    2652:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2659:	00 00 00 
    265c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002660 <do_init_thread>:
    2660:	41 57                	push   %r15
    2662:	41 56                	push   %r14
    2664:	ba a0 00 00 00       	mov    $0xa0,%edx
    2669:	41 55                	push   %r13
    266b:	41 54                	push   %r12
    266d:	41 89 f4             	mov    %esi,%r12d
    2670:	55                   	push   %rbp
    2671:	53                   	push   %rbx
    2672:	48 89 fd             	mov    %rdi,%rbp
    2675:	48 83 ec 28          	sub    $0x28,%rsp
    2679:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2680:	00 00 
    2682:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    2687:	31 c0                	xor    %eax,%eax
    2689:	48 8d 05 30 6a 00 00 	lea    0x6a30(%rip),%rax        # 90c0 <g_global_data>
    2690:	48 8b 58 48          	mov    0x48(%rax),%rbx
    2694:	48 8d 70 48          	lea    0x48(%rax),%rsi
    2698:	48 01 fb             	add    %rdi,%rbx
    269b:	48 89 df             	mov    %rbx,%rdi
    269e:	4c 8b 7b 28          	mov    0x28(%rbx),%r15
    26a2:	4c 8b 73 30          	mov    0x30(%rbx),%r14
    26a6:	4c 8b ab 98 00 00 00 	mov    0x98(%rbx),%r13
    26ad:	e8 3e 55 00 00       	callq  7bf0 <memcpy>
    26b2:	48 8b 53 18          	mov    0x18(%rbx),%rdx
    26b6:	48 8d 85 50 fd ff ff 	lea    -0x2b0(%rbp),%rax
    26bd:	48 01 2b             	add    %rbp,(%rbx)
    26c0:	48 01 6b 20          	add    %rbp,0x20(%rbx)
    26c4:	4c 89 7b 28          	mov    %r15,0x28(%rbx)
    26c8:	48 01 6b 58          	add    %rbp,0x58(%rbx)
    26cc:	4c 89 73 30          	mov    %r14,0x30(%rbx)
    26d0:	48 01 ea             	add    %rbp,%rdx
    26d3:	48 01 6b 50          	add    %rbp,0x50(%rbx)
    26d7:	48 89 53 18          	mov    %rdx,0x18(%rbx)
    26db:	48 89 93 98 00 00 00 	mov    %rdx,0x98(%rbx)
    26e2:	48 8b 53 08          	mov    0x8(%rbx),%rdx
    26e6:	48 01 c2             	add    %rax,%rdx
    26e9:	48 03 43 10          	add    0x10(%rbx),%rax
    26ed:	48 89 53 08          	mov    %rdx,0x8(%rbx)
    26f1:	48 89 43 10          	mov    %rax,0x10(%rbx)
    26f5:	48 8d 05 1c a7 00 00 	lea    0xa71c(%rip),%rax        # ce18 <__intel_security_cookie>
    26fc:	48 8b 00             	mov    (%rax),%rax
    26ff:	48 89 85 58 fd fe ff 	mov    %rax,-0x102a8(%rbp)
    2706:	48 8d 05 1b a7 00 00 	lea    0xa71b(%rip),%rax        # ce28 <EDMM_supported>
    270d:	8b 00                	mov    (%rax),%eax
    270f:	85 c0                	test   %eax,%eax
    2711:	0f 84 89 00 00 00    	je     27a0 <do_init_thread+0x140>
    2717:	45 84 e4             	test   %r12b,%r12b
    271a:	0f 84 90 00 00 00    	je     27b0 <do_init_thread+0x150>
    2720:	4d 85 ed             	test   %r13,%r13
    2723:	48 c7 43 30 01 00 00 	movq   $0x1,0x30(%rbx)
    272a:	00 
    272b:	75 78                	jne    27a5 <do_init_thread+0x145>
    272d:	e8 ce f4 ff ff       	callq  1c00 <get_dynamic_stack_max_page>
    2732:	89 c0                	mov    %eax,%eax
    2734:	48 c1 e0 0c          	shl    $0xc,%rax
    2738:	48 01 83 98 00 00 00 	add    %rax,0x98(%rbx)
    273f:	90                   	nop
    2740:	48 8d 3d b9 d8 ff ff 	lea    -0x2747(%rip),%rdi        # 0 <__ImageBase>
    2747:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    274c:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    2751:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    2758:	00 00 
    275a:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
    2761:	00 00 
    2763:	e8 58 15 00 00       	callq  3cc0 <elf_tls_info>
    2768:	85 c0                	test   %eax,%eax
    276a:	ba 01 00 00 00       	mov    $0x1,%edx
    276f:	75 0a                	jne    277b <do_init_thread+0x11b>
    2771:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
    2777:	75 57                	jne    27d0 <do_init_thread+0x170>
    2779:	31 d2                	xor    %edx,%edx
    277b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    2780:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2787:	00 00 
    2789:	89 d0                	mov    %edx,%eax
    278b:	0f 85 8c 00 00 00    	jne    281d <do_init_thread+0x1bd>
    2791:	48 83 c4 28          	add    $0x28,%rsp
    2795:	5b                   	pop    %rbx
    2796:	5d                   	pop    %rbp
    2797:	41 5c                	pop    %r12
    2799:	41 5d                	pop    %r13
    279b:	41 5e                	pop    %r14
    279d:	41 5f                	pop    %r15
    279f:	c3                   	retq   
    27a0:	4d 85 ed             	test   %r13,%r13
    27a3:	74 9b                	je     2740 <do_init_thread+0xe0>
    27a5:	4c 89 ab 98 00 00 00 	mov    %r13,0x98(%rbx)
    27ac:	eb 92                	jmp    2740 <do_init_thread+0xe0>
    27ae:	66 90                	xchg   %ax,%ax
    27b0:	4d 85 ed             	test   %r13,%r13
    27b3:	75 f0                	jne    27a5 <do_init_thread+0x145>
    27b5:	48 89 ef             	mov    %rbp,%rdi
    27b8:	e8 63 f3 ff ff       	callq  1b20 <is_dynamic_thread>
    27bd:	85 c0                	test   %eax,%eax
    27bf:	0f 85 68 ff ff ff    	jne    272d <do_init_thread+0xcd>
    27c5:	e9 76 ff ff ff       	jmpq   2740 <do_init_thread+0xe0>
    27ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    27d0:	48 8b 03             	mov    (%rbx),%rax
    27d3:	48 8b 7b 50          	mov    0x50(%rbx),%rdi
    27d7:	31 f6                	xor    %esi,%esi
    27d9:	48 8d 90 ff 0f 00 00 	lea    0xfff(%rax),%rdx
    27e0:	48 29 fa             	sub    %rdi,%rdx
    27e3:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
    27ea:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
    27f1:	e8 47 54 00 00       	callq  7c3d <memset>
    27f6:	48 8b 7b 50          	mov    0x50(%rbx),%rdi
    27fa:	48 8b 03             	mov    (%rbx),%rax
    27fd:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    2802:	48 29 f8             	sub    %rdi,%rax
    2805:	48 39 c2             	cmp    %rax,%rdx
    2808:	0f 87 6b ff ff ff    	ja     2779 <do_init_thread+0x119>
    280e:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    2813:	e8 d8 53 00 00       	callq  7bf0 <memcpy>
    2818:	e9 5c ff ff ff       	jmpq   2779 <do_init_thread+0x119>
    281d:	e8 5e 1c 00 00       	callq  4480 <__stack_chk_fail>
    2822:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2829:	00 00 00 
    282c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002830 <do_ecall>:
    2830:	55                   	push   %rbp
    2831:	53                   	push   %rbx
    2832:	48 89 d5             	mov    %rdx,%rbp
    2835:	bb 01 00 00 00       	mov    $0x1,%ebx
    283a:	48 83 ec 78          	sub    $0x78,%rsp
    283e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2845:	00 00 
    2847:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    284c:	31 c0                	xor    %eax,%eax
    284e:	89 7c 24 14          	mov    %edi,0x14(%rsp)
    2852:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
    2857:	e8 e2 61 00 00       	callq  8a3e <get_enclave_state>
    285c:	83 f8 02             	cmp    $0x2,%eax
    285f:	74 1f                	je     2880 <do_ecall+0x50>
    2861:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    2866:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    286d:	00 00 
    286f:	89 d8                	mov    %ebx,%eax
    2871:	0f 85 51 01 00 00    	jne    29c8 <do_ecall+0x198>
    2877:	48 83 c4 78          	add    $0x78,%rsp
    287b:	5b                   	pop    %rbx
    287c:	5d                   	pop    %rbp
    287d:	c3                   	retq   
    287e:	66 90                	xchg   %ax,%ax
    2880:	e8 ec 61 00 00       	callq  8a71 <get_thread_data>
    2885:	48 85 c0             	test   %rax,%rax
    2888:	74 4a                	je     28d4 <do_ecall+0xa4>
    288a:	48 8b 48 08          	mov    0x8(%rax),%rcx
    288e:	48 39 48 10          	cmp    %rcx,0x10(%rax)
    2892:	74 2c                	je     28c0 <do_ecall+0x90>
    2894:	e8 d8 61 00 00       	callq  8a71 <get_thread_data>
    2899:	48 8b 50 08          	mov    0x8(%rax),%rdx
    289d:	48 39 50 10          	cmp    %rdx,0x10(%rax)
    28a1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    28a6:	74 48                	je     28f0 <do_ecall+0xc0>
    28a8:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    28ad:	8b 7c 24 14          	mov    0x14(%rsp),%edi
    28b1:	e8 9a fb ff ff       	callq  2450 <_ZL10trts_ecalljPv>
    28b6:	89 c3                	mov    %eax,%ebx
    28b8:	eb a7                	jmp    2861 <do_ecall+0x31>
    28ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    28c0:	48 8d 05 f9 67 00 00 	lea    0x67f9(%rip),%rax        # 90c0 <g_global_data>
    28c7:	48 8b 40 38          	mov    0x38(%rax),%rax
    28cb:	48 85 c0             	test   %rax,%rax
    28ce:	0f 84 7c 00 00 00    	je     2950 <do_ecall+0x120>
    28d4:	31 f6                	xor    %esi,%esi
    28d6:	48 89 ef             	mov    %rbp,%rdi
    28d9:	e8 82 fd ff ff       	callq  2660 <do_init_thread>
    28de:	85 c0                	test   %eax,%eax
    28e0:	89 c3                	mov    %eax,%ebx
    28e2:	74 b0                	je     2894 <do_ecall+0x64>
    28e4:	e9 78 ff ff ff       	jmpq   2861 <do_ecall+0x31>
    28e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    28f0:	e8 0b fd ff ff       	callq  2600 <_Z16_pthread_enabledv>
    28f5:	84 c0                	test   %al,%al
    28f7:	74 77                	je     2970 <do_ecall+0x140>
    28f9:	66 0f ef c0          	pxor   %xmm0,%xmm0
    28fd:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
    2902:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
    2907:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
    290c:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    2911:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
    2916:	e8 6e 55 00 00       	callq  7e89 <setjmp>
    291b:	85 c0                	test   %eax,%eax
    291d:	74 71                	je     2990 <do_ecall+0x160>
    291f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    2924:	bb 09 00 00 00       	mov    $0x9,%ebx
    2929:	48 8b 46 10          	mov    0x10(%rsi),%rax
    292d:	48 89 46 08          	mov    %rax,0x8(%rsi)
    2931:	bf 09 00 00 00       	mov    $0x9,%edi
    2936:	e8 d5 fc ff ff       	callq  2610 <_Z24_pthread_tls_store_state9_status_t>
    293b:	e8 10 fd ff ff       	callq  2650 <_Z24_pthread_tls_destructorsv>
    2940:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    2945:	e8 f6 fc ff ff       	callq  2640 <_Z20_pthread_wakeup_joinPv>
    294a:	e9 12 ff ff ff       	jmpq   2861 <do_ecall+0x31>
    294f:	90                   	nop
    2950:	e8 cb fc ff ff       	callq  2620 <_Z22_pthread_tls_get_statev>
    2955:	83 f8 09             	cmp    $0x9,%eax
    2958:	0f 84 76 ff ff ff    	je     28d4 <do_ecall+0xa4>
    295e:	83 7c 24 14 fa       	cmpl   $0xfffffffa,0x14(%rsp)
    2963:	0f 85 2b ff ff ff    	jne    2894 <do_ecall+0x64>
    2969:	e9 66 ff ff ff       	jmpq   28d4 <do_ecall+0xa4>
    296e:	66 90                	xchg   %ax,%ax
    2970:	0f c7 f0             	rdrand %eax
    2973:	73 fb                	jae    2970 <do_ecall+0x140>
    2975:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    297a:	8b 7c 24 14          	mov    0x14(%rsp),%edi
    297e:	e8 6d fc ff ff       	callq  25f0 <_Z30_random_stack_noinline_wrapperI9_status_tJjPvEJRiRS1_EET_PFS4_DpT0_EDpOT1_.isra.0.constprop.3>
    2983:	89 c3                	mov    %eax,%ebx
    2985:	e9 d7 fe ff ff       	jmpq   2861 <do_ecall+0x31>
    298a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2990:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
    2995:	e8 96 fc ff ff       	callq  2630 <_Z26_pthread_tls_store_contextPv>
    299a:	0f c7 f0             	rdrand %eax
    299d:	73 fb                	jae    299a <do_ecall+0x16a>
    299f:	8b 6c 24 14          	mov    0x14(%rsp),%ebp
    29a3:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    29a8:	89 ef                	mov    %ebp,%edi
    29aa:	e8 41 fc ff ff       	callq  25f0 <_Z30_random_stack_noinline_wrapperI9_status_tJjPvEJRiRS1_EET_PFS4_DpT0_EDpOT1_.isra.0.constprop.3>
    29af:	83 fd fa             	cmp    $0xfffffffa,%ebp
    29b2:	89 c3                	mov    %eax,%ebx
    29b4:	0f 84 77 ff ff ff    	je     2931 <do_ecall+0x101>
    29ba:	83 fb 09             	cmp    $0x9,%ebx
    29bd:	0f 85 78 ff ff ff    	jne    293b <do_ecall+0x10b>
    29c3:	e9 69 ff ff ff       	jmpq   2931 <do_ecall+0x101>
    29c8:	e8 b3 1a 00 00       	callq  4480 <__stack_chk_fail>
    29cd:	0f 1f 00             	nopl   (%rax)

00000000000029d0 <do_ecall_add_thread>:
    29d0:	55                   	push   %rbp
    29d1:	53                   	push   %rbx
    29d2:	48 89 fb             	mov    %rdi,%rbx
    29d5:	48 83 ec 08          	sub    $0x8,%rsp
    29d9:	e8 72 08 00 00       	callq  3250 <is_utility_thread>
    29de:	48 85 db             	test   %rbx,%rbx
    29e1:	74 04                	je     29e7 <do_ecall_add_thread+0x17>
    29e3:	3c 01                	cmp    $0x1,%al
    29e5:	74 11                	je     29f8 <do_ecall_add_thread+0x28>
    29e7:	bb 01 00 00 00       	mov    $0x1,%ebx
    29ec:	48 83 c4 08          	add    $0x8,%rsp
    29f0:	89 d8                	mov    %ebx,%eax
    29f2:	5b                   	pop    %rbx
    29f3:	5d                   	pop    %rbp
    29f4:	c3                   	retq   
    29f5:	0f 1f 00             	nopl   (%rax)
    29f8:	be 08 00 00 00       	mov    $0x8,%esi
    29fd:	48 89 df             	mov    %rbx,%rdi
    2a00:	e8 4b e9 ff ff       	callq  1350 <sgx_is_outside_enclave>
    2a05:	85 c0                	test   %eax,%eax
    2a07:	74 de                	je     29e7 <do_ecall_add_thread+0x17>
    2a09:	48 8b 2b             	mov    (%rbx),%rbp
    2a0c:	48 85 ed             	test   %rbp,%rbp
    2a0f:	74 d6                	je     29e7 <do_ecall_add_thread+0x17>
    2a11:	48 89 ef             	mov    %rbp,%rdi
    2a14:	0f ae e8             	lfence 
    2a17:	e8 84 f8 ff ff       	callq  22a0 <_ZL11do_save_tcsPv>
    2a1c:	85 c0                	test   %eax,%eax
    2a1e:	89 c3                	mov    %eax,%ebx
    2a20:	75 ca                	jne    29ec <do_ecall_add_thread+0x1c>
    2a22:	48 89 ef             	mov    %rbp,%rdi
    2a25:	e8 36 f6 ff ff       	callq  2060 <do_add_thread>
    2a2a:	85 c0                	test   %eax,%eax
    2a2c:	89 c3                	mov    %eax,%ebx
    2a2e:	74 bc                	je     29ec <do_ecall_add_thread+0x1c>
    2a30:	e8 1b 08 00 00       	callq  3250 <is_utility_thread>
    2a35:	84 c0                	test   %al,%al
    2a37:	74 b3                	je     29ec <do_ecall_add_thread+0x1c>
    2a39:	48 8b 15 d0 b5 00 00 	mov    0xb5d0(%rip),%rdx        # e010 <_ZL10g_tcs_node>
    2a40:	48 85 d2             	test   %rdx,%rdx
    2a43:	74 a7                	je     29ec <do_ecall_add_thread+0x1c>
    2a45:	48 8b 0d bc b5 00 00 	mov    0xb5bc(%rip),%rcx        # e008 <_ZL12g_tcs_cookie>
    2a4c:	48 8b 32             	mov    (%rdx),%rsi
    2a4f:	48 8b 42 08          	mov    0x8(%rdx),%rax
    2a53:	48 31 ce             	xor    %rcx,%rsi
    2a56:	48 39 f5             	cmp    %rsi,%rbp
    2a59:	74 42                	je     2a9d <do_ecall_add_thread+0xcd>
    2a5b:	48 85 c0             	test   %rax,%rax
    2a5e:	74 8c                	je     29ec <do_ecall_add_thread+0x1c>
    2a60:	48 8b 30             	mov    (%rax),%rsi
    2a63:	48 31 ce             	xor    %rcx,%rsi
    2a66:	48 39 f5             	cmp    %rsi,%rbp
    2a69:	75 08                	jne    2a73 <do_ecall_add_thread+0xa3>
    2a6b:	eb 44                	jmp    2ab1 <do_ecall_add_thread+0xe1>
    2a6d:	0f 1f 00             	nopl   (%rax)
    2a70:	48 89 f8             	mov    %rdi,%rax
    2a73:	48 8b 78 08          	mov    0x8(%rax),%rdi
    2a77:	48 85 ff             	test   %rdi,%rdi
    2a7a:	0f 84 6c ff ff ff    	je     29ec <do_ecall_add_thread+0x1c>
    2a80:	48 8b 17             	mov    (%rdi),%rdx
    2a83:	48 31 ca             	xor    %rcx,%rdx
    2a86:	48 39 d5             	cmp    %rdx,%rbp
    2a89:	75 e5                	jne    2a70 <do_ecall_add_thread+0xa0>
    2a8b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    2a8f:	48 89 50 08          	mov    %rdx,0x8(%rax)
    2a93:	e8 88 3c 00 00       	callq  6720 <dlfree>
    2a98:	e9 4f ff ff ff       	jmpq   29ec <do_ecall_add_thread+0x1c>
    2a9d:	48 89 d7             	mov    %rdx,%rdi
    2aa0:	48 89 05 69 b5 00 00 	mov    %rax,0xb569(%rip)        # e010 <_ZL10g_tcs_node>
    2aa7:	e8 74 3c 00 00       	callq  6720 <dlfree>
    2aac:	e9 3b ff ff ff       	jmpq   29ec <do_ecall_add_thread+0x1c>
    2ab1:	48 89 c7             	mov    %rax,%rdi
    2ab4:	48 89 d0             	mov    %rdx,%rax
    2ab7:	eb d2                	jmp    2a8b <do_ecall_add_thread+0xbb>
    2ab9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002ac0 <do_uninit_enclave>:
    2ac0:	48 8d 05 61 a3 00 00 	lea    0xa361(%rip),%rax        # ce28 <EDMM_supported>
    2ac7:	41 54                	push   %r12
    2ac9:	55                   	push   %rbp
    2aca:	53                   	push   %rbx
    2acb:	8b 00                	mov    (%rax),%eax
    2acd:	85 c0                	test   %eax,%eax
    2acf:	0f 84 b0 00 00 00    	je     2b85 <do_uninit_enclave+0xc5>
    2ad5:	48 89 fd             	mov    %rdi,%rbp
    2ad8:	e8 73 07 00 00       	callq  3250 <is_utility_thread>
    2add:	84 c0                	test   %al,%al
    2adf:	0f 84 93 00 00 00    	je     2b78 <do_uninit_enclave+0xb8>
    2ae5:	f0 83 0d 13 b5 00 00 	lock orl $0x1,0xb513(%rip)        # e000 <g_uninit_flag>
    2aec:	01 
    2aed:	48 8b 1d 1c b5 00 00 	mov    0xb51c(%rip),%rbx        # e010 <_ZL10g_tcs_node>
    2af4:	48 c7 05 11 b5 00 00 	movq   $0x0,0xb511(%rip)        # e010 <_ZL10g_tcs_node>
    2afb:	00 00 00 00 
    2aff:	48 85 db             	test   %rbx,%rbx
    2b02:	74 3c                	je     2b40 <do_uninit_enclave+0x80>
    2b04:	0f 1f 40 00          	nopl   0x0(%rax)
    2b08:	48 8b 33             	mov    (%rbx),%rsi
    2b0b:	48 33 35 f6 b4 00 00 	xor    0xb4f6(%rip),%rsi        # e008 <_ZL12g_tcs_cookie>
    2b12:	48 39 f5             	cmp    %rsi,%rbp
    2b15:	74 15                	je     2b2c <do_uninit_enclave+0x6c>
    2b17:	48 8d 96 00 10 00 00 	lea    0x1000(%rsi),%rdx
    2b1e:	bf 10 04 00 00       	mov    $0x410,%edi
    2b23:	e8 58 f1 ff ff       	callq  1c80 <sgx_accept_forward>
    2b28:	85 c0                	test   %eax,%eax
    2b2a:	75 59                	jne    2b85 <do_uninit_enclave+0xc5>
    2b2c:	4c 8b 63 08          	mov    0x8(%rbx),%r12
    2b30:	48 89 df             	mov    %rbx,%rdi
    2b33:	e8 e8 3b 00 00       	callq  6720 <dlfree>
    2b38:	4c 89 e3             	mov    %r12,%rbx
    2b3b:	48 85 db             	test   %rbx,%rbx
    2b3e:	75 c8                	jne    2b08 <do_uninit_enclave+0x48>
    2b40:	48 8d 3d bd b4 00 00 	lea    0xb4bd(%rip),%rdi        # e004 <_ZL10g_ife_lock>
    2b47:	e8 d4 52 00 00       	callq  7e20 <sgx_spin_lock>
    2b4c:	0f b6 05 b5 a4 00 00 	movzbl 0xa4b5(%rip),%eax        # d008 <_ZL16g_is_first_ecall>
    2b53:	84 c0                	test   %al,%al
    2b55:	74 49                	je     2ba0 <do_uninit_enclave+0xe0>
    2b57:	48 8d 3d a6 b4 00 00 	lea    0xb4a6(%rip),%rdi        # e004 <_ZL10g_ife_lock>
    2b5e:	e8 1d 53 00 00       	callq  7e80 <sgx_spin_unlock>
    2b63:	bf 03 00 00 00       	mov    $0x3,%edi
    2b68:	e8 de 5e 00 00       	callq  8a4b <set_enclave_state>
    2b6d:	5b                   	pop    %rbx
    2b6e:	31 c0                	xor    %eax,%eax
    2b70:	5d                   	pop    %rbp
    2b71:	41 5c                	pop    %r12
    2b73:	c3                   	retq   
    2b74:	0f 1f 40 00          	nopl   0x0(%rax)
    2b78:	e8 03 f0 ff ff       	callq  1b80 <is_dynamic_thread_exist>
    2b7d:	85 c0                	test   %eax,%eax
    2b7f:	0f 84 60 ff ff ff    	je     2ae5 <do_uninit_enclave+0x25>
    2b85:	bf 03 00 00 00       	mov    $0x3,%edi
    2b8a:	e8 bc 5e 00 00       	callq  8a4b <set_enclave_state>
    2b8f:	5b                   	pop    %rbx
    2b90:	b8 01 00 00 00       	mov    $0x1,%eax
    2b95:	5d                   	pop    %rbp
    2b96:	41 5c                	pop    %r12
    2b98:	c3                   	retq   
    2b99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2ba0:	e8 db 17 00 00       	callq  4380 <uninit_global_object>
    2ba5:	eb b0                	jmp    2b57 <do_uninit_enclave+0x97>
    2ba7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2bae:	00 00 

0000000000002bb0 <trts_mprotect>:
    2bb0:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    2bb5:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
    2bb9:	41 ff 72 f8          	pushq  -0x8(%r10)
    2bbd:	55                   	push   %rbp
    2bbe:	48 89 e5             	mov    %rsp,%rbp
    2bc1:	41 56                	push   %r14
    2bc3:	41 55                	push   %r13
    2bc5:	41 54                	push   %r12
    2bc7:	41 52                	push   %r10
    2bc9:	53                   	push   %rbx
    2bca:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
    2bd1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2bd8:	00 00 
    2bda:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2bde:	31 c0                	xor    %eax,%eax
    2be0:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
    2be6:	b8 02 00 00 00       	mov    $0x2,%eax
    2beb:	0f 85 8f 00 00 00    	jne    2c80 <trts_mprotect+0xd0>
    2bf1:	48 85 f6             	test   %rsi,%rsi
    2bf4:	49 89 f4             	mov    %rsi,%r12
    2bf7:	0f 84 83 00 00 00    	je     2c80 <trts_mprotect+0xd0>
    2bfd:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
    2c03:	75 7b                	jne    2c80 <trts_mprotect+0xd0>
    2c05:	48 8d 05 18 a2 00 00 	lea    0xa218(%rip),%rax        # ce24 <g_sdk_version>
    2c0c:	48 89 fb             	mov    %rdi,%rbx
    2c0f:	49 89 d5             	mov    %rdx,%r13
    2c12:	83 38 01             	cmpl   $0x1,(%rax)
    2c15:	0f 84 8d 00 00 00    	je     2ca8 <trts_mprotect+0xf8>
    2c1b:	4c 8d b5 50 ff ff ff 	lea    -0xb0(%rbp),%r14
    2c22:	4c 89 e8             	mov    %r13,%rax
    2c25:	31 f6                	xor    %esi,%esi
    2c27:	48 0d 20 02 00 00    	or     $0x220,%rax
    2c2d:	ba 38 00 00 00       	mov    $0x38,%edx
    2c32:	49 01 dc             	add    %rbx,%r12
    2c35:	49 8d 7e 08          	lea    0x8(%r14),%rdi
    2c39:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
    2c40:	41 83 e5 06          	and    $0x6,%r13d
    2c44:	e8 f4 4f 00 00       	callq  7c3d <memset>
    2c49:	4c 39 e3             	cmp    %r12,%rbx
    2c4c:	73 2e                	jae    2c7c <trts_mprotect+0xcc>
    2c4e:	66 90                	xchg   %ax,%ax
    2c50:	48 89 de             	mov    %rbx,%rsi
    2c53:	4c 89 f7             	mov    %r14,%rdi
    2c56:	e8 11 61 00 00       	callq  8d6c <do_emodpe>
    2c5b:	49 83 fd 06          	cmp    $0x6,%r13
    2c5f:	74 0f                	je     2c70 <trts_mprotect+0xc0>
    2c61:	48 89 de             	mov    %rbx,%rsi
    2c64:	4c 89 f7             	mov    %r14,%rdi
    2c67:	e8 e6 60 00 00       	callq  8d52 <do_eaccept>
    2c6c:	85 c0                	test   %eax,%eax
    2c6e:	75 10                	jne    2c80 <trts_mprotect+0xd0>
    2c70:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
    2c77:	4c 39 e3             	cmp    %r12,%rbx
    2c7a:	72 d4                	jb     2c50 <trts_mprotect+0xa0>
    2c7c:	31 c0                	xor    %eax,%eax
    2c7e:	66 90                	xchg   %ax,%ax
    2c80:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2c84:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2c8b:	00 00 
    2c8d:	75 2d                	jne    2cbc <trts_mprotect+0x10c>
    2c8f:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
    2c96:	5b                   	pop    %rbx
    2c97:	41 5a                	pop    %r10
    2c99:	41 5c                	pop    %r12
    2c9b:	41 5d                	pop    %r13
    2c9d:	41 5e                	pop    %r14
    2c9f:	5d                   	pop    %rbp
    2ca0:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    2ca4:	c3                   	retq   
    2ca5:	0f 1f 00             	nopl   (%rax)
    2ca8:	b9 fc ff ff ff       	mov    $0xfffffffc,%ecx
    2cad:	e8 1e 00 00 00       	callq  2cd0 <change_permissions_ocall>
    2cb2:	85 c0                	test   %eax,%eax
    2cb4:	0f 84 61 ff ff ff    	je     2c1b <trts_mprotect+0x6b>
    2cba:	eb c4                	jmp    2c80 <trts_mprotect+0xd0>
    2cbc:	e8 bf 17 00 00       	callq  4480 <__stack_chk_fail>
    2cc1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2cc8:	00 00 00 
    2ccb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002cd0 <change_permissions_ocall>:
    2cd0:	41 55                	push   %r13
    2cd2:	41 54                	push   %r12
    2cd4:	49 89 fd             	mov    %rdi,%r13
    2cd7:	55                   	push   %rbp
    2cd8:	53                   	push   %rbx
    2cd9:	bf 18 00 00 00       	mov    $0x18,%edi
    2cde:	49 89 f4             	mov    %rsi,%r12
    2ce1:	48 89 d5             	mov    %rdx,%rbp
    2ce4:	89 cb                	mov    %ecx,%ebx
    2ce6:	48 83 ec 08          	sub    $0x8,%rsp
    2cea:	e8 b1 e6 ff ff       	callq  13a0 <sgx_ocalloc>
    2cef:	48 85 c0             	test   %rax,%rax
    2cf2:	74 2c                	je     2d20 <change_permissions_ocall+0x50>
    2cf4:	89 df                	mov    %ebx,%edi
    2cf6:	4c 89 28             	mov    %r13,(%rax)
    2cf9:	4c 89 60 08          	mov    %r12,0x8(%rax)
    2cfd:	48 89 68 10          	mov    %rbp,0x10(%rax)
    2d01:	48 89 c6             	mov    %rax,%rsi
    2d04:	e8 37 00 00 00       	callq  2d40 <sgx_ocall>
    2d09:	89 c3                	mov    %eax,%ebx
    2d0b:	e8 80 e7 ff ff       	callq  1490 <sgx_ocfree>
    2d10:	48 83 c4 08          	add    $0x8,%rsp
    2d14:	89 d8                	mov    %ebx,%eax
    2d16:	5b                   	pop    %rbx
    2d17:	5d                   	pop    %rbp
    2d18:	41 5c                	pop    %r12
    2d1a:	41 5d                	pop    %r13
    2d1c:	c3                   	retq   
    2d1d:	0f 1f 00             	nopl   (%rax)
    2d20:	e8 6b e7 ff ff       	callq  1490 <sgx_ocfree>
    2d25:	bb 01 00 00 00       	mov    $0x1,%ebx
    2d2a:	48 83 c4 08          	add    $0x8,%rsp
    2d2e:	89 d8                	mov    %ebx,%eax
    2d30:	5b                   	pop    %rbx
    2d31:	5d                   	pop    %rbp
    2d32:	41 5c                	pop    %r12
    2d34:	41 5d                	pop    %r13
    2d36:	c3                   	retq   
    2d37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2d3e:	00 00 

0000000000002d40 <sgx_ocall>:
    2d40:	8d 47 05             	lea    0x5(%rdi),%eax
    2d43:	83 f8 03             	cmp    $0x3,%eax
    2d46:	76 12                	jbe    2d5a <sgx_ocall+0x1a>
    2d48:	85 ff                	test   %edi,%edi
    2d4a:	74 0e                	je     2d5a <sgx_ocall+0x1a>
    2d4c:	48 8d 15 ad 62 00 00 	lea    0x62ad(%rip),%rdx        # 9000 <g_dyn_entry_table>
    2d53:	89 f8                	mov    %edi,%eax
    2d55:	48 3b 02             	cmp    (%rdx),%rax
    2d58:	73 06                	jae    2d60 <sgx_ocall+0x20>
    2d5a:	e9 46 5f 00 00       	jmpq   8ca5 <__morestack>
    2d5f:	90                   	nop
    2d60:	b8 01 10 00 00       	mov    $0x1001,%eax
    2d65:	c3                   	retq   
    2d66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2d6d:	00 00 00 

0000000000002d70 <update_ocall_lastsp>:
    2d70:	53                   	push   %rbx
    2d71:	48 89 fb             	mov    %rdi,%rbx
    2d74:	e8 f8 5c 00 00       	callq  8a71 <get_thread_data>
    2d79:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2d7d:	48 39 50 10          	cmp    %rdx,0x10(%rax)
    2d81:	48 89 53 30          	mov    %rdx,0x30(%rbx)
    2d85:	74 21                	je     2da8 <update_ocall_lastsp+0x38>
    2d87:	48 8b b2 90 00 00 00 	mov    0x90(%rdx),%rsi
    2d8e:	48 8d 4e 01          	lea    0x1(%rsi),%rcx
    2d92:	48 89 8b 90 00 00 00 	mov    %rcx,0x90(%rbx)
    2d99:	48 89 58 08          	mov    %rbx,0x8(%rax)
    2d9d:	48 89 d0             	mov    %rdx,%rax
    2da0:	5b                   	pop    %rbx
    2da1:	c3                   	retq   
    2da2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2da8:	48 c7 83 90 00 00 00 	movq   $0x1,0x90(%rbx)
    2daf:	01 00 00 00 
    2db3:	48 89 58 08          	mov    %rbx,0x8(%rax)
    2db7:	48 89 d0             	mov    %rdx,%rax
    2dba:	5b                   	pop    %rbx
    2dbb:	c3                   	retq   
    2dbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002dc0 <do_oret>:
    2dc0:	53                   	push   %rbx
    2dc1:	48 89 fb             	mov    %rdi,%rbx
    2dc4:	48 83 ec 10          	sub    $0x10,%rsp
    2dc8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2dcf:	00 00 
    2dd1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    2dd6:	31 c0                	xor    %eax,%eax
    2dd8:	e8 94 5c 00 00       	callq  8a71 <get_thread_data>
    2ddd:	48 8b 78 08          	mov    0x8(%rax),%rdi
    2de1:	48 85 ff             	test   %rdi,%rdi
    2de4:	48 89 3c 24          	mov    %rdi,(%rsp)
    2de8:	74 46                	je     2e30 <do_oret+0x70>
    2dea:	48 89 e2             	mov    %rsp,%rdx
    2ded:	48 39 fa             	cmp    %rdi,%rdx
    2df0:	73 3e                	jae    2e30 <do_oret+0x70>
    2df2:	48 8b 50 10          	mov    0x10(%rax),%rdx
    2df6:	48 8d 8a 10 ff ff ff 	lea    -0xf0(%rdx),%rcx
    2dfd:	48 39 f9             	cmp    %rdi,%rcx
    2e00:	72 2e                	jb     2e30 <do_oret+0x70>
    2e02:	48 81 7f 20 44 49 43 	cmpq   $0x4f434944,0x20(%rdi)
    2e09:	4f 
    2e0a:	75 24                	jne    2e30 <do_oret+0x70>
    2e0c:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
    2e10:	48 39 ca             	cmp    %rcx,%rdx
    2e13:	72 1b                	jb     2e30 <do_oret+0x70>
    2e15:	48 39 f9             	cmp    %rdi,%rcx
    2e18:	76 16                	jbe    2e30 <do_oret+0x70>
    2e1a:	48 89 48 08          	mov    %rcx,0x8(%rax)
    2e1e:	48 89 de             	mov    %rbx,%rsi
    2e21:	e8 8e 5e 00 00       	callq  8cb4 <asm_oret>
    2e26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2e2d:	00 00 00 
    2e30:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    2e35:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    2e3c:	00 00 
    2e3e:	b8 01 00 00 00       	mov    $0x1,%eax
    2e43:	75 06                	jne    2e4b <do_oret+0x8b>
    2e45:	48 83 c4 10          	add    $0x10,%rsp
    2e49:	5b                   	pop    %rbx
    2e4a:	c3                   	retq   
    2e4b:	e8 30 16 00 00       	callq  4480 <__stack_chk_fail>

0000000000002e50 <trim_range_ocall>:
    2e50:	55                   	push   %rbp
    2e51:	53                   	push   %rbx
    2e52:	48 89 fd             	mov    %rdi,%rbp
    2e55:	bf 10 00 00 00       	mov    $0x10,%edi
    2e5a:	48 89 f3             	mov    %rsi,%rbx
    2e5d:	48 83 ec 08          	sub    $0x8,%rsp
    2e61:	e8 3a e5 ff ff       	callq  13a0 <sgx_ocalloc>
    2e66:	48 85 c0             	test   %rax,%rax
    2e69:	74 25                	je     2e90 <trim_range_ocall+0x40>
    2e6b:	48 89 28             	mov    %rbp,(%rax)
    2e6e:	48 89 58 08          	mov    %rbx,0x8(%rax)
    2e72:	48 89 c6             	mov    %rax,%rsi
    2e75:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    2e7a:	e8 c1 fe ff ff       	callq  2d40 <sgx_ocall>
    2e7f:	89 c3                	mov    %eax,%ebx
    2e81:	e8 0a e6 ff ff       	callq  1490 <sgx_ocfree>
    2e86:	48 83 c4 08          	add    $0x8,%rsp
    2e8a:	89 d8                	mov    %ebx,%eax
    2e8c:	5b                   	pop    %rbx
    2e8d:	5d                   	pop    %rbp
    2e8e:	c3                   	retq   
    2e8f:	90                   	nop
    2e90:	e8 fb e5 ff ff       	callq  1490 <sgx_ocfree>
    2e95:	bb 01 00 00 00       	mov    $0x1,%ebx
    2e9a:	48 83 c4 08          	add    $0x8,%rsp
    2e9e:	89 d8                	mov    %ebx,%eax
    2ea0:	5b                   	pop    %rbx
    2ea1:	5d                   	pop    %rbp
    2ea2:	c3                   	retq   
    2ea3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2eaa:	00 00 00 
    2ead:	0f 1f 00             	nopl   (%rax)

0000000000002eb0 <trim_range_commit_ocall>:
    2eb0:	53                   	push   %rbx
    2eb1:	48 89 fb             	mov    %rdi,%rbx
    2eb4:	bf 08 00 00 00       	mov    $0x8,%edi
    2eb9:	e8 e2 e4 ff ff       	callq  13a0 <sgx_ocalloc>
    2ebe:	48 85 c0             	test   %rax,%rax
    2ec1:	74 1d                	je     2ee0 <trim_range_commit_ocall+0x30>
    2ec3:	48 89 18             	mov    %rbx,(%rax)
    2ec6:	48 89 c6             	mov    %rax,%rsi
    2ec9:	bf fd ff ff ff       	mov    $0xfffffffd,%edi
    2ece:	e8 6d fe ff ff       	callq  2d40 <sgx_ocall>
    2ed3:	89 c3                	mov    %eax,%ebx
    2ed5:	e8 b6 e5 ff ff       	callq  1490 <sgx_ocfree>
    2eda:	89 d8                	mov    %ebx,%eax
    2edc:	5b                   	pop    %rbx
    2edd:	c3                   	retq   
    2ede:	66 90                	xchg   %ax,%ax
    2ee0:	bb 01 00 00 00       	mov    $0x1,%ebx
    2ee5:	e8 a6 e5 ff ff       	callq  1490 <sgx_ocfree>
    2eea:	89 d8                	mov    %ebx,%eax
    2eec:	5b                   	pop    %rbx
    2eed:	c3                   	retq   
    2eee:	66 90                	xchg   %ax,%ax

0000000000002ef0 <get_enclave_size>:
    2ef0:	48 8d 05 c9 61 00 00 	lea    0x61c9(%rip),%rax        # 90c0 <g_global_data>
    2ef7:	48 8b 40 08          	mov    0x8(%rax),%rax
    2efb:	c3                   	retq   
    2efc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002f00 <get_enclave_end>:
    2f00:	48 83 ec 08          	sub    $0x8,%rsp
    2f04:	e8 2d 5b 00 00       	callq  8a36 <get_enclave_base>
    2f09:	48 8d 15 b0 61 00 00 	lea    0x61b0(%rip),%rdx        # 90c0 <g_global_data>
    2f10:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    2f14:	48 83 c4 08          	add    $0x8,%rsp
    2f18:	48 8d 44 10 ff       	lea    -0x1(%rax,%rdx,1),%rax
    2f1d:	c3                   	retq   
    2f1e:	66 90                	xchg   %ax,%ax

0000000000002f20 <get_heap_base>:
    2f20:	48 8d 05 99 61 00 00 	lea    0x6199(%rip),%rax        # 90c0 <g_global_data>
    2f27:	48 8b 40 10          	mov    0x10(%rax),%rax
    2f2b:	48 03 05 96 a0 00 00 	add    0xa096(%rip),%rax        # cfc8 <_GLOBAL_OFFSET_TABLE_+0x18>
    2f32:	c3                   	retq   
    2f33:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2f3a:	00 00 00 
    2f3d:	0f 1f 00             	nopl   (%rax)

0000000000002f40 <get_heap_size>:
    2f40:	48 8d 15 e1 9e 00 00 	lea    0x9ee1(%rip),%rdx        # ce28 <EDMM_supported>
    2f47:	48 8d 35 72 61 00 00 	lea    0x6172(%rip),%rsi        # 90c0 <g_global_data>
    2f4e:	8b 12                	mov    (%rdx),%edx
    2f50:	48 8b 46 18          	mov    0x18(%rsi),%rax
    2f54:	85 d2                	test   %edx,%edx
    2f56:	74 40                	je     2f98 <get_heap_size+0x58>
    2f58:	8b 96 30 01 00 00    	mov    0x130(%rsi),%edx
    2f5e:	85 d2                	test   %edx,%edx
    2f60:	74 36                	je     2f98 <get_heap_size+0x58>
    2f62:	31 c9                	xor    %ecx,%ecx
    2f64:	0f 1f 40 00          	nopl   0x0(%rax)
    2f68:	89 ca                	mov    %ecx,%edx
    2f6a:	48 c1 e2 05          	shl    $0x5,%rdx
    2f6e:	48 01 f2             	add    %rsi,%rdx
    2f71:	0f b7 ba 38 01 00 00 	movzwl 0x138(%rdx),%edi
    2f78:	66 83 ff 03          	cmp    $0x3,%di
    2f7c:	75 0d                	jne    2f8b <get_heap_size+0x4b>
    2f7e:	8b 92 3c 01 00 00    	mov    0x13c(%rdx),%edx
    2f84:	48 c1 e2 0c          	shl    $0xc,%rdx
    2f88:	48 01 d0             	add    %rdx,%rax
    2f8b:	8b 96 30 01 00 00    	mov    0x130(%rsi),%edx
    2f91:	83 c1 01             	add    $0x1,%ecx
    2f94:	39 ca                	cmp    %ecx,%edx
    2f96:	77 d0                	ja     2f68 <get_heap_size+0x28>
    2f98:	f3 c3                	repz retq 
    2f9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002fa0 <get_heap_min_size>:
    2fa0:	48 8d 0d 19 61 00 00 	lea    0x6119(%rip),%rcx        # 90c0 <g_global_data>
    2fa7:	8b 81 30 01 00 00    	mov    0x130(%rcx),%eax
    2fad:	85 c0                	test   %eax,%eax
    2faf:	74 3d                	je     2fee <get_heap_min_size+0x4e>
    2fb1:	0f b7 81 38 01 00 00 	movzwl 0x138(%rcx),%eax
    2fb8:	66 83 f8 01          	cmp    $0x1,%ax
    2fbc:	74 3a                	je     2ff8 <get_heap_min_size+0x58>
    2fbe:	31 c0                	xor    %eax,%eax
    2fc0:	eb 1f                	jmp    2fe1 <get_heap_min_size+0x41>
    2fc2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2fc8:	89 c6                	mov    %eax,%esi
    2fca:	48 89 f2             	mov    %rsi,%rdx
    2fcd:	48 c1 e2 05          	shl    $0x5,%rdx
    2fd1:	48 01 ca             	add    %rcx,%rdx
    2fd4:	0f b7 92 38 01 00 00 	movzwl 0x138(%rdx),%edx
    2fdb:	66 83 fa 01          	cmp    $0x1,%dx
    2fdf:	74 19                	je     2ffa <get_heap_min_size+0x5a>
    2fe1:	8b 91 30 01 00 00    	mov    0x130(%rcx),%edx
    2fe7:	83 c0 01             	add    $0x1,%eax
    2fea:	39 c2                	cmp    %eax,%edx
    2fec:	77 da                	ja     2fc8 <get_heap_min_size+0x28>
    2fee:	31 c0                	xor    %eax,%eax
    2ff0:	c3                   	retq   
    2ff1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2ff8:	31 f6                	xor    %esi,%esi
    2ffa:	48 c1 e6 05          	shl    $0x5,%rsi
    2ffe:	48 01 f1             	add    %rsi,%rcx
    3001:	8b 81 3c 01 00 00    	mov    0x13c(%rcx),%eax
    3007:	48 c1 e0 0c          	shl    $0xc,%rax
    300b:	c3                   	retq   
    300c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000003010 <get_rsrv_base>:
    3010:	48 8d 05 a9 60 00 00 	lea    0x60a9(%rip),%rax        # 90c0 <g_global_data>
    3017:	48 8b 40 20          	mov    0x20(%rax),%rax
    301b:	48 03 05 a6 9f 00 00 	add    0x9fa6(%rip),%rax        # cfc8 <_GLOBAL_OFFSET_TABLE_+0x18>
    3022:	c3                   	retq   
    3023:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    302a:	00 00 00 
    302d:	0f 1f 00             	nopl   (%rax)

0000000000003030 <get_rsrv_end>:
    3030:	48 8d 05 f1 9d 00 00 	lea    0x9df1(%rip),%rax        # ce28 <EDMM_supported>
    3037:	48 8d 0d 82 60 00 00 	lea    0x6082(%rip),%rcx        # 90c0 <g_global_data>
    303e:	8b 00                	mov    (%rax),%eax
    3040:	4c 8b 41 20          	mov    0x20(%rcx),%r8
    3044:	4c 03 05 7d 9f 00 00 	add    0x9f7d(%rip),%r8        # cfc8 <_GLOBAL_OFFSET_TABLE_+0x18>
    304b:	48 8b 79 28          	mov    0x28(%rcx),%rdi
    304f:	85 c0                	test   %eax,%eax
    3051:	74 3d                	je     3090 <get_rsrv_end+0x60>
    3053:	8b 81 30 01 00 00    	mov    0x130(%rcx),%eax
    3059:	85 c0                	test   %eax,%eax
    305b:	74 33                	je     3090 <get_rsrv_end+0x60>
    305d:	31 d2                	xor    %edx,%edx
    305f:	90                   	nop
    3060:	89 d0                	mov    %edx,%eax
    3062:	48 c1 e0 05          	shl    $0x5,%rax
    3066:	48 01 c8             	add    %rcx,%rax
    3069:	0f b7 b0 38 01 00 00 	movzwl 0x138(%rax),%esi
    3070:	66 83 fe 16          	cmp    $0x16,%si
    3074:	75 0d                	jne    3083 <get_rsrv_end+0x53>
    3076:	8b 80 3c 01 00 00    	mov    0x13c(%rax),%eax
    307c:	48 c1 e0 0c          	shl    $0xc,%rax
    3080:	48 01 c7             	add    %rax,%rdi
    3083:	8b 81 30 01 00 00    	mov    0x130(%rcx),%eax
    3089:	83 c2 01             	add    $0x1,%edx
    308c:	39 d0                	cmp    %edx,%eax
    308e:	77 d0                	ja     3060 <get_rsrv_end+0x30>
    3090:	4a 8d 44 07 ff       	lea    -0x1(%rdi,%r8,1),%rax
    3095:	c3                   	retq   
    3096:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    309d:	00 00 00 

00000000000030a0 <get_rsrv_size>:
    30a0:	48 8d 15 81 9d 00 00 	lea    0x9d81(%rip),%rdx        # ce28 <EDMM_supported>
    30a7:	48 8d 35 12 60 00 00 	lea    0x6012(%rip),%rsi        # 90c0 <g_global_data>
    30ae:	8b 12                	mov    (%rdx),%edx
    30b0:	48 8b 46 28          	mov    0x28(%rsi),%rax
    30b4:	85 d2                	test   %edx,%edx
    30b6:	74 40                	je     30f8 <get_rsrv_size+0x58>
    30b8:	8b 96 30 01 00 00    	mov    0x130(%rsi),%edx
    30be:	85 d2                	test   %edx,%edx
    30c0:	74 36                	je     30f8 <get_rsrv_size+0x58>
    30c2:	31 c9                	xor    %ecx,%ecx
    30c4:	0f 1f 40 00          	nopl   0x0(%rax)
    30c8:	89 ca                	mov    %ecx,%edx
    30ca:	48 c1 e2 05          	shl    $0x5,%rdx
    30ce:	48 01 f2             	add    %rsi,%rdx
    30d1:	0f b7 ba 38 01 00 00 	movzwl 0x138(%rdx),%edi
    30d8:	66 83 ff 16          	cmp    $0x16,%di
    30dc:	75 0d                	jne    30eb <get_rsrv_size+0x4b>
    30de:	8b 92 3c 01 00 00    	mov    0x13c(%rdx),%edx
    30e4:	48 c1 e2 0c          	shl    $0xc,%rdx
    30e8:	48 01 d0             	add    %rdx,%rax
    30eb:	8b 96 30 01 00 00    	mov    0x130(%rsi),%edx
    30f1:	83 c1 01             	add    $0x1,%ecx
    30f4:	39 ca                	cmp    %ecx,%edx
    30f6:	77 d0                	ja     30c8 <get_rsrv_size+0x28>
    30f8:	f3 c3                	repz retq 
    30fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000003100 <get_rsrv_min_size>:
    3100:	48 8d 0d b9 5f 00 00 	lea    0x5fb9(%rip),%rcx        # 90c0 <g_global_data>
    3107:	8b 81 30 01 00 00    	mov    0x130(%rcx),%eax
    310d:	85 c0                	test   %eax,%eax
    310f:	74 3d                	je     314e <get_rsrv_min_size+0x4e>
    3111:	0f b7 81 38 01 00 00 	movzwl 0x138(%rcx),%eax
    3118:	66 83 f8 14          	cmp    $0x14,%ax
    311c:	74 3a                	je     3158 <get_rsrv_min_size+0x58>
    311e:	31 c0                	xor    %eax,%eax
    3120:	eb 1f                	jmp    3141 <get_rsrv_min_size+0x41>
    3122:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3128:	89 c6                	mov    %eax,%esi
    312a:	48 89 f2             	mov    %rsi,%rdx
    312d:	48 c1 e2 05          	shl    $0x5,%rdx
    3131:	48 01 ca             	add    %rcx,%rdx
    3134:	0f b7 92 38 01 00 00 	movzwl 0x138(%rdx),%edx
    313b:	66 83 fa 14          	cmp    $0x14,%dx
    313f:	74 19                	je     315a <get_rsrv_min_size+0x5a>
    3141:	8b 91 30 01 00 00    	mov    0x130(%rcx),%edx
    3147:	83 c0 01             	add    $0x1,%eax
    314a:	39 c2                	cmp    %eax,%edx
    314c:	77 da                	ja     3128 <get_rsrv_min_size+0x28>
    314e:	31 c0                	xor    %eax,%eax
    3150:	c3                   	retq   
    3151:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3158:	31 f6                	xor    %esi,%esi
    315a:	48 c1 e6 05          	shl    $0x5,%rsi
    315e:	48 01 f1             	add    %rsi,%rcx
    3161:	8b 81 3c 01 00 00    	mov    0x13c(%rcx),%eax
    3167:	48 c1 e0 0c          	shl    $0xc,%rax
    316b:	c3                   	retq   
    316c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000003170 <get_errno_addr>:
    3170:	48 83 ec 08          	sub    $0x8,%rsp
    3174:	e8 f8 58 00 00       	callq  8a71 <get_thread_data>
    3179:	48 83 c4 08          	add    $0x8,%rsp
    317d:	48 83 c0 40          	add    $0x40,%rax
    3181:	c3                   	retq   
    3182:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3189:	00 00 00 
    318c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000003190 <feature_supported>:
    3190:	31 c0                	xor    %eax,%eax
    3192:	48 85 ff             	test   %rdi,%rdi
    3195:	74 3b                	je     31d2 <feature_supported+0x42>
    3197:	31 d2                	xor    %edx,%edx
    3199:	eb 0d                	jmp    31a8 <feature_supported+0x18>
    319b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    31a0:	48 85 c0             	test   %rax,%rax
    31a3:	44 89 c2             	mov    %r8d,%edx
    31a6:	78 28                	js     31d0 <feature_supported+0x40>
    31a8:	44 8d 42 01          	lea    0x1(%rdx),%r8d
    31ac:	89 d0                	mov    %edx,%eax
    31ae:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
    31b2:	45 89 c1             	mov    %r8d,%r9d
    31b5:	41 c1 e1 06          	shl    $0x6,%r9d
    31b9:	44 39 ce             	cmp    %r9d,%esi
    31bc:	73 e2                	jae    31a0 <feature_supported+0x10>
    31be:	c1 e2 06             	shl    $0x6,%edx
    31c1:	89 f1                	mov    %esi,%ecx
    31c3:	29 d1                	sub    %edx,%ecx
    31c5:	48 d3 e8             	shr    %cl,%rax
    31c8:	83 e0 01             	and    $0x1,%eax
    31cb:	c3                   	retq   
    31cc:	0f 1f 40 00          	nopl   0x0(%rax)
    31d0:	31 c0                	xor    %eax,%eax
    31d2:	f3 c3                	repz retq 
    31d4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    31db:	00 00 00 
    31de:	66 90                	xchg   %ax,%ax

00000000000031e0 <is_stack_addr>:
    31e0:	55                   	push   %rbp
    31e1:	53                   	push   %rbx
    31e2:	48 89 f5             	mov    %rsi,%rbp
    31e5:	48 89 fb             	mov    %rdi,%rbx
    31e8:	48 83 ec 08          	sub    $0x8,%rsp
    31ec:	e8 80 58 00 00       	callq  8a71 <get_thread_data>
    31f1:	31 c9                	xor    %ecx,%ecx
    31f3:	48 01 dd             	add    %rbx,%rbp
    31f6:	0f 92 c1             	setb   %cl
    31f9:	48 3b 68 10          	cmp    0x10(%rax),%rbp
    31fd:	0f 96 c2             	setbe  %dl
    3200:	48 39 58 18          	cmp    %rbx,0x18(%rax)
    3204:	0f 96 c0             	setbe  %al
    3207:	21 d0                	and    %edx,%eax
    3209:	48 85 c9             	test   %rcx,%rcx
    320c:	0f 94 c2             	sete   %dl
    320f:	48 83 c4 08          	add    $0x8,%rsp
    3213:	21 d0                	and    %edx,%eax
    3215:	5b                   	pop    %rbx
    3216:	5d                   	pop    %rbp
    3217:	c3                   	retq   
    3218:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    321f:	00 

0000000000003220 <is_valid_sp>:
    3220:	40 f6 c7 07          	test   $0x7,%dil
    3224:	74 0a                	je     3230 <is_valid_sp+0x10>
    3226:	31 c0                	xor    %eax,%eax
    3228:	c3                   	retq   
    3229:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3230:	53                   	push   %rbx
    3231:	48 89 fb             	mov    %rdi,%rbx
    3234:	e8 38 58 00 00       	callq  8a71 <get_thread_data>
    3239:	48 3b 58 10          	cmp    0x10(%rax),%rbx
    323d:	0f 96 c2             	setbe  %dl
    3240:	48 3b 58 18          	cmp    0x18(%rax),%rbx
    3244:	5b                   	pop    %rbx
    3245:	0f 93 c0             	setae  %al
    3248:	21 d0                	and    %edx,%eax
    324a:	c3                   	retq   
    324b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003250 <is_utility_thread>:
    3250:	48 83 ec 08          	sub    $0x8,%rsp
    3254:	e8 18 58 00 00       	callq  8a71 <get_thread_data>
    3259:	31 d2                	xor    %edx,%edx
    325b:	48 85 c0             	test   %rax,%rax
    325e:	74 07                	je     3267 <is_utility_thread+0x17>
    3260:	48 8b 50 30          	mov    0x30(%rax),%rdx
    3264:	83 e2 01             	and    $0x1,%edx
    3267:	89 d0                	mov    %edx,%eax
    3269:	48 83 c4 08          	add    $0x8,%rsp
    326d:	c3                   	retq   
    326e:	66 90                	xchg   %ax,%ax

0000000000003270 <get_max_tcs_num>:
    3270:	48 8d 05 49 5e 00 00 	lea    0x5e49(%rip),%rax        # 90c0 <g_global_data>
    3277:	48 8b 40 40          	mov    0x40(%rax),%rax
    327b:	c3                   	retq   
    327c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000003280 <internal_handle_exception>:
    3280:	41 56                	push   %r14
    3282:	41 55                	push   %r13
    3284:	41 54                	push   %r12
    3286:	55                   	push   %rbp
    3287:	48 89 fd             	mov    %rdi,%rbp
    328a:	53                   	push   %rbx
    328b:	e8 e1 57 00 00       	callq  8a71 <get_thread_data>
    3290:	49 89 c4             	mov    %rax,%r12
    3293:	48 8b 40 60          	mov    0x60(%rax),%rax
    3297:	48 85 c0             	test   %rax,%rax
    329a:	79 0e                	jns    32aa <internal_handle_exception+0x2a>
    329c:	49 c7 44 24 60 ff ff 	movq   $0xffffffffffffffff,0x60(%r12)
    32a3:	ff ff 
    32a5:	e8 f6 5a 00 00       	callq  8da0 <abort>
    32aa:	48 83 c0 01          	add    $0x1,%rax
    32ae:	48 8d 3d 6b ad 00 00 	lea    0xad6b(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    32b5:	49 89 44 24 60       	mov    %rax,0x60(%r12)
    32ba:	e8 61 4b 00 00       	callq  7e20 <sgx_spin_lock>
    32bf:	48 8b 05 62 ad 00 00 	mov    0xad62(%rip),%rax        # e028 <_ZL12g_first_node>
    32c6:	48 85 c0             	test   %rax,%rax
    32c9:	0f 84 e7 00 00 00    	je     33b6 <internal_handle_exception+0x136>
    32cf:	31 db                	xor    %ebx,%ebx
    32d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    32d8:	48 8b 40 08          	mov    0x8(%rax),%rax
    32dc:	48 83 c3 08          	add    $0x8,%rbx
    32e0:	48 85 c0             	test   %rax,%rax
    32e3:	75 f3                	jne    32d8 <internal_handle_exception+0x58>
    32e5:	48 85 db             	test   %rbx,%rbx
    32e8:	0f 84 c8 00 00 00    	je     33b6 <internal_handle_exception+0x136>
    32ee:	48 89 df             	mov    %rbx,%rdi
    32f1:	e8 0a 1a 00 00       	callq  4d00 <dlmalloc>
    32f6:	48 85 c0             	test   %rax,%rax
    32f9:	49 89 c5             	mov    %rax,%r13
    32fc:	0f 84 d8 00 00 00    	je     33da <internal_handle_exception+0x15a>
    3302:	48 8b 05 1f ad 00 00 	mov    0xad1f(%rip),%rax        # e028 <_ZL12g_first_node>
    3309:	48 85 c0             	test   %rax,%rax
    330c:	74 1e                	je     332c <internal_handle_exception+0xac>
    330e:	4c 89 ea             	mov    %r13,%rdx
    3311:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3318:	48 8b 08             	mov    (%rax),%rcx
    331b:	48 8b 40 08          	mov    0x8(%rax),%rax
    331f:	48 83 c2 08          	add    $0x8,%rdx
    3323:	48 89 4a f8          	mov    %rcx,-0x8(%rdx)
    3327:	48 85 c0             	test   %rax,%rax
    332a:	75 ec                	jne    3318 <internal_handle_exception+0x98>
    332c:	48 8d 3d ed ac 00 00 	lea    0xaced(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    3333:	e8 48 4b 00 00       	callq  7e80 <sgx_spin_unlock>
    3338:	48 85 db             	test   %rbx,%rbx
    333b:	74 55                	je     3392 <internal_handle_exception+0x112>
    333d:	4d 89 ee             	mov    %r13,%r14
    3340:	eb 10                	jmp    3352 <internal_handle_exception+0xd2>
    3342:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3348:	49 83 c6 08          	add    $0x8,%r14
    334c:	48 83 eb 08          	sub    $0x8,%rbx
    3350:	74 40                	je     3392 <internal_handle_exception+0x112>
    3352:	49 8b 06             	mov    (%r14),%rax
    3355:	48 33 05 bc ac 00 00 	xor    0xacbc(%rip),%rax        # e018 <_ZL12g_veh_cookie>
    335c:	48 89 ef             	mov    %rbp,%rdi
    335f:	ff d0                	callq  *%rax
    3361:	83 f8 ff             	cmp    $0xffffffff,%eax
    3364:	75 e2                	jne    3348 <internal_handle_exception+0xc8>
    3366:	4c 89 ef             	mov    %r13,%rdi
    3369:	e8 b2 33 00 00       	callq  6720 <dlfree>
    336e:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
    3372:	e8 a9 fe ff ff       	callq  3220 <is_valid_sp>
    3377:	84 c0                	test   %al,%al
    3379:	0f 84 1d ff ff ff    	je     329c <internal_handle_exception+0x1c>
    337f:	49 83 6c 24 60 01    	subq   $0x1,0x60(%r12)
    3385:	48 89 ef             	mov    %rbp,%rdi
    3388:	e8 22 5a 00 00       	callq  8daf <continue_execution>
    338d:	e9 0a ff ff ff       	jmpq   329c <internal_handle_exception+0x1c>
    3392:	4c 89 ef             	mov    %r13,%rdi
    3395:	e8 86 33 00 00       	callq  6720 <dlfree>
    339a:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
    339e:	e8 7d fe ff ff       	callq  3220 <is_valid_sp>
    33a3:	84 c0                	test   %al,%al
    33a5:	0f 84 f1 fe ff ff    	je     329c <internal_handle_exception+0x1c>
    33ab:	49 c7 44 24 60 ff ff 	movq   $0xffffffffffffffff,0x60(%r12)
    33b2:	ff ff 
    33b4:	eb cf                	jmp    3385 <internal_handle_exception+0x105>
    33b6:	48 8d 3d 63 ac 00 00 	lea    0xac63(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    33bd:	31 db                	xor    %ebx,%ebx
    33bf:	e8 bc 4a 00 00       	callq  7e80 <sgx_spin_unlock>
    33c4:	49 c7 44 24 60 ff ff 	movq   $0xffffffffffffffff,0x60(%r12)
    33cb:	ff ff 
    33cd:	48 89 ef             	mov    %rbp,%rdi
    33d0:	e8 da 59 00 00       	callq  8daf <continue_execution>
    33d5:	e9 14 ff ff ff       	jmpq   32ee <internal_handle_exception+0x6e>
    33da:	48 8d 3d 3f ac 00 00 	lea    0xac3f(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    33e1:	e8 9a 4a 00 00       	callq  7e80 <sgx_spin_unlock>
    33e6:	e9 b1 fe ff ff       	jmpq   329c <internal_handle_exception+0x1c>
    33eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000033f0 <sgx_register_exception_handler>:
    33f0:	41 54                	push   %r12
    33f2:	55                   	push   %rbp
    33f3:	41 89 fc             	mov    %edi,%r12d
    33f6:	53                   	push   %rbx
    33f7:	48 89 f5             	mov    %rsi,%rbp
    33fa:	48 83 ec 10          	sub    $0x10,%rsp
    33fe:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3405:	00 00 
    3407:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    340c:	31 c0                	xor    %eax,%eax
    340e:	48 83 3d 02 ac 00 00 	cmpq   $0x0,0xac02(%rip)        # e018 <_ZL12g_veh_cookie>
    3415:	00 
    3416:	0f 84 ac 00 00 00    	je     34c8 <sgx_register_exception_handler+0xd8>
    341c:	31 f6                	xor    %esi,%esi
    341e:	48 89 ef             	mov    %rbp,%rdi
    3421:	e8 da de ff ff       	callq  1300 <sgx_is_within_enclave>
    3426:	85 c0                	test   %eax,%eax
    3428:	0f 84 c2 00 00 00    	je     34f0 <sgx_register_exception_handler+0x100>
    342e:	bf 10 00 00 00       	mov    $0x10,%edi
    3433:	e8 c8 18 00 00       	callq  4d00 <dlmalloc>
    3438:	48 85 c0             	test   %rax,%rax
    343b:	48 89 c3             	mov    %rax,%rbx
    343e:	0f 84 ac 00 00 00    	je     34f0 <sgx_register_exception_handler+0x100>
    3444:	48 33 2d cd ab 00 00 	xor    0xabcd(%rip),%rbp        # e018 <_ZL12g_veh_cookie>
    344b:	48 8d 3d ce ab 00 00 	lea    0xabce(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    3452:	48 89 28             	mov    %rbp,(%rax)
    3455:	e8 c6 49 00 00       	callq  7e20 <sgx_spin_lock>
    345a:	48 8b 05 c7 ab 00 00 	mov    0xabc7(%rip),%rax        # e028 <_ZL12g_first_node>
    3461:	48 85 c0             	test   %rax,%rax
    3464:	74 05                	je     346b <sgx_register_exception_handler+0x7b>
    3466:	45 85 e4             	test   %r12d,%r12d
    3469:	74 40                	je     34ab <sgx_register_exception_handler+0xbb>
    346b:	48 89 43 08          	mov    %rax,0x8(%rbx)
    346f:	48 89 1d b2 ab 00 00 	mov    %rbx,0xabb2(%rip)        # e028 <_ZL12g_first_node>
    3476:	48 8d 3d a3 ab 00 00 	lea    0xaba3(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    347d:	e8 fe 49 00 00       	callq  7e80 <sgx_spin_unlock>
    3482:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    3487:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    348e:	00 00 
    3490:	48 89 d8             	mov    %rbx,%rax
    3493:	0f 85 91 00 00 00    	jne    352a <sgx_register_exception_handler+0x13a>
    3499:	48 83 c4 10          	add    $0x10,%rsp
    349d:	5b                   	pop    %rbx
    349e:	5d                   	pop    %rbp
    349f:	41 5c                	pop    %r12
    34a1:	c3                   	retq   
    34a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    34a8:	48 89 d0             	mov    %rdx,%rax
    34ab:	48 8b 50 08          	mov    0x8(%rax),%rdx
    34af:	48 85 d2             	test   %rdx,%rdx
    34b2:	75 f4                	jne    34a8 <sgx_register_exception_handler+0xb8>
    34b4:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
    34bb:	00 
    34bc:	48 89 58 08          	mov    %rbx,0x8(%rax)
    34c0:	eb b4                	jmp    3476 <sgx_register_exception_handler+0x86>
    34c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    34c8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    34cf:	00 
    34d0:	48 89 e3             	mov    %rsp,%rbx
    34d3:	eb 0a                	jmp    34df <sgx_register_exception_handler+0xef>
    34d5:	0f 1f 00             	nopl   (%rax)
    34d8:	48 83 3c 24 00       	cmpq   $0x0,(%rsp)
    34dd:	75 19                	jne    34f8 <sgx_register_exception_handler+0x108>
    34df:	be 08 00 00 00       	mov    $0x8,%esi
    34e4:	48 89 df             	mov    %rbx,%rdi
    34e7:	e8 f4 df ff ff       	callq  14e0 <sgx_read_rand>
    34ec:	85 c0                	test   %eax,%eax
    34ee:	74 e8                	je     34d8 <sgx_register_exception_handler+0xe8>
    34f0:	31 db                	xor    %ebx,%ebx
    34f2:	eb 8e                	jmp    3482 <sgx_register_exception_handler+0x92>
    34f4:	0f 1f 40 00          	nopl   0x0(%rax)
    34f8:	48 8d 3d 21 ab 00 00 	lea    0xab21(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    34ff:	e8 1c 49 00 00       	callq  7e20 <sgx_spin_lock>
    3504:	48 83 3d 0c ab 00 00 	cmpq   $0x0,0xab0c(%rip)        # e018 <_ZL12g_veh_cookie>
    350b:	00 
    350c:	75 0b                	jne    3519 <sgx_register_exception_handler+0x129>
    350e:	48 8b 04 24          	mov    (%rsp),%rax
    3512:	48 89 05 ff aa 00 00 	mov    %rax,0xaaff(%rip)        # e018 <_ZL12g_veh_cookie>
    3519:	48 8d 3d 00 ab 00 00 	lea    0xab00(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    3520:	e8 5b 49 00 00       	callq  7e80 <sgx_spin_unlock>
    3525:	e9 f2 fe ff ff       	jmpq   341c <sgx_register_exception_handler+0x2c>
    352a:	e8 51 0f 00 00       	callq  4480 <__stack_chk_fail>
    352f:	90                   	nop

0000000000003530 <sgx_unregister_exception_handler>:
    3530:	31 c0                	xor    %eax,%eax
    3532:	48 85 ff             	test   %rdi,%rdi
    3535:	74 51                	je     3588 <sgx_unregister_exception_handler+0x58>
    3537:	53                   	push   %rbx
    3538:	48 89 fb             	mov    %rdi,%rbx
    353b:	48 8d 3d de aa 00 00 	lea    0xaade(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    3542:	e8 d9 48 00 00       	callq  7e20 <sgx_spin_lock>
    3547:	48 8b 15 da aa 00 00 	mov    0xaada(%rip),%rdx        # e028 <_ZL12g_first_node>
    354e:	48 85 d2             	test   %rdx,%rdx
    3551:	74 1e                	je     3571 <sgx_unregister_exception_handler+0x41>
    3553:	48 39 da             	cmp    %rbx,%rdx
    3556:	75 10                	jne    3568 <sgx_unregister_exception_handler+0x38>
    3558:	eb 5e                	jmp    35b8 <sgx_unregister_exception_handler+0x88>
    355a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3560:	48 39 d8             	cmp    %rbx,%rax
    3563:	74 2b                	je     3590 <sgx_unregister_exception_handler+0x60>
    3565:	48 89 c2             	mov    %rax,%rdx
    3568:	48 8b 42 08          	mov    0x8(%rdx),%rax
    356c:	48 85 c0             	test   %rax,%rax
    356f:	75 ef                	jne    3560 <sgx_unregister_exception_handler+0x30>
    3571:	48 8d 3d a8 aa 00 00 	lea    0xaaa8(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    3578:	e8 03 49 00 00       	callq  7e80 <sgx_spin_unlock>
    357d:	31 c0                	xor    %eax,%eax
    357f:	5b                   	pop    %rbx
    3580:	c3                   	retq   
    3581:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3588:	f3 c3                	repz retq 
    358a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3590:	48 8b 43 08          	mov    0x8(%rbx),%rax
    3594:	48 8d 3d 85 aa 00 00 	lea    0xaa85(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    359b:	48 89 42 08          	mov    %rax,0x8(%rdx)
    359f:	e8 dc 48 00 00       	callq  7e80 <sgx_spin_unlock>
    35a4:	48 89 df             	mov    %rbx,%rdi
    35a7:	e8 74 31 00 00       	callq  6720 <dlfree>
    35ac:	b8 01 00 00 00       	mov    $0x1,%eax
    35b1:	5b                   	pop    %rbx
    35b2:	c3                   	retq   
    35b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    35b8:	48 8b 43 08          	mov    0x8(%rbx),%rax
    35bc:	48 8d 3d 5d aa 00 00 	lea    0xaa5d(%rip),%rdi        # e020 <_ZL14g_handler_lock>
    35c3:	48 89 05 5e aa 00 00 	mov    %rax,0xaa5e(%rip)        # e028 <_ZL12g_first_node>
    35ca:	e8 b1 48 00 00       	callq  7e80 <sgx_spin_unlock>
    35cf:	eb d3                	jmp    35a4 <sgx_unregister_exception_handler+0x74>
    35d1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    35d8:	00 00 00 
    35db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000035e0 <trts_handle_exception>:
    35e0:	41 55                	push   %r13
    35e2:	41 54                	push   %r12
    35e4:	55                   	push   %rbp
    35e5:	53                   	push   %rbx
    35e6:	48 89 fb             	mov    %rdi,%rbx
    35e9:	48 83 ec 08          	sub    $0x8,%rsp
    35ed:	e8 7f 54 00 00       	callq  8a71 <get_thread_data>
    35f2:	48 85 c0             	test   %rax,%rax
    35f5:	74 51                	je     3648 <trts_handle_exception+0x68>
    35f7:	48 85 db             	test   %rbx,%rbx
    35fa:	74 4c                	je     3648 <trts_handle_exception+0x68>
    35fc:	48 89 df             	mov    %rbx,%rdi
    35ff:	48 89 c5             	mov    %rax,%rbp
    3602:	e8 39 e0 ff ff       	callq  1640 <check_static_stack_canary>
    3607:	85 c0                	test   %eax,%eax
    3609:	75 3d                	jne    3648 <trts_handle_exception+0x68>
    360b:	e8 2e 54 00 00       	callq  8a3e <get_enclave_state>
    3610:	83 f8 02             	cmp    $0x2,%eax
    3613:	75 33                	jne    3648 <trts_handle_exception+0x68>
    3615:	48 83 7d 60 ff       	cmpq   $0xffffffffffffffff,0x60(%rbp)
    361a:	74 2c                	je     3648 <trts_handle_exception+0x68>
    361c:	48 8b 45 10          	mov    0x10(%rbp),%rax
    3620:	48 05 b0 02 01 00    	add    $0x102b0,%rax
    3626:	48 39 c3             	cmp    %rax,%rbx
    3629:	75 1d                	jne    3648 <trts_handle_exception+0x68>
    362b:	4c 8b 65 20          	mov    0x20(%rbp),%r12
    362f:	4c 89 e0             	mov    %r12,%rax
    3632:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    3638:	48 2d 00 10 00 00    	sub    $0x1000,%rax
    363e:	48 39 c3             	cmp    %rax,%rbx
    3641:	74 25                	je     3668 <trts_handle_exception+0x88>
    3643:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3648:	48 8d 05 51 9a 00 00 	lea    0x9a51(%rip),%rax        # d0a0 <g_enclave_state>
    364f:	c7 00 03 00 00 00    	movl   $0x3,(%rax)
    3655:	b8 06 10 00 00       	mov    $0x1006,%eax
    365a:	48 83 c4 08          	add    $0x8,%rsp
    365e:	5b                   	pop    %rbx
    365f:	5d                   	pop    %rbp
    3660:	41 5c                	pop    %r12
    3662:	41 5d                	pop    %r13
    3664:	c3                   	retq   
    3665:	0f 1f 00             	nopl   (%rax)
    3668:	49 8b 5c 24 20       	mov    0x20(%r12),%rbx
    366d:	31 f6                	xor    %esi,%esi
    366f:	48 89 df             	mov    %rbx,%rdi
    3672:	e8 69 fb ff ff       	callq  31e0 <is_stack_addr>
    3677:	84 c0                	test   %al,%al
    3679:	0f 84 81 00 00 00    	je     3700 <trts_handle_exception+0x120>
    367f:	48 81 eb 18 01 00 00 	sub    $0x118,%rbx
    3686:	be 18 01 00 00       	mov    $0x118,%esi
    368b:	48 83 e3 f0          	and    $0xfffffffffffffff0,%rbx
    368f:	48 89 df             	mov    %rbx,%rdi
    3692:	e8 49 fb ff ff       	callq  31e0 <is_stack_addr>
    3697:	84 c0                	test   %al,%al
    3699:	74 65                	je     3700 <trts_handle_exception+0x120>
    369b:	4c 8d 6b f8          	lea    -0x8(%rbx),%r13
    369f:	be 08 00 00 00       	mov    $0x8,%esi
    36a4:	4c 89 ef             	mov    %r13,%rdi
    36a7:	e8 34 fb ff ff       	callq  31e0 <is_stack_addr>
    36ac:	84 c0                	test   %al,%al
    36ae:	74 50                	je     3700 <trts_handle_exception+0x120>
    36b0:	48 8b 85 98 00 00 00 	mov    0x98(%rbp),%rax
    36b7:	4c 39 e8             	cmp    %r13,%rax
    36ba:	76 5b                	jbe    3717 <trts_handle_exception+0x137>
    36bc:	48 8d 98 ff 0f 00 00 	lea    0xfff(%rax),%rbx
    36c3:	4c 29 eb             	sub    %r13,%rbx
    36c6:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
    36cd:	48 39 d8             	cmp    %rbx,%rax
    36d0:	76 2e                	jbe    3700 <trts_handle_exception+0x120>
    36d2:	48 29 d8             	sub    %rbx,%rax
    36d5:	48 3b 45 18          	cmp    0x18(%rbp),%rax
    36d9:	48 89 c7             	mov    %rax,%rdi
    36dc:	72 22                	jb     3700 <trts_handle_exception+0x120>
    36de:	48 89 de             	mov    %rbx,%rsi
    36e1:	48 c1 ee 0c          	shr    $0xc,%rsi
    36e5:	48 85 f6             	test   %rsi,%rsi
    36e8:	74 16                	je     3700 <trts_handle_exception+0x120>
    36ea:	e8 61 e7 ff ff       	callq  1e50 <apply_pages_within_exception>
    36ef:	85 c0                	test   %eax,%eax
    36f1:	75 0d                	jne    3700 <trts_handle_exception+0x120>
    36f3:	48 29 9d 98 00 00 00 	sub    %rbx,0x98(%rbp)
    36fa:	e9 5b ff ff ff       	jmpq   365a <trts_handle_exception+0x7a>
    36ff:	90                   	nop
    3700:	48 8d 05 99 99 00 00 	lea    0x9999(%rip),%rax        # d0a0 <g_enclave_state>
    3707:	c7 00 03 00 00 00    	movl   $0x3,(%rax)
    370d:	b8 09 10 00 00       	mov    $0x1009,%eax
    3712:	e9 43 ff ff ff       	jmpq   365a <trts_handle_exception+0x7a>
    3717:	49 8b 84 24 88 00 00 	mov    0x88(%r12),%rax
    371e:	00 
    371f:	48 3b 05 b2 98 00 00 	cmp    0x98b2(%rip),%rax        # cfd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    3726:	0f 84 05 01 00 00    	je     3831 <trts_handle_exception+0x251>
    372c:	41 80 bc 24 a3 00 00 	cmpb   $0x0,0xa3(%r12)
    3733:	00 00 
    3735:	0f 89 0d ff ff ff    	jns    3648 <trts_handle_exception+0x68>
    373b:	41 0f b6 94 24 a0 00 	movzbl 0xa0(%r12),%edx
    3742:	00 00 
    3744:	48 8d 0d 35 fb ff ff 	lea    -0x4cb(%rip),%rcx        # 3280 <internal_handle_exception>
    374b:	89 93 90 00 00 00    	mov    %edx,0x90(%rbx)
    3751:	41 0f b6 94 24 a1 00 	movzbl 0xa1(%r12),%edx
    3758:	00 00 
    375a:	83 e2 07             	and    $0x7,%edx
    375d:	89 93 94 00 00 00    	mov    %edx,0x94(%rbx)
    3763:	49 8b 14 24          	mov    (%r12),%rdx
    3767:	48 89 13             	mov    %rdx,(%rbx)
    376a:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
    376f:	48 89 53 08          	mov    %rdx,0x8(%rbx)
    3773:	49 8b 54 24 10       	mov    0x10(%r12),%rdx
    3778:	48 89 53 10          	mov    %rdx,0x10(%rbx)
    377c:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    3781:	48 89 53 18          	mov    %rdx,0x18(%rbx)
    3785:	49 8b 54 24 20       	mov    0x20(%r12),%rdx
    378a:	48 89 53 20          	mov    %rdx,0x20(%rbx)
    378e:	49 8b 54 24 28       	mov    0x28(%r12),%rdx
    3793:	48 89 53 28          	mov    %rdx,0x28(%rbx)
    3797:	49 8b 54 24 30       	mov    0x30(%r12),%rdx
    379c:	48 89 53 30          	mov    %rdx,0x30(%rbx)
    37a0:	49 8b 54 24 38       	mov    0x38(%r12),%rdx
    37a5:	48 89 53 38          	mov    %rdx,0x38(%rbx)
    37a9:	49 8b 94 24 80 00 00 	mov    0x80(%r12),%rdx
    37b0:	00 
    37b1:	48 89 83 88 00 00 00 	mov    %rax,0x88(%rbx)
    37b8:	48 89 93 80 00 00 00 	mov    %rdx,0x80(%rbx)
    37bf:	49 8b 54 24 40       	mov    0x40(%r12),%rdx
    37c4:	48 89 53 40          	mov    %rdx,0x40(%rbx)
    37c8:	49 8b 54 24 48       	mov    0x48(%r12),%rdx
    37cd:	48 89 53 48          	mov    %rdx,0x48(%rbx)
    37d1:	49 8b 54 24 50       	mov    0x50(%r12),%rdx
    37d6:	48 89 53 50          	mov    %rdx,0x50(%rbx)
    37da:	49 8b 54 24 58       	mov    0x58(%r12),%rdx
    37df:	48 89 53 58          	mov    %rdx,0x58(%rbx)
    37e3:	49 8b 54 24 60       	mov    0x60(%r12),%rdx
    37e8:	48 89 53 60          	mov    %rdx,0x60(%rbx)
    37ec:	49 8b 54 24 68       	mov    0x68(%r12),%rdx
    37f1:	48 89 53 68          	mov    %rdx,0x68(%rbx)
    37f5:	49 8b 54 24 70       	mov    0x70(%r12),%rdx
    37fa:	48 89 53 70          	mov    %rdx,0x70(%rbx)
    37fe:	49 8b 54 24 78       	mov    0x78(%r12),%rdx
    3803:	48 89 53 78          	mov    %rdx,0x78(%rbx)
    3807:	49 89 8c 24 88 00 00 	mov    %rcx,0x88(%r12)
    380e:	00 
    380f:	4d 89 6c 24 20       	mov    %r13,0x20(%r12)
    3814:	49 89 1c 24          	mov    %rbx,(%r12)
    3818:	49 89 5c 24 38       	mov    %rbx,0x38(%r12)
    381d:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
    3821:	31 c0                	xor    %eax,%eax
    3823:	41 80 a4 24 a3 00 00 	andb   $0x7f,0xa3(%r12)
    382a:	00 7f 
    382c:	e9 29 fe ff ff       	jmpq   365a <trts_handle_exception+0x7a>
    3831:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
    3836:	0f 85 f0 fe ff ff    	jne    372c <trts_handle_exception+0x14c>
    383c:	48 83 c0 03          	add    $0x3,%rax
    3840:	49 83 8c 24 80 00 00 	orq    $0x1,0x80(%r12)
    3847:	00 01 
    3849:	49 89 84 24 88 00 00 	mov    %rax,0x88(%r12)
    3850:	00 
    3851:	31 c0                	xor    %eax,%eax
    3853:	e9 02 fe ff ff       	jmpq   365a <trts_handle_exception+0x7a>
    3858:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    385f:	00 

0000000000003860 <get_xfeature_state>:
    3860:	48 83 ec 08          	sub    $0x8,%rsp
    3864:	e8 97 4b 00 00       	callq  8400 <sgx_self_report>
    3869:	48 8b 40 38          	mov    0x38(%rax),%rax
    386d:	31 d2                	xor    %edx,%edx
    386f:	48 83 f8 03          	cmp    $0x3,%rax
    3873:	0f 95 c2             	setne  %dl
    3876:	89 15 28 98 00 00    	mov    %edx,0x9828(%rip)        # d0a4 <g_xsave_enabled>
    387c:	48 83 c4 08          	add    $0x8,%rsp
    3880:	c3                   	retq   
    3881:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3888:	00 00 00 
    388b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003890 <do_relocs>:
    3890:	48 01 fe             	add    %rdi,%rsi
    3893:	48 01 fa             	add    %rdi,%rdx
    3896:	48 85 c9             	test   %rcx,%rcx
    3899:	0f 84 42 02 00 00    	je     3ae1 <do_relocs+0x251>
    389f:	55                   	push   %rbp
    38a0:	4c 8d 15 61 57 00 00 	lea    0x5761(%rip),%r10        # 9008 <g_dyn_entry_table+0x8>
    38a7:	53                   	push   %rbx
    38a8:	45 31 c9             	xor    %r9d,%r9d
    38ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    38b0:	4c 8b 46 08          	mov    0x8(%rsi),%r8
    38b4:	4c 8b 1e             	mov    (%rsi),%r11
    38b7:	44 89 c0             	mov    %r8d,%eax
    38ba:	49 01 fb             	add    %rdi,%r11
    38bd:	48 83 f8 12          	cmp    $0x12,%rax
    38c1:	0f 87 cb 00 00 00    	ja     3992 <do_relocs+0x102>
    38c7:	49 63 04 82          	movslq (%r10,%rax,4),%rax
    38cb:	4c 01 d0             	add    %r10,%rax
    38ce:	ff e0                	jmpq   *%rax
    38d0:	48 8b 58 28          	mov    0x28(%rax),%rbx
    38d4:	48 8b 40 30          	mov    0x30(%rax),%rax
    38d8:	48 83 f8 01          	cmp    $0x1,%rax
    38dc:	76 0b                	jbe    38e9 <do_relocs+0x59>
    38de:	48 8d 5c 03 ff       	lea    -0x1(%rbx,%rax,1),%rbx
    38e3:	48 f7 d8             	neg    %rax
    38e6:	48 21 c3             	and    %rax,%rbx
    38e9:	48 85 db             	test   %rbx,%rbx
    38ec:	0f 84 a0 00 00 00    	je     3992 <do_relocs+0x102>
    38f2:	48 8b 46 10          	mov    0x10(%rsi),%rax
    38f6:	49 03 40 08          	add    0x8(%r8),%rax
    38fa:	48 29 d8             	sub    %rbx,%rax
    38fd:	49 89 03             	mov    %rax,(%r11)
    3900:	49 83 c1 01          	add    $0x1,%r9
    3904:	48 83 c6 18          	add    $0x18,%rsi
    3908:	4c 39 c9             	cmp    %r9,%rcx
    390b:	75 a3                	jne    38b0 <do_relocs+0x20>
    390d:	31 c0                	xor    %eax,%eax
    390f:	5b                   	pop    %rbx
    3910:	5d                   	pop    %rbp
    3911:	c3                   	retq   
    3912:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3918:	49 c1 e8 20          	shr    $0x20,%r8
    391c:	4b 8d 04 40          	lea    (%r8,%r8,2),%rax
    3920:	4c 8d 04 c2          	lea    (%rdx,%rax,8),%r8
    3924:	41 0f b6 40 04       	movzbl 0x4(%r8),%eax
    3929:	c0 e8 04             	shr    $0x4,%al
    392c:	3c 02                	cmp    $0x2,%al
    392e:	0f 84 44 01 00 00    	je     3a78 <do_relocs+0x1e8>
    3934:	4d 85 c0             	test   %r8,%r8
    3937:	74 c7                	je     3900 <do_relocs+0x70>
    3939:	81 3f 7f 45 4c 46    	cmpl   $0x464c457f,(%rdi)
    393f:	75 51                	jne    3992 <do_relocs+0x102>
    3941:	66 83 7f 10 03       	cmpw   $0x3,0x10(%rdi)
    3946:	75 4a                	jne    3992 <do_relocs+0x102>
    3948:	48 8b 5f 20          	mov    0x20(%rdi),%rbx
    394c:	48 01 fb             	add    %rdi,%rbx
    394f:	48 85 db             	test   %rbx,%rbx
    3952:	48 89 d8             	mov    %rbx,%rax
    3955:	74 3b                	je     3992 <do_relocs+0x102>
    3957:	0f b7 6f 38          	movzwl 0x38(%rdi),%ebp
    395b:	85 ed                	test   %ebp,%ebp
    395d:	74 33                	je     3992 <do_relocs+0x102>
    395f:	83 3b 07             	cmpl   $0x7,(%rbx)
    3962:	0f 84 68 ff ff ff    	je     38d0 <do_relocs+0x40>
    3968:	83 ed 01             	sub    $0x1,%ebp
    396b:	48 8d 1c ed 00 00 00 	lea    0x0(,%rbp,8),%rbx
    3972:	00 
    3973:	48 29 eb             	sub    %rbp,%rbx
    3976:	48 8d 5c d8 38       	lea    0x38(%rax,%rbx,8),%rbx
    397b:	eb 0c                	jmp    3989 <do_relocs+0xf9>
    397d:	0f 1f 00             	nopl   (%rax)
    3980:	83 38 07             	cmpl   $0x7,(%rax)
    3983:	0f 84 47 ff ff ff    	je     38d0 <do_relocs+0x40>
    3989:	48 83 c0 38          	add    $0x38,%rax
    398d:	48 39 c3             	cmp    %rax,%rbx
    3990:	75 ee                	jne    3980 <do_relocs+0xf0>
    3992:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3997:	5b                   	pop    %rbx
    3998:	5d                   	pop    %rbp
    3999:	c3                   	retq   
    399a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    39a0:	49 c1 e8 20          	shr    $0x20,%r8
    39a4:	4b 8d 04 40          	lea    (%r8,%r8,2),%rax
    39a8:	4c 8d 04 c2          	lea    (%rdx,%rax,8),%r8
    39ac:	41 0f b6 40 04       	movzbl 0x4(%r8),%eax
    39b1:	c0 e8 04             	shr    $0x4,%al
    39b4:	3c 02                	cmp    $0x2,%al
    39b6:	0f 84 04 01 00 00    	je     3ac0 <do_relocs+0x230>
    39bc:	4d 85 c0             	test   %r8,%r8
    39bf:	0f 84 3b ff ff ff    	je     3900 <do_relocs+0x70>
    39c5:	48 8b 46 10          	mov    0x10(%rsi),%rax
    39c9:	49 03 40 08          	add    0x8(%r8),%rax
    39cd:	49 83 c1 01          	add    $0x1,%r9
    39d1:	48 83 c6 18          	add    $0x18,%rsi
    39d5:	4c 39 c9             	cmp    %r9,%rcx
    39d8:	49 89 03             	mov    %rax,(%r11)
    39db:	0f 85 cf fe ff ff    	jne    38b0 <do_relocs+0x20>
    39e1:	e9 27 ff ff ff       	jmpq   390d <do_relocs+0x7d>
    39e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    39ed:	00 00 00 
    39f0:	49 83 c1 01          	add    $0x1,%r9
    39f4:	48 83 c6 18          	add    $0x18,%rsi
    39f8:	49 c7 03 01 00 00 00 	movq   $0x1,(%r11)
    39ff:	4c 39 c9             	cmp    %r9,%rcx
    3a02:	0f 85 a8 fe ff ff    	jne    38b0 <do_relocs+0x20>
    3a08:	e9 00 ff ff ff       	jmpq   390d <do_relocs+0x7d>
    3a0d:	0f 1f 00             	nopl   (%rax)
    3a10:	48 8b 46 10          	mov    0x10(%rsi),%rax
    3a14:	49 83 c1 01          	add    $0x1,%r9
    3a18:	48 83 c6 18          	add    $0x18,%rsi
    3a1c:	48 01 f8             	add    %rdi,%rax
    3a1f:	4c 39 c9             	cmp    %r9,%rcx
    3a22:	49 89 03             	mov    %rax,(%r11)
    3a25:	0f 85 85 fe ff ff    	jne    38b0 <do_relocs+0x20>
    3a2b:	e9 dd fe ff ff       	jmpq   390d <do_relocs+0x7d>
    3a30:	49 c1 e8 20          	shr    $0x20,%r8
    3a34:	4b 8d 04 40          	lea    (%r8,%r8,2),%rax
    3a38:	4c 8d 04 c2          	lea    (%rdx,%rax,8),%r8
    3a3c:	41 0f b6 40 04       	movzbl 0x4(%r8),%eax
    3a41:	c0 e8 04             	shr    $0x4,%al
    3a44:	3c 02                	cmp    $0x2,%al
    3a46:	74 58                	je     3aa0 <do_relocs+0x210>
    3a48:	4d 85 c0             	test   %r8,%r8
    3a4b:	0f 84 af fe ff ff    	je     3900 <do_relocs+0x70>
    3a51:	48 8b 46 10          	mov    0x10(%rsi),%rax
    3a55:	49 83 c1 01          	add    $0x1,%r9
    3a59:	48 83 c6 18          	add    $0x18,%rsi
    3a5d:	48 01 f8             	add    %rdi,%rax
    3a60:	49 03 40 08          	add    0x8(%r8),%rax
    3a64:	4c 39 c9             	cmp    %r9,%rcx
    3a67:	49 89 03             	mov    %rax,(%r11)
    3a6a:	0f 85 40 fe ff ff    	jne    38b0 <do_relocs+0x20>
    3a70:	e9 98 fe ff ff       	jmpq   390d <do_relocs+0x7d>
    3a75:	0f 1f 00             	nopl   (%rax)
    3a78:	49 83 78 08 00       	cmpq   $0x0,0x8(%r8)
    3a7d:	0f 85 b1 fe ff ff    	jne    3934 <do_relocs+0xa4>
    3a83:	49 83 c1 01          	add    $0x1,%r9
    3a87:	48 83 c6 18          	add    $0x18,%rsi
    3a8b:	4c 39 c9             	cmp    %r9,%rcx
    3a8e:	0f 85 1c fe ff ff    	jne    38b0 <do_relocs+0x20>
    3a94:	e9 74 fe ff ff       	jmpq   390d <do_relocs+0x7d>
    3a99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3aa0:	49 83 78 08 00       	cmpq   $0x0,0x8(%r8)
    3aa5:	75 a1                	jne    3a48 <do_relocs+0x1b8>
    3aa7:	49 83 c1 01          	add    $0x1,%r9
    3aab:	48 83 c6 18          	add    $0x18,%rsi
    3aaf:	4c 39 c9             	cmp    %r9,%rcx
    3ab2:	0f 85 f8 fd ff ff    	jne    38b0 <do_relocs+0x20>
    3ab8:	e9 50 fe ff ff       	jmpq   390d <do_relocs+0x7d>
    3abd:	0f 1f 00             	nopl   (%rax)
    3ac0:	49 83 78 08 00       	cmpq   $0x0,0x8(%r8)
    3ac5:	0f 85 f1 fe ff ff    	jne    39bc <do_relocs+0x12c>
    3acb:	49 83 c1 01          	add    $0x1,%r9
    3acf:	48 83 c6 18          	add    $0x18,%rsi
    3ad3:	4c 39 c9             	cmp    %r9,%rcx
    3ad6:	0f 85 d4 fd ff ff    	jne    38b0 <do_relocs+0x20>
    3adc:	e9 2c fe ff ff       	jmpq   390d <do_relocs+0x7d>
    3ae1:	31 c0                	xor    %eax,%eax
    3ae3:	c3                   	retq   
    3ae4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3aeb:	00 00 00 
    3aee:	66 90                	xchg   %ax,%ax

0000000000003af0 <relocate_enclave>:
    3af0:	48 85 ff             	test   %rdi,%rdi
    3af3:	0f 84 c0 01 00 00    	je     3cb9 <relocate_enclave+0x1c9>
    3af9:	81 3f 7f 45 4c 46    	cmpl   $0x464c457f,(%rdi)
    3aff:	0f 85 b4 01 00 00    	jne    3cb9 <relocate_enclave+0x1c9>
    3b05:	66 83 7f 10 03       	cmpw   $0x3,0x10(%rdi)
    3b0a:	0f 85 a9 01 00 00    	jne    3cb9 <relocate_enclave+0x1c9>
    3b10:	41 57                	push   %r15
    3b12:	41 56                	push   %r14
    3b14:	41 55                	push   %r13
    3b16:	41 54                	push   %r12
    3b18:	55                   	push   %rbp
    3b19:	53                   	push   %rbx
    3b1a:	48 89 fb             	mov    %rdi,%rbx
    3b1d:	48 83 ec 10          	sub    $0x10,%rsp
    3b21:	48 03 5f 20          	add    0x20(%rdi),%rbx
    3b25:	0f 84 ff 00 00 00    	je     3c2a <relocate_enclave+0x13a>
    3b2b:	31 ed                	xor    %ebp,%ebp
    3b2d:	66 83 7f 38 00       	cmpw   $0x0,0x38(%rdi)
    3b32:	49 89 fd             	mov    %rdi,%r13
    3b35:	4c 8d 25 18 55 00 00 	lea    0x5518(%rip),%r12        # 9054 <g_dyn_entry_table+0x54>
    3b3c:	75 1e                	jne    3b5c <relocate_enclave+0x6c>
    3b3e:	e9 65 01 00 00       	jmpq   3ca8 <relocate_enclave+0x1b8>
    3b43:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3b48:	41 0f b7 45 38       	movzwl 0x38(%r13),%eax
    3b4d:	83 c5 01             	add    $0x1,%ebp
    3b50:	48 83 c3 38          	add    $0x38,%rbx
    3b54:	39 e8                	cmp    %ebp,%eax
    3b56:	0f 86 4c 01 00 00    	jbe    3ca8 <relocate_enclave+0x1b8>
    3b5c:	83 3b 02             	cmpl   $0x2,(%rbx)
    3b5f:	75 e7                	jne    3b48 <relocate_enclave+0x58>
    3b61:	48 8b 53 20          	mov    0x20(%rbx),%rdx
    3b65:	48 8b 43 18          	mov    0x18(%rbx),%rax
    3b69:	48 c1 ea 04          	shr    $0x4,%rdx
    3b6d:	4c 01 e8             	add    %r13,%rax
    3b70:	48 85 d2             	test   %rdx,%rdx
    3b73:	49 89 c0             	mov    %rax,%r8
    3b76:	74 d0                	je     3b48 <relocate_enclave+0x58>
    3b78:	4c 8b 08             	mov    (%rax),%r9
    3b7b:	4d 85 c9             	test   %r9,%r9
    3b7e:	74 c8                	je     3b48 <relocate_enclave+0x58>
    3b80:	48 c1 e2 04          	shl    $0x4,%rdx
    3b84:	45 31 ff             	xor    %r15d,%r15d
    3b87:	45 31 f6             	xor    %r14d,%r14d
    3b8a:	48 01 c2             	add    %rax,%rdx
    3b8d:	45 31 d2             	xor    %r10d,%r10d
    3b90:	31 c0                	xor    %eax,%eax
    3b92:	31 f6                	xor    %esi,%esi
    3b94:	45 31 db             	xor    %r11d,%r11d
    3b97:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    3b9e:	00 00 
    3ba0:	49 83 f9 17          	cmp    $0x17,%r9
    3ba4:	77 12                	ja     3bb8 <relocate_enclave+0xc8>
    3ba6:	4b 63 3c 8c          	movslq (%r12,%r9,4),%rdi
    3baa:	4c 01 e7             	add    %r12,%rdi
    3bad:	ff e7                	jmpq   *%rdi
    3baf:	90                   	nop
    3bb0:	4d 8b 50 08          	mov    0x8(%r8),%r10
    3bb4:	0f 1f 40 00          	nopl   0x0(%rax)
    3bb8:	49 83 c0 10          	add    $0x10,%r8
    3bbc:	49 39 d0             	cmp    %rdx,%r8
    3bbf:	74 08                	je     3bc9 <relocate_enclave+0xd9>
    3bc1:	4d 8b 08             	mov    (%r8),%r9
    3bc4:	4d 85 c9             	test   %r9,%r9
    3bc7:	75 d7                	jne    3ba0 <relocate_enclave+0xb0>
    3bc9:	48 85 f6             	test   %rsi,%rsi
    3bcc:	0f 84 be 00 00 00    	je     3c90 <relocate_enclave+0x1a0>
    3bd2:	4d 85 f6             	test   %r14,%r14
    3bd5:	4c 89 14 24          	mov    %r10,(%rsp)
    3bd9:	74 4f                	je     3c2a <relocate_enclave+0x13a>
    3bdb:	31 d2                	xor    %edx,%edx
    3bdd:	4c 89 ef             	mov    %r13,%rdi
    3be0:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
    3be5:	49 f7 f6             	div    %r14
    3be8:	4c 89 da             	mov    %r11,%rdx
    3beb:	48 89 c1             	mov    %rax,%rcx
    3bee:	e8 9d fc ff ff       	callq  3890 <do_relocs>
    3bf3:	85 c0                	test   %eax,%eax
    3bf5:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
    3bfa:	4c 8b 14 24          	mov    (%rsp),%r10
    3bfe:	75 2a                	jne    3c2a <relocate_enclave+0x13a>
    3c00:	4d 85 d2             	test   %r10,%r10
    3c03:	0f 84 3f ff ff ff    	je     3b48 <relocate_enclave+0x58>
    3c09:	31 d2                	xor    %edx,%edx
    3c0b:	4c 89 f8             	mov    %r15,%rax
    3c0e:	4c 89 d6             	mov    %r10,%rsi
    3c11:	49 f7 f6             	div    %r14
    3c14:	4c 89 ef             	mov    %r13,%rdi
    3c17:	4c 89 da             	mov    %r11,%rdx
    3c1a:	48 89 c1             	mov    %rax,%rcx
    3c1d:	e8 6e fc ff ff       	callq  3890 <do_relocs>
    3c22:	85 c0                	test   %eax,%eax
    3c24:	0f 84 1e ff ff ff    	je     3b48 <relocate_enclave+0x58>
    3c2a:	48 83 c4 10          	add    $0x10,%rsp
    3c2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3c33:	5b                   	pop    %rbx
    3c34:	5d                   	pop    %rbp
    3c35:	41 5c                	pop    %r12
    3c37:	41 5d                	pop    %r13
    3c39:	41 5e                	pop    %r14
    3c3b:	41 5f                	pop    %r15
    3c3d:	c3                   	retq   
    3c3e:	66 90                	xchg   %ax,%ax
    3c40:	4d 8b 58 08          	mov    0x8(%r8),%r11
    3c44:	e9 6f ff ff ff       	jmpq   3bb8 <relocate_enclave+0xc8>
    3c49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3c50:	4d 8b 78 08          	mov    0x8(%r8),%r15
    3c54:	e9 5f ff ff ff       	jmpq   3bb8 <relocate_enclave+0xc8>
    3c59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3c60:	49 8b 40 08          	mov    0x8(%r8),%rax
    3c64:	e9 4f ff ff ff       	jmpq   3bb8 <relocate_enclave+0xc8>
    3c69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3c70:	49 8b 70 08          	mov    0x8(%r8),%rsi
    3c74:	e9 3f ff ff ff       	jmpq   3bb8 <relocate_enclave+0xc8>
    3c79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3c80:	4d 8b 70 08          	mov    0x8(%r8),%r14
    3c84:	e9 2f ff ff ff       	jmpq   3bb8 <relocate_enclave+0xc8>
    3c89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3c90:	4d 85 d2             	test   %r10,%r10
    3c93:	0f 84 af fe ff ff    	je     3b48 <relocate_enclave+0x58>
    3c99:	4d 85 f6             	test   %r14,%r14
    3c9c:	0f 85 67 ff ff ff    	jne    3c09 <relocate_enclave+0x119>
    3ca2:	eb 86                	jmp    3c2a <relocate_enclave+0x13a>
    3ca4:	0f 1f 40 00          	nopl   0x0(%rax)
    3ca8:	48 83 c4 10          	add    $0x10,%rsp
    3cac:	31 c0                	xor    %eax,%eax
    3cae:	5b                   	pop    %rbx
    3caf:	5d                   	pop    %rbp
    3cb0:	41 5c                	pop    %r12
    3cb2:	41 5d                	pop    %r13
    3cb4:	41 5e                	pop    %r14
    3cb6:	41 5f                	pop    %r15
    3cb8:	c3                   	retq   
    3cb9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3cbe:	c3                   	retq   
    3cbf:	90                   	nop

0000000000003cc0 <elf_tls_info>:
    3cc0:	48 85 ff             	test   %rdi,%rdi
    3cc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3cc8:	74 08                	je     3cd2 <elf_tls_info+0x12>
    3cca:	81 3f 7f 45 4c 46    	cmpl   $0x464c457f,(%rdi)
    3cd0:	74 06                	je     3cd8 <elf_tls_info+0x18>
    3cd2:	f3 c3                	repz retq 
    3cd4:	0f 1f 40 00          	nopl   0x0(%rax)
    3cd8:	66 83 7f 10 03       	cmpw   $0x3,0x10(%rdi)
    3cdd:	75 f3                	jne    3cd2 <elf_tls_info+0x12>
    3cdf:	48 8b 47 20          	mov    0x20(%rdi),%rax
    3ce3:	48 01 f8             	add    %rdi,%rax
    3ce6:	48 85 f6             	test   %rsi,%rsi
    3ce9:	41 0f 94 c0          	sete   %r8b
    3ced:	48 85 d2             	test   %rdx,%rdx
    3cf0:	0f 94 c1             	sete   %cl
    3cf3:	41 08 c8             	or     %cl,%r8b
    3cf6:	75 61                	jne    3d59 <elf_tls_info+0x99>
    3cf8:	48 85 c0             	test   %rax,%rax
    3cfb:	74 5c                	je     3d59 <elf_tls_info+0x99>
    3cfd:	0f b7 4f 38          	movzwl 0x38(%rdi),%ecx
    3d01:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
    3d08:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
    3d0f:	85 c9                	test   %ecx,%ecx
    3d11:	74 2b                	je     3d3e <elf_tls_info+0x7e>
    3d13:	83 38 07             	cmpl   $0x7,(%rax)
    3d16:	74 30                	je     3d48 <elf_tls_info+0x88>
    3d18:	44 8d 41 ff          	lea    -0x1(%rcx),%r8d
    3d1c:	4a 8d 0c c5 00 00 00 	lea    0x0(,%r8,8),%rcx
    3d23:	00 
    3d24:	4c 29 c1             	sub    %r8,%rcx
    3d27:	48 8d 4c c8 38       	lea    0x38(%rax,%rcx,8),%rcx
    3d2c:	eb 07                	jmp    3d35 <elf_tls_info+0x75>
    3d2e:	66 90                	xchg   %ax,%ax
    3d30:	83 38 07             	cmpl   $0x7,(%rax)
    3d33:	74 13                	je     3d48 <elf_tls_info+0x88>
    3d35:	48 83 c0 38          	add    $0x38,%rax
    3d39:	48 39 c8             	cmp    %rcx,%rax
    3d3c:	75 f2                	jne    3d30 <elf_tls_info+0x70>
    3d3e:	31 c0                	xor    %eax,%eax
    3d40:	c3                   	retq   
    3d41:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3d48:	48 03 78 10          	add    0x10(%rax),%rdi
    3d4c:	48 89 3e             	mov    %rdi,(%rsi)
    3d4f:	48 8b 40 20          	mov    0x20(%rax),%rax
    3d53:	48 89 02             	mov    %rax,(%rdx)
    3d56:	31 c0                	xor    %eax,%eax
    3d58:	c3                   	retq   
    3d59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3d5e:	c3                   	retq   
    3d5f:	90                   	nop

0000000000003d60 <elf_get_init_array>:
    3d60:	48 85 ff             	test   %rdi,%rdi
    3d63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3d68:	74 08                	je     3d72 <elf_get_init_array+0x12>
    3d6a:	81 3f 7f 45 4c 46    	cmpl   $0x464c457f,(%rdi)
    3d70:	74 06                	je     3d78 <elf_get_init_array+0x18>
    3d72:	f3 c3                	repz retq 
    3d74:	0f 1f 40 00          	nopl   0x0(%rax)
    3d78:	66 83 7f 10 03       	cmpw   $0x3,0x10(%rdi)
    3d7d:	75 f3                	jne    3d72 <elf_get_init_array+0x12>
    3d7f:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
    3d83:	48 01 f9             	add    %rdi,%rcx
    3d86:	48 85 f6             	test   %rsi,%rsi
    3d89:	41 0f 94 c0          	sete   %r8b
    3d8d:	48 85 d2             	test   %rdx,%rdx
    3d90:	0f 94 c0             	sete   %al
    3d93:	41 08 c0             	or     %al,%r8b
    3d96:	0f 85 97 00 00 00    	jne    3e33 <elf_get_init_array+0xd3>
    3d9c:	48 85 c9             	test   %rcx,%rcx
    3d9f:	0f 84 8e 00 00 00    	je     3e33 <elf_get_init_array+0xd3>
    3da5:	0f b7 47 38          	movzwl 0x38(%rdi),%eax
    3da9:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
    3db0:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
    3db7:	85 c0                	test   %eax,%eax
    3db9:	74 75                	je     3e30 <elf_get_init_array+0xd0>
    3dbb:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
    3dbf:	4a 8d 04 c5 00 00 00 	lea    0x0(,%r8,8),%rax
    3dc6:	00 
    3dc7:	4c 29 c0             	sub    %r8,%rax
    3dca:	4c 8d 54 c1 38       	lea    0x38(%rcx,%rax,8),%r10
    3dcf:	eb 10                	jmp    3de1 <elf_get_init_array+0x81>
    3dd1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3dd8:	48 83 c1 38          	add    $0x38,%rcx
    3ddc:	4c 39 d1             	cmp    %r10,%rcx
    3ddf:	74 4f                	je     3e30 <elf_get_init_array+0xd0>
    3de1:	83 39 02             	cmpl   $0x2,(%rcx)
    3de4:	75 f2                	jne    3dd8 <elf_get_init_array+0x78>
    3de6:	4c 8b 49 20          	mov    0x20(%rcx),%r9
    3dea:	48 8b 41 18          	mov    0x18(%rcx),%rax
    3dee:	49 c1 e9 04          	shr    $0x4,%r9
    3df2:	48 01 f8             	add    %rdi,%rax
    3df5:	4d 85 c9             	test   %r9,%r9
    3df8:	74 de                	je     3dd8 <elf_get_init_array+0x78>
    3dfa:	49 c1 e1 04          	shl    $0x4,%r9
    3dfe:	49 01 c1             	add    %rax,%r9
    3e01:	eb 1b                	jmp    3e1e <elf_get_init_array+0xbe>
    3e03:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3e08:	49 83 f8 1b          	cmp    $0x1b,%r8
    3e0c:	75 07                	jne    3e15 <elf_get_init_array+0xb5>
    3e0e:	4c 8b 40 08          	mov    0x8(%rax),%r8
    3e12:	4c 89 02             	mov    %r8,(%rdx)
    3e15:	48 83 c0 10          	add    $0x10,%rax
    3e19:	49 39 c1             	cmp    %rax,%r9
    3e1c:	74 ba                	je     3dd8 <elf_get_init_array+0x78>
    3e1e:	4c 8b 00             	mov    (%rax),%r8
    3e21:	49 83 f8 19          	cmp    $0x19,%r8
    3e25:	75 e1                	jne    3e08 <elf_get_init_array+0xa8>
    3e27:	4c 8b 40 08          	mov    0x8(%rax),%r8
    3e2b:	4c 89 06             	mov    %r8,(%rsi)
    3e2e:	eb e5                	jmp    3e15 <elf_get_init_array+0xb5>
    3e30:	31 c0                	xor    %eax,%eax
    3e32:	c3                   	retq   
    3e33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3e38:	c3                   	retq   
    3e39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003e40 <elf_get_uninit_array>:
    3e40:	48 85 ff             	test   %rdi,%rdi
    3e43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3e48:	74 08                	je     3e52 <elf_get_uninit_array+0x12>
    3e4a:	81 3f 7f 45 4c 46    	cmpl   $0x464c457f,(%rdi)
    3e50:	74 06                	je     3e58 <elf_get_uninit_array+0x18>
    3e52:	f3 c3                	repz retq 
    3e54:	0f 1f 40 00          	nopl   0x0(%rax)
    3e58:	66 83 7f 10 03       	cmpw   $0x3,0x10(%rdi)
    3e5d:	75 f3                	jne    3e52 <elf_get_uninit_array+0x12>
    3e5f:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
    3e63:	48 01 f9             	add    %rdi,%rcx
    3e66:	48 85 f6             	test   %rsi,%rsi
    3e69:	41 0f 94 c0          	sete   %r8b
    3e6d:	48 85 d2             	test   %rdx,%rdx
    3e70:	0f 94 c0             	sete   %al
    3e73:	41 08 c0             	or     %al,%r8b
    3e76:	0f 85 97 00 00 00    	jne    3f13 <elf_get_uninit_array+0xd3>
    3e7c:	48 85 c9             	test   %rcx,%rcx
    3e7f:	0f 84 8e 00 00 00    	je     3f13 <elf_get_uninit_array+0xd3>
    3e85:	0f b7 47 38          	movzwl 0x38(%rdi),%eax
    3e89:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
    3e90:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
    3e97:	85 c0                	test   %eax,%eax
    3e99:	74 75                	je     3f10 <elf_get_uninit_array+0xd0>
    3e9b:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
    3e9f:	4a 8d 04 c5 00 00 00 	lea    0x0(,%r8,8),%rax
    3ea6:	00 
    3ea7:	4c 29 c0             	sub    %r8,%rax
    3eaa:	4c 8d 54 c1 38       	lea    0x38(%rcx,%rax,8),%r10
    3eaf:	eb 10                	jmp    3ec1 <elf_get_uninit_array+0x81>
    3eb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3eb8:	48 83 c1 38          	add    $0x38,%rcx
    3ebc:	4c 39 d1             	cmp    %r10,%rcx
    3ebf:	74 4f                	je     3f10 <elf_get_uninit_array+0xd0>
    3ec1:	83 39 02             	cmpl   $0x2,(%rcx)
    3ec4:	75 f2                	jne    3eb8 <elf_get_uninit_array+0x78>
    3ec6:	4c 8b 49 20          	mov    0x20(%rcx),%r9
    3eca:	48 8b 41 18          	mov    0x18(%rcx),%rax
    3ece:	49 c1 e9 04          	shr    $0x4,%r9
    3ed2:	48 01 f8             	add    %rdi,%rax
    3ed5:	4d 85 c9             	test   %r9,%r9
    3ed8:	74 de                	je     3eb8 <elf_get_uninit_array+0x78>
    3eda:	49 c1 e1 04          	shl    $0x4,%r9
    3ede:	49 01 c1             	add    %rax,%r9
    3ee1:	eb 1b                	jmp    3efe <elf_get_uninit_array+0xbe>
    3ee3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3ee8:	49 83 f8 1c          	cmp    $0x1c,%r8
    3eec:	75 07                	jne    3ef5 <elf_get_uninit_array+0xb5>
    3eee:	4c 8b 40 08          	mov    0x8(%rax),%r8
    3ef2:	4c 89 02             	mov    %r8,(%rdx)
    3ef5:	48 83 c0 10          	add    $0x10,%rax
    3ef9:	49 39 c1             	cmp    %rax,%r9
    3efc:	74 ba                	je     3eb8 <elf_get_uninit_array+0x78>
    3efe:	4c 8b 00             	mov    (%rax),%r8
    3f01:	49 83 f8 1a          	cmp    $0x1a,%r8
    3f05:	75 e1                	jne    3ee8 <elf_get_uninit_array+0xa8>
    3f07:	4c 8b 40 08          	mov    0x8(%rax),%r8
    3f0b:	4c 89 06             	mov    %r8,(%rsi)
    3f0e:	eb e5                	jmp    3ef5 <elf_get_uninit_array+0xb5>
    3f10:	31 c0                	xor    %eax,%eax
    3f12:	c3                   	retq   
    3f13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3f18:	c3                   	retq   
    3f19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003f20 <change_protection>:
    3f20:	48 85 ff             	test   %rdi,%rdi
    3f23:	b8 01 00 00 00       	mov    $0x1,%eax
    3f28:	0f 84 02 01 00 00    	je     4030 <change_protection+0x110>
    3f2e:	81 3f 7f 45 4c 46    	cmpl   $0x464c457f,(%rdi)
    3f34:	74 0a                	je     3f40 <change_protection+0x20>
    3f36:	f3 c3                	repz retq 
    3f38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    3f3f:	00 
    3f40:	66 83 7f 10 03       	cmpw   $0x3,0x10(%rdi)
    3f45:	75 ef                	jne    3f36 <change_protection+0x16>
    3f47:	41 56                	push   %r14
    3f49:	41 55                	push   %r13
    3f4b:	41 54                	push   %r12
    3f4d:	55                   	push   %rbp
    3f4e:	53                   	push   %rbx
    3f4f:	48 89 fb             	mov    %rdi,%rbx
    3f52:	48 03 5f 20          	add    0x20(%rdi),%rbx
    3f56:	0f 84 cb 00 00 00    	je     4027 <change_protection+0x107>
    3f5c:	0f b7 47 38          	movzwl 0x38(%rdi),%eax
    3f60:	49 89 fc             	mov    %rdi,%r12
    3f63:	85 c0                	test   %eax,%eax
    3f65:	0f 84 25 01 00 00    	je     4090 <change_protection+0x170>
    3f6b:	83 3b 02             	cmpl   $0x2,(%rbx)
    3f6e:	0f 84 ab 01 00 00    	je     411f <change_protection+0x1ff>
    3f74:	8d 50 ff             	lea    -0x1(%rax),%edx
    3f77:	48 8d 04 d5 00 00 00 	lea    0x0(,%rdx,8),%rax
    3f7e:	00 
    3f7f:	48 29 d0             	sub    %rdx,%rax
    3f82:	48 8d 54 c3 38       	lea    0x38(%rbx,%rax,8),%rdx
    3f87:	48 89 d8             	mov    %rbx,%rax
    3f8a:	eb 0d                	jmp    3f99 <change_protection+0x79>
    3f8c:	0f 1f 40 00          	nopl   0x0(%rax)
    3f90:	83 38 02             	cmpl   $0x2,(%rax)
    3f93:	0f 84 8f 01 00 00    	je     4128 <change_protection+0x208>
    3f99:	48 83 c0 38          	add    $0x38,%rax
    3f9d:	48 39 d0             	cmp    %rdx,%rax
    3fa0:	75 ee                	jne    3f90 <change_protection+0x70>
    3fa2:	45 31 f6             	xor    %r14d,%r14d
    3fa5:	45 31 ed             	xor    %r13d,%r13d
    3fa8:	48 bd ff ff ff ff 02 	movabs $0x2ffffffff,%rbp
    3faf:	00 00 00 
    3fb2:	eb 1b                	jmp    3fcf <change_protection+0xaf>
    3fb4:	0f 1f 40 00          	nopl   0x0(%rax)
    3fb8:	41 0f b7 44 24 38    	movzwl 0x38(%r12),%eax
    3fbe:	41 83 c5 01          	add    $0x1,%r13d
    3fc2:	48 83 c3 38          	add    $0x38,%rbx
    3fc6:	44 39 e8             	cmp    %r13d,%eax
    3fc9:	0f 86 c1 00 00 00    	jbe    4090 <change_protection+0x170>
    3fcf:	45 85 f6             	test   %r14d,%r14d
    3fd2:	74 0c                	je     3fe0 <change_protection+0xc0>
    3fd4:	48 8b 03             	mov    (%rbx),%rax
    3fd7:	48 21 e8             	and    %rbp,%rax
    3fda:	48 83 f8 01          	cmp    $0x1,%rax
    3fde:	74 58                	je     4038 <change_protection+0x118>
    3fe0:	81 3b 52 e5 74 64    	cmpl   $0x6474e552,(%rbx)
    3fe6:	75 d0                	jne    3fb8 <change_protection+0x98>
    3fe8:	48 8b 43 10          	mov    0x10(%rbx),%rax
    3fec:	48 89 c7             	mov    %rax,%rdi
    3fef:	48 03 43 28          	add    0x28(%rbx),%rax
    3ff3:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
    3ffa:	4c 01 e7             	add    %r12,%rdi
    3ffd:	48 89 c6             	mov    %rax,%rsi
    4000:	48 81 c6 ff 0f 00 00 	add    $0xfff,%rsi
    4007:	48 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%rsi
    400e:	4c 01 e6             	add    %r12,%rsi
    4011:	48 39 f7             	cmp    %rsi,%rdi
    4014:	74 a2                	je     3fb8 <change_protection+0x98>
    4016:	48 29 fe             	sub    %rdi,%rsi
    4019:	ba 01 00 00 00       	mov    $0x1,%edx
    401e:	e8 8d eb ff ff       	callq  2bb0 <trts_mprotect>
    4023:	85 c0                	test   %eax,%eax
    4025:	74 91                	je     3fb8 <change_protection+0x98>
    4027:	5b                   	pop    %rbx
    4028:	5d                   	pop    %rbp
    4029:	41 5c                	pop    %r12
    402b:	41 5d                	pop    %r13
    402d:	41 5e                	pop    %r14
    402f:	c3                   	retq   
    4030:	f3 c3                	repz retq 
    4032:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4038:	48 8b 43 10          	mov    0x10(%rbx),%rax
    403c:	8b 7b 04             	mov    0x4(%rbx),%edi
    403f:	48 89 c1             	mov    %rax,%rcx
    4042:	48 03 43 28          	add    0x28(%rbx),%rax
    4046:	89 fa                	mov    %edi,%edx
    4048:	c1 ea 02             	shr    $0x2,%edx
    404b:	48 81 e1 00 f0 ff ff 	and    $0xfffffffffffff000,%rcx
    4052:	83 e2 01             	and    $0x1,%edx
    4055:	48 89 c6             	mov    %rax,%rsi
    4058:	48 89 d0             	mov    %rdx,%rax
    405b:	48 81 c6 ff 0f 00 00 	add    $0xfff,%rsi
    4062:	48 83 c8 04          	or     $0x4,%rax
    4066:	48 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%rsi
    406d:	83 e7 01             	and    $0x1,%edi
    4070:	49 8d 3c 0c          	lea    (%r12,%rcx,1),%rdi
    4074:	48 0f 45 d0          	cmovne %rax,%rdx
    4078:	48 29 ce             	sub    %rcx,%rsi
    407b:	e8 30 eb ff ff       	callq  2bb0 <trts_mprotect>
    4080:	85 c0                	test   %eax,%eax
    4082:	0f 84 58 ff ff ff    	je     3fe0 <change_protection+0xc0>
    4088:	eb 9d                	jmp    4027 <change_protection+0x107>
    408a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4090:	8b 05 5a 51 00 00    	mov    0x515a(%rip),%eax        # 91f0 <g_global_data+0x130>
    4096:	31 c9                	xor    %ecx,%ecx
    4098:	48 8d 3d 21 50 00 00 	lea    0x5021(%rip),%rdi        # 90c0 <g_global_data>
    409f:	85 c0                	test   %eax,%eax
    40a1:	75 12                	jne    40b5 <change_protection+0x195>
    40a3:	eb 82                	jmp    4027 <change_protection+0x107>
    40a5:	0f 1f 00             	nopl   (%rax)
    40a8:	8b 05 42 51 00 00    	mov    0x5142(%rip),%eax        # 91f0 <g_global_data+0x130>
    40ae:	83 c1 01             	add    $0x1,%ecx
    40b1:	39 c8                	cmp    %ecx,%eax
    40b3:	76 63                	jbe    4118 <change_protection+0x1f8>
    40b5:	89 c8                	mov    %ecx,%eax
    40b7:	48 89 c2             	mov    %rax,%rdx
    40ba:	48 c1 e2 05          	shl    $0x5,%rdx
    40be:	48 01 fa             	add    %rdi,%rdx
    40c1:	0f b7 b2 38 01 00 00 	movzwl 0x138(%rdx),%esi
    40c8:	66 83 fe 14          	cmp    $0x14,%si
    40cc:	75 da                	jne    40a8 <change_protection+0x188>
    40ce:	48 83 c0 0a          	add    $0xa,%rax
    40d2:	48 c1 e0 05          	shl    $0x5,%rax
    40d6:	48 01 f8             	add    %rdi,%rax
    40d9:	48 8b 40 10          	mov    0x10(%rax),%rax
    40dd:	48 3d 07 02 00 00    	cmp    $0x207,%rax
    40e3:	75 c3                	jne    40a8 <change_protection+0x188>
    40e5:	8b 82 3c 01 00 00    	mov    0x13c(%rdx),%eax
    40eb:	85 c0                	test   %eax,%eax
    40ed:	74 b9                	je     40a8 <change_protection+0x188>
    40ef:	8b b2 3c 01 00 00    	mov    0x13c(%rdx),%esi
    40f5:	48 8b ba 40 01 00 00 	mov    0x140(%rdx),%rdi
    40fc:	ba 03 00 00 00       	mov    $0x3,%edx
    4101:	5b                   	pop    %rbx
    4102:	5d                   	pop    %rbp
    4103:	4c 01 e7             	add    %r12,%rdi
    4106:	41 5c                	pop    %r12
    4108:	41 5d                	pop    %r13
    410a:	41 5e                	pop    %r14
    410c:	48 c1 e6 0c          	shl    $0xc,%rsi
    4110:	e9 9b ea ff ff       	jmpq   2bb0 <trts_mprotect>
    4115:	0f 1f 00             	nopl   (%rax)
    4118:	31 c0                	xor    %eax,%eax
    411a:	e9 08 ff ff ff       	jmpq   4027 <change_protection+0x107>
    411f:	48 89 d8             	mov    %rbx,%rax
    4122:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4128:	48 8b 48 20          	mov    0x20(%rax),%rcx
    412c:	48 8b 70 18          	mov    0x18(%rax),%rsi
    4130:	48 c1 e9 04          	shr    $0x4,%rcx
    4134:	4c 01 e6             	add    %r12,%rsi
    4137:	48 85 c9             	test   %rcx,%rcx
    413a:	48 89 f0             	mov    %rsi,%rax
    413d:	0f 84 5f fe ff ff    	je     3fa2 <change_protection+0x82>
    4143:	48 8b 16             	mov    (%rsi),%rdx
    4146:	48 85 d2             	test   %rdx,%rdx
    4149:	0f 84 53 fe ff ff    	je     3fa2 <change_protection+0x82>
    414f:	48 83 fa 16          	cmp    $0x16,%rdx
    4153:	74 2b                	je     4180 <change_protection+0x260>
    4155:	48 c1 e1 04          	shl    $0x4,%rcx
    4159:	48 01 f1             	add    %rsi,%rcx
    415c:	eb 14                	jmp    4172 <change_protection+0x252>
    415e:	66 90                	xchg   %ax,%ax
    4160:	48 8b 10             	mov    (%rax),%rdx
    4163:	48 85 d2             	test   %rdx,%rdx
    4166:	0f 84 36 fe ff ff    	je     3fa2 <change_protection+0x82>
    416c:	48 83 fa 16          	cmp    $0x16,%rdx
    4170:	74 0e                	je     4180 <change_protection+0x260>
    4172:	48 83 c0 10          	add    $0x10,%rax
    4176:	48 39 c8             	cmp    %rcx,%rax
    4179:	75 e5                	jne    4160 <change_protection+0x240>
    417b:	e9 22 fe ff ff       	jmpq   3fa2 <change_protection+0x82>
    4180:	41 be 01 00 00 00    	mov    $0x1,%r14d
    4186:	e9 1a fe ff ff       	jmpq   3fa5 <change_protection+0x85>
    418b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000004190 <__cxa_atexit>:
    4190:	41 55                	push   %r13
    4192:	41 54                	push   %r12
    4194:	49 89 d5             	mov    %rdx,%r13
    4197:	55                   	push   %rbp
    4198:	53                   	push   %rbx
    4199:	48 89 fd             	mov    %rdi,%rbp
    419c:	49 89 f4             	mov    %rsi,%r12
    419f:	48 83 ec 18          	sub    $0x18,%rsp
    41a3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    41aa:	00 00 
    41ac:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    41b1:	31 c0                	xor    %eax,%eax
    41b3:	48 83 3d 75 9e 00 00 	cmpq   $0x0,0x9e75(%rip)        # e030 <g_exit_function_cookie>
    41ba:	00 
    41bb:	0f 84 8f 00 00 00    	je     4250 <__cxa_atexit+0xc0>
    41c1:	31 f6                	xor    %esi,%esi
    41c3:	48 89 ef             	mov    %rbp,%rdi
    41c6:	e8 35 d1 ff ff       	callq  1300 <sgx_is_within_enclave>
    41cb:	85 c0                	test   %eax,%eax
    41cd:	0f 84 a5 00 00 00    	je     4278 <__cxa_atexit+0xe8>
    41d3:	bf 20 00 00 00       	mov    $0x20,%edi
    41d8:	e8 23 0b 00 00       	callq  4d00 <dlmalloc>
    41dd:	48 85 c0             	test   %rax,%rax
    41e0:	48 89 c3             	mov    %rax,%rbx
    41e3:	0f 84 8f 00 00 00    	je     4278 <__cxa_atexit+0xe8>
    41e9:	48 8b 05 40 9e 00 00 	mov    0x9e40(%rip),%rax        # e030 <g_exit_function_cookie>
    41f0:	48 8d 3d 41 9e 00 00 	lea    0x9e41(%rip),%rdi        # e038 <g_exit_function_lock>
    41f7:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
    41fb:	48 31 c5             	xor    %rax,%rbp
    41fe:	49 31 c4             	xor    %rax,%r12
    4201:	48 89 2b             	mov    %rbp,(%rbx)
    4204:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    4208:	e8 13 3c 00 00       	callq  7e20 <sgx_spin_lock>
    420d:	48 8b 05 2c 9e 00 00 	mov    0x9e2c(%rip),%rax        # e040 <g_exit_function>
    4214:	48 8d 3d 1d 9e 00 00 	lea    0x9e1d(%rip),%rdi        # e038 <g_exit_function_lock>
    421b:	48 89 1d 1e 9e 00 00 	mov    %rbx,0x9e1e(%rip)        # e040 <g_exit_function>
    4222:	48 89 43 18          	mov    %rax,0x18(%rbx)
    4226:	e8 55 3c 00 00       	callq  7e80 <sgx_spin_unlock>
    422b:	31 c0                	xor    %eax,%eax
    422d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    4232:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    4239:	00 00 
    423b:	75 75                	jne    42b2 <__cxa_atexit+0x122>
    423d:	48 83 c4 18          	add    $0x18,%rsp
    4241:	5b                   	pop    %rbx
    4242:	5d                   	pop    %rbp
    4243:	41 5c                	pop    %r12
    4245:	41 5d                	pop    %r13
    4247:	c3                   	retq   
    4248:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    424f:	00 
    4250:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    4257:	00 
    4258:	48 89 e3             	mov    %rsp,%rbx
    425b:	eb 0a                	jmp    4267 <__cxa_atexit+0xd7>
    425d:	0f 1f 00             	nopl   (%rax)
    4260:	48 83 3c 24 00       	cmpq   $0x0,(%rsp)
    4265:	75 19                	jne    4280 <__cxa_atexit+0xf0>
    4267:	be 08 00 00 00       	mov    $0x8,%esi
    426c:	48 89 df             	mov    %rbx,%rdi
    426f:	e8 6c d2 ff ff       	callq  14e0 <sgx_read_rand>
    4274:	85 c0                	test   %eax,%eax
    4276:	74 e8                	je     4260 <__cxa_atexit+0xd0>
    4278:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    427d:	eb ae                	jmp    422d <__cxa_atexit+0x9d>
    427f:	90                   	nop
    4280:	48 8d 3d b1 9d 00 00 	lea    0x9db1(%rip),%rdi        # e038 <g_exit_function_lock>
    4287:	e8 94 3b 00 00       	callq  7e20 <sgx_spin_lock>
    428c:	48 83 3d 9c 9d 00 00 	cmpq   $0x0,0x9d9c(%rip)        # e030 <g_exit_function_cookie>
    4293:	00 
    4294:	75 0b                	jne    42a1 <__cxa_atexit+0x111>
    4296:	48 8b 04 24          	mov    (%rsp),%rax
    429a:	48 89 05 8f 9d 00 00 	mov    %rax,0x9d8f(%rip)        # e030 <g_exit_function_cookie>
    42a1:	48 8d 3d 90 9d 00 00 	lea    0x9d90(%rip),%rdi        # e038 <g_exit_function_lock>
    42a8:	e8 d3 3b 00 00       	callq  7e80 <sgx_spin_unlock>
    42ad:	e9 0f ff ff ff       	jmpq   41c1 <__cxa_atexit+0x31>
    42b2:	e8 c9 01 00 00       	callq  4480 <__stack_chk_fail>
    42b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    42be:	00 00 

00000000000042c0 <atexit>:
    42c0:	48 8b 15 69 8d 00 00 	mov    0x8d69(%rip),%rdx        # d030 <__dso_handle>
    42c7:	31 f6                	xor    %esi,%esi
    42c9:	e9 c2 fe ff ff       	jmpq   4190 <__cxa_atexit>
    42ce:	66 90                	xchg   %ax,%ax

00000000000042d0 <init_global_object>:
    42d0:	55                   	push   %rbp
    42d1:	53                   	push   %rbx
    42d2:	48 8d 3d 27 bd ff ff 	lea    -0x42d9(%rip),%rdi        # 0 <__ImageBase>
    42d9:	48 83 ec 28          	sub    $0x28,%rsp
    42dd:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    42e2:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    42e7:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    42ee:	00 00 
    42f0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    42f7:	00 00 
    42f9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    42fe:	31 c0                	xor    %eax,%eax
    4300:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
    4307:	00 00 
    4309:	e8 52 fa ff ff       	callq  3d60 <elf_get_init_array>
    430e:	85 c0                	test   %eax,%eax
    4310:	75 0a                	jne    431c <init_global_object+0x4c>
    4312:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    4317:	48 85 db             	test   %rbx,%rbx
    431a:	75 1c                	jne    4338 <init_global_object+0x68>
    431c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    4321:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    4328:	00 00 
    432a:	75 41                	jne    436d <init_global_object+0x9d>
    432c:	48 83 c4 28          	add    $0x28,%rsp
    4330:	5b                   	pop    %rbx
    4331:	5d                   	pop    %rbp
    4332:	c3                   	retq   
    4333:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    4338:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    433d:	48 85 ed             	test   %rbp,%rbp
    4340:	74 da                	je     431c <init_global_object+0x4c>
    4342:	48 8d 05 b7 bc ff ff 	lea    -0x4349(%rip),%rax        # 0 <__ImageBase>
    4349:	48 83 e5 f8          	and    $0xfffffffffffffff8,%rbp
    434d:	48 01 c3             	add    %rax,%rbx
    4350:	48 01 dd             	add    %rbx,%rbp
    4353:	48 39 eb             	cmp    %rbp,%rbx
    4356:	73 c4                	jae    431c <init_global_object+0x4c>
    4358:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    435f:	00 
    4360:	ff 13                	callq  *(%rbx)
    4362:	48 83 c3 08          	add    $0x8,%rbx
    4366:	48 39 dd             	cmp    %rbx,%rbp
    4369:	77 f5                	ja     4360 <init_global_object+0x90>
    436b:	eb af                	jmp    431c <init_global_object+0x4c>
    436d:	e8 0e 01 00 00       	callq  4480 <__stack_chk_fail>
    4372:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    4379:	00 00 00 
    437c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000004380 <uninit_global_object>:
    4380:	55                   	push   %rbp
    4381:	53                   	push   %rbx
    4382:	48 83 ec 28          	sub    $0x28,%rsp
    4386:	48 8b 1d b3 9c 00 00 	mov    0x9cb3(%rip),%rbx        # e040 <g_exit_function>
    438d:	48 c7 05 a8 9c 00 00 	movq   $0x0,0x9ca8(%rip)        # e040 <g_exit_function>
    4394:	00 00 00 00 
    4398:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    439f:	00 00 
    43a1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    43a6:	31 c0                	xor    %eax,%eax
    43a8:	48 85 db             	test   %rbx,%rbx
    43ab:	74 2a                	je     43d7 <uninit_global_object+0x57>
    43ad:	0f 1f 00             	nopl   (%rax)
    43b0:	48 8b 05 79 9c 00 00 	mov    0x9c79(%rip),%rax        # e030 <g_exit_function_cookie>
    43b7:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    43bb:	48 31 c7             	xor    %rax,%rdi
    43be:	48 33 03             	xor    (%rbx),%rax
    43c1:	ff d0                	callq  *%rax
    43c3:	48 8b 6b 18          	mov    0x18(%rbx),%rbp
    43c7:	48 89 df             	mov    %rbx,%rdi
    43ca:	e8 51 23 00 00       	callq  6720 <dlfree>
    43cf:	48 85 ed             	test   %rbp,%rbp
    43d2:	48 89 eb             	mov    %rbp,%rbx
    43d5:	75 d9                	jne    43b0 <uninit_global_object+0x30>
    43d7:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    43dc:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    43e1:	48 8d 3d 18 bc ff ff 	lea    -0x43e8(%rip),%rdi        # 0 <__ImageBase>
    43e8:	e8 53 fa ff ff       	callq  3e40 <elf_get_uninit_array>
    43ed:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    43f2:	48 85 c0             	test   %rax,%rax
    43f5:	74 47                	je     443e <uninit_global_object+0xbe>
    43f7:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    43fc:	48 85 c9             	test   %rcx,%rcx
    43ff:	74 3d                	je     443e <uninit_global_object+0xbe>
    4401:	48 8d 15 f8 bb ff ff 	lea    -0x4408(%rip),%rdx        # 0 <__ImageBase>
    4408:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    440c:	48 01 c2             	add    %rax,%rdx
    440f:	48 8d 44 0a f8       	lea    -0x8(%rdx,%rcx,1),%rax
    4414:	48 39 c2             	cmp    %rax,%rdx
    4417:	77 25                	ja     443e <uninit_global_object+0xbe>
    4419:	48 89 c5             	mov    %rax,%rbp
    441c:	48 8d 58 f8          	lea    -0x8(%rax),%rbx
    4420:	48 29 d5             	sub    %rdx,%rbp
    4423:	48 f7 d5             	not    %rbp
    4426:	48 83 e5 f8          	and    $0xfffffffffffffff8,%rbp
    442a:	48 01 c5             	add    %rax,%rbp
    442d:	eb 05                	jmp    4434 <uninit_global_object+0xb4>
    442f:	90                   	nop
    4430:	48 83 eb 08          	sub    $0x8,%rbx
    4434:	ff 10                	callq  *(%rax)
    4436:	48 39 eb             	cmp    %rbp,%rbx
    4439:	48 89 d8             	mov    %rbx,%rax
    443c:	75 f2                	jne    4430 <uninit_global_object+0xb0>
    443e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    4443:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    444a:	00 00 
    444c:	75 07                	jne    4455 <uninit_global_object+0xd5>
    444e:	48 83 c4 28          	add    $0x28,%rsp
    4452:	5b                   	pop    %rbx
    4453:	5d                   	pop    %rbp
    4454:	c3                   	retq   
    4455:	e8 26 00 00 00       	callq  4480 <__stack_chk_fail>
    445a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000004460 <__tls_get_addr>:
    4460:	53                   	push   %rbx
    4461:	48 89 fb             	mov    %rdi,%rbx
    4464:	e8 08 46 00 00       	callq  8a71 <get_thread_data>
    4469:	48 8b 40 50          	mov    0x50(%rax),%rax
    446d:	48 03 43 08          	add    0x8(%rbx),%rax
    4471:	5b                   	pop    %rbx
    4472:	c3                   	retq   
    4473:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    447a:	00 00 00 
    447d:	0f 1f 00             	nopl   (%rax)

0000000000004480 <__stack_chk_fail>:
    4480:	48 83 ec 08          	sub    $0x8,%rsp
    4484:	e8 17 49 00 00       	callq  8da0 <abort>
    4489:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000004490 <__stack_chk_fail_local>:
    4490:	48 83 ec 08          	sub    $0x8,%rsp
    4494:	e8 07 49 00 00       	callq  8da0 <abort>
    4499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000044a0 <__intel_security_check_cookie>:
    44a0:	48 39 3d 71 89 00 00 	cmp    %rdi,0x8971(%rip)        # ce18 <__intel_security_cookie>
    44a7:	75 02                	jne    44ab <__intel_security_check_cookie+0xb>
    44a9:	f3 c3                	repz retq 
    44ab:	48 83 ec 08          	sub    $0x8,%rsp
    44af:	e8 ec 48 00 00       	callq  8da0 <abort>
    44b4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    44bb:	00 00 00 
    44be:	66 90                	xchg   %ax,%ax

00000000000044c0 <init_mparams>:
    44c0:	48 83 ec 18          	sub    $0x18,%rsp
    44c4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    44cb:	00 00 
    44cd:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    44d2:	31 c0                	xor    %eax,%eax
    44d4:	b8 01 00 00 00       	mov    $0x1,%eax
    44d9:	87 05 71 9f 00 00    	xchg   %eax,0x9f71(%rip)        # e450 <malloc_global_mutex>
    44df:	85 c0                	test   %eax,%eax
    44e1:	74 1f                	je     4502 <init_mparams+0x42>
    44e3:	48 8d 15 66 9f 00 00 	lea    0x9f66(%rip),%rdx        # e450 <malloc_global_mutex>
    44ea:	b9 01 00 00 00       	mov    $0x1,%ecx
    44ef:	90                   	nop
    44f0:	8b 02                	mov    (%rdx),%eax
    44f2:	85 c0                	test   %eax,%eax
    44f4:	75 fa                	jne    44f0 <init_mparams+0x30>
    44f6:	89 c8                	mov    %ecx,%eax
    44f8:	87 05 52 9f 00 00    	xchg   %eax,0x9f52(%rip)        # e450 <malloc_global_mutex>
    44fe:	85 c0                	test   %eax,%eax
    4500:	75 ee                	jne    44f0 <init_mparams+0x30>
    4502:	48 83 3d 16 9f 00 00 	cmpq   $0x0,0x9f16(%rip)        # e420 <mparams>
    4509:	00 
    450a:	75 6b                	jne    4577 <init_mparams+0xb7>
    450c:	48 89 e7             	mov    %rsp,%rdi
    450f:	be 08 00 00 00       	mov    $0x8,%esi
    4514:	48 c7 05 11 9f 00 00 	movq   $0x1000,0x9f11(%rip)        # e430 <mparams+0x10>
    451b:	00 10 00 00 
    451f:	48 c7 05 fe 9e 00 00 	movq   $0x1000,0x9efe(%rip)        # e428 <mparams+0x8>
    4526:	00 10 00 00 
    452a:	48 c7 05 03 9f 00 00 	movq   $0xffffffffffffffff,0x9f03(%rip)        # e438 <mparams+0x18>
    4531:	ff ff ff ff 
    4535:	48 c7 05 00 9f 00 00 	movq   $0x200000,0x9f00(%rip)        # e440 <mparams+0x20>
    453c:	00 00 20 00 
    4540:	c7 05 fe 9e 00 00 02 	movl   $0x2,0x9efe(%rip)        # e448 <mparams+0x28>
    4547:	00 00 00 
    454a:	48 c7 05 7b 9e 00 00 	movq   $0x2,0x9e7b(%rip)        # e3d0 <_gm_+0x370>
    4551:	02 00 00 00 
    4555:	e8 86 cf ff ff       	callq  14e0 <sgx_read_rand>
    455a:	85 c0                	test   %eax,%eax
    455c:	75 3d                	jne    459b <init_mparams+0xdb>
    455e:	48 8b 04 24          	mov    (%rsp),%rax
    4562:	48 35 55 55 55 55    	xor    $0x55555555,%rax
    4568:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    456c:	48 83 c8 08          	or     $0x8,%rax
    4570:	48 89 05 a9 9e 00 00 	mov    %rax,0x9ea9(%rip)        # e420 <mparams>
    4577:	c7 05 cf 9e 00 00 00 	movl   $0x0,0x9ecf(%rip)        # e450 <malloc_global_mutex>
    457e:	00 00 00 
    4581:	b8 01 00 00 00       	mov    $0x1,%eax
    4586:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    458b:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    4592:	00 00 
    4594:	75 0a                	jne    45a0 <init_mparams+0xe0>
    4596:	48 83 c4 18          	add    $0x18,%rsp
    459a:	c3                   	retq   
    459b:	e8 00 48 00 00       	callq  8da0 <abort>
    45a0:	e8 db fe ff ff       	callq  4480 <__stack_chk_fail>
    45a5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    45ac:	00 00 00 
    45af:	90                   	nop

00000000000045b0 <dispose_chunk>:
    45b0:	55                   	push   %rbp
    45b1:	53                   	push   %rbx
    45b2:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
    45b6:	48 83 ec 08          	sub    $0x8,%rsp
    45ba:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    45be:	f6 c1 01             	test   $0x1,%cl
    45c1:	75 6d                	jne    4630 <dispose_chunk+0x80>
    45c3:	83 e1 03             	and    $0x3,%ecx
    45c6:	0f 84 db 00 00 00    	je     46a7 <dispose_chunk+0xf7>
    45cc:	48 8b 0e             	mov    (%rsi),%rcx
    45cf:	4c 8b 4f 18          	mov    0x18(%rdi),%r9
    45d3:	48 29 ce             	sub    %rcx,%rsi
    45d6:	48 01 ca             	add    %rcx,%rdx
    45d9:	49 39 f1             	cmp    %rsi,%r9
    45dc:	0f 87 ee 02 00 00    	ja     48d0 <dispose_chunk+0x320>
    45e2:	48 39 77 20          	cmp    %rsi,0x20(%rdi)
    45e6:	0f 84 6c 02 00 00    	je     4858 <dispose_chunk+0x2a8>
    45ec:	48 c1 e9 03          	shr    $0x3,%rcx
    45f0:	4c 8b 46 18          	mov    0x18(%rsi),%r8
    45f4:	48 83 f9 1f          	cmp    $0x1f,%rcx
    45f8:	0f 87 b2 02 00 00    	ja     48b0 <dispose_chunk+0x300>
    45fe:	44 8d 1c 09          	lea    (%rcx,%rcx,1),%r11d
    4602:	4c 8b 56 10          	mov    0x10(%rsi),%r10
    4606:	4e 8d 5c df 48       	lea    0x48(%rdi,%r11,8),%r11
    460b:	4d 39 d3             	cmp    %r10,%r11
    460e:	0f 85 fc 05 00 00    	jne    4c10 <dispose_chunk+0x660>
    4614:	4d 39 d0             	cmp    %r10,%r8
    4617:	0f 84 2b 05 00 00    	je     4b48 <dispose_chunk+0x598>
    461d:	4d 39 c3             	cmp    %r8,%r11
    4620:	0f 85 56 06 00 00    	jne    4c7c <dispose_chunk+0x6cc>
    4626:	4d 89 42 18          	mov    %r8,0x18(%r10)
    462a:	4d 89 50 10          	mov    %r10,0x10(%r8)
    462e:	eb 04                	jmp    4634 <dispose_chunk+0x84>
    4630:	4c 8b 4f 18          	mov    0x18(%rdi),%r9
    4634:	49 39 c1             	cmp    %rax,%r9
    4637:	0f 87 93 02 00 00    	ja     48d0 <dispose_chunk+0x320>
    463d:	48 8b 48 08          	mov    0x8(%rax),%rcx
    4641:	f6 c1 02             	test   $0x2,%cl
    4644:	74 6a                	je     46b0 <dispose_chunk+0x100>
    4646:	48 83 e1 fe          	and    $0xfffffffffffffffe,%rcx
    464a:	48 89 48 08          	mov    %rcx,0x8(%rax)
    464e:	48 89 d0             	mov    %rdx,%rax
    4651:	48 83 c8 01          	or     $0x1,%rax
    4655:	48 89 46 08          	mov    %rax,0x8(%rsi)
    4659:	48 89 14 16          	mov    %rdx,(%rsi,%rdx,1)
    465d:	48 89 d1             	mov    %rdx,%rcx
    4660:	48 c1 e9 03          	shr    $0x3,%rcx
    4664:	48 83 f9 1f          	cmp    $0x1f,%rcx
    4668:	0f 87 c2 00 00 00    	ja     4730 <dispose_chunk+0x180>
    466e:	8d 04 09             	lea    (%rcx,%rcx,1),%eax
    4671:	44 8b 07             	mov    (%rdi),%r8d
    4674:	48 8d 54 c7 48       	lea    0x48(%rdi,%rax,8),%rdx
    4679:	b8 01 00 00 00       	mov    $0x1,%eax
    467e:	d3 e0                	shl    %cl,%eax
    4680:	41 85 c0             	test   %eax,%r8d
    4683:	0f 84 a7 01 00 00    	je     4830 <dispose_chunk+0x280>
    4689:	48 8b 42 10          	mov    0x10(%rdx),%rax
    468d:	48 3b 47 18          	cmp    0x18(%rdi),%rax
    4691:	0f 82 39 02 00 00    	jb     48d0 <dispose_chunk+0x320>
    4697:	48 89 72 10          	mov    %rsi,0x10(%rdx)
    469b:	48 89 70 18          	mov    %rsi,0x18(%rax)
    469f:	48 89 46 10          	mov    %rax,0x10(%rsi)
    46a3:	48 89 56 18          	mov    %rdx,0x18(%rsi)
    46a7:	48 83 c4 08          	add    $0x8,%rsp
    46ab:	5b                   	pop    %rbx
    46ac:	5d                   	pop    %rbp
    46ad:	c3                   	retq   
    46ae:	66 90                	xchg   %ax,%ax
    46b0:	48 39 47 28          	cmp    %rax,0x28(%rdi)
    46b4:	4c 8b 5f 20          	mov    0x20(%rdi),%r11
    46b8:	0f 84 42 02 00 00    	je     4900 <dispose_chunk+0x350>
    46be:	49 39 c3             	cmp    %rax,%r11
    46c1:	0f 84 c9 01 00 00    	je     4890 <dispose_chunk+0x2e0>
    46c7:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    46cb:	4c 8b 40 18          	mov    0x18(%rax),%r8
    46cf:	48 01 ca             	add    %rcx,%rdx
    46d2:	48 c1 e9 03          	shr    $0x3,%rcx
    46d6:	48 83 f9 1f          	cmp    $0x1f,%rcx
    46da:	0f 87 58 02 00 00    	ja     4938 <dispose_chunk+0x388>
    46e0:	8d 1c 09             	lea    (%rcx,%rcx,1),%ebx
    46e3:	4c 8b 50 10          	mov    0x10(%rax),%r10
    46e7:	48 8d 5c df 48       	lea    0x48(%rdi,%rbx,8),%rbx
    46ec:	4c 39 d3             	cmp    %r10,%rbx
    46ef:	0f 85 44 05 00 00    	jne    4c39 <dispose_chunk+0x689>
    46f5:	4d 39 d0             	cmp    %r10,%r8
    46f8:	0f 84 b2 04 00 00    	je     4bb0 <dispose_chunk+0x600>
    46fe:	4c 39 c3             	cmp    %r8,%rbx
    4701:	0f 85 d6 03 00 00    	jne    4add <dispose_chunk+0x52d>
    4707:	4d 89 42 18          	mov    %r8,0x18(%r10)
    470b:	4d 89 50 10          	mov    %r10,0x10(%r8)
    470f:	48 89 d0             	mov    %rdx,%rax
    4712:	48 83 c8 01          	or     $0x1,%rax
    4716:	4c 39 de             	cmp    %r11,%rsi
    4719:	48 89 46 08          	mov    %rax,0x8(%rsi)
    471d:	48 89 14 16          	mov    %rdx,(%rsi,%rdx,1)
    4721:	0f 85 36 ff ff ff    	jne    465d <dispose_chunk+0xad>
    4727:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    472b:	e9 77 ff ff ff       	jmpq   46a7 <dispose_chunk+0xf7>
    4730:	48 89 d0             	mov    %rdx,%rax
    4733:	48 c1 e8 08          	shr    $0x8,%rax
    4737:	85 c0                	test   %eax,%eax
    4739:	0f 84 01 01 00 00    	je     4840 <dispose_chunk+0x290>
    473f:	3d ff ff 00 00       	cmp    $0xffff,%eax
    4744:	0f 87 d6 02 00 00    	ja     4a20 <dispose_chunk+0x470>
    474a:	0f bd c0             	bsr    %eax,%eax
    474d:	b9 26 00 00 00       	mov    $0x26,%ecx
    4752:	48 89 d3             	mov    %rdx,%rbx
    4755:	83 f0 1f             	xor    $0x1f,%eax
    4758:	41 b8 1f 00 00 00    	mov    $0x1f,%r8d
    475e:	29 c1                	sub    %eax,%ecx
    4760:	41 29 c0             	sub    %eax,%r8d
    4763:	b8 01 00 00 00       	mov    $0x1,%eax
    4768:	48 d3 eb             	shr    %cl,%rbx
    476b:	48 89 d9             	mov    %rbx,%rcx
    476e:	83 e1 01             	and    $0x1,%ecx
    4771:	46 8d 1c 41          	lea    (%rcx,%r8,2),%r11d
    4775:	4c 89 d9             	mov    %r11,%rcx
    4778:	4e 8d 14 dd 58 02 00 	lea    0x258(,%r11,8),%r10
    477f:	00 
    4780:	d3 e0                	shl    %cl,%eax
    4782:	44 8b 47 04          	mov    0x4(%rdi),%r8d
    4786:	89 4e 38             	mov    %ecx,0x38(%rsi)
    4789:	48 c7 46 28 00 00 00 	movq   $0x0,0x28(%rsi)
    4790:	00 
    4791:	48 c7 46 20 00 00 00 	movq   $0x0,0x20(%rsi)
    4798:	00 
    4799:	44 85 c0             	test   %r8d,%eax
    479c:	0f 84 36 01 00 00    	je     48d8 <dispose_chunk+0x328>
    47a2:	83 f9 1f             	cmp    $0x1f,%ecx
    47a5:	4e 8b 84 df 58 02 00 	mov    0x258(%rdi,%r11,8),%r8
    47ac:	00 
    47ad:	49 89 d2             	mov    %rdx,%r10
    47b0:	74 34                	je     47e6 <dispose_chunk+0x236>
    47b2:	d1 e9                	shr    %ecx
    47b4:	b8 39 00 00 00       	mov    $0x39,%eax
    47b9:	29 c8                	sub    %ecx,%eax
    47bb:	89 c1                	mov    %eax,%ecx
    47bd:	49 d3 e2             	shl    %cl,%r10
    47c0:	eb 24                	jmp    47e6 <dispose_chunk+0x236>
    47c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    47c8:	4c 89 d0             	mov    %r10,%rax
    47cb:	4d 01 d2             	add    %r10,%r10
    47ce:	48 c1 e8 3f          	shr    $0x3f,%rax
    47d2:	48 83 c0 04          	add    $0x4,%rax
    47d6:	49 8b 0c c0          	mov    (%r8,%rax,8),%rcx
    47da:	48 85 c9             	test   %rcx,%rcx
    47dd:	0f 84 15 02 00 00    	je     49f8 <dispose_chunk+0x448>
    47e3:	49 89 c8             	mov    %rcx,%r8
    47e6:	49 8b 40 08          	mov    0x8(%r8),%rax
    47ea:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    47ee:	48 39 d0             	cmp    %rdx,%rax
    47f1:	75 d5                	jne    47c8 <dispose_chunk+0x218>
    47f3:	4d 39 c1             	cmp    %r8,%r9
    47f6:	49 8b 40 10          	mov    0x10(%r8),%rax
    47fa:	0f 87 d0 00 00 00    	ja     48d0 <dispose_chunk+0x320>
    4800:	49 39 c1             	cmp    %rax,%r9
    4803:	0f 87 c7 00 00 00    	ja     48d0 <dispose_chunk+0x320>
    4809:	48 89 70 18          	mov    %rsi,0x18(%rax)
    480d:	49 89 70 10          	mov    %rsi,0x10(%r8)
    4811:	48 89 46 10          	mov    %rax,0x10(%rsi)
    4815:	4c 89 46 18          	mov    %r8,0x18(%rsi)
    4819:	48 c7 46 30 00 00 00 	movq   $0x0,0x30(%rsi)
    4820:	00 
    4821:	e9 81 fe ff ff       	jmpq   46a7 <dispose_chunk+0xf7>
    4826:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    482d:	00 00 00 
    4830:	44 09 c0             	or     %r8d,%eax
    4833:	89 07                	mov    %eax,(%rdi)
    4835:	48 89 d0             	mov    %rdx,%rax
    4838:	e9 5a fe ff ff       	jmpq   4697 <dispose_chunk+0xe7>
    483d:	0f 1f 00             	nopl   (%rax)
    4840:	b8 01 00 00 00       	mov    $0x1,%eax
    4845:	41 ba 58 02 00 00    	mov    $0x258,%r10d
    484b:	31 c9                	xor    %ecx,%ecx
    484d:	45 31 db             	xor    %r11d,%r11d
    4850:	e9 2d ff ff ff       	jmpq   4782 <dispose_chunk+0x1d2>
    4855:	0f 1f 00             	nopl   (%rax)
    4858:	48 8b 48 08          	mov    0x8(%rax),%rcx
    485c:	49 89 c8             	mov    %rcx,%r8
    485f:	41 83 e0 03          	and    $0x3,%r8d
    4863:	49 83 f8 03          	cmp    $0x3,%r8
    4867:	0f 85 c7 fd ff ff    	jne    4634 <dispose_chunk+0x84>
    486d:	48 83 e1 fe          	and    $0xfffffffffffffffe,%rcx
    4871:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    4875:	48 89 48 08          	mov    %rcx,0x8(%rax)
    4879:	48 89 d1             	mov    %rdx,%rcx
    487c:	48 83 c9 01          	or     $0x1,%rcx
    4880:	48 89 4e 08          	mov    %rcx,0x8(%rsi)
    4884:	48 89 10             	mov    %rdx,(%rax)
    4887:	e9 1b fe ff ff       	jmpq   46a7 <dispose_chunk+0xf7>
    488c:	0f 1f 40 00          	nopl   0x0(%rax)
    4890:	48 03 57 08          	add    0x8(%rdi),%rdx
    4894:	48 89 77 20          	mov    %rsi,0x20(%rdi)
    4898:	48 89 d0             	mov    %rdx,%rax
    489b:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    489f:	48 83 c8 01          	or     $0x1,%rax
    48a3:	48 89 46 08          	mov    %rax,0x8(%rsi)
    48a7:	48 89 14 16          	mov    %rdx,(%rsi,%rdx,1)
    48ab:	e9 f7 fd ff ff       	jmpq   46a7 <dispose_chunk+0xf7>
    48b0:	49 39 f0             	cmp    %rsi,%r8
    48b3:	48 8b 5e 30          	mov    0x30(%rsi),%rbx
    48b7:	0f 84 3b 02 00 00    	je     4af8 <dispose_chunk+0x548>
    48bd:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    48c1:	49 39 c9             	cmp    %rcx,%r9
    48c4:	77 0a                	ja     48d0 <dispose_chunk+0x320>
    48c6:	48 39 71 18          	cmp    %rsi,0x18(%rcx)
    48ca:	0f 84 70 01 00 00    	je     4a40 <dispose_chunk+0x490>
    48d0:	e8 cb 44 00 00       	callq  8da0 <abort>
    48d5:	0f 1f 00             	nopl   (%rax)
    48d8:	44 09 c0             	or     %r8d,%eax
    48db:	89 47 04             	mov    %eax,0x4(%rdi)
    48de:	4a 89 b4 df 58 02 00 	mov    %rsi,0x258(%rdi,%r11,8)
    48e5:	00 
    48e6:	4c 01 d7             	add    %r10,%rdi
    48e9:	48 89 7e 30          	mov    %rdi,0x30(%rsi)
    48ed:	48 89 76 18          	mov    %rsi,0x18(%rsi)
    48f1:	48 89 76 10          	mov    %rsi,0x10(%rsi)
    48f5:	e9 ad fd ff ff       	jmpq   46a7 <dispose_chunk+0xf7>
    48fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4900:	48 03 57 10          	add    0x10(%rdi),%rdx
    4904:	48 89 77 28          	mov    %rsi,0x28(%rdi)
    4908:	48 89 57 10          	mov    %rdx,0x10(%rdi)
    490c:	48 83 ca 01          	or     $0x1,%rdx
    4910:	4c 39 de             	cmp    %r11,%rsi
    4913:	48 89 56 08          	mov    %rdx,0x8(%rsi)
    4917:	0f 85 8a fd ff ff    	jne    46a7 <dispose_chunk+0xf7>
    491d:	48 c7 47 20 00 00 00 	movq   $0x0,0x20(%rdi)
    4924:	00 
    4925:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
    492c:	00 
    492d:	e9 75 fd ff ff       	jmpq   46a7 <dispose_chunk+0xf7>
    4932:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4938:	49 39 c0             	cmp    %rax,%r8
    493b:	48 8b 68 30          	mov    0x30(%rax),%rbp
    493f:	0f 84 1b 02 00 00    	je     4b60 <dispose_chunk+0x5b0>
    4945:	48 8b 48 10          	mov    0x10(%rax),%rcx
    4949:	49 39 c9             	cmp    %rcx,%r9
    494c:	77 82                	ja     48d0 <dispose_chunk+0x320>
    494e:	48 39 41 18          	cmp    %rax,0x18(%rcx)
    4952:	0f 85 78 ff ff ff    	jne    48d0 <dispose_chunk+0x320>
    4958:	49 39 40 10          	cmp    %rax,0x10(%r8)
    495c:	0f 85 6e ff ff ff    	jne    48d0 <dispose_chunk+0x320>
    4962:	4c 89 41 18          	mov    %r8,0x18(%rcx)
    4966:	49 89 48 10          	mov    %rcx,0x10(%r8)
    496a:	48 85 ed             	test   %rbp,%rbp
    496d:	0f 84 9c fd ff ff    	je     470f <dispose_chunk+0x15f>
    4973:	44 8b 50 38          	mov    0x38(%rax),%r10d
    4977:	4c 89 d1             	mov    %r10,%rcx
    497a:	4e 8d 14 d7          	lea    (%rdi,%r10,8),%r10
    497e:	49 39 82 58 02 00 00 	cmp    %rax,0x258(%r10)
    4985:	0f 84 5d 02 00 00    	je     4be8 <dispose_chunk+0x638>
    498b:	49 39 e9             	cmp    %rbp,%r9
    498e:	0f 87 3c ff ff ff    	ja     48d0 <dispose_chunk+0x320>
    4994:	48 39 45 20          	cmp    %rax,0x20(%rbp)
    4998:	0f 84 92 02 00 00    	je     4c30 <dispose_chunk+0x680>
    499e:	4c 89 45 28          	mov    %r8,0x28(%rbp)
    49a2:	4d 85 c0             	test   %r8,%r8
    49a5:	0f 84 64 fd ff ff    	je     470f <dispose_chunk+0x15f>
    49ab:	4d 39 c8             	cmp    %r9,%r8
    49ae:	0f 82 1c ff ff ff    	jb     48d0 <dispose_chunk+0x320>
    49b4:	48 8b 48 20          	mov    0x20(%rax),%rcx
    49b8:	49 89 68 30          	mov    %rbp,0x30(%r8)
    49bc:	48 85 c9             	test   %rcx,%rcx
    49bf:	74 11                	je     49d2 <dispose_chunk+0x422>
    49c1:	49 39 c9             	cmp    %rcx,%r9
    49c4:	0f 87 06 ff ff ff    	ja     48d0 <dispose_chunk+0x320>
    49ca:	49 89 48 20          	mov    %rcx,0x20(%r8)
    49ce:	4c 89 41 30          	mov    %r8,0x30(%rcx)
    49d2:	48 8b 40 28          	mov    0x28(%rax),%rax
    49d6:	48 85 c0             	test   %rax,%rax
    49d9:	0f 84 30 fd ff ff    	je     470f <dispose_chunk+0x15f>
    49df:	49 39 c1             	cmp    %rax,%r9
    49e2:	0f 87 e8 fe ff ff    	ja     48d0 <dispose_chunk+0x320>
    49e8:	49 89 40 28          	mov    %rax,0x28(%r8)
    49ec:	4c 89 40 30          	mov    %r8,0x30(%rax)
    49f0:	e9 1a fd ff ff       	jmpq   470f <dispose_chunk+0x15f>
    49f5:	0f 1f 00             	nopl   (%rax)
    49f8:	49 8d 14 c0          	lea    (%r8,%rax,8),%rdx
    49fc:	48 39 57 18          	cmp    %rdx,0x18(%rdi)
    4a00:	0f 87 ca fe ff ff    	ja     48d0 <dispose_chunk+0x320>
    4a06:	49 89 34 c0          	mov    %rsi,(%r8,%rax,8)
    4a0a:	4c 89 46 30          	mov    %r8,0x30(%rsi)
    4a0e:	48 89 76 18          	mov    %rsi,0x18(%rsi)
    4a12:	48 89 76 10          	mov    %rsi,0x10(%rsi)
    4a16:	e9 8c fc ff ff       	jmpq   46a7 <dispose_chunk+0xf7>
    4a1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    4a20:	b8 00 00 00 80       	mov    $0x80000000,%eax
    4a25:	41 ba 50 03 00 00    	mov    $0x350,%r10d
    4a2b:	b9 1f 00 00 00       	mov    $0x1f,%ecx
    4a30:	41 bb 1f 00 00 00    	mov    $0x1f,%r11d
    4a36:	e9 47 fd ff ff       	jmpq   4782 <dispose_chunk+0x1d2>
    4a3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    4a40:	49 39 70 10          	cmp    %rsi,0x10(%r8)
    4a44:	0f 85 86 fe ff ff    	jne    48d0 <dispose_chunk+0x320>
    4a4a:	4c 89 41 18          	mov    %r8,0x18(%rcx)
    4a4e:	49 89 48 10          	mov    %rcx,0x10(%r8)
    4a52:	48 85 db             	test   %rbx,%rbx
    4a55:	0f 84 d9 fb ff ff    	je     4634 <dispose_chunk+0x84>
    4a5b:	44 8b 56 38          	mov    0x38(%rsi),%r10d
    4a5f:	4c 89 d1             	mov    %r10,%rcx
    4a62:	4e 8d 14 d7          	lea    (%rdi,%r10,8),%r10
    4a66:	49 39 b2 58 02 00 00 	cmp    %rsi,0x258(%r10)
    4a6d:	0f 84 4d 01 00 00    	je     4bc0 <dispose_chunk+0x610>
    4a73:	49 39 d9             	cmp    %rbx,%r9
    4a76:	0f 87 54 fe ff ff    	ja     48d0 <dispose_chunk+0x320>
    4a7c:	48 39 73 20          	cmp    %rsi,0x20(%rbx)
    4a80:	0f 84 81 01 00 00    	je     4c07 <dispose_chunk+0x657>
    4a86:	4c 89 43 28          	mov    %r8,0x28(%rbx)
    4a8a:	4d 85 c0             	test   %r8,%r8
    4a8d:	0f 84 a1 fb ff ff    	je     4634 <dispose_chunk+0x84>
    4a93:	4d 39 c1             	cmp    %r8,%r9
    4a96:	0f 87 34 fe ff ff    	ja     48d0 <dispose_chunk+0x320>
    4a9c:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
    4aa0:	49 89 58 30          	mov    %rbx,0x30(%r8)
    4aa4:	48 85 c9             	test   %rcx,%rcx
    4aa7:	74 11                	je     4aba <dispose_chunk+0x50a>
    4aa9:	49 39 c9             	cmp    %rcx,%r9
    4aac:	0f 87 1e fe ff ff    	ja     48d0 <dispose_chunk+0x320>
    4ab2:	49 89 48 20          	mov    %rcx,0x20(%r8)
    4ab6:	4c 89 41 30          	mov    %r8,0x30(%rcx)
    4aba:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
    4abe:	48 85 c9             	test   %rcx,%rcx
    4ac1:	0f 84 6d fb ff ff    	je     4634 <dispose_chunk+0x84>
    4ac7:	49 39 c9             	cmp    %rcx,%r9
    4aca:	0f 87 00 fe ff ff    	ja     48d0 <dispose_chunk+0x320>
    4ad0:	49 89 48 28          	mov    %rcx,0x28(%r8)
    4ad4:	4c 89 41 30          	mov    %r8,0x30(%rcx)
    4ad8:	e9 57 fb ff ff       	jmpq   4634 <dispose_chunk+0x84>
    4add:	4d 39 c1             	cmp    %r8,%r9
    4ae0:	0f 87 ea fd ff ff    	ja     48d0 <dispose_chunk+0x320>
    4ae6:	49 39 40 10          	cmp    %rax,0x10(%r8)
    4aea:	0f 84 17 fc ff ff    	je     4707 <dispose_chunk+0x157>
    4af0:	e9 db fd ff ff       	jmpq   48d0 <dispose_chunk+0x320>
    4af5:	0f 1f 00             	nopl   (%rax)
    4af8:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
    4afc:	4c 8d 56 28          	lea    0x28(%rsi),%r10
    4b00:	48 85 c9             	test   %rcx,%rcx
    4b03:	0f 84 4f 01 00 00    	je     4c58 <dispose_chunk+0x6a8>
    4b09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4b10:	49 89 c8             	mov    %rcx,%r8
    4b13:	48 8b 49 28          	mov    0x28(%rcx),%rcx
    4b17:	4d 89 d3             	mov    %r10,%r11
    4b1a:	4d 8d 50 28          	lea    0x28(%r8),%r10
    4b1e:	48 85 c9             	test   %rcx,%rcx
    4b21:	75 ed                	jne    4b10 <dispose_chunk+0x560>
    4b23:	49 8b 48 20          	mov    0x20(%r8),%rcx
    4b27:	4d 8d 50 20          	lea    0x20(%r8),%r10
    4b2b:	48 85 c9             	test   %rcx,%rcx
    4b2e:	75 e0                	jne    4b10 <dispose_chunk+0x560>
    4b30:	4d 39 d9             	cmp    %r11,%r9
    4b33:	0f 87 97 fd ff ff    	ja     48d0 <dispose_chunk+0x320>
    4b39:	49 c7 03 00 00 00 00 	movq   $0x0,(%r11)
    4b40:	e9 0d ff ff ff       	jmpq   4a52 <dispose_chunk+0x4a2>
    4b45:	0f 1f 00             	nopl   (%rax)
    4b48:	41 b8 fe ff ff ff    	mov    $0xfffffffe,%r8d
    4b4e:	41 d3 c0             	rol    %cl,%r8d
    4b51:	44 21 07             	and    %r8d,(%rdi)
    4b54:	e9 db fa ff ff       	jmpq   4634 <dispose_chunk+0x84>
    4b59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4b60:	48 8b 48 28          	mov    0x28(%rax),%rcx
    4b64:	4c 8d 50 28          	lea    0x28(%rax),%r10
    4b68:	48 85 c9             	test   %rcx,%rcx
    4b6b:	0f 84 f9 00 00 00    	je     4c6a <dispose_chunk+0x6ba>
    4b71:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4b78:	49 89 c8             	mov    %rcx,%r8
    4b7b:	48 8b 49 28          	mov    0x28(%rcx),%rcx
    4b7f:	4c 89 d3             	mov    %r10,%rbx
    4b82:	4d 8d 50 28          	lea    0x28(%r8),%r10
    4b86:	48 85 c9             	test   %rcx,%rcx
    4b89:	75 ed                	jne    4b78 <dispose_chunk+0x5c8>
    4b8b:	49 8b 48 20          	mov    0x20(%r8),%rcx
    4b8f:	4d 8d 50 20          	lea    0x20(%r8),%r10
    4b93:	48 85 c9             	test   %rcx,%rcx
    4b96:	75 e0                	jne    4b78 <dispose_chunk+0x5c8>
    4b98:	49 39 d9             	cmp    %rbx,%r9
    4b9b:	0f 87 2f fd ff ff    	ja     48d0 <dispose_chunk+0x320>
    4ba1:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    4ba8:	e9 bd fd ff ff       	jmpq   496a <dispose_chunk+0x3ba>
    4bad:	0f 1f 00             	nopl   (%rax)
    4bb0:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4bb5:	d3 c0                	rol    %cl,%eax
    4bb7:	21 07                	and    %eax,(%rdi)
    4bb9:	e9 51 fb ff ff       	jmpq   470f <dispose_chunk+0x15f>
    4bbe:	66 90                	xchg   %ax,%ax
    4bc0:	4d 85 c0             	test   %r8,%r8
    4bc3:	4d 89 82 58 02 00 00 	mov    %r8,0x258(%r10)
    4bca:	0f 85 c3 fe ff ff    	jne    4a93 <dispose_chunk+0x4e3>
    4bd0:	41 b8 fe ff ff ff    	mov    $0xfffffffe,%r8d
    4bd6:	41 d3 c0             	rol    %cl,%r8d
    4bd9:	44 21 47 04          	and    %r8d,0x4(%rdi)
    4bdd:	e9 52 fa ff ff       	jmpq   4634 <dispose_chunk+0x84>
    4be2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4be8:	4d 85 c0             	test   %r8,%r8
    4beb:	4d 89 82 58 02 00 00 	mov    %r8,0x258(%r10)
    4bf2:	0f 85 b3 fd ff ff    	jne    49ab <dispose_chunk+0x3fb>
    4bf8:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4bfd:	d3 c0                	rol    %cl,%eax
    4bff:	21 47 04             	and    %eax,0x4(%rdi)
    4c02:	e9 08 fb ff ff       	jmpq   470f <dispose_chunk+0x15f>
    4c07:	4c 89 43 20          	mov    %r8,0x20(%rbx)
    4c0b:	e9 7a fe ff ff       	jmpq   4a8a <dispose_chunk+0x4da>
    4c10:	4d 39 d1             	cmp    %r10,%r9
    4c13:	0f 87 b7 fc ff ff    	ja     48d0 <dispose_chunk+0x320>
    4c19:	49 39 72 18          	cmp    %rsi,0x18(%r10)
    4c1d:	0f 84 f1 f9 ff ff    	je     4614 <dispose_chunk+0x64>
    4c23:	e9 a8 fc ff ff       	jmpq   48d0 <dispose_chunk+0x320>
    4c28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    4c2f:	00 
    4c30:	4c 89 45 20          	mov    %r8,0x20(%rbp)
    4c34:	e9 69 fd ff ff       	jmpq   49a2 <dispose_chunk+0x3f2>
    4c39:	4d 39 d1             	cmp    %r10,%r9
    4c3c:	0f 87 8e fc ff ff    	ja     48d0 <dispose_chunk+0x320>
    4c42:	49 39 42 18          	cmp    %rax,0x18(%r10)
    4c46:	0f 84 a9 fa ff ff    	je     46f5 <dispose_chunk+0x145>
    4c4c:	e9 7f fc ff ff       	jmpq   48d0 <dispose_chunk+0x320>
    4c51:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4c58:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
    4c5c:	48 85 c9             	test   %rcx,%rcx
    4c5f:	74 33                	je     4c94 <dispose_chunk+0x6e4>
    4c61:	4c 8d 56 20          	lea    0x20(%rsi),%r10
    4c65:	e9 a6 fe ff ff       	jmpq   4b10 <dispose_chunk+0x560>
    4c6a:	48 8b 48 20          	mov    0x20(%rax),%rcx
    4c6e:	48 85 c9             	test   %rcx,%rcx
    4c71:	74 55                	je     4cc8 <dispose_chunk+0x718>
    4c73:	4c 8d 50 20          	lea    0x20(%rax),%r10
    4c77:	e9 fc fe ff ff       	jmpq   4b78 <dispose_chunk+0x5c8>
    4c7c:	4d 39 c1             	cmp    %r8,%r9
    4c7f:	0f 87 4b fc ff ff    	ja     48d0 <dispose_chunk+0x320>
    4c85:	49 39 70 10          	cmp    %rsi,0x10(%r8)
    4c89:	0f 84 97 f9 ff ff    	je     4626 <dispose_chunk+0x76>
    4c8f:	e9 3c fc ff ff       	jmpq   48d0 <dispose_chunk+0x320>
    4c94:	48 85 db             	test   %rbx,%rbx
    4c97:	0f 84 97 f9 ff ff    	je     4634 <dispose_chunk+0x84>
    4c9d:	45 8b 40 38          	mov    0x38(%r8),%r8d
    4ca1:	4e 8d 14 c7          	lea    (%rdi,%r8,8),%r10
    4ca5:	4c 89 c1             	mov    %r8,%rcx
    4ca8:	45 31 c0             	xor    %r8d,%r8d
    4cab:	49 39 b2 58 02 00 00 	cmp    %rsi,0x258(%r10)
    4cb2:	0f 85 bb fd ff ff    	jne    4a73 <dispose_chunk+0x4c3>
    4cb8:	49 c7 82 58 02 00 00 	movq   $0x0,0x258(%r10)
    4cbf:	00 00 00 00 
    4cc3:	e9 08 ff ff ff       	jmpq   4bd0 <dispose_chunk+0x620>
    4cc8:	48 85 ed             	test   %rbp,%rbp
    4ccb:	0f 84 3e fa ff ff    	je     470f <dispose_chunk+0x15f>
    4cd1:	44 8b 40 38          	mov    0x38(%rax),%r8d
    4cd5:	4e 8d 14 c7          	lea    (%rdi,%r8,8),%r10
    4cd9:	4c 89 c1             	mov    %r8,%rcx
    4cdc:	45 31 c0             	xor    %r8d,%r8d
    4cdf:	49 39 82 58 02 00 00 	cmp    %rax,0x258(%r10)
    4ce6:	0f 85 9f fc ff ff    	jne    498b <dispose_chunk+0x3db>
    4cec:	49 c7 82 58 02 00 00 	movq   $0x0,0x258(%r10)
    4cf3:	00 00 00 00 
    4cf7:	e9 fc fe ff ff       	jmpq   4bf8 <dispose_chunk+0x648>
    4cfc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000004d00 <dlmalloc>:
    4d00:	41 57                	push   %r15
    4d02:	41 56                	push   %r14
    4d04:	41 55                	push   %r13
    4d06:	41 54                	push   %r12
    4d08:	49 89 fc             	mov    %rdi,%r12
    4d0b:	55                   	push   %rbp
    4d0c:	53                   	push   %rbx
    4d0d:	48 83 ec 18          	sub    $0x18,%rsp
    4d11:	48 83 3d 07 97 00 00 	cmpq   $0x0,0x9707(%rip)        # e420 <mparams>
    4d18:	00 
    4d19:	0f 84 41 02 00 00    	je     4f60 <dlmalloc+0x260>
    4d1f:	f6 05 aa 96 00 00 02 	testb  $0x2,0x96aa(%rip)        # e3d0 <_gm_+0x370>
    4d26:	0f 85 fc 01 00 00    	jne    4f28 <dlmalloc+0x228>
    4d2c:	49 81 fc e0 00 00 00 	cmp    $0xe0,%r12
    4d33:	0f 87 f7 00 00 00    	ja     4e30 <dlmalloc+0x130>
    4d39:	49 83 fc 0e          	cmp    $0xe,%r12
    4d3d:	0f 87 cd 01 00 00    	ja     4f10 <dlmalloc+0x210>
    4d43:	b9 04 00 00 00       	mov    $0x4,%ecx
    4d48:	bd 20 00 00 00       	mov    $0x20,%ebp
    4d4d:	8b 15 0d 93 00 00    	mov    0x930d(%rip),%edx        # e060 <_gm_>
    4d53:	4c 8d 2d 06 93 00 00 	lea    0x9306(%rip),%r13        # e060 <_gm_>
    4d5a:	89 d0                	mov    %edx,%eax
    4d5c:	d3 e8                	shr    %cl,%eax
    4d5e:	a8 03                	test   $0x3,%al
    4d60:	0f 84 0a 02 00 00    	je     4f70 <dlmalloc+0x270>
    4d66:	f7 d0                	not    %eax
    4d68:	83 e0 01             	and    $0x1,%eax
    4d6b:	01 c1                	add    %eax,%ecx
    4d6d:	8d 04 09             	lea    (%rcx,%rcx,1),%eax
    4d70:	49 8d 74 c5 48       	lea    0x48(%r13,%rax,8),%rsi
    4d75:	48 8b 5e 10          	mov    0x10(%rsi),%rbx
    4d79:	48 8b 43 10          	mov    0x10(%rbx),%rax
    4d7d:	48 39 c6             	cmp    %rax,%rsi
    4d80:	0f 84 8a 06 00 00    	je     5410 <dlmalloc+0x710>
    4d86:	48 39 05 eb 92 00 00 	cmp    %rax,0x92eb(%rip)        # e078 <_gm_+0x18>
    4d8d:	0f 87 ad 06 00 00    	ja     5440 <dlmalloc+0x740>
    4d93:	48 39 58 18          	cmp    %rbx,0x18(%rax)
    4d97:	0f 85 a3 06 00 00    	jne    5440 <dlmalloc+0x740>
    4d9d:	48 89 70 18          	mov    %rsi,0x18(%rax)
    4da1:	48 89 46 10          	mov    %rax,0x10(%rsi)
    4da5:	c1 e1 03             	shl    $0x3,%ecx
    4da8:	4c 33 2d 71 96 00 00 	xor    0x9671(%rip),%r13        # e420 <mparams>
    4daf:	89 c8                	mov    %ecx,%eax
    4db1:	83 c8 03             	or     $0x3,%eax
    4db4:	48 89 43 08          	mov    %rax,0x8(%rbx)
    4db8:	48 8d 04 0b          	lea    (%rbx,%rcx,1),%rax
    4dbc:	48 83 c3 10          	add    $0x10,%rbx
    4dc0:	48 83 48 08 01       	orq    $0x1,0x8(%rax)
    4dc5:	48 85 db             	test   %rbx,%rbx
    4dc8:	4c 89 28             	mov    %r13,(%rax)
    4dcb:	0f 84 37 01 00 00    	je     4f08 <dlmalloc+0x208>
    4dd1:	e8 4a e1 ff ff       	callq  2f20 <get_heap_base>
    4dd6:	48 39 d8             	cmp    %rbx,%rax
    4dd9:	0f 87 61 06 00 00    	ja     5440 <dlmalloc+0x740>
    4ddf:	48 89 d8             	mov    %rbx,%rax
    4de2:	48 f7 d0             	not    %rax
    4de5:	4c 39 e0             	cmp    %r12,%rax
    4de8:	0f 82 52 06 00 00    	jb     5440 <dlmalloc+0x740>
    4dee:	31 ff                	xor    %edi,%edi
    4df0:	49 01 dc             	add    %rbx,%r12
    4df3:	e8 08 2f 00 00       	callq  7d00 <sbrk>
    4df8:	4c 39 e0             	cmp    %r12,%rax
    4dfb:	0f 82 3f 06 00 00    	jb     5440 <dlmalloc+0x740>
    4e01:	f6 05 c8 95 00 00 02 	testb  $0x2,0x95c8(%rip)        # e3d0 <_gm_+0x370>
    4e08:	74 0a                	je     4e14 <dlmalloc+0x114>
    4e0a:	c7 05 c0 95 00 00 00 	movl   $0x0,0x95c0(%rip)        # e3d4 <_gm_+0x374>
    4e11:	00 00 00 
    4e14:	48 83 c4 18          	add    $0x18,%rsp
    4e18:	48 89 d8             	mov    %rbx,%rax
    4e1b:	5b                   	pop    %rbx
    4e1c:	5d                   	pop    %rbp
    4e1d:	41 5c                	pop    %r12
    4e1f:	41 5d                	pop    %r13
    4e21:	41 5e                	pop    %r14
    4e23:	41 5f                	pop    %r15
    4e25:	c3                   	retq   
    4e26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    4e2d:	00 00 00 
    4e30:	48 8b 35 31 92 00 00 	mov    0x9231(%rip),%rsi        # e068 <_gm_+0x8>
    4e37:	49 81 fc 7f ff ff ff 	cmp    $0xffffffffffffff7f,%r12
    4e3e:	4c 8d 2d 1b 92 00 00 	lea    0x921b(%rip),%r13        # e060 <_gm_>
    4e45:	48 89 f7             	mov    %rsi,%rdi
    4e48:	76 46                	jbe    4e90 <dlmalloc+0x190>
    4e4a:	48 83 fe ff          	cmp    $0xffffffffffffffff,%rsi
    4e4e:	48 8b 05 cb 95 00 00 	mov    0x95cb(%rip),%rax        # e420 <mparams>
    4e55:	0f 85 35 02 00 00    	jne    5090 <dlmalloc+0x390>
    4e5b:	48 8b 1d 1e 92 00 00 	mov    0x921e(%rip),%rbx        # e080 <_gm_+0x20>
    4e62:	48 8d 14 33          	lea    (%rbx,%rsi,1),%rdx
    4e66:	49 31 c5             	xor    %rax,%r13
    4e69:	48 c7 05 f4 91 00 00 	movq   $0x0,0x91f4(%rip)        # e068 <_gm_+0x8>
    4e70:	00 00 00 00 
    4e74:	48 c7 05 01 92 00 00 	movq   $0x0,0x9201(%rip)        # e080 <_gm_+0x20>
    4e7b:	00 00 00 00 
    4e7f:	48 89 73 08          	mov    %rsi,0x8(%rbx)
    4e83:	4c 89 2a             	mov    %r13,(%rdx)
    4e86:	48 83 4a 08 01       	orq    $0x1,0x8(%rdx)
    4e8b:	eb 6e                	jmp    4efb <dlmalloc+0x1fb>
    4e8d:	0f 1f 00             	nopl   (%rax)
    4e90:	44 8b 05 cd 91 00 00 	mov    0x91cd(%rip),%r8d        # e064 <_gm_+0x4>
    4e97:	49 8d 6c 24 1f       	lea    0x1f(%r12),%rbp
    4e9c:	48 83 e5 f0          	and    $0xfffffffffffffff0,%rbp
    4ea0:	45 85 c0             	test   %r8d,%r8d
    4ea3:	0f 85 47 03 00 00    	jne    51f0 <dlmalloc+0x4f0>
    4ea9:	48 39 fd             	cmp    %rdi,%rbp
    4eac:	0f 86 7e 01 00 00    	jbe    5030 <dlmalloc+0x330>
    4eb2:	48 8b 05 b7 91 00 00 	mov    0x91b7(%rip),%rax        # e070 <_gm_+0x10>
    4eb9:	48 8b 15 60 95 00 00 	mov    0x9560(%rip),%rdx        # e420 <mparams>
    4ec0:	48 39 e8             	cmp    %rbp,%rax
    4ec3:	0f 86 6e 17 00 00    	jbe    6637 <dlmalloc+0x1937>
    4ec9:	48 8b 1d b8 91 00 00 	mov    0x91b8(%rip),%rbx        # e088 <_gm_+0x28>
    4ed0:	48 29 e8             	sub    %rbp,%rax
    4ed3:	49 31 d5             	xor    %rdx,%r13
    4ed6:	48 89 05 93 91 00 00 	mov    %rax,0x9193(%rip)        # e070 <_gm_+0x10>
    4edd:	48 83 c8 01          	or     $0x1,%rax
    4ee1:	48 8d 0c 2b          	lea    (%rbx,%rbp,1),%rcx
    4ee5:	48 83 cd 03          	or     $0x3,%rbp
    4ee9:	48 89 0d 98 91 00 00 	mov    %rcx,0x9198(%rip)        # e088 <_gm_+0x28>
    4ef0:	48 89 41 08          	mov    %rax,0x8(%rcx)
    4ef4:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    4ef8:	4c 89 29             	mov    %r13,(%rcx)
    4efb:	48 83 c3 10          	add    $0x10,%rbx
    4eff:	48 85 db             	test   %rbx,%rbx
    4f02:	0f 85 c9 fe ff ff    	jne    4dd1 <dlmalloc+0xd1>
    4f08:	31 db                	xor    %ebx,%ebx
    4f0a:	e9 f2 fe ff ff       	jmpq   4e01 <dlmalloc+0x101>
    4f0f:	90                   	nop
    4f10:	49 8d 6c 24 1f       	lea    0x1f(%r12),%rbp
    4f15:	48 83 e5 f0          	and    $0xfffffffffffffff0,%rbp
    4f19:	48 89 e9             	mov    %rbp,%rcx
    4f1c:	48 c1 e9 03          	shr    $0x3,%rcx
    4f20:	e9 28 fe ff ff       	jmpq   4d4d <dlmalloc+0x4d>
    4f25:	0f 1f 00             	nopl   (%rax)
    4f28:	b8 01 00 00 00       	mov    $0x1,%eax
    4f2d:	87 05 a1 94 00 00    	xchg   %eax,0x94a1(%rip)        # e3d4 <_gm_+0x374>
    4f33:	85 c0                	test   %eax,%eax
    4f35:	0f 84 f1 fd ff ff    	je     4d2c <dlmalloc+0x2c>
    4f3b:	ba 01 00 00 00       	mov    $0x1,%edx
    4f40:	8b 05 8e 94 00 00    	mov    0x948e(%rip),%eax        # e3d4 <_gm_+0x374>
    4f46:	85 c0                	test   %eax,%eax
    4f48:	75 f6                	jne    4f40 <dlmalloc+0x240>
    4f4a:	89 d0                	mov    %edx,%eax
    4f4c:	87 05 82 94 00 00    	xchg   %eax,0x9482(%rip)        # e3d4 <_gm_+0x374>
    4f52:	85 c0                	test   %eax,%eax
    4f54:	75 ea                	jne    4f40 <dlmalloc+0x240>
    4f56:	e9 d1 fd ff ff       	jmpq   4d2c <dlmalloc+0x2c>
    4f5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    4f60:	e8 5b f5 ff ff       	callq  44c0 <init_mparams>
    4f65:	e9 b5 fd ff ff       	jmpq   4d1f <dlmalloc+0x1f>
    4f6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4f70:	48 8b 35 f1 90 00 00 	mov    0x90f1(%rip),%rsi        # e068 <_gm_+0x8>
    4f77:	48 39 ee             	cmp    %rbp,%rsi
    4f7a:	48 89 f7             	mov    %rsi,%rdi
    4f7d:	0f 83 ad 00 00 00    	jae    5030 <dlmalloc+0x330>
    4f83:	85 c0                	test   %eax,%eax
    4f85:	0f 84 ba 04 00 00    	je     5445 <dlmalloc+0x745>
    4f8b:	bf 01 00 00 00       	mov    $0x1,%edi
    4f90:	d3 e0                	shl    %cl,%eax
    4f92:	41 89 f8             	mov    %edi,%r8d
    4f95:	41 d3 e0             	shl    %cl,%r8d
    4f98:	47 8d 0c 00          	lea    (%r8,%r8,1),%r9d
    4f9c:	45 89 c8             	mov    %r9d,%r8d
    4f9f:	41 f7 d8             	neg    %r8d
    4fa2:	45 09 c8             	or     %r9d,%r8d
    4fa5:	44 21 c0             	and    %r8d,%eax
    4fa8:	89 c1                	mov    %eax,%ecx
    4faa:	f7 d9                	neg    %ecx
    4fac:	21 c8                	and    %ecx,%eax
    4fae:	31 c9                	xor    %ecx,%ecx
    4fb0:	f3 0f bc c8          	tzcnt  %eax,%ecx
    4fb4:	8d 04 09             	lea    (%rcx,%rcx,1),%eax
    4fb7:	4d 8d 44 c5 48       	lea    0x48(%r13,%rax,8),%r8
    4fbc:	49 8b 58 10          	mov    0x10(%r8),%rbx
    4fc0:	48 8b 43 10          	mov    0x10(%rbx),%rax
    4fc4:	49 39 c0             	cmp    %rax,%r8
    4fc7:	0f 84 74 06 00 00    	je     5641 <dlmalloc+0x941>
    4fcd:	48 39 05 a4 90 00 00 	cmp    %rax,0x90a4(%rip)        # e078 <_gm_+0x18>
    4fd4:	0f 87 66 04 00 00    	ja     5440 <dlmalloc+0x740>
    4fda:	48 39 58 18          	cmp    %rbx,0x18(%rax)
    4fde:	0f 85 5c 04 00 00    	jne    5440 <dlmalloc+0x740>
    4fe4:	4c 89 40 18          	mov    %r8,0x18(%rax)
    4fe8:	49 89 40 10          	mov    %rax,0x10(%r8)
    4fec:	8d 04 cd 00 00 00 00 	lea    0x0(,%rcx,8),%eax
    4ff3:	48 8b 3d 26 94 00 00 	mov    0x9426(%rip),%rdi        # e420 <mparams>
    4ffa:	48 89 c2             	mov    %rax,%rdx
    4ffd:	48 89 c1             	mov    %rax,%rcx
    5000:	48 01 d8             	add    %rbx,%rax
    5003:	48 29 ea             	sub    %rbp,%rdx
    5006:	4c 31 ef             	xor    %r13,%rdi
    5009:	48 83 fa 1f          	cmp    $0x1f,%rdx
    500d:	0f 87 7b 0b 00 00    	ja     5b8e <dlmalloc+0xe8e>
    5013:	83 c9 03             	or     $0x3,%ecx
    5016:	89 ce                	mov    %ecx,%esi
    5018:	48 89 73 08          	mov    %rsi,0x8(%rbx)
    501c:	48 89 38             	mov    %rdi,(%rax)
    501f:	48 83 48 08 01       	orq    $0x1,0x8(%rax)
    5024:	e9 d2 fe ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    5029:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    5030:	48 8b 05 e9 93 00 00 	mov    0x93e9(%rip),%rax        # e420 <mparams>
    5037:	48 89 f9             	mov    %rdi,%rcx
    503a:	48 8b 1d 3f 90 00 00 	mov    0x903f(%rip),%rbx        # e080 <_gm_+0x20>
    5041:	48 29 e9             	sub    %rbp,%rcx
    5044:	4c 89 ee             	mov    %r13,%rsi
    5047:	48 31 c6             	xor    %rax,%rsi
    504a:	48 83 f9 1f          	cmp    $0x1f,%rcx
    504e:	48 8d 14 3b          	lea    (%rbx,%rdi,1),%rdx
    5052:	0f 86 d3 15 00 00    	jbe    662b <dlmalloc+0x192b>
    5058:	48 8d 04 2b          	lea    (%rbx,%rbp,1),%rax
    505c:	48 89 cf             	mov    %rcx,%rdi
    505f:	48 83 cd 03          	or     $0x3,%rbp
    5063:	48 83 cf 01          	or     $0x1,%rdi
    5067:	48 89 0d fa 8f 00 00 	mov    %rcx,0x8ffa(%rip)        # e068 <_gm_+0x8>
    506e:	48 89 05 0b 90 00 00 	mov    %rax,0x900b(%rip)        # e080 <_gm_+0x20>
    5075:	48 89 78 08          	mov    %rdi,0x8(%rax)
    5079:	48 89 0a             	mov    %rcx,(%rdx)
    507c:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    5080:	48 89 30             	mov    %rsi,(%rax)
    5083:	e9 73 fe ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    5088:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    508f:	00 
    5090:	48 85 c0             	test   %rax,%rax
    5093:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
    509a:	0f 85 68 fe ff ff    	jne    4f08 <dlmalloc+0x208>
    50a0:	e8 1b f4 ff ff       	callq  44c0 <init_mparams>
    50a5:	48 8b 05 84 93 00 00 	mov    0x9384(%rip),%rax        # e430 <mparams+0x10>
    50ac:	48 8d 4c 05 5f       	lea    0x5f(%rbp,%rax,1),%rcx
    50b1:	48 f7 d8             	neg    %rax
    50b4:	48 21 c1             	and    %rax,%rcx
    50b7:	48 39 e9             	cmp    %rbp,%rcx
    50ba:	0f 86 48 fe ff ff    	jbe    4f08 <dlmalloc+0x208>
    50c0:	48 8b 05 01 93 00 00 	mov    0x9301(%rip),%rax        # e3c8 <_gm_+0x368>
    50c7:	48 85 c0             	test   %rax,%rax
    50ca:	74 1d                	je     50e9 <dlmalloc+0x3e9>
    50cc:	48 8b 35 e5 92 00 00 	mov    0x92e5(%rip),%rsi        # e3b8 <_gm_+0x358>
    50d3:	48 8d 14 31          	lea    (%rcx,%rsi,1),%rdx
    50d7:	48 39 d0             	cmp    %rdx,%rax
    50da:	0f 82 28 fe ff ff    	jb     4f08 <dlmalloc+0x208>
    50e0:	48 39 d6             	cmp    %rdx,%rsi
    50e3:	0f 83 1f fe ff ff    	jae    4f08 <dlmalloc+0x208>
    50e9:	f6 05 e0 92 00 00 04 	testb  $0x4,0x92e0(%rip)        # e3d0 <_gm_+0x370>
    50f0:	0f 85 cc 00 00 00    	jne    51c2 <dlmalloc+0x4c2>
    50f6:	48 8b 15 8b 8f 00 00 	mov    0x8f8b(%rip),%rdx        # e088 <_gm_+0x28>
    50fd:	48 85 d2             	test   %rdx,%rdx
    5100:	74 2c                	je     512e <dlmalloc+0x42e>
    5102:	4c 8d 35 cf 92 00 00 	lea    0x92cf(%rip),%r14        # e3d8 <_gm_+0x378>
    5109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    5110:	49 8b 06             	mov    (%r14),%rax
    5113:	48 39 c2             	cmp    %rax,%rdx
    5116:	72 0d                	jb     5125 <dlmalloc+0x425>
    5118:	49 03 46 08          	add    0x8(%r14),%rax
    511c:	48 39 c2             	cmp    %rax,%rdx
    511f:	0f 82 ff 0d 00 00    	jb     5f24 <dlmalloc+0x1224>
    5125:	4d 8b 76 10          	mov    0x10(%r14),%r14
    5129:	4d 85 f6             	test   %r14,%r14
    512c:	75 e2                	jne    5110 <dlmalloc+0x410>
    512e:	b8 01 00 00 00       	mov    $0x1,%eax
    5133:	87 05 17 93 00 00    	xchg   %eax,0x9317(%rip)        # e450 <malloc_global_mutex>
    5139:	85 c0                	test   %eax,%eax
    513b:	0f 85 7d 09 00 00    	jne    5abe <dlmalloc+0xdbe>
    5141:	31 ff                	xor    %edi,%edi
    5143:	48 89 0c 24          	mov    %rcx,(%rsp)
    5147:	e8 b4 2b 00 00       	callq  7d00 <sbrk>
    514c:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    5150:	49 89 c6             	mov    %rax,%r14
    5153:	48 8b 0c 24          	mov    (%rsp),%rcx
    5157:	74 5f                	je     51b8 <dlmalloc+0x4b8>
    5159:	48 8b 15 c8 92 00 00 	mov    0x92c8(%rip),%rdx        # e428 <mparams+0x8>
    5160:	49 89 cf             	mov    %rcx,%r15
    5163:	48 8d 42 ff          	lea    -0x1(%rdx),%rax
    5167:	49 85 c6             	test   %rax,%r14
    516a:	74 0f                	je     517b <dlmalloc+0x47b>
    516c:	4c 01 f0             	add    %r14,%rax
    516f:	48 f7 da             	neg    %rdx
    5172:	4d 29 f7             	sub    %r14,%r15
    5175:	48 21 d0             	and    %rdx,%rax
    5178:	49 01 c7             	add    %rax,%r15
    517b:	4c 39 fd             	cmp    %r15,%rbp
    517e:	73 38                	jae    51b8 <dlmalloc+0x4b8>
    5180:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    5187:	ff ff 7f 
    518a:	49 39 c7             	cmp    %rax,%r15
    518d:	77 29                	ja     51b8 <dlmalloc+0x4b8>
    518f:	48 8b 35 32 92 00 00 	mov    0x9232(%rip),%rsi        # e3c8 <_gm_+0x368>
    5196:	48 85 f6             	test   %rsi,%rsi
    5199:	0f 84 b9 13 00 00    	je     6558 <dlmalloc+0x1858>
    519f:	48 8b 15 12 92 00 00 	mov    0x9212(%rip),%rdx        # e3b8 <_gm_+0x358>
    51a6:	49 8d 04 17          	lea    (%r15,%rdx,1),%rax
    51aa:	48 39 c6             	cmp    %rax,%rsi
    51ad:	72 09                	jb     51b8 <dlmalloc+0x4b8>
    51af:	48 39 c2             	cmp    %rax,%rdx
    51b2:	0f 82 a0 13 00 00    	jb     6558 <dlmalloc+0x1858>
    51b8:	c7 05 8e 92 00 00 00 	movl   $0x0,0x928e(%rip)        # e450 <malloc_global_mutex>
    51bf:	00 00 00 
    51c2:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    51c9:	ff ff 7f 
    51cc:	48 39 c1             	cmp    %rax,%rcx
    51cf:	0f 86 7d 04 00 00    	jbe    5652 <dlmalloc+0x952>
    51d5:	e8 36 2e 00 00       	callq  8010 <__errno_location>
    51da:	31 db                	xor    %ebx,%ebx
    51dc:	c7 00 0c 00 00 00    	movl   $0xc,(%rax)
    51e2:	e9 1a fc ff ff       	jmpq   4e01 <dlmalloc+0x101>
    51e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    51ee:	00 00 
    51f0:	48 89 e8             	mov    %rbp,%rax
    51f3:	49 89 e9             	mov    %rbp,%r9
    51f6:	48 c1 e8 08          	shr    $0x8,%rax
    51fa:	49 f7 d9             	neg    %r9
    51fd:	85 c0                	test   %eax,%eax
    51ff:	0f 85 13 04 00 00    	jne    5618 <dlmalloc+0x918>
    5205:	48 8b 05 ac 90 00 00 	mov    0x90ac(%rip),%rax        # e2b8 <_gm_+0x258>
    520c:	45 31 d2             	xor    %r10d,%r10d
    520f:	b9 39 00 00 00       	mov    $0x39,%ecx
    5214:	48 85 c0             	test   %rax,%rax
    5217:	0f 84 ee 0c 00 00    	je     5f0b <dlmalloc+0x120b>
    521d:	48 89 eb             	mov    %rbp,%rbx
    5220:	48 d3 e3             	shl    %cl,%rbx
    5223:	48 89 d9             	mov    %rbx,%rcx
    5226:	45 31 db             	xor    %r11d,%r11d
    5229:	31 db                	xor    %ebx,%ebx
    522b:	eb 06                	jmp    5233 <dlmalloc+0x533>
    522d:	0f 1f 00             	nopl   (%rax)
    5230:	48 01 c9             	add    %rcx,%rcx
    5233:	48 8b 50 08          	mov    0x8(%rax),%rdx
    5237:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
    523b:	48 29 ea             	sub    %rbp,%rdx
    523e:	4c 39 ca             	cmp    %r9,%rdx
    5241:	73 0f                	jae    5252 <dlmalloc+0x552>
    5243:	48 85 d2             	test   %rdx,%rdx
    5246:	0f 84 fe 0a 00 00    	je     5d4a <dlmalloc+0x104a>
    524c:	49 89 d1             	mov    %rdx,%r9
    524f:	48 89 c3             	mov    %rax,%rbx
    5252:	4c 8b 70 28          	mov    0x28(%rax),%r14
    5256:	48 89 ca             	mov    %rcx,%rdx
    5259:	48 c1 ea 3f          	shr    $0x3f,%rdx
    525d:	48 83 c2 04          	add    $0x4,%rdx
    5261:	4d 85 f6             	test   %r14,%r14
    5264:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    5268:	74 07                	je     5271 <dlmalloc+0x571>
    526a:	49 39 c6             	cmp    %rax,%r14
    526d:	4d 0f 45 de          	cmovne %r14,%r11
    5271:	48 85 c0             	test   %rax,%rax
    5274:	75 ba                	jne    5230 <dlmalloc+0x530>
    5276:	4d 85 db             	test   %r11,%r11
    5279:	0f 85 5a 0a 00 00    	jne    5cd9 <dlmalloc+0xfd9>
    527f:	48 85 db             	test   %rbx,%rbx
    5282:	0f 85 51 0a 00 00    	jne    5cd9 <dlmalloc+0xfd9>
    5288:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    528d:	44 89 d1             	mov    %r10d,%ecx
    5290:	4c 89 ca             	mov    %r9,%rdx
    5293:	d3 e0                	shl    %cl,%eax
    5295:	44 21 c0             	and    %r8d,%eax
    5298:	0f 84 0b fc ff ff    	je     4ea9 <dlmalloc+0x1a9>
    529e:	89 c1                	mov    %eax,%ecx
    52a0:	31 db                	xor    %ebx,%ebx
    52a2:	f7 d9                	neg    %ecx
    52a4:	21 c8                	and    %ecx,%eax
    52a6:	f3 0f bc c0          	tzcnt  %eax,%eax
    52aa:	89 c0                	mov    %eax,%eax
    52ac:	49 8b 84 c5 58 02 00 	mov    0x258(%r13,%rax,8),%rax
    52b3:	00 
    52b4:	48 85 c0             	test   %rax,%rax
    52b7:	75 0a                	jne    52c3 <dlmalloc+0x5c3>
    52b9:	e9 eb fb ff ff       	jmpq   4ea9 <dlmalloc+0x1a9>
    52be:	66 90                	xchg   %ax,%ax
    52c0:	48 89 c8             	mov    %rcx,%rax
    52c3:	48 8b 48 08          	mov    0x8(%rax),%rcx
    52c7:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    52cb:	48 29 e9             	sub    %rbp,%rcx
    52ce:	48 39 d1             	cmp    %rdx,%rcx
    52d1:	73 06                	jae    52d9 <dlmalloc+0x5d9>
    52d3:	48 89 ca             	mov    %rcx,%rdx
    52d6:	48 89 c3             	mov    %rax,%rbx
    52d9:	48 8b 48 20          	mov    0x20(%rax),%rcx
    52dd:	48 85 c9             	test   %rcx,%rcx
    52e0:	75 de                	jne    52c0 <dlmalloc+0x5c0>
    52e2:	48 8b 48 28          	mov    0x28(%rax),%rcx
    52e6:	48 85 c9             	test   %rcx,%rcx
    52e9:	75 d5                	jne    52c0 <dlmalloc+0x5c0>
    52eb:	48 85 db             	test   %rbx,%rbx
    52ee:	0f 84 b5 fb ff ff    	je     4ea9 <dlmalloc+0x1a9>
    52f4:	48 89 f0             	mov    %rsi,%rax
    52f7:	48 29 e8             	sub    %rbp,%rax
    52fa:	48 39 d0             	cmp    %rdx,%rax
    52fd:	0f 86 a6 fb ff ff    	jbe    4ea9 <dlmalloc+0x1a9>
    5303:	4c 8b 1d 6e 8d 00 00 	mov    0x8d6e(%rip),%r11        # e078 <_gm_+0x18>
    530a:	49 39 db             	cmp    %rbx,%r11
    530d:	0f 87 2d 01 00 00    	ja     5440 <dlmalloc+0x740>
    5313:	4c 8d 14 2b          	lea    (%rbx,%rbp,1),%r10
    5317:	49 39 da             	cmp    %rbx,%r10
    531a:	0f 86 20 01 00 00    	jbe    5440 <dlmalloc+0x740>
    5320:	48 8b 43 18          	mov    0x18(%rbx),%rax
    5324:	4c 8b 73 30          	mov    0x30(%rbx),%r14
    5328:	48 39 d8             	cmp    %rbx,%rax
    532b:	0f 84 8c 0a 00 00    	je     5dbd <dlmalloc+0x10bd>
    5331:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
    5335:	49 39 cb             	cmp    %rcx,%r11
    5338:	0f 87 02 01 00 00    	ja     5440 <dlmalloc+0x740>
    533e:	48 39 59 18          	cmp    %rbx,0x18(%rcx)
    5342:	0f 85 f8 00 00 00    	jne    5440 <dlmalloc+0x740>
    5348:	48 39 58 10          	cmp    %rbx,0x10(%rax)
    534c:	0f 85 ee 00 00 00    	jne    5440 <dlmalloc+0x740>
    5352:	48 89 41 18          	mov    %rax,0x18(%rcx)
    5356:	48 89 48 10          	mov    %rcx,0x10(%rax)
    535a:	4d 85 f6             	test   %r14,%r14
    535d:	74 6e                	je     53cd <dlmalloc+0x6cd>
    535f:	8b 7b 38             	mov    0x38(%rbx),%edi
    5362:	48 89 f9             	mov    %rdi,%rcx
    5365:	48 83 c7 4a          	add    $0x4a,%rdi
    5369:	49 39 5c fd 08       	cmp    %rbx,0x8(%r13,%rdi,8)
    536e:	0f 84 c8 0b 00 00    	je     5f3c <dlmalloc+0x123c>
    5374:	4d 39 f3             	cmp    %r14,%r11
    5377:	0f 87 c3 00 00 00    	ja     5440 <dlmalloc+0x740>
    537d:	49 39 5e 20          	cmp    %rbx,0x20(%r14)
    5381:	0f 84 dd 0c 00 00    	je     6064 <dlmalloc+0x1364>
    5387:	49 89 46 28          	mov    %rax,0x28(%r14)
    538b:	48 85 c0             	test   %rax,%rax
    538e:	74 3d                	je     53cd <dlmalloc+0x6cd>
    5390:	49 39 c3             	cmp    %rax,%r11
    5393:	0f 87 a7 00 00 00    	ja     5440 <dlmalloc+0x740>
    5399:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
    539d:	4c 89 70 30          	mov    %r14,0x30(%rax)
    53a1:	48 85 c9             	test   %rcx,%rcx
    53a4:	74 11                	je     53b7 <dlmalloc+0x6b7>
    53a6:	49 39 cb             	cmp    %rcx,%r11
    53a9:	0f 87 91 00 00 00    	ja     5440 <dlmalloc+0x740>
    53af:	48 89 48 20          	mov    %rcx,0x20(%rax)
    53b3:	48 89 41 30          	mov    %rax,0x30(%rcx)
    53b7:	48 8b 4b 28          	mov    0x28(%rbx),%rcx
    53bb:	48 85 c9             	test   %rcx,%rcx
    53be:	74 0d                	je     53cd <dlmalloc+0x6cd>
    53c0:	49 39 cb             	cmp    %rcx,%r11
    53c3:	77 7b                	ja     5440 <dlmalloc+0x740>
    53c5:	48 89 48 28          	mov    %rcx,0x28(%rax)
    53c9:	48 89 41 30          	mov    %rax,0x30(%rcx)
    53cd:	48 8b 0d 4c 90 00 00 	mov    0x904c(%rip),%rcx        # e420 <mparams>
    53d4:	4c 31 e9             	xor    %r13,%rcx
    53d7:	48 83 fa 1f          	cmp    $0x1f,%rdx
    53db:	0f 87 71 09 00 00    	ja     5d52 <dlmalloc+0x1052>
    53e1:	48 8d 44 15 00       	lea    0x0(%rbp,%rdx,1),%rax
    53e6:	48 89 c2             	mov    %rax,%rdx
    53e9:	48 01 d8             	add    %rbx,%rax
    53ec:	48 83 ca 03          	or     $0x3,%rdx
    53f0:	48 89 53 08          	mov    %rdx,0x8(%rbx)
    53f4:	48 83 48 08 01       	orq    $0x1,0x8(%rax)
    53f9:	48 89 08             	mov    %rcx,(%rax)
    53fc:	48 83 c3 10          	add    $0x10,%rbx
    5400:	48 89 f7             	mov    %rsi,%rdi
    5403:	0f 85 c8 f9 ff ff    	jne    4dd1 <dlmalloc+0xd1>
    5409:	e9 9b fa ff ff       	jmpq   4ea9 <dlmalloc+0x1a9>
    540e:	66 90                	xchg   %ax,%ax
    5410:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    5415:	d3 c0                	rol    %cl,%eax
    5417:	21 c2                	and    %eax,%edx
    5419:	89 15 41 8c 00 00    	mov    %edx,0x8c41(%rip)        # e060 <_gm_>
    541f:	e9 81 f9 ff ff       	jmpq   4da5 <dlmalloc+0xa5>
    5424:	4c 3b 0d 4d 8c 00 00 	cmp    0x8c4d(%rip),%r9        # e078 <_gm_+0x18>
    542b:	72 13                	jb     5440 <dlmalloc+0x740>
    542d:	49 39 51 18          	cmp    %rdx,0x18(%r9)
    5431:	0f 84 87 0f 00 00    	je     63be <dlmalloc+0x16be>
    5437:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    543e:	00 00 
    5440:	e8 5b 39 00 00       	callq  8da0 <abort>
    5445:	44 8b 05 18 8c 00 00 	mov    0x8c18(%rip),%r8d        # e064 <_gm_+0x4>
    544c:	45 85 c0             	test   %r8d,%r8d
    544f:	0f 84 5d fa ff ff    	je     4eb2 <dlmalloc+0x1b2>
    5455:	44 89 c0             	mov    %r8d,%eax
    5458:	f7 d8                	neg    %eax
    545a:	44 21 c0             	and    %r8d,%eax
    545d:	f3 0f bc c0          	tzcnt  %eax,%eax
    5461:	89 c0                	mov    %eax,%eax
    5463:	49 8b 84 c5 58 02 00 	mov    0x258(%r13,%rax,8),%rax
    546a:	00 
    546b:	48 8b 78 08          	mov    0x8(%rax),%rdi
    546f:	48 89 c3             	mov    %rax,%rbx
    5472:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
    5476:	48 29 ef             	sub    %rbp,%rdi
    5479:	eb 1e                	jmp    5499 <dlmalloc+0x799>
    547b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    5480:	48 8b 41 08          	mov    0x8(%rcx),%rax
    5484:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    5488:	48 29 e8             	sub    %rbp,%rax
    548b:	48 39 f8             	cmp    %rdi,%rax
    548e:	73 06                	jae    5496 <dlmalloc+0x796>
    5490:	48 89 c7             	mov    %rax,%rdi
    5493:	48 89 cb             	mov    %rcx,%rbx
    5496:	48 89 c8             	mov    %rcx,%rax
    5499:	48 8b 48 20          	mov    0x20(%rax),%rcx
    549d:	48 85 c9             	test   %rcx,%rcx
    54a0:	75 de                	jne    5480 <dlmalloc+0x780>
    54a2:	48 8b 48 28          	mov    0x28(%rax),%rcx
    54a6:	48 85 c9             	test   %rcx,%rcx
    54a9:	75 d5                	jne    5480 <dlmalloc+0x780>
    54ab:	4c 8b 35 c6 8b 00 00 	mov    0x8bc6(%rip),%r14        # e078 <_gm_+0x18>
    54b2:	49 39 de             	cmp    %rbx,%r14
    54b5:	77 89                	ja     5440 <dlmalloc+0x740>
    54b7:	4c 8d 1c 2b          	lea    (%rbx,%rbp,1),%r11
    54bb:	49 39 db             	cmp    %rbx,%r11
    54be:	76 80                	jbe    5440 <dlmalloc+0x740>
    54c0:	48 8b 43 18          	mov    0x18(%rbx),%rax
    54c4:	4c 8b 7b 30          	mov    0x30(%rbx),%r15
    54c8:	48 39 d8             	cmp    %rbx,%rax
    54cb:	0f 84 81 0c 00 00    	je     6152 <dlmalloc+0x1452>
    54d1:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
    54d5:	49 39 ce             	cmp    %rcx,%r14
    54d8:	0f 87 62 ff ff ff    	ja     5440 <dlmalloc+0x740>
    54de:	48 39 59 18          	cmp    %rbx,0x18(%rcx)
    54e2:	0f 85 58 ff ff ff    	jne    5440 <dlmalloc+0x740>
    54e8:	48 39 58 10          	cmp    %rbx,0x10(%rax)
    54ec:	0f 85 4e ff ff ff    	jne    5440 <dlmalloc+0x740>
    54f2:	48 89 41 18          	mov    %rax,0x18(%rcx)
    54f6:	48 89 48 10          	mov    %rcx,0x10(%rax)
    54fa:	4d 85 ff             	test   %r15,%r15
    54fd:	74 73                	je     5572 <dlmalloc+0x872>
    54ff:	44 8b 4b 38          	mov    0x38(%rbx),%r9d
    5503:	4c 89 c9             	mov    %r9,%rcx
    5506:	49 83 c1 4a          	add    $0x4a,%r9
    550a:	4b 39 5c cd 08       	cmp    %rbx,0x8(%r13,%r9,8)
    550f:	0f 84 f5 0d 00 00    	je     630a <dlmalloc+0x160a>
    5515:	4d 39 fe             	cmp    %r15,%r14
    5518:	0f 87 22 ff ff ff    	ja     5440 <dlmalloc+0x740>
    551e:	49 39 5f 20          	cmp    %rbx,0x20(%r15)
    5522:	0f 84 bf 0e 00 00    	je     63e7 <dlmalloc+0x16e7>
    5528:	49 89 47 28          	mov    %rax,0x28(%r15)
    552c:	48 85 c0             	test   %rax,%rax
    552f:	74 41                	je     5572 <dlmalloc+0x872>
    5531:	49 39 c6             	cmp    %rax,%r14
    5534:	0f 87 06 ff ff ff    	ja     5440 <dlmalloc+0x740>
    553a:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
    553e:	4c 89 78 30          	mov    %r15,0x30(%rax)
    5542:	48 85 c9             	test   %rcx,%rcx
    5545:	74 11                	je     5558 <dlmalloc+0x858>
    5547:	49 39 ce             	cmp    %rcx,%r14
    554a:	0f 87 f0 fe ff ff    	ja     5440 <dlmalloc+0x740>
    5550:	48 89 48 20          	mov    %rcx,0x20(%rax)
    5554:	48 89 41 30          	mov    %rax,0x30(%rcx)
    5558:	48 8b 4b 28          	mov    0x28(%rbx),%rcx
    555c:	48 85 c9             	test   %rcx,%rcx
    555f:	74 11                	je     5572 <dlmalloc+0x872>
    5561:	49 39 ce             	cmp    %rcx,%r14
    5564:	0f 87 d6 fe ff ff    	ja     5440 <dlmalloc+0x740>
    556a:	48 89 48 28          	mov    %rcx,0x28(%rax)
    556e:	48 89 41 30          	mov    %rax,0x30(%rcx)
    5572:	48 8b 0d a7 8e 00 00 	mov    0x8ea7(%rip),%rcx        # e420 <mparams>
    5579:	4c 31 e9             	xor    %r13,%rcx
    557c:	48 83 ff 1f          	cmp    $0x1f,%rdi
    5580:	0f 86 ac 0b 00 00    	jbe    6132 <dlmalloc+0x1432>
    5586:	48 89 e8             	mov    %rbp,%rax
    5589:	48 83 c8 03          	or     $0x3,%rax
    558d:	48 89 43 08          	mov    %rax,0x8(%rbx)
    5591:	48 89 f8             	mov    %rdi,%rax
    5594:	49 89 0b             	mov    %rcx,(%r11)
    5597:	48 83 c8 01          	or     $0x1,%rax
    559b:	48 85 f6             	test   %rsi,%rsi
    559e:	49 89 43 08          	mov    %rax,0x8(%r11)
    55a2:	49 89 3c 3b          	mov    %rdi,(%r11,%rdi,1)
    55a6:	74 45                	je     55ed <dlmalloc+0x8ed>
    55a8:	48 c1 ee 03          	shr    $0x3,%rsi
    55ac:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    55b2:	48 8b 05 c7 8a 00 00 	mov    0x8ac7(%rip),%rax        # e080 <_gm_+0x20>
    55b9:	48 89 f1             	mov    %rsi,%rcx
    55bc:	44 8d 04 36          	lea    (%rsi,%rsi,1),%r8d
    55c0:	41 d3 e1             	shl    %cl,%r9d
    55c3:	44 85 ca             	test   %r9d,%edx
    55c6:	4f 8d 44 c5 48       	lea    0x48(%r13,%r8,8),%r8
    55cb:	0f 85 6f 0f 00 00    	jne    6540 <dlmalloc+0x1840>
    55d1:	44 09 ca             	or     %r9d,%edx
    55d4:	89 15 86 8a 00 00    	mov    %edx,0x8a86(%rip)        # e060 <_gm_>
    55da:	4c 89 c2             	mov    %r8,%rdx
    55dd:	49 89 40 10          	mov    %rax,0x10(%r8)
    55e1:	48 89 42 18          	mov    %rax,0x18(%rdx)
    55e5:	48 89 50 10          	mov    %rdx,0x10(%rax)
    55e9:	4c 89 40 18          	mov    %r8,0x18(%rax)
    55ed:	48 89 3d 74 8a 00 00 	mov    %rdi,0x8a74(%rip)        # e068 <_gm_+0x8>
    55f4:	4c 89 1d 85 8a 00 00 	mov    %r11,0x8a85(%rip)        # e080 <_gm_+0x20>
    55fb:	48 83 c3 10          	add    $0x10,%rbx
    55ff:	0f 85 cc f7 ff ff    	jne    4dd1 <dlmalloc+0xd1>
    5605:	48 8b 3d 5c 8a 00 00 	mov    0x8a5c(%rip),%rdi        # e068 <_gm_+0x8>
    560c:	e9 98 f8 ff ff       	jmpq   4ea9 <dlmalloc+0x1a9>
    5611:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    5618:	3d ff ff 00 00       	cmp    $0xffff,%eax
    561d:	0f 86 ca 06 00 00    	jbe    5ced <dlmalloc+0xfed>
    5623:	48 8b 05 86 8d 00 00 	mov    0x8d86(%rip),%rax        # e3b0 <_gm_+0x350>
    562a:	48 89 e9             	mov    %rbp,%rcx
    562d:	41 ba 1f 00 00 00    	mov    $0x1f,%r10d
    5633:	48 85 c0             	test   %rax,%rax
    5636:	0f 85 ea fb ff ff    	jne    5226 <dlmalloc+0x526>
    563c:	e9 68 f8 ff ff       	jmpq   4ea9 <dlmalloc+0x1a9>
    5641:	d3 e7                	shl    %cl,%edi
    5643:	f7 d7                	not    %edi
    5645:	21 fa                	and    %edi,%edx
    5647:	89 15 13 8a 00 00    	mov    %edx,0x8a13(%rip)        # e060 <_gm_>
    564d:	e9 9a f9 ff ff       	jmpq   4fec <dlmalloc+0x2ec>
    5652:	b8 01 00 00 00       	mov    $0x1,%eax
    5657:	87 05 f3 8d 00 00    	xchg   %eax,0x8df3(%rip)        # e450 <malloc_global_mutex>
    565d:	48 8d 15 ec 8d 00 00 	lea    0x8dec(%rip),%rdx        # e450 <malloc_global_mutex>
    5664:	be 01 00 00 00       	mov    $0x1,%esi
    5669:	85 c0                	test   %eax,%eax
    566b:	0f 85 cf 02 00 00    	jne    5940 <dlmalloc+0xc40>
    5671:	48 89 cf             	mov    %rcx,%rdi
    5674:	e8 87 26 00 00       	callq  7d00 <sbrk>
    5679:	31 ff                	xor    %edi,%edi
    567b:	48 89 c3             	mov    %rax,%rbx
    567e:	e8 7d 26 00 00       	callq  7d00 <sbrk>
    5683:	48 83 fb ff          	cmp    $0xffffffffffffffff,%rbx
    5687:	0f 95 c1             	setne  %cl
    568a:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    568e:	0f 95 c2             	setne  %dl
    5691:	84 d1                	test   %dl,%cl
    5693:	c7 05 b3 8d 00 00 00 	movl   $0x0,0x8db3(%rip)        # e450 <malloc_global_mutex>
    569a:	00 00 00 
    569d:	0f 84 32 fb ff ff    	je     51d5 <dlmalloc+0x4d5>
    56a3:	48 39 c3             	cmp    %rax,%rbx
    56a6:	0f 83 29 fb ff ff    	jae    51d5 <dlmalloc+0x4d5>
    56ac:	48 29 d8             	sub    %rbx,%rax
    56af:	49 89 c7             	mov    %rax,%r15
    56b2:	48 8d 45 50          	lea    0x50(%rbp),%rax
    56b6:	49 39 c7             	cmp    %rax,%r15
    56b9:	0f 86 16 fb ff ff    	jbe    51d5 <dlmalloc+0x4d5>
    56bf:	48 83 fb ff          	cmp    $0xffffffffffffffff,%rbx
    56c3:	0f 84 0c fb ff ff    	je     51d5 <dlmalloc+0x4d5>
    56c9:	48 8b 05 e8 8c 00 00 	mov    0x8ce8(%rip),%rax        # e3b8 <_gm_+0x358>
    56d0:	4c 01 f8             	add    %r15,%rax
    56d3:	48 3b 05 e6 8c 00 00 	cmp    0x8ce6(%rip),%rax        # e3c0 <_gm_+0x360>
    56da:	48 89 05 d7 8c 00 00 	mov    %rax,0x8cd7(%rip)        # e3b8 <_gm_+0x358>
    56e1:	76 07                	jbe    56ea <dlmalloc+0x9ea>
    56e3:	48 89 05 d6 8c 00 00 	mov    %rax,0x8cd6(%rip)        # e3c0 <_gm_+0x360>
    56ea:	48 8b 35 97 89 00 00 	mov    0x8997(%rip),%rsi        # e088 <_gm_+0x28>
    56f1:	48 8d 05 e0 8c 00 00 	lea    0x8ce0(%rip),%rax        # e3d8 <_gm_+0x378>
    56f8:	48 85 f6             	test   %rsi,%rsi
    56fb:	0f 84 11 05 00 00    	je     5c12 <dlmalloc+0xf12>
    5701:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    5708:	48 8b 08             	mov    (%rax),%rcx
    570b:	48 8b 50 08          	mov    0x8(%rax),%rdx
    570f:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
    5713:	48 39 df             	cmp    %rbx,%rdi
    5716:	0f 84 24 03 00 00    	je     5a40 <dlmalloc+0xd40>
    571c:	48 8b 40 10          	mov    0x10(%rax),%rax
    5720:	48 85 c0             	test   %rax,%rax
    5723:	75 e3                	jne    5708 <dlmalloc+0xa08>
    5725:	48 39 1d 4c 89 00 00 	cmp    %rbx,0x894c(%rip)        # e078 <_gm_+0x18>
    572c:	76 07                	jbe    5735 <dlmalloc+0xa35>
    572e:	48 89 1d 43 89 00 00 	mov    %rbx,0x8943(%rip)        # e078 <_gm_+0x18>
    5735:	4a 8d 0c 3b          	lea    (%rbx,%r15,1),%rcx
    5739:	48 8d 05 98 8c 00 00 	lea    0x8c98(%rip),%rax        # e3d8 <_gm_+0x378>
    5740:	48 8b 10             	mov    (%rax),%rdx
    5743:	48 39 ca             	cmp    %rcx,%rdx
    5746:	0f 84 02 02 00 00    	je     594e <dlmalloc+0xc4e>
    574c:	48 8b 40 10          	mov    0x10(%rax),%rax
    5750:	48 85 c0             	test   %rax,%rax
    5753:	75 eb                	jne    5740 <dlmalloc+0xa40>
    5755:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
    5759:	49 89 f8             	mov    %rdi,%r8
    575c:	41 83 e0 0f          	and    $0xf,%r8d
    5760:	48 8d 05 71 8c 00 00 	lea    0x8c71(%rip),%rax        # e3d8 <_gm_+0x378>
    5767:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    576e:	00 00 
    5770:	48 8b 10             	mov    (%rax),%rdx
    5773:	48 39 d6             	cmp    %rdx,%rsi
    5776:	72 09                	jb     5781 <dlmalloc+0xa81>
    5778:	48 03 50 08          	add    0x8(%rax),%rdx
    577c:	48 39 d6             	cmp    %rdx,%rsi
    577f:	72 09                	jb     578a <dlmalloc+0xa8a>
    5781:	48 8b 40 10          	mov    0x10(%rax),%rax
    5785:	48 85 c0             	test   %rax,%rax
    5788:	75 e6                	jne    5770 <dlmalloc+0xa70>
    578a:	48 8b 48 08          	mov    0x8(%rax),%rcx
    578e:	48 03 08             	add    (%rax),%rcx
    5791:	48 c7 c2 a1 ff ff ff 	mov    $0xffffffffffffffa1,%rdx
    5798:	48 8d 41 b1          	lea    -0x4f(%rcx),%rax
    579c:	a8 0f                	test   $0xf,%al
    579e:	74 09                	je     57a9 <dlmalloc+0xaa9>
    57a0:	48 f7 d8             	neg    %rax
    57a3:	83 e0 0f             	and    $0xf,%eax
    57a6:	48 01 c2             	add    %rax,%rdx
    57a9:	48 8d 46 20          	lea    0x20(%rsi),%rax
    57ad:	48 01 ca             	add    %rcx,%rdx
    57b0:	4d 8d 4f b0          	lea    -0x50(%r15),%r9
    57b4:	48 39 c2             	cmp    %rax,%rdx
    57b7:	48 0f 42 d6          	cmovb  %rsi,%rdx
    57bb:	4d 85 c0             	test   %r8,%r8
    57be:	4c 8d 52 10          	lea    0x10(%rdx),%r10
    57c2:	0f 84 77 05 00 00    	je     5d3f <dlmalloc+0x103f>
    57c8:	48 f7 df             	neg    %rdi
    57cb:	4c 89 c8             	mov    %r9,%rax
    57ce:	83 e7 0f             	and    $0xf,%edi
    57d1:	4c 8d 04 3b          	lea    (%rbx,%rdi,1),%r8
    57d5:	48 29 f8             	sub    %rdi,%rax
    57d8:	48 89 05 91 88 00 00 	mov    %rax,0x8891(%rip)        # e070 <_gm_+0x10>
    57df:	48 83 c8 01          	or     $0x1,%rax
    57e3:	4c 89 05 9e 88 00 00 	mov    %r8,0x889e(%rip)        # e088 <_gm_+0x28>
    57ea:	49 89 40 08          	mov    %rax,0x8(%r8)
    57ee:	48 8b 05 4b 8c 00 00 	mov    0x8c4b(%rip),%rax        # e440 <mparams+0x20>
    57f5:	f3 0f 6f 05 db 8b 00 	movdqu 0x8bdb(%rip),%xmm0        # e3d8 <_gm_+0x378>
    57fc:	00 
    57fd:	4a c7 44 0b 08 50 00 	movq   $0x50,0x8(%rbx,%r9,1)
    5804:	00 00 
    5806:	48 89 05 83 88 00 00 	mov    %rax,0x8883(%rip)        # e090 <_gm_+0x30>
    580d:	48 8b 05 0c 8c 00 00 	mov    0x8c0c(%rip),%rax        # e420 <mparams>
    5814:	0f 11 42 10          	movups %xmm0,0x10(%rdx)
    5818:	48 c7 42 08 33 00 00 	movq   $0x33,0x8(%rdx)
    581f:	00 
    5820:	4c 31 e8             	xor    %r13,%rax
    5823:	f3 0f 6f 05 bd 8b 00 	movdqu 0x8bbd(%rip),%xmm0        # e3e8 <_gm_+0x388>
    582a:	00 
    582b:	48 89 42 30          	mov    %rax,0x30(%rdx)
    582f:	48 8d 42 38          	lea    0x38(%rdx),%rax
    5833:	0f 11 42 20          	movups %xmm0,0x20(%rdx)
    5837:	48 89 1d 9a 8b 00 00 	mov    %rbx,0x8b9a(%rip)        # e3d8 <_gm_+0x378>
    583e:	4c 89 3d 9b 8b 00 00 	mov    %r15,0x8b9b(%rip)        # e3e0 <_gm_+0x380>
    5845:	c7 05 a1 8b 00 00 00 	movl   $0x0,0x8ba1(%rip)        # e3f0 <_gm_+0x390>
    584c:	00 00 00 
    584f:	4c 89 15 92 8b 00 00 	mov    %r10,0x8b92(%rip)        # e3e8 <_gm_+0x388>
    5856:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    585d:	00 00 00 
    5860:	48 c7 00 0b 00 00 00 	movq   $0xb,(%rax)
    5867:	48 83 c0 08          	add    $0x8,%rax
    586b:	48 39 c1             	cmp    %rax,%rcx
    586e:	77 f0                	ja     5860 <dlmalloc+0xb60>
    5870:	48 39 d6             	cmp    %rdx,%rsi
    5873:	0f 84 9f 06 00 00    	je     5f18 <dlmalloc+0x1218>
    5879:	48 89 d7             	mov    %rdx,%rdi
    587c:	48 83 62 08 fe       	andq   $0xfffffffffffffffe,0x8(%rdx)
    5881:	48 29 f7             	sub    %rsi,%rdi
    5884:	48 89 f9             	mov    %rdi,%rcx
    5887:	48 89 f8             	mov    %rdi,%rax
    588a:	48 c1 e9 03          	shr    $0x3,%rcx
    588e:	48 83 c8 01          	or     $0x1,%rax
    5892:	48 83 f9 1f          	cmp    $0x1f,%rcx
    5896:	48 89 46 08          	mov    %rax,0x8(%rsi)
    589a:	48 89 3a             	mov    %rdi,(%rdx)
    589d:	0f 87 62 05 00 00    	ja     5e05 <dlmalloc+0x1105>
    58a3:	8d 04 09             	lea    (%rcx,%rcx,1),%eax
    58a6:	8b 15 b4 87 00 00    	mov    0x87b4(%rip),%edx        # e060 <_gm_>
    58ac:	49 8d 7c c5 48       	lea    0x48(%r13,%rax,8),%rdi
    58b1:	b8 01 00 00 00       	mov    $0x1,%eax
    58b6:	d3 e0                	shl    %cl,%eax
    58b8:	85 c2                	test   %eax,%edx
    58ba:	0f 85 4c 07 00 00    	jne    600c <dlmalloc+0x130c>
    58c0:	09 d0                	or     %edx,%eax
    58c2:	89 05 98 87 00 00    	mov    %eax,0x8798(%rip)        # e060 <_gm_>
    58c8:	48 89 f8             	mov    %rdi,%rax
    58cb:	48 89 77 10          	mov    %rsi,0x10(%rdi)
    58cf:	48 89 70 18          	mov    %rsi,0x18(%rax)
    58d3:	48 89 46 10          	mov    %rax,0x10(%rsi)
    58d7:	48 8b 05 92 87 00 00 	mov    0x8792(%rip),%rax        # e070 <_gm_+0x10>
    58de:	48 89 7e 18          	mov    %rdi,0x18(%rsi)
    58e2:	48 39 e8             	cmp    %rbp,%rax
    58e5:	0f 86 ea f8 ff ff    	jbe    51d5 <dlmalloc+0x4d5>
    58eb:	48 8b 1d 96 87 00 00 	mov    0x8796(%rip),%rbx        # e088 <_gm_+0x28>
    58f2:	4c 33 2d 27 8b 00 00 	xor    0x8b27(%rip),%r13        # e420 <mparams>
    58f9:	48 29 e8             	sub    %rbp,%rax
    58fc:	48 89 05 6d 87 00 00 	mov    %rax,0x876d(%rip)        # e070 <_gm_+0x10>
    5903:	48 83 c8 01          	or     $0x1,%rax
    5907:	48 8d 14 2b          	lea    (%rbx,%rbp,1),%rdx
    590b:	48 83 cd 03          	or     $0x3,%rbp
    590f:	48 89 15 72 87 00 00 	mov    %rdx,0x8772(%rip)        # e088 <_gm_+0x28>
    5916:	48 89 42 08          	mov    %rax,0x8(%rdx)
    591a:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    591e:	4c 89 2a             	mov    %r13,(%rdx)
    5921:	e9 d5 f5 ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    5926:	89 f0                	mov    %esi,%eax
    5928:	87 05 22 8b 00 00    	xchg   %eax,0x8b22(%rip)        # e450 <malloc_global_mutex>
    592e:	85 c0                	test   %eax,%eax
    5930:	0f 84 3b fd ff ff    	je     5671 <dlmalloc+0x971>
    5936:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    593d:	00 00 00 
    5940:	8b 02                	mov    (%rdx),%eax
    5942:	85 c0                	test   %eax,%eax
    5944:	74 e0                	je     5926 <dlmalloc+0xc26>
    5946:	8b 02                	mov    (%rdx),%eax
    5948:	85 c0                	test   %eax,%eax
    594a:	75 f4                	jne    5940 <dlmalloc+0xc40>
    594c:	eb d8                	jmp    5926 <dlmalloc+0xc26>
    594e:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
    5952:	49 89 f8             	mov    %rdi,%r8
    5955:	41 83 e0 0f          	and    $0xf,%r8d
    5959:	f6 40 18 08          	testb  $0x8,0x18(%rax)
    595d:	0f 85 fd fd ff ff    	jne    5760 <dlmalloc+0xa60>
    5963:	4c 01 78 08          	add    %r15,0x8(%rax)
    5967:	4d 85 c0             	test   %r8,%r8
    596a:	48 89 18             	mov    %rbx,(%rax)
    596d:	74 0c                	je     597b <dlmalloc+0xc7b>
    596f:	48 89 f8             	mov    %rdi,%rax
    5972:	48 f7 d8             	neg    %rax
    5975:	83 e0 0f             	and    $0xf,%eax
    5978:	48 01 c3             	add    %rax,%rbx
    597b:	48 8d 42 10          	lea    0x10(%rdx),%rax
    597f:	a8 0f                	test   $0xf,%al
    5981:	74 09                	je     598c <dlmalloc+0xc8c>
    5983:	48 f7 d8             	neg    %rax
    5986:	83 e0 0f             	and    $0xf,%eax
    5989:	48 01 c2             	add    %rax,%rdx
    598c:	48 8b 0d 8d 8a 00 00 	mov    0x8a8d(%rip),%rcx        # e420 <mparams>
    5993:	48 89 d7             	mov    %rdx,%rdi
    5996:	48 8d 04 2b          	lea    (%rbx,%rbp,1),%rax
    599a:	48 29 df             	sub    %rbx,%rdi
    599d:	48 29 ef             	sub    %rbp,%rdi
    59a0:	48 83 cd 03          	or     $0x3,%rbp
    59a4:	4c 31 e9             	xor    %r13,%rcx
    59a7:	48 39 d6             	cmp    %rdx,%rsi
    59aa:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    59ae:	48 89 08             	mov    %rcx,(%rax)
    59b1:	0f 84 2d 08 00 00    	je     61e4 <dlmalloc+0x14e4>
    59b7:	48 39 15 c2 86 00 00 	cmp    %rdx,0x86c2(%rip)        # e080 <_gm_+0x20>
    59be:	0f 84 a6 09 00 00    	je     636a <dlmalloc+0x166a>
    59c4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    59c8:	48 89 ce             	mov    %rcx,%rsi
    59cb:	83 e6 03             	and    $0x3,%esi
    59ce:	48 83 fe 01          	cmp    $0x1,%rsi
    59d2:	0f 84 bb 09 00 00    	je     6393 <dlmalloc+0x1693>
    59d8:	48 83 e1 fe          	and    $0xfffffffffffffffe,%rcx
    59dc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    59e0:	48 89 f9             	mov    %rdi,%rcx
    59e3:	48 89 fa             	mov    %rdi,%rdx
    59e6:	48 c1 e9 03          	shr    $0x3,%rcx
    59ea:	48 83 ca 01          	or     $0x1,%rdx
    59ee:	48 83 f9 1f          	cmp    $0x1f,%rcx
    59f2:	48 89 50 08          	mov    %rdx,0x8(%rax)
    59f6:	48 89 3c 38          	mov    %rdi,(%rax,%rdi,1)
    59fa:	0f 87 11 08 00 00    	ja     6211 <dlmalloc+0x1511>
    5a00:	8b 35 5a 86 00 00    	mov    0x865a(%rip),%esi        # e060 <_gm_>
    5a06:	bf 01 00 00 00       	mov    $0x1,%edi
    5a0b:	8d 14 09             	lea    (%rcx,%rcx,1),%edx
    5a0e:	d3 e7                	shl    %cl,%edi
    5a10:	49 8d 54 d5 48       	lea    0x48(%r13,%rdx,8),%rdx
    5a15:	85 fe                	test   %edi,%esi
    5a17:	0f 85 5f 0b 00 00    	jne    657c <dlmalloc+0x187c>
    5a1d:	09 fe                	or     %edi,%esi
    5a1f:	48 89 d1             	mov    %rdx,%rcx
    5a22:	89 35 38 86 00 00    	mov    %esi,0x8638(%rip)        # e060 <_gm_>
    5a28:	48 89 42 10          	mov    %rax,0x10(%rdx)
    5a2c:	48 89 41 18          	mov    %rax,0x18(%rcx)
    5a30:	48 89 48 10          	mov    %rcx,0x10(%rax)
    5a34:	48 89 50 18          	mov    %rdx,0x18(%rax)
    5a38:	e9 be f4 ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    5a3d:	0f 1f 00             	nopl   (%rax)
    5a40:	f6 40 18 08          	testb  $0x8,0x18(%rax)
    5a44:	0f 85 db fc ff ff    	jne    5725 <dlmalloc+0xa25>
    5a4a:	48 39 ce             	cmp    %rcx,%rsi
    5a4d:	0f 82 d2 fc ff ff    	jb     5725 <dlmalloc+0xa25>
    5a53:	48 39 de             	cmp    %rbx,%rsi
    5a56:	0f 83 c9 fc ff ff    	jae    5725 <dlmalloc+0xa25>
    5a5c:	4c 01 fa             	add    %r15,%rdx
    5a5f:	4c 03 3d 0a 86 00 00 	add    0x860a(%rip),%r15        # e070 <_gm_+0x10>
    5a66:	48 89 50 08          	mov    %rdx,0x8(%rax)
    5a6a:	48 8d 46 10          	lea    0x10(%rsi),%rax
    5a6e:	a8 0f                	test   $0xf,%al
    5a70:	0f 84 90 07 00 00    	je     6206 <dlmalloc+0x1506>
    5a76:	48 f7 d8             	neg    %rax
    5a79:	4c 89 ff             	mov    %r15,%rdi
    5a7c:	83 e0 0f             	and    $0xf,%eax
    5a7f:	48 29 c7             	sub    %rax,%rdi
    5a82:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
    5a86:	48 89 f8             	mov    %rdi,%rax
    5a89:	48 89 c1             	mov    %rax,%rcx
    5a8c:	48 89 15 f5 85 00 00 	mov    %rdx,0x85f5(%rip)        # e088 <_gm_+0x28>
    5a93:	48 89 05 d6 85 00 00 	mov    %rax,0x85d6(%rip)        # e070 <_gm_+0x10>
    5a9a:	48 83 c9 01          	or     $0x1,%rcx
    5a9e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    5aa2:	48 8b 15 97 89 00 00 	mov    0x8997(%rip),%rdx        # e440 <mparams+0x20>
    5aa9:	4a c7 44 3e 08 50 00 	movq   $0x50,0x8(%rsi,%r15,1)
    5ab0:	00 00 
    5ab2:	48 89 15 d7 85 00 00 	mov    %rdx,0x85d7(%rip)        # e090 <_gm_+0x30>
    5ab9:	e9 24 fe ff ff       	jmpq   58e2 <dlmalloc+0xbe2>
    5abe:	45 31 f6             	xor    %r14d,%r14d
    5ac1:	48 8d 15 88 89 00 00 	lea    0x8988(%rip),%rdx        # e450 <malloc_global_mutex>
    5ac8:	be 01 00 00 00       	mov    $0x1,%esi
    5acd:	0f 1f 00             	nopl   (%rax)
    5ad0:	8b 02                	mov    (%rdx),%eax
    5ad2:	85 c0                	test   %eax,%eax
    5ad4:	75 fa                	jne    5ad0 <dlmalloc+0xdd0>
    5ad6:	89 f0                	mov    %esi,%eax
    5ad8:	87 05 72 89 00 00    	xchg   %eax,0x8972(%rip)        # e450 <malloc_global_mutex>
    5ade:	85 c0                	test   %eax,%eax
    5ae0:	75 ee                	jne    5ad0 <dlmalloc+0xdd0>
    5ae2:	4d 85 f6             	test   %r14,%r14
    5ae5:	0f 84 56 f6 ff ff    	je     5141 <dlmalloc+0x441>
    5aeb:	48 8b 05 3e 89 00 00 	mov    0x893e(%rip),%rax        # e430 <mparams+0x10>
    5af2:	4c 8d 78 5f          	lea    0x5f(%rax),%r15
    5af6:	4c 2b 3d 73 85 00 00 	sub    0x8573(%rip),%r15        # e070 <_gm_+0x10>
    5afd:	48 f7 d8             	neg    %rax
    5b00:	49 01 ef             	add    %rbp,%r15
    5b03:	49 21 c7             	and    %rax,%r15
    5b06:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    5b0d:	ff ff 7f 
    5b10:	49 39 c7             	cmp    %rax,%r15
    5b13:	0f 87 9f f6 ff ff    	ja     51b8 <dlmalloc+0x4b8>
    5b19:	4c 89 ff             	mov    %r15,%rdi
    5b1c:	48 89 0c 24          	mov    %rcx,(%rsp)
    5b20:	e8 db 21 00 00       	callq  7d00 <sbrk>
    5b25:	48 89 c3             	mov    %rax,%rbx
    5b28:	49 8b 46 08          	mov    0x8(%r14),%rax
    5b2c:	49 03 06             	add    (%r14),%rax
    5b2f:	48 8b 0c 24          	mov    (%rsp),%rcx
    5b33:	48 39 c3             	cmp    %rax,%rbx
    5b36:	75 06                	jne    5b3e <dlmalloc+0xe3e>
    5b38:	48 83 fb ff          	cmp    $0xffffffffffffffff,%rbx
    5b3c:	75 41                	jne    5b7f <dlmalloc+0xe7f>
    5b3e:	48 83 fb ff          	cmp    $0xffffffffffffffff,%rbx
    5b42:	0f 84 70 f6 ff ff    	je     51b8 <dlmalloc+0x4b8>
    5b48:	48 8d 45 60          	lea    0x60(%rbp),%rax
    5b4c:	4c 39 f8             	cmp    %r15,%rax
    5b4f:	76 2e                	jbe    5b7f <dlmalloc+0xe7f>
    5b51:	48 8b 05 d8 88 00 00 	mov    0x88d8(%rip),%rax        # e430 <mparams+0x10>
    5b58:	4d 89 fe             	mov    %r15,%r14
    5b5b:	49 f7 de             	neg    %r14
    5b5e:	48 8d 54 05 5f       	lea    0x5f(%rbp,%rax,1),%rdx
    5b63:	48 f7 d8             	neg    %rax
    5b66:	4c 29 fa             	sub    %r15,%rdx
    5b69:	48 21 c2             	and    %rax,%rdx
    5b6c:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    5b73:	ff ff 7f 
    5b76:	48 39 c2             	cmp    %rax,%rdx
    5b79:	0f 86 13 0a 00 00    	jbe    6592 <dlmalloc+0x1892>
    5b7f:	c7 05 c7 88 00 00 00 	movl   $0x0,0x88c7(%rip)        # e450 <malloc_global_mutex>
    5b86:	00 00 00 
    5b89:	e9 3b fb ff ff       	jmpq   56c9 <dlmalloc+0x9c9>
    5b8e:	48 89 e9             	mov    %rbp,%rcx
    5b91:	48 01 dd             	add    %rbx,%rbp
    5b94:	48 83 c9 03          	or     $0x3,%rcx
    5b98:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
    5b9c:	48 89 d1             	mov    %rdx,%rcx
    5b9f:	48 89 7d 00          	mov    %rdi,0x0(%rbp)
    5ba3:	48 83 c9 01          	or     $0x1,%rcx
    5ba7:	48 85 f6             	test   %rsi,%rsi
    5baa:	48 89 4d 08          	mov    %rcx,0x8(%rbp)
    5bae:	48 89 10             	mov    %rdx,(%rax)
    5bb1:	74 4c                	je     5bff <dlmalloc+0xeff>
    5bb3:	48 c1 ee 03          	shr    $0x3,%rsi
    5bb7:	44 8b 05 a2 84 00 00 	mov    0x84a2(%rip),%r8d        # e060 <_gm_>
    5bbe:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    5bc4:	48 89 f1             	mov    %rsi,%rcx
    5bc7:	8d 3c 36             	lea    (%rsi,%rsi,1),%edi
    5bca:	48 8b 05 af 84 00 00 	mov    0x84af(%rip),%rax        # e080 <_gm_+0x20>
    5bd1:	41 d3 e1             	shl    %cl,%r9d
    5bd4:	45 85 c8             	test   %r9d,%r8d
    5bd7:	49 8d 7c fd 48       	lea    0x48(%r13,%rdi,8),%rdi
    5bdc:	0f 85 40 04 00 00    	jne    6022 <dlmalloc+0x1322>
    5be2:	45 09 c8             	or     %r9d,%r8d
    5be5:	48 89 f9             	mov    %rdi,%rcx
    5be8:	44 89 05 71 84 00 00 	mov    %r8d,0x8471(%rip)        # e060 <_gm_>
    5bef:	48 89 47 10          	mov    %rax,0x10(%rdi)
    5bf3:	48 89 41 18          	mov    %rax,0x18(%rcx)
    5bf7:	48 89 48 10          	mov    %rcx,0x10(%rax)
    5bfb:	48 89 78 18          	mov    %rdi,0x18(%rax)
    5bff:	48 89 15 62 84 00 00 	mov    %rdx,0x8462(%rip)        # e068 <_gm_+0x8>
    5c06:	48 89 2d 73 84 00 00 	mov    %rbp,0x8473(%rip)        # e080 <_gm_+0x20>
    5c0d:	e9 e9 f2 ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    5c12:	48 8b 05 5f 84 00 00 	mov    0x845f(%rip),%rax        # e078 <_gm_+0x18>
    5c19:	48 39 d8             	cmp    %rbx,%rax
    5c1c:	77 05                	ja     5c23 <dlmalloc+0xf23>
    5c1e:	48 85 c0             	test   %rax,%rax
    5c21:	75 07                	jne    5c2a <dlmalloc+0xf2a>
    5c23:	48 89 1d 4e 84 00 00 	mov    %rbx,0x844e(%rip)        # e078 <_gm_+0x18>
    5c2a:	48 8b 05 ef 87 00 00 	mov    0x87ef(%rip),%rax        # e420 <mparams>
    5c31:	48 89 1d a0 87 00 00 	mov    %rbx,0x87a0(%rip)        # e3d8 <_gm_+0x378>
    5c38:	4c 89 3d a1 87 00 00 	mov    %r15,0x87a1(%rip)        # e3e0 <_gm_+0x380>
    5c3f:	c7 05 a7 87 00 00 00 	movl   $0x0,0x87a7(%rip)        # e3f0 <_gm_+0x390>
    5c46:	00 00 00 
    5c49:	48 c7 05 44 84 00 00 	movq   $0xffffffffffffffff,0x8444(%rip)        # e098 <_gm_+0x38>
    5c50:	ff ff ff ff 
    5c54:	48 89 05 45 84 00 00 	mov    %rax,0x8445(%rip)        # e0a0 <_gm_+0x40>
    5c5b:	48 8d 05 46 84 00 00 	lea    0x8446(%rip),%rax        # e0a8 <_gm_+0x48>
    5c62:	48 8d 90 00 02 00 00 	lea    0x200(%rax),%rdx
    5c69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    5c70:	48 89 40 18          	mov    %rax,0x18(%rax)
    5c74:	48 89 40 10          	mov    %rax,0x10(%rax)
    5c78:	48 83 c0 10          	add    $0x10,%rax
    5c7c:	48 39 c2             	cmp    %rax,%rdx
    5c7f:	75 ef                	jne    5c70 <dlmalloc+0xf70>
    5c81:	48 8d 43 10          	lea    0x10(%rbx),%rax
    5c85:	49 83 ef 50          	sub    $0x50,%r15
    5c89:	a8 0f                	test   $0xf,%al
    5c8b:	0f 84 6f 02 00 00    	je     5f00 <dlmalloc+0x1200>
    5c91:	48 f7 d8             	neg    %rax
    5c94:	4c 89 fe             	mov    %r15,%rsi
    5c97:	83 e0 0f             	and    $0xf,%eax
    5c9a:	48 29 c6             	sub    %rax,%rsi
    5c9d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
    5ca1:	48 89 f0             	mov    %rsi,%rax
    5ca4:	48 89 c1             	mov    %rax,%rcx
    5ca7:	48 89 15 da 83 00 00 	mov    %rdx,0x83da(%rip)        # e088 <_gm_+0x28>
    5cae:	48 89 05 bb 83 00 00 	mov    %rax,0x83bb(%rip)        # e070 <_gm_+0x10>
    5cb5:	48 83 c9 01          	or     $0x1,%rcx
    5cb9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    5cbd:	48 8b 15 7c 87 00 00 	mov    0x877c(%rip),%rdx        # e440 <mparams+0x20>
    5cc4:	4a c7 44 3b 08 50 00 	movq   $0x50,0x8(%rbx,%r15,1)
    5ccb:	00 00 
    5ccd:	48 89 15 bc 83 00 00 	mov    %rdx,0x83bc(%rip)        # e090 <_gm_+0x30>
    5cd4:	e9 09 fc ff ff       	jmpq   58e2 <dlmalloc+0xbe2>
    5cd9:	4d 85 db             	test   %r11,%r11
    5cdc:	4c 89 ca             	mov    %r9,%rdx
    5cdf:	4c 89 d8             	mov    %r11,%rax
    5ce2:	0f 85 db f5 ff ff    	jne    52c3 <dlmalloc+0x5c3>
    5ce8:	e9 fe f5 ff ff       	jmpq   52eb <dlmalloc+0x5eb>
    5ced:	0f bd c0             	bsr    %eax,%eax
    5cf0:	b9 26 00 00 00       	mov    $0x26,%ecx
    5cf5:	48 89 ea             	mov    %rbp,%rdx
    5cf8:	83 f0 1f             	xor    $0x1f,%eax
    5cfb:	29 c1                	sub    %eax,%ecx
    5cfd:	48 d3 ea             	shr    %cl,%rdx
    5d00:	b9 1f 00 00 00       	mov    $0x1f,%ecx
    5d05:	83 e2 01             	and    $0x1,%edx
    5d08:	29 c1                	sub    %eax,%ecx
    5d0a:	8d 04 4a             	lea    (%rdx,%rcx,2),%eax
    5d0d:	49 89 c2             	mov    %rax,%r10
    5d10:	49 8b 84 c5 58 02 00 	mov    0x258(%r13,%rax,8),%rax
    5d17:	00 
    5d18:	48 85 c0             	test   %rax,%rax
    5d1b:	0f 84 67 f5 ff ff    	je     5288 <dlmalloc+0x588>
    5d21:	41 83 fa 1f          	cmp    $0x1f,%r10d
    5d25:	48 89 e9             	mov    %rbp,%rcx
    5d28:	0f 84 f8 f4 ff ff    	je     5226 <dlmalloc+0x526>
    5d2e:	44 89 d2             	mov    %r10d,%edx
    5d31:	b9 39 00 00 00       	mov    $0x39,%ecx
    5d36:	d1 ea                	shr    %edx
    5d38:	29 d1                	sub    %edx,%ecx
    5d3a:	e9 de f4 ff ff       	jmpq   521d <dlmalloc+0x51d>
    5d3f:	4c 89 c8             	mov    %r9,%rax
    5d42:	49 89 d8             	mov    %rbx,%r8
    5d45:	e9 8e fa ff ff       	jmpq   57d8 <dlmalloc+0xad8>
    5d4a:	48 89 c3             	mov    %rax,%rbx
    5d4d:	e9 71 f5 ff ff       	jmpq   52c3 <dlmalloc+0x5c3>
    5d52:	48 89 e8             	mov    %rbp,%rax
    5d55:	48 83 c8 03          	or     $0x3,%rax
    5d59:	48 89 43 08          	mov    %rax,0x8(%rbx)
    5d5d:	49 89 0a             	mov    %rcx,(%r10)
    5d60:	48 89 d1             	mov    %rdx,%rcx
    5d63:	48 89 d0             	mov    %rdx,%rax
    5d66:	48 c1 e9 03          	shr    $0x3,%rcx
    5d6a:	48 83 c8 01          	or     $0x1,%rax
    5d6e:	48 83 f9 1f          	cmp    $0x1f,%rcx
    5d72:	49 89 42 08          	mov    %rax,0x8(%r10)
    5d76:	49 89 14 12          	mov    %rdx,(%r10,%rdx,1)
    5d7a:	0f 87 e0 01 00 00    	ja     5f60 <dlmalloc+0x1260>
    5d80:	8b 15 da 82 00 00    	mov    0x82da(%rip),%edx        # e060 <_gm_>
    5d86:	bf 01 00 00 00       	mov    $0x1,%edi
    5d8b:	8d 04 09             	lea    (%rcx,%rcx,1),%eax
    5d8e:	d3 e7                	shl    %cl,%edi
    5d90:	49 8d 44 c5 48       	lea    0x48(%r13,%rax,8),%rax
    5d95:	85 fa                	test   %edi,%edx
    5d97:	0f 85 e6 02 00 00    	jne    6083 <dlmalloc+0x1383>
    5d9d:	09 fa                	or     %edi,%edx
    5d9f:	89 15 bb 82 00 00    	mov    %edx,0x82bb(%rip)        # e060 <_gm_>
    5da5:	48 89 c2             	mov    %rax,%rdx
    5da8:	4c 89 50 10          	mov    %r10,0x10(%rax)
    5dac:	4c 89 52 18          	mov    %r10,0x18(%rdx)
    5db0:	49 89 52 10          	mov    %rdx,0x10(%r10)
    5db4:	49 89 42 18          	mov    %rax,0x18(%r10)
    5db8:	e9 3f f6 ff ff       	jmpq   53fc <dlmalloc+0x6fc>
    5dbd:	48 8b 4b 28          	mov    0x28(%rbx),%rcx
    5dc1:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
    5dc5:	48 85 c9             	test   %rcx,%rcx
    5dc8:	0f 84 9f 02 00 00    	je     606d <dlmalloc+0x136d>
    5dce:	66 90                	xchg   %ax,%ax
    5dd0:	48 89 c8             	mov    %rcx,%rax
    5dd3:	48 8b 49 28          	mov    0x28(%rcx),%rcx
    5dd7:	49 89 f9             	mov    %rdi,%r9
    5dda:	48 8d 78 28          	lea    0x28(%rax),%rdi
    5dde:	48 85 c9             	test   %rcx,%rcx
    5de1:	75 ed                	jne    5dd0 <dlmalloc+0x10d0>
    5de3:	48 8b 48 20          	mov    0x20(%rax),%rcx
    5de7:	48 8d 78 20          	lea    0x20(%rax),%rdi
    5deb:	48 85 c9             	test   %rcx,%rcx
    5dee:	75 e0                	jne    5dd0 <dlmalloc+0x10d0>
    5df0:	4d 39 cb             	cmp    %r9,%r11
    5df3:	0f 87 47 f6 ff ff    	ja     5440 <dlmalloc+0x740>
    5df9:	49 c7 01 00 00 00 00 	movq   $0x0,(%r9)
    5e00:	e9 55 f5 ff ff       	jmpq   535a <dlmalloc+0x65a>
    5e05:	48 89 f8             	mov    %rdi,%rax
    5e08:	48 c1 e8 08          	shr    $0x8,%rax
    5e0c:	85 c0                	test   %eax,%eax
    5e0e:	0f 84 e4 01 00 00    	je     5ff8 <dlmalloc+0x12f8>
    5e14:	3d ff ff 00 00       	cmp    $0xffff,%eax
    5e19:	0f 87 ab 03 00 00    	ja     61ca <dlmalloc+0x14ca>
    5e1f:	0f bd c0             	bsr    %eax,%eax
    5e22:	b9 26 00 00 00       	mov    $0x26,%ecx
    5e27:	48 89 fa             	mov    %rdi,%rdx
    5e2a:	83 f0 1f             	xor    $0x1f,%eax
    5e2d:	29 c1                	sub    %eax,%ecx
    5e2f:	48 d3 ea             	shr    %cl,%rdx
    5e32:	b9 1f 00 00 00       	mov    $0x1f,%ecx
    5e37:	29 c1                	sub    %eax,%ecx
    5e39:	83 e2 01             	and    $0x1,%edx
    5e3c:	b8 01 00 00 00       	mov    $0x1,%eax
    5e41:	8d 14 4a             	lea    (%rdx,%rcx,2),%edx
    5e44:	48 89 d1             	mov    %rdx,%rcx
    5e47:	4c 8d 04 d5 58 02 00 	lea    0x258(,%rdx,8),%r8
    5e4e:	00 
    5e4f:	d3 e0                	shl    %cl,%eax
    5e51:	44 8b 0d 0c 82 00 00 	mov    0x820c(%rip),%r9d        # e064 <_gm_+0x4>
    5e58:	89 4e 38             	mov    %ecx,0x38(%rsi)
    5e5b:	48 c7 46 28 00 00 00 	movq   $0x0,0x28(%rsi)
    5e62:	00 
    5e63:	48 c7 46 20 00 00 00 	movq   $0x0,0x20(%rsi)
    5e6a:	00 
    5e6b:	44 85 c8             	test   %r9d,%eax
    5e6e:	0f 84 c4 01 00 00    	je     6038 <dlmalloc+0x1338>
    5e74:	83 f9 1f             	cmp    $0x1f,%ecx
    5e77:	49 8b 94 d5 58 02 00 	mov    0x258(%r13,%rdx,8),%rdx
    5e7e:	00 
    5e7f:	49 89 f8             	mov    %rdi,%r8
    5e82:	74 2e                	je     5eb2 <dlmalloc+0x11b2>
    5e84:	d1 e9                	shr    %ecx
    5e86:	b8 39 00 00 00       	mov    $0x39,%eax
    5e8b:	29 c8                	sub    %ecx,%eax
    5e8d:	89 c1                	mov    %eax,%ecx
    5e8f:	49 d3 e0             	shl    %cl,%r8
    5e92:	eb 1e                	jmp    5eb2 <dlmalloc+0x11b2>
    5e94:	4c 89 c0             	mov    %r8,%rax
    5e97:	4d 01 c0             	add    %r8,%r8
    5e9a:	48 c1 e8 3f          	shr    $0x3f,%rax
    5e9e:	48 83 c0 04          	add    $0x4,%rax
    5ea2:	48 8b 0c c2          	mov    (%rdx,%rax,8),%rcx
    5ea6:	48 85 c9             	test   %rcx,%rcx
    5ea9:	0f 84 ee 02 00 00    	je     619d <dlmalloc+0x149d>
    5eaf:	48 89 ca             	mov    %rcx,%rdx
    5eb2:	48 8b 42 08          	mov    0x8(%rdx),%rax
    5eb6:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    5eba:	48 39 c7             	cmp    %rax,%rdi
    5ebd:	75 d5                	jne    5e94 <dlmalloc+0x1194>
    5ebf:	48 8b 42 10          	mov    0x10(%rdx),%rax
    5ec3:	48 8b 0d ae 81 00 00 	mov    0x81ae(%rip),%rcx        # e078 <_gm_+0x18>
    5eca:	48 39 c8             	cmp    %rcx,%rax
    5ecd:	0f 82 6d f5 ff ff    	jb     5440 <dlmalloc+0x740>
    5ed3:	48 39 ca             	cmp    %rcx,%rdx
    5ed6:	0f 82 64 f5 ff ff    	jb     5440 <dlmalloc+0x740>
    5edc:	48 89 70 18          	mov    %rsi,0x18(%rax)
    5ee0:	48 89 72 10          	mov    %rsi,0x10(%rdx)
    5ee4:	48 89 46 10          	mov    %rax,0x10(%rsi)
    5ee8:	48 89 56 18          	mov    %rdx,0x18(%rsi)
    5eec:	48 c7 46 30 00 00 00 	movq   $0x0,0x30(%rsi)
    5ef3:	00 
    5ef4:	48 8b 05 75 81 00 00 	mov    0x8175(%rip),%rax        # e070 <_gm_+0x10>
    5efb:	e9 e2 f9 ff ff       	jmpq   58e2 <dlmalloc+0xbe2>
    5f00:	4c 89 f8             	mov    %r15,%rax
    5f03:	48 89 da             	mov    %rbx,%rdx
    5f06:	e9 99 fd ff ff       	jmpq   5ca4 <dlmalloc+0xfa4>
    5f0b:	4c 89 ca             	mov    %r9,%rdx
    5f0e:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    5f13:	e9 7d f3 ff ff       	jmpq   5295 <dlmalloc+0x595>
    5f18:	48 8b 05 51 81 00 00 	mov    0x8151(%rip),%rax        # e070 <_gm_+0x10>
    5f1f:	e9 be f9 ff ff       	jmpq   58e2 <dlmalloc+0xbe2>
    5f24:	b8 01 00 00 00       	mov    $0x1,%eax
    5f29:	87 05 21 85 00 00    	xchg   %eax,0x8521(%rip)        # e450 <malloc_global_mutex>
    5f2f:	85 c0                	test   %eax,%eax
    5f31:	0f 84 b4 fb ff ff    	je     5aeb <dlmalloc+0xdeb>
    5f37:	e9 85 fb ff ff       	jmpq   5ac1 <dlmalloc+0xdc1>
    5f3c:	48 85 c0             	test   %rax,%rax
    5f3f:	49 89 44 fd 08       	mov    %rax,0x8(%r13,%rdi,8)
    5f44:	0f 85 46 f4 ff ff    	jne    5390 <dlmalloc+0x690>
    5f4a:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    5f4f:	d3 c0                	rol    %cl,%eax
    5f51:	41 21 c0             	and    %eax,%r8d
    5f54:	44 89 05 09 81 00 00 	mov    %r8d,0x8109(%rip)        # e064 <_gm_+0x4>
    5f5b:	e9 6d f4 ff ff       	jmpq   53cd <dlmalloc+0x6cd>
    5f60:	48 89 d0             	mov    %rdx,%rax
    5f63:	48 c1 e8 08          	shr    $0x8,%rax
    5f67:	85 c0                	test   %eax,%eax
    5f69:	0f 84 af 01 00 00    	je     611e <dlmalloc+0x141e>
    5f6f:	3d ff ff 00 00       	cmp    $0xffff,%eax
    5f74:	0f 87 b4 03 00 00    	ja     632e <dlmalloc+0x162e>
    5f7a:	0f bd c0             	bsr    %eax,%eax
    5f7d:	b9 26 00 00 00       	mov    $0x26,%ecx
    5f82:	48 89 d7             	mov    %rdx,%rdi
    5f85:	83 f0 1f             	xor    $0x1f,%eax
    5f88:	29 c1                	sub    %eax,%ecx
    5f8a:	48 d3 ef             	shr    %cl,%rdi
    5f8d:	48 89 f9             	mov    %rdi,%rcx
    5f90:	bf 1f 00 00 00       	mov    $0x1f,%edi
    5f95:	83 e1 01             	and    $0x1,%ecx
    5f98:	29 c7                	sub    %eax,%edi
    5f9a:	b8 01 00 00 00       	mov    $0x1,%eax
    5f9f:	8d 3c 79             	lea    (%rcx,%rdi,2),%edi
    5fa2:	48 89 f9             	mov    %rdi,%rcx
    5fa5:	4c 8d 04 fd 58 02 00 	lea    0x258(,%rdi,8),%r8
    5fac:	00 
    5fad:	d3 e0                	shl    %cl,%eax
    5faf:	44 8b 0d ae 80 00 00 	mov    0x80ae(%rip),%r9d        # e064 <_gm_+0x4>
    5fb6:	41 89 4a 38          	mov    %ecx,0x38(%r10)
    5fba:	49 c7 42 28 00 00 00 	movq   $0x0,0x28(%r10)
    5fc1:	00 
    5fc2:	49 c7 42 20 00 00 00 	movq   $0x0,0x20(%r10)
    5fc9:	00 
    5fca:	41 85 c1             	test   %eax,%r9d
    5fcd:	0f 85 c2 00 00 00    	jne    6095 <dlmalloc+0x1395>
    5fd3:	44 09 c8             	or     %r9d,%eax
    5fd6:	4d 01 e8             	add    %r13,%r8
    5fd9:	4d 89 94 fd 58 02 00 	mov    %r10,0x258(%r13,%rdi,8)
    5fe0:	00 
    5fe1:	89 05 7d 80 00 00    	mov    %eax,0x807d(%rip)        # e064 <_gm_+0x4>
    5fe7:	4d 89 42 30          	mov    %r8,0x30(%r10)
    5feb:	4d 89 52 18          	mov    %r10,0x18(%r10)
    5fef:	4d 89 52 10          	mov    %r10,0x10(%r10)
    5ff3:	e9 04 f4 ff ff       	jmpq   53fc <dlmalloc+0x6fc>
    5ff8:	41 b8 58 02 00 00    	mov    $0x258,%r8d
    5ffe:	b8 01 00 00 00       	mov    $0x1,%eax
    6003:	31 c9                	xor    %ecx,%ecx
    6005:	31 d2                	xor    %edx,%edx
    6007:	e9 45 fe ff ff       	jmpq   5e51 <dlmalloc+0x1151>
    600c:	48 8b 47 10          	mov    0x10(%rdi),%rax
    6010:	48 3b 05 61 80 00 00 	cmp    0x8061(%rip),%rax        # e078 <_gm_+0x18>
    6017:	0f 83 ae f8 ff ff    	jae    58cb <dlmalloc+0xbcb>
    601d:	e9 1e f4 ff ff       	jmpq   5440 <dlmalloc+0x740>
    6022:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
    6026:	48 3b 0d 4b 80 00 00 	cmp    0x804b(%rip),%rcx        # e078 <_gm_+0x18>
    602d:	0f 83 bc fb ff ff    	jae    5bef <dlmalloc+0xeef>
    6033:	e9 08 f4 ff ff       	jmpq   5440 <dlmalloc+0x740>
    6038:	44 09 c8             	or     %r9d,%eax
    603b:	4d 01 e8             	add    %r13,%r8
    603e:	49 89 b4 d5 58 02 00 	mov    %rsi,0x258(%r13,%rdx,8)
    6045:	00 
    6046:	89 05 18 80 00 00    	mov    %eax,0x8018(%rip)        # e064 <_gm_+0x4>
    604c:	4c 89 46 30          	mov    %r8,0x30(%rsi)
    6050:	48 89 76 18          	mov    %rsi,0x18(%rsi)
    6054:	48 89 76 10          	mov    %rsi,0x10(%rsi)
    6058:	48 8b 05 11 80 00 00 	mov    0x8011(%rip),%rax        # e070 <_gm_+0x10>
    605f:	e9 7e f8 ff ff       	jmpq   58e2 <dlmalloc+0xbe2>
    6064:	49 89 46 20          	mov    %rax,0x20(%r14)
    6068:	e9 1e f3 ff ff       	jmpq   538b <dlmalloc+0x68b>
    606d:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
    6071:	48 85 c9             	test   %rcx,%rcx
    6074:	0f 84 98 04 00 00    	je     6512 <dlmalloc+0x1812>
    607a:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
    607e:	e9 4d fd ff ff       	jmpq   5dd0 <dlmalloc+0x10d0>
    6083:	48 8b 50 10          	mov    0x10(%rax),%rdx
    6087:	49 39 d3             	cmp    %rdx,%r11
    608a:	0f 86 18 fd ff ff    	jbe    5da8 <dlmalloc+0x10a8>
    6090:	e9 ab f3 ff ff       	jmpq   5440 <dlmalloc+0x740>
    6095:	83 f9 1f             	cmp    $0x1f,%ecx
    6098:	49 8b 84 fd 58 02 00 	mov    0x258(%r13,%rdi,8),%rax
    609f:	00 
    60a0:	48 89 d7             	mov    %rdx,%rdi
    60a3:	74 39                	je     60de <dlmalloc+0x13de>
    60a5:	d1 e9                	shr    %ecx
    60a7:	bf 39 00 00 00       	mov    $0x39,%edi
    60ac:	29 cf                	sub    %ecx,%edi
    60ae:	89 f9                	mov    %edi,%ecx
    60b0:	48 89 d7             	mov    %rdx,%rdi
    60b3:	48 d3 e7             	shl    %cl,%rdi
    60b6:	eb 26                	jmp    60de <dlmalloc+0x13de>
    60b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    60bf:	00 
    60c0:	48 89 f9             	mov    %rdi,%rcx
    60c3:	48 01 ff             	add    %rdi,%rdi
    60c6:	48 c1 e9 3f          	shr    $0x3f,%rcx
    60ca:	48 83 c1 04          	add    $0x4,%rcx
    60ce:	4c 8b 04 c8          	mov    (%rax,%rcx,8),%r8
    60d2:	4d 85 c0             	test   %r8,%r8
    60d5:	0f 84 6d 02 00 00    	je     6348 <dlmalloc+0x1648>
    60db:	4c 89 c0             	mov    %r8,%rax
    60de:	48 8b 48 08          	mov    0x8(%rax),%rcx
    60e2:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    60e6:	48 39 d1             	cmp    %rdx,%rcx
    60e9:	75 d5                	jne    60c0 <dlmalloc+0x13c0>
    60eb:	48 8b 50 10          	mov    0x10(%rax),%rdx
    60ef:	49 39 d3             	cmp    %rdx,%r11
    60f2:	0f 87 48 f3 ff ff    	ja     5440 <dlmalloc+0x740>
    60f8:	49 39 c3             	cmp    %rax,%r11
    60fb:	0f 87 3f f3 ff ff    	ja     5440 <dlmalloc+0x740>
    6101:	4c 89 52 18          	mov    %r10,0x18(%rdx)
    6105:	4c 89 50 10          	mov    %r10,0x10(%rax)
    6109:	49 89 52 10          	mov    %rdx,0x10(%r10)
    610d:	49 89 42 18          	mov    %rax,0x18(%r10)
    6111:	49 c7 42 30 00 00 00 	movq   $0x0,0x30(%r10)
    6118:	00 
    6119:	e9 de f2 ff ff       	jmpq   53fc <dlmalloc+0x6fc>
    611e:	41 b8 58 02 00 00    	mov    $0x258,%r8d
    6124:	b8 01 00 00 00       	mov    $0x1,%eax
    6129:	31 c9                	xor    %ecx,%ecx
    612b:	31 ff                	xor    %edi,%edi
    612d:	e9 7d fe ff ff       	jmpq   5faf <dlmalloc+0x12af>
    6132:	48 8d 44 3d 00       	lea    0x0(%rbp,%rdi,1),%rax
    6137:	48 89 c2             	mov    %rax,%rdx
    613a:	48 01 d8             	add    %rbx,%rax
    613d:	48 83 ca 03          	or     $0x3,%rdx
    6141:	48 89 53 08          	mov    %rdx,0x8(%rbx)
    6145:	48 83 48 08 01       	orq    $0x1,0x8(%rax)
    614a:	48 89 08             	mov    %rcx,(%rax)
    614d:	e9 a9 f4 ff ff       	jmpq   55fb <dlmalloc+0x8fb>
    6152:	48 8b 4b 28          	mov    0x28(%rbx),%rcx
    6156:	4c 8d 4b 28          	lea    0x28(%rbx),%r9
    615a:	48 85 c9             	test   %rcx,%rcx
    615d:	0f 84 96 03 00 00    	je     64f9 <dlmalloc+0x17f9>
    6163:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    6168:	48 89 c8             	mov    %rcx,%rax
    616b:	48 8b 49 28          	mov    0x28(%rcx),%rcx
    616f:	4d 89 ca             	mov    %r9,%r10
    6172:	4c 8d 48 28          	lea    0x28(%rax),%r9
    6176:	48 85 c9             	test   %rcx,%rcx
    6179:	75 ed                	jne    6168 <dlmalloc+0x1468>
    617b:	48 8b 48 20          	mov    0x20(%rax),%rcx
    617f:	4c 8d 48 20          	lea    0x20(%rax),%r9
    6183:	48 85 c9             	test   %rcx,%rcx
    6186:	75 e0                	jne    6168 <dlmalloc+0x1468>
    6188:	4d 39 d6             	cmp    %r10,%r14
    618b:	0f 87 af f2 ff ff    	ja     5440 <dlmalloc+0x740>
    6191:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
    6198:	e9 5d f3 ff ff       	jmpq   54fa <dlmalloc+0x7fa>
    619d:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
    61a1:	48 39 0d d0 7e 00 00 	cmp    %rcx,0x7ed0(%rip)        # e078 <_gm_+0x18>
    61a8:	0f 87 92 f2 ff ff    	ja     5440 <dlmalloc+0x740>
    61ae:	48 89 34 c2          	mov    %rsi,(%rdx,%rax,8)
    61b2:	48 89 56 30          	mov    %rdx,0x30(%rsi)
    61b6:	48 89 76 18          	mov    %rsi,0x18(%rsi)
    61ba:	48 89 76 10          	mov    %rsi,0x10(%rsi)
    61be:	48 8b 05 ab 7e 00 00 	mov    0x7eab(%rip),%rax        # e070 <_gm_+0x10>
    61c5:	e9 18 f7 ff ff       	jmpq   58e2 <dlmalloc+0xbe2>
    61ca:	41 b8 50 03 00 00    	mov    $0x350,%r8d
    61d0:	b8 00 00 00 80       	mov    $0x80000000,%eax
    61d5:	b9 1f 00 00 00       	mov    $0x1f,%ecx
    61da:	ba 1f 00 00 00       	mov    $0x1f,%edx
    61df:	e9 6d fc ff ff       	jmpq   5e51 <dlmalloc+0x1151>
    61e4:	48 03 3d 85 7e 00 00 	add    0x7e85(%rip),%rdi        # e070 <_gm_+0x10>
    61eb:	48 89 05 96 7e 00 00 	mov    %rax,0x7e96(%rip)        # e088 <_gm_+0x28>
    61f2:	48 89 3d 77 7e 00 00 	mov    %rdi,0x7e77(%rip)        # e070 <_gm_+0x10>
    61f9:	48 83 cf 01          	or     $0x1,%rdi
    61fd:	48 89 78 08          	mov    %rdi,0x8(%rax)
    6201:	e9 f5 ec ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    6206:	4c 89 f8             	mov    %r15,%rax
    6209:	48 89 f2             	mov    %rsi,%rdx
    620c:	e9 78 f8 ff ff       	jmpq   5a89 <dlmalloc+0xd89>
    6211:	48 89 fa             	mov    %rdi,%rdx
    6214:	48 c1 ea 08          	shr    $0x8,%rdx
    6218:	85 d2                	test   %edx,%edx
    621a:	0f 84 c5 02 00 00    	je     64e5 <dlmalloc+0x17e5>
    6220:	81 fa ff ff 00 00    	cmp    $0xffff,%edx
    6226:	0f 87 e5 03 00 00    	ja     6611 <dlmalloc+0x1911>
    622c:	0f bd d2             	bsr    %edx,%edx
    622f:	b9 26 00 00 00       	mov    $0x26,%ecx
    6234:	48 89 fe             	mov    %rdi,%rsi
    6237:	83 f2 1f             	xor    $0x1f,%edx
    623a:	29 d1                	sub    %edx,%ecx
    623c:	48 d3 ee             	shr    %cl,%rsi
    623f:	48 89 f1             	mov    %rsi,%rcx
    6242:	be 1f 00 00 00       	mov    $0x1f,%esi
    6247:	83 e1 01             	and    $0x1,%ecx
    624a:	29 d6                	sub    %edx,%esi
    624c:	ba 01 00 00 00       	mov    $0x1,%edx
    6251:	8d 34 71             	lea    (%rcx,%rsi,2),%esi
    6254:	89 f1                	mov    %esi,%ecx
    6256:	d3 e2                	shl    %cl,%edx
    6258:	89 f1                	mov    %esi,%ecx
    625a:	4c 8d 04 cd 58 02 00 	lea    0x258(,%rcx,8),%r8
    6261:	00 
    6262:	44 8b 0d fb 7d 00 00 	mov    0x7dfb(%rip),%r9d        # e064 <_gm_+0x4>
    6269:	89 70 38             	mov    %esi,0x38(%rax)
    626c:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
    6273:	00 
    6274:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
    627b:	00 
    627c:	41 85 d1             	test   %edx,%r9d
    627f:	0f 84 3b 02 00 00    	je     64c0 <dlmalloc+0x17c0>
    6285:	49 8b 94 cd 58 02 00 	mov    0x258(%r13,%rcx,8),%rdx
    628c:	00 
    628d:	31 c9                	xor    %ecx,%ecx
    628f:	83 fe 1f             	cmp    $0x1f,%esi
    6292:	74 09                	je     629d <dlmalloc+0x159d>
    6294:	d1 ee                	shr    %esi
    6296:	b9 39 00 00 00       	mov    $0x39,%ecx
    629b:	29 f1                	sub    %esi,%ecx
    629d:	48 89 fe             	mov    %rdi,%rsi
    62a0:	48 d3 e6             	shl    %cl,%rsi
    62a3:	eb 1e                	jmp    62c3 <dlmalloc+0x15c3>
    62a5:	48 89 f1             	mov    %rsi,%rcx
    62a8:	48 01 f6             	add    %rsi,%rsi
    62ab:	48 c1 e9 3f          	shr    $0x3f,%rcx
    62af:	48 83 c1 04          	add    $0x4,%rcx
    62b3:	4c 8b 04 ca          	mov    (%rdx,%rcx,8),%r8
    62b7:	4d 85 c0             	test   %r8,%r8
    62ba:	0f 84 2b 03 00 00    	je     65eb <dlmalloc+0x18eb>
    62c0:	4c 89 c2             	mov    %r8,%rdx
    62c3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    62c7:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    62cb:	48 39 cf             	cmp    %rcx,%rdi
    62ce:	75 d5                	jne    62a5 <dlmalloc+0x15a5>
    62d0:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    62d4:	48 8b 35 9d 7d 00 00 	mov    0x7d9d(%rip),%rsi        # e078 <_gm_+0x18>
    62db:	48 39 f1             	cmp    %rsi,%rcx
    62de:	0f 82 5c f1 ff ff    	jb     5440 <dlmalloc+0x740>
    62e4:	48 39 f2             	cmp    %rsi,%rdx
    62e7:	0f 82 53 f1 ff ff    	jb     5440 <dlmalloc+0x740>
    62ed:	48 89 41 18          	mov    %rax,0x18(%rcx)
    62f1:	48 89 42 10          	mov    %rax,0x10(%rdx)
    62f5:	48 89 48 10          	mov    %rcx,0x10(%rax)
    62f9:	48 89 50 18          	mov    %rdx,0x18(%rax)
    62fd:	48 c7 40 30 00 00 00 	movq   $0x0,0x30(%rax)
    6304:	00 
    6305:	e9 f1 eb ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    630a:	48 85 c0             	test   %rax,%rax
    630d:	4b 89 44 cd 08       	mov    %rax,0x8(%r13,%r9,8)
    6312:	0f 85 19 f2 ff ff    	jne    5531 <dlmalloc+0x831>
    6318:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    631d:	d3 c0                	rol    %cl,%eax
    631f:	41 21 c0             	and    %eax,%r8d
    6322:	44 89 05 3b 7d 00 00 	mov    %r8d,0x7d3b(%rip)        # e064 <_gm_+0x4>
    6329:	e9 44 f2 ff ff       	jmpq   5572 <dlmalloc+0x872>
    632e:	41 b8 50 03 00 00    	mov    $0x350,%r8d
    6334:	b8 00 00 00 80       	mov    $0x80000000,%eax
    6339:	b9 1f 00 00 00       	mov    $0x1f,%ecx
    633e:	bf 1f 00 00 00       	mov    $0x1f,%edi
    6343:	e9 67 fc ff ff       	jmpq   5faf <dlmalloc+0x12af>
    6348:	48 8d 14 c8          	lea    (%rax,%rcx,8),%rdx
    634c:	49 39 d3             	cmp    %rdx,%r11
    634f:	0f 87 eb f0 ff ff    	ja     5440 <dlmalloc+0x740>
    6355:	4c 89 14 c8          	mov    %r10,(%rax,%rcx,8)
    6359:	49 89 42 30          	mov    %rax,0x30(%r10)
    635d:	4d 89 52 18          	mov    %r10,0x18(%r10)
    6361:	4d 89 52 10          	mov    %r10,0x10(%r10)
    6365:	e9 92 f0 ff ff       	jmpq   53fc <dlmalloc+0x6fc>
    636a:	48 03 3d f7 7c 00 00 	add    0x7cf7(%rip),%rdi        # e068 <_gm_+0x8>
    6371:	48 89 05 08 7d 00 00 	mov    %rax,0x7d08(%rip)        # e080 <_gm_+0x20>
    6378:	48 89 fa             	mov    %rdi,%rdx
    637b:	48 89 3d e6 7c 00 00 	mov    %rdi,0x7ce6(%rip)        # e068 <_gm_+0x8>
    6382:	48 83 ca 01          	or     $0x1,%rdx
    6386:	48 89 50 08          	mov    %rdx,0x8(%rax)
    638a:	48 89 3c 38          	mov    %rdi,(%rax,%rdi,1)
    638e:	e9 68 eb ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    6393:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    6397:	48 8b 72 18          	mov    0x18(%rdx),%rsi
    639b:	49 89 c8             	mov    %rcx,%r8
    639e:	48 c1 e9 03          	shr    $0x3,%rcx
    63a2:	48 83 f9 1f          	cmp    $0x1f,%rcx
    63a6:	77 48                	ja     63f0 <dlmalloc+0x16f0>
    63a8:	44 8d 14 09          	lea    (%rcx,%rcx,1),%r10d
    63ac:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
    63b0:	4f 8d 54 d5 48       	lea    0x48(%r13,%r10,8),%r10
    63b5:	4d 39 d1             	cmp    %r10,%r9
    63b8:	0f 85 66 f0 ff ff    	jne    5424 <dlmalloc+0x724>
    63be:	49 39 f1             	cmp    %rsi,%r9
    63c1:	0f 84 3d 03 00 00    	je     6704 <dlmalloc+0x1a04>
    63c7:	49 39 f2             	cmp    %rsi,%r10
    63ca:	0f 85 18 03 00 00    	jne    66e8 <dlmalloc+0x19e8>
    63d0:	49 89 71 18          	mov    %rsi,0x18(%r9)
    63d4:	4c 89 4e 10          	mov    %r9,0x10(%rsi)
    63d8:	4c 01 c2             	add    %r8,%rdx
    63db:	4c 01 c7             	add    %r8,%rdi
    63de:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    63e2:	e9 f1 f5 ff ff       	jmpq   59d8 <dlmalloc+0xcd8>
    63e7:	49 89 47 20          	mov    %rax,0x20(%r15)
    63eb:	e9 3c f1 ff ff       	jmpq   552c <dlmalloc+0x82c>
    63f0:	48 39 d6             	cmp    %rdx,%rsi
    63f3:	4c 8b 4a 30          	mov    0x30(%rdx),%r9
    63f7:	0f 84 90 02 00 00    	je     668d <dlmalloc+0x198d>
    63fd:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    6401:	48 3b 0d 70 7c 00 00 	cmp    0x7c70(%rip),%rcx        # e078 <_gm_+0x18>
    6408:	0f 82 32 f0 ff ff    	jb     5440 <dlmalloc+0x740>
    640e:	48 39 51 18          	cmp    %rdx,0x18(%rcx)
    6412:	0f 85 28 f0 ff ff    	jne    5440 <dlmalloc+0x740>
    6418:	48 3b 56 10          	cmp    0x10(%rsi),%rdx
    641c:	0f 85 1e f0 ff ff    	jne    5440 <dlmalloc+0x740>
    6422:	48 89 71 18          	mov    %rsi,0x18(%rcx)
    6426:	48 89 4e 10          	mov    %rcx,0x10(%rsi)
    642a:	4d 85 c9             	test   %r9,%r9
    642d:	74 a9                	je     63d8 <dlmalloc+0x16d8>
    642f:	44 8b 52 38          	mov    0x38(%rdx),%r10d
    6433:	4c 89 d1             	mov    %r10,%rcx
    6436:	49 83 c2 4a          	add    $0x4a,%r10
    643a:	4b 39 54 d5 08       	cmp    %rdx,0x8(%r13,%r10,8)
    643f:	0f 84 28 02 00 00    	je     666d <dlmalloc+0x196d>
    6445:	4c 3b 0d 2c 7c 00 00 	cmp    0x7c2c(%rip),%r9        # e078 <_gm_+0x18>
    644c:	0f 82 ee ef ff ff    	jb     5440 <dlmalloc+0x740>
    6452:	49 39 51 20          	cmp    %rdx,0x20(%r9)
    6456:	0f 84 08 02 00 00    	je     6664 <dlmalloc+0x1964>
    645c:	49 89 71 28          	mov    %rsi,0x28(%r9)
    6460:	48 85 f6             	test   %rsi,%rsi
    6463:	0f 84 6f ff ff ff    	je     63d8 <dlmalloc+0x16d8>
    6469:	4c 8b 15 08 7c 00 00 	mov    0x7c08(%rip),%r10        # e078 <_gm_+0x18>
    6470:	4c 39 d6             	cmp    %r10,%rsi
    6473:	0f 82 c7 ef ff ff    	jb     5440 <dlmalloc+0x740>
    6479:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
    647d:	4c 89 4e 30          	mov    %r9,0x30(%rsi)
    6481:	48 85 c9             	test   %rcx,%rcx
    6484:	74 11                	je     6497 <dlmalloc+0x1797>
    6486:	49 39 ca             	cmp    %rcx,%r10
    6489:	0f 87 b1 ef ff ff    	ja     5440 <dlmalloc+0x740>
    648f:	48 89 4e 20          	mov    %rcx,0x20(%rsi)
    6493:	48 89 71 30          	mov    %rsi,0x30(%rcx)
    6497:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
    649b:	48 85 c9             	test   %rcx,%rcx
    649e:	0f 84 34 ff ff ff    	je     63d8 <dlmalloc+0x16d8>
    64a4:	49 39 ca             	cmp    %rcx,%r10
    64a7:	0f 87 93 ef ff ff    	ja     5440 <dlmalloc+0x740>
    64ad:	48 89 4e 28          	mov    %rcx,0x28(%rsi)
    64b1:	48 89 71 30          	mov    %rsi,0x30(%rcx)
    64b5:	e9 1e ff ff ff       	jmpq   63d8 <dlmalloc+0x16d8>
    64ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    64c0:	44 09 ca             	or     %r9d,%edx
    64c3:	4d 01 e8             	add    %r13,%r8
    64c6:	49 89 84 cd 58 02 00 	mov    %rax,0x258(%r13,%rcx,8)
    64cd:	00 
    64ce:	89 15 90 7b 00 00    	mov    %edx,0x7b90(%rip)        # e064 <_gm_+0x4>
    64d4:	4c 89 40 30          	mov    %r8,0x30(%rax)
    64d8:	48 89 40 18          	mov    %rax,0x18(%rax)
    64dc:	48 89 40 10          	mov    %rax,0x10(%rax)
    64e0:	e9 16 ea ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    64e5:	41 b8 58 02 00 00    	mov    $0x258,%r8d
    64eb:	ba 01 00 00 00       	mov    $0x1,%edx
    64f0:	31 f6                	xor    %esi,%esi
    64f2:	31 c9                	xor    %ecx,%ecx
    64f4:	e9 69 fd ff ff       	jmpq   6262 <dlmalloc+0x1562>
    64f9:	48 8b 43 20          	mov    0x20(%rbx),%rax
    64fd:	48 85 c0             	test   %rax,%rax
    6500:	0f 84 b8 00 00 00    	je     65be <dlmalloc+0x18be>
    6506:	4c 8d 4b 20          	lea    0x20(%rbx),%r9
    650a:	48 89 c1             	mov    %rax,%rcx
    650d:	e9 56 fc ff ff       	jmpq   6168 <dlmalloc+0x1468>
    6512:	4d 85 f6             	test   %r14,%r14
    6515:	0f 84 b2 ee ff ff    	je     53cd <dlmalloc+0x6cd>
    651b:	8b 7b 38             	mov    0x38(%rbx),%edi
    651e:	31 c0                	xor    %eax,%eax
    6520:	48 89 f9             	mov    %rdi,%rcx
    6523:	48 83 c7 4a          	add    $0x4a,%rdi
    6527:	49 39 5c fd 08       	cmp    %rbx,0x8(%r13,%rdi,8)
    652c:	0f 85 42 ee ff ff    	jne    5374 <dlmalloc+0x674>
    6532:	49 c7 44 fd 08 00 00 	movq   $0x0,0x8(%r13,%rdi,8)
    6539:	00 00 
    653b:	e9 0a fa ff ff       	jmpq   5f4a <dlmalloc+0x124a>
    6540:	49 8b 50 10          	mov    0x10(%r8),%rdx
    6544:	49 39 d6             	cmp    %rdx,%r14
    6547:	0f 86 90 f0 ff ff    	jbe    55dd <dlmalloc+0x8dd>
    654d:	e9 ee ee ff ff       	jmpq   5440 <dlmalloc+0x740>
    6552:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    6558:	4c 89 ff             	mov    %r15,%rdi
    655b:	48 89 0c 24          	mov    %rcx,(%rsp)
    655f:	e8 9c 17 00 00       	callq  7d00 <sbrk>
    6564:	4c 39 f0             	cmp    %r14,%rax
    6567:	48 89 c3             	mov    %rax,%rbx
    656a:	48 8b 0c 24          	mov    (%rsp),%rcx
    656e:	0f 85 ca f5 ff ff    	jne    5b3e <dlmalloc+0xe3e>
    6574:	4c 89 f3             	mov    %r14,%rbx
    6577:	e9 03 f6 ff ff       	jmpq   5b7f <dlmalloc+0xe7f>
    657c:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    6580:	48 3b 0d f1 7a 00 00 	cmp    0x7af1(%rip),%rcx        # e078 <_gm_+0x18>
    6587:	0f 83 9b f4 ff ff    	jae    5a28 <dlmalloc+0xd28>
    658d:	e9 ae ee ff ff       	jmpq   5440 <dlmalloc+0x740>
    6592:	48 89 d7             	mov    %rdx,%rdi
    6595:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    659a:	48 89 14 24          	mov    %rdx,(%rsp)
    659e:	e8 5d 17 00 00       	callq  7d00 <sbrk>
    65a3:	48 83 c0 01          	add    $0x1,%rax
    65a7:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    65ac:	0f 84 93 00 00 00    	je     6645 <dlmalloc+0x1945>
    65b2:	48 8b 14 24          	mov    (%rsp),%rdx
    65b6:	49 01 d7             	add    %rdx,%r15
    65b9:	e9 c1 f5 ff ff       	jmpq   5b7f <dlmalloc+0xe7f>
    65be:	4d 85 ff             	test   %r15,%r15
    65c1:	0f 84 ab ef ff ff    	je     5572 <dlmalloc+0x872>
    65c7:	44 8b 4b 38          	mov    0x38(%rbx),%r9d
    65cb:	4c 89 c9             	mov    %r9,%rcx
    65ce:	49 83 c1 4a          	add    $0x4a,%r9
    65d2:	4b 3b 5c cd 08       	cmp    0x8(%r13,%r9,8),%rbx
    65d7:	0f 85 38 ef ff ff    	jne    5515 <dlmalloc+0x815>
    65dd:	4b c7 44 cd 08 00 00 	movq   $0x0,0x8(%r13,%r9,8)
    65e4:	00 00 
    65e6:	e9 2d fd ff ff       	jmpq   6318 <dlmalloc+0x1618>
    65eb:	48 8d 34 ca          	lea    (%rdx,%rcx,8),%rsi
    65ef:	48 39 35 82 7a 00 00 	cmp    %rsi,0x7a82(%rip)        # e078 <_gm_+0x18>
    65f6:	0f 87 44 ee ff ff    	ja     5440 <dlmalloc+0x740>
    65fc:	48 89 04 ca          	mov    %rax,(%rdx,%rcx,8)
    6600:	48 89 50 30          	mov    %rdx,0x30(%rax)
    6604:	48 89 40 18          	mov    %rax,0x18(%rax)
    6608:	48 89 40 10          	mov    %rax,0x10(%rax)
    660c:	e9 ea e8 ff ff       	jmpq   4efb <dlmalloc+0x1fb>
    6611:	41 b8 50 03 00 00    	mov    $0x350,%r8d
    6617:	ba 00 00 00 80       	mov    $0x80000000,%edx
    661c:	be 1f 00 00 00       	mov    $0x1f,%esi
    6621:	b9 1f 00 00 00       	mov    $0x1f,%ecx
    6626:	e9 37 fc ff ff       	jmpq   6262 <dlmalloc+0x1562>
    662b:	48 89 fe             	mov    %rdi,%rsi
    662e:	48 83 ce 03          	or     $0x3,%rsi
    6632:	e9 2f e8 ff ff       	jmpq   4e66 <dlmalloc+0x166>
    6637:	48 85 d2             	test   %rdx,%rdx
    663a:	0f 85 65 ea ff ff    	jne    50a5 <dlmalloc+0x3a5>
    6640:	e9 5b ea ff ff       	jmpq   50a0 <dlmalloc+0x3a0>
    6645:	4c 89 f7             	mov    %r14,%rdi
    6648:	48 89 0c 24          	mov    %rcx,(%rsp)
    664c:	e8 af 16 00 00       	callq  7d00 <sbrk>
    6651:	c7 05 f5 7d 00 00 00 	movl   $0x0,0x7df5(%rip)        # e450 <malloc_global_mutex>
    6658:	00 00 00 
    665b:	48 8b 0c 24          	mov    (%rsp),%rcx
    665f:	e9 5e eb ff ff       	jmpq   51c2 <dlmalloc+0x4c2>
    6664:	49 89 71 20          	mov    %rsi,0x20(%r9)
    6668:	e9 f3 fd ff ff       	jmpq   6460 <dlmalloc+0x1760>
    666d:	48 85 f6             	test   %rsi,%rsi
    6670:	4b 89 74 d5 08       	mov    %rsi,0x8(%r13,%r10,8)
    6675:	0f 85 ee fd ff ff    	jne    6469 <dlmalloc+0x1769>
    667b:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    6680:	d3 c6                	rol    %cl,%esi
    6682:	21 35 dc 79 00 00    	and    %esi,0x79dc(%rip)        # e064 <_gm_+0x4>
    6688:	e9 4b fd ff ff       	jmpq   63d8 <dlmalloc+0x16d8>
    668d:	48 8b 72 28          	mov    0x28(%rdx),%rsi
    6691:	4c 8d 5a 28          	lea    0x28(%rdx),%r11
    6695:	48 85 f6             	test   %rsi,%rsi
    6698:	74 3c                	je     66d6 <dlmalloc+0x19d6>
    669a:	49 89 f2             	mov    %rsi,%r10
    669d:	4c 89 d6             	mov    %r10,%rsi
    66a0:	4d 8b 52 28          	mov    0x28(%r10),%r10
    66a4:	4c 89 d9             	mov    %r11,%rcx
    66a7:	4c 8d 5e 28          	lea    0x28(%rsi),%r11
    66ab:	4d 85 d2             	test   %r10,%r10
    66ae:	75 ed                	jne    669d <dlmalloc+0x199d>
    66b0:	4c 8b 56 20          	mov    0x20(%rsi),%r10
    66b4:	4c 8d 5e 20          	lea    0x20(%rsi),%r11
    66b8:	4d 85 d2             	test   %r10,%r10
    66bb:	75 e0                	jne    669d <dlmalloc+0x199d>
    66bd:	48 39 0d b4 79 00 00 	cmp    %rcx,0x79b4(%rip)        # e078 <_gm_+0x18>
    66c4:	0f 87 76 ed ff ff    	ja     5440 <dlmalloc+0x740>
    66ca:	48 c7 01 00 00 00 00 	movq   $0x0,(%rcx)
    66d1:	e9 54 fd ff ff       	jmpq   642a <dlmalloc+0x172a>
    66d6:	48 8b 72 20          	mov    0x20(%rdx),%rsi
    66da:	4c 8d 5a 20          	lea    0x20(%rdx),%r11
    66de:	48 85 f6             	test   %rsi,%rsi
    66e1:	75 b7                	jne    669a <dlmalloc+0x199a>
    66e3:	e9 42 fd ff ff       	jmpq   642a <dlmalloc+0x172a>
    66e8:	48 3b 35 89 79 00 00 	cmp    0x7989(%rip),%rsi        # e078 <_gm_+0x18>
    66ef:	0f 82 4b ed ff ff    	jb     5440 <dlmalloc+0x740>
    66f5:	48 39 56 10          	cmp    %rdx,0x10(%rsi)
    66f9:	0f 84 d1 fc ff ff    	je     63d0 <dlmalloc+0x16d0>
    66ff:	e9 3c ed ff ff       	jmpq   5440 <dlmalloc+0x740>
    6704:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    6709:	d3 c6                	rol    %cl,%esi
    670b:	21 35 4f 79 00 00    	and    %esi,0x794f(%rip)        # e060 <_gm_>
    6711:	e9 c2 fc ff ff       	jmpq   63d8 <dlmalloc+0x16d8>
    6716:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    671d:	00 00 00 

0000000000006720 <dlfree>:
    6720:	48 85 ff             	test   %rdi,%rdi
    6723:	0f 84 37 02 00 00    	je     6960 <dlfree+0x240>
    6729:	41 55                	push   %r13
    672b:	41 54                	push   %r12
    672d:	48 8d 57 f0          	lea    -0x10(%rdi),%rdx
    6731:	55                   	push   %rbp
    6732:	53                   	push   %rbx
    6733:	48 83 ec 08          	sub    $0x8,%rsp
    6737:	48 8b 47 f8          	mov    -0x8(%rdi),%rax
    673b:	48 8b 0d de 7c 00 00 	mov    0x7cde(%rip),%rcx        # e420 <mparams>
    6742:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    6746:	48 8b 5c 07 f0       	mov    -0x10(%rdi,%rax,1),%rbx
    674b:	48 31 cb             	xor    %rcx,%rbx
    674e:	48 3b 4b 40          	cmp    0x40(%rbx),%rcx
    6752:	0f 85 d4 03 00 00    	jne    6b2c <dlfree+0x40c>
    6758:	f6 83 70 03 00 00 02 	testb  $0x2,0x370(%rbx)
    675f:	0f 85 c3 01 00 00    	jne    6928 <dlfree+0x208>
    6765:	4c 8b 43 18          	mov    0x18(%rbx),%r8
    6769:	49 39 d0             	cmp    %rdx,%r8
    676c:	0f 87 f6 01 00 00    	ja     6968 <dlfree+0x248>
    6772:	48 8b 4f f8          	mov    -0x8(%rdi),%rcx
    6776:	49 89 c9             	mov    %rcx,%r9
    6779:	41 83 e1 03          	and    $0x3,%r9d
    677d:	49 83 f9 01          	cmp    $0x1,%r9
    6781:	0f 84 e1 01 00 00    	je     6968 <dlfree+0x248>
    6787:	48 89 c8             	mov    %rcx,%rax
    678a:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    678e:	83 e1 01             	and    $0x1,%ecx
    6791:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
    6795:	0f 84 95 00 00 00    	je     6830 <dlfree+0x110>
    679b:	48 39 f2             	cmp    %rsi,%rdx
    679e:	0f 83 c4 01 00 00    	jae    6968 <dlfree+0x248>
    67a4:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    67a8:	f6 c1 01             	test   $0x1,%cl
    67ab:	0f 84 b7 01 00 00    	je     6968 <dlfree+0x248>
    67b1:	f6 c1 02             	test   $0x2,%cl
    67b4:	0f 84 b6 01 00 00    	je     6970 <dlfree+0x250>
    67ba:	48 83 e1 fe          	and    $0xfffffffffffffffe,%rcx
    67be:	48 89 4e 08          	mov    %rcx,0x8(%rsi)
    67c2:	48 89 c1             	mov    %rax,%rcx
    67c5:	48 83 c9 01          	or     $0x1,%rcx
    67c9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    67cd:	48 89 04 02          	mov    %rax,(%rdx,%rax,1)
    67d1:	48 89 c1             	mov    %rax,%rcx
    67d4:	48 c1 e9 03          	shr    $0x3,%rcx
    67d8:	48 83 f9 1f          	cmp    $0x1f,%rcx
    67dc:	0f 87 96 02 00 00    	ja     6a78 <dlfree+0x358>
    67e2:	8d 04 09             	lea    (%rcx,%rcx,1),%eax
    67e5:	8b 3b                	mov    (%rbx),%edi
    67e7:	48 8d 74 c3 48       	lea    0x48(%rbx,%rax,8),%rsi
    67ec:	b8 01 00 00 00       	mov    $0x1,%eax
    67f1:	d3 e0                	shl    %cl,%eax
    67f3:	85 c7                	test   %eax,%edi
    67f5:	0f 85 23 03 00 00    	jne    6b1e <dlfree+0x3fe>
    67fb:	09 f8                	or     %edi,%eax
    67fd:	89 03                	mov    %eax,(%rbx)
    67ff:	48 89 f0             	mov    %rsi,%rax
    6802:	48 89 56 10          	mov    %rdx,0x10(%rsi)
    6806:	48 89 50 18          	mov    %rdx,0x18(%rax)
    680a:	48 89 42 10          	mov    %rax,0x10(%rdx)
    680e:	48 89 72 18          	mov    %rsi,0x18(%rdx)
    6812:	f6 83 70 03 00 00 02 	testb  $0x2,0x370(%rbx)
    6819:	74 0a                	je     6825 <dlfree+0x105>
    681b:	c7 83 74 03 00 00 00 	movl   $0x0,0x374(%rbx)
    6822:	00 00 00 
    6825:	48 83 c4 08          	add    $0x8,%rsp
    6829:	5b                   	pop    %rbx
    682a:	5d                   	pop    %rbp
    682b:	41 5c                	pop    %r12
    682d:	41 5d                	pop    %r13
    682f:	c3                   	retq   
    6830:	4d 85 c9             	test   %r9,%r9
    6833:	74 dd                	je     6812 <dlfree+0xf2>
    6835:	48 8b 4f f0          	mov    -0x10(%rdi),%rcx
    6839:	48 29 ca             	sub    %rcx,%rdx
    683c:	48 01 c8             	add    %rcx,%rax
    683f:	49 39 d0             	cmp    %rdx,%r8
    6842:	0f 87 20 01 00 00    	ja     6968 <dlfree+0x248>
    6848:	48 39 53 20          	cmp    %rdx,0x20(%rbx)
    684c:	0f 84 30 05 00 00    	je     6d82 <dlfree+0x662>
    6852:	48 c1 e9 03          	shr    $0x3,%rcx
    6856:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
    685a:	48 83 f9 1f          	cmp    $0x1f,%rcx
    685e:	0f 86 4a 03 00 00    	jbe    6bae <dlfree+0x48e>
    6864:	48 39 d7             	cmp    %rdx,%rdi
    6867:	4c 8b 5a 30          	mov    0x30(%rdx),%r11
    686b:	0f 84 9c 05 00 00    	je     6e0d <dlfree+0x6ed>
    6871:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    6875:	49 39 c8             	cmp    %rcx,%r8
    6878:	0f 87 ae 02 00 00    	ja     6b2c <dlfree+0x40c>
    687e:	48 39 51 18          	cmp    %rdx,0x18(%rcx)
    6882:	0f 85 a4 02 00 00    	jne    6b2c <dlfree+0x40c>
    6888:	48 39 57 10          	cmp    %rdx,0x10(%rdi)
    688c:	0f 85 9a 02 00 00    	jne    6b2c <dlfree+0x40c>
    6892:	48 89 79 18          	mov    %rdi,0x18(%rcx)
    6896:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
    689a:	4d 85 db             	test   %r11,%r11
    689d:	0f 84 f8 fe ff ff    	je     679b <dlfree+0x7b>
    68a3:	44 8b 4a 38          	mov    0x38(%rdx),%r9d
    68a7:	4c 89 c9             	mov    %r9,%rcx
    68aa:	4e 8d 0c cb          	lea    (%rbx,%r9,8),%r9
    68ae:	49 39 91 58 02 00 00 	cmp    %rdx,0x258(%r9)
    68b5:	0f 84 02 06 00 00    	je     6ebd <dlfree+0x79d>
    68bb:	4d 39 d8             	cmp    %r11,%r8
    68be:	0f 87 68 02 00 00    	ja     6b2c <dlfree+0x40c>
    68c4:	49 39 53 20          	cmp    %rdx,0x20(%r11)
    68c8:	0f 84 2d 06 00 00    	je     6efb <dlfree+0x7db>
    68ce:	49 89 7b 28          	mov    %rdi,0x28(%r11)
    68d2:	48 85 ff             	test   %rdi,%rdi
    68d5:	0f 84 c0 fe ff ff    	je     679b <dlfree+0x7b>
    68db:	49 39 f8             	cmp    %rdi,%r8
    68de:	0f 87 48 02 00 00    	ja     6b2c <dlfree+0x40c>
    68e4:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
    68e8:	4c 89 5f 30          	mov    %r11,0x30(%rdi)
    68ec:	48 85 c9             	test   %rcx,%rcx
    68ef:	74 11                	je     6902 <dlfree+0x1e2>
    68f1:	49 39 c8             	cmp    %rcx,%r8
    68f4:	0f 87 32 02 00 00    	ja     6b2c <dlfree+0x40c>
    68fa:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
    68fe:	48 89 79 30          	mov    %rdi,0x30(%rcx)
    6902:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
    6906:	48 85 c9             	test   %rcx,%rcx
    6909:	0f 84 8c fe ff ff    	je     679b <dlfree+0x7b>
    690f:	49 39 c8             	cmp    %rcx,%r8
    6912:	0f 87 14 02 00 00    	ja     6b2c <dlfree+0x40c>
    6918:	48 89 4f 28          	mov    %rcx,0x28(%rdi)
    691c:	48 89 79 30          	mov    %rdi,0x30(%rcx)
    6920:	e9 76 fe ff ff       	jmpq   679b <dlfree+0x7b>
    6925:	0f 1f 00             	nopl   (%rax)
    6928:	48 8d 8b 74 03 00 00 	lea    0x374(%rbx),%rcx
    692f:	b8 01 00 00 00       	mov    $0x1,%eax
    6934:	87 01                	xchg   %eax,(%rcx)
    6936:	85 c0                	test   %eax,%eax
    6938:	0f 84 27 fe ff ff    	je     6765 <dlfree+0x45>
    693e:	be 01 00 00 00       	mov    $0x1,%esi
    6943:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    6948:	8b 83 74 03 00 00    	mov    0x374(%rbx),%eax
    694e:	85 c0                	test   %eax,%eax
    6950:	75 f6                	jne    6948 <dlfree+0x228>
    6952:	89 f0                	mov    %esi,%eax
    6954:	87 01                	xchg   %eax,(%rcx)
    6956:	85 c0                	test   %eax,%eax
    6958:	75 ee                	jne    6948 <dlfree+0x228>
    695a:	e9 06 fe ff ff       	jmpq   6765 <dlfree+0x45>
    695f:	90                   	nop
    6960:	f3 c3                	repz retq 
    6962:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    6968:	e8 33 24 00 00       	callq  8da0 <abort>
    696d:	0f 1f 00             	nopl   (%rax)
    6970:	48 39 73 28          	cmp    %rsi,0x28(%rbx)
    6974:	4c 8b 53 20          	mov    0x20(%rbx),%r10
    6978:	0f 84 d5 02 00 00    	je     6c53 <dlfree+0x533>
    697e:	49 39 f2             	cmp    %rsi,%r10
    6981:	0f 84 2e 04 00 00    	je     6db5 <dlfree+0x695>
    6987:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    698b:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
    698f:	48 01 c8             	add    %rcx,%rax
    6992:	48 c1 e9 03          	shr    $0x3,%rcx
    6996:	48 83 f9 1f          	cmp    $0x1f,%rcx
    699a:	0f 86 43 02 00 00    	jbe    6be3 <dlfree+0x4c3>
    69a0:	48 39 f7             	cmp    %rsi,%rdi
    69a3:	48 8b 6e 30          	mov    0x30(%rsi),%rbp
    69a7:	0f 84 c4 04 00 00    	je     6e71 <dlfree+0x751>
    69ad:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    69b1:	49 39 c8             	cmp    %rcx,%r8
    69b4:	0f 87 72 01 00 00    	ja     6b2c <dlfree+0x40c>
    69ba:	48 39 71 18          	cmp    %rsi,0x18(%rcx)
    69be:	0f 85 68 01 00 00    	jne    6b2c <dlfree+0x40c>
    69c4:	48 39 77 10          	cmp    %rsi,0x10(%rdi)
    69c8:	0f 85 5e 01 00 00    	jne    6b2c <dlfree+0x40c>
    69ce:	48 89 79 18          	mov    %rdi,0x18(%rcx)
    69d2:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
    69d6:	48 85 ed             	test   %rbp,%rbp
    69d9:	74 75                	je     6a50 <dlfree+0x330>
    69db:	44 8b 4e 38          	mov    0x38(%rsi),%r9d
    69df:	4c 89 c9             	mov    %r9,%rcx
    69e2:	4e 8d 0c cb          	lea    (%rbx,%r9,8),%r9
    69e6:	49 39 b1 58 02 00 00 	cmp    %rsi,0x258(%r9)
    69ed:	0f 84 e9 04 00 00    	je     6edc <dlfree+0x7bc>
    69f3:	49 39 e8             	cmp    %rbp,%r8
    69f6:	0f 87 30 01 00 00    	ja     6b2c <dlfree+0x40c>
    69fc:	48 39 75 20          	cmp    %rsi,0x20(%rbp)
    6a00:	0f 84 5a 05 00 00    	je     6f60 <dlfree+0x840>
    6a06:	48 89 7d 28          	mov    %rdi,0x28(%rbp)
    6a0a:	48 85 ff             	test   %rdi,%rdi
    6a0d:	74 41                	je     6a50 <dlfree+0x330>
    6a0f:	49 39 f8             	cmp    %rdi,%r8
    6a12:	0f 87 14 01 00 00    	ja     6b2c <dlfree+0x40c>
    6a18:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
    6a1c:	48 89 6f 30          	mov    %rbp,0x30(%rdi)
    6a20:	48 85 c9             	test   %rcx,%rcx
    6a23:	74 11                	je     6a36 <dlfree+0x316>
    6a25:	49 39 c8             	cmp    %rcx,%r8
    6a28:	0f 87 fe 00 00 00    	ja     6b2c <dlfree+0x40c>
    6a2e:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
    6a32:	48 89 79 30          	mov    %rdi,0x30(%rcx)
    6a36:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
    6a3a:	48 85 c9             	test   %rcx,%rcx
    6a3d:	74 11                	je     6a50 <dlfree+0x330>
    6a3f:	49 39 c8             	cmp    %rcx,%r8
    6a42:	0f 87 e4 00 00 00    	ja     6b2c <dlfree+0x40c>
    6a48:	48 89 4f 28          	mov    %rcx,0x28(%rdi)
    6a4c:	48 89 79 30          	mov    %rdi,0x30(%rcx)
    6a50:	48 89 c1             	mov    %rax,%rcx
    6a53:	48 83 c9 01          	or     $0x1,%rcx
    6a57:	4c 39 d2             	cmp    %r10,%rdx
    6a5a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    6a5e:	48 89 04 02          	mov    %rax,(%rdx,%rax,1)
    6a62:	0f 85 69 fd ff ff    	jne    67d1 <dlfree+0xb1>
    6a68:	48 89 43 08          	mov    %rax,0x8(%rbx)
    6a6c:	e9 a1 fd ff ff       	jmpq   6812 <dlfree+0xf2>
    6a71:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    6a78:	48 89 c1             	mov    %rax,%rcx
    6a7b:	48 c1 e9 08          	shr    $0x8,%rcx
    6a7f:	85 c9                	test   %ecx,%ecx
    6a81:	74 24                	je     6aa7 <dlfree+0x387>
    6a83:	81 f9 ff ff 00 00    	cmp    $0xffff,%ecx
    6a89:	0f 86 89 01 00 00    	jbe    6c18 <dlfree+0x4f8>
    6a8f:	be 00 00 00 80       	mov    $0x80000000,%esi
    6a94:	41 b9 50 03 00 00    	mov    $0x350,%r9d
    6a9a:	b9 1f 00 00 00       	mov    $0x1f,%ecx
    6a9f:	41 ba 1f 00 00 00    	mov    $0x1f,%r10d
    6aa5:	eb 10                	jmp    6ab7 <dlfree+0x397>
    6aa7:	be 01 00 00 00       	mov    $0x1,%esi
    6aac:	41 b9 58 02 00 00    	mov    $0x258,%r9d
    6ab2:	31 c9                	xor    %ecx,%ecx
    6ab4:	45 31 d2             	xor    %r10d,%r10d
    6ab7:	8b 7b 04             	mov    0x4(%rbx),%edi
    6aba:	89 4a 38             	mov    %ecx,0x38(%rdx)
    6abd:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    6ac4:	00 
    6ac5:	48 c7 42 20 00 00 00 	movq   $0x0,0x20(%rdx)
    6acc:	00 
    6acd:	85 fe                	test   %edi,%esi
    6acf:	75 60                	jne    6b31 <dlfree+0x411>
    6ad1:	09 fe                	or     %edi,%esi
    6ad3:	49 01 d9             	add    %rbx,%r9
    6ad6:	89 73 04             	mov    %esi,0x4(%rbx)
    6ad9:	4a 89 94 d3 58 02 00 	mov    %rdx,0x258(%rbx,%r10,8)
    6ae0:	00 
    6ae1:	4c 89 4a 30          	mov    %r9,0x30(%rdx)
    6ae5:	48 89 52 18          	mov    %rdx,0x18(%rdx)
    6ae9:	48 89 52 10          	mov    %rdx,0x10(%rdx)
    6aed:	48 83 6b 38 01       	subq   $0x1,0x38(%rbx)
    6af2:	0f 85 1a fd ff ff    	jne    6812 <dlfree+0xf2>
    6af8:	48 8b 83 88 03 00 00 	mov    0x388(%rbx),%rax
    6aff:	48 85 c0             	test   %rax,%rax
    6b02:	74 0d                	je     6b11 <dlfree+0x3f1>
    6b04:	0f 1f 40 00          	nopl   0x0(%rax)
    6b08:	48 8b 40 10          	mov    0x10(%rax),%rax
    6b0c:	48 85 c0             	test   %rax,%rax
    6b0f:	75 f7                	jne    6b08 <dlfree+0x3e8>
    6b11:	48 c7 43 38 ff ff ff 	movq   $0xffffffffffffffff,0x38(%rbx)
    6b18:	ff 
    6b19:	e9 f4 fc ff ff       	jmpq   6812 <dlfree+0xf2>
    6b1e:	48 8b 46 10          	mov    0x10(%rsi),%rax
    6b22:	48 3b 43 18          	cmp    0x18(%rbx),%rax
    6b26:	0f 83 d6 fc ff ff    	jae    6802 <dlfree+0xe2>
    6b2c:	e8 6f 22 00 00       	callq  8da0 <abort>
    6b31:	83 f9 1f             	cmp    $0x1f,%ecx
    6b34:	4a 8b b4 d3 58 02 00 	mov    0x258(%rbx,%r10,8),%rsi
    6b3b:	00 
    6b3c:	48 89 c7             	mov    %rax,%rdi
    6b3f:	74 35                	je     6b76 <dlfree+0x456>
    6b41:	d1 e9                	shr    %ecx
    6b43:	bf 39 00 00 00       	mov    $0x39,%edi
    6b48:	29 cf                	sub    %ecx,%edi
    6b4a:	89 f9                	mov    %edi,%ecx
    6b4c:	48 89 c7             	mov    %rax,%rdi
    6b4f:	48 d3 e7             	shl    %cl,%rdi
    6b52:	eb 22                	jmp    6b76 <dlfree+0x456>
    6b54:	0f 1f 40 00          	nopl   0x0(%rax)
    6b58:	48 89 f9             	mov    %rdi,%rcx
    6b5b:	48 01 ff             	add    %rdi,%rdi
    6b5e:	48 c1 e9 3f          	shr    $0x3f,%rcx
    6b62:	48 83 c1 04          	add    $0x4,%rcx
    6b66:	4c 8b 0c ce          	mov    (%rsi,%rcx,8),%r9
    6b6a:	4d 85 c9             	test   %r9,%r9
    6b6d:	0f 84 62 02 00 00    	je     6dd5 <dlfree+0x6b5>
    6b73:	4c 89 ce             	mov    %r9,%rsi
    6b76:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    6b7a:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    6b7e:	48 39 c1             	cmp    %rax,%rcx
    6b81:	75 d5                	jne    6b58 <dlfree+0x438>
    6b83:	49 39 f0             	cmp    %rsi,%r8
    6b86:	48 8b 46 10          	mov    0x10(%rsi),%rax
    6b8a:	77 a0                	ja     6b2c <dlfree+0x40c>
    6b8c:	49 39 c0             	cmp    %rax,%r8
    6b8f:	77 9b                	ja     6b2c <dlfree+0x40c>
    6b91:	48 89 50 18          	mov    %rdx,0x18(%rax)
    6b95:	48 89 56 10          	mov    %rdx,0x10(%rsi)
    6b99:	48 89 42 10          	mov    %rax,0x10(%rdx)
    6b9d:	48 89 72 18          	mov    %rsi,0x18(%rdx)
    6ba1:	48 c7 42 30 00 00 00 	movq   $0x0,0x30(%rdx)
    6ba8:	00 
    6ba9:	e9 3f ff ff ff       	jmpq   6aed <dlfree+0x3cd>
    6bae:	44 8d 14 09          	lea    (%rcx,%rcx,1),%r10d
    6bb2:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
    6bb6:	4e 8d 54 d3 48       	lea    0x48(%rbx,%r10,8),%r10
    6bbb:	4d 39 ca             	cmp    %r9,%r10
    6bbe:	0f 85 40 03 00 00    	jne    6f04 <dlfree+0x7e4>
    6bc4:	4c 39 cf             	cmp    %r9,%rdi
    6bc7:	0f 84 88 02 00 00    	je     6e55 <dlfree+0x735>
    6bcd:	49 39 fa             	cmp    %rdi,%r10
    6bd0:	0f 85 bd 03 00 00    	jne    6f93 <dlfree+0x873>
    6bd6:	49 89 79 18          	mov    %rdi,0x18(%r9)
    6bda:	4c 89 4f 10          	mov    %r9,0x10(%rdi)
    6bde:	e9 b8 fb ff ff       	jmpq   679b <dlfree+0x7b>
    6be3:	44 8d 1c 09          	lea    (%rcx,%rcx,1),%r11d
    6be7:	4c 8b 4e 10          	mov    0x10(%rsi),%r9
    6beb:	4e 8d 5c db 48       	lea    0x48(%rbx,%r11,8),%r11
    6bf0:	4d 39 cb             	cmp    %r9,%r11
    6bf3:	0f 85 82 03 00 00    	jne    6f7b <dlfree+0x85b>
    6bf9:	4c 39 cf             	cmp    %r9,%rdi
    6bfc:	0f 84 61 02 00 00    	je     6e63 <dlfree+0x743>
    6c02:	4c 39 df             	cmp    %r11,%rdi
    6c05:	0f 85 a0 03 00 00    	jne    6fab <dlfree+0x88b>
    6c0b:	49 89 79 18          	mov    %rdi,0x18(%r9)
    6c0f:	4c 89 4f 10          	mov    %r9,0x10(%rdi)
    6c13:	e9 38 fe ff ff       	jmpq   6a50 <dlfree+0x330>
    6c18:	0f bd f1             	bsr    %ecx,%esi
    6c1b:	b9 26 00 00 00       	mov    $0x26,%ecx
    6c20:	48 89 c7             	mov    %rax,%rdi
    6c23:	83 f6 1f             	xor    $0x1f,%esi
    6c26:	29 f1                	sub    %esi,%ecx
    6c28:	48 d3 ef             	shr    %cl,%rdi
    6c2b:	48 89 f9             	mov    %rdi,%rcx
    6c2e:	bf 1f 00 00 00       	mov    $0x1f,%edi
    6c33:	83 e1 01             	and    $0x1,%ecx
    6c36:	29 f7                	sub    %esi,%edi
    6c38:	be 01 00 00 00       	mov    $0x1,%esi
    6c3d:	44 8d 14 79          	lea    (%rcx,%rdi,2),%r10d
    6c41:	4c 89 d1             	mov    %r10,%rcx
    6c44:	4e 8d 0c d5 58 02 00 	lea    0x258(,%r10,8),%r9
    6c4b:	00 
    6c4c:	d3 e6                	shl    %cl,%esi
    6c4e:	e9 64 fe ff ff       	jmpq   6ab7 <dlfree+0x397>
    6c53:	48 03 43 10          	add    0x10(%rbx),%rax
    6c57:	48 89 53 28          	mov    %rdx,0x28(%rbx)
    6c5b:	48 89 c1             	mov    %rax,%rcx
    6c5e:	48 89 43 10          	mov    %rax,0x10(%rbx)
    6c62:	48 83 c9 01          	or     $0x1,%rcx
    6c66:	4c 39 d2             	cmp    %r10,%rdx
    6c69:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    6c6d:	0f 84 85 01 00 00    	je     6df8 <dlfree+0x6d8>
    6c73:	48 3b 43 30          	cmp    0x30(%rbx),%rax
    6c77:	0f 86 95 fb ff ff    	jbe    6812 <dlfree+0xf2>
    6c7d:	48 83 3d 9b 77 00 00 	cmpq   $0x0,0x779b(%rip)        # e420 <mparams>
    6c84:	00 
    6c85:	75 09                	jne    6c90 <dlfree+0x570>
    6c87:	e8 34 d8 ff ff       	callq  44c0 <init_mparams>
    6c8c:	48 8b 53 28          	mov    0x28(%rbx),%rdx
    6c90:	48 85 d2             	test   %rdx,%rdx
    6c93:	0f 84 79 fb ff ff    	je     6812 <dlfree+0xf2>
    6c99:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
    6c9d:	48 83 f9 50          	cmp    $0x50,%rcx
    6ca1:	0f 86 c4 00 00 00    	jbe    6d6b <dlfree+0x64b>
    6ca7:	48 8d ab 78 03 00 00 	lea    0x378(%rbx),%rbp
    6cae:	48 8b 45 00          	mov    0x0(%rbp),%rax
    6cb2:	48 39 c2             	cmp    %rax,%rdx
    6cb5:	72 09                	jb     6cc0 <dlfree+0x5a0>
    6cb7:	48 03 45 08          	add    0x8(%rbp),%rax
    6cbb:	48 39 c2             	cmp    %rax,%rdx
    6cbe:	72 09                	jb     6cc9 <dlfree+0x5a9>
    6cc0:	48 8b 6d 10          	mov    0x10(%rbp),%rbp
    6cc4:	48 85 ed             	test   %rbp,%rbp
    6cc7:	75 e5                	jne    6cae <dlfree+0x58e>
    6cc9:	f6 45 18 08          	testb  $0x8,0x18(%rbp)
    6ccd:	0f 85 98 00 00 00    	jne    6d6b <dlfree+0x64b>
    6cd3:	48 8b 35 56 77 00 00 	mov    0x7756(%rip),%rsi        # e430 <mparams+0x10>
    6cda:	31 d2                	xor    %edx,%edx
    6cdc:	48 8d 44 31 af       	lea    -0x51(%rcx,%rsi,1),%rax
    6ce1:	48 f7 f6             	div    %rsi
    6ce4:	48 83 e8 01          	sub    $0x1,%rax
    6ce8:	48 0f af c6          	imul   %rsi,%rax
    6cec:	49 89 c4             	mov    %rax,%r12
    6cef:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    6cf6:	ff ff 7f 
    6cf9:	49 39 c4             	cmp    %rax,%r12
    6cfc:	76 0d                	jbe    6d0b <dlfree+0x5eb>
    6cfe:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
    6d05:	00 00 80 
    6d08:	49 29 f4             	sub    %rsi,%r12
    6d0b:	b8 01 00 00 00       	mov    $0x1,%eax
    6d10:	87 05 3a 77 00 00    	xchg   %eax,0x773a(%rip)        # e450 <malloc_global_mutex>
    6d16:	85 c0                	test   %eax,%eax
    6d18:	74 28                	je     6d42 <dlfree+0x622>
    6d1a:	48 8d 15 2f 77 00 00 	lea    0x772f(%rip),%rdx        # e450 <malloc_global_mutex>
    6d21:	b9 01 00 00 00       	mov    $0x1,%ecx
    6d26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    6d2d:	00 00 00 
    6d30:	8b 02                	mov    (%rdx),%eax
    6d32:	85 c0                	test   %eax,%eax
    6d34:	75 fa                	jne    6d30 <dlfree+0x610>
    6d36:	89 c8                	mov    %ecx,%eax
    6d38:	87 05 12 77 00 00    	xchg   %eax,0x7712(%rip)        # e450 <malloc_global_mutex>
    6d3e:	85 c0                	test   %eax,%eax
    6d40:	75 ee                	jne    6d30 <dlfree+0x610>
    6d42:	31 ff                	xor    %edi,%edi
    6d44:	e8 b7 0f 00 00       	callq  7d00 <sbrk>
    6d49:	49 89 c5             	mov    %rax,%r13
    6d4c:	48 8b 45 08          	mov    0x8(%rbp),%rax
    6d50:	48 03 45 00          	add    0x0(%rbp),%rax
    6d54:	49 39 c5             	cmp    %rax,%r13
    6d57:	0f 84 98 02 00 00    	je     6ff5 <dlfree+0x8d5>
    6d5d:	c7 05 e9 76 00 00 00 	movl   $0x0,0x76e9(%rip)        # e450 <malloc_global_mutex>
    6d64:	00 00 00 
    6d67:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
    6d6b:	48 3b 4b 30          	cmp    0x30(%rbx),%rcx
    6d6f:	0f 86 9d fa ff ff    	jbe    6812 <dlfree+0xf2>
    6d75:	48 c7 43 30 ff ff ff 	movq   $0xffffffffffffffff,0x30(%rbx)
    6d7c:	ff 
    6d7d:	e9 90 fa ff ff       	jmpq   6812 <dlfree+0xf2>
    6d82:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    6d86:	48 89 cf             	mov    %rcx,%rdi
    6d89:	83 e7 03             	and    $0x3,%edi
    6d8c:	48 83 ff 03          	cmp    $0x3,%rdi
    6d90:	0f 85 05 fa ff ff    	jne    679b <dlfree+0x7b>
    6d96:	48 83 e1 fe          	and    $0xfffffffffffffffe,%rcx
    6d9a:	48 89 43 08          	mov    %rax,0x8(%rbx)
    6d9e:	48 89 4e 08          	mov    %rcx,0x8(%rsi)
    6da2:	48 89 c1             	mov    %rax,%rcx
    6da5:	48 83 c9 01          	or     $0x1,%rcx
    6da9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    6dad:	48 89 06             	mov    %rax,(%rsi)
    6db0:	e9 5d fa ff ff       	jmpq   6812 <dlfree+0xf2>
    6db5:	48 03 43 08          	add    0x8(%rbx),%rax
    6db9:	48 89 53 20          	mov    %rdx,0x20(%rbx)
    6dbd:	48 89 c1             	mov    %rax,%rcx
    6dc0:	48 89 43 08          	mov    %rax,0x8(%rbx)
    6dc4:	48 83 c9 01          	or     $0x1,%rcx
    6dc8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
    6dcc:	48 89 04 02          	mov    %rax,(%rdx,%rax,1)
    6dd0:	e9 3d fa ff ff       	jmpq   6812 <dlfree+0xf2>
    6dd5:	48 8d 04 ce          	lea    (%rsi,%rcx,8),%rax
    6dd9:	48 39 43 18          	cmp    %rax,0x18(%rbx)
    6ddd:	0f 87 49 fd ff ff    	ja     6b2c <dlfree+0x40c>
    6de3:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
    6de7:	48 89 72 30          	mov    %rsi,0x30(%rdx)
    6deb:	48 89 52 18          	mov    %rdx,0x18(%rdx)
    6def:	48 89 52 10          	mov    %rdx,0x10(%rdx)
    6df3:	e9 f5 fc ff ff       	jmpq   6aed <dlfree+0x3cd>
    6df8:	48 c7 43 20 00 00 00 	movq   $0x0,0x20(%rbx)
    6dff:	00 
    6e00:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
    6e07:	00 
    6e08:	e9 66 fe ff ff       	jmpq   6c73 <dlfree+0x553>
    6e0d:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
    6e11:	4c 8d 4a 28          	lea    0x28(%rdx),%r9
    6e15:	48 85 c9             	test   %rcx,%rcx
    6e18:	0f 84 fe 00 00 00    	je     6f1c <dlfree+0x7fc>
    6e1e:	66 90                	xchg   %ax,%ax
    6e20:	48 89 cf             	mov    %rcx,%rdi
    6e23:	48 8b 49 28          	mov    0x28(%rcx),%rcx
    6e27:	4d 89 ca             	mov    %r9,%r10
    6e2a:	4c 8d 4f 28          	lea    0x28(%rdi),%r9
    6e2e:	48 85 c9             	test   %rcx,%rcx
    6e31:	75 ed                	jne    6e20 <dlfree+0x700>
    6e33:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
    6e37:	4c 8d 4f 20          	lea    0x20(%rdi),%r9
    6e3b:	48 85 c9             	test   %rcx,%rcx
    6e3e:	75 e0                	jne    6e20 <dlfree+0x700>
    6e40:	4d 39 d0             	cmp    %r10,%r8
    6e43:	0f 87 e3 fc ff ff    	ja     6b2c <dlfree+0x40c>
    6e49:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
    6e50:	e9 45 fa ff ff       	jmpq   689a <dlfree+0x17a>
    6e55:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    6e5a:	d3 c7                	rol    %cl,%edi
    6e5c:	21 3b                	and    %edi,(%rbx)
    6e5e:	e9 38 f9 ff ff       	jmpq   679b <dlfree+0x7b>
    6e63:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    6e68:	d3 c6                	rol    %cl,%esi
    6e6a:	21 33                	and    %esi,(%rbx)
    6e6c:	e9 df fb ff ff       	jmpq   6a50 <dlfree+0x330>
    6e71:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
    6e75:	4c 8d 4e 28          	lea    0x28(%rsi),%r9
    6e79:	48 85 c9             	test   %rcx,%rcx
    6e7c:	0f 84 e7 00 00 00    	je     6f69 <dlfree+0x849>
    6e82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    6e88:	48 89 cf             	mov    %rcx,%rdi
    6e8b:	48 8b 49 28          	mov    0x28(%rcx),%rcx
    6e8f:	4d 89 cb             	mov    %r9,%r11
    6e92:	4c 8d 4f 28          	lea    0x28(%rdi),%r9
    6e96:	48 85 c9             	test   %rcx,%rcx
    6e99:	75 ed                	jne    6e88 <dlfree+0x768>
    6e9b:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
    6e9f:	4c 8d 4f 20          	lea    0x20(%rdi),%r9
    6ea3:	48 85 c9             	test   %rcx,%rcx
    6ea6:	75 e0                	jne    6e88 <dlfree+0x768>
    6ea8:	4d 39 d8             	cmp    %r11,%r8
    6eab:	0f 87 7b fc ff ff    	ja     6b2c <dlfree+0x40c>
    6eb1:	49 c7 03 00 00 00 00 	movq   $0x0,(%r11)
    6eb8:	e9 19 fb ff ff       	jmpq   69d6 <dlfree+0x2b6>
    6ebd:	48 85 ff             	test   %rdi,%rdi
    6ec0:	49 89 b9 58 02 00 00 	mov    %rdi,0x258(%r9)
    6ec7:	0f 85 0e fa ff ff    	jne    68db <dlfree+0x1bb>
    6ecd:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    6ed2:	d3 c7                	rol    %cl,%edi
    6ed4:	21 7b 04             	and    %edi,0x4(%rbx)
    6ed7:	e9 bf f8 ff ff       	jmpq   679b <dlfree+0x7b>
    6edc:	48 85 ff             	test   %rdi,%rdi
    6edf:	49 89 b9 58 02 00 00 	mov    %rdi,0x258(%r9)
    6ee6:	0f 85 23 fb ff ff    	jne    6a0f <dlfree+0x2ef>
    6eec:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    6ef1:	d3 c6                	rol    %cl,%esi
    6ef3:	21 73 04             	and    %esi,0x4(%rbx)
    6ef6:	e9 55 fb ff ff       	jmpq   6a50 <dlfree+0x330>
    6efb:	49 89 7b 20          	mov    %rdi,0x20(%r11)
    6eff:	e9 ce f9 ff ff       	jmpq   68d2 <dlfree+0x1b2>
    6f04:	4d 39 c8             	cmp    %r9,%r8
    6f07:	0f 87 1f fc ff ff    	ja     6b2c <dlfree+0x40c>
    6f0d:	49 39 51 18          	cmp    %rdx,0x18(%r9)
    6f11:	0f 84 ad fc ff ff    	je     6bc4 <dlfree+0x4a4>
    6f17:	e9 10 fc ff ff       	jmpq   6b2c <dlfree+0x40c>
    6f1c:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
    6f20:	4c 8d 4a 20          	lea    0x20(%rdx),%r9
    6f24:	48 85 c9             	test   %rcx,%rcx
    6f27:	0f 85 f3 fe ff ff    	jne    6e20 <dlfree+0x700>
    6f2d:	4d 85 db             	test   %r11,%r11
    6f30:	0f 84 65 f8 ff ff    	je     679b <dlfree+0x7b>
    6f36:	8b 7a 38             	mov    0x38(%rdx),%edi
    6f39:	4c 8d 0c fb          	lea    (%rbx,%rdi,8),%r9
    6f3d:	48 89 f9             	mov    %rdi,%rcx
    6f40:	31 ff                	xor    %edi,%edi
    6f42:	49 39 91 58 02 00 00 	cmp    %rdx,0x258(%r9)
    6f49:	0f 85 6c f9 ff ff    	jne    68bb <dlfree+0x19b>
    6f4f:	49 c7 81 58 02 00 00 	movq   $0x0,0x258(%r9)
    6f56:	00 00 00 00 
    6f5a:	e9 6e ff ff ff       	jmpq   6ecd <dlfree+0x7ad>
    6f5f:	90                   	nop
    6f60:	48 89 7d 20          	mov    %rdi,0x20(%rbp)
    6f64:	e9 a1 fa ff ff       	jmpq   6a0a <dlfree+0x2ea>
    6f69:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
    6f6d:	48 85 c9             	test   %rcx,%rcx
    6f70:	74 51                	je     6fc3 <dlfree+0x8a3>
    6f72:	4c 8d 4e 20          	lea    0x20(%rsi),%r9
    6f76:	e9 0d ff ff ff       	jmpq   6e88 <dlfree+0x768>
    6f7b:	4d 39 c8             	cmp    %r9,%r8
    6f7e:	0f 87 a8 fb ff ff    	ja     6b2c <dlfree+0x40c>
    6f84:	49 39 71 18          	cmp    %rsi,0x18(%r9)
    6f88:	0f 84 6b fc ff ff    	je     6bf9 <dlfree+0x4d9>
    6f8e:	e9 99 fb ff ff       	jmpq   6b2c <dlfree+0x40c>
    6f93:	49 39 f8             	cmp    %rdi,%r8
    6f96:	0f 87 90 fb ff ff    	ja     6b2c <dlfree+0x40c>
    6f9c:	48 39 57 10          	cmp    %rdx,0x10(%rdi)
    6fa0:	0f 84 30 fc ff ff    	je     6bd6 <dlfree+0x4b6>
    6fa6:	e9 81 fb ff ff       	jmpq   6b2c <dlfree+0x40c>
    6fab:	49 39 f8             	cmp    %rdi,%r8
    6fae:	0f 87 78 fb ff ff    	ja     6b2c <dlfree+0x40c>
    6fb4:	48 39 77 10          	cmp    %rsi,0x10(%rdi)
    6fb8:	0f 84 4d fc ff ff    	je     6c0b <dlfree+0x4eb>
    6fbe:	e9 69 fb ff ff       	jmpq   6b2c <dlfree+0x40c>
    6fc3:	48 85 ed             	test   %rbp,%rbp
    6fc6:	0f 84 84 fa ff ff    	je     6a50 <dlfree+0x330>
    6fcc:	8b 7e 38             	mov    0x38(%rsi),%edi
    6fcf:	4c 8d 0c fb          	lea    (%rbx,%rdi,8),%r9
    6fd3:	48 89 f9             	mov    %rdi,%rcx
    6fd6:	31 ff                	xor    %edi,%edi
    6fd8:	49 39 b1 58 02 00 00 	cmp    %rsi,0x258(%r9)
    6fdf:	0f 85 0e fa ff ff    	jne    69f3 <dlfree+0x2d3>
    6fe5:	49 c7 81 58 02 00 00 	movq   $0x0,0x258(%r9)
    6fec:	00 00 00 00 
    6ff0:	e9 f7 fe ff ff       	jmpq   6eec <dlfree+0x7cc>
    6ff5:	4c 89 e7             	mov    %r12,%rdi
    6ff8:	48 f7 df             	neg    %rdi
    6ffb:	e8 00 0d 00 00       	callq  7d00 <sbrk>
    7000:	31 ff                	xor    %edi,%edi
    7002:	49 89 c4             	mov    %rax,%r12
    7005:	e8 f6 0c 00 00       	callq  7d00 <sbrk>
    700a:	49 83 c4 01          	add    $0x1,%r12
    700e:	c7 05 38 74 00 00 00 	movl   $0x0,0x7438(%rip)        # e450 <malloc_global_mutex>
    7015:	00 00 00 
    7018:	74 6c                	je     7086 <dlfree+0x966>
    701a:	49 39 c5             	cmp    %rax,%r13
    701d:	76 67                	jbe    7086 <dlfree+0x966>
    701f:	49 29 c5             	sub    %rax,%r13
    7022:	74 62                	je     7086 <dlfree+0x966>
    7024:	48 8b 4b 28          	mov    0x28(%rbx),%rcx
    7028:	48 8b 53 10          	mov    0x10(%rbx),%rdx
    702c:	4c 29 6d 08          	sub    %r13,0x8(%rbp)
    7030:	4c 29 ab 58 03 00 00 	sub    %r13,0x358(%rbx)
    7037:	48 8d 41 10          	lea    0x10(%rcx),%rax
    703b:	4c 29 ea             	sub    %r13,%rdx
    703e:	a8 0f                	test   $0xf,%al
    7040:	74 3c                	je     707e <dlfree+0x95e>
    7042:	48 f7 d8             	neg    %rax
    7045:	48 89 d7             	mov    %rdx,%rdi
    7048:	83 e0 0f             	and    $0xf,%eax
    704b:	48 29 c7             	sub    %rax,%rdi
    704e:	48 8d 34 01          	lea    (%rcx,%rax,1),%rsi
    7052:	48 89 f8             	mov    %rdi,%rax
    7055:	48 89 43 10          	mov    %rax,0x10(%rbx)
    7059:	48 83 c8 01          	or     $0x1,%rax
    705d:	48 89 73 28          	mov    %rsi,0x28(%rbx)
    7061:	48 89 46 08          	mov    %rax,0x8(%rsi)
    7065:	48 8b 05 d4 73 00 00 	mov    0x73d4(%rip),%rax        # e440 <mparams+0x20>
    706c:	48 c7 44 11 08 50 00 	movq   $0x50,0x8(%rcx,%rdx,1)
    7073:	00 00 
    7075:	48 89 43 30          	mov    %rax,0x30(%rbx)
    7079:	e9 94 f7 ff ff       	jmpq   6812 <dlfree+0xf2>
    707e:	48 89 d0             	mov    %rdx,%rax
    7081:	48 89 ce             	mov    %rcx,%rsi
    7084:	eb cf                	jmp    7055 <dlfree+0x935>
    7086:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
    708a:	e9 dc fc ff ff       	jmpq   6d6b <dlfree+0x64b>
    708f:	90                   	nop

0000000000007090 <calloc>:
    7090:	55                   	push   %rbp
    7091:	53                   	push   %rbx
    7092:	48 89 fb             	mov    %rdi,%rbx
    7095:	48 83 ec 08          	sub    $0x8,%rsp
    7099:	48 85 ff             	test   %rdi,%rdi
    709c:	74 2b                	je     70c9 <calloc+0x39>
    709e:	48 89 f8             	mov    %rdi,%rax
    70a1:	48 89 f9             	mov    %rdi,%rcx
    70a4:	48 09 f0             	or     %rsi,%rax
    70a7:	48 0f af ce          	imul   %rsi,%rcx
    70ab:	48 a9 00 00 ff ff    	test   $0xffffffffffff0000,%rax
    70b1:	74 3d                	je     70f0 <calloc+0x60>
    70b3:	31 d2                	xor    %edx,%edx
    70b5:	48 89 c8             	mov    %rcx,%rax
    70b8:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    70bf:	48 f7 f7             	div    %rdi
    70c2:	48 39 f0             	cmp    %rsi,%rax
    70c5:	48 0f 44 d9          	cmove  %rcx,%rbx
    70c9:	48 89 df             	mov    %rbx,%rdi
    70cc:	e8 2f dc ff ff       	callq  4d00 <dlmalloc>
    70d1:	48 85 c0             	test   %rax,%rax
    70d4:	48 89 c5             	mov    %rax,%rbp
    70d7:	74 0d                	je     70e6 <calloc+0x56>
    70d9:	48 89 da             	mov    %rbx,%rdx
    70dc:	31 f6                	xor    %esi,%esi
    70de:	48 89 c7             	mov    %rax,%rdi
    70e1:	e8 57 0b 00 00       	callq  7c3d <memset>
    70e6:	48 83 c4 08          	add    $0x8,%rsp
    70ea:	48 89 e8             	mov    %rbp,%rax
    70ed:	5b                   	pop    %rbx
    70ee:	5d                   	pop    %rbp
    70ef:	c3                   	retq   
    70f0:	48 89 cb             	mov    %rcx,%rbx
    70f3:	eb d4                	jmp    70c9 <calloc+0x39>
    70f5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    70fc:	00 00 00 
    70ff:	90                   	nop

0000000000007100 <dlrealloc>:
    7100:	41 57                	push   %r15
    7102:	41 56                	push   %r14
    7104:	41 55                	push   %r13
    7106:	41 54                	push   %r12
    7108:	49 89 f5             	mov    %rsi,%r13
    710b:	55                   	push   %rbp
    710c:	53                   	push   %rbx
    710d:	48 83 ec 08          	sub    $0x8,%rsp
    7111:	48 85 ff             	test   %rdi,%rdi
    7114:	0f 84 66 03 00 00    	je     7480 <dlrealloc+0x380>
    711a:	48 81 fe 7f ff ff ff 	cmp    $0xffffffffffffff7f,%rsi
    7121:	0f 87 c4 03 00 00    	ja     74eb <dlrealloc+0x3eb>
    7127:	48 85 f6             	test   %rsi,%rsi
    712a:	48 89 fd             	mov    %rdi,%rbp
    712d:	0f 84 12 04 00 00    	je     7545 <dlrealloc+0x445>
    7133:	48 83 fe 0e          	cmp    $0xe,%rsi
    7137:	bf 20 00 00 00       	mov    $0x20,%edi
    713c:	0f 87 ce 00 00 00    	ja     7210 <dlrealloc+0x110>
    7142:	4c 8b 45 f8          	mov    -0x8(%rbp),%r8
    7146:	4c 8d 75 f0          	lea    -0x10(%rbp),%r14
    714a:	48 8b 05 cf 72 00 00 	mov    0x72cf(%rip),%rax        # e420 <mparams>
    7151:	4c 89 c2             	mov    %r8,%rdx
    7154:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
    7158:	49 8d 34 16          	lea    (%r14,%rdx,1),%rsi
    715c:	48 8b 1e             	mov    (%rsi),%rbx
    715f:	48 31 c3             	xor    %rax,%rbx
    7162:	48 3b 43 40          	cmp    0x40(%rbx),%rax
    7166:	0f 85 f4 01 00 00    	jne    7360 <dlrealloc+0x260>
    716c:	f6 83 70 03 00 00 02 	testb  $0x2,0x370(%rbx)
    7173:	0f 85 ef 01 00 00    	jne    7368 <dlrealloc+0x268>
    7179:	4c 8b 4b 18          	mov    0x18(%rbx),%r9
    717d:	4d 39 ce             	cmp    %r9,%r14
    7180:	0f 82 da 01 00 00    	jb     7360 <dlrealloc+0x260>
    7186:	4c 89 c0             	mov    %r8,%rax
    7189:	83 e0 03             	and    $0x3,%eax
    718c:	49 39 f6             	cmp    %rsi,%r14
    718f:	0f 83 cb 01 00 00    	jae    7360 <dlrealloc+0x260>
    7195:	48 83 f8 01          	cmp    $0x1,%rax
    7199:	0f 84 c1 01 00 00    	je     7360 <dlrealloc+0x260>
    719f:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    71a3:	f6 c1 01             	test   $0x1,%cl
    71a6:	0f 84 b4 01 00 00    	je     7360 <dlrealloc+0x260>
    71ac:	48 85 c0             	test   %rax,%rax
    71af:	75 6f                	jne    7220 <dlrealloc+0x120>
    71b1:	48 81 ff f8 00 00 00 	cmp    $0xf8,%rdi
    71b8:	0f 86 5a 02 00 00    	jbe    7418 <dlrealloc+0x318>
    71be:	48 8d 47 08          	lea    0x8(%rdi),%rax
    71c2:	48 39 d0             	cmp    %rdx,%rax
    71c5:	0f 87 4d 02 00 00    	ja     7418 <dlrealloc+0x318>
    71cb:	48 8b 05 5e 72 00 00 	mov    0x725e(%rip),%rax        # e430 <mparams+0x10>
    71d2:	48 29 fa             	sub    %rdi,%rdx
    71d5:	48 01 c0             	add    %rax,%rax
    71d8:	48 39 c2             	cmp    %rax,%rdx
    71db:	0f 87 37 02 00 00    	ja     7418 <dlrealloc+0x318>
    71e1:	f6 83 70 03 00 00 02 	testb  $0x2,0x370(%rbx)
    71e8:	0f 85 b2 02 00 00    	jne    74a0 <dlrealloc+0x3a0>
    71ee:	4d 85 f6             	test   %r14,%r14
    71f1:	0f 84 2e 02 00 00    	je     7425 <dlrealloc+0x325>
    71f7:	48 83 c4 08          	add    $0x8,%rsp
    71fb:	48 89 e8             	mov    %rbp,%rax
    71fe:	5b                   	pop    %rbx
    71ff:	5d                   	pop    %rbp
    7200:	41 5c                	pop    %r12
    7202:	41 5d                	pop    %r13
    7204:	41 5e                	pop    %r14
    7206:	41 5f                	pop    %r15
    7208:	c3                   	retq   
    7209:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    7210:	48 8d 7e 1f          	lea    0x1f(%rsi),%rdi
    7214:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
    7218:	e9 25 ff ff ff       	jmpq   7142 <dlrealloc+0x42>
    721d:	0f 1f 00             	nopl   (%rax)
    7220:	48 39 d7             	cmp    %rdx,%rdi
    7223:	0f 86 87 01 00 00    	jbe    73b0 <dlrealloc+0x2b0>
    7229:	48 39 73 28          	cmp    %rsi,0x28(%rbx)
    722d:	0f 84 ca 02 00 00    	je     74fd <dlrealloc+0x3fd>
    7233:	48 39 73 20          	cmp    %rsi,0x20(%rbx)
    7237:	0f 84 14 03 00 00    	je     7551 <dlrealloc+0x451>
    723d:	f6 c1 02             	test   $0x2,%cl
    7240:	0f 85 d2 01 00 00    	jne    7418 <dlrealloc+0x318>
    7246:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    724a:	48 8d 04 11          	lea    (%rcx,%rdx,1),%rax
    724e:	48 39 c7             	cmp    %rax,%rdi
    7251:	0f 87 c1 01 00 00    	ja     7418 <dlrealloc+0x318>
    7257:	48 89 c2             	mov    %rax,%rdx
    725a:	48 c1 e9 03          	shr    $0x3,%rcx
    725e:	4c 8b 56 18          	mov    0x18(%rsi),%r10
    7262:	48 29 fa             	sub    %rdi,%rdx
    7265:	48 83 f9 1f          	cmp    $0x1f,%rcx
    7269:	0f 86 40 02 00 00    	jbe    74af <dlrealloc+0x3af>
    726f:	49 39 f2             	cmp    %rsi,%r10
    7272:	4c 8b 7e 30          	mov    0x30(%rsi),%r15
    7276:	0f 84 93 03 00 00    	je     760f <dlrealloc+0x50f>
    727c:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    7280:	49 39 c9             	cmp    %rcx,%r9
    7283:	0f 87 d7 00 00 00    	ja     7360 <dlrealloc+0x260>
    7289:	48 39 71 18          	cmp    %rsi,0x18(%rcx)
    728d:	0f 85 cd 00 00 00    	jne    7360 <dlrealloc+0x260>
    7293:	49 3b 72 10          	cmp    0x10(%r10),%rsi
    7297:	0f 85 c3 00 00 00    	jne    7360 <dlrealloc+0x260>
    729d:	4c 89 51 18          	mov    %r10,0x18(%rcx)
    72a1:	49 89 4a 10          	mov    %rcx,0x10(%r10)
    72a5:	4d 85 ff             	test   %r15,%r15
    72a8:	74 69                	je     7313 <dlrealloc+0x213>
    72aa:	44 8b 5e 38          	mov    0x38(%rsi),%r11d
    72ae:	4c 89 d9             	mov    %r11,%rcx
    72b1:	4e 8d 1c db          	lea    (%rbx,%r11,8),%r11
    72b5:	49 39 b3 58 02 00 00 	cmp    %rsi,0x258(%r11)
    72bc:	0f 84 a2 03 00 00    	je     7664 <dlrealloc+0x564>
    72c2:	4d 39 f9             	cmp    %r15,%r9
    72c5:	0f 87 95 00 00 00    	ja     7360 <dlrealloc+0x260>
    72cb:	49 39 77 20          	cmp    %rsi,0x20(%r15)
    72cf:	0f 84 cb 03 00 00    	je     76a0 <dlrealloc+0x5a0>
    72d5:	4d 89 57 28          	mov    %r10,0x28(%r15)
    72d9:	4d 85 d2             	test   %r10,%r10
    72dc:	74 35                	je     7313 <dlrealloc+0x213>
    72de:	4d 39 d1             	cmp    %r10,%r9
    72e1:	77 7d                	ja     7360 <dlrealloc+0x260>
    72e3:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
    72e7:	4d 89 7a 30          	mov    %r15,0x30(%r10)
    72eb:	48 85 c9             	test   %rcx,%rcx
    72ee:	74 0d                	je     72fd <dlrealloc+0x1fd>
    72f0:	49 39 c9             	cmp    %rcx,%r9
    72f3:	77 6b                	ja     7360 <dlrealloc+0x260>
    72f5:	49 89 4a 20          	mov    %rcx,0x20(%r10)
    72f9:	4c 89 51 30          	mov    %r10,0x30(%rcx)
    72fd:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
    7301:	48 85 c9             	test   %rcx,%rcx
    7304:	74 0d                	je     7313 <dlrealloc+0x213>
    7306:	49 39 c9             	cmp    %rcx,%r9
    7309:	77 55                	ja     7360 <dlrealloc+0x260>
    730b:	49 89 4a 28          	mov    %rcx,0x28(%r10)
    730f:	4c 89 51 30          	mov    %r10,0x30(%rcx)
    7313:	4c 8b 0d 06 71 00 00 	mov    0x7106(%rip),%r9        # e420 <mparams>
    731a:	41 83 e0 01          	and    $0x1,%r8d
    731e:	49 8d 0c 06          	lea    (%r14,%rax,1),%rcx
    7322:	49 83 c8 02          	or     $0x2,%r8
    7326:	49 31 d9             	xor    %rbx,%r9
    7329:	48 83 fa 1f          	cmp    $0x1f,%rdx
    732d:	0f 87 8a 02 00 00    	ja     75bd <dlrealloc+0x4bd>
    7333:	4c 09 c0             	or     %r8,%rax
    7336:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    733a:	4c 89 09             	mov    %r9,(%rcx)
    733d:	48 83 49 08 01       	orq    $0x1,0x8(%rcx)
    7342:	e9 9a fe ff ff       	jmpq   71e1 <dlrealloc+0xe1>
    7347:	4d 39 d1             	cmp    %r10,%r9
    734a:	77 14                	ja     7360 <dlrealloc+0x260>
    734c:	49 39 72 10          	cmp    %rsi,0x10(%r10)
    7350:	0f 84 81 01 00 00    	je     74d7 <dlrealloc+0x3d7>
    7356:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    735d:	00 00 00 
    7360:	e8 3b 1a 00 00       	callq  8da0 <abort>
    7365:	0f 1f 00             	nopl   (%rax)
    7368:	48 8d 93 74 03 00 00 	lea    0x374(%rbx),%rdx
    736f:	b8 01 00 00 00       	mov    $0x1,%eax
    7374:	87 02                	xchg   %eax,(%rdx)
    7376:	85 c0                	test   %eax,%eax
    7378:	74 18                	je     7392 <dlrealloc+0x292>
    737a:	b9 01 00 00 00       	mov    $0x1,%ecx
    737f:	90                   	nop
    7380:	8b 83 74 03 00 00    	mov    0x374(%rbx),%eax
    7386:	85 c0                	test   %eax,%eax
    7388:	75 f6                	jne    7380 <dlrealloc+0x280>
    738a:	89 c8                	mov    %ecx,%eax
    738c:	87 02                	xchg   %eax,(%rdx)
    738e:	85 c0                	test   %eax,%eax
    7390:	75 ee                	jne    7380 <dlrealloc+0x280>
    7392:	4c 8b 45 f8          	mov    -0x8(%rbp),%r8
    7396:	4c 89 c2             	mov    %r8,%rdx
    7399:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
    739d:	49 8d 34 16          	lea    (%r14,%rdx,1),%rsi
    73a1:	e9 d3 fd ff ff       	jmpq   7179 <dlrealloc+0x79>
    73a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    73ad:	00 00 00 
    73b0:	48 29 fa             	sub    %rdi,%rdx
    73b3:	48 83 fa 1f          	cmp    $0x1f,%rdx
    73b7:	49 89 d4             	mov    %rdx,%r12
    73ba:	0f 86 21 fe ff ff    	jbe    71e1 <dlrealloc+0xe1>
    73c0:	48 8b 05 59 70 00 00 	mov    0x7059(%rip),%rax        # e420 <mparams>
    73c7:	4d 8d 3c 3e          	lea    (%r14,%rdi,1),%r15
    73cb:	41 83 e0 01          	and    $0x1,%r8d
    73cf:	48 83 cf 02          	or     $0x2,%rdi
    73d3:	48 83 ca 03          	or     $0x3,%rdx
    73d7:	4c 09 c7             	or     %r8,%rdi
    73da:	48 31 d8             	xor    %rbx,%rax
    73dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    73e1:	49 89 57 08          	mov    %rdx,0x8(%r15)
    73e5:	49 89 07             	mov    %rax,(%r15)
    73e8:	48 83 4e 08 01       	orq    $0x1,0x8(%rsi)
    73ed:	49 8d 54 24 f0       	lea    -0x10(%r12),%rdx
    73f2:	49 8d 7f 10          	lea    0x10(%r15),%rdi
    73f6:	48 89 06             	mov    %rax,(%rsi)
    73f9:	31 f6                	xor    %esi,%esi
    73fb:	e8 3d 08 00 00       	callq  7c3d <memset>
    7400:	4c 89 e2             	mov    %r12,%rdx
    7403:	4c 89 fe             	mov    %r15,%rsi
    7406:	48 89 df             	mov    %rbx,%rdi
    7409:	e8 a2 d1 ff ff       	callq  45b0 <dispose_chunk>
    740e:	e9 ce fd ff ff       	jmpq   71e1 <dlrealloc+0xe1>
    7413:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    7418:	f6 83 70 03 00 00 02 	testb  $0x2,0x370(%rbx)
    741f:	0f 85 89 01 00 00    	jne    75ae <dlrealloc+0x4ae>
    7425:	4c 89 ef             	mov    %r13,%rdi
    7428:	e8 d3 d8 ff ff       	callq  4d00 <dlmalloc>
    742d:	48 85 c0             	test   %rax,%rax
    7430:	49 89 c4             	mov    %rax,%r12
    7433:	0f 84 ab 00 00 00    	je     74e4 <dlrealloc+0x3e4>
    7439:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    743d:	4c 89 ea             	mov    %r13,%rdx
    7440:	48 89 ee             	mov    %rbp,%rsi
    7443:	48 89 c7             	mov    %rax,%rdi
    7446:	48 83 e3 f8          	and    $0xfffffffffffffff8,%rbx
    744a:	48 83 eb 10          	sub    $0x10,%rbx
    744e:	49 39 dd             	cmp    %rbx,%r13
    7451:	48 0f 47 d3          	cmova  %rbx,%rdx
    7455:	e8 96 07 00 00       	callq  7bf0 <memcpy>
    745a:	48 89 ef             	mov    %rbp,%rdi
    745d:	48 89 da             	mov    %rbx,%rdx
    7460:	31 f6                	xor    %esi,%esi
    7462:	e8 d6 07 00 00       	callq  7c3d <memset>
    7467:	48 89 ef             	mov    %rbp,%rdi
    746a:	4c 89 e5             	mov    %r12,%rbp
    746d:	e8 ae f2 ff ff       	callq  6720 <dlfree>
    7472:	e9 80 fd ff ff       	jmpq   71f7 <dlrealloc+0xf7>
    7477:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    747e:	00 00 
    7480:	48 83 c4 08          	add    $0x8,%rsp
    7484:	48 89 f7             	mov    %rsi,%rdi
    7487:	5b                   	pop    %rbx
    7488:	5d                   	pop    %rbp
    7489:	41 5c                	pop    %r12
    748b:	41 5d                	pop    %r13
    748d:	41 5e                	pop    %r14
    748f:	41 5f                	pop    %r15
    7491:	e9 6a d8 ff ff       	jmpq   4d00 <dlmalloc>
    7496:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    749d:	00 00 00 
    74a0:	c7 83 74 03 00 00 00 	movl   $0x0,0x374(%rbx)
    74a7:	00 00 00 
    74aa:	e9 3f fd ff ff       	jmpq   71ee <dlrealloc+0xee>
    74af:	44 8d 24 09          	lea    (%rcx,%rcx,1),%r12d
    74b3:	4c 8b 5e 10          	mov    0x10(%rsi),%r11
    74b7:	4e 8d 64 e3 48       	lea    0x48(%rbx,%r12,8),%r12
    74bc:	4d 39 e3             	cmp    %r12,%r11
    74bf:	0f 85 be 01 00 00    	jne    7683 <dlrealloc+0x583>
    74c5:	4d 39 d3             	cmp    %r10,%r11
    74c8:	0f 84 88 01 00 00    	je     7656 <dlrealloc+0x556>
    74ce:	4d 39 d4             	cmp    %r10,%r12
    74d1:	0f 85 70 fe ff ff    	jne    7347 <dlrealloc+0x247>
    74d7:	4d 89 53 18          	mov    %r10,0x18(%r11)
    74db:	4d 89 5a 10          	mov    %r11,0x10(%r10)
    74df:	e9 2f fe ff ff       	jmpq   7313 <dlrealloc+0x213>
    74e4:	31 ed                	xor    %ebp,%ebp
    74e6:	e9 0c fd ff ff       	jmpq   71f7 <dlrealloc+0xf7>
    74eb:	e8 20 0b 00 00       	callq  8010 <__errno_location>
    74f0:	31 ed                	xor    %ebp,%ebp
    74f2:	c7 00 0c 00 00 00    	movl   $0xc,(%rax)
    74f8:	e9 fa fc ff ff       	jmpq   71f7 <dlrealloc+0xf7>
    74fd:	48 03 53 10          	add    0x10(%rbx),%rdx
    7501:	48 39 d7             	cmp    %rdx,%rdi
    7504:	0f 83 0e ff ff ff    	jae    7418 <dlrealloc+0x318>
    750a:	48 8b 0d 0f 6f 00 00 	mov    0x6f0f(%rip),%rcx        # e420 <mparams>
    7511:	49 8d 04 3e          	lea    (%r14,%rdi,1),%rax
    7515:	48 29 fa             	sub    %rdi,%rdx
    7518:	41 83 e0 01          	and    $0x1,%r8d
    751c:	48 83 cf 02          	or     $0x2,%rdi
    7520:	4c 09 c7             	or     %r8,%rdi
    7523:	48 31 d9             	xor    %rbx,%rcx
    7526:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    752a:	48 89 08             	mov    %rcx,(%rax)
    752d:	48 89 d1             	mov    %rdx,%rcx
    7530:	48 83 c9 01          	or     $0x1,%rcx
    7534:	48 89 48 08          	mov    %rcx,0x8(%rax)
    7538:	48 89 43 28          	mov    %rax,0x28(%rbx)
    753c:	48 89 53 10          	mov    %rdx,0x10(%rbx)
    7540:	e9 9c fc ff ff       	jmpq   71e1 <dlrealloc+0xe1>
    7545:	e8 d6 f1 ff ff       	callq  6720 <dlfree>
    754a:	31 ed                	xor    %ebp,%ebp
    754c:	e9 a6 fc ff ff       	jmpq   71f7 <dlrealloc+0xf7>
    7551:	48 03 53 08          	add    0x8(%rbx),%rdx
    7555:	48 39 d7             	cmp    %rdx,%rdi
    7558:	0f 87 ba fe ff ff    	ja     7418 <dlrealloc+0x318>
    755e:	48 8b 35 bb 6e 00 00 	mov    0x6ebb(%rip),%rsi        # e420 <mparams>
    7565:	48 89 d1             	mov    %rdx,%rcx
    7568:	41 83 e0 01          	and    $0x1,%r8d
    756c:	48 29 f9             	sub    %rdi,%rcx
    756f:	49 83 c8 02          	or     $0x2,%r8
    7573:	49 8d 04 16          	lea    (%r14,%rdx,1),%rax
    7577:	48 31 de             	xor    %rbx,%rsi
    757a:	48 83 f9 1f          	cmp    $0x1f,%rcx
    757e:	76 6b                	jbe    75eb <dlrealloc+0x4eb>
    7580:	4d 8d 0c 3e          	lea    (%r14,%rdi,1),%r9
    7584:	48 89 ca             	mov    %rcx,%rdx
    7587:	4c 09 c7             	or     %r8,%rdi
    758a:	48 83 ca 01          	or     $0x1,%rdx
    758e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    7592:	49 89 31             	mov    %rsi,(%r9)
    7595:	49 89 51 08          	mov    %rdx,0x8(%r9)
    7599:	48 89 08             	mov    %rcx,(%rax)
    759c:	48 83 60 08 fe       	andq   $0xfffffffffffffffe,0x8(%rax)
    75a1:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
    75a5:	4c 89 4b 20          	mov    %r9,0x20(%rbx)
    75a9:	e9 33 fc ff ff       	jmpq   71e1 <dlrealloc+0xe1>
    75ae:	c7 83 74 03 00 00 00 	movl   $0x0,0x374(%rbx)
    75b5:	00 00 00 
    75b8:	e9 68 fe ff ff       	jmpq   7425 <dlrealloc+0x325>
    75bd:	49 8d 34 3e          	lea    (%r14,%rdi,1),%rsi
    75c1:	48 89 d0             	mov    %rdx,%rax
    75c4:	4c 09 c7             	or     %r8,%rdi
    75c7:	48 83 c8 03          	or     $0x3,%rax
    75cb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    75cf:	48 89 df             	mov    %rbx,%rdi
    75d2:	4c 89 0e             	mov    %r9,(%rsi)
    75d5:	48 89 46 08          	mov    %rax,0x8(%rsi)
    75d9:	48 83 49 08 01       	orq    $0x1,0x8(%rcx)
    75de:	4c 89 09             	mov    %r9,(%rcx)
    75e1:	e8 ca cf ff ff       	callq  45b0 <dispose_chunk>
    75e6:	e9 f6 fb ff ff       	jmpq   71e1 <dlrealloc+0xe1>
    75eb:	4c 09 c2             	or     %r8,%rdx
    75ee:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    75f2:	48 89 30             	mov    %rsi,(%rax)
    75f5:	48 83 48 08 01       	orq    $0x1,0x8(%rax)
    75fa:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
    7601:	00 
    7602:	48 c7 43 20 00 00 00 	movq   $0x0,0x20(%rbx)
    7609:	00 
    760a:	e9 d2 fb ff ff       	jmpq   71e1 <dlrealloc+0xe1>
    760f:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
    7613:	4c 8d 5e 28          	lea    0x28(%rsi),%r11
    7617:	48 85 c9             	test   %rcx,%rcx
    761a:	0f 84 89 00 00 00    	je     76a9 <dlrealloc+0x5a9>
    7620:	49 89 ca             	mov    %rcx,%r10
    7623:	48 8b 49 28          	mov    0x28(%rcx),%rcx
    7627:	4d 89 dc             	mov    %r11,%r12
    762a:	4d 8d 5a 28          	lea    0x28(%r10),%r11
    762e:	48 85 c9             	test   %rcx,%rcx
    7631:	75 ed                	jne    7620 <dlrealloc+0x520>
    7633:	49 8b 4a 20          	mov    0x20(%r10),%rcx
    7637:	4d 8d 5a 20          	lea    0x20(%r10),%r11
    763b:	48 85 c9             	test   %rcx,%rcx
    763e:	75 e0                	jne    7620 <dlrealloc+0x520>
    7640:	4d 39 e1             	cmp    %r12,%r9
    7643:	0f 87 17 fd ff ff    	ja     7360 <dlrealloc+0x260>
    7649:	49 c7 04 24 00 00 00 	movq   $0x0,(%r12)
    7650:	00 
    7651:	e9 4f fc ff ff       	jmpq   72a5 <dlrealloc+0x1a5>
    7656:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    765b:	d3 c6                	rol    %cl,%esi
    765d:	21 33                	and    %esi,(%rbx)
    765f:	e9 af fc ff ff       	jmpq   7313 <dlrealloc+0x213>
    7664:	4d 85 d2             	test   %r10,%r10
    7667:	4d 89 93 58 02 00 00 	mov    %r10,0x258(%r11)
    766e:	0f 85 6a fc ff ff    	jne    72de <dlrealloc+0x1de>
    7674:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    7679:	d3 c6                	rol    %cl,%esi
    767b:	21 73 04             	and    %esi,0x4(%rbx)
    767e:	e9 90 fc ff ff       	jmpq   7313 <dlrealloc+0x213>
    7683:	4d 39 d9             	cmp    %r11,%r9
    7686:	0f 87 d4 fc ff ff    	ja     7360 <dlrealloc+0x260>
    768c:	49 39 73 18          	cmp    %rsi,0x18(%r11)
    7690:	0f 84 2f fe ff ff    	je     74c5 <dlrealloc+0x3c5>
    7696:	e9 c5 fc ff ff       	jmpq   7360 <dlrealloc+0x260>
    769b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    76a0:	4d 89 57 20          	mov    %r10,0x20(%r15)
    76a4:	e9 30 fc ff ff       	jmpq   72d9 <dlrealloc+0x1d9>
    76a9:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
    76ad:	4c 8d 5e 20          	lea    0x20(%rsi),%r11
    76b1:	48 85 c9             	test   %rcx,%rcx
    76b4:	0f 85 66 ff ff ff    	jne    7620 <dlrealloc+0x520>
    76ba:	4d 85 ff             	test   %r15,%r15
    76bd:	0f 84 50 fc ff ff    	je     7313 <dlrealloc+0x213>
    76c3:	44 8b 56 38          	mov    0x38(%rsi),%r10d
    76c7:	4e 8d 1c d3          	lea    (%rbx,%r10,8),%r11
    76cb:	4c 89 d1             	mov    %r10,%rcx
    76ce:	45 31 d2             	xor    %r10d,%r10d
    76d1:	49 3b b3 58 02 00 00 	cmp    0x258(%r11),%rsi
    76d8:	0f 85 e4 fb ff ff    	jne    72c2 <dlrealloc+0x1c2>
    76de:	49 c7 83 58 02 00 00 	movq   $0x0,0x258(%r11)
    76e5:	00 00 00 00 
    76e9:	eb 89                	jmp    7674 <dlrealloc+0x574>
    76eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000076f0 <dlmemalign>:
    76f0:	48 83 ff 10          	cmp    $0x10,%rdi
    76f4:	0f 86 de 00 00 00    	jbe    77d8 <dlmemalign+0xe8>
    76fa:	48 83 ff 1f          	cmp    $0x1f,%rdi
    76fe:	41 54                	push   %r12
    7700:	48 c7 c0 60 ff ff ff 	mov    $0xffffffffffffff60,%rax
    7707:	55                   	push   %rbp
    7708:	53                   	push   %rbx
    7709:	bb 20 00 00 00       	mov    $0x20,%ebx
    770e:	76 2a                	jbe    773a <dlmemalign+0x4a>
    7710:	48 8d 57 ff          	lea    -0x1(%rdi),%rdx
    7714:	48 85 fa             	test   %rdi,%rdx
    7717:	0f 84 00 02 00 00    	je     791d <dlmemalign+0x22d>
    771d:	48 83 ff 20          	cmp    $0x20,%rdi
    7721:	74 17                	je     773a <dlmemalign+0x4a>
    7723:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    7728:	48 01 db             	add    %rbx,%rbx
    772b:	48 39 df             	cmp    %rbx,%rdi
    772e:	77 f8                	ja     7728 <dlmemalign+0x38>
    7730:	48 c7 c0 80 ff ff ff 	mov    $0xffffffffffffff80,%rax
    7737:	48 29 d8             	sub    %rbx,%rax
    773a:	48 39 c6             	cmp    %rax,%rsi
    773d:	72 19                	jb     7758 <dlmemalign+0x68>
    773f:	e8 cc 08 00 00       	callq  8010 <__errno_location>
    7744:	c7 00 0c 00 00 00    	movl   $0xc,(%rax)
    774a:	31 c0                	xor    %eax,%eax
    774c:	5b                   	pop    %rbx
    774d:	5d                   	pop    %rbp
    774e:	41 5c                	pop    %r12
    7750:	c3                   	retq   
    7751:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    7758:	48 83 fe 0e          	cmp    $0xe,%rsi
    775c:	bd 20 00 00 00       	mov    $0x20,%ebp
    7761:	76 0b                	jbe    776e <dlmemalign+0x7e>
    7763:	48 83 c6 1f          	add    $0x1f,%rsi
    7767:	48 83 e6 f0          	and    $0xfffffffffffffff0,%rsi
    776b:	48 89 f5             	mov    %rsi,%rbp
    776e:	48 8d 7c 2b 10       	lea    0x10(%rbx,%rbp,1),%rdi
    7773:	e8 88 d5 ff ff       	callq  4d00 <dlmalloc>
    7778:	48 85 c0             	test   %rax,%rax
    777b:	74 cf                	je     774c <dlmemalign+0x5c>
    777d:	f6 05 4c 6c 00 00 02 	testb  $0x2,0x6c4c(%rip)        # e3d0 <_gm_+0x370>
    7784:	4c 8d 60 f0          	lea    -0x10(%rax),%r12
    7788:	0f 85 a2 00 00 00    	jne    7830 <dlmemalign+0x140>
    778e:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
    7792:	48 85 d0             	test   %rdx,%rax
    7795:	75 49                	jne    77e0 <dlmemalign+0xf0>
    7797:	48 8b 48 f8          	mov    -0x8(%rax),%rcx
    779b:	f6 c1 03             	test   $0x3,%cl
    779e:	74 14                	je     77b4 <dlmemalign+0xc4>
    77a0:	48 89 c8             	mov    %rcx,%rax
    77a3:	48 8d 55 20          	lea    0x20(%rbp),%rdx
    77a7:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    77ab:	48 39 d0             	cmp    %rdx,%rax
    77ae:	0f 87 1c 01 00 00    	ja     78d0 <dlmemalign+0x1e0>
    77b4:	f6 05 15 6c 00 00 02 	testb  $0x2,0x6c15(%rip)        # e3d0 <_gm_+0x370>
    77bb:	49 8d 44 24 10       	lea    0x10(%r12),%rax
    77c0:	74 8a                	je     774c <dlmemalign+0x5c>
    77c2:	c7 05 08 6c 00 00 00 	movl   $0x0,0x6c08(%rip)        # e3d4 <_gm_+0x374>
    77c9:	00 00 00 
    77cc:	e9 7b ff ff ff       	jmpq   774c <dlmemalign+0x5c>
    77d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    77d8:	48 89 f7             	mov    %rsi,%rdi
    77db:	e9 20 d5 ff ff       	jmpq   4d00 <dlmalloc>
    77e0:	48 89 d9             	mov    %rbx,%rcx
    77e3:	48 01 c2             	add    %rax,%rdx
    77e6:	48 8b 70 f8          	mov    -0x8(%rax),%rsi
    77ea:	48 f7 d9             	neg    %rcx
    77ed:	48 21 ca             	and    %rcx,%rdx
    77f0:	48 83 ea 10          	sub    $0x10,%rdx
    77f4:	48 89 d1             	mov    %rdx,%rcx
    77f7:	48 01 d3             	add    %rdx,%rbx
    77fa:	4c 29 e1             	sub    %r12,%rcx
    77fd:	48 83 f9 20          	cmp    $0x20,%rcx
    7801:	48 89 f1             	mov    %rsi,%rcx
    7804:	48 0f 43 da          	cmovae %rdx,%rbx
    7808:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    780c:	48 89 da             	mov    %rbx,%rdx
    780f:	4c 29 e2             	sub    %r12,%rdx
    7812:	48 29 d1             	sub    %rdx,%rcx
    7815:	83 e6 03             	and    $0x3,%esi
    7818:	75 56                	jne    7870 <dlmemalign+0x180>
    781a:	48 03 50 f0          	add    -0x10(%rax),%rdx
    781e:	49 89 dc             	mov    %rbx,%r12
    7821:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
    7825:	48 89 13             	mov    %rdx,(%rbx)
    7828:	e9 6e ff ff ff       	jmpq   779b <dlmemalign+0xab>
    782d:	0f 1f 00             	nopl   (%rax)
    7830:	ba 01 00 00 00       	mov    $0x1,%edx
    7835:	87 15 99 6b 00 00    	xchg   %edx,0x6b99(%rip)        # e3d4 <_gm_+0x374>
    783b:	85 d2                	test   %edx,%edx
    783d:	0f 84 4b ff ff ff    	je     778e <dlmemalign+0x9e>
    7843:	b9 01 00 00 00       	mov    $0x1,%ecx
    7848:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    784f:	00 
    7850:	8b 15 7e 6b 00 00    	mov    0x6b7e(%rip),%edx        # e3d4 <_gm_+0x374>
    7856:	85 d2                	test   %edx,%edx
    7858:	75 f6                	jne    7850 <dlmemalign+0x160>
    785a:	89 ca                	mov    %ecx,%edx
    785c:	87 15 72 6b 00 00    	xchg   %edx,0x6b72(%rip)        # e3d4 <_gm_+0x374>
    7862:	85 d2                	test   %edx,%edx
    7864:	75 ea                	jne    7850 <dlmemalign+0x160>
    7866:	e9 23 ff ff ff       	jmpq   778e <dlmemalign+0x9e>
    786b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    7870:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    7874:	48 8d 3d e5 67 00 00 	lea    0x67e5(%rip),%rdi        # e060 <_gm_>
    787b:	83 e6 01             	and    $0x1,%esi
    787e:	48 83 ce 02          	or     $0x2,%rsi
    7882:	48 09 ce             	or     %rcx,%rsi
    7885:	48 01 d9             	add    %rbx,%rcx
    7888:	48 89 73 08          	mov    %rsi,0x8(%rbx)
    788c:	48 8b 35 8d 6b 00 00 	mov    0x6b8d(%rip),%rsi        # e420 <mparams>
    7893:	48 83 49 08 01       	orq    $0x1,0x8(%rcx)
    7898:	48 31 fe             	xor    %rdi,%rsi
    789b:	48 89 31             	mov    %rsi,(%rcx)
    789e:	48 8b 48 f8          	mov    -0x8(%rax),%rcx
    78a2:	83 e1 01             	and    $0x1,%ecx
    78a5:	48 83 c9 02          	or     $0x2,%rcx
    78a9:	48 09 d1             	or     %rdx,%rcx
    78ac:	48 89 48 f8          	mov    %rcx,-0x8(%rax)
    78b0:	49 8d 04 14          	lea    (%r12,%rdx,1),%rax
    78b4:	48 83 48 08 01       	orq    $0x1,0x8(%rax)
    78b9:	48 89 30             	mov    %rsi,(%rax)
    78bc:	4c 89 e6             	mov    %r12,%rsi
    78bf:	49 89 dc             	mov    %rbx,%r12
    78c2:	e8 e9 cc ff ff       	callq  45b0 <dispose_chunk>
    78c7:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    78cb:	e9 cb fe ff ff       	jmpq   779b <dlmemalign+0xab>
    78d0:	48 89 c2             	mov    %rax,%rdx
    78d3:	49 8d 34 2c          	lea    (%r12,%rbp,1),%rsi
    78d7:	83 e1 01             	and    $0x1,%ecx
    78da:	48 29 ea             	sub    %rbp,%rdx
    78dd:	48 83 cd 02          	or     $0x2,%rbp
    78e1:	48 8d 3d 78 67 00 00 	lea    0x6778(%rip),%rdi        # e060 <_gm_>
    78e8:	48 09 e9             	or     %rbp,%rcx
    78eb:	49 89 d0             	mov    %rdx,%r8
    78ee:	4c 01 e0             	add    %r12,%rax
    78f1:	49 89 4c 24 08       	mov    %rcx,0x8(%r12)
    78f6:	48 8b 0d 23 6b 00 00 	mov    0x6b23(%rip),%rcx        # e420 <mparams>
    78fd:	49 83 c8 03          	or     $0x3,%r8
    7901:	4c 89 46 08          	mov    %r8,0x8(%rsi)
    7905:	48 31 f9             	xor    %rdi,%rcx
    7908:	48 89 0e             	mov    %rcx,(%rsi)
    790b:	48 83 48 08 01       	orq    $0x1,0x8(%rax)
    7910:	48 89 08             	mov    %rcx,(%rax)
    7913:	e8 98 cc ff ff       	callq  45b0 <dispose_chunk>
    7918:	e9 97 fe ff ff       	jmpq   77b4 <dlmemalign+0xc4>
    791d:	48 83 c0 20          	add    $0x20,%rax
    7921:	48 89 fb             	mov    %rdi,%rbx
    7924:	48 29 f8             	sub    %rdi,%rax
    7927:	e9 0e fe ff ff       	jmpq   773a <dlmemalign+0x4a>
    792c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000007930 <dlmallinfo>:
    7930:	41 55                	push   %r13
    7932:	41 54                	push   %r12
    7934:	55                   	push   %rbp
    7935:	53                   	push   %rbx
    7936:	48 83 ec 18          	sub    $0x18,%rsp
    793a:	48 83 3d de 6a 00 00 	cmpq   $0x0,0x6ade(%rip)        # e420 <mparams>
    7941:	00 
    7942:	0f 84 98 01 00 00    	je     7ae0 <dlmallinfo+0x1b0>
    7948:	8b 1d 82 6a 00 00    	mov    0x6a82(%rip),%ebx        # e3d0 <_gm_+0x370>
    794e:	83 e3 02             	and    $0x2,%ebx
    7951:	0f 85 29 01 00 00    	jne    7a80 <dlmallinfo+0x150>
    7957:	4c 8b 05 2a 67 00 00 	mov    0x672a(%rip),%r8        # e088 <_gm_+0x28>
    795e:	4d 85 c0             	test   %r8,%r8
    7961:	0f 84 05 01 00 00    	je     7a6c <dlmallinfo+0x13c>
    7967:	48 8b 2d 02 67 00 00 	mov    0x6702(%rip),%rbp        # e070 <_gm_+0x10>
    796e:	4c 8d 15 63 6a 00 00 	lea    0x6a63(%rip),%r10        # e3d8 <_gm_+0x378>
    7975:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    797b:	4c 8d 4d 50          	lea    0x50(%rbp),%r9
    797f:	4c 89 c9             	mov    %r9,%rcx
    7982:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    7988:	49 8b 32             	mov    (%r10),%rsi
    798b:	48 8d 46 10          	lea    0x10(%rsi),%rax
    798f:	a8 0f                	test   $0xf,%al
    7991:	0f 84 b9 00 00 00    	je     7a50 <dlmallinfo+0x120>
    7997:	48 f7 d8             	neg    %rax
    799a:	83 e0 0f             	and    $0xf,%eax
    799d:	48 01 f0             	add    %rsi,%rax
    79a0:	72 4c                	jb     79ee <dlmallinfo+0xbe>
    79a2:	4d 8b 6a 08          	mov    0x8(%r10),%r13
    79a6:	49 01 f5             	add    %rsi,%r13
    79a9:	49 39 c5             	cmp    %rax,%r13
    79ac:	76 40                	jbe    79ee <dlmallinfo+0xbe>
    79ae:	49 39 c0             	cmp    %rax,%r8
    79b1:	75 31                	jne    79e4 <dlmallinfo+0xb4>
    79b3:	eb 39                	jmp    79ee <dlmallinfo+0xbe>
    79b5:	0f 1f 00             	nopl   (%rax)
    79b8:	49 89 d4             	mov    %rdx,%r12
    79bb:	83 e2 03             	and    $0x3,%edx
    79be:	49 83 e4 f8          	and    $0xfffffffffffffff8,%r12
    79c2:	4c 01 e1             	add    %r12,%rcx
    79c5:	48 83 fa 01          	cmp    $0x1,%rdx
    79c9:	75 07                	jne    79d2 <dlmallinfo+0xa2>
    79cb:	4d 01 e1             	add    %r12,%r9
    79ce:	49 83 c3 01          	add    $0x1,%r11
    79d2:	4c 01 e0             	add    %r12,%rax
    79d5:	48 39 c6             	cmp    %rax,%rsi
    79d8:	77 14                	ja     79ee <dlmallinfo+0xbe>
    79da:	4c 39 c0             	cmp    %r8,%rax
    79dd:	74 0f                	je     79ee <dlmallinfo+0xbe>
    79df:	4c 39 e8             	cmp    %r13,%rax
    79e2:	73 0a                	jae    79ee <dlmallinfo+0xbe>
    79e4:	48 8b 50 08          	mov    0x8(%rax),%rdx
    79e8:	48 83 fa 0b          	cmp    $0xb,%rdx
    79ec:	75 ca                	jne    79b8 <dlmallinfo+0x88>
    79ee:	4d 8b 52 10          	mov    0x10(%r10),%r10
    79f2:	4d 85 d2             	test   %r10,%r10
    79f5:	75 91                	jne    7988 <dlmallinfo+0x58>
    79f7:	48 8b 05 ba 69 00 00 	mov    0x69ba(%rip),%rax        # e3b8 <_gm_+0x358>
    79fe:	89 ca                	mov    %ecx,%edx
    7a00:	89 c6                	mov    %eax,%esi
    7a02:	44 29 c8             	sub    %r9d,%eax
    7a05:	29 ce                	sub    %ecx,%esi
    7a07:	89 f1                	mov    %esi,%ecx
    7a09:	8b 35 b1 69 00 00    	mov    0x69b1(%rip),%esi        # e3c0 <_gm_+0x360>
    7a0f:	85 db                	test   %ebx,%ebx
    7a11:	75 4d                	jne    7a60 <dlmallinfo+0x130>
    7a13:	89 47 1c             	mov    %eax,0x1c(%rdi)
    7a16:	89 17                	mov    %edx,(%rdi)
    7a18:	48 89 f8             	mov    %rdi,%rax
    7a1b:	44 89 5f 04          	mov    %r11d,0x4(%rdi)
    7a1f:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
    7a26:	00 
    7a27:	89 4f 10             	mov    %ecx,0x10(%rdi)
    7a2a:	89 77 14             	mov    %esi,0x14(%rdi)
    7a2d:	c7 47 18 00 00 00 00 	movl   $0x0,0x18(%rdi)
    7a34:	44 89 4f 20          	mov    %r9d,0x20(%rdi)
    7a38:	89 6f 24             	mov    %ebp,0x24(%rdi)
    7a3b:	48 83 c4 18          	add    $0x18,%rsp
    7a3f:	5b                   	pop    %rbx
    7a40:	5d                   	pop    %rbp
    7a41:	41 5c                	pop    %r12
    7a43:	41 5d                	pop    %r13
    7a45:	c3                   	retq   
    7a46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    7a4d:	00 00 00 
    7a50:	48 89 f0             	mov    %rsi,%rax
    7a53:	e9 4a ff ff ff       	jmpq   79a2 <dlmallinfo+0x72>
    7a58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    7a5f:	00 
    7a60:	c7 05 6a 69 00 00 00 	movl   $0x0,0x696a(%rip)        # e3d4 <_gm_+0x374>
    7a67:	00 00 00 
    7a6a:	eb a7                	jmp    7a13 <dlmallinfo+0xe3>
    7a6c:	31 ed                	xor    %ebp,%ebp
    7a6e:	45 31 c9             	xor    %r9d,%r9d
    7a71:	31 c0                	xor    %eax,%eax
    7a73:	31 f6                	xor    %esi,%esi
    7a75:	31 c9                	xor    %ecx,%ecx
    7a77:	45 31 db             	xor    %r11d,%r11d
    7a7a:	31 d2                	xor    %edx,%edx
    7a7c:	eb 95                	jmp    7a13 <dlmallinfo+0xe3>
    7a7e:	66 90                	xchg   %ax,%ax
    7a80:	b8 01 00 00 00       	mov    $0x1,%eax
    7a85:	87 05 49 69 00 00    	xchg   %eax,0x6949(%rip)        # e3d4 <_gm_+0x374>
    7a8b:	85 c0                	test   %eax,%eax
    7a8d:	74 1f                	je     7aae <dlmallinfo+0x17e>
    7a8f:	ba 01 00 00 00       	mov    $0x1,%edx
    7a94:	0f 1f 40 00          	nopl   0x0(%rax)
    7a98:	8b 05 36 69 00 00    	mov    0x6936(%rip),%eax        # e3d4 <_gm_+0x374>
    7a9e:	85 c0                	test   %eax,%eax
    7aa0:	75 f6                	jne    7a98 <dlmallinfo+0x168>
    7aa2:	89 d0                	mov    %edx,%eax
    7aa4:	87 05 2a 69 00 00    	xchg   %eax,0x692a(%rip)        # e3d4 <_gm_+0x374>
    7aaa:	85 c0                	test   %eax,%eax
    7aac:	75 ea                	jne    7a98 <dlmallinfo+0x168>
    7aae:	4c 8b 05 d3 65 00 00 	mov    0x65d3(%rip),%r8        # e088 <_gm_+0x28>
    7ab5:	8b 1d 15 69 00 00    	mov    0x6915(%rip),%ebx        # e3d0 <_gm_+0x370>
    7abb:	83 e3 02             	and    $0x2,%ebx
    7abe:	4d 85 c0             	test   %r8,%r8
    7ac1:	0f 85 a0 fe ff ff    	jne    7967 <dlmallinfo+0x37>
    7ac7:	31 ed                	xor    %ebp,%ebp
    7ac9:	45 31 c9             	xor    %r9d,%r9d
    7acc:	31 c0                	xor    %eax,%eax
    7ace:	31 f6                	xor    %esi,%esi
    7ad0:	31 c9                	xor    %ecx,%ecx
    7ad2:	45 31 db             	xor    %r11d,%r11d
    7ad5:	31 d2                	xor    %edx,%edx
    7ad7:	e9 33 ff ff ff       	jmpq   7a0f <dlmallinfo+0xdf>
    7adc:	0f 1f 40 00          	nopl   0x0(%rax)
    7ae0:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    7ae5:	e8 d6 c9 ff ff       	callq  44c0 <init_mparams>
    7aea:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    7aef:	e9 54 fe ff ff       	jmpq   7948 <dlmallinfo+0x18>
    7af4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    7afb:	00 00 00 
    7afe:	66 90                	xchg   %ax,%ax

0000000000007b00 <__memcpy>:
    7b00:	48 85 d2             	test   %rdx,%rdx
    7b03:	48 89 f8             	mov    %rdi,%rax
    7b06:	74 7e                	je     7b86 <__memcpy+0x86>
    7b08:	48 39 f7             	cmp    %rsi,%rdi
    7b0b:	74 79                	je     7b86 <__memcpy+0x86>
    7b0d:	48 39 f7             	cmp    %rsi,%rdi
    7b10:	73 0d                	jae    7b1f <__memcpy+0x1f>
    7b12:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
    7b16:	48 39 ce             	cmp    %rcx,%rsi
    7b19:	0f 82 c8 00 00 00    	jb     7be7 <__memcpy+0xe7>
    7b1f:	48 39 f0             	cmp    %rsi,%rax
    7b22:	76 0d                	jbe    7b31 <__memcpy+0x31>
    7b24:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
    7b28:	48 39 c8             	cmp    %rcx,%rax
    7b2b:	0f 82 b6 00 00 00    	jb     7be7 <__memcpy+0xe7>
    7b31:	48 89 f1             	mov    %rsi,%rcx
    7b34:	48 09 c1             	or     %rax,%rcx
    7b37:	83 e1 07             	and    $0x7,%ecx
    7b3a:	75 54                	jne    7b90 <__memcpy+0x90>
    7b3c:	48 89 d1             	mov    %rdx,%rcx
    7b3f:	83 e2 07             	and    $0x7,%edx
    7b42:	48 89 c7             	mov    %rax,%rdi
    7b45:	48 c1 e9 03          	shr    $0x3,%rcx
    7b49:	49 89 d0             	mov    %rdx,%r8
    7b4c:	48 85 c9             	test   %rcx,%rcx
    7b4f:	74 26                	je     7b77 <__memcpy+0x77>
    7b51:	4c 8d 0c cd 00 00 00 	lea    0x0(,%rcx,8),%r9
    7b58:	00 
    7b59:	48 89 f9             	mov    %rdi,%rcx
    7b5c:	4e 8d 14 0e          	lea    (%rsi,%r9,1),%r10
    7b60:	48 8b 16             	mov    (%rsi),%rdx
    7b63:	48 83 c6 08          	add    $0x8,%rsi
    7b67:	48 83 c1 08          	add    $0x8,%rcx
    7b6b:	48 89 51 f8          	mov    %rdx,-0x8(%rcx)
    7b6f:	49 39 f2             	cmp    %rsi,%r10
    7b72:	75 ec                	jne    7b60 <__memcpy+0x60>
    7b74:	4c 01 cf             	add    %r9,%rdi
    7b77:	4d 85 c0             	test   %r8,%r8
    7b7a:	74 0a                	je     7b86 <__memcpy+0x86>
    7b7c:	4a 8d 14 06          	lea    (%rsi,%r8,1),%rdx
    7b80:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    7b81:	48 39 d6             	cmp    %rdx,%rsi
    7b84:	75 fa                	jne    7b80 <__memcpy+0x80>
    7b86:	f3 c3                	repz retq 
    7b88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    7b8f:	00 
    7b90:	48 89 f1             	mov    %rsi,%rcx
    7b93:	48 31 c1             	xor    %rax,%rcx
    7b96:	83 e1 07             	and    $0x7,%ecx
    7b99:	75 2d                	jne    7bc8 <__memcpy+0xc8>
    7b9b:	48 83 fa 07          	cmp    $0x7,%rdx
    7b9f:	76 27                	jbe    7bc8 <__memcpy+0xc8>
    7ba1:	48 89 f1             	mov    %rsi,%rcx
    7ba4:	bf 08 00 00 00       	mov    $0x8,%edi
    7ba9:	83 e1 07             	and    $0x7,%ecx
    7bac:	48 29 cf             	sub    %rcx,%rdi
    7baf:	48 29 fa             	sub    %rdi,%rdx
    7bb2:	48 89 d1             	mov    %rdx,%rcx
    7bb5:	83 e2 07             	and    $0x7,%edx
    7bb8:	49 89 d0             	mov    %rdx,%r8
    7bbb:	48 c1 e9 03          	shr    $0x3,%rcx
    7bbf:	48 89 fa             	mov    %rdi,%rdx
    7bc2:	eb 09                	jmp    7bcd <__memcpy+0xcd>
    7bc4:	0f 1f 40 00          	nopl   0x0(%rax)
    7bc8:	45 31 c0             	xor    %r8d,%r8d
    7bcb:	31 c9                	xor    %ecx,%ecx
    7bcd:	4c 8d 0c 16          	lea    (%rsi,%rdx,1),%r9
    7bd1:	48 89 c7             	mov    %rax,%rdi
    7bd4:	0f 1f 40 00          	nopl   0x0(%rax)
    7bd8:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    7bd9:	4c 39 ce             	cmp    %r9,%rsi
    7bdc:	75 fa                	jne    7bd8 <__memcpy+0xd8>
    7bde:	48 8d 3c 10          	lea    (%rax,%rdx,1),%rdi
    7be2:	e9 65 ff ff ff       	jmpq   7b4c <__memcpy+0x4c>
    7be7:	48 83 ec 08          	sub    $0x8,%rsp
    7beb:	e8 b0 11 00 00       	callq  8da0 <abort>

0000000000007bf0 <memcpy>:
    7bf0:	e9 0b ff ff ff       	jmpq   7b00 <__memcpy>

0000000000007bf5 <__memset>:
    7bf5:	48 89 7c 24 e8       	mov    %rdi,-0x18(%rsp)
    7bfa:	89 74 24 e4          	mov    %esi,-0x1c(%rsp)
    7bfe:	48 89 54 24 d8       	mov    %rdx,-0x28(%rsp)
    7c03:	48 83 7c 24 d8 00    	cmpq   $0x0,-0x28(%rsp)
    7c09:	74 2c                	je     7c37 <__memset+0x42>
    7c0b:	48 8b 44 24 e8       	mov    -0x18(%rsp),%rax
    7c10:	48 89 44 24 f8       	mov    %rax,-0x8(%rsp)
    7c15:	48 8b 44 24 f8       	mov    -0x8(%rsp),%rax
    7c1a:	48 8d 50 01          	lea    0x1(%rax),%rdx
    7c1e:	48 89 54 24 f8       	mov    %rdx,-0x8(%rsp)
    7c23:	8b 54 24 e4          	mov    -0x1c(%rsp),%edx
    7c27:	88 10                	mov    %dl,(%rax)
    7c29:	48 83 6c 24 d8 01    	subq   $0x1,-0x28(%rsp)
    7c2f:	48 83 7c 24 d8 00    	cmpq   $0x0,-0x28(%rsp)
    7c35:	75 de                	jne    7c15 <__memset+0x20>
    7c37:	48 8b 44 24 e8       	mov    -0x18(%rsp),%rax
    7c3c:	c3                   	retq   

0000000000007c3d <memset>:
    7c3d:	e9 b3 ff ff ff       	jmpq   7bf5 <__memset>
    7c42:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    7c49:	00 00 00 
    7c4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000007c50 <memset_s>:
    7c50:	48 85 ff             	test   %rdi,%rdi
    7c53:	53                   	push   %rbx
    7c54:	74 42                	je     7c98 <memset_s+0x48>
    7c56:	48 39 f1             	cmp    %rsi,%rcx
    7c59:	89 d0                	mov    %edx,%eax
    7c5b:	76 23                	jbe    7c80 <memset_s+0x30>
    7c5d:	bb 4b 00 00 00       	mov    $0x4b,%ebx
    7c62:	48 89 f2             	mov    %rsi,%rdx
    7c65:	48 8b 0d cc 53 00 00 	mov    0x53cc(%rip),%rcx        # d038 <__memset_vp>
    7c6c:	89 c6                	mov    %eax,%esi
    7c6e:	ff d1                	callq  *%rcx
    7c70:	e8 9b 03 00 00       	callq  8010 <__errno_location>
    7c75:	89 18                	mov    %ebx,(%rax)
    7c77:	89 d8                	mov    %ebx,%eax
    7c79:	5b                   	pop    %rbx
    7c7a:	c3                   	retq   
    7c7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    7c80:	31 db                	xor    %ebx,%ebx
    7c82:	4c 8b 05 af 53 00 00 	mov    0x53af(%rip),%r8        # d038 <__memset_vp>
    7c89:	48 89 ca             	mov    %rcx,%rdx
    7c8c:	89 c6                	mov    %eax,%esi
    7c8e:	41 ff d0             	callq  *%r8
    7c91:	89 d8                	mov    %ebx,%eax
    7c93:	5b                   	pop    %rbx
    7c94:	c3                   	retq   
    7c95:	0f 1f 00             	nopl   (%rax)
    7c98:	bb 16 00 00 00       	mov    $0x16,%ebx
    7c9d:	eb d1                	jmp    7c70 <memset_s+0x20>
    7c9f:	90                   	nop

0000000000007ca0 <heap_init>:
    7ca0:	48 83 3d a8 51 00 00 	cmpq   $0x0,0x51a8(%rip)        # ce50 <heap_base>
    7ca7:	00 
    7ca8:	b8 01 00 00 00       	mov    $0x1,%eax
    7cad:	75 05                	jne    7cb4 <heap_init+0x14>
    7caf:	48 85 ff             	test   %rdi,%rdi
    7cb2:	75 0c                	jne    7cc0 <heap_init+0x20>
    7cb4:	f3 c3                	repz retq 
    7cb6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    7cbd:	00 00 00 
    7cc0:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
    7cc6:	75 ec                	jne    7cb4 <heap_init+0x14>
    7cc8:	49 89 f0             	mov    %rsi,%r8
    7ccb:	49 09 d0             	or     %rdx,%r8
    7cce:	41 f7 c0 ff 0f 00 00 	test   $0xfff,%r8d
    7cd5:	75 dd                	jne    7cb4 <heap_init+0x14>
    7cd7:	48 89 3d 72 51 00 00 	mov    %rdi,0x5172(%rip)        # ce50 <heap_base>
    7cde:	48 89 35 63 51 00 00 	mov    %rsi,0x5163(%rip)        # ce48 <heap_size>
    7ce5:	31 c0                	xor    %eax,%eax
    7ce7:	48 89 15 4a 51 00 00 	mov    %rdx,0x514a(%rip)        # ce38 <heap_min_size>
    7cee:	89 0d 4c 51 00 00    	mov    %ecx,0x514c(%rip)        # ce40 <is_edmm_supported>
    7cf4:	c3                   	retq   
    7cf5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    7cfc:	00 00 00 
    7cff:	90                   	nop

0000000000007d00 <sbrk>:
    7d00:	55                   	push   %rbp
    7d01:	53                   	push   %rbx
    7d02:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    7d09:	48 83 ec 08          	sub    $0x8,%rsp
    7d0d:	48 8b 15 3c 51 00 00 	mov    0x513c(%rip),%rdx        # ce50 <heap_base>
    7d14:	48 85 d2             	test   %rdx,%rdx
    7d17:	0f 84 87 00 00 00    	je     7da4 <sbrk+0xa4>
    7d1d:	48 85 ff             	test   %rdi,%rdi
    7d20:	48 8b 2d 31 67 00 00 	mov    0x6731(%rip),%rbp        # e458 <heap_used.2396>
    7d27:	0f 88 83 00 00 00    	js     7db0 <sbrk+0xb0>
    7d2d:	48 89 f8             	mov    %rdi,%rax
    7d30:	48 f7 d0             	not    %rax
    7d33:	48 39 e8             	cmp    %rbp,%rax
    7d36:	72 6c                	jb     7da4 <sbrk+0xa4>
    7d38:	48 8d 04 2f          	lea    (%rdi,%rbp,1),%rax
    7d3c:	48 3b 05 05 51 00 00 	cmp    0x5105(%rip),%rax        # ce48 <heap_size>
    7d43:	77 5f                	ja     7da4 <sbrk+0xa4>
    7d45:	48 39 05 14 67 00 00 	cmp    %rax,0x6714(%rip)        # e460 <g_peak_heap_used>
    7d4c:	48 89 c1             	mov    %rax,%rcx
    7d4f:	48 8d 1c 2a          	lea    (%rdx,%rbp,1),%rbx
    7d53:	48 0f 43 0d 05 67 00 	cmovae 0x6705(%rip),%rcx        # e460 <g_peak_heap_used>
    7d5a:	00 
    7d5b:	48 89 05 f6 66 00 00 	mov    %rax,0x66f6(%rip)        # e458 <heap_used.2396>
    7d62:	48 89 0d f7 66 00 00 	mov    %rcx,0x66f7(%rip)        # e460 <g_peak_heap_used>
    7d69:	8b 0d d1 50 00 00    	mov    0x50d1(%rip),%ecx        # ce40 <is_edmm_supported>
    7d6f:	85 c9                	test   %ecx,%ecx
    7d71:	74 31                	je     7da4 <sbrk+0xa4>
    7d73:	48 8b 0d be 50 00 00 	mov    0x50be(%rip),%rcx        # ce38 <heap_min_size>
    7d7a:	48 39 c8             	cmp    %rcx,%rax
    7d7d:	76 25                	jbe    7da4 <sbrk+0xa4>
    7d7f:	48 39 e9             	cmp    %rbp,%rcx
    7d82:	49 89 d8             	mov    %rbx,%r8
    7d85:	72 0a                	jb     7d91 <sbrk+0x91>
    7d87:	48 29 c8             	sub    %rcx,%rax
    7d8a:	4c 8d 04 0a          	lea    (%rdx,%rcx,1),%r8
    7d8e:	48 89 c7             	mov    %rax,%rdi
    7d91:	48 89 fe             	mov    %rdi,%rsi
    7d94:	4c 89 c7             	mov    %r8,%rdi
    7d97:	48 c1 ee 0c          	shr    $0xc,%rsi
    7d9b:	e8 d0 a1 ff ff       	callq  1f70 <apply_EPC_pages>
    7da0:	85 c0                	test   %eax,%eax
    7da2:	75 5b                	jne    7dff <sbrk+0xff>
    7da4:	48 83 c4 08          	add    $0x8,%rsp
    7da8:	48 89 d8             	mov    %rbx,%rax
    7dab:	5b                   	pop    %rbx
    7dac:	5d                   	pop    %rbp
    7dad:	c3                   	retq   
    7dae:	66 90                	xchg   %ax,%ax
    7db0:	48 89 fe             	mov    %rdi,%rsi
    7db3:	48 f7 de             	neg    %rsi
    7db6:	48 39 ee             	cmp    %rbp,%rsi
    7db9:	77 e9                	ja     7da4 <sbrk+0xa4>
    7dbb:	48 8d 04 2f          	lea    (%rdi,%rbp,1),%rax
    7dbf:	8b 3d 7b 50 00 00    	mov    0x507b(%rip),%edi        # ce40 <is_edmm_supported>
    7dc5:	48 89 05 8c 66 00 00 	mov    %rax,0x668c(%rip)        # e458 <heap_used.2396>
    7dcc:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
    7dd0:	85 ff                	test   %edi,%edi
    7dd2:	74 d0                	je     7da4 <sbrk+0xa4>
    7dd4:	48 8b 0d 5d 50 00 00 	mov    0x505d(%rip),%rcx        # ce38 <heap_min_size>
    7ddb:	48 39 e9             	cmp    %rbp,%rcx
    7dde:	73 c4                	jae    7da4 <sbrk+0xa4>
    7de0:	48 39 c1             	cmp    %rax,%rcx
    7de3:	48 89 df             	mov    %rbx,%rdi
    7de6:	72 0a                	jb     7df2 <sbrk+0xf2>
    7de8:	48 89 ee             	mov    %rbp,%rsi
    7deb:	48 8d 3c 0a          	lea    (%rdx,%rcx,1),%rdi
    7def:	48 29 ce             	sub    %rcx,%rsi
    7df2:	48 c1 ee 0c          	shr    $0xc,%rsi
    7df6:	e8 f5 a1 ff ff       	callq  1ff0 <trim_EPC_pages>
    7dfb:	85 c0                	test   %eax,%eax
    7dfd:	74 a5                	je     7da4 <sbrk+0xa4>
    7dff:	48 89 2d 52 66 00 00 	mov    %rbp,0x6652(%rip)        # e458 <heap_used.2396>
    7e06:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    7e0d:	eb 95                	jmp    7da4 <sbrk+0xa4>
    7e0f:	90                   	nop

0000000000007e10 <sgx_init_string_lib>:
    7e10:	31 c0                	xor    %eax,%eax
    7e12:	c3                   	retq   
    7e13:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    7e1a:	00 00 00 
    7e1d:	0f 1f 00             	nopl   (%rax)

0000000000007e20 <sgx_spin_lock>:
    7e20:	48 83 ec 18          	sub    $0x18,%rsp
    7e24:	ba 01 00 00 00       	mov    $0x1,%edx
    7e29:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    7e30:	00 00 
    7e32:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    7e37:	31 c0                	xor    %eax,%eax
    7e39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    7e40:	f0 87 17             	lock xchg %edx,(%rdi)
    7e43:	89 54 24 04          	mov    %edx,0x4(%rsp)
    7e47:	8b 44 24 04          	mov    0x4(%rsp),%eax
    7e4b:	85 c0                	test   %eax,%eax
    7e4d:	74 11                	je     7e60 <sgx_spin_lock+0x40>
    7e4f:	90                   	nop
    7e50:	8b 07                	mov    (%rdi),%eax
    7e52:	85 c0                	test   %eax,%eax
    7e54:	74 ea                	je     7e40 <sgx_spin_lock+0x20>
    7e56:	f3 90                	pause  
    7e58:	eb f6                	jmp    7e50 <sgx_spin_lock+0x30>
    7e5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    7e60:	31 c0                	xor    %eax,%eax
    7e62:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    7e67:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    7e6e:	00 00 
    7e70:	75 05                	jne    7e77 <sgx_spin_lock+0x57>
    7e72:	48 83 c4 18          	add    $0x18,%rsp
    7e76:	c3                   	retq   
    7e77:	e8 04 c6 ff ff       	callq  4480 <__stack_chk_fail>
    7e7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000007e80 <sgx_spin_unlock>:
    7e80:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
    7e86:	31 c0                	xor    %eax,%eax
    7e88:	c3                   	retq   

0000000000007e89 <setjmp>:
    7e89:	50                   	push   %rax
    7e8a:	53                   	push   %rbx
    7e8b:	51                   	push   %rcx
    7e8c:	52                   	push   %rdx
    7e8d:	56                   	push   %rsi
    7e8e:	57                   	push   %rdi
    7e8f:	41 50                	push   %r8
    7e91:	41 51                	push   %r9
    7e93:	41 52                	push   %r10
    7e95:	41 53                	push   %r11
    7e97:	41 54                	push   %r12
    7e99:	41 55                	push   %r13
    7e9b:	41 56                	push   %r14
    7e9d:	41 57                	push   %r15
    7e9f:	48 c7 c6 08 00 00 00 	mov    $0x8,%rsi
    7ea6:	e8 55 94 ff ff       	callq  1300 <sgx_is_within_enclave>
    7eab:	83 f8 00             	cmp    $0x0,%eax
    7eae:	74 60                	je     7f10 <.crash>
    7eb0:	41 5f                	pop    %r15
    7eb2:	41 5e                	pop    %r14
    7eb4:	41 5d                	pop    %r13
    7eb6:	41 5c                	pop    %r12
    7eb8:	41 5b                	pop    %r11
    7eba:	41 5a                	pop    %r10
    7ebc:	41 59                	pop    %r9
    7ebe:	41 58                	pop    %r8
    7ec0:	5f                   	pop    %rdi
    7ec1:	5e                   	pop    %rsi
    7ec2:	5a                   	pop    %rdx
    7ec3:	59                   	pop    %rcx
    7ec4:	5b                   	pop    %rbx
    7ec5:	58                   	pop    %rax
    7ec6:	4c 8b 1c 24          	mov    (%rsp),%r11
    7eca:	48 89 1f             	mov    %rbx,(%rdi)
    7ecd:	48 89 6f 08          	mov    %rbp,0x8(%rdi)
    7ed1:	4c 89 67 10          	mov    %r12,0x10(%rdi)
    7ed5:	4c 89 6f 18          	mov    %r13,0x18(%rdi)
    7ed9:	4c 89 77 20          	mov    %r14,0x20(%rdi)
    7edd:	4c 89 7f 28          	mov    %r15,0x28(%rdi)
    7ee1:	48 89 67 30          	mov    %rsp,0x30(%rdi)
    7ee5:	4c 89 5f 38          	mov    %r11,0x38(%rdi)
    7ee9:	e8 8d 0b 00 00       	callq  8a7b <get_stack_guard>
    7eee:	48 31 07             	xor    %rax,(%rdi)
    7ef1:	48 31 47 08          	xor    %rax,0x8(%rdi)
    7ef5:	48 31 47 10          	xor    %rax,0x10(%rdi)
    7ef9:	48 31 47 18          	xor    %rax,0x18(%rdi)
    7efd:	48 31 47 20          	xor    %rax,0x20(%rdi)
    7f01:	48 31 47 28          	xor    %rax,0x28(%rdi)
    7f05:	48 31 47 30          	xor    %rax,0x30(%rdi)
    7f09:	48 31 47 38          	xor    %rax,0x38(%rdi)
    7f0d:	31 c0                	xor    %eax,%eax
    7f0f:	c3                   	retq   

0000000000007f10 <.crash>:
    7f10:	0f 0b                	ud2    

0000000000007f12 <longjmp>:
    7f12:	50                   	push   %rax
    7f13:	53                   	push   %rbx
    7f14:	51                   	push   %rcx
    7f15:	52                   	push   %rdx
    7f16:	56                   	push   %rsi
    7f17:	57                   	push   %rdi
    7f18:	41 50                	push   %r8
    7f1a:	41 51                	push   %r9
    7f1c:	41 52                	push   %r10
    7f1e:	41 53                	push   %r11
    7f20:	41 54                	push   %r12
    7f22:	41 55                	push   %r13
    7f24:	41 56                	push   %r14
    7f26:	41 57                	push   %r15
    7f28:	57                   	push   %rdi
    7f29:	48 c7 c6 08 00 00 00 	mov    $0x8,%rsi
    7f30:	e8 cb 93 ff ff       	callq  1300 <sgx_is_within_enclave>
    7f35:	83 f8 00             	cmp    $0x0,%eax
    7f38:	74 d6                	je     7f10 <.crash>
    7f3a:	5f                   	pop    %rdi
    7f3b:	48 8b 57 30          	mov    0x30(%rdi),%rdx
    7f3f:	e8 37 0b 00 00       	callq  8a7b <get_stack_guard>
    7f44:	48 31 c2             	xor    %rax,%rdx
    7f47:	52                   	push   %rdx
    7f48:	5f                   	pop    %rdi
    7f49:	e8 d2 b2 ff ff       	callq  3220 <is_valid_sp>
    7f4e:	83 f8 00             	cmp    $0x0,%eax
    7f51:	74 bd                	je     7f10 <.crash>
    7f53:	41 5f                	pop    %r15
    7f55:	41 5e                	pop    %r14
    7f57:	41 5d                	pop    %r13
    7f59:	41 5c                	pop    %r12
    7f5b:	41 5b                	pop    %r11
    7f5d:	41 5a                	pop    %r10
    7f5f:	41 59                	pop    %r9
    7f61:	41 58                	pop    %r8
    7f63:	5f                   	pop    %rdi
    7f64:	5e                   	pop    %rsi
    7f65:	5a                   	pop    %rdx
    7f66:	59                   	pop    %rcx
    7f67:	5b                   	pop    %rbx
    7f68:	58                   	pop    %rax
    7f69:	89 f0                	mov    %esi,%eax
    7f6b:	48 8b 1f             	mov    (%rdi),%rbx
    7f6e:	48 8b 77 08          	mov    0x8(%rdi),%rsi
    7f72:	4c 8b 67 10          	mov    0x10(%rdi),%r12
    7f76:	4c 8b 6f 18          	mov    0x18(%rdi),%r13
    7f7a:	4c 8b 77 20          	mov    0x20(%rdi),%r14
    7f7e:	4c 8b 7f 28          	mov    0x28(%rdi),%r15
    7f82:	48 8b 57 30          	mov    0x30(%rdi),%rdx
    7f86:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    7f8a:	50                   	push   %rax
    7f8b:	e8 eb 0a 00 00       	callq  8a7b <get_stack_guard>
    7f90:	48 31 c3             	xor    %rax,%rbx
    7f93:	48 31 c6             	xor    %rax,%rsi
    7f96:	49 31 c4             	xor    %rax,%r12
    7f99:	49 31 c5             	xor    %rax,%r13
    7f9c:	49 31 c6             	xor    %rax,%r14
    7f9f:	49 31 c7             	xor    %rax,%r15
    7fa2:	48 31 c2             	xor    %rax,%rdx
    7fa5:	48 31 c1             	xor    %rax,%rcx
    7fa8:	58                   	pop    %rax
    7fa9:	48 89 f5             	mov    %rsi,%rbp
    7fac:	48 89 0a             	mov    %rcx,(%rdx)
    7faf:	48 89 d4             	mov    %rdx,%rsp
    7fb2:	85 c0                	test   %eax,%eax
    7fb4:	75 02                	jne    7fb8 <longjmp+0xa6>
    7fb6:	ff c0                	inc    %eax
    7fb8:	c3                   	retq   
    7fb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000007fc0 <rsrv_mem_init>:
    7fc0:	48 85 ff             	test   %rdi,%rdi
    7fc3:	b8 01 00 00 00       	mov    $0x1,%eax
    7fc8:	74 11                	je     7fdb <rsrv_mem_init+0x1b>
    7fca:	48 89 f1             	mov    %rsi,%rcx
    7fcd:	48 09 d1             	or     %rdx,%rcx
    7fd0:	48 09 f9             	or     %rdi,%rcx
    7fd3:	f7 c1 ff 0f 00 00    	test   $0xfff,%ecx
    7fd9:	74 05                	je     7fe0 <rsrv_mem_init+0x20>
    7fdb:	f3 c3                	repz retq 
    7fdd:	0f 1f 00             	nopl   (%rax)
    7fe0:	48 8b 0d 81 4e 00 00 	mov    0x4e81(%rip),%rcx        # ce68 <rsrv_mem_base>
    7fe7:	48 f7 d1             	not    %rcx
    7fea:	48 39 f1             	cmp    %rsi,%rcx
    7fed:	72 ec                	jb     7fdb <rsrv_mem_init+0x1b>
    7fef:	48 89 3d 72 4e 00 00 	mov    %rdi,0x4e72(%rip)        # ce68 <rsrv_mem_base>
    7ff6:	48 89 35 63 4e 00 00 	mov    %rsi,0x4e63(%rip)        # ce60 <rsrv_mem_size>
    7ffd:	31 c0                	xor    %eax,%eax
    7fff:	48 89 15 52 4e 00 00 	mov    %rdx,0x4e52(%rip)        # ce58 <rsrv_mem_min_size>
    8006:	c3                   	retq   
    8007:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    800e:	00 00 

0000000000008010 <__errno_location>:
    8010:	e9 5b b1 ff ff       	jmpq   3170 <get_errno_addr>
    8015:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    801c:	00 00 00 
    801f:	90                   	nop

0000000000008020 <sgx_init_crypto_lib>:
    8020:	e9 0b 00 00 00       	jmpq   8030 <init_ipp_cpuid>
    8025:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    802c:	00 00 00 
    802f:	90                   	nop

0000000000008030 <init_ipp_cpuid>:
    8030:	48 83 3d a8 4f 00 00 	cmpq   $0x0,0x4fa8(%rip)        # cfe0 <ippcpSetCpuFeatures>
    8037:	00 
    8038:	0f 84 1a 02 00 00    	je     8258 <init_ipp_cpuid+0x228>
    803e:	f7 c7 00 02 00 00    	test   $0x200,%edi
    8044:	0f 84 16 02 00 00    	je     8260 <init_ipp_cpuid+0x230>
    804a:	48 89 f8             	mov    %rdi,%rax
    804d:	48 83 ec 08          	sub    $0x8,%rsp
    8051:	48 b9 00 00 00 00 08 	movabs $0x800000000,%rcx
    8058:	00 00 00 
    805b:	25 00 08 00 00       	and    $0x800,%eax
    8060:	48 83 f8 01          	cmp    $0x1,%rax
    8064:	48 19 c0             	sbb    %rax,%rax
    8067:	48 83 e0 e0          	and    $0xffffffffffffffe0,%rax
    806b:	48 83 c0 7f          	add    $0x7f,%rax
    806f:	48 89 c2             	mov    %rax,%rdx
    8072:	80 ca 80             	or     $0x80,%dl
    8075:	f7 c7 00 04 00 00    	test   $0x400,%edi
    807b:	48 0f 45 c2          	cmovne %rdx,%rax
    807f:	48 89 c2             	mov    %rax,%rdx
    8082:	80 ce 03             	or     $0x3,%dh
    8085:	f7 c7 00 00 01 00    	test   $0x10000,%edi
    808b:	48 0f 45 c2          	cmovne %rdx,%rax
    808f:	48 89 c2             	mov    %rax,%rdx
    8092:	80 ce 04             	or     $0x4,%dh
    8095:	f7 c7 00 40 00 00    	test   $0x4000,%edi
    809b:	48 0f 45 c2          	cmovne %rdx,%rax
    809f:	48 89 c2             	mov    %rax,%rdx
    80a2:	80 ce 08             	or     $0x8,%dh
    80a5:	f7 c7 00 20 00 00    	test   $0x2000,%edi
    80ab:	48 0f 45 c2          	cmovne %rdx,%rax
    80af:	48 89 c2             	mov    %rax,%rdx
    80b2:	80 ce 20             	or     $0x20,%dh
    80b5:	f7 c7 00 00 02 00    	test   $0x20000,%edi
    80bb:	48 0f 45 c2          	cmovne %rdx,%rax
    80bf:	48 89 c2             	mov    %rax,%rdx
    80c2:	80 ce 40             	or     $0x40,%dh
    80c5:	f7 c7 00 80 00 00    	test   $0x8000,%edi
    80cb:	48 0f 45 c2          	cmovne %rdx,%rax
    80cf:	48 89 c2             	mov    %rax,%rdx
    80d2:	80 ce 80             	or     $0x80,%dh
    80d5:	f7 c7 00 00 80 00    	test   $0x800000,%edi
    80db:	48 0f 45 c2          	cmovne %rdx,%rax
    80df:	48 89 c2             	mov    %rax,%rdx
    80e2:	48 81 ca 00 00 01 00 	or     $0x10000,%rdx
    80e9:	f7 c7 00 00 00 10    	test   $0x10000000,%edi
    80ef:	48 0f 45 c2          	cmovne %rdx,%rax
    80f3:	48 89 c2             	mov    %rax,%rdx
    80f6:	48 81 ca 00 00 02 00 	or     $0x20000,%rdx
    80fd:	f7 c7 00 00 00 20    	test   $0x20000000,%edi
    8103:	48 0f 45 c2          	cmovne %rdx,%rax
    8107:	48 89 c2             	mov    %rax,%rdx
    810a:	48 81 ca 00 00 08 00 	or     $0x80000,%rdx
    8111:	48 85 cf             	test   %rcx,%rdi
    8114:	48 0f 45 c2          	cmovne %rdx,%rax
    8118:	f7 c7 00 00 00 08    	test   $0x8000000,%edi
    811e:	74 0d                	je     812d <init_ipp_cpuid+0xfd>
    8120:	48 ba 00 00 10 00 02 	movabs $0x200100000,%rdx
    8127:	00 00 00 
    812a:	48 09 d0             	or     %rdx,%rax
    812d:	48 89 c2             	mov    %rax,%rdx
    8130:	48 b9 00 00 00 00 02 	movabs $0x200000000,%rcx
    8137:	00 00 00 
    813a:	48 be 00 00 00 00 04 	movabs $0x400000000,%rsi
    8141:	00 00 00 
    8144:	48 81 ca 00 00 80 00 	or     $0x800000,%rdx
    814b:	48 85 cf             	test   %rcx,%rdi
    814e:	48 0f 45 c2          	cmovne %rdx,%rax
    8152:	48 ba 00 00 00 00 01 	movabs $0x100000000,%rdx
    8159:	00 00 00 
    815c:	48 89 c1             	mov    %rax,%rcx
    815f:	48 81 c9 00 00 40 00 	or     $0x400000,%rcx
    8166:	48 85 d7             	test   %rdx,%rdi
    8169:	48 0f 45 c1          	cmovne %rcx,%rax
    816d:	48 89 c1             	mov    %rax,%rcx
    8170:	48 81 c9 00 00 20 00 	or     $0x200000,%rcx
    8177:	48 85 f7             	test   %rsi,%rdi
    817a:	48 be 00 00 00 00 20 	movabs $0x2000000000,%rsi
    8181:	00 00 00 
    8184:	48 0f 45 c1          	cmovne %rcx,%rax
    8188:	48 89 c1             	mov    %rax,%rcx
    818b:	48 81 c9 00 00 00 02 	or     $0x2000000,%rcx
    8192:	f7 c7 00 00 00 01    	test   $0x1000000,%edi
    8198:	48 0f 45 c1          	cmovne %rcx,%rax
    819c:	48 89 c1             	mov    %rax,%rcx
    819f:	48 81 c9 00 00 00 01 	or     $0x1000000,%rcx
    81a6:	48 85 f7             	test   %rsi,%rdi
    81a9:	48 be 00 00 00 00 40 	movabs $0x4000000000,%rsi
    81b0:	00 00 00 
    81b3:	48 0f 45 c1          	cmovne %rcx,%rax
    81b7:	48 89 c1             	mov    %rax,%rcx
    81ba:	48 81 c9 00 00 00 04 	or     $0x4000000,%rcx
    81c1:	48 85 f7             	test   %rsi,%rdi
    81c4:	48 be 00 00 00 00 80 	movabs $0x8000000000,%rsi
    81cb:	00 00 00 
    81ce:	48 0f 45 c1          	cmovne %rcx,%rax
    81d2:	48 89 c1             	mov    %rax,%rcx
    81d5:	48 81 c9 00 00 00 08 	or     $0x8000000,%rcx
    81dc:	48 85 f7             	test   %rsi,%rdi
    81df:	48 be 00 00 00 00 00 	movabs $0x20000000000,%rsi
    81e6:	02 00 00 
    81e9:	48 0f 45 c1          	cmovne %rcx,%rax
    81ed:	48 89 c1             	mov    %rax,%rcx
    81f0:	48 81 c9 00 00 00 40 	or     $0x40000000,%rcx
    81f7:	48 85 f7             	test   %rsi,%rdi
    81fa:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
    8201:	01 00 00 
    8204:	48 0f 45 c1          	cmovne %rcx,%rax
    8208:	48 89 c1             	mov    %rax,%rcx
    820b:	48 81 c9 00 00 00 20 	or     $0x20000000,%rcx
    8212:	48 85 f7             	test   %rsi,%rdi
    8215:	48 0f 45 c1          	cmovne %rcx,%rax
    8219:	f7 c7 00 00 00 40    	test   $0x40000000,%edi
    821f:	74 03                	je     8224 <init_ipp_cpuid+0x1f4>
    8221:	48 09 d0             	or     %rdx,%rax
    8224:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
    822b:	00 00 80 
    822e:	48 09 c7             	or     %rax,%rdi
    8231:	e8 e2 8d ff ff       	callq  1018 <ippcpSetCpuFeatures@plt>
    8236:	85 c0                	test   %eax,%eax
    8238:	75 0e                	jne    8248 <init_ipp_cpuid+0x218>
    823a:	31 c0                	xor    %eax,%eax
    823c:	48 83 c4 08          	add    $0x8,%rsp
    8240:	c3                   	retq   
    8241:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    8248:	b8 02 00 00 00       	mov    $0x2,%eax
    824d:	48 83 c4 08          	add    $0x8,%rsp
    8251:	c3                   	retq   
    8252:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    8258:	31 c0                	xor    %eax,%eax
    825a:	c3                   	retq   
    825b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    8260:	b8 02 00 00 00       	mov    $0x2,%eax
    8265:	c3                   	retq   
    8266:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    826d:	00 00 00 

0000000000008270 <sgx_create_report>:
    8270:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    8275:	48 81 e4 00 fe ff ff 	and    $0xfffffffffffffe00,%rsp
    827c:	41 ff 72 f8          	pushq  -0x8(%r10)
    8280:	55                   	push   %rbp
    8281:	48 89 e5             	mov    %rsp,%rbp
    8284:	41 57                	push   %r15
    8286:	41 56                	push   %r14
    8288:	41 55                	push   %r13
    828a:	41 54                	push   %r12
    828c:	4c 8d b5 10 fa ff ff 	lea    -0x5f0(%rbp),%r14
    8293:	41 52                	push   %r10
    8295:	53                   	push   %rbx
    8296:	49 89 fd             	mov    %rdi,%r13
    8299:	49 89 f7             	mov    %rsi,%r15
    829c:	49 89 d4             	mov    %rdx,%r12
    829f:	31 f6                	xor    %esi,%esi
    82a1:	48 81 ec c0 09 00 00 	sub    $0x9c0,%rsp
    82a8:	ba 40 00 00 00       	mov    $0x40,%edx
    82ad:	48 8d 9d 10 f8 ff ff 	lea    -0x7f0(%rbp),%rbx
    82b4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    82bb:	00 00 
    82bd:	48 89 85 08 fe ff ff 	mov    %rax,-0x1f8(%rbp)
    82c4:	31 c0                	xor    %eax,%eax
    82c6:	48 8d 85 90 f7 ff ff 	lea    -0x870(%rbp),%rax
    82cd:	48 89 c7             	mov    %rax,%rdi
    82d0:	48 89 85 88 f7 ff ff 	mov    %rax,-0x878(%rbp)
    82d7:	e8 19 f9 ff ff       	callq  7bf5 <__memset>
    82dc:	31 f6                	xor    %esi,%esi
    82de:	ba 00 02 00 00       	mov    $0x200,%edx
    82e3:	4c 89 f7             	mov    %r14,%rdi
    82e6:	e8 0a f9 ff ff       	callq  7bf5 <__memset>
    82eb:	31 f6                	xor    %esi,%esi
    82ed:	ba b0 01 00 00       	mov    $0x1b0,%edx
    82f2:	48 89 df             	mov    %rbx,%rdi
    82f5:	e8 fb f8 ff ff       	callq  7bf5 <__memset>
    82fa:	4d 85 ed             	test   %r13,%r13
    82fd:	74 23                	je     8322 <sgx_create_report+0xb2>
    82ff:	be 00 02 00 00       	mov    $0x200,%esi
    8304:	4c 89 ef             	mov    %r13,%rdi
    8307:	e8 f4 8f ff ff       	callq  1300 <sgx_is_within_enclave>
    830c:	85 c0                	test   %eax,%eax
    830e:	0f 84 ac 00 00 00    	je     83c0 <sgx_create_report+0x150>
    8314:	b9 40 00 00 00       	mov    $0x40,%ecx
    8319:	4c 89 f7             	mov    %r14,%rdi
    831c:	4c 89 ee             	mov    %r13,%rsi
    831f:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    8322:	4d 85 ff             	test   %r15,%r15
    8325:	74 48                	je     836f <sgx_create_report+0xff>
    8327:	be 40 00 00 00       	mov    $0x40,%esi
    832c:	4c 89 ff             	mov    %r15,%rdi
    832f:	e8 cc 8f ff ff       	callq  1300 <sgx_is_within_enclave>
    8334:	85 c0                	test   %eax,%eax
    8336:	0f 84 84 00 00 00    	je     83c0 <sgx_create_report+0x150>
    833c:	f3 41 0f 6f 07       	movdqu (%r15),%xmm0
    8341:	0f 29 85 90 f7 ff ff 	movaps %xmm0,-0x870(%rbp)
    8348:	f3 41 0f 6f 47 10    	movdqu 0x10(%r15),%xmm0
    834e:	0f 29 85 a0 f7 ff ff 	movaps %xmm0,-0x860(%rbp)
    8355:	f3 41 0f 6f 47 20    	movdqu 0x20(%r15),%xmm0
    835b:	0f 29 85 b0 f7 ff ff 	movaps %xmm0,-0x850(%rbp)
    8362:	f3 41 0f 6f 47 30    	movdqu 0x30(%r15),%xmm0
    8368:	0f 29 85 c0 f7 ff ff 	movaps %xmm0,-0x840(%rbp)
    836f:	4d 85 e4             	test   %r12,%r12
    8372:	74 4c                	je     83c0 <sgx_create_report+0x150>
    8374:	be b0 01 00 00       	mov    $0x1b0,%esi
    8379:	4c 89 e7             	mov    %r12,%rdi
    837c:	e8 7f 8f ff ff       	callq  1300 <sgx_is_within_enclave>
    8381:	85 c0                	test   %eax,%eax
    8383:	74 3b                	je     83c0 <sgx_create_report+0x150>
    8385:	48 8b b5 88 f7 ff ff 	mov    -0x878(%rbp),%rsi
    838c:	48 89 da             	mov    %rbx,%rdx
    838f:	4c 89 f7             	mov    %r14,%rdi
    8392:	e8 a0 09 00 00       	callq  8d37 <do_ereport>
    8397:	89 c2                	mov    %eax,%edx
    8399:	b8 01 00 00 00       	mov    $0x1,%eax
    839e:	85 d2                	test   %edx,%edx
    83a0:	75 23                	jne    83c5 <sgx_create_report+0x155>
    83a2:	31 c0                	xor    %eax,%eax
    83a4:	0f 1f 40 00          	nopl   0x0(%rax)
    83a8:	48 8b 14 c3          	mov    (%rbx,%rax,8),%rdx
    83ac:	49 89 14 c4          	mov    %rdx,(%r12,%rax,8)
    83b0:	48 83 c0 01          	add    $0x1,%rax
    83b4:	48 83 f8 36          	cmp    $0x36,%rax
    83b8:	75 ee                	jne    83a8 <sgx_create_report+0x138>
    83ba:	31 c0                	xor    %eax,%eax
    83bc:	eb 07                	jmp    83c5 <sgx_create_report+0x155>
    83be:	66 90                	xchg   %ax,%ax
    83c0:	b8 02 00 00 00       	mov    $0x2,%eax
    83c5:	48 8b 8d 08 fe ff ff 	mov    -0x1f8(%rbp),%rcx
    83cc:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    83d3:	00 00 
    83d5:	75 18                	jne    83ef <sgx_create_report+0x17f>
    83d7:	48 81 c4 c0 09 00 00 	add    $0x9c0,%rsp
    83de:	5b                   	pop    %rbx
    83df:	41 5a                	pop    %r10
    83e1:	41 5c                	pop    %r12
    83e3:	41 5d                	pop    %r13
    83e5:	41 5e                	pop    %r14
    83e7:	41 5f                	pop    %r15
    83e9:	5d                   	pop    %rbp
    83ea:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    83ee:	c3                   	retq   
    83ef:	e8 8c c0 ff ff       	callq  4480 <__stack_chk_fail>
    83f4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    83fb:	00 00 00 
    83fe:	66 90                	xchg   %ax,%ax

0000000000008400 <sgx_self_report>:
    8400:	48 83 3d a8 60 00 00 	cmpq   $0x0,0x60a8(%rip)        # e4b0 <_ZZ15sgx_self_reportE7_report+0x30>
    8407:	00 
    8408:	74 0e                	je     8418 <sgx_self_report+0x18>
    840a:	48 8d 05 6f 60 00 00 	lea    0x606f(%rip),%rax        # e480 <_ZZ15sgx_self_reportE7_report>
    8411:	c3                   	retq   
    8412:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    8418:	48 8d 15 61 60 00 00 	lea    0x6061(%rip),%rdx        # e480 <_ZZ15sgx_self_reportE7_report>
    841f:	48 83 ec 08          	sub    $0x8,%rsp
    8423:	31 f6                	xor    %esi,%esi
    8425:	31 ff                	xor    %edi,%edi
    8427:	e8 44 fe ff ff       	callq  8270 <sgx_create_report>
    842c:	48 8d 05 4d 60 00 00 	lea    0x604d(%rip),%rax        # e480 <_ZZ15sgx_self_reportE7_report>
    8433:	48 83 c4 08          	add    $0x8,%rsp
    8437:	c3                   	retq   

Disassembly of section .nipx:

0000000000008440 <init_enclave>:
    8440:	41 54                	push   %r12
    8442:	55                   	push   %rbp
    8443:	53                   	push   %rbx
    8444:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
    844b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    8452:	00 00 
    8454:	48 89 84 24 b8 00 00 	mov    %rax,0xb8(%rsp)
    845b:	00 
    845c:	31 c0                	xor    %eax,%eax
    845e:	48 85 ff             	test   %rdi,%rdi
    8461:	0f 84 91 02 00 00    	je     86f8 <init_enclave+0x2b8>
    8467:	48 85 f6             	test   %rsi,%rsi
    846a:	48 89 f3             	mov    %rsi,%rbx
    846d:	0f 84 85 02 00 00    	je     86f8 <init_enclave+0x2b8>
    8473:	48 83 3d 55 4b 00 00 	cmpq   $0x0,0x4b55(%rip)        # cfd0 <_Z9pcl_entryPvS_>
    847a:	00 
    847b:	48 89 fd             	mov    %rdi,%rbp
    847e:	74 20                	je     84a0 <init_enclave+0x60>
    8480:	0f ae e8             	lfence 
    8483:	48 8b b6 94 00 00 00 	mov    0x94(%rsi),%rsi
    848a:	48 85 f6             	test   %rsi,%rsi
    848d:	0f 84 65 02 00 00    	je     86f8 <init_enclave+0x2b8>
    8493:	e8 78 8b ff ff       	callq  1010 <_Z9pcl_entryPvS_@plt>
    8498:	85 c0                	test   %eax,%eax
    849a:	0f 85 58 02 00 00    	jne    86f8 <init_enclave+0x2b8>
    84a0:	48 89 ef             	mov    %rbp,%rdi
    84a3:	e8 48 b6 ff ff       	callq  3af0 <relocate_enclave>
    84a8:	85 c0                	test   %eax,%eax
    84aa:	89 c5                	mov    %eax,%ebp
    84ac:	0f 85 46 02 00 00    	jne    86f8 <init_enclave+0x2b8>
    84b2:	be b0 00 00 00       	mov    $0xb0,%esi
    84b7:	48 89 df             	mov    %rbx,%rdi
    84ba:	e8 91 8e ff ff       	callq  1350 <sgx_is_outside_enclave>
    84bf:	85 c0                	test   %eax,%eax
    84c1:	0f 84 31 02 00 00    	je     86f8 <init_enclave+0x2b8>
    84c7:	0f ae e8             	lfence 
    84ca:	f3 0f 6f 03          	movdqu (%rbx),%xmm0
    84ce:	0f 29 04 24          	movaps %xmm0,(%rsp)
    84d2:	f3 0f 6f 43 10       	movdqu 0x10(%rbx),%xmm0
    84d7:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
    84dc:	f6 44 24 13 40       	testb  $0x40,0x13(%rsp)
    84e1:	f3 0f 6f 43 20       	movdqu 0x20(%rbx),%xmm0
    84e6:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
    84eb:	f3 0f 6f 43 30       	movdqu 0x30(%rbx),%xmm0
    84f0:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
    84f5:	f3 0f 6f 43 40       	movdqu 0x40(%rbx),%xmm0
    84fa:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    84ff:	f3 0f 6f 43 50       	movdqu 0x50(%rbx),%xmm0
    8504:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
    8509:	f3 0f 6f 43 60       	movdqu 0x60(%rbx),%xmm0
    850e:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
    8513:	f3 0f 6f 43 70       	movdqu 0x70(%rbx),%xmm0
    8518:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    851d:	f3 0f 6f 83 80 00 00 	movdqu 0x80(%rbx),%xmm0
    8524:	00 
    8525:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
    852c:	00 
    852d:	f3 0f 6f 83 90 00 00 	movdqu 0x90(%rbx),%xmm0
    8534:	00 
    8535:	0f 29 84 24 90 00 00 	movaps %xmm0,0x90(%rsp)
    853c:	00 
    853d:	f3 0f 6f 83 a0 00 00 	movdqu 0xa0(%rbx),%xmm0
    8544:	00 
    8545:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
    854c:	00 
    854d:	0f 85 3d 01 00 00    	jne    8690 <init_enclave+0x250>
    8553:	ba 14 00 00 00       	mov    $0x14,%edx
    8558:	b9 9c 00 00 00       	mov    $0x9c,%ecx
    855d:	48 8d 34 0c          	lea    (%rsp,%rcx,1),%rsi
    8561:	31 c0                	xor    %eax,%eax
    8563:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    8568:	c6 04 06 00          	movb   $0x0,(%rsi,%rax,1)
    856c:	48 83 c0 01          	add    $0x1,%rax
    8570:	48 39 d0             	cmp    %rdx,%rax
    8573:	72 f3                	jb     8568 <init_enclave+0x128>
    8575:	8b 84 24 ac 00 00 00 	mov    0xac(%rsp),%eax
    857c:	89 05 9e 48 00 00    	mov    %eax,0x489e(%rip)        # ce20 <g_cpu_core_num>
    8582:	8b 44 24 08          	mov    0x8(%rsp),%eax
    8586:	83 f8 00             	cmp    $0x0,%eax
    8589:	89 05 95 48 00 00    	mov    %eax,0x4895(%rip)        # ce24 <g_sdk_version>
    858f:	0f 85 2b 01 00 00    	jne    86c0 <init_enclave+0x280>
    8595:	c7 05 89 48 00 00 00 	movl   $0x0,0x4889(%rip)        # ce28 <EDMM_supported>
    859c:	00 00 00 
    859f:	e8 fc a9 ff ff       	callq  2fa0 <get_heap_min_size>
    85a4:	49 89 c4             	mov    %rax,%r12
    85a7:	e8 94 a9 ff ff       	callq  2f40 <get_heap_size>
    85ac:	48 89 c3             	mov    %rax,%rbx
    85af:	e8 6c a9 ff ff       	callq  2f20 <get_heap_base>
    85b4:	89 e9                	mov    %ebp,%ecx
    85b6:	4c 89 e2             	mov    %r12,%rdx
    85b9:	48 89 de             	mov    %rbx,%rsi
    85bc:	48 89 c7             	mov    %rax,%rdi
    85bf:	e8 dc f6 ff ff       	callq  7ca0 <heap_init>
    85c4:	85 c0                	test   %eax,%eax
    85c6:	0f 85 2c 01 00 00    	jne    86f8 <init_enclave+0x2b8>
    85cc:	e8 8f b2 ff ff       	callq  3860 <get_xfeature_state>
    85d1:	48 8b 3c 24          	mov    (%rsp),%rdi
    85d5:	48 81 e7 ff e7 ff e1 	and    $0xffffffffe1ffe7ff,%rdi
    85dc:	f6 44 24 13 40       	testb  $0x40,0x13(%rsp)
    85e1:	74 08                	je     85eb <init_enclave+0x1ab>
    85e3:	48 8b bc 24 a4 00 00 	mov    0xa4(%rsp),%rdi
    85ea:	00 
    85eb:	83 3d 32 48 00 00 01 	cmpl   $0x1,0x4832(%rip)        # ce24 <g_sdk_version>
    85f2:	7f 0f                	jg     8603 <init_enclave+0x1c3>
    85f4:	48 83 bc 24 9c 00 00 	cmpq   $0x0,0x9c(%rsp)
    85fb:	00 00 
    85fd:	0f 84 dd 00 00 00    	je     86e0 <init_enclave+0x2a0>
    8603:	48 8d 74 24 14       	lea    0x14(%rsp),%rsi
    8608:	48 89 c2             	mov    %rax,%rdx
    860b:	e8 80 8b ff ff       	callq  1190 <init_optimized_libs>
    8610:	85 c0                	test   %eax,%eax
    8612:	0f 85 e0 00 00 00    	jne    86f8 <init_enclave+0x2b8>
    8618:	e8 83 aa ff ff       	callq  30a0 <get_rsrv_size>
    861d:	48 85 c0             	test   %rax,%rax
    8620:	74 2b                	je     864d <init_enclave+0x20d>
    8622:	e8 d9 aa ff ff       	callq  3100 <get_rsrv_min_size>
    8627:	48 89 c5             	mov    %rax,%rbp
    862a:	e8 71 aa ff ff       	callq  30a0 <get_rsrv_size>
    862f:	48 89 c3             	mov    %rax,%rbx
    8632:	e8 d9 a9 ff ff       	callq  3010 <get_rsrv_base>
    8637:	48 89 ea             	mov    %rbp,%rdx
    863a:	48 89 de             	mov    %rbx,%rsi
    863d:	48 89 c7             	mov    %rax,%rdi
    8640:	e8 7b f9 ff ff       	callq  7fc0 <rsrv_mem_init>
    8645:	85 c0                	test   %eax,%eax
    8647:	0f 85 ab 00 00 00    	jne    86f8 <init_enclave+0x2b8>
    864d:	48 8d 3d c4 47 00 00 	lea    0x47c4(%rip),%rdi        # ce18 <__intel_security_cookie>
    8654:	be 08 00 00 00       	mov    $0x8,%esi
    8659:	e8 82 8e ff ff       	callq  14e0 <sgx_read_rand>
    865e:	85 c0                	test   %eax,%eax
    8660:	0f 95 c0             	setne  %al
    8663:	0f b6 c0             	movzbl %al,%eax
    8666:	f7 d8                	neg    %eax
    8668:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
    866f:	00 
    8670:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    8677:	00 00 
    8679:	0f 85 83 00 00 00    	jne    8702 <init_enclave+0x2c2>
    867f:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
    8686:	5b                   	pop    %rbx
    8687:	5d                   	pop    %rbp
    8688:	41 5c                	pop    %r12
    868a:	c3                   	retq   
    868b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    8690:	ba b0 00 00 00       	mov    $0xb0,%edx
    8695:	48 81 bc 24 9c 00 00 	cmpq   $0xb0,0x9c(%rsp)
    869c:	00 b0 00 00 00 
    86a1:	48 89 d1             	mov    %rdx,%rcx
    86a4:	48 0f 46 8c 24 9c 00 	cmovbe 0x9c(%rsp),%rcx
    86ab:	00 00 
    86ad:	48 29 ca             	sub    %rcx,%rdx
    86b0:	0f 85 a7 fe ff ff    	jne    855d <init_enclave+0x11d>
    86b6:	e9 ba fe ff ff       	jmpq   8575 <init_enclave+0x135>
    86bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    86c0:	7e 36                	jle    86f8 <init_enclave+0x2b8>
    86c2:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    86c7:	31 f6                	xor    %esi,%esi
    86c9:	e8 c2 aa ff ff       	callq  3190 <feature_supported>
    86ce:	89 c5                	mov    %eax,%ebp
    86d0:	89 05 52 47 00 00    	mov    %eax,0x4752(%rip)        # ce28 <EDMM_supported>
    86d6:	e9 c4 fe ff ff       	jmpq   859f <init_enclave+0x15f>
    86db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    86e0:	31 f6                	xor    %esi,%esi
    86e2:	48 89 c2             	mov    %rax,%rdx
    86e5:	e8 a6 8a ff ff       	callq  1190 <init_optimized_libs>
    86ea:	85 c0                	test   %eax,%eax
    86ec:	0f 84 26 ff ff ff    	je     8618 <init_enclave+0x1d8>
    86f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    86f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    86fd:	e9 66 ff ff ff       	jmpq   8668 <init_enclave+0x228>
    8702:	e8 79 bd ff ff       	callq  4480 <__stack_chk_fail>
    8707:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    870e:	00 00 

0000000000008710 <do_init_enclave>:
    8710:	41 54                	push   %r12
    8712:	55                   	push   %rbp
    8713:	49 89 f4             	mov    %rsi,%r12
    8716:	53                   	push   %rbx
    8717:	48 89 fd             	mov    %rdi,%rbp
    871a:	e8 17 03 00 00       	callq  8a36 <get_enclave_base>
    871f:	48 89 c3             	mov    %rax,%rbx
    8722:	e8 2e 03 00 00       	callq  8a55 <lock_enclave>
    8727:	85 c0                	test   %eax,%eax
    8729:	74 0d                	je     8738 <do_init_enclave+0x28>
    872b:	b8 01 00 00 00       	mov    $0x1,%eax
    8730:	5b                   	pop    %rbx
    8731:	5d                   	pop    %rbp
    8732:	41 5c                	pop    %r12
    8734:	c3                   	retq   
    8735:	0f 1f 00             	nopl   (%rax)
    8738:	48 89 ee             	mov    %rbp,%rsi
    873b:	48 89 df             	mov    %rbx,%rdi
    873e:	e8 fd fc ff ff       	callq  8440 <init_enclave>
    8743:	85 c0                	test   %eax,%eax
    8745:	75 e4                	jne    872b <do_init_enclave+0x1b>
    8747:	be 01 00 00 00       	mov    $0x1,%esi
    874c:	4c 89 e7             	mov    %r12,%rdi
    874f:	e8 0c 9f ff ff       	callq  2660 <do_init_thread>
    8754:	85 c0                	test   %eax,%eax
    8756:	75 d3                	jne    872b <do_init_enclave+0x1b>
    8758:	8b 05 ca 46 00 00    	mov    0x46ca(%rip),%eax        # ce28 <EDMM_supported>
    875e:	48 8d 2d 5b 09 00 00 	lea    0x95b(%rip),%rbp        # 90c0 <g_global_data>
    8765:	85 c0                	test   %eax,%eax
    8767:	74 57                	je     87c0 <do_init_enclave+0xb0>
    8769:	8b b5 30 01 00 00    	mov    0x130(%rbp),%esi
    876f:	48 8d bd 38 01 00 00 	lea    0x138(%rbp),%rdi
    8776:	31 d2                	xor    %edx,%edx
    8778:	48 c1 e6 05          	shl    $0x5,%rsi
    877c:	48 01 fe             	add    %rdi,%rsi
    877f:	e8 dc 95 ff ff       	callq  1d60 <_Z18accept_post_removePVK9_layout_tS1_m>
    8784:	85 c0                	test   %eax,%eax
    8786:	75 a3                	jne    872b <do_init_enclave+0x1b>
    8788:	e8 13 a8 ff ff       	callq  2fa0 <get_heap_min_size>
    878d:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
    8791:	31 d2                	xor    %edx,%edx
    8793:	48 89 c1             	mov    %rax,%rcx
    8796:	48 89 c6             	mov    %rax,%rsi
    8799:	48 01 df             	add    %rbx,%rdi
    879c:	e8 af f4 ff ff       	callq  7c50 <memset_s>
    87a1:	48 8d 05 b0 46 00 00 	lea    0x46b0(%rip),%rax        # ce58 <rsrv_mem_min_size>
    87a8:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
    87ac:	31 d2                	xor    %edx,%edx
    87ae:	48 8b 30             	mov    (%rax),%rsi
    87b1:	48 01 df             	add    %rbx,%rdi
    87b4:	48 89 f1             	mov    %rsi,%rcx
    87b7:	e8 94 f4 ff ff       	callq  7c50 <memset_s>
    87bc:	eb 2e                	jmp    87ec <do_init_enclave+0xdc>
    87be:	66 90                	xchg   %ax,%ax
    87c0:	48 8b 4d 18          	mov    0x18(%rbp),%rcx
    87c4:	48 8b 75 18          	mov    0x18(%rbp),%rsi
    87c8:	31 d2                	xor    %edx,%edx
    87ca:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
    87ce:	48 01 df             	add    %rbx,%rdi
    87d1:	e8 7a f4 ff ff       	callq  7c50 <memset_s>
    87d6:	48 8b 4d 28          	mov    0x28(%rbp),%rcx
    87da:	48 8b 75 28          	mov    0x28(%rbp),%rsi
    87de:	31 d2                	xor    %edx,%edx
    87e0:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
    87e4:	48 01 df             	add    %rbx,%rdi
    87e7:	e8 64 f4 ff ff       	callq  7c50 <memset_s>
    87ec:	c7 05 aa 48 00 00 02 	movl   $0x2,0x48aa(%rip)        # d0a0 <g_enclave_state>
    87f3:	00 00 00 
    87f6:	31 c0                	xor    %eax,%eax
    87f8:	e9 33 ff ff ff       	jmpq   8730 <do_init_enclave+0x20>
    87fd:	0f 1f 00             	nopl   (%rax)

0000000000008800 <sgx_is_enclave_crashed>:
    8800:	48 83 ec 08          	sub    $0x8,%rsp
    8804:	e8 35 02 00 00       	callq  8a3e <get_enclave_state>
    8809:	83 f8 03             	cmp    $0x3,%eax
    880c:	0f 94 c0             	sete   %al
    880f:	48 83 c4 08          	add    $0x8,%rsp
    8813:	0f b6 c0             	movzbl %al,%eax
    8816:	c3                   	retq   
    8817:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    881e:	00 00 

0000000000008820 <enter_enclave>:
    8820:	41 55                	push   %r13
    8822:	41 54                	push   %r12
    8824:	49 89 f5             	mov    %rsi,%r13
    8827:	55                   	push   %rbp
    8828:	53                   	push   %rbx
    8829:	49 89 d4             	mov    %rdx,%r12
    882c:	89 fb                	mov    %edi,%ebx
    882e:	89 cd                	mov    %ecx,%ebp
    8830:	48 83 ec 18          	sub    $0x18,%rsp
    8834:	e8 c7 ff ff ff       	callq  8800 <sgx_is_enclave_crashed>
    8839:	85 c0                	test   %eax,%eax
    883b:	75 73                	jne    88b0 <enter_enclave+0x90>
    883d:	83 fb ff             	cmp    $0xffffffff,%ebx
    8840:	75 26                	jne    8868 <enter_enclave+0x48>
    8842:	85 ed                	test   %ebp,%ebp
    8844:	0f 84 f6 00 00 00    	je     8940 <enter_enclave+0x120>
    884a:	bf 03 00 00 00       	mov    $0x3,%edi
    884f:	e8 f7 01 00 00       	callq  8a4b <set_enclave_state>
    8854:	b8 01 00 00 00       	mov    $0x1,%eax
    8859:	48 83 c4 18          	add    $0x18,%rsp
    885d:	5b                   	pop    %rbx
    885e:	5d                   	pop    %rbp
    885f:	41 5c                	pop    %r12
    8861:	41 5d                	pop    %r13
    8863:	c3                   	retq   
    8864:	0f 1f 40 00          	nopl   0x0(%rax)
    8868:	e8 d1 01 00 00       	callq  8a3e <get_enclave_state>
    886d:	83 f8 02             	cmp    $0x2,%eax
    8870:	75 d8                	jne    884a <enter_enclave+0x2a>
    8872:	85 ed                	test   %ebp,%ebp
    8874:	0f 85 ff 00 00 00    	jne    8979 <enter_enclave+0x159>
    887a:	85 db                	test   %ebx,%ebx
    887c:	79 42                	jns    88c0 <enter_enclave+0xa0>
    887e:	83 fb fa             	cmp    $0xfffffffa,%ebx
    8881:	74 3d                	je     88c0 <enter_enclave+0xa0>
    8883:	83 fb fe             	cmp    $0xfffffffe,%ebx
    8886:	0f 84 c4 00 00 00    	je     8950 <enter_enclave+0x130>
    888c:	83 fb fc             	cmp    $0xfffffffc,%ebx
    888f:	0f 84 cb 00 00 00    	je     8960 <enter_enclave+0x140>
    8895:	83 fb fb             	cmp    $0xfffffffb,%ebx
    8898:	75 b0                	jne    884a <enter_enclave+0x2a>
    889a:	4c 89 e7             	mov    %r12,%rdi
    889d:	e8 1e a2 ff ff       	callq  2ac0 <do_uninit_enclave>
    88a2:	89 c3                	mov    %eax,%ebx
    88a4:	eb 41                	jmp    88e7 <enter_enclave+0xc7>
    88a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    88ad:	00 00 00 
    88b0:	48 83 c4 18          	add    $0x18,%rsp
    88b4:	b8 06 10 00 00       	mov    $0x1006,%eax
    88b9:	5b                   	pop    %rbx
    88ba:	5d                   	pop    %rbp
    88bb:	41 5c                	pop    %r12
    88bd:	41 5d                	pop    %r13
    88bf:	c3                   	retq   
    88c0:	e8 ac 01 00 00       	callq  8a71 <get_thread_data>
    88c5:	48 85 c0             	test   %rax,%rax
    88c8:	0f 84 a2 00 00 00    	je     8970 <enter_enclave+0x150>
    88ce:	48 8b 48 08          	mov    0x8(%rax),%rcx
    88d2:	48 39 48 10          	cmp    %rcx,0x10(%rax)
    88d6:	74 28                	je     8900 <enter_enclave+0xe0>
    88d8:	89 df                	mov    %ebx,%edi
    88da:	4c 89 e2             	mov    %r12,%rdx
    88dd:	4c 89 ee             	mov    %r13,%rsi
    88e0:	e8 4b 9f ff ff       	callq  2830 <do_ecall>
    88e5:	89 c3                	mov    %eax,%ebx
    88e7:	83 fb 01             	cmp    $0x1,%ebx
    88ea:	89 d8                	mov    %ebx,%eax
    88ec:	0f 84 58 ff ff ff    	je     884a <enter_enclave+0x2a>
    88f2:	48 83 c4 18          	add    $0x18,%rsp
    88f6:	5b                   	pop    %rbx
    88f7:	5d                   	pop    %rbp
    88f8:	41 5c                	pop    %r12
    88fa:	41 5d                	pop    %r13
    88fc:	c3                   	retq   
    88fd:	0f 1f 00             	nopl   (%rax)
    8900:	48 8d 05 b9 07 00 00 	lea    0x7b9(%rip),%rax        # 90c0 <g_global_data>
    8907:	48 8b 50 38          	mov    0x38(%rax),%rdx
    890b:	48 85 d2             	test   %rdx,%rdx
    890e:	74 c8                	je     88d8 <enter_enclave+0xb8>
    8910:	48 8b 68 48          	mov    0x48(%rax),%rbp
    8914:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    8919:	be 08 00 00 00       	mov    $0x8,%esi
    891e:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    8925:	00 00 
    8927:	e8 b4 8b ff ff       	callq  14e0 <sgx_read_rand>
    892c:	4c 01 e5             	add    %r12,%rbp
    892f:	85 c0                	test   %eax,%eax
    8931:	75 7e                	jne    89b1 <enter_enclave+0x191>
    8933:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    8938:	48 89 45 28          	mov    %rax,0x28(%rbp)
    893c:	eb 9a                	jmp    88d8 <enter_enclave+0xb8>
    893e:	66 90                	xchg   %ax,%ax
    8940:	4c 89 e6             	mov    %r12,%rsi
    8943:	4c 89 ef             	mov    %r13,%rdi
    8946:	e8 c5 fd ff ff       	callq  8710 <do_init_enclave>
    894b:	89 c3                	mov    %eax,%ebx
    894d:	eb 98                	jmp    88e7 <enter_enclave+0xc7>
    894f:	90                   	nop
    8950:	4c 89 ef             	mov    %r13,%rdi
    8953:	e8 68 a4 ff ff       	callq  2dc0 <do_oret>
    8958:	89 c3                	mov    %eax,%ebx
    895a:	eb 8b                	jmp    88e7 <enter_enclave+0xc7>
    895c:	0f 1f 40 00          	nopl   0x0(%rax)
    8960:	4c 89 ef             	mov    %r13,%rdi
    8963:	e8 68 a0 ff ff       	callq  29d0 <do_ecall_add_thread>
    8968:	89 c3                	mov    %eax,%ebx
    896a:	e9 78 ff ff ff       	jmpq   88e7 <enter_enclave+0xc7>
    896f:	90                   	nop
    8970:	48 8d 05 49 07 00 00 	lea    0x749(%rip),%rax        # 90c0 <g_global_data>
    8977:	eb 97                	jmp    8910 <enter_enclave+0xf0>
    8979:	83 ed 01             	sub    $0x1,%ebp
    897c:	0f 85 c8 fe ff ff    	jne    884a <enter_enclave+0x2a>
    8982:	83 fb fd             	cmp    $0xfffffffd,%ebx
    8985:	0f 85 bf fe ff ff    	jne    884a <enter_enclave+0x2a>
    898b:	4c 89 e7             	mov    %r12,%rdi
    898e:	e8 4d ac ff ff       	callq  35e0 <trts_handle_exception>
    8993:	4c 89 e7             	mov    %r12,%rdi
    8996:	89 c3                	mov    %eax,%ebx
    8998:	e8 a3 8c ff ff       	callq  1640 <check_static_stack_canary>
    899d:	89 c2                	mov    %eax,%edx
    899f:	b8 09 10 00 00       	mov    $0x1009,%eax
    89a4:	85 d2                	test   %edx,%edx
    89a6:	0f 85 ad fe ff ff    	jne    8859 <enter_enclave+0x39>
    89ac:	e9 36 ff ff ff       	jmpq   88e7 <enter_enclave+0xc7>
    89b1:	e8 ea 03 00 00       	callq  8da0 <abort>

00000000000089b6 <restore_xregs>:
    89b6:	48 89 f9             	mov    %rdi,%rcx
    89b9:	48 8d 05 e4 46 00 00 	lea    0x46e4(%rip),%rax        # d0a4 <g_xsave_enabled>
    89c0:	8b 00                	mov    (%rax),%eax
    89c2:	83 f8 00             	cmp    $0x0,%eax
    89c5:	74 16                	je     89dd <restore_xregs+0x27>
    89c7:	48 31 c0             	xor    %rax,%rax
    89ca:	48 31 d2             	xor    %rdx,%rdx
    89cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    89d2:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    89d7:	48 0f ae 29          	xrstor64 (%rcx)
    89db:	eb 04                	jmp    89e1 <restore_xregs+0x2b>
    89dd:	48 0f ae 09          	fxrstor64 (%rcx)
    89e1:	c3                   	retq   

00000000000089e2 <save_xregs>:
    89e2:	48 89 f9             	mov    %rdi,%rcx
    89e5:	48 8d 05 b8 46 00 00 	lea    0x46b8(%rip),%rax        # d0a4 <g_xsave_enabled>
    89ec:	9b                   	fwait
    89ed:	8b 00                	mov    (%rax),%eax
    89ef:	83 f8 00             	cmp    $0x0,%eax
    89f2:	74 16                	je     8a0a <save_xregs+0x28>
    89f4:	48 31 c0             	xor    %rax,%rax
    89f7:	48 31 d2             	xor    %rdx,%rdx
    89fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    89ff:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    8a04:	48 0f c7 21          	xsavec64 (%rcx)
    8a08:	eb 04                	jmp    8a0e <save_xregs+0x2c>
    8a0a:	48 0f ae 01          	fxsave64 (%rcx)
    8a0e:	c3                   	retq   

0000000000008a0f <__x86_return_thunk>:
    8a0f:	c3                   	retq   

0000000000008a10 <__x86_indirect_thunk_rax>:
    8a10:	ff e0                	jmpq   *%rax

0000000000008a12 <__x86_indirect_thunk_rbx>:
    8a12:	ff e3                	jmpq   *%rbx

0000000000008a14 <__x86_indirect_thunk_rcx>:
    8a14:	ff e1                	jmpq   *%rcx

0000000000008a16 <__x86_indirect_thunk_rdx>:
    8a16:	ff e2                	jmpq   *%rdx

0000000000008a18 <__x86_indirect_thunk_rbp>:
    8a18:	ff e5                	jmpq   *%rbp

0000000000008a1a <__x86_indirect_thunk_rsi>:
    8a1a:	ff e6                	jmpq   *%rsi

0000000000008a1c <__x86_indirect_thunk_rdi>:
    8a1c:	ff e7                	jmpq   *%rdi

0000000000008a1e <__x86_indirect_thunk_r8>:
    8a1e:	41 ff e0             	jmpq   *%r8

0000000000008a21 <__x86_indirect_thunk_r9>:
    8a21:	41 ff e1             	jmpq   *%r9

0000000000008a24 <__x86_indirect_thunk_r10>:
    8a24:	41 ff e2             	jmpq   *%r10

0000000000008a27 <__x86_indirect_thunk_r11>:
    8a27:	41 ff e3             	jmpq   *%r11

0000000000008a2a <__x86_indirect_thunk_r12>:
    8a2a:	41 ff e4             	jmpq   *%r12

0000000000008a2d <__x86_indirect_thunk_r13>:
    8a2d:	41 ff e5             	jmpq   *%r13

0000000000008a30 <__x86_indirect_thunk_r14>:
    8a30:	41 ff e6             	jmpq   *%r14

0000000000008a33 <__x86_indirect_thunk_r15>:
    8a33:	41 ff e7             	jmpq   *%r15

0000000000008a36 <get_enclave_base>:
    8a36:	48 8d 05 c3 75 ff ff 	lea    -0x8a3d(%rip),%rax        # 0 <__ImageBase>
    8a3d:	c3                   	retq   

0000000000008a3e <get_enclave_state>:
    8a3e:	48 8d 0d 5b 46 00 00 	lea    0x465b(%rip),%rcx        # d0a0 <g_enclave_state>
    8a45:	48 31 c0             	xor    %rax,%rax
    8a48:	8b 01                	mov    (%rcx),%eax
    8a4a:	c3                   	retq   

0000000000008a4b <set_enclave_state>:
    8a4b:	48 8d 05 4e 46 00 00 	lea    0x464e(%rip),%rax        # d0a0 <g_enclave_state>
    8a52:	89 38                	mov    %edi,(%rax)
    8a54:	c3                   	retq   

0000000000008a55 <lock_enclave>:
    8a55:	48 8d 15 44 46 00 00 	lea    0x4644(%rip),%rdx        # d0a0 <g_enclave_state>
    8a5c:	48 31 c0             	xor    %rax,%rax
    8a5f:	b8 00 00 00 00       	mov    $0x0,%eax
    8a64:	48 31 c9             	xor    %rcx,%rcx
    8a67:	b9 01 00 00 00       	mov    $0x1,%ecx
    8a6c:	f0 0f b1 0a          	lock cmpxchg %ecx,(%rdx)
    8a70:	c3                   	retq   

0000000000008a71 <get_thread_data>:
    8a71:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    8a78:	00 00 
    8a7a:	c3                   	retq   

0000000000008a7b <get_stack_guard>:
    8a7b:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    8a82:	00 00 
    8a84:	c3                   	retq   

0000000000008a85 <enclave_entry>:
    8a85:	48 31 d2             	xor    %rdx,%rdx
    8a88:	48 01 d2             	add    %rdx,%rdx
    8a8b:	fc                   	cld    
    8a8c:	4d 31 c0             	xor    %r8,%r8
    8a8f:	4d 31 c9             	xor    %r9,%r9
    8a92:	4d 31 d2             	xor    %r10,%r10
    8a95:	4d 31 db             	xor    %r11,%r11
    8a98:	4d 31 e4             	xor    %r12,%r12
    8a9b:	4d 31 ed             	xor    %r13,%r13
    8a9e:	4d 31 f6             	xor    %r14,%r14
    8aa1:	4d 31 ff             	xor    %r15,%r15
    8aa4:	48 83 f8 00          	cmp    $0x0,%rax
    8aa8:	0f 85 cb 00 00 00    	jne    8b79 <enclave_entry+0xf4>
    8aae:	65 48 8b 04 25 08 00 	mov    %gs:0x8,%rax
    8ab5:	00 00 
    8ab7:	48 83 f8 00          	cmp    $0x0,%rax
    8abb:	75 0f                	jne    8acc <enclave_entry+0x47>
    8abd:	48 89 d8             	mov    %rbx,%rax
    8ac0:	48 2d 00 00 01 00    	sub    $0x10000,%rax
    8ac6:	48 2d b0 02 00 00    	sub    $0x2b0,%rax
    8acc:	48 94                	xchg   %rax,%rsp
    8ace:	51                   	push   %rcx
    8acf:	55                   	push   %rbp
    8ad0:	48 89 e5             	mov    %rsp,%rbp
    8ad3:	9c                   	pushfq 
    8ad4:	48 f7 14 24          	notq   (%rsp)
    8ad8:	48 81 0c 24 00 00 04 	orq    $0x40000,(%rsp)
    8adf:	00 
    8ae0:	48 f7 14 24          	notq   (%rsp)
    8ae4:	9d                   	popfq  
    8ae5:	48 83 ec 30          	sub    $0x30,%rsp
    8ae9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    8aed:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    8af1:	48 89 5d e0          	mov    %rbx,-0x20(%rbp)
    8af5:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
    8af9:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    8afd:	48 83 ec 20          	sub    $0x20,%rsp
    8b01:	48 8d 3d 38 0c 00 00 	lea    0xc38(%rip),%rdi        # 9740 <SYNTHETIC_STATE>
    8b08:	e8 a9 fe ff ff       	callq  89b6 <restore_xregs>
    8b0d:	48 83 c4 20          	add    $0x20,%rsp
    8b11:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    8b15:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    8b19:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    8b1d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    8b21:	e8 fa fc ff ff       	callq  8820 <enter_enclave>
    8b26:	48 89 c3             	mov    %rax,%rbx
    8b29:	48 8d 3d 10 0c 00 00 	lea    0xc10(%rip),%rdi        # 9740 <SYNTHETIC_STATE>
    8b30:	e8 81 fe ff ff       	callq  89b6 <restore_xregs>
    8b35:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    8b3c:	48 89 de             	mov    %rbx,%rsi
    8b3f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    8b43:	48 89 ec             	mov    %rbp,%rsp
    8b46:	5d                   	pop    %rbp
    8b47:	5b                   	pop    %rbx
    8b48:	48 89 d4             	mov    %rdx,%rsp
    8b4b:	48 31 c9             	xor    %rcx,%rcx
    8b4e:	48 31 d2             	xor    %rdx,%rdx
    8b51:	4d 31 c0             	xor    %r8,%r8
    8b54:	4d 31 c9             	xor    %r9,%r9
    8b57:	4d 31 d2             	xor    %r10,%r10
    8b5a:	4d 31 db             	xor    %r11,%r11
    8b5d:	4d 31 e4             	xor    %r12,%r12
    8b60:	4d 31 ed             	xor    %r13,%r13
    8b63:	4d 31 f6             	xor    %r14,%r14
    8b66:	4d 31 ff             	xor    %r15,%r15
    8b69:	48 01 d2             	add    %rdx,%rdx
    8b6c:	fc                   	cld    
    8b6d:	48 c7 c0 04 00 00 00 	mov    $0x4,%rax
    8b74:	0f 01 d7             	enclu  
    8b77:	0f 0b                	ud2    
    8b79:	48 89 c2             	mov    %rax,%rdx
    8b7c:	48 89 d8             	mov    %rbx,%rax
    8b7f:	48 2d 00 00 01 00    	sub    $0x10000,%rax
    8b85:	e9 42 ff ff ff       	jmpq   8acc <enclave_entry+0x47>
    8b8a:	0f 0b                	ud2    

0000000000008b8c <do_ocall>:
    8b8c:	55                   	push   %rbp
    8b8d:	48 89 e5             	mov    %rsp,%rbp
    8b90:	48 89 7d 10          	mov    %rdi,0x10(%rbp)
    8b94:	48 89 75 18          	mov    %rsi,0x18(%rbp)
    8b98:	65 48 8b 04 25 38 00 	mov    %gs:0x38,%rax
    8b9f:	00 00 
    8ba1:	48 29 c4             	sub    %rax,%rsp
    8ba4:	48 c7 c0 3f 00 00 00 	mov    $0x3f,%rax
    8bab:	48 f7 d0             	not    %rax
    8bae:	48 21 c4             	and    %rax,%rsp
    8bb1:	48 89 e1             	mov    %rsp,%rcx
    8bb4:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    8bbb:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
    8bc2:	00 
    8bc3:	48 89 5c 24 70       	mov    %rbx,0x70(%rsp)
    8bc8:	48 89 74 24 68       	mov    %rsi,0x68(%rsp)
    8bcd:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
    8bd2:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
    8bd7:	4c 89 64 24 50       	mov    %r12,0x50(%rsp)
    8bdc:	4c 89 6c 24 48       	mov    %r13,0x48(%rsp)
    8be1:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
    8be6:	4c 89 7c 24 38       	mov    %r15,0x38(%rsp)
    8beb:	48 8b bc 24 98 00 00 	mov    0x98(%rsp),%rdi
    8bf2:	00 
    8bf3:	65 48 8b 04 25 38 00 	mov    %gs:0x38,%rax
    8bfa:	00 00 
    8bfc:	48 89 c1             	mov    %rax,%rcx
    8bff:	48 c1 e9 02          	shr    $0x2,%rcx
    8c03:	48 31 c0             	xor    %rax,%rax
    8c06:	fc                   	cld    
    8c07:	f3 ab                	rep stos %eax,%es:(%rdi)
    8c09:	48 8b bc 24 98 00 00 	mov    0x98(%rsp),%rdi
    8c10:	00 
    8c11:	48 89 3c 24          	mov    %rdi,(%rsp)
    8c15:	e8 c8 fd ff ff       	callq  89e2 <save_xregs>
    8c1a:	48 8d 3d 1f 0b 00 00 	lea    0xb1f(%rip),%rdi        # 9740 <SYNTHETIC_STATE>
    8c21:	48 89 3c 24          	mov    %rdi,(%rsp)
    8c25:	e8 8c fd ff ff       	callq  89b6 <restore_xregs>
    8c2a:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    8c2f:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    8c34:	48 c7 c0 44 49 43 4f 	mov    $0x4f434944,%rax
    8c3b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    8c40:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
    8c45:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    8c4c:	00 00 
    8c4e:	48 89 c3             	mov    %rax,%rbx
    8c51:	48 89 e7             	mov    %rsp,%rdi
    8c54:	e8 17 a1 ff ff       	callq  2d70 <update_ocall_lastsp>
    8c59:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    8c5e:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    8c63:	48 8b 53 20          	mov    0x20(%rbx),%rdx
    8c67:	48 8b aa 98 00 00 00 	mov    0x98(%rdx),%rbp
    8c6e:	48 8b a2 90 00 00 00 	mov    0x90(%rdx),%rsp
    8c75:	48 8b 58 f8          	mov    -0x8(%rax),%rbx
    8c79:	48 c7 c0 04 00 00 00 	mov    $0x4,%rax
    8c80:	48 31 c9             	xor    %rcx,%rcx
    8c83:	48 31 d2             	xor    %rdx,%rdx
    8c86:	4d 31 c0             	xor    %r8,%r8
    8c89:	4d 31 c9             	xor    %r9,%r9
    8c8c:	4d 31 d2             	xor    %r10,%r10
    8c8f:	4d 31 db             	xor    %r11,%r11
    8c92:	4d 31 e4             	xor    %r12,%r12
    8c95:	4d 31 ed             	xor    %r13,%r13
    8c98:	4d 31 f6             	xor    %r14,%r14
    8c9b:	4d 31 ff             	xor    %r15,%r15
    8c9e:	48 01 d2             	add    %rdx,%rdx
    8ca1:	fc                   	cld    
    8ca2:	0f 01 d7             	enclu  

0000000000008ca5 <__morestack>:
    8ca5:	55                   	push   %rbp
    8ca6:	48 89 e5             	mov    %rsp,%rbp
    8ca9:	48 83 ec 20          	sub    $0x20,%rsp
    8cad:	e8 da fe ff ff       	callq  8b8c <do_ocall>
    8cb2:	c9                   	leaveq 
    8cb3:	c3                   	retq   

0000000000008cb4 <asm_oret>:
    8cb4:	48 89 e3             	mov    %rsp,%rbx
    8cb7:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    8cbc:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    8cc1:	48 8b 63 08          	mov    0x8(%rbx),%rsp
    8cc5:	48 8b bc 24 98 00 00 	mov    0x98(%rsp),%rdi
    8ccc:	00 
    8ccd:	e8 e4 fc ff ff       	callq  89b6 <restore_xregs>
    8cd2:	48 31 c0             	xor    %rax,%rax
    8cd5:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    8cda:	48 29 f9             	sub    %rdi,%rcx
    8cdd:	48 83 e9 08          	sub    $0x8,%rcx
    8ce1:	48 c1 e9 02          	shr    $0x2,%rcx
    8ce5:	fc                   	cld    
    8ce6:	f3 ab                	rep stos %eax,%es:(%rdi)
    8ce8:	48 8b 43 10          	mov    0x10(%rbx),%rax
    8cec:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
    8cf1:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
    8cf6:	4c 8b 6c 24 48       	mov    0x48(%rsp),%r13
    8cfb:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
    8d00:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
    8d05:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    8d0a:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    8d0f:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
    8d14:	48 89 ec             	mov    %rbp,%rsp
    8d17:	5d                   	pop    %rbp
    8d18:	c3                   	retq   
    8d19:	0f 0b                	ud2    

0000000000008d1b <do_egetkey>:
    8d1b:	53                   	push   %rbx
    8d1c:	51                   	push   %rcx
    8d1d:	52                   	push   %rdx
    8d1e:	48 89 fb             	mov    %rdi,%rbx
    8d21:	48 89 f1             	mov    %rsi,%rcx
    8d24:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
    8d2b:	0f 01 d7             	enclu  
    8d2e:	74 03                	je     8d33 <do_egetkey+0x18>
    8d30:	48 31 c0             	xor    %rax,%rax
    8d33:	5a                   	pop    %rdx
    8d34:	59                   	pop    %rcx
    8d35:	5b                   	pop    %rbx
    8d36:	c3                   	retq   

0000000000008d37 <do_ereport>:
    8d37:	53                   	push   %rbx
    8d38:	51                   	push   %rcx
    8d39:	52                   	push   %rdx
    8d3a:	48 89 fb             	mov    %rdi,%rbx
    8d3d:	48 89 f1             	mov    %rsi,%rcx
    8d40:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
    8d47:	f8                   	clc    

0000000000008d48 <Lereport_inst>:
    8d48:	0f 01 d7             	enclu  
    8d4b:	0f 92 c0             	setb   %al
    8d4e:	5a                   	pop    %rdx
    8d4f:	59                   	pop    %rcx
    8d50:	5b                   	pop    %rbx
    8d51:	c3                   	retq   

0000000000008d52 <do_eaccept>:
    8d52:	53                   	push   %rbx
    8d53:	51                   	push   %rcx
    8d54:	52                   	push   %rdx
    8d55:	48 89 fb             	mov    %rdi,%rbx
    8d58:	48 89 f1             	mov    %rsi,%rcx
    8d5b:	b8 05 00 00 00       	mov    $0x5,%eax
    8d60:	0f 01 d7             	enclu  
    8d63:	83 f8 00             	cmp    $0x0,%eax
    8d66:	75 38                	jne    8da0 <abort>
    8d68:	5a                   	pop    %rdx
    8d69:	59                   	pop    %rcx
    8d6a:	5b                   	pop    %rbx
    8d6b:	c3                   	retq   

0000000000008d6c <do_emodpe>:
    8d6c:	53                   	push   %rbx
    8d6d:	51                   	push   %rcx
    8d6e:	52                   	push   %rdx
    8d6f:	48 89 fb             	mov    %rdi,%rbx
    8d72:	48 89 f1             	mov    %rsi,%rcx
    8d75:	b8 06 00 00 00       	mov    $0x6,%eax
    8d7a:	0f 01 d7             	enclu  
    8d7d:	5a                   	pop    %rdx
    8d7e:	59                   	pop    %rcx
    8d7f:	5b                   	pop    %rbx
    8d80:	c3                   	retq   

0000000000008d81 <do_rdrand>:
    8d81:	b9 0a 00 00 00       	mov    $0xa,%ecx
    8d86:	0f c7 f0             	rdrand %eax
    8d89:	72 08                	jb     8d93 <do_rdrand+0x12>
    8d8b:	ff c9                	dec    %ecx
    8d8d:	75 f7                	jne    8d86 <do_rdrand+0x5>
    8d8f:	48 31 c0             	xor    %rax,%rax
    8d92:	c3                   	retq   
    8d93:	48 89 f9             	mov    %rdi,%rcx
    8d96:	89 01                	mov    %eax,(%rcx)
    8d98:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
    8d9f:	c3                   	retq   

0000000000008da0 <abort>:
    8da0:	48 8d 05 f9 42 00 00 	lea    0x42f9(%rip),%rax        # d0a0 <g_enclave_state>
    8da7:	c7 00 03 00 00 00    	movl   $0x3,(%rax)
    8dad:	0f 0b                	ud2    

0000000000008daf <continue_execution>:
    8daf:	48 89 f9             	mov    %rdi,%rcx
    8db2:	48 8b 01             	mov    (%rcx),%rax
    8db5:	50                   	push   %rax
    8db6:	48 8b 41 08          	mov    0x8(%rcx),%rax
    8dba:	50                   	push   %rax
    8dbb:	48 8b 41 20          	mov    0x20(%rcx),%rax
    8dbf:	48 2d 88 00 00 00    	sub    $0x88,%rax
    8dc5:	48 8b 51 10          	mov    0x10(%rcx),%rdx
    8dc9:	48 8b 59 18          	mov    0x18(%rcx),%rbx
    8dcd:	48 8b 69 28          	mov    0x28(%rcx),%rbp
    8dd1:	48 8b 71 30          	mov    0x30(%rcx),%rsi
    8dd5:	48 8b 79 38          	mov    0x38(%rcx),%rdi
    8dd9:	4c 8b 41 40          	mov    0x40(%rcx),%r8
    8ddd:	4c 8b 49 48          	mov    0x48(%rcx),%r9
    8de1:	4c 8b 51 50          	mov    0x50(%rcx),%r10
    8de5:	4c 8b 59 58          	mov    0x58(%rcx),%r11
    8de9:	4c 8b 61 60          	mov    0x60(%rcx),%r12
    8ded:	4c 8b 69 68          	mov    0x68(%rcx),%r13
    8df1:	4c 8b 71 70          	mov    0x70(%rcx),%r14
    8df5:	4c 8b 79 78          	mov    0x78(%rcx),%r15
    8df9:	ff b1 80 00 00 00    	pushq  0x80(%rcx)
    8dff:	9d                   	popfq  
    8e00:	48 8b 89 88 00 00 00 	mov    0x88(%rcx),%rcx
    8e07:	48 89 08             	mov    %rcx,(%rax)
    8e0a:	59                   	pop    %rcx
    8e0b:	5c                   	pop    %rsp
    8e0c:	48 94                	xchg   %rax,%rsp
    8e0e:	c2 80 00             	retq   $0x80
