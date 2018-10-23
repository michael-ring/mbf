{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}

{ Indicates that this config file has been processed (to avoid redeclaring or redefining of parameters in other
  configuration files). }
{$DEFINE MBF_BOARDS_PIC32MX_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(pinguino) }
  {$define has_arduinopins}
  {$define PIC32MX440F256H}
{$endif}

{$if defined(chipkitlenny) }
  {$define has_arduinopins}
  {$define pic32mx270f256d}
{$endif}

{$if defined(PIC32MX110F016B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX110F016C)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX110F016D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX120F032B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX120F032C)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX120F032D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX120F064H)}
  {$define PIC32MX1}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX130F064B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX130F064C)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX130F064D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX130F128H)}
  {$define PIC32MX1}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX130F128L)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX130F256B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX130F256D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX150F128B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX150F128C)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX150F128D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX150F256H)}
  {$define PIC32MX1}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX150F256L)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX151F128H)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd}
  {$define has_uart1}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX154F128B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX154F128D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX155F128B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX155F128D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX170F256B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX170F256D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX170F512H)}
  {$define PIC32MX1}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX170F512L)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX174F256B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX174F256D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX175F256B)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX175F256D)}
  {$define PIC32MX1}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX210F016B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX210F016C)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX210F016D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX220F032B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX220F032C)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX220F032D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX230F064B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX230F064C)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX230F064D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX230F128H)}
  {$define PIC32MX2}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX230F128L)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX230F256B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX230F256D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX250F128B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX250F128C)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX250F128D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX250F256H)}
  {$define PIC32MX2}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX250F256L)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX251F128E)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd}
  {$define has_uart1}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX251F128H)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd}
  {$define has_uart1}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX254F128B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX254F128D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX255F128B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX270F256B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX270F256D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX270F256DB)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX270F512H)}
  {$define PIC32MX2}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX270F512L)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX274F256B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX274F256D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX275F256B)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX275F256D)}
  {$define PIC32MX2}
  {$define has_porta} {$define has_portb} {$define has_portc}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX320F032H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX320F064H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX320F128H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX320F128L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX330F064H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX330F064L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX340F128H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX340F128L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX340F256H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX340F512H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX350F128H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX350F128L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX350F256H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX350F256L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX360F256L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX360F512L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX370F512H)}
  {$define PIC32MX3}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX370F512L)}
  {$define PIC32MX3}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
{$endif}

{$if defined(PIC32MX420F032H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
{$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX430F064H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX430F064L)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX440F128H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
{$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX440F128L)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX440F256H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
{$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX440F512H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
{$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX450F128H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX450F128L)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX450F256H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX450F256HB)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX450F256L)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX460F256L)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX460F512L)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX470F512H)}
  {$define PIC32MX4}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX470F512L)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX470F512LB)}
  {$define PIC32MX4}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX530F128H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX530F128L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX534F064H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX534F064L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX550F256H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX550F256L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX564F064H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX564F064L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX564F128H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX564F128L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX570F512H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4}
  {$define has_spi1} {$define has_spi2} {$define has_spi3}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX570F512L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX575F256H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX575F256L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX575F512H)}
  {$define PIC32MX5}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX575F512L)}
  {$define PIC32MX5}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX664F064H)}
  {$define PIC32MX6}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX664F064L)}
  {$define PIC32MX6}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX664F128H)}
  {$define PIC32MX6}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX664F128L)}
  {$define PIC32MX6}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX675F256H)}
  {$define PIC32MX6}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX675F256L)}
  {$define PIC32MX6}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX675F512H)}
  {$define PIC32MX6}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX675F512L)}
  {$define PIC32MX6}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX695F512H)}
  {$define PIC32MX6}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX695F512L)}
  {$define PIC32MX6}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX764F128H)}
  {$define PIC32MX7}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX764F128L)}
  {$define PIC32MX7}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX775F256H)}
  {$define PIC32MX7}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_can2}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX775F256L)}
  {$define PIC32MX7}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_can2}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX775F512H)}
  {$define PIC32MX7}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_can2}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX775F512L)}
  {$define PIC32MX7}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_can2}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX795F512H)}
  {$define PIC32MX7}
{$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
{$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_can2}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX795F512L)}
  {$define PIC32MX7}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2} {$define has_uart3} {$define has_uart4} {$define has_uart5} {$define has_uart6}
  {$define has_spi1} {$define has_spi2} {$define has_spi3} {$define has_spi4}
  {$define has_i2c1} {$define has_i2c2} {$define has_i2c4} {$define has_i2c5}
  {$define has_adc}
  {$define has_can}
  {$define has_can1}
  {$define has_can2}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MXGENERIC)}
  {$define PIC32MXG}
  {$define has_porta} {$define has_portb} {$define has_portc} {$define has_portd} {$define has_porte} {$define has_portf} {$define has_portg}
  {$define has_uart1} {$define has_uart2}
  {$define has_spi1} {$define has_spi2}
  {$define has_i2c1} {$define has_i2c2}
  {$define has_adc}
  {$define has_tmr1} {$define has_tmr2} {$define has_tmr3} {$define has_tmr4} {$define has_tmr5}
  {$define has_usb}
{$endif}

{$if defined(PIC32MX1) or defined(PIC32MX2) or defined(PIC32MX3) or defined(PIC32MX4) or defined(PIC32MX6) or defined(PIC32MX7)}
  {$DEFINE __CONTROLLERTYPE__:=PIC32MX}
  {$DEFINE PIC32MX}
  {$DEFINE PIC32}
  {$ALIGN 2}
{$ENDIF}
