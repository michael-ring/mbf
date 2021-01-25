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
{$DEFINE MBF_BOARDS_NRF51_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(fpc_mcu_bbcmicrobit) }
  {$define microbit}
  {$define has_microbitpins}
  {$define nRF51822_XXAA}
{$endif}

{$if defined(fpc_mcu_nrf51dk) }
  {$define has_arduinopins}
  {$define nRF51822_XXAA}
{$endif}

{$if defined(fpc_mcu_nrf51dongle) }
  {$define nRF51822_XXAA}
{$endif}

{$if defined(nRF51422_XXAA) or defined(nRF51422_XXAB) or defined(nRF51422_XXAC) }
  {$define nRF51422 }
  {$define QFN48 }
  {$define has_gpioa }
  {$define has_usart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_adc1 }

  {$define has_rtc }
{$endif}

{$if defined(nRF51802_XXAA) }
  {$define nRF51802 }
  {$define QFN48 }
  {$define has_gpioa }
  {$define has_usart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_adc1 }

  {$define has_rtc }
{$endif}

{$if defined(nRF51822_XXAA) or defined(nRF51822_XXAB) or defined(nRF51822_XXAC) }
  {$define nRF51822 }
  {$define QFN48 }
  {$define has_gpioa }
  {$define has_usart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_adc1 }

  {$define has_rtc }
{$endif}

{$if defined(nRF51824_XXAA) }
  {$define nRF51824 }
  {$define QFN48 }
  {$define has_gpioa }
  {$define has_usart1 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_adc1 }

  {$define has_rtc }
{$endif}

{$if defined(nRF51422) or defined(nRF51802) or defined(nRF51822) or defined(nRF51824) }
  {$define CortexM0}
  {$DEFINE __CONTROLLERTYPE__:=NRF51}
  {$DEFINE NRF51}
  {$ALIGN 2}
{$ENDIF}
