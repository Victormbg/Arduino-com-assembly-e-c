#include <avr/io.h>      // header file file for input output pins
#include <util/delay.h>  // header file for delay.

void start();
void pisca();

void start() {
  /* DEFINI O PINO 13 COMO SAIDA DE DADOS */
  DDRB |= _BV(DDB5);
}

void pisca() {
  while (1) {
    /* DEFINI O PINO 13 COMO LIGADO */
    PORTB |= _BV(PORTB5);
    _delay_ms(1000);  // DELAY 1 SEGUNDO

    /* DEFINI O PINO 13 COMO DESLIGADO */
    PORTB &= ~_BV(PORTB5);
    _delay_ms(1000);  // DELAY 1 SEGUNDO
  }
}