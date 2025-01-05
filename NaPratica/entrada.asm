segment .data
    LF          equ 0xA ;;Line feed
    
    ;   EAX
    SYS_EXIT    equ 0x1 ;;Codigo de chamadapara finalizar      
    SYS_READ    equ 0x3 ;;operação de leitura
    SYS_WRITE   equ 0x4 ;;operação deescrita
    ;   EBX
    RET_EXIT    equ 0x0 ;;operação realizada com sucesso 
    STD_OUT     equ 0x1 ;;Saida padrao


section .data

