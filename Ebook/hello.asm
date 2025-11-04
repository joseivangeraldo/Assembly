;nasm -f elf64 hello.asm
;ld -s -o hello hello.o
;./hello
section .data

section .text

global _start

_start:
