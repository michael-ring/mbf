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
{$DEFINE MBF_BOARDS_STM32_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(nucleol432kc) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32l432kc}
{$endif}

{$if defined(nucleol476rg) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l476rg}
{$endif}

{$if defined(nucleol452re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l452re}
{$endif}

{$if defined(stm32l476gdiscovery) }
  {$define discovery}
  {$define stm32l476vg}
{$endif}

{$if defined(STM32L431CB) or defined(STM32L431CC) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431CB) or defined(STM32L431CC) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431CB) or defined(STM32L431CC) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431KB) or defined(STM32L431KC) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431RBIx) or defined(STM32L431RCIx) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431RB) or defined(STM32L431RC) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431RB) or defined(STM32L431RC) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431VCIx) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L431VC) }
  {$define STM32L4x1 }
  {$define STM32L43xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L432KB) or defined(STM32L432KC) }
  {$define STM32L4x2 }
  {$define STM32L43xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433CB) or defined(STM32L433CC) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433CB) or defined(STM32L433CC) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433CB) or defined(STM32L433CC) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433RBIx) or defined(STM32L433RCIx) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433RB) or defined(STM32L433RC) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433RB) or defined(STM32L433RC) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433VCIx) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L433VC) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L442KC) }
  {$define STM32L4x2 }
  {$define STM32L44xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443CC) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443CC) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443CC) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443RCIx) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443RC) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443RC) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443VCIx) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L443VC) }
  {$define STM32L4x3 }
  {$define STM32L44xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L451CC) or defined(STM32L451CE) }
  {$define STM32L4x1 }
  {$define STM32L45xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L451RCIx) or defined(STM32L451REIx) }
  {$define STM32L4x1 }
  {$define STM32L45xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L451RC) or defined(STM32L451RE) }
  {$define STM32L4x1 }
  {$define STM32L45xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L451RC) or defined(STM32L451RE) }
  {$define STM32L4x1 }
  {$define STM32L45xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L451VCIx) or defined(STM32L451VEIx) }
  {$define STM32L4x1 }
  {$define STM32L45xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L451VC) or defined(STM32L451VE) }
  {$define STM32L4x1 }
  {$define STM32L45xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L452CC) or defined(STM32L452CE) }
  {$define STM32L4x2 }
  {$define STM32L45xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L452RCIx) or defined(STM32L452REIx) }
  {$define STM32L4x2 }
  {$define STM32L45xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L452RC) or defined(STM32L452RE) }
  {$define STM32L4x2 }
  {$define STM32L45xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L452RC) or defined(STM32L452RE) }
  {$define STM32L4x2 }
  {$define STM32L45xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L452VCIx) or defined(STM32L452VEIx) }
  {$define STM32L4x2 }
  {$define STM32L45xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L452VC) or defined(STM32L452VE) }
  {$define STM32L4x2 }
  {$define STM32L45xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L462CE) }
  {$define STM32L4x2 }
  {$define STM32L46xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L462REIx) }
  {$define STM32L4x2 }
  {$define STM32L46xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L462RE) }
  {$define STM32L4x2 }
  {$define STM32L46xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L462RE) }
  {$define STM32L4x2 }
  {$define STM32L46xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L462VEIx) }
  {$define STM32L4x2 }
  {$define STM32L46xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L462VE) }
  {$define STM32L4x2 }
  {$define STM32L46xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L471QEIx) or defined(STM32L471QGIx) }
  {$define STM32L4x1 }
  {$define STM32L47xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L471RE) or defined(STM32L471RG) }
  {$define STM32L4x1 }
  {$define STM32L47xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L471VE) or defined(STM32L471VG) }
  {$define STM32L4x1 }
  {$define STM32L47xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L471ZE) or defined(STM32L471ZG) }
  {$define STM32L4x1 }
  {$define STM32L47xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L475RC) or defined(STM32L475RE) or defined(STM32L475RG) }
  {$define STM32L4x5 }
  {$define STM32L47xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L475VC) or defined(STM32L475VE) or defined(STM32L475VG) }
  {$define STM32L4x5 }
  {$define STM32L47xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L476JE) or defined(STM32L476JG) }
  {$define STM32L4x6 }
  {$define STM32L47xx }
  {$define WLCSP72 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L476ME) or defined(STM32L476MG) }
  {$define STM32L4x6 }
  {$define STM32L47xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L476QEIx) or defined(STM32L476QGIx) }
  {$define STM32L4x6 }
  {$define STM32L47xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L476RC) or defined(STM32L476RE) or defined(STM32L476RG) }
  {$define STM32L4x6 }
  {$define STM32L47xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L476VC) or defined(STM32L476VE) or defined(STM32L476VG) }
  {$define STM32L4x6 }
  {$define STM32L47xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L476ZE) or defined(STM32L476ZG) }
  {$define STM32L4x6 }
  {$define STM32L47xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L485JC) or defined(STM32L485JE) }
  {$define STM32L4x5 }
  {$define STM32L48xx }
  {$define WLCSP72 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L486JG) }
  {$define STM32L4x6 }
  {$define STM32L48xx }
  {$define WLCSP72 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L486QGIx) }
  {$define STM32L4x6 }
  {$define STM32L48xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L486RG) }
  {$define STM32L4x6 }
  {$define STM32L48xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L486VG) }
  {$define STM32L4x6 }
  {$define STM32L48xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L486ZG) }
  {$define STM32L4x6 }
  {$define STM32L48xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4x1) or defined(STM32L4x2) or defined(STM32L4x3) or defined(STM32L4x5) or defined(STM32L4x6) }
  {$define CortexM4}
  {$define __CONTROLLERTYPE__:=STM32L4}
  {$define STM32L4}
  {$define STM32}
  {$ALIGN 2}
{$endif}
