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
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	$4, %edi
	movl	$2, %esi
	callq	initMatrix@PLT
	movq	%rax, %rbx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$6, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$7, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$8, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$9, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movl	$7, %esi
	movq	%rbx, %rdi
	callq	store@PLT
	movq	%rbx, (%rsp)
	movq	%rbx, %rdi
	callq	display@PLT
	leaq	.Lfmt.1(%rip), %rdi
	leaq	.Ltmp(%rip), %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
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
	.asciz	"Done!"
	.size	.Ltmp, 6


	.section	".note.GNU-stack","",@progbits
