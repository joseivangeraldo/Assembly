;EM UMA BIBLIOTECATEMOS:
;SEGMENT .DATA
;SEGMENT .BSS
;SEGMENT .TEXT

segment .data
    LF          equ 0xA ;;Line feed
    NULL        equ 0xD  ;;Final da String NULO
    SYS_CALL    equ 0x80 ;;Envia informação ao S.O
    
    ;   EAX
    SYS_EXIT    equ 0x1 ;;Codigo de chamadapara finalizar      
    SYS_READ    equ 0x3 ;;operação de leitura
    SYS_WRITE   equ 0x4 ;;operação deescrita
    ;   EBX
    RET_EXIT    equ 0x0 ;;operação realizada com sucesso
    STD_IN      equ 0x0 ;;entrada padrão 
    STD_OUT     equ 0x1 ;;Saida padrao

    TAM_BUFFER  equ 0xA

    segment .bss
        BUFFER resb 0x1

    segment .text

    saidaResultado:
        mov EAX, SYS_WRITE
        mov EBX, STD_OUT
        mov ECX, BUFFER
        mov EDX, TAM_BUFFER
        int SYS_CALL
        ret