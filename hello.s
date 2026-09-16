.global _start
.text
_start:
    mov $1, %rax        # system call 1 is write
    mov $1, %rdi        # file descriptor 1 is stdout
    mov $message, %rsi  # address of string
    mov $13, %rdx       # number of bytes
    syscall             # invoke operating system call
    mov $60, %rax       # system call 60 is exit
    mov $0, %rdi        # exit status 0
    syscall
 .section .data
message:
    .ascii "Hello, World\n"