.intel_syntax noprefix

global _start

_start:
    mov rax, 0x0
    mov rbx, 0x0
    int 0x80

loop:
    cmp rbx, 0x22
    jge done
    add rax,0x2
    add rbx, 0x1
    jmp loop

done:
    nop
    