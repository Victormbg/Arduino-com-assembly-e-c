<h1>ARDUINO PLACA E INFORMAÇOES</h1>

<p align="center">
<img src="/img/diagrama.png" width="800px"><br>
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
<img src="/img/portb.png" width="900px"><br>
</p>

PIN
Os registradores do tipo PIN são responsáveis por guardar o estado lógico de um pino.
<p align="center">
<img src="/img/pinb.png" width="900px"><br>
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

<h1>Uso de registradores na IDE Arduino</h1>
O cérebro do Arduino é o seu microcontrolador, no caso do Arduino Uno, é o ATMega328p. É ele que armazena os programas, contém a memória e possui os pinos de entrada/saída que utilizamos na placa.

Estes pinos de entrada/saída também são conhecidos como GPIO (sigla para General Purpose Input Output ou entrada/saída de uso geral). Cada microcontrolador contém um número de GPIOs que podem ser utilizadas para diversos propósitos, conforme programação.

A placa Arduino Uno possui os pinos digitais identificados de 0 a 13 e analógicos de A0 a A5. Mas a arquitetura do microcontrolador pode dar outra nomenclatura aos pinos que conhecemos. Confira a placa Arduino Uno em detalhes conforme a próxima figura.
<p align="center">
<img src="/img/registradores.png" width="900px"><br>
</p>
Repare na figura acima que os pinos que conhecemos como digitais estão como Dx (digitais) ou Ax (analógicos), sendo x um número. Porém, ao lado de cada pino há uma outra nomenclatura para acessar os mesmos pinos.

Os microcontroladores podem ter seus GPIOs divididos em ports, um conjunto de pinos que podem ser configurados ou acessados de uma só vez. O ATMega328p possui três conjuntos:

PORTB: PB0 a PB5 (8 a 13)
PORTC: PC0 a PC5 (A0 a A5)
PORTD: PD0 a PD7 (0 a 7)
Então, para acessar/configurar o pino 9 digital do ATMega328p, utilizamos a nomenclatura PB1. Este acesso ou configuração é feito a partir dos registradores.

OBS: Cada microcontrolador possui diferentes conjuntos de ports e quantidade de GPIOs. Portanto, outras versões de Arduino como Mega 2560, Leonardo e outras placas não coincidem com as nomenclaturas dos pinos do Arduino Uno. Consulte na internet o microcontrolador da placa que você fará uso.

Configuração por registradores
Os comandos para registradores são baseados na linguagem C. Fazem um outro caminho para configurar pinos, diferente dos comandos já utilizados em Wiring. Eles realizam esta configuração de forma mais segura e rápida. Utilizaremos três tipos específicos de registradores:

PORTx: registrador de dados, usado para escrever no port ou pino em específico. x representa os ports disponíveis no microcontrolador, que no caso do ATMega328p, são os ports B, C e D;
DDRx: registrador de direção, usado para ler a entrada de um port ou pino em específico. No caso do ATMega328p, x representa os ports B, C e D;
PINx: endereço de entrada do pino, usado para configurar um port inteiro ou pino será entrada ou saída.

LINK: https://www.filipeflop.com/blog/uso-de-registradores-na-ide-arduino/

# Explicação das siglas no codigo:

Siglas:

* Registros: r0, r1, temp1 (r16), temp2 (r17), looplo (r24), loophi (r25), spmcrval (r20)

<p align="center">
<img src="/img/listaRegistros.png" width="900px"><br>
</p>

Os registradores R26..R31 têm algumas funções adicionadas aos seus uso de propósito geral. 
Esses registros são endereços de 16 bits; ponteiros para endereçamento indireto do Data Space.


* RET: Sub-rotina Return PC = PC <- STACK

* LDI: Carga imediata = Rd <- K

* STS: Armazenar direto para SRAM = (k) <- Rr

* SBIW: Subtrair Imediato da Palavra = Rdh: Rdl <- Rdh: Rdl - K

* BRNE: Ramificação se diferente = if (Z = 0) então PC <- PC + k + 1

* SUBI: Subtraia a constante do registro Rd <- Rd - K

Significados:

* Rd e Rr são registros.

* Stack Pointer: O Stack é usado principalmente para armazenar dados temporários, 
para armazenar variáveis ​​locais e para armazenar endereços de retorno após interrupções e chamadas de sub-rotina.

* PC: A memória Flash tem uma resistência de pelo menos 10.000 ciclos de gravação / exclusão.
O contador de programas ATmega8 (PC) tem 12 bits de largura, abordando assim os locais de memória do programa de 4K.

# Esquema Led
<p align="center">
<img src="/img/led.jpg" width="900px"><br>
</p>

#LINKS:

https://medium.com/jungletronics/meeting-assembly-hello-world-arduino-blinking-code-330386652309

https://gist.github.com/mhitza/8a4608f4dfdec20d3879


