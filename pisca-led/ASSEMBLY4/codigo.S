#define __SFR_OFFSET 0
#include "avr/io.h"
.global start
.global codigo

#define PORTB 0x25
#define DDRB 0x24 

; Siglas:

; Registros: r0, r1, temp1 (r16), temp2 (r17), looplo (r24), loophi (r25), spmcrval (r20)

; RET: Sub-rotina Return PC

; LDI: Carga imediata

; STS: Armazenar direto para SRAM

; SBIW: Subtrair Imediato da Palavra

; BRNE: Ramificação se diferente

; SUBI: Subtraia a constante do registro 

start:
codigo:

  call  delay

  call  turnON ; Chamando a "function" ligar

  call  delay ; Chamando a "function" delay
  
  ldi r24,0b0000000 ; DESLIGANDO O LED 8 
  sts PORTB, r24

  ldi r24,0b0000001 ; DEFININDO O PINO 8
  sts DDRB, r24

  call  delay ; CHAMANDO O "FUNCTION" DELAY

  ret

turnON:
  ldi r24,0b0000001 ; LIGANDO O LED 8
  sts PORTB, r24
  
  ldi r24,0b0000001 ; DEFININDO O PINO 8
  sts DDRB, r24

delay:
  ldi   31, 3000>>8 ; high(3000)
  ldi   30, 3000&255  ; low(3000)

delaylp:
  sbiw    r30, 1
  brne    delaylp
  subi    r20, 1
  brne    delay
  ret
 