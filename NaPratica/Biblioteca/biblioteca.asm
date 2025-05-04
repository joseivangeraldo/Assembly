%include 'bibliotecaE.inc'

section .text

global _start

_start:
    lea esi, [BUFFER] ;;
    ;;load effective address (lea) 
    ;;Tem o poder de associar um endereço do bss 
    ;;com um registrador aqui.
    ;;TUDO QUE ESTOU MANDANDO PARA A ESI ESTOU MANDANDO PARA O BUFFER
    ;;CUIDADO NÃO PODE MANDAR REGISTRADOR PARA A ESI SE NÃO PERDE A CONEXÃO
    
    add esi,    0x9 ;;  NA TABELA HEXADECIAML É UM COMEÇO DE UMA STRING
    mov byte[esi],  0xA

    ;;'DCBA/n' ENTRA NO REGISTRADOR DE TRAS PARA FRENTE

    dec esi ;;MOVE ESI para TRAS
    mov dl, 0x11 ;; 11 é um numero 'A' OX11   --> 0X31 'a'
    add dl, '0' ;;CONVERTE O CARACTER EM UM NUMERO
    mov [esi],  dl

    call saidaResultado

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_EXIT
