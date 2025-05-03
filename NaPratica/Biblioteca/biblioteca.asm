%include 'bibliotecaE.inc'

section .text

global _start

_start:
    lea esi,    [BUFFER] ;;load effective address
    address esi,    0x9
    mov byte[esi],  0xA

    ;;'DCBA/n'

    dec esi ;;MOVE ESI para ficar na ordem
    mov dl, 0x11 ;; 11 é um numero 'A' OX11   --> 0X31 'a'
    add dl, '0' ;;CONVERTE O CARACTER EM UM NUMERO
    mov [esi],  dl
