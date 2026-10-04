; Simple NASM x86_64 hello world
section .data
  msg db "Hello, NASM world!", 10
  len equ $ - msg

section .text
  global _start

_start:
  ; write(fd=1, buf=msg, count=len)
  mov rax, 1          ; sys_write
  mov rdi, 1          ; stdout
  mov rsi, msg        ; buffer
  mov rdx, len        ; length
  syscall

  ; exit(0)
  mov rax, 60         ; sys_exit
  xor rdi, rdi        ; status 0
  syscall
