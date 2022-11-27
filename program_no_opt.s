	.file	"program.c"
	.intel_syntax noprefix
	.text
	.globl	calcExponents
	.type	calcExponents, @function
calcExponents:                                       # x is in xmm0
	endbr64
	push	rbp
	mov	rbp, rsp
	movss	DWORD PTR -36[rbp], xmm0             # x
	movss	xmm0, DWORD PTR .LC0[rip]
	movss	DWORD PTR -24[rbp], xmm0             # retval.first
	movss	DWORD PTR -20[rbp], xmm0             # retval.second
	movss	xmm0, DWORD PTR .LC1[rip]
	movss	DWORD PTR -4[rbp], xmm0              # ex
	movss	DWORD PTR -8[rbp], xmm0              # exneg
	movss	DWORD PTR -12[rbp], xmm0             # tmp
	mov	DWORD PTR -16[rbp], 1                # i
	jmp	.L2
.L5:
	movss	xmm0, DWORD PTR -4[rbp]
	movss	DWORD PTR -24[rbp], xmm0
	movss	xmm0, DWORD PTR -8[rbp]
	movss	DWORD PTR -20[rbp], xmm0
	movss	xmm0, DWORD PTR -12[rbp]
	mulss	xmm0, DWORD PTR -36[rbp]
	movss	DWORD PTR -12[rbp], xmm0
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, DWORD PTR -16[rbp]
	movss	xmm0, DWORD PTR -12[rbp]
	divss	xmm0, xmm1
	movss	DWORD PTR -12[rbp], xmm0
	movss	xmm0, DWORD PTR -4[rbp]
	addss	xmm0, DWORD PTR -12[rbp]
	movss	DWORD PTR -4[rbp], xmm0
	mov	eax, DWORD PTR -16[rbp]
	and	eax, 1
	test	eax, eax
	jne	.L3
	movss	xmm0, DWORD PTR -8[rbp]
	addss	xmm0, DWORD PTR -12[rbp]
	movss	DWORD PTR -8[rbp], xmm0
	jmp	.L4
.L3:
	movss	xmm0, DWORD PTR -8[rbp]
	subss	xmm0, DWORD PTR -12[rbp]
	movss	DWORD PTR -8[rbp], xmm0
.L4:
	add	DWORD PTR -16[rbp], 1
.L2:
	movss	xmm0, DWORD PTR -24[rbp]
	ucomiss	xmm0, DWORD PTR -4[rbp]
	jp	.L5
	jne	.L5
	movss	xmm0, DWORD PTR -20[rbp]
	ucomiss	xmm0, DWORD PTR -8[rbp]
	jp	.L5
	jne	.L5
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	pop	rbp
	ret                                          # returns retval in xmm0
	.size	calcExponents, .-calcExponents
	.section	.rodata
.LC2:
	.string	"%f"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, -4[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -4[rbp]               # x
	movd	xmm0, eax
	call	calcExponents
	movq	rax, xmm0
	mov	QWORD PTR -12[rbp], rax              # exponents
	movss	xmm1, DWORD PTR -12[rbp]
	movss	xmm0, DWORD PTR -8[rbp]
	addss	xmm0, xmm1
	movss	xmm1, DWORD PTR -12[rbp]
	movss	xmm2, DWORD PTR -8[rbp]
	subss	xmm1, xmm2
	divss	xmm0, xmm1
	pxor	xmm3, xmm3
	cvtss2sd	xmm3, xmm0
	movq	rax, xmm3
	movq	xmm0, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	-1082130432
	.align 4
.LC1:
	.long	1065353216
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
