; Blink LED (Arduino Uno pin 8 e 9)

#define __SFR_OFFSET 0
 
#include "avr/io.h"

.global start
.global blink

start:
blink:


ldi r24,0b0000011
sts 0x25, r24

ldi r24,0b0000011
sts 0x24, r24

cpi r24, 0b00000000         ; Check if r16 is set to LED OFF
    brbs 1, switchon        ; If it is, change it to ON
    ldi r24, 0b00000000     ; Otherwise, change it to OFF
    out 0x05, r16           ; Set the LED to the new state
    rjmp loop               ; Run the clock
switchon:
    ldi r24, 0b00000001     ; Set r16 to LED ON value
    out 0x05, r24           ; Set the LED to the new state
    rjmp loop               ; Run the clock

loop:
jmp loop
 