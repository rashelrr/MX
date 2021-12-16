	.text
	.file	"MX"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -16
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
	movq	%rbx, (%rsp)
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
	movq	%rbx, 24(%rsp)
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
	movq	%rbx, 56(%rsp)
	movq	8(%rsp), %rdi
	callq	transpose@PLT
	movq	%rax, 8(%rsp)
	movq	16(%rsp), %rdi
	movq	(%rsp), %rsi
	callq	mxAdd@PLT
	movq	%rax, 48(%rsp)
	movq	16(%rsp), %rdi
	movq	(%rsp), %rsi
	callq	mxSub@PLT
	movq	%rax, 40(%rsp)
	movq	24(%rsp), %rdi
	movq	(%rsp), %rsi
	callq	mxMult@PLT
	movq	%rax, 32(%rsp)
	movq	8(%rsp), %rdi
	callq	display@PLT
	leaq	.Lfmt.1(%rip), %rbx
	leaq	.Ltmp(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.3(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	56(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.4(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	48(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.5(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	40(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.6(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movq	32(%rsp), %rdi
	callq	display@PLT
	leaq	.Ltmp.7(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
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
	.asciz	"%s"
	.size	.Lfmt.1, 3

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
	.asciz	"Done!"
	.size	.Ltmp.7, 6


	.section	".note.GNU-stack","",@progbits
