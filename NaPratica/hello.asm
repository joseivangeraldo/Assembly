;Transforma o programa para linguagem de maquina
;nasm -f elf64 hello.asm ;comando compilação.Vai gerar hello.o
;linkeditar = pegar um programa em linguagem de maquina em executavel.
;ld -s -o hello hello.o

section .data
    msg db 'Hello World', 0xA
    tam equ $- msg

section .text

global _start

_start:

    mov EAX, 0x4 ;move alguma coisa para a saida padrao
    mov EBX, 0X1 ;QDO MOVE EAX TEM DEMOVER ALGUMA COISA EM EBX
    mov ECX, msg
    mov EDX, tam
    int 0x80

    ; destino, origem
    mov EAX, 0x1    ;SO estou terminando o programa
    mov EBX, 0x0    ;SO ovalor de retorno é 0
    int 0x80        ; O sistema pega todas as movimentações e executa