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

{$if defined(nucleof207zg) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f207zg}
{$endif}

{$if defined(STM32F205RB) or defined(STM32F205RC) or defined(STM32F205RE) or defined(STM32F205RF) or defined(STM32F205RG) }
  {$define STM32F2x5 }
  {$define STM32F20xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F205RE) or defined(STM32F205RG) }
  {$define STM32F2x5 }
  {$define STM32F20xx }
  {$define WLCSP66 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F205RG) }
  {$define STM32F2x5 }
  {$define STM32F20xx }
  {$define EWLCSP66 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F205VB) or defined(STM32F205VC) or defined(STM32F205VE) or defined(STM32F205VF) or defined(STM32F205VG) }
  {$define STM32F2x5 }
  {$define STM32F20xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F205ZC) or defined(STM32F205ZE) or defined(STM32F205ZF) or defined(STM32F205ZG) }
  {$define STM32F2x5 }
  {$define STM32F20xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F207IC) or defined(STM32F207IE) or defined(STM32F207IF) or defined(STM32F207IG) }
  {$define STM32F2x7 }
  {$define STM32F20xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F207IC) or defined(STM32F207IE) or defined(STM32F207IF) or defined(STM32F207IG) }
  {$define STM32F2x7 }
  {$define STM32F20xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F207VC) or defined(STM32F207VE) or defined(STM32F207VF) or defined(STM32F207VG) }
  {$define STM32F2x7 }
  {$define STM32F20xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F207ZC) or defined(STM32F207ZE) or defined(STM32F207ZF) or defined(STM32F207ZG) }
  {$define STM32F2x7 }
  {$define STM32F20xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F215RE) or defined(STM32F215RG) }
  {$define STM32F2x5 }
  {$define STM32F21xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F215VE) or defined(STM32F215VG) }
  {$define STM32F2x5 }
  {$define STM32F21xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F215ZE) or defined(STM32F215ZG) }
  {$define STM32F2x5 }
  {$define STM32F21xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F217IE) or defined(STM32F217IG) }
  {$define STM32F2x7 }
  {$define STM32F21xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F217IE) or defined(STM32F217IG) }
  {$define STM32F2x7 }
  {$define STM32F21xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F217VE) or defined(STM32F217VG) }
  {$define STM32F2x7 }
  {$define STM32F21xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F217ZE) or defined(STM32F217ZG) }
  {$define STM32F2x7 }
  {$define STM32F21xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F2x5) or defined(STM32F2x7) }
  {$define CortexM3}
  {$define __CONTROLLERTYPE__:=STM32F2}
  {$define STM32F2}
  {$define STM32}
  {$ALIGN 2}
{$endif}
