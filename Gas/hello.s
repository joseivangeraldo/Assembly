.global main
.text
.global _start
_start:
    movq $1, %rax        # syscall 1: write
    movq $1, %rdi        # file descriptor 1: stdout
    leaq msg(%rip), %rsi # pointer to message
    movq $13, %rdx       # message length
    syscall              # call kernel
    
    movq $60, %rax       # syscall 60: exit
    xorq %rdi, %rdi      # exit code 0
    syscall

.data
msg:
    .ascii "Hello, World\n"
