<h1>ARDUINO PLACA E INFORMAÇOES</h1>

<p align="center">
<img src="/img/diagrama.png" width="700px"><br>
</p>

DDR
Os registradores do tipo DDR (Data Direction Register) são responsáveis por 
determinar se os pinos de um determinado PORT se comportarão como entrada ou saída. 
Cada bit do registrador DDR controla o estado do respectivo pino. 
Por exemplo: O bit 1 do registrador DDRB (DDB1) controlará o estado do pino PB1 e 
consequentemente o pino D9 do Arduino Uno como mostrado no mapa.
<p align="center">
<img src="/img/ddrb.png" width="900px"><br>
</p>

PORT
Os registradores do tipo PORT são responsáveis por determinar se um pino está 
definido como alto (HIGH) ou baixo (LOW).
<p align="center">
<img src="/img/portb.png" width="800px"><br>
</p>

PIN
Os registradores do tipo PIN são responsáveis por guardar o estado lógico de um pino.
<p align="center">
<img src="/img/pinb.png" width="800px"><br>
</p>

link: https://portal.vidadesilicio.com.br/entrada-e-saida-manipulando-registradores/

<h1>REGISTRADORES DE PORTA</h1>

Registradores de porta permitem uma manipulação de baixo nível e mais rápida dos pinos de entrada e saída do microcontrolador de uma placa Arduino. Os chips usados nas placas Arduino (ATmega8 e ATmega168) têm três portas:
 

    B (pinos digitais de 8 a 13)
    C (pinos de entrada analógica)
    D (pinos digitais de 0 a 7)

Cada porta é controlada por três registradores que também são definidos como variáveis na linguagem Arduino. O registrador DDR determinada quando um pino é entrada (INPUT) ou saída(OUTPUT). O registrador PORT controla quando  o valor de um pino está en HIGH ou LOW, e o registrador PIN lê o estado do INPUT dos pinos que foram marcados como input através do pinMode(). Os mapas do ATmega8 e do ATmega168 mostram as portas.
Os registradores DDR e PORT podem ser lidos e escritos, enquanto que o registrador PIN é somente para leitura.
 
PORTD mapeia as portas digitais de 0 a 7 do Arduino.

    DDRD - The Port D Data Direction Register - read/write
    PORTD - The Port D Data Register - read/write
    PIND - The Port D Input Pins Register - read only

PORTB mapeia para os pinos digitais Arduino 8 a 13 Os dois bits altos (6 e 7) mapeiam os pinos de cristal e não são utilizáveis

    DDRB - The Port B Data Direction Register - read/write
    PORTB - The Port B Data Register - read/write
    PINB - The Port B Input Pins Register - read only

PORTC mapeia para os pinos analógicos 0 a 5. do Arduino Os pinos 6 e 7 são acessíveis apenas no Arduino Mini

    DDRC - The Port C Data Direction Register - read/write
    PORTC - The Port C Data Register - read/write
    PINC - The Port C Input Pins Register - read only
