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

{$if defined(nucleof746zg) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f746zg}
{$endif}

{$if defined(nucleof767zi) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f767zi}
{$endif}

{$if defined(nucleof722ze) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f722ze}
{$endif}

{$if defined(stm32f746gdiscovery) }
  {$define discovery}
  {$define stm32f746ng}
{$endif}

{$if defined(stm32f769idiscovery) }
  {$define discovery}
  {$define stm32f769ni}
{$endif}

{$if defined(stm32f769idiscovery) }
  {$define discovery}
  {$define stm32f769ni}
{$endif}

{$if defined(stm32f723ediscovery) }
  {$define discovery}
  {$define stm32f723ie}
{$endif}

{$if defined(STM32F722ICKx) or defined(STM32F722IEKx) }
  {$define STM32F7x2 }
  {$define STM32F72xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F722IC) or defined(STM32F722IE) }
  {$define STM32F7x2 }
  {$define STM32F72xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F722RC) or defined(STM32F722RE) }
  {$define STM32F7x2 }
  {$define STM32F72xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F722VC) or defined(STM32F722VE) }
  {$define STM32F7x2 }
  {$define STM32F72xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F722ZC) or defined(STM32F722ZE) }
  {$define STM32F7x2 }
  {$define STM32F72xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F723ICKx) or defined(STM32F723IEKx) }
  {$define STM32F7x3 }
  {$define STM32F72xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F723IC) or defined(STM32F723IE) }
  {$define STM32F7x3 }
  {$define STM32F72xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F723VC) or defined(STM32F723VE) }
  {$define STM32F7x3 }
  {$define STM32F72xx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F723ZCIx) or defined(STM32F723ZEIx) }
  {$define STM32F7x3 }
  {$define STM32F72xx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F723ZC) or defined(STM32F723ZE) }
  {$define STM32F7x3 }
  {$define STM32F72xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F732IEKx) }
  {$define STM32F7x2 }
  {$define STM32F73xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F732IE) }
  {$define STM32F7x2 }
  {$define STM32F73xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F732RE) }
  {$define STM32F7x2 }
  {$define STM32F73xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F732VE) }
  {$define STM32F7x2 }
  {$define STM32F73xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F732ZE) }
  {$define STM32F7x2 }
  {$define STM32F73xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F733IEKx) }
  {$define STM32F7x3 }
  {$define STM32F73xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F733IE) }
  {$define STM32F7x3 }
  {$define STM32F73xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F733VE) }
  {$define STM32F7x3 }
  {$define STM32F73xx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F733ZEIx) }
  {$define STM32F7x3 }
  {$define STM32F73xx }
  {$define UFBGA144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F733ZE) }
  {$define STM32F7x3 }
  {$define STM32F73xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F745IEKx) or defined(STM32F745IGKx) }
  {$define STM32F7x5 }
  {$define STM32F74xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F745IE) or defined(STM32F745IG) }
  {$define STM32F7x5 }
  {$define STM32F74xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F745VE) or defined(STM32F745VG) }
  {$define STM32F7x5 }
  {$define STM32F74xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F745VE) or defined(STM32F745VG) }
  {$define STM32F7x5 }
  {$define STM32F74xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F745ZE) or defined(STM32F745ZG) }
  {$define STM32F7x5 }
  {$define STM32F74xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746BE) or defined(STM32F746BG) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746IEKx) or defined(STM32F746IGKx) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746IE) or defined(STM32F746IG) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746NE) or defined(STM32F746NG) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746VE) or defined(STM32F746VG) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746VE) or defined(STM32F746VG) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746ZE) or defined(STM32F746ZG) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F746ZE) or defined(STM32F746ZG) }
  {$define STM32F7x6 }
  {$define STM32F74xx }
  {$define WLCSP143 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756BG) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756IGKx) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756IG) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756NG) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756VG) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define TFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756VG) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756ZG) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F756ZG) }
  {$define STM32F7x6 }
  {$define STM32F75xx }
  {$define WLCSP143 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F765BG) or defined(STM32F765BI) }
  {$define STM32F7x5 }
  {$define STM32F76xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F765IGKx) or defined(STM32F765IIKx) }
  {$define STM32F7x5 }
  {$define STM32F76xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F765IG) or defined(STM32F765II) }
  {$define STM32F7x5 }
  {$define STM32F76xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F765NG) or defined(STM32F765NI) }
  {$define STM32F7x5 }
  {$define STM32F76xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F765VG) or defined(STM32F765VI) }
  {$define STM32F7x5 }
  {$define STM32F76xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F765ZG) or defined(STM32F765ZI) }
  {$define STM32F7x5 }
  {$define STM32F76xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F767BG) or defined(STM32F767BI) }
  {$define STM32F7x7 }
  {$define STM32F76xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F767IGKx) or defined(STM32F767IIKx) }
  {$define STM32F7x7 }
  {$define STM32F76xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F767IG) or defined(STM32F767II) }
  {$define STM32F7x7 }
  {$define STM32F76xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F767NG) or defined(STM32F767NI) }
  {$define STM32F7x7 }
  {$define STM32F76xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F767VG) or defined(STM32F767VI) }
  {$define STM32F7x7 }
  {$define STM32F76xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F767ZG) or defined(STM32F767ZI) }
  {$define STM32F7x7 }
  {$define STM32F76xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F768AI) }
  {$define STM32F7x8 }
  {$define STM32F76xx }
  {$define WLCSP180 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F769AG) or defined(STM32F769AI) }
  {$define STM32F7x9 }
  {$define STM32F76xx }
  {$define WLCSP180 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F769BG) or defined(STM32F769BI) }
  {$define STM32F7x9 }
  {$define STM32F76xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F769IG) or defined(STM32F769II) }
  {$define STM32F7x9 }
  {$define STM32F76xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F769NG) or defined(STM32F769NI) }
  {$define STM32F7x9 }
  {$define STM32F76xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F777BI) }
  {$define STM32F7x7 }
  {$define STM32F77xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F777IIKx) }
  {$define STM32F7x7 }
  {$define STM32F77xx }
  {$define UFBGA176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F777II) }
  {$define STM32F7x7 }
  {$define STM32F77xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F777NI) }
  {$define STM32F7x7 }
  {$define STM32F77xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F777VI) }
  {$define STM32F7x7 }
  {$define STM32F77xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F777ZI) }
  {$define STM32F7x7 }
  {$define STM32F77xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F778AI) }
  {$define STM32F7x8 }
  {$define STM32F77xx }
  {$define WLCSP180 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F779AI) }
  {$define STM32F7x9 }
  {$define STM32F77xx }
  {$define WLCSP180 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F779BI) }
  {$define STM32F7x9 }
  {$define STM32F77xx }
  {$define LQFP208 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F779II) }
  {$define STM32F7x9 }
  {$define STM32F77xx }
  {$define LQFP176 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F779NI) }
  {$define STM32F7x9 }
  {$define STM32F77xx }
  {$define TFBGA216 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh } {$define has_gpioi } {$define has_gpioj } {$define has_gpiok }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart6 } {$define has_uart4 } {$define has_uart5 } {$define has_uart7 } {$define has_uart8 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 } {$define has_spi5 } {$define has_spi6 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 } {$define has_i2c4 }
  {$define has_lptim1 } {$define has_tim1 } {$define has_tim10 } {$define has_tim11 } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 } {$define has_tim9 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 }
  {$define has_can1 } {$define has_can2 } {$define has_can3 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F7x2) or defined(STM32F7x3) or defined(STM32F7x5) or defined(STM32F7x6) or defined(STM32F7x7) or defined(STM32F7x8) or defined(STM32F7x9) }
  {$define CortexM7}
  {$define __CONTROLLERTYPE__:=STM32F7}
  {$define STM32F7}
  {$define STM32}
  {$ALIGN 2}
{$endif}
