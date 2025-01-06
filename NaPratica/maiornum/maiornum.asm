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
    x   dd  50  ;;db dw, dd define double word
    y   dd  10
    msg1 db  'x maior que y, LF, NULL
    tam1    equ $ - msg1
    msg2 db  'Y maior que X, LF, NULL
    tam2    equ $ - msg2

section .text
    global_start
        _start:
            mov EAX, DWORD[x]
            mov EAX, DWORD[y]