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
{$DEFINE MBF_BOARDS_SAMC_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(SAMC21XPRO) }
  {$define SAMC21J18A}
  {$define has_arduinopins}
  {$define has_samc21_xplained_pro}
{$endif}

{$if defined(SAMC20E15A)}
  {$define SAMC20}
  {$define SAMC20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC20E16A)}
  {$define SAMC20}
  {$define SAMC20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC20E17A)}
  {$define SAMC20}
  {$define SAMC20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC20E18A)}
  {$define SAMC20}
  {$define SAMC20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC20G15A)}
  {$define SAMC20}
  {$define SAMC20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20G16A)}
  {$define SAMC20}
  {$define SAMC20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20G17A)}
  {$define SAMC20}
  {$define SAMC20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20G18A)}
  {$define SAMC20}
  {$define SAMC20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20J15A)}
  {$define SAMC20}
  {$define SAMC20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20J16A)}
  {$define SAMC20}
  {$define SAMC20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20J17A)}
  {$define SAMC20}
  {$define SAMC20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20J17AU)}
  {$define SAMC20}
  {$define SAMC20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20J18A)}
  {$define SAMC20}
  {$define SAMC20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20J18AU)}
  {$define SAMC20}
  {$define SAMC20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC20N17A)}
  {$define SAMC20}
  {$define SAMC20N}
  {$define has_porta} {$define has_portb}{$define has_portc}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}{$define has_sercom6}{$define has_sercom7}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMC20N18A)}
  {$define SAMC20}
  {$define SAMC20N}
  {$define has_porta} {$define has_portb}{$define has_portc}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}{$define has_sercom6}{$define has_sercom7}
  {$define has_adc}
  {$define has_adc0}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMC21E15A)}
  {$define SAMC21}
  {$define SAMC21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC21E16A)}
  {$define SAMC21}
  {$define SAMC21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC21E17A)}
  {$define SAMC21}
  {$define SAMC21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC21E18A)}
  {$define SAMC21}
  {$define SAMC21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc4}
{$endif}

{$if defined(SAMC21G15A)}
  {$define SAMC21}
  {$define SAMC21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21G16A)}
  {$define SAMC21}
  {$define SAMC21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21G17A)}
  {$define SAMC21}
  {$define SAMC21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21G18A)}
  {$define SAMC21}
  {$define SAMC21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21J15A)}
  {$define SAMC21}
  {$define SAMC21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21J16A)}
  {$define SAMC21}
  {$define SAMC21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21J17A)}
  {$define SAMC21}
  {$define SAMC21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21J17AU)}
  {$define SAMC21}
  {$define SAMC21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21J18A)}
  {$define SAMC21}
  {$define SAMC21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21J18AU)}
  {$define SAMC21}
  {$define SAMC21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4}
{$endif}

{$if defined(SAMC21N17A)}
  {$define SAMC21}
  {$define SAMC21N}
  {$define has_porta} {$define has_portb}{$define has_portc}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}{$define has_sercom6}{$define has_sercom7}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMC21N18A)}
  {$define SAMC21}
  {$define SAMC21N}
  {$define has_porta} {$define has_portb}{$define has_portc}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}{$define has_sercom6}{$define has_sercom7}
  {$define has_adc}
  {$define has_adc0}
  {$define has_adc1}
  {$define has_can}
  {$define has_can0}
  {$define has_can1}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2}   {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(has_porta)} {$define has_gpioa} {$endif}
{$if defined(has_portb)} {$define has_gpiob} {$endif}
{$if defined(has_portc)} {$define has_gpioc} {$endif}

{$if defined(has_sercom0)} {$define has_usart0} {$define has_i2c0} {$define has_spi0} {$endif}
{$if defined(has_sercom1)} {$define has_usart1} {$define has_i2c1} {$define has_spi1} {$endif}
{$if defined(has_sercom2)} {$define has_usart2} {$define has_i2c2} {$define has_spi2} {$endif}
{$if defined(has_sercom3)} {$define has_usart3} {$define has_i2c3} {$define has_spi3} {$endif}
{$if defined(has_sercom4)} {$define has_usart4} {$define has_i2c4} {$define has_spi4} {$endif}
{$if defined(has_sercom5)} {$define has_usart5} {$define has_i2c5} {$define has_spi5} {$endif}
{$if defined(has_sercom6)} {$define has_usart6} {$define has_i2c6} {$define has_spi6} {$endif}
{$if defined(has_sercom7)} {$define has_usart7} {$define has_i2c7} {$define has_spi7} {$endif}


{$if defined(SAMC20) or defined(SAMC21)}
  {$define SAMC}
  {$define CortexM0}
  {$DEFINE __CONTROLLERTYPE__:=SAMCD}
  {$ALIGN 2}
{$endif}
