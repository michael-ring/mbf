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

{$if defined(nucleof303k8) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32f303k8}
{$endif}

{$if defined(nucleof302r8) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f302r8}
{$endif}

{$if defined(nucleof303re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f303re}
{$endif}

{$if defined(nucleof334r8) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32f334r8}
{$endif}

{$if defined(nucleof303ze) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_ziopins}
  {$define stm32f303ze}
{$endif}

{$if defined(stm32f3discovery) }
  {$define discovery}
  {$define stm32f303vc}
{$endif}

{$if defined(stm32f3348discovery) }
  {$define discovery}
  {$define stm32f334c8}
{$endif}

{$if defined(STM32F301C6) or defined(STM32F301C8) }
  {$define STM32F301 }
  {$define STM32F30xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F301C8) }
  {$define STM32F301 }
  {$define STM32F30xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F301K6) or defined(STM32F301K8) }
  {$define STM32F301 }
  {$define STM32F30xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F301R6) or defined(STM32F301R8) }
  {$define STM32F301 }
  {$define STM32F30xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F302C6) or defined(STM32F302C8) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302CB) or defined(STM32F302CC) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302C8) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302K6) or defined(STM32F302K8) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302R6) or defined(STM32F302R8) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302RB) or defined(STM32F302RC) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302RD) or defined(STM32F302RE) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302VB) or defined(STM32F302VC) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302VD) or defined(STM32F302VE) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302VD) or defined(STM32F302VE) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F302ZD) or defined(STM32F302ZE) }
  {$define STM32F302 }
  {$define STM32F30xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303C6) or defined(STM32F303C8) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303CB) or defined(STM32F303CC) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303K6) or defined(STM32F303K8) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303R6) or defined(STM32F303R8) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303RB) or defined(STM32F303RC) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303RD) or defined(STM32F303RE) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303VB) or defined(STM32F303VC) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303VD) or defined(STM32F303VE) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303VD) or defined(STM32F303VE) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303VC) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303VE) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define WLCSP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F303ZD) or defined(STM32F303ZE) }
  {$define STM32F303 }
  {$define STM32F30xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F318C8) }
  {$define STM32F3x8 }
  {$define STM32F31xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F318C8) }
  {$define STM32F3x8 }
  {$define STM32F31xx }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F318K8) }
  {$define STM32F3x8 }
  {$define STM32F31xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32F328C8) }
  {$define STM32F3x8 }
  {$define STM32F32xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F334C4) or defined(STM32F334C6) or defined(STM32F334C8) }
  {$define STM32F334 }
  {$define STM32F33xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F334K4) or defined(STM32F334K6) or defined(STM32F334K8) }
  {$define STM32F334 }
  {$define STM32F33xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F334R6) or defined(STM32F334R8) }
  {$define STM32F334 }
  {$define STM32F33xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_hrtim1 } {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F358CC) }
  {$define STM32F3x8 }
  {$define STM32F35xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F358RC) }
  {$define STM32F3x8 }
  {$define STM32F35xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F358VC) }
  {$define STM32F3x8 }
  {$define STM32F35xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F373C8) or defined(STM32F373CB) or defined(STM32F373CC) }
  {$define STM32F373 }
  {$define STM32F37xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F373R8) or defined(STM32F373RB) or defined(STM32F373RC) }
  {$define STM32F373 }
  {$define STM32F37xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F373V8) or defined(STM32F373VB) or defined(STM32F373VC) }
  {$define STM32F373 }
  {$define STM32F37xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F373V8) or defined(STM32F373VB) or defined(STM32F373VC) }
  {$define STM32F373 }
  {$define STM32F37xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F378CC) }
  {$define STM32F3x8 }
  {$define STM32F37xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F378RC) }
  {$define STM32F3x8 }
  {$define STM32F37xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F378RC) }
  {$define STM32F3x8 }
  {$define STM32F37xx }
  {$define WLCSP66 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F378VC) }
  {$define STM32F3x8 }
  {$define STM32F37xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim12 } {$define has_tim13 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim18 } {$define has_tim19 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 }
  {$define has_dac1 } {$define has_dac2 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F398VE) }
  {$define STM32F3x8 }
  {$define STM32F39xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 } {$define has_spi4 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim20 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim8 }
  {$define has_adc1 } {$define has_adc2 } {$define has_adc3 } {$define has_adc4 }
  {$define has_dac1 }
  {$define has_can1 }
  {$define has_rtc }
{$endif}
{$if defined(STM32F301) or defined(STM32F302) or defined(STM32F303) or defined(STM32F334) or defined(STM32F373) or defined(STM32F3x8) }
  {$define CortexM4}
  {$define __CONTROLLERTYPE__:=STM32F3}
  {$define STM32F3}
  {$define STM32}
  {$ALIGN 2}
{$endif}
