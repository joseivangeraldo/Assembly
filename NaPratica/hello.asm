;;;um programa em assembler pode ter 3seções
;ld ld -s -o $(NOME) $(NOME).o tira a possibilidade de usar o GDB


section .data   ;;colocamos as constantes
    msg db "Alo mundo estou programando em Assembly!!", 0xA, 0xD
    tam equ $ - msg

section .text   ;;ficam as variaveis

global _start       ;;tem de ter obrigatorio

_start:     ;;ponto de entrada

    mov EAX, 0x4    ;;move alguma coisa para saida padrao
    mov EBX, 0x1    ;; eax e ebx são pareados
    mov ECX, msg
    mov EDX, tam
    int 0x80

    mov EAX, 0x1      ;;destino, origem ESTOU TERMINANDO O PROGRAMA
    mov EBX, 0x0      ;; O VALOR DE RETORNO É ZERO,
    int 0x80        ;; O SO Pega todas as movimentações e executa