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
{$DEFINE MBF_BOARDS_MEGAAVR_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(arduinouno) }
  {$define has_arduinopins}
  {$define ATMEGA328P}
{$endif}

{$if defined(arduinonano) }
  {$define has_arduinopins}
  {$define has_arduinonanopins}
  {$define ATMEGA328P}
{$endif}

{$if defined(atmega4809curiosityn)}
   {$define atmega4809curiositynano}
{$endif}

{$if defined(atmega4809curiositynano)}
  {$define has_arduinopins}
  {$define ATMEGA4809}
{$endif}


{$if defined(AT90CAN128) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(AT90CAN32) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(AT90CAN64) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(AT90PWM1) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(AT90PWM161) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}



  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(AT90PWM216) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(AT90PWM2B) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(AT90PWM316) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(AT90PWM3B) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(AT90PWM81) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}



  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(AT90USB1286) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(AT90USB1287) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(AT90USB162) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart1}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}

{$endif}

{$if defined(AT90USB646) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(AT90USB647) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(AT90USB82) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart1}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}

{$endif}

{$if defined(ATmega128) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim2}
  {$define has_tim0}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega1280) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}  {$define has_gpiok}  {$define has_gpiol}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}  {$define has_usart3}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega1281) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega1284) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega1284P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega1284RFR2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}  {$define has_usart0_spi0}  {$define has_usart1_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega128A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim2}
  {$define has_tim0}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega128RFA1) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}  {$define has_usart0_spi0}  {$define has_usart1_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega128RFR2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}  {$define has_usart0_spi0}  {$define has_usart1_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega16) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega1608) }
  {$define AVR8X }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}
  {$define has_spi00}
  {$define has_i2c00}



  {$define has_adc00}
{$endif}

{$if defined(ATmega1609) }
  {$define AVR8X }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}  {$define has_usart3}
  {$define has_spi00}
  {$define has_i2c00}



  {$define has_adc00}
{$endif}

{$if defined(ATmega162) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}

{$endif}

{$if defined(ATmega164A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega164P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega164PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega165A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega165P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega165PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega168) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega168A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega168P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega168PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega168PB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega169A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega169P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega169PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega16A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega16HVA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}

  {$define has_spi0}



  {$define has_tim0}  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega16HVB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}

  {$define has_spi0}
  {$define has_i2c0}


  {$define has_tim0}  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega16HVBrevB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}

  {$define has_spi0}
  {$define has_i2c0}


  {$define has_tim0}  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega16M1) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega16U2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart1}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}

{$endif}

{$if defined(ATmega16U4) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}

  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega2560) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}  {$define has_gpiok}  {$define has_gpiol}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}  {$define has_usart3}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega2561) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega2564RFR2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}  {$define has_usart0_spi0}  {$define has_usart1_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega256RFR2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}  {$define has_usart0_spi0}  {$define has_usart1_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega32) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3208) }
  {$define AVR8X }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}
  {$define has_spi00}
  {$define has_i2c00}



  {$define has_adc00}
{$endif}

{$if defined(ATmega3209) }
  {$define AVR8X }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}  {$define has_usart3}
  {$define has_spi00}
  {$define has_i2c00}



  {$define has_adc00}
{$endif}

{$if defined(ATmega324A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega324P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega324PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega324PB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}
  {$define has_spi00}  {$define has_spi10}
  {$define has_i2c00}  {$define has_i2c10}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}
  {$define has_adc0}
{$endif}

{$if defined(ATmega325) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3250) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3250A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3250P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3250PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega325A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega325P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega325PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega328) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega328P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega328PB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi00}  {$define has_spi10}
  {$define has_i2c00}  {$define has_i2c10}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}
  {$define has_adc0}
{$endif}

{$if defined(ATmega329) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3290) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3290A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3290P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega3290PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega329A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega329P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega329PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega32A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega32C1) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega32HVB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}

  {$define has_spi0}
  {$define has_i2c0}


  {$define has_tim0}  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega32HVBrevB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}

  {$define has_spi0}
  {$define has_i2c0}


  {$define has_tim0}  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega32M1) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega32U2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart1}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}

{$endif}

{$if defined(ATmega32U4) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}

  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega406) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}


  {$define has_i2c0}
  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega48) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega4808) }
  {$define AVR8X }
  {$define megaAVR0 }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}
  {$define has_spi0}
  {$define has_i2c0}



  {$define has_adc0}
{$endif}

{$if defined(ATmega4809) }
  {$define AVR8X }
  {$define megaAVR0 }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}  {$define has_usart3}
  {$define has_spi0}
  {$define has_i2c0}



  {$define has_adc0}
{$endif}

{$if defined(ATmega48A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega48P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega48PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega48PB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega64) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim2}
  {$define has_tim0}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega640) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}  {$define has_gpiok}  {$define has_gpiol}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}  {$define has_usart3}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega644) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega644A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega644P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega644PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega644RFR2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}  {$define has_usart0_spi0}  {$define has_usart1_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega645) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega6450) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega6450A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega6450P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega645A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega645P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega649) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega6490) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega6490A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega6490P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}  {$define has_gpioh}  {$define has_gpioj}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega649A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega649P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega64A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim2}
  {$define has_tim0}
  {$define has_tim1}  {$define has_tim3}
  {$define has_adc0}
{$endif}

{$if defined(ATmega64C1) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega64HVE2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}

  {$define has_spi0}



  {$define has_tim0}  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega64M1) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}

  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega64RFR2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}  {$define has_gpiog}
  {$define has_usart0}  {$define has_usart1}
  {$define has_spi0}  {$define has_usart0_spi0}  {$define has_usart1_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}  {$define has_tim3}  {$define has_tim4}  {$define has_tim5}
  {$define has_adc0}
{$endif}

{$if defined(ATmega8) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega808) }
  {$define AVR8X }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}
  {$define has_spi00}
  {$define has_i2c00}



  {$define has_adc00}
{$endif}

{$if defined(ATmega809) }
  {$define AVR8X }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}  {$define has_gpiof}
  {$define has_usart0}  {$define has_usart1}  {$define has_usart2}  {$define has_usart3}
  {$define has_spi00}
  {$define has_i2c00}



  {$define has_adc00}
{$endif}

{$if defined(ATmega8515) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}

{$endif}

{$if defined(ATmega8535) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega88) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega88A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega88P) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega88PA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega88PB) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}  {$define has_gpioe}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega8A) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart0}
  {$define has_spi0}
  {$define has_i2c0}
  {$define has_tim0}
  {$define has_tim2}
  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega8HVA) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpioa}  {$define has_gpiob}  {$define has_gpioc}

  {$define has_spi0}



  {$define has_tim0}  {$define has_tim1}
  {$define has_adc0}
{$endif}

{$if defined(ATmega8U2) }
  {$define AVR8 }
  {$define megaAVR }
  {$define has_gpiob}  {$define has_gpioc}  {$define has_gpiod}
  {$define has_usart1}
  {$define has_spi0}

  {$define has_tim0}

  {$define has_tim1}

{$endif}

{$if defined(AVR8) or defined(AVR8X)}
  {$define __CONTROLLERTYPE__:=megaAVR}
  {$define AVR}
  {$ALIGN 2}
{$endif}

{$if defined(MEGAAVR0)}
  {$define __CONTROLLERTYPE__:=megaAVR0}
  {$define AVR}
  {$ALIGN 2}
{$endif}
