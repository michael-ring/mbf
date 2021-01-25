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

{$if defined(fpc_mcu_nucleol432kc) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32l432kc}
{$endif}

{$if defined(fpc_mcu_nucleol412kb) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32l412kb}
{$endif}

{$if defined(fpc_mcu_nucleol476rg) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l476rg}
{$endif}

{$if defined(fpc_mcu_nucleol452re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l452re}
{$endif}

{$if defined(fpc_mcu_nucleol452rep) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l452ret}
{$endif}

{$if defined(fpc_mcu_nucleol433rcp) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l433rct}
{$endif}

{$if defined(fpc_mcu_nucleol412rbp) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l412rbt}
{$endif}

{$if defined(fpc_mcu_nucleol496zg) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32l496zg}
{$endif}

{$if defined(fpc_mcu_nucleol496zgp) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32l496zgt}
{$endif}

{$if defined(fpc_mcu_nucleol4r5zi) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32l4r5zi}
{$endif}

{$if defined(fpc_mcu_nucleol4r5zip) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32l4r5zit}
{$endif}

{$if defined(fpc_mcu_stm32l476gdiscovery) }
  {$define discovery}
  {$define stm32l476vg}
{$endif}

{$if defined(fpc_mcu_stm32l496gdiscovery) }
  {$define discovery}
  {$define stm32l496ag}
{$endif}

{$if defined(fpc_mcu_bl475eiot01a1) }
  {$define discovery}
  {$define stm32l475vg}
{$endif}

{$if defined(fpc_mcu_stm32l4r9idiscovery) }
  {$define discovery}
  {$define stm32l4r9ai}
{$endif}

{$if defined(STM32L412C8) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412C8) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412CB) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412CBP) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412CB) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412CBP) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412K8) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412K8) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412KB) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412KB) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412R8) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412R8) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412RB) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412RBP) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412RB) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412RBP) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412T8) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412TB) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L412TBP) }
  {$define STM32L4x2 }
  {$define STM32L41xx }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L422CB) }
  {$define STM32L4x2 }
  {$define STM32L42xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L422CB) }
  {$define STM32L4x2 }
  {$define STM32L42xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L422KB) }
  {$define STM32L4x2 }
  {$define STM32L42xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L422KB) }
  {$define STM32L4x2 }
  {$define STM32L42xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L422RB) }
  {$define STM32L4x2 }
  {$define STM32L42xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L422RB) }
  {$define STM32L4x2 }
  {$define STM32L42xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L422TB) }
  {$define STM32L4x2 }
  {$define STM32L42xx }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  
  
  {$define has_rtc }
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
{$if defined(STM32L431RB) or defined(STM32L431RC) }
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
{$if defined(STM32L431VC) }
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
{$if defined(STM32L433RB) or defined(STM32L433RC) }
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
{$if defined(STM32L433RCP) }
  {$define STM32L4x3 }
  {$define STM32L43xx }
  {$define LQFP64 }
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
{$if defined(STM32L433VC) }
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
{$if defined(STM32L443RC) }
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
{$if defined(STM32L443VC) }
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
{$if defined(STM32L451RC) or defined(STM32L451RE) }
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
{$if defined(STM32L451VC) or defined(STM32L451VE) }
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
{$if defined(STM32L452RC) or defined(STM32L452RE) }
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
{$if defined(STM32L452REP) }
  {$define STM32L4x2 }
  {$define STM32L45xx }
  {$define LQFP64 }
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
{$if defined(STM32L452VC) or defined(STM32L452VE) }
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
{$if defined(STM32L462RE) }
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
{$if defined(STM32L462VE) }
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
{$if defined(STM32L471QE) or defined(STM32L471QG) }
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
  {$define UFBGA144 }
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
{$if defined(STM32L476JGP) }
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
{$if defined(STM32L476QE) or defined(STM32L476QG) }
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
{$if defined(STM32L476ZG) }
  {$define STM32L4x6 }
  {$define STM32L47xx }
  {$define UFBGA144 }
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
{$if defined(STM32L476ZGP) }
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
{$if defined(STM32L486QG) }
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
{$if defined(STM32L496AE) or defined(STM32L496AG) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496AGP) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496QE) or defined(STM32L496QG) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496QGP) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496RE) or defined(STM32L496RG) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496RGP) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496VE) or defined(STM32L496VG) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496VG) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496VGP) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496ZE) or defined(STM32L496ZG) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L496ZGP) }
  {$define STM32L4x6 }
  {$define STM32L49xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6AG) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6AGP) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6QG) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6QGP) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6RG) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6RGP) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6VG) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6VG) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6VGP) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6ZG) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4A6ZGP) }
  {$define STM32L4x6 }
  {$define STM32L4Axx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R5AG) or defined(STM32L4R5AI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Rxx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R5QG) or defined(STM32L4R5QI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Rxx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R5VG) or defined(STM32L4R5VI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Rxx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R5ZG) or defined(STM32L4R5ZI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Rxx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R5ZG) or defined(STM32L4R5ZI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Rxx }
  {$define WLCSP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R5ZIP) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Rxx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R7AI) }
  {$define STM32L4R7_S7 }
  {$define STM32L4Rxx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R7VI) }
  {$define STM32L4R7_S7 }
  {$define STM32L4Rxx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R7ZI) }
  {$define STM32L4R7_S7 }
  {$define STM32L4Rxx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R9AG) or defined(STM32L4R9AI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Rxx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R9VG) or defined(STM32L4R9VI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Rxx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R9ZG) or defined(STM32L4R9ZI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Rxx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R9ZG) or defined(STM32L4R9ZI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Rxx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R9ZG) or defined(STM32L4R9ZI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Rxx }
  {$define WLCSP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S5AI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Sxx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S5QI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Sxx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S5VI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Sxx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S5ZI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Sxx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S5ZI) }
  {$define STM32L4R5_S5 }
  {$define STM32L4Sxx }
  {$define WLCSP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S7AI) }
  {$define STM32L4R7_S7 }
  {$define STM32L4Sxx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S7VI) }
  {$define STM32L4R7_S7 }
  {$define STM32L4Sxx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S7ZI) }
  {$define STM32L4R7_S7 }
  {$define STM32L4Sxx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S9AI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Sxx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S9VI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Sxx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S9ZI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Sxx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S9ZI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Sxx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4S9ZI) }
  {$define STM32L4R9_S9 }
  {$define STM32L4Sxx }
  {$define WLCSP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart1 } {$define has_uart4 } {$define has_uart5 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32L4R5_S5) or defined(STM32L4R7_S7) or defined(STM32L4R9_S9) or defined(STM32L4x1) or defined(STM32L4x2) or defined(STM32L4x3) or defined(STM32L4x5) or defined(STM32L4x6) }
  {$define CortexM4}
  {$define __CONTROLLERTYPE__:=STM32L4}
  {$define STM32L4}
  {$define STM32}
  {$ALIGN 2}
{$endif}
