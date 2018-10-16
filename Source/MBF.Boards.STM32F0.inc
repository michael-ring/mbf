{
  This file is part of Micro Board Framework Library (MBF)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko
  Copyright (c) 2015         Michael Ring

  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General
  Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option)
  any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
  details.
}

{ Indicates that this config file has been processed (to avoid redeclaring or redefining of parameters in other
  configuration files). }
{$DEFINE MBF_BOARDS_STM32_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(nucleof042k6) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32f042k6}
{$endif}

{$if defined(nucleof031k6) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32f031k6}
{$endif}

{$if defined(nucleof030r8) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f030r8}
{$endif}

{$if defined(nucleof070rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f070rb}
{$endif}

{$if defined(nucleof072rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f072rb}
{$endif}

{$if defined(nucleof091rc) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f091rc}
{$endif}

{$if defined(stm32f0discovery) }
  {$define discovery}
  {$define stm32f051r8}
{$endif}

{$if defined(stm32f0308discovery) }
  {$define discovery}
  {$define stm32f030r8}
{$endif}

{$if defined(stm32f072bdiscovery) }
  {$define discovery}
  {$define stm32f072rb}
{$endif}

{$if defined(STM32F030C6) }
  {$define STM32F0x0 }
  {$define STM32F03x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F030C8) }
  {$define STM32F0x0 }
  {$define STM32F03x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F030CC) }
  {$define STM32F0x0 }
  {$define STM32F03x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F030F4) }
  {$define STM32F0x0 }
  {$define STM32F03x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F030K6) }
  {$define STM32F0x0 }
  {$define STM32F03x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F030R8) }
  {$define STM32F0x0 }
  {$define STM32F03x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F030RC) }
  {$define STM32F0x0 }
  {$define STM32F03x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F031C4) or defined(STM32F031C6) }
  {$define STM32F0x1 }
  {$define STM32F03x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F031E6) }
  {$define STM32F0x1 }
  {$define STM32F03x }
  {$define WLCSP25 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F031F4) or defined(STM32F031F6) }
  {$define STM32F0x1 }
  {$define STM32F03x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F031G4) or defined(STM32F031G6) }
  {$define STM32F0x1 }
  {$define STM32F03x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F031K4) or defined(STM32F031K6) }
  {$define STM32F0x1 }
  {$define STM32F03x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F031K6) }
  {$define STM32F0x1 }
  {$define STM32F03x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F038C6) }
  {$define STM32F0x8 }
  {$define STM32F03x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F038E6) }
  {$define STM32F0x8 }
  {$define STM32F03x }
  {$define WLCSP25 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F038F6) }
  {$define STM32F0x8 }
  {$define STM32F03x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F038G6) }
  {$define STM32F0x8 }
  {$define STM32F03x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F038K6) }
  {$define STM32F0x8 }
  {$define STM32F03x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F042C4) or defined(STM32F042C6) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F042C4) or defined(STM32F042C6) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F042F4) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F042F6) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F042G4) or defined(STM32F042G6) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F042K4) or defined(STM32F042K6) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F042K4) or defined(STM32F042K6) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F042T6) }
  {$define STM32F0x2 }
  {$define STM32F04x }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F048C6) }
  {$define STM32F0x8 }
  {$define STM32F04x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F048G6) }
  {$define STM32F0x8 }
  {$define STM32F04x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F048T6) }
  {$define STM32F0x8 }
  {$define STM32F04x }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051C4) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051C4) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051C6) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051C6) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051C8) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051C8) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051K4) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051K4) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051K6) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051K6) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051K8) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051K8) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051R4) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051R6) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051R8) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051R8) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F051T8) }
  {$define STM32F0x1 }
  {$define STM32F05x }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F058C8) }
  {$define STM32F0x8 }
  {$define STM32F05x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F058R8) }
  {$define STM32F0x8 }
  {$define STM32F05x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F058R8) }
  {$define STM32F0x8 }
  {$define STM32F05x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F058T8) }
  {$define STM32F0x8 }
  {$define STM32F05x }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F070C6) }
  {$define STM32F0x0 }
  {$define STM32F07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F070CB) }
  {$define STM32F0x0 }
  {$define STM32F07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F070F6) }
  {$define STM32F0x0 }
  {$define STM32F07x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F070RB) }
  {$define STM32F0x0 }
  {$define STM32F07x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F071C8) or defined(STM32F071CB) }
  {$define STM32F0x1 }
  {$define STM32F07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F071C8) or defined(STM32F071CB) }
  {$define STM32F0x1 }
  {$define STM32F07x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F071CB) }
  {$define STM32F0x1 }
  {$define STM32F07x }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F071RB) }
  {$define STM32F0x1 }
  {$define STM32F07x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F071V8) or defined(STM32F071VB) }
  {$define STM32F0x1 }
  {$define STM32F07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F071V8) or defined(STM32F071VB) }
  {$define STM32F0x1 }
  {$define STM32F07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F072C8) or defined(STM32F072CB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F072C8) or defined(STM32F072CB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F072CB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F072R8) or defined(STM32F072RB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F072RB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F072RB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F072V8) or defined(STM32F072VB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F072V8) or defined(STM32F072VB) }
  {$define STM32F0x2 }
  {$define STM32F07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F078CB) }
  {$define STM32F0x8 }
  {$define STM32F07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F078CB) }
  {$define STM32F0x8 }
  {$define STM32F07x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F078CB) }
  {$define STM32F0x8 }
  {$define STM32F07x }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F078RB) }
  {$define STM32F0x8 }
  {$define STM32F07x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F078RB) }
  {$define STM32F0x8 }
  {$define STM32F07x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F078VB) }
  {$define STM32F0x8 }
  {$define STM32F07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F078VB) }
  {$define STM32F0x8 }
  {$define STM32F07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F091CB) or defined(STM32F091CC) }
  {$define STM32F0x1 }
  {$define STM32F09x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F091CB) or defined(STM32F091CC) }
  {$define STM32F0x1 }
  {$define STM32F09x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F091RB) or defined(STM32F091RC) }
  {$define STM32F0x1 }
  {$define STM32F09x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F091RC) }
  {$define STM32F0x1 }
  {$define STM32F09x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F091RC) }
  {$define STM32F0x1 }
  {$define STM32F09x }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F091VB) or defined(STM32F091VC) }
  {$define STM32F0x1 }
  {$define STM32F09x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F091VC) }
  {$define STM32F0x1 }
  {$define STM32F09x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F098CC) }
  {$define STM32F0x8 }
  {$define STM32F09x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F098CC) }
  {$define STM32F0x8 }
  {$define STM32F09x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F098RC) }
  {$define STM32F0x8 }
  {$define STM32F09x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F098RC) }
  {$define STM32F0x8 }
  {$define STM32F09x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F098RC) }
  {$define STM32F0x8 }
  {$define STM32F09x }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F098VC) }
  {$define STM32F0x8 }
  {$define STM32F09x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F098VC) }
  {$define STM32F0x8 }
  {$define STM32F09x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_usart5 } {$define has_usart6 } {$define has_usart7 } {$define has_usart8 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F0x0 ) or defined(STM32F0x1) or defined(STM32F0x2) or defined(STM32F0x8) }
  {$define CortexM0}
  {$define __CONTROLLERTYPE__:=STM32F0}
  {$define STM32F0}
  {$define STM32}
  {$ALIGN 2}
{$endif}
