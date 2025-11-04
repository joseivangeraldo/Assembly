segment .data
    LF          equ 0xA ;;Line Feed ,final de STRING
    NULL        equ 0xD  ;;Final da String NULO
    SYS_CALL    equ 0x80  ;;envia informação ao SO
    
    ;   EAX
    SYS_EXIT    equ 0x1 ;;Codigo de chamada para finalizar programa     
    SYS_READ    equ 0x3 ;;operação de leitura
    SYS_WRITE   equ 0x4 ;;operação de escrita

    ;   EBX
    RET_EXIT    equ 0x0 ;;operação realizada com sucesso
    STD_IN      equ 0x0 ;;entrada padrão 
    STD_OUT     equ 0x1 ;;Saida padrao


section .data  ;;É SÓ PARA TERMOS CONSTANTES
    msg db  "Entre com seu nome:", LF , NULL
    tam equ $ - msg

section .bss   ;;;AQUI COLOCA AS VARIAVEIS
    nome    resb    1   ;;UMA VARIAVEL DE BYTE e VAI ARMAZENANDO DE 1 EM 1.

section .text

global _start

    _start:
        mov EAX,    SYS_WRITE ;;ESCREVE
        mov EBX,    STD_OUT ;;LINHA DE SAIDA
        mov ECX,    msg ;;MENSAGEM
        mov EDX,    tam ;;TAMANHO DA MENSAGEM
        int SYS_CALL  ;;SO SE ENCARREGA DE MANDAR A INFORMAÇÃO

        mov EAX,    SYS_READ ;;03
        mov EBX,    STD_IN ;;DIZER QUE É UMA ENTRADA
        mov ECX,    nome ;;NOSSO NOME
        mov EDX,    0xA ;;limitamos o tamanho para 10
        int SYS_CALL  ;;  SAIDA SO

        mov EAX,    SYS_EXIT ;;
        mov EBX,    RET_EXIT  ;;
        int SYS_CALL ;;

