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

{$if defined(nucleof401re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f401re}
{$endif}

{$if defined(nucleof411re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f411re}
{$endif}

{$if defined(nucleof446re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f446re}
{$endif}

{$if defined(nucleof410rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f410rb}
{$endif}

{$if defined(nucleof429zi) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f429zi}
{$endif}

{$if defined(nucleof446ze) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f446ze}
{$endif}

{$if defined(nucleof412zg) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f412zg}
{$endif}

{$if defined(nucleof413zh) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f413zh}
{$endif}

{$if defined(stm32f401cdiscovery) }
  {$define discovery}
  {$define stm32f401vc}
{$endif}

{$if defined(stm32f411ediscovery) }
  {$define discovery}
  {$define stm32f411ve}
{$endif}

{$if defined(stm32f407gdiscovery) }
  {$define discovery}
  {$define stm32f407vg}
{$endif}

{$if defined(stm32f429idiscovery) }
  {$define discovery}
  {$define stm32f429zi}
{$endif}

{$if defined(stm32f469idiscovery) }
  {$define discovery}
  {$define stm32f469ni}
{$endif}

{$if defined(stm32f412gdiscovery) }
  {$define discovery}
  {$define stm32f412zg}
{$endif}

{$if defined(stm32f413hdiscovery) }
  {$define discovery}
  {$define stm32f413zh}
{$endif}

{$if defined(STM32F401CB) or defined(STM32F401CC) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401CB) or defined(STM32F401CC) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401CD) or defined(STM32F401CE) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401CD) or defined(STM32F401CE) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401CC) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401RB) or defined(STM32F401RC) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401RD) or defined(STM32F401RE) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401VB) or defined(STM32F401VC) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401VB) or defined(STM32F401VC) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401VD) or defined(STM32F401VE) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F401VD) or defined(STM32F401VE) }
  {$define STM32F401 }
  {$define STM32F40xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F405OE) or defined(STM32F405OG) }
  {$define STM32F405_415 }
  {$define STM32F40xx }
  {$define WLCSP90 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F405RG) }
  {$define STM32F405_415 }
  {$define STM32F40xx }
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
{$if defined(STM32F405VG) }
  {$define STM32F405_415 }
  {$define STM32F40xx }
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
{$if defined(STM32F405ZG) }
  {$define STM32F405_415 }
  {$define STM32F40xx }
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
{$if defined(STM32F407IE) or defined(STM32F407IG) }
  {$define STM32F407_417 }
  {$define STM32F40xx }
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
{$if defined(STM32F407IE) or defined(STM32F407IG) }
  {$define STM32F407_417 }
  {$define STM32F40xx }
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
{$if defined(STM32F407VE) or defined(STM32F407VG) }
  {$define STM32F407_417 }
  {$define STM32F40xx }
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
{$if defined(STM32F407ZE) or defined(STM32F407ZG) }
  {$define STM32F407_417 }
  {$define STM32F40xx }
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
{$if defined(STM32F410C8) or defined(STM32F410CB) }
  {$define STM32F410 }
  {$define STM32F41xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim11 } {$define has_tim5 } {$define has_tim6 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F410C8) or defined(STM32F410CB) }
  {$define STM32F410 }
  {$define STM32F41xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim11 } {$define has_tim5 } {$define has_tim6 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F410R8) or defined(STM32F410RB) }
  {$define STM32F410 }
  {$define STM32F41xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim11 } {$define has_tim5 } {$define has_tim6 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F410R8) or defined(STM32F410RB) }
  {$define STM32F410 }
  {$define STM32F41xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim11 } {$define has_tim5 } {$define has_tim6 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F410T8) or defined(STM32F410TB) }
  {$define STM32F410 }
  {$define STM32F41xx }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim11 } {$define has_tim5 } {$define has_tim6 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F411CC) or defined(STM32F411CE) }
  {$define STM32F411 }
  {$define STM32F41xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F411CC) or defined(STM32F411CE) }
  {$define STM32F411 }
  {$define STM32F41xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F411RC) or defined(STM32F411RE) }
  {$define STM32F411 }
  {$define STM32F41xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F411VC) or defined(STM32F411VE) }
  {$define STM32F411 }
  {$define STM32F41xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F411VC) or defined(STM32F411VE) }
  {$define STM32F411 }
  {$define STM32F41xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim9 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F412CE) or defined(STM32F412CG) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F412RE) or defined(STM32F412RG) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F412RE) or defined(STM32F412RG) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F412REP) or defined(STM32F412RGP) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F412VE) or defined(STM32F412VG) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F412VE) or defined(STM32F412VG) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F412ZE) or defined(STM32F412ZG) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F412ZE) or defined(STM32F412ZG) }
  {$define STM32F412 }
  {$define STM32F41xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F413CG) or defined(STM32F413CH) }
  {$define STM32F413_423 }
  {$define STM32F41xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F413MG) or defined(STM32F413MH) }
  {$define STM32F413_423 }
  {$define STM32F41xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F413RG) or defined(STM32F413RH) }
  {$define STM32F413_423 }
  {$define STM32F41xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F413VG) or defined(STM32F413VH) }
  {$define STM32F413_423 }
  {$define STM32F41xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F413VG) or defined(STM32F413VH) }
  {$define STM32F413_423 }
  {$define STM32F41xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F413ZG) or defined(STM32F413ZH) }
  {$define STM32F413_423 }
  {$define STM32F41xx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F413ZG) or defined(STM32F413ZH) }
  {$define STM32F413_423 }
  {$define STM32F41xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F415OG) }
  {$define STM32F405_415 }
  {$define STM32F41xx }
  {$define WLCSP90 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F415RG) }
  {$define STM32F405_415 }
  {$define STM32F41xx }
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
{$if defined(STM32F415VG) }
  {$define STM32F405_415 }
  {$define STM32F41xx }
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
{$if defined(STM32F415ZG) }
  {$define STM32F405_415 }
  {$define STM32F41xx }
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
{$if defined(STM32F417IE) or defined(STM32F417IG) }
  {$define STM32F407_417 }
  {$define STM32F41xx }
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
{$if defined(STM32F417IE) or defined(STM32F417IG) }
  {$define STM32F407_417 }
  {$define STM32F41xx }
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
{$if defined(STM32F417VE) or defined(STM32F417VG) }
  {$define STM32F407_417 }
  {$define STM32F41xx }
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
{$if defined(STM32F417ZE) or defined(STM32F417ZG) }
  {$define STM32F407_417 }
  {$define STM32F41xx }
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
{$if defined(STM32F423CH) }
  {$define STM32F413_423 }
  {$define STM32F42xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F423MH) }
  {$define STM32F413_423 }
  {$define STM32F42xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F423RH) }
  {$define STM32F413_423 }
  {$define STM32F42xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F423VH) }
  {$define STM32F413_423 }
  {$define STM32F42xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F423VH) }
  {$define STM32F413_423 }
  {$define STM32F42xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F423ZH) }
  {$define STM32F413_423 }
  {$define STM32F42xx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F423ZH) }
  {$define STM32F413_423 }
  {$define STM32F42xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 } {$define has_uart9 } {$define has_uart10 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F427AG) or defined(STM32F427AI) }
  {$define STM32F427_437 }
  {$define STM32F42xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F427IG) or defined(STM32F427II) }
  {$define STM32F427_437 }
  {$define STM32F42xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F427IG) or defined(STM32F427II) }
  {$define STM32F427_437 }
  {$define STM32F42xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F427VG) or defined(STM32F427VI) }
  {$define STM32F427_437 }
  {$define STM32F42xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F427ZG) or defined(STM32F427ZI) }
  {$define STM32F427_437 }
  {$define STM32F42xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429AG) or defined(STM32F429AI) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429BE) or defined(STM32F429BG) or defined(STM32F429BI) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429IE) or defined(STM32F429IG) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429IE) or defined(STM32F429IG) or defined(STM32F429II) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429II) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429NE) or defined(STM32F429NG) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429NI) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429VE) or defined(STM32F429VG) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429VI) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429ZE) or defined(STM32F429ZG) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429ZG) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define WLCSP143 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429ZI) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F429ZI) }
  {$define STM32F429_439 }
  {$define STM32F42xx }
  {$define WLCSP143 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F437AI) }
  {$define STM32F427_437 }
  {$define STM32F43xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F437IG) or defined(STM32F437II) }
  {$define STM32F427_437 }
  {$define STM32F43xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F437IG) or defined(STM32F437II) }
  {$define STM32F427_437 }
  {$define STM32F43xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F437VG) or defined(STM32F437VI) }
  {$define STM32F427_437 }
  {$define STM32F43xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F437ZG) or defined(STM32F437ZI) }
  {$define STM32F427_437 }
  {$define STM32F43xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439AI) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439BG) or defined(STM32F439BI) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439IG) or defined(STM32F439II) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439IG) or defined(STM32F439II) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439NG) or defined(STM32F439NI) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439VG) or defined(STM32F439VI) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439ZG) or defined(STM32F439ZI) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F439ZG) or defined(STM32F439ZI) }
  {$define STM32F429_439 }
  {$define STM32F43xx }
  {$define WLCSP143 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F446MC) or defined(STM32F446ME) }
  {$define STM32F446 }
  {$define STM32F44xx }
  {$define WLCSP81 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F446RC) or defined(STM32F446RE) }
  {$define STM32F446 }
  {$define STM32F44xx }
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
{$if defined(STM32F446VC) or defined(STM32F446VE) }
  {$define STM32F446 }
  {$define STM32F44xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F446ZC) or defined(STM32F446ZE) }
  {$define STM32F446 }
  {$define STM32F44xx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F446ZC) or defined(STM32F446ZE) }
  {$define STM32F446 }
  {$define STM32F44xx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F446ZC) or defined(STM32F446ZE) }
  {$define STM32F446 }
  {$define STM32F44xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469AE) or defined(STM32F469AG) or defined(STM32F469AI) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469AE) or defined(STM32F469AG) or defined(STM32F469AI) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define WLCSP168 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469BE) or defined(STM32F469BG) or defined(STM32F469BI) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469IE) or defined(STM32F469IG) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469IE) or defined(STM32F469IG) or defined(STM32F469II) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469II) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469NE) or defined(STM32F469NG) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469NI) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469VE) or defined(STM32F469VG) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469VI) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469ZE) or defined(STM32F469ZG) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F469ZI) }
  {$define STM32F469_479 }
  {$define STM32F46xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479AG) or defined(STM32F479AI) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define UFBGA169 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479AG) or defined(STM32F479AI) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define WLCSP168 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479BG) or defined(STM32F479BI) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479IG) or defined(STM32F479II) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479IG) or defined(STM32F479II) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479NG) or defined(STM32F479NI) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479VG) or defined(STM32F479VI) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F479ZG) or defined(STM32F479ZI) }
  {$define STM32F469_479 }
  {$define STM32F47xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F401) or defined(STM32F405_415) or defined(STM32F407_417) or defined(STM32F410) or defined(STM32F411) or defined(STM32F412) or defined(STM32F413_423) or defined(STM32F427_437) or defined(STM32F429_439) or defined(STM32F446) or defined(STM32F469_479) }
  {$define CortexM4}
  {$define __CONTROLLERTYPE__:=STM32F4}
  {$define STM32F4}
  {$define STM32}
  {$ALIGN 2}
{$endif}
