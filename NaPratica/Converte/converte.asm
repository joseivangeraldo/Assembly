%include 'bibliotecaE.inc'

section .data
    v1 dw '105', LF, NULL ;;cria ponteiro para não fazer
                          ;;  movimentos de entrada de terminal
section .text


global _start

_start:
    call converter_valor
    call mostrar_valor
    
    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL

converter_valor:
    lea ESI, [v1]
    mov ECX, 0x3
    call string_to_int
    add EAX, 0X2
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret


;---------------------------------
;   String para Inteiro
;---------------------------------
;Entrada : ESI(valor conv) ECX (tam)
;Saida   : EAX
;---------------------------------
string_to_int:
    xor EBX, ebx ;; para zerar o EBX
.prox_digito:
    movzx EAX,  byte[ESI] ;;faz uma associação de registrador
    inc ESI
    sub AL, '0'
    imul EBX, 0xA
    add EBX, EAX ;; EBX= EBX*10 + EAX
    loop .prox_digito ;;while (--ecx)
    mov EAX, EBX
    ret

;-------------------------------------------
;   Inteiro para String
;--------------------------------------------
;Entrada : interio em EAX
;Saida   : BUFFER (valor ECX) TAM_BUFFER(EDX)
;---------------------------------------------
int_to_string:
    lea ESI, [BUFFER]
    add ESI, 0x9
    mov byte[ESI], 0xA
    mov ebx, 0xA
.prox_digito:
    xor EDX, EDX
    div EBX,
    add DL, '0'
    dec ESI
    mov [esi], DL
    test EAX, EAX
    jnz .prox_digito
    ret








