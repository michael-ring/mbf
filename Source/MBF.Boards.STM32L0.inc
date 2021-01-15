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

{$if defined(nucleol031k6) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32l031k6}
{$endif}

{$if defined(nucleol011k4) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32l011k4}
{$endif}

{$if defined(nucleol053r8) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l053r8}
{$endif}

{$if defined(nucleol073rz) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l073rz}
{$endif}

{$if defined(nucleol010rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32l010rb}
{$endif}

{$if defined(stm32l0538discovery) }
  {$define discovery}
  {$define stm32l053c8}
{$endif}

{$if defined(bl072zlrwan1) }
  {$define discovery}
  {$define stm32l072cz}
{$endif}

{$if defined(STM32L010C6) }
  {$define STM32L0x0 }
  {$define STM32L01x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L010F4) }
  {$define STM32L0x0 }
  {$define STM32L01x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L010K4) }
  {$define STM32L0x0 }
  {$define STM32L01x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L010K8) }
  {$define STM32L0x0 }
  {$define STM32L01x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L010R8) }
  {$define STM32L0x0 }
  {$define STM32L01x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L010RB) }
  {$define STM32L0x0 }
  {$define STM32L01x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L011D3) or defined(STM32L011D4) }
  {$define STM32L0x1 }
  {$define STM32L01x }
  {$define TSSOP14 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L011E3) or defined(STM32L011E4) }
  {$define STM32L0x1 }
  {$define STM32L01x }
  {$define WLCSP25 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L011F3) or defined(STM32L011F4) }
  {$define STM32L0x1 }
  {$define STM32L01x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L011F3) or defined(STM32L011F4) }
  {$define STM32L0x1 }
  {$define STM32L01x }
  {$define UFQFPN20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L011G3) or defined(STM32L011G4) }
  {$define STM32L0x1 }
  {$define STM32L01x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L011K3) or defined(STM32L011K4) }
  {$define STM32L0x1 }
  {$define STM32L01x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L011K3) or defined(STM32L011K4) }
  {$define STM32L0x1 }
  {$define STM32L01x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L021D4) }
  {$define STM32L0x1 }
  {$define STM32L02x }
  {$define TSSOP14 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L021F4) }
  {$define STM32L0x1 }
  {$define STM32L02x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L021F4) }
  {$define STM32L0x1 }
  {$define STM32L02x }
  {$define UFQFPN20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L021G4) }
  {$define STM32L0x1 }
  {$define STM32L02x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L021K4) }
  {$define STM32L0x1 }
  {$define STM32L02x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L021K4) }
  {$define STM32L0x1 }
  {$define STM32L02x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031C4) or defined(STM32L031C6) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031C6) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031E4) or defined(STM32L031E6) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define WLCSP25 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031F4) or defined(STM32L031F6) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031G4) or defined(STM32L031G6) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031G6S) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031K4) or defined(STM32L031K6) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L031K4) or defined(STM32L031K6) }
  {$define STM32L0x1 }
  {$define STM32L03x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L041C4) or defined(STM32L041C6) }
  {$define STM32L0x1 }
  {$define STM32L04x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L041E6) }
  {$define STM32L0x1 }
  {$define STM32L04x }
  {$define WLCSP25 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L041F6) }
  {$define STM32L0x1 }
  {$define STM32L04x }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L041G6) }
  {$define STM32L0x1 }
  {$define STM32L04x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L041G6S) }
  {$define STM32L0x1 }
  {$define STM32L04x }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L041K6) }
  {$define STM32L0x1 }
  {$define STM32L04x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L041K6) }
  {$define STM32L0x1 }
  {$define STM32L04x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L051C6) or defined(STM32L051C8) }
  {$define STM32L0x1 }
  {$define STM32L05x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L051K6) or defined(STM32L051K8) }
  {$define STM32L0x1 }
  {$define STM32L05x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L051K6) or defined(STM32L051K8) }
  {$define STM32L0x1 }
  {$define STM32L05x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L051R6) or defined(STM32L051R8) }
  {$define STM32L0x1 }
  {$define STM32L05x }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L051R6) or defined(STM32L051R8) }
  {$define STM32L0x1 }
  {$define STM32L05x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L051T6) or defined(STM32L051T8) }
  {$define STM32L0x1 }
  {$define STM32L05x }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L052C6) or defined(STM32L052C8) }
  {$define STM32L0x2 }
  {$define STM32L05x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L052K6) or defined(STM32L052K8) }
  {$define STM32L0x2 }
  {$define STM32L05x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L052K6) or defined(STM32L052K8) }
  {$define STM32L0x2 }
  {$define STM32L05x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L052R6) or defined(STM32L052R8) }
  {$define STM32L0x2 }
  {$define STM32L05x }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L052R6) or defined(STM32L052R8) }
  {$define STM32L0x2 }
  {$define STM32L05x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L052T6) or defined(STM32L052T8) }
  {$define STM32L0x2 }
  {$define STM32L05x }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L052T8) }
  {$define STM32L0x2 }
  {$define STM32L05x }
  {$define WLCSP36 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L053C6) or defined(STM32L053C8) }
  {$define STM32L0x3 }
  {$define STM32L05x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L053R6) or defined(STM32L053R8) }
  {$define STM32L0x3 }
  {$define STM32L05x }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L053R6) or defined(STM32L053R8) }
  {$define STM32L0x3 }
  {$define STM32L05x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L062K8) }
  {$define STM32L0x2 }
  {$define STM32L06x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L062K8) }
  {$define STM32L0x2 }
  {$define STM32L06x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 }
  {$define has_i2c1 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L063C8) }
  {$define STM32L0x3 }
  {$define STM32L06x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L063R8) }
  {$define STM32L0x3 }
  {$define STM32L06x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim6 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071CB) or defined(STM32L071CZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071CB) or defined(STM32L071CZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071C8) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071KB) or defined(STM32L071KZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071KB) or defined(STM32L071KZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071K8) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071RB) or defined(STM32L071RZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071RB) or defined(STM32L071RZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071VB) or defined(STM32L071VZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071VB) or defined(STM32L071VZ) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071V8) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L071V8) }
  {$define STM32L0x1 }
  {$define STM32L07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072CB) or defined(STM32L072CZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072CB) or defined(STM32L072CZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072CZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define EWLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072KB) or defined(STM32L072KZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072KB) or defined(STM32L072KZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072RB) or defined(STM32L072RZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072RB) or defined(STM32L072RZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072RB) or defined(STM32L072RZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072VB) or defined(STM32L072VZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072VB) or defined(STM32L072VZ) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072V8) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L072V8) }
  {$define STM32L0x2 }
  {$define STM32L07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073CB) or defined(STM32L073CZ) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073RB) or defined(STM32L073RZ) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073RB) or defined(STM32L073RZ) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073RZ) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073VB) or defined(STM32L073VZ) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073VB) or defined(STM32L073VZ) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073V8) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L073V8) }
  {$define STM32L0x3 }
  {$define STM32L07x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L081CB) or defined(STM32L081CZ) }
  {$define STM32L0x1 }
  {$define STM32L08x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L081KZ) }
  {$define STM32L0x1 }
  {$define STM32L08x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L081KZ) }
  {$define STM32L0x1 }
  {$define STM32L08x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L082CZ) }
  {$define STM32L0x2 }
  {$define STM32L08x }
  {$define WLCSP49 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L082KB) or defined(STM32L082KZ) }
  {$define STM32L0x2 }
  {$define STM32L08x }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L082KB) or defined(STM32L082KZ) }
  {$define STM32L0x2 }
  {$define STM32L08x }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 }
  {$define has_i2c1 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L083CB) or defined(STM32L083CZ) }
  {$define STM32L0x3 }
  {$define STM32L08x }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L083RB) or defined(STM32L083RZ) }
  {$define STM32L0x3 }
  {$define STM32L08x }
  {$define TFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L083RB) or defined(STM32L083RZ) }
  {$define STM32L0x3 }
  {$define STM32L08x }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L083VB) or defined(STM32L083VZ) }
  {$define STM32L0x3 }
  {$define STM32L08x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L083VB) or defined(STM32L083VZ) }
  {$define STM32L0x3 }
  {$define STM32L08x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L083V8) }
  {$define STM32L0x3 }
  {$define STM32L08x }
  {$define UFBGA100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L083V8) }
  {$define STM32L0x3 }
  {$define STM32L08x }
  {$define LQFP100 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpioe } {$define has_gpioh }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart4 } {$define has_usart5 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 } {$define has_i2c3 }
  {$define has_lptim1 } {$define has_tim2 } {$define has_tim21 } {$define has_tim22 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32L0x0 ) or defined(STM32L0x1) or defined(STM32L0x2) or defined(STM32L0x3) }
  {$define CortexM0}
  {$define __CONTROLLERTYPE__:=STM32L0}
  {$define STM32L0}
  {$define STM32}
  {$ALIGN 2}
{$endif}
