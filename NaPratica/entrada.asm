segment .data
    LF equ 0xA ; line feed
    SYS_CALL equ 0x80 ; envia informação ao SO
    NULL equ 0xD ; final da string
    
    ;EAX
    SYS_EXIT equ 0x1 ; codigo finalizar programa
    SYS_READ equ 0x3 ; operação de leitura
    SYS_WRITE equ 0x4 ; Operação de escrita

    ;EBX
    RET_EXIT equ 0x0 ; Operação realizada com sucesso
    STD_IN equ 0x0 ; indica uma entrada padrao
    STD_OUT equ 0x1 ; valor de saida padrao

section .data