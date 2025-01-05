segment .data
    LF          equ 0xA ;;Line feed
    NULL        equ 0xD  ;;Final da String NULO
    SYS_CALL    equ 0x80    ;;
    
    ;   EAX
    SYS_EXIT    equ 0x1 ;;Codigo de chamadapara finalizar      
    SYS_READ    equ 0x3 ;;operação de leitura
    SYS_WRITE   equ 0x4 ;;operação deescrita
    ;   EBX
    RET_EXIT    equ 0x0 ;;operação realizada com sucesso
    STD_IN      equ 0x0 ;;entrada padrão 
    STD_OUT     equ 0x1 ;;Saida padrao


section .data
    msg db  "Entre com seu nome:", LF , NULL
    tam equ $ - msg

section .bss   ;;;aqui coloca as variaveis
    nome    resb    1   ;;;recebe um byte e armazena de 1 em 1

section .text

global _start

    _start:
        mov EAX,    SYS_WRITE
        mov EBX,    STD_OUT
        mov ECX,    msg
        mov EDX,    tam
        int SYS_CALL

        mov EAX,    SYS_READ
        mov EBX,    STD_IN
        mov ECX,    nome
        mov EDX,    0xA ;;limitamos o tamanho para 10
        int SYS_CALL

        mov EAX,    SYS_EXIT
        mov EBX,    RET_EXIT
        int SYS_CALL

