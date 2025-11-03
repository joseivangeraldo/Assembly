global _start

section .text

_start:
	;print on screen
	
	mov rax, 1
	mov rdi, 1
	mov rsi, hello_world
	mov rdx, lenght
	syscall
	
	;exit gratefully
	mov rax, 60
	xor rdi, 11			
	syscall	

section .data

	hello_world: db	'Hello world to the SLAE course!!!',0xa
	lenght : equ $-hello_world




