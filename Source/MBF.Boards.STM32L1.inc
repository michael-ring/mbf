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

{$if defined(nucleol152re) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l152re}
{$endif}

{$if defined(stm32l100cdiscovery) }
  {$define discovery}
  {$define stm32l100rc}
{$endif}

{$if defined(stm32ldiscovery) }
  {$define discovery}
  {$define stm32l152rb}
{$endif}

{$if defined(stm32l152cdiscovery) }
  {$define discovery}
  {$define stm32l152rc}
{$endif}

{$if defined(STM32L100C6) }
  {$define STM32L100 }
  {$define STM32L10xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L100C6A) }
  {$define STM32L100 }
  {$define STM32L10xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L100R8) or defined(STM32L100RB) }
  {$define STM32L100 }
  {$define STM32L10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L100R8A) or defined(STM32L100RBA) }
  {$define STM32L100 }
  {$define STM32L10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L100RC) }
  {$define STM32L100 }
  {$define STM32L10xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151C6) or defined(STM32L151C8) or defined(STM32L151CB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151C6A) or defined(STM32L151C8A) or defined(STM32L151CBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151C6) or defined(STM32L151C8) or defined(STM32L151CB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151C6A) or defined(STM32L151C8A) or defined(STM32L151CBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151CC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151CC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151QC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151QD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151QE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151R6) or defined(STM32L151R8) or defined(STM32L151RB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151R6A) or defined(STM32L151R8A) or defined(STM32L151RBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151R6) or defined(STM32L151R8) or defined(STM32L151RB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151R6A) or defined(STM32L151R8A) or defined(STM32L151RBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151RC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151RCA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151RC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151RD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151RD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151RE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151UC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define WLCSP63 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151V8) or defined(STM32L151VB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151V8A) or defined(STM32L151VBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151V8) or defined(STM32L151VB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151V8A) or defined(STM32L151VBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151VC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151VC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151VCA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151VD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151VDX) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define WLCSP104 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151VE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151VE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define WLCSP104 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151ZC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151ZD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L151ZE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152C6) or defined(STM32L152C8) or defined(STM32L152CB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152C6A) or defined(STM32L152C8A) or defined(STM32L152CBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152C6) or defined(STM32L152C8) or defined(STM32L152CB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152C6A) or defined(STM32L152C8A) or defined(STM32L152CBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152CC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152CC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152QC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152QD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152QE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152R6) or defined(STM32L152R8) or defined(STM32L152RB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152R6A) or defined(STM32L152R8A) or defined(STM32L152RBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152R6) or defined(STM32L152R8) or defined(STM32L152RB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152R6A) or defined(STM32L152R8A) or defined(STM32L152RBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152RC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152RCA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152RD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152RD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152RE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152V8) or defined(STM32L152VB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152V8A) or defined(STM32L152VBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152V8) or defined(STM32L152VB) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152V8A) or defined(STM32L152VBA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152VC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152VC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152VCA) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152VD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152VDX) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152VE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152VE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define WLCSP104 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152ZC) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152ZD) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L152ZE) }
  {$define STM32L151_152 }
  {$define STM32L15xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162QD) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define UFBGA132 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162RC) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162RCA) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162RD) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162RD) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define WLCSP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162RE) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162VC) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162VC) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162VCA) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162VD) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162VDX) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define WLCSP104 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162VE) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162VE) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define WLCSP104 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162ZD) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L162ZE) }
  {$define STM32L162 }
  {$define STM32L16xx }
  {$define LQFP144 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpiof } {$define has_gpiog } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_uart4 } {$define has_uart5 }
  {$define has_spi1 } {$define has_spi2 } {$define has_spi3 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_tim10 } {$define has_tim11 } {$define has_tim2 } {$define has_tim3 } {$define has_tim4 } {$define has_tim5 } {$define has_tim6 } {$define has_tim7 } {$define has_tim9 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L100 ) or defined(STM32L151_152) or defined(STM32L162) }
  {$define CortexM4}
  {$define __CONTROLLERTYPE__:=STM32L1}
  {$define STM32L1}
  {$define STM32}
  {$ALIGN 2}
{$endif}
