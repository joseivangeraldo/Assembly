%include 'bibliotecaE.inc'

section .text

global _start

_start:
    lea esi,    [BUFFER] ;;load effective address
    address esi,    0x9
    mov byte[esi],  0xA

    dec esi
    mov dl, 0x11 ;;'A' OX11   --> 0X31 'a'
