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

{$if defined(fpc_mcu_nucleog431kb) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32g431kb}
{$endif}

{$if defined(fpc_mcu_nucleog431rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32g431rb}
{$endif}

{$if defined(fpc_mcu_nucleog474re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32g474re}
{$endif}

{$if defined(fpc_mcu_bg474edpow1) }
  {$define discovery}
  {$define stm32g474re}
{$endif}

{$if defined(STM32G431C6) or defined(STM32G431C8) or defined(STM32G431CB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431C6) or defined(STM32G431C8) or defined(STM32G431CB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431CB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431K6) or defined(STM32G431K8) or defined(STM32G431KB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431K6) or defined(STM32G431K8) or defined(STM32G431KB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431M6) or defined(STM32G431M8) or defined(STM32G431MB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define LQFP80 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431R6) or defined(STM32G431R8) or defined(STM32G431RB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431R6) or defined(STM32G431R8) or defined(STM32G431RB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G431V6) or defined(STM32G431V8) or defined(STM32G431VB) }
  {$define STM32G4x1 }
  {$define STM32G43xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441CB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441CB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441CB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441KB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441KB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441MB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define LQFP80 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441RB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441RB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G441VB) }
  {$define STM32G4x1 }
  {$define STM32G44xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471CC) or defined(STM32G471CE) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471CC) or defined(STM32G471CE) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471MC) or defined(STM32G471ME) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define LQFP80 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471ME) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471QC) or defined(STM32G471QE) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define LQFP128 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471RC) or defined(STM32G471RE) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471VC) or defined(STM32G471VE) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471VC) or defined(STM32G471VE) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G471VC) or defined(STM32G471VE) }
  {$define STM32G4x1 }
  {$define STM32G47xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473CB) or defined(STM32G473CC) or defined(STM32G473CE) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473CB) or defined(STM32G473CC) or defined(STM32G473CE) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473MB) or defined(STM32G473MC) or defined(STM32G473ME) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define LQFP80 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473ME) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473QB) or defined(STM32G473QC) or defined(STM32G473QE) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define LQFP128 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473RB) or defined(STM32G473RC) or defined(STM32G473RE) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473VB) or defined(STM32G473VC) or defined(STM32G473VE) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473VB) or defined(STM32G473VC) or defined(STM32G473VE) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G473VB) or defined(STM32G473VC) or defined(STM32G473VE) }
  {$define STM32G4x3 }
  {$define STM32G47xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474CB) or defined(STM32G474CC) or defined(STM32G474CE) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474CB) or defined(STM32G474CC) or defined(STM32G474CE) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474MB) or defined(STM32G474MC) or defined(STM32G474ME) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define LQFP80 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474ME) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474QB) or defined(STM32G474QC) or defined(STM32G474QE) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define LQFP128 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474RB) or defined(STM32G474RC) or defined(STM32G474RE) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474VB) or defined(STM32G474VC) or defined(STM32G474VE) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474VB) or defined(STM32G474VC) or defined(STM32G474VE) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G474VB) or defined(STM32G474VC) or defined(STM32G474VE) }
  {$define STM32G4x4 }
  {$define STM32G47xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483CE) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483CE) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483ME) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define LQFP80 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483ME) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483QE) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define LQFP128 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483RE) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483VE) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483VE) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G483VE) }
  {$define STM32G4x3 }
  {$define STM32G48xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484CE) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484CE) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484ME) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define LQFP80 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484ME) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484QE) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define LQFP128 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484RE) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484VE) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484VE) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G484VE) }
  {$define STM32G4x4 }
  {$define STM32G48xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_lptim1 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32G4x1) or defined(STM32G4x3) or defined(STM32G4x4) }
  {$define CortexM4}
  {$define __CONTROLLERTYPE__:=STM32G4}
  {$define STM32G4}
  {$define STM32}
  {$ALIGN 2}
{$endif}
