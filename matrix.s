	.text
	.file	"MX"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$136, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$4, %edi
	movl	$3, %esi
	callq	initMatrix@PLT
	movq	%rax, %rbx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$6, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$7, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$8, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$9, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$7, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$8, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movq	%rbx, 24(%rsp)
	movl	$2, %edi
	movl	$3, %esi
	callq	initMatrix@PLT
	movq	%rax, %rbx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movq	%rbx, 8(%rsp)
	movl	$2, %edi
	movl	$3, %esi
	callq	initMatrix@PLT
	movq	%rax, %rbx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movq	%rbx, 16(%rsp)
	movl	$2, %edi
	movl	$2, %esi
	callq	initMatrix@PLT
	movq	%rax, %rbx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movq	%rbx, 48(%rsp)
	movl	$3, %edi
	movl	$4, %esi
	callq	initMatrix@PLT
	movq	%rax, %rbx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$7, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movq	%rbx, 96(%rsp)
	movq	24(%rsp), %rdi
	callq	transpose@PLT
	movq	%rax, 24(%rsp)
	movq	16(%rsp), %rdi
	movq	8(%rsp), %rsi
	callq	mxAdd@PLT
	movq	%rax, 104(%rsp)
	movq	16(%rsp), %rdi
	movq	8(%rsp), %rsi
	callq	mxSub@PLT
	movq	%rax, 88(%rsp)
	movq	48(%rsp), %rdi
	movq	8(%rsp), %rsi
	callq	mxMult@PLT
	movq	%rax, 80(%rsp)
	movl	$3, %edi
	callq	identity@PLT
	movq	%rax, 72(%rsp)
	movl	$4, %esi
	movq	%rax, %rdi
	callq	mxScale@PLT
	movq	%rax, 64(%rsp)
	movq	48(%rsp), %rdi
	movl	$2, %esi
	callq	transformation@PLT
	movq	%rax, 56(%rsp)
	movq	16(%rsp), %rdi
	callq	numCols@PLT
	movl	%eax, 44(%rsp)
	movq	8(%rsp), %rdi
	callq	numCols@PLT
	movl	%eax, 40(%rsp)
	movq	8(%rsp), %rdi
	callq	numRows@PLT
	movl	%eax, 36(%rsp)
	movq	24(%rsp), %rdi
	callq	display@PLT
	leaq	.Lfmt.1(%rip), %rbx
	leaq	.Ltmp(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	8(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.3(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	96(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.4(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	leaq	.Ltmp.5(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	88(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.6(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	80(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.7(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	72(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.8(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	64(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.9(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	56(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.10(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	44(%rsp), %esi
	leaq	.Lfmt(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	leaq	.Ltmp.11(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	40(%rsp), %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	leaq	.Ltmp.12(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	36(%rsp), %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	leaq	.Ltmp.13(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	leaq	.Ltmp.14(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$136, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%s\n"
	.size	.Lfmt.1, 4

	.type	.Lfmt.2,@object         # @fmt.2
.Lfmt.2:
	.asciz	"%g\n"
	.size	.Lfmt.2, 4

	.type	.Ltmp,@object           # @tmp
.Ltmp:
	.asciz	"=============================================="
	.size	.Ltmp, 47

	.type	.Ltmp.3,@object         # @tmp.3
.Ltmp.3:
	.asciz	"=============================================="
	.size	.Ltmp.3, 47

	.type	.Ltmp.4,@object         # @tmp.4
.Ltmp.4:
	.asciz	"=============================================="
	.size	.Ltmp.4, 47

	.type	.Ltmp.5,@object         # @tmp.5
.Ltmp.5:
	.asciz	"=============================================="
	.size	.Ltmp.5, 47

	.type	.Ltmp.6,@object         # @tmp.6
.Ltmp.6:
	.asciz	"=============================================="
	.size	.Ltmp.6, 47

	.type	.Ltmp.7,@object         # @tmp.7
.Ltmp.7:
	.asciz	"=============================================="
	.size	.Ltmp.7, 47

	.type	.Ltmp.8,@object         # @tmp.8
.Ltmp.8:
	.asciz	"=============================================="
	.size	.Ltmp.8, 47

	.type	.Ltmp.9,@object         # @tmp.9
.Ltmp.9:
	.asciz	"=============================================="
	.size	.Ltmp.9, 47

	.type	.Ltmp.10,@object        # @tmp.10
.Ltmp.10:
	.asciz	"=============================================="
	.size	.Ltmp.10, 47

	.type	.Ltmp.11,@object        # @tmp.11
.Ltmp.11:
	.asciz	"=============================================="
	.size	.Ltmp.11, 47

	.type	.Ltmp.12,@object        # @tmp.12
.Ltmp.12:
	.asciz	"=============================================="
	.size	.Ltmp.12, 47

	.type	.Ltmp.13,@object        # @tmp.13
.Ltmp.13:
	.asciz	"=============================================="
	.size	.Ltmp.13, 47

	.type	.Ltmp.14,@object        # @tmp.14
.Ltmp.14:
	.asciz	"Done!"
	.size	.Ltmp.14, 6


	.section	".note.GNU-stack","",@progbits
