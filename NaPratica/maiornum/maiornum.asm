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
    x   dd  10  ;;db dw, dd define double word
    y   dd  50
    msg1 db  'X maior que Y', LF, NULL
    tam1    equ $ - msg1
    msg2 db  'Y maior que X', LF, NULL
    tam2    equ $ - msg2

section .text
    global _start
        _start:
            mov EAX, DWORD[x] 
            mov EBX, DWORD[y]
;;if : comparação
        cmp EAX, EBX
        ; je= jg> jge>= jl< jle<= jne!=  salto condicional
        jge maior   ;;EAX >= EBX
        mov ECX, msg2
        mov EDX, tam2
        jmp final
        ;jmp goto salto incondicional
maior:
    mov ECX, msg1
    mov EDX, tam1

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL