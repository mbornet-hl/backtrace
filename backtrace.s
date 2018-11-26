   1              		.file	"backtrace.c"
   2              		.section	.rodata
   3              	.LC0:
   4 0000 4D617820 		.string	"Max addresses number = %d\n"
   4      61646472 
   4      65737365 
   4      73206E75 
   4      6D626572 
   5              	.LC1:
   6 001b 73697A65 		.string	"size = %d\n"
   6      203D2025 
   6      640A00
   7 0026 0000     		.align 8
   8              	.LC2:
   9 0028 25642063 		.string	"%d currently active functions :\n"
   9      75727265 
   9      6E746C79 
   9      20616374 
   9      69766520 
  10              	.LC3:
  11 0049 3D3D3D3E 		.string	"===> %s\n"
  11      2025730A 
  11      00
  12              		.text
  13              		.globl	fct_print_trace
  15              	fct_print_trace:
  16              	.LFB0:
  17              		.cfi_startproc
  18 0000 55       		pushq	%rbp
  19              		.cfi_def_cfa_offset 16
  20              		.cfi_offset 6, -16
  21 0001 4889E5   		movq	%rsp, %rbp
  22              		.cfi_def_cfa_register 6
  23 0004 4881EC20 		subq	$2592, %rsp
  23      0A0000
  24 000b 48C745F0 		movq	$320, -16(%rbp)
  24      40010000 
  25 0013 488B45F0 		movq	-16(%rbp), %rax
  26 0017 4889C6   		movq	%rax, %rsi
  27 001a BF000000 		movl	$.LC0, %edi
  27      00
  28 001f B8000000 		movl	$0, %eax
  28      00
  29 0024 E8000000 		call	printf
  29      00
  30 0029 488B45F0 		movq	-16(%rbp), %rax
  31 002d 89C2     		movl	%eax, %edx
  32 002f 488D85E0 		leaq	-2592(%rbp), %rax
  32      F5FFFF
  33 0036 89D6     		movl	%edx, %esi
  34 0038 4889C7   		movq	%rax, %rdi
  35 003b E8000000 		call	backtrace
  35      00
  36 0040 4898     		cltq
  37 0042 488945E8 		movq	%rax, -24(%rbp)
  38 0046 488B45E8 		movq	-24(%rbp), %rax
  39 004a 4889C6   		movq	%rax, %rsi
  40 004d BF000000 		movl	$.LC1, %edi
  40      00
  41 0052 B8000000 		movl	$0, %eax
  41      00
  42 0057 E8000000 		call	printf
  42      00
  43 005c 488B45E8 		movq	-24(%rbp), %rax
  44 0060 89C2     		movl	%eax, %edx
  45 0062 488D85E0 		leaq	-2592(%rbp), %rax
  45      F5FFFF
  46 0069 89D6     		movl	%edx, %esi
  47 006b 4889C7   		movq	%rax, %rdi
  48 006e E8000000 		call	backtrace_symbols
  48      00
  49 0073 488945E0 		movq	%rax, -32(%rbp)
  50 0077 488B45E8 		movq	-24(%rbp), %rax
  51 007b 4889C6   		movq	%rax, %rsi
  52 007e BF000000 		movl	$.LC2, %edi
  52      00
  53 0083 B8000000 		movl	$0, %eax
  53      00
  54 0088 E8000000 		call	printf
  54      00
  55 008d C745FC00 		movl	$0, -4(%rbp)
  55      000000
  56 0094 EB2D     		jmp	.L2
  57              	.L3:
  58 0096 8B45FC   		movl	-4(%rbp), %eax
  59 0099 4898     		cltq
  60 009b 488D14C5 		leaq	0(,%rax,8), %rdx
  60      00000000 
  61 00a3 488B45E0 		movq	-32(%rbp), %rax
  62 00a7 4801D0   		addq	%rdx, %rax
  63 00aa 488B00   		movq	(%rax), %rax
  64 00ad 4889C6   		movq	%rax, %rsi
  65 00b0 BF000000 		movl	$.LC3, %edi
  65      00
  66 00b5 B8000000 		movl	$0, %eax
  66      00
  67 00ba E8000000 		call	printf
  67      00
  68 00bf 8345FC01 		addl	$1, -4(%rbp)
  69              	.L2:
  70 00c3 8B45FC   		movl	-4(%rbp), %eax
  71 00c6 4898     		cltq
  72 00c8 483B45E8 		cmpq	-24(%rbp), %rax
  73 00cc 72C8     		jb	.L3
  74 00ce 488B45E0 		movq	-32(%rbp), %rax
  75 00d2 4889C7   		movq	%rax, %rdi
  76 00d5 E8000000 		call	free
  76      00
  77 00da C9       		leave
  78              		.cfi_def_cfa 7, 8
  79 00db C3       		ret
  80              		.cfi_endproc
  81              	.LFE0:
  83              		.section	.rodata
  84              	.LC4:
  85 0052 282900   		.string	"()"
  86              	.LC5:
  87 0055 25732573 		.string	"%s%s"
  87      00
  88              	.LC6:
  89 005a 252D3235 		.string	"%-25s (%3d) : level = %d\n"
  89      73202825 
  89      33642920 
  89      3A206C65 
  89      76656C20 
  90              		.text
  91              		.globl	fct_alpha
  93              	fct_alpha:
  94              	.LFB1:
  95              		.cfi_startproc
  96 00dc 55       		pushq	%rbp
  97              		.cfi_def_cfa_offset 16
  98              		.cfi_offset 6, -16
  99 00dd 4889E5   		movq	%rsp, %rbp
 100              		.cfi_def_cfa_register 6
 101 00e0 4883EC50 		subq	$80, %rsp
 102 00e4 897DBC   		movl	%edi, -68(%rbp)
 103 00e7 488D45C0 		leaq	-64(%rbp), %rax
 104 00eb B9000000 		movl	$.LC4, %ecx
 104      00
 105 00f0 BA000000 		movl	$__func__.2693, %edx
 105      00
 106 00f5 BE000000 		movl	$.LC5, %esi
 106      00
 107 00fa 4889C7   		movq	%rax, %rdi
 108 00fd B8000000 		movl	$0, %eax
 108      00
 109 0102 E8000000 		call	sprintf
 109      00
 110 0107 8B55BC   		movl	-68(%rbp), %edx
 111 010a 488D45C0 		leaq	-64(%rbp), %rax
 112 010e 89D1     		movl	%edx, %ecx
 113 0110 BA460000 		movl	$70, %edx
 113      00
 114 0115 4889C6   		movq	%rax, %rsi
 115 0118 BF000000 		movl	$.LC6, %edi
 115      00
 116 011d B8000000 		movl	$0, %eax
 116      00
 117 0122 E8000000 		call	printf
 117      00
 118 0127 8B45BC   		movl	-68(%rbp), %eax
 119 012a 89C7     		movl	%eax, %edi
 120 012c E8000000 		call	fct_beta
 120      00
 121 0131 C9       		leave
 122              		.cfi_def_cfa 7, 8
 123 0132 C3       		ret
 124              		.cfi_endproc
 125              	.LFE1:
 127              		.globl	fct_beta
 129              	fct_beta:
 130              	.LFB2:
 131              		.cfi_startproc
 132 0133 55       		pushq	%rbp
 133              		.cfi_def_cfa_offset 16
 134              		.cfi_offset 6, -16
 135 0134 4889E5   		movq	%rsp, %rbp
 136              		.cfi_def_cfa_register 6
 137 0137 4883EC50 		subq	$80, %rsp
 138 013b 897DBC   		movl	%edi, -68(%rbp)
 139 013e 488D45C0 		leaq	-64(%rbp), %rax
 140 0142 B9000000 		movl	$.LC4, %ecx
 140      00
 141 0147 BA000000 		movl	$__func__.2698, %edx
 141      00
 142 014c BE000000 		movl	$.LC5, %esi
 142      00
 143 0151 4889C7   		movq	%rax, %rdi
 144 0154 B8000000 		movl	$0, %eax
 144      00
 145 0159 E8000000 		call	sprintf
 145      00
 146 015e 8B55BC   		movl	-68(%rbp), %edx
 147 0161 488D45C0 		leaq	-64(%rbp), %rax
 148 0165 89D1     		movl	%edx, %ecx
 149 0167 BA510000 		movl	$81, %edx
 149      00
 150 016c 4889C6   		movq	%rax, %rsi
 151 016f BF000000 		movl	$.LC6, %edi
 151      00
 152 0174 B8000000 		movl	$0, %eax
 152      00
 153 0179 E8000000 		call	printf
 153      00
 154 017e 8B45BC   		movl	-68(%rbp), %eax
 155 0181 89C7     		movl	%eax, %edi
 156 0183 E8000000 		call	fct_gamma
 156      00
 157 0188 C9       		leave
 158              		.cfi_def_cfa 7, 8
 159 0189 C3       		ret
 160              		.cfi_endproc
 161              	.LFE2:
 163              		.globl	fct_gamma
 165              	fct_gamma:
 166              	.LFB3:
 167              		.cfi_startproc
 168 018a 55       		pushq	%rbp
 169              		.cfi_def_cfa_offset 16
 170              		.cfi_offset 6, -16
 171 018b 4889E5   		movq	%rsp, %rbp
 172              		.cfi_def_cfa_register 6
 173 018e 4883EC50 		subq	$80, %rsp
 174 0192 897DBC   		movl	%edi, -68(%rbp)
 175 0195 488D45C0 		leaq	-64(%rbp), %rax
 176 0199 B9000000 		movl	$.LC4, %ecx
 176      00
 177 019e BA000000 		movl	$__func__.2703, %edx
 177      00
 178 01a3 BE000000 		movl	$.LC5, %esi
 178      00
 179 01a8 4889C7   		movq	%rax, %rdi
 180 01ab B8000000 		movl	$0, %eax
 180      00
 181 01b0 E8000000 		call	sprintf
 181      00
 182 01b5 8B55BC   		movl	-68(%rbp), %edx
 183 01b8 488D45C0 		leaq	-64(%rbp), %rax
 184 01bc 89D1     		movl	%edx, %ecx
 185 01be BA5C0000 		movl	$92, %edx
 185      00
 186 01c3 4889C6   		movq	%rax, %rsi
 187 01c6 BF000000 		movl	$.LC6, %edi
 187      00
 188 01cb B8000000 		movl	$0, %eax
 188      00
 189 01d0 E8000000 		call	printf
 189      00
 190 01d5 837DBC04 		cmpl	$4, -68(%rbp)
 191 01d9 7F0F     		jg	.L7
 192 01db 8B45BC   		movl	-68(%rbp), %eax
 193 01de 83C001   		addl	$1, %eax
 194 01e1 89C7     		movl	%eax, %edi
 195 01e3 E8000000 		call	fct_beta
 195      00
 196 01e8 EB0A     		jmp	.L6
 197              	.L7:
 198 01ea 8B45BC   		movl	-68(%rbp), %eax
 199 01ed 89C7     		movl	%eax, %edi
 200 01ef E8000000 		call	fct_terminal_function
 200      00
 201              	.L6:
 202 01f4 C9       		leave
 203              		.cfi_def_cfa 7, 8
 204 01f5 C3       		ret
 205              		.cfi_endproc
 206              	.LFE3:
 208              		.globl	fct_terminal_function
 210              	fct_terminal_function:
 211              	.LFB4:
 212              		.cfi_startproc
 213 01f6 55       		pushq	%rbp
 214              		.cfi_def_cfa_offset 16
 215              		.cfi_offset 6, -16
 216 01f7 4889E5   		movq	%rsp, %rbp
 217              		.cfi_def_cfa_register 6
 218 01fa 4883EC50 		subq	$80, %rsp
 219 01fe 897DBC   		movl	%edi, -68(%rbp)
 220 0201 488D45C0 		leaq	-64(%rbp), %rax
 221 0205 B9000000 		movl	$.LC4, %ecx
 221      00
 222 020a BA000000 		movl	$__func__.2708, %edx
 222      00
 223 020f BE000000 		movl	$.LC5, %esi
 223      00
 224 0214 4889C7   		movq	%rax, %rdi
 225 0217 B8000000 		movl	$0, %eax
 225      00
 226 021c E8000000 		call	sprintf
 226      00
 227 0221 8B55BC   		movl	-68(%rbp), %edx
 228 0224 488D45C0 		leaq	-64(%rbp), %rax
 229 0228 89D1     		movl	%edx, %ecx
 230 022a BA6C0000 		movl	$108, %edx
 230      00
 231 022f 4889C6   		movq	%rax, %rsi
 232 0232 BF000000 		movl	$.LC6, %edi
 232      00
 233 0237 B8000000 		movl	$0, %eax
 233      00
 234 023c E8000000 		call	printf
 234      00
 235 0241 E8000000 		call	fct_print_trace
 235      00
 236 0246 C9       		leave
 237              		.cfi_def_cfa 7, 8
 238 0247 C3       		ret
 239              		.cfi_endproc
 240              	.LFE4:
 242              		.section	.rodata
 243              	.LC7:
 244 0074 6663745F 		.string	"fct_alpha()"
 244      616C7068 
 244      61282900 
 245              	.LC8:
 246 0080 41646472 		.string	"Address of %-25s : %p\n"
 246      65737320 
 246      6F662025 
 246      2D323573 
 246      203A2025 
 247              	.LC9:
 248 0097 6663745F 		.string	"fct_beta()"
 248      62657461 
 248      282900
 249              	.LC10:
 250 00a2 6663745F 		.string	"fct_gamma()"
 250      67616D6D 
 250      61282900 
 251              	.LC11:
 252 00ae 6663745F 		.string	"fct_terminal_function()"
 252      7465726D 
 252      696E616C 
 252      5F66756E 
 252      6374696F 
 253              	.LC12:
 254 00c6 6663745F 		.string	"fct_print_trace()"
 254      7072696E 
 254      745F7472 
 254      61636528 
 254      2900
 255              		.text
 256              		.globl	main
 258              	main:
 259              	.LFB5:
 260              		.cfi_startproc
 261 0248 55       		pushq	%rbp
 262              		.cfi_def_cfa_offset 16
 263              		.cfi_offset 6, -16
 264 0249 4889E5   		movq	%rsp, %rbp
 265              		.cfi_def_cfa_register 6
 266 024c BA000000 		movl	$fct_alpha, %edx
 266      00
 267 0251 BE000000 		movl	$.LC7, %esi
 267      00
 268 0256 BF000000 		movl	$.LC8, %edi
 268      00
 269 025b B8000000 		movl	$0, %eax
 269      00
 270 0260 E8000000 		call	printf
 270      00
 271 0265 BA000000 		movl	$fct_beta, %edx
 271      00
 272 026a BE000000 		movl	$.LC9, %esi
 272      00
 273 026f BF000000 		movl	$.LC8, %edi
 273      00
 274 0274 B8000000 		movl	$0, %eax
 274      00
 275 0279 E8000000 		call	printf
 275      00
 276 027e BA000000 		movl	$fct_gamma, %edx
 276      00
 277 0283 BE000000 		movl	$.LC10, %esi
 277      00
 278 0288 BF000000 		movl	$.LC8, %edi
 278      00
 279 028d B8000000 		movl	$0, %eax
 279      00
 280 0292 E8000000 		call	printf
 280      00
 281 0297 BA000000 		movl	$fct_terminal_function, %edx
 281      00
 282 029c BE000000 		movl	$.LC11, %esi
 282      00
 283 02a1 BF000000 		movl	$.LC8, %edi
 283      00
 284 02a6 B8000000 		movl	$0, %eax
 284      00
 285 02ab E8000000 		call	printf
 285      00
 286 02b0 BA000000 		movl	$fct_print_trace, %edx
 286      00
 287 02b5 BE000000 		movl	$.LC12, %esi
 287      00
 288 02ba BF000000 		movl	$.LC8, %edi
 288      00
 289 02bf B8000000 		movl	$0, %eax
 289      00
 290 02c4 E8000000 		call	printf
 290      00
 291 02c9 BF000000 		movl	$0, %edi
 291      00
 292 02ce E8000000 		call	fct_alpha
 292      00
 293 02d3 B8000000 		movl	$0, %eax
 293      00
 294 02d8 5D       		popq	%rbp
 295              		.cfi_def_cfa 7, 8
 296 02d9 C3       		ret
 297              		.cfi_endproc
 298              	.LFE5:
 300              		.section	.rodata
 301 00d8 00000000 		.align 16
 301      00000000 
 304              	__func__.2708:
 305 00e0 6663745F 		.string	"fct_terminal_function"
 305      7465726D 
 305      696E616C 
 305      5F66756E 
 305      6374696F 
 308              	__func__.2703:
 309 00f6 6663745F 		.string	"fct_gamma"
 309      67616D6D 
 309      6100
 312              	__func__.2698:
 313 0100 6663745F 		.string	"fct_beta"
 313      62657461 
 313      00
 316              	__func__.2693:
 317 0109 6663745F 		.string	"fct_alpha"
 317      616C7068 
 317      6100
 318              		.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
 319              		.section	.note.GNU-stack,"",@progbits
