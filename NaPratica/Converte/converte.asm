%include 'bibliotecaE.inc'

section .data
    v1 dw '105', LF, NULL ;;cria ponteiro para não fazer
                          ;;  movimentos de entrada de terminal
section .text


global _start

_start:

;---------------------------------
;   String para Inteiro
;---------------------------------
;Entrada : ESI(valor conv) ECX (tam)
;Saida   : EAX
;---------------------------------
string_to_int

;-------------------------------------------
;   Inteiro para String
;--------------------------------------------
;Entrada : interio em EAX
;Saida   : BUFFER (valor ECX) TAM_BUFFER(EDX)
;---------------------------------------------
int_to_string






