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

{$if defined(fpc_mcu_nucleog031k8) }
  {$define nucleo}
  {$define has_arduinominipins}
  {$define stm32g031k8}
{$endif}

{$if defined(fpc_mcu_nucleog071rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32g071rb}
{$endif}

{$if defined(fpc_mcu_nucleog070rb) }
  {$define nucleo}
  {$define has_arduinopins}
  {$define has_morphopins}
  {$define stm32g070rb}
{$endif}

{$if defined(fpc_mcu_stm32g071bdiscovery) }
  {$define discovery}
  {$define stm32g071rb}
{$endif}

{$if defined(fpc_mcu_stm32g0316discovery) }
  {$define discovery}
  {$define stm32g031j6}
{$endif}

{$if defined(STM32G030C6) or defined(STM32G030C8) }
  {$define STM32G0x0 }
  {$define STM32G03xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G030F6) }
  {$define STM32G0x0 }
  {$define STM32G03xx }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G030J6) }
  {$define STM32G0x0 }
  {$define STM32G03xx }
  {$define SO8N }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G030K6) or defined(STM32G030K8) }
  {$define STM32G0x0 }
  {$define STM32G03xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031C4) or defined(STM32G031C6) or defined(STM32G031C8) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031C4) or defined(STM32G031C6) or defined(STM32G031C8) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031F4) or defined(STM32G031F6) or defined(STM32G031F8) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031G4) or defined(STM32G031G6) or defined(STM32G031G8) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031J4) or defined(STM32G031J6) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define SO8N }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031K4) or defined(STM32G031K6) or defined(STM32G031K8) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031K4) or defined(STM32G031K6) or defined(STM32G031K8) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G031Y8) }
  {$define STM32G0x1 }
  {$define STM32G03xx }
  {$define WLCSP18 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041C6) or defined(STM32G041C8) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041C6) or defined(STM32G041C8) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041F6) or defined(STM32G041F8) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define TSSOP20 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041G6) or defined(STM32G041G8) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041J6) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define SO8N }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041K6) or defined(STM32G041K8) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041K6) or defined(STM32G041K8) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G041Y8) }
  {$define STM32G0x1 }
  {$define STM32G04xx }
  {$define WLCSP18 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G070CB) }
  {$define STM32G0x0 }
  {$define STM32G07xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G070KB) }
  {$define STM32G0x0 }
  {$define STM32G07xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G070RB) }
  {$define STM32G0x0 }
  {$define STM32G07xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071C6) or defined(STM32G071C8) or defined(STM32G071CB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071C6) or defined(STM32G071C8) or defined(STM32G071CB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071EB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define WLCSP25 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071G6) or defined(STM32G071G8) or defined(STM32G071GB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071G8N) or defined(STM32G071GBN) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071K6) or defined(STM32G071K8) or defined(STM32G071KB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071K6) or defined(STM32G071K8) or defined(STM32G071KB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071K8N) or defined(STM32G071KBN) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071K8N) or defined(STM32G071KBN) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071R6) or defined(STM32G071R8) or defined(STM32G071RB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G071RB) }
  {$define STM32G0x1 }
  {$define STM32G07xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081CB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define LQFP48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081CB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define UFQFPN48 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081EB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define WLCSP25 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081GB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081GBN) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define UFQFPN28 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081KB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081KBN) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define LQFP32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081KB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081KBN) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define UFQFPN32 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081RB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define UFBGA64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G081RB) }
  {$define STM32G0x1 }
  {$define STM32G08xx }
  {$define LQFP64 }
  {$define has_gpioa } {$define has_gpiob } {$define has_gpioc } {$define has_gpiod } {$define has_gpiof }
  {$define has_usart1 } {$define has_usart2 } {$define has_usart3 } {$define has_usart4 } {$define has_uart1 } {$define has_lpuart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_irtim } {$define has_lptim1 } {$define has_lptim2 } {$define has_tim1 } {$define has_tim14 } {$define has_tim15 } {$define has_tim16 } {$define has_tim17 } {$define has_tim2 } {$define has_tim3 } {$define has_tim6 } {$define has_tim7 }
  {$define has_adc1 }
  {$define has_dac1 }
  
  {$define has_rtc }
{$endif}
{$if defined(STM32G0x0 ) or defined(STM32G0x1) }
  {$define CortexM0}
  {$define __CONTROLLERTYPE__:=STM32G0}
  {$define STM32G0}
  {$define STM32}
  {$ALIGN 2}
{$endif}
