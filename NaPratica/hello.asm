;;;um programa em assembler pode ter 3seções
;ld ld -s -o $(NOME) $(NOME).o tira a possibilidade de usar o GDB


section .data   ;;colocamos as constantes
    msg db "Alo mundo estou programando em Assembly!!", 0xA, 0xD
    tam equ $ - msg

section .text   ;;Fica o Código fonte

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
    
;gef➤  x/128xh &msg
		   l A	 /s  o   u  m    d  n   /s  o
;0x402000:	0x6c41	0x206f	0x756d	0x646e	0x206f	0x7365	0x6f74	0x2075
;0x402010:	0x7270	0x676f	0x6172	0x616d	0x646e	0x206f	0x6d65	0x4120
;0x402020:	0x7373	0x6d65	0x6c62	0x2179	0x0a21	0x000d	0x0000	0x0000     43 CARACTERES
