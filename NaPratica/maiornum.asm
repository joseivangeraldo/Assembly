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
    x dd 50 ; dd dw db dq dt 
    y dd 10
    msg1 db 'X maior que Y', LF, NULL
    tam1 equ $- msg1
    msg2 db 'Y maior que X', LF, NULL
    tam2 equ $- msg2

section .text
global _start

_start:
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]
                    ;if comparação
    cmp EAX, EBX    ;EAX >= EBX
                    ; salto condicional
    jge maior
    mov ECX, msg2
    mov EDX, tam2
                    ;je= jg> jge>= jle<= jne!=
                    ;jmp salto incondicional
    jmp final
maior:
    mov ECX, msg1
    mov EDX, tam2

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL




    


