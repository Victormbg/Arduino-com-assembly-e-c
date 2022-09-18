#define __SFR_OFFSET 0
#include "avr/io.h"
.global start
.global codeLoop
; ===========================================================================
; --- Definindo PORT e DDR ---
#define PORTD _SFR_IO8(0x0B)
#define DDRD _SFR_IO8(0x0A)
#define PIND _SFR_IO8(0x09)
; ===========================================================================
; --- Configurações iniciais "void setup()" ---
start:
  
  ldi		r16,0x80					;carrega 80h no registrador auxiliar 16
	out		DDRD,r16					;configura PORTD7 como saída
	ldi		r16,0x40					;carrega 0x32(PORTD) no registrador auxiliar 16
	out		PORTD,r16					;inicializa PD7 em LOW, habilita pull-up em PD6
	
  nop									;no operation

; ===========================================================================
; --- Loop Infinito "void loop()" ---
codeLoop:
	
	sbis	PIND,PD6					;botão solto?
	rjmp	led_on						;Não, desvia para ligar LED
	cbi		PORTD,PD7					;Sim, desliga LED
	rjmp	loop						;desvia de volta para label loop

led_on:

	sbi		PORTD,PD7					;liga LED
	rjmp	loop

; ===========================================================================
; --- Final do Programa ---