#define __SFR_OFFSET 0
#include "avr/io.h"
.global start
.global blink

start:
blink:
  
  ldi   r24,250 ; Define o delay em ms(MAXIMO DE 255)
  call  delay_n_ms
  
  ldi r24,0b0000011 ; LIGANDO O LED 8 E 9 
  sts 0x25, r24

  ldi r24,0b0000011 ; DEFININDO QUE SAO OS PINOS 8 E 9 
  sts 0x24, r24
  
  ldi   r24,250
  call  delay_n_ms ; CHAMANDO O "FUNCTION" DELAY
  
  ldi r24,0b0000000 ; DESLIGANDO O LED 8 E 9 
  sts 0x25, r24

  ldi r24,0b0000011 ; DEFININDO QUE SAO OS PINOS 8 E 9 
  sts 0x24, r24
  ret

delay_n_ms:
  ldi   31, 3000>>8 ; high(3000)
  ldi   30, 3000&255  ; low(3000)

delaylp:
  sbiw    r30, 1
  brne    delaylp
  subi    r20, 1
  brne    delay_n_ms
  ret
 