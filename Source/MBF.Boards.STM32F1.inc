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

{$if defined(fpc_mcu_nucleof103rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f103rb}
{$endif}

{$if defined(fpc_mcu_stm32vldiscovery) }
  {$define discovery}
  {$define stm32f100rb}
{$endif}

{$if defined(fpc_mcu_bluepill) }
  {$define stm32f103c8}
{$endif}

{$if defined(STM32F100C4) or defined(STM32F100C6) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100C8) or defined(STM32F100CB) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100R4) or defined(STM32F100R6) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100R4) or defined(STM32F100R6) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100R8) or defined(STM32F100RB) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100R8) or defined(STM32F100RB) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100RC) or defined(STM32F100RD) or defined(STM32F100RE) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100V8) or defined(STM32F100VB) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100VC) or defined(STM32F100VD) or defined(STM32F100VE) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F100ZC) or defined(STM32F100ZD) or defined(STM32F100ZE) }
  {$define STM32F100 }
  {$define STM32F10xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101C4) or defined(STM32F101C6) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101C8) or defined(STM32F101CB) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101C8) or defined(STM32F101CB) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101R4) or defined(STM32F101R6) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101R8) or defined(STM32F101RB) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101RC) or defined(STM32F101RD) or defined(STM32F101RE) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101RF) or defined(STM32F101RG) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101RB) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101T4) or defined(STM32F101T6) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define VFQFPN36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
{$endif}
{$if defined(STM32F101T8) or defined(STM32F101TB) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define VFQFPN36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
{$endif}
{$if defined(STM32F101V8) or defined(STM32F101VB) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101VC) or defined(STM32F101VD) or defined(STM32F101VE) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101VF) or defined(STM32F101VG) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101ZC) or defined(STM32F101ZD) or defined(STM32F101ZE) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F101ZF) or defined(STM32F101ZG) }
  {$define STM32F101 }
  {$define STM32F10xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F102C4) or defined(STM32F102C6) }
  {$define STM32F102 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F102C8) or defined(STM32F102CB) }
  {$define STM32F102 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F102R4) or defined(STM32F102R6) }
  {$define STM32F102 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F102R8) or defined(STM32F102RB) }
  {$define STM32F102 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F103C4) or defined(STM32F103C6) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103C8) or defined(STM32F103CB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103C6) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103CB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103R4) or defined(STM32F103R6) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103R4) or defined(STM32F103R6) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103R8) or defined(STM32F103RB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103R8) or defined(STM32F103RB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103RC) or defined(STM32F103RD) or defined(STM32F103RE) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103RC) or defined(STM32F103RD) or defined(STM32F103RE) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103RF) or defined(STM32F103RG) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103T4) or defined(STM32F103T6) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define VFQFPN36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
{$endif}
{$if defined(STM32F103T8) or defined(STM32F103TB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define VFQFPN36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
{$endif}
{$if defined(STM32F103V8) or defined(STM32F103VB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103V8) or defined(STM32F103VB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103VC) or defined(STM32F103VD) or defined(STM32F103VE) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103VC) or defined(STM32F103VD) or defined(STM32F103VE) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103VF) or defined(STM32F103VG) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103VB) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 }
  {$define has_adc1 } {$define has_adc2 }
  
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103ZC) or defined(STM32F103ZD) or defined(STM32F103ZE) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103ZC) or defined(STM32F103ZD) or defined(STM32F103ZE) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103ZF) or defined(STM32F103ZG) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F103ZF) or defined(STM32F103ZG) }
  {$define STM32F103 }
  {$define STM32F10xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F105R8) or defined(STM32F105RB) or defined(STM32F105RC) }
  {$define STM32F105_107 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F105V8) or defined(STM32F105VB) }
  {$define STM32F105_107 }
  {$define STM32F10xx }
  {$define LFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F105V8) or defined(STM32F105VB) or defined(STM32F105VC) }
  {$define STM32F105_107 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F107RB) or defined(STM32F107RC) }
  {$define STM32F105_107 }
  {$define STM32F10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F107VB) or defined(STM32F107VC) }
  {$define STM32F105_107 }
  {$define STM32F10xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F107VC) }
  {$define STM32F105_107 }
  {$define STM32F10xx }
  {$define LFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 }
  {$define has_tim1 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F100 ) or defined(STM32F101) or defined(STM32F102) or defined(STM32F103) or defined(STM32F105_107) }
  {$define CortexM3}
  {$define __CONTROLLERTYPE__:=STM32F1}
  {$define STM32F1}
  {$define STM32}
  {$ALIGN 2}
{$endif}
