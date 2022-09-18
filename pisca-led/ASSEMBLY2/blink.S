; Blink LED (Arduino Uno pin 0 e 1)

#define __SFR_OFFSET 0
 
#include "avr/io.h"

.global start
.global blink

start:
blink:

ldi r24,0b1100001 
sts 0x25, r24

ldi r24,0b1100000
sts 0x24, r24

loop:
jmp loop
 