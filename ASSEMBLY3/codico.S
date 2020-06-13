#define __SFR_OFFSET 0
#include "avr/io.h"

.global start
.global codigo

start:
codigo:
  ldi   r24,250 ; Define o delay em ms(MAXIMO DE 255)
  call  delay_n_ms
  call liga  
  ldi   r24,250
  call  delay_n_ms ; CHAMANDO O "FUNCTION" DELAY
  call desliga  
  ret

liga:
    ldi r24,0b0000001 
    sts 0x25, r24
    ldi r24,0b0000001
    sts 0x24, r24
desliga:
    ldi r24,0b0000001 
    sts 0x25, r24
    ldi r24,0b0000001
    sts 0x24, r24
    
delay_n_ms:
  ldi   31, 3000>>8 ; high(3000)
  ldi   30, 3000&255  ; low(3000)

delaylp:
  sbiw    r30, 1
  brne    delaylp
  subi    r20, 1
  brne    delay_n_ms
  ret
 