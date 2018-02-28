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
{$DEFINE MBF_BOARDS_PIC32MX_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(pinguino) }
  {$define has_arduinopins}
  {$define pic32mxxxxfxxx}
{$endif}

{$if defined(PIC32MX150F128B)}
  {$define PIC32MX150 }
  {$define PIC32MX1 }
  {$define PDIP28 }
  {$define has_gpioa } {$define has_gpiob }
  {$define has_uart1 } {$define has_uart2 } {$define has_arduino_uart2 }
  {$define has_spi1 } {$define has_spi2 }
  {$define has_i2c1 } {$define has_i2c2 }
  {$define has_adc1 }
  {$define has_arduinopins}

  {$define has_rtc }
{$endif}

{$if defined(PIC32MX150)}
  {$DEFINE __CONTROLLERTYPE__:=PIC32MX}
  {$DEFINE PIC32MX}
  {$DEFINE PIC32}
  {$ALIGN 2}
{$ENDIF}
