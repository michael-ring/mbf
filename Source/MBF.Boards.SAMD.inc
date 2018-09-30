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

{$DEFINE MBF_BOARDS_SAMD_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(ARDUINOZERO)}
  {$define has_arduinopins}
  {$define SAMD21G18A}
{$endif}

{$if defined(SAMD10XMINI)}
  {$define has_arduinopins}
  {$define has_samd10_xplained_mini}
  {$define SAMD10D14A}
{$endif}

{$if defined(SAMD20XPRO)}
  {$define has_arduinopins}
  {$define has_samd20_xplained_pro}
  {$define SAMD20J18}
{$endif}

{$if defined(SAMD21XPRO)}
  {$define has_arduinopins}
  {$define has_samd21_xplained_pro}
  {$define SAMD21J18A}
{$endif}

{$if defined(SAMD10C13A)}
  {$define SAMD10}
  {$define SAMD10C}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
{$endif}

{$if defined(SAMD10C14A)}
  {$define SAMD10}
  {$define SAMD10C}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
{$endif}

{$if defined(SAMD10D13A)}
  {$define SAMD10}
  {$define SAMD10D}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
{$endif}

{$if defined(SAMD10D14A)}
  {$define SAMD10}
  {$define SAMD10D}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
{$endif}

{$if defined(SAMD11C13A)}
  {$define SAMD11}
  {$define SAMD11C}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
  {$define has_usb}
{$endif}

{$if defined(SAMD11C14A)}
  {$define SAMD11}
  {$define SAMD11C}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
  {$define has_usb}
{$endif}

{$if defined(SAMD11D14AM)}
  {$define SAMD11}
  {$define SAMD11D}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
  {$define has_usb}
{$endif}

{$if defined(SAMD11D14AS)}
  {$define SAMD11}
  {$define SAMD11D}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tc1} {$define has_tc2}
  {$define has_usb}
{$endif}

{$if defined(SAMD20E14)}
  {$define SAMD20}
  {$define SAMD20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20E15)}
  {$define SAMD20}
  {$define SAMD20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20E16)}
  {$define SAMD20}
  {$define SAMD20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20E17)}
  {$define SAMD20}
  {$define SAMD20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20E18)}
  {$define SAMD20}
  {$define SAMD20E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20G14)}
  {$define SAMD20}
  {$define SAMD20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20G15)}
  {$define SAMD20}
  {$define SAMD20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20G16)}
  {$define SAMD20}
  {$define SAMD20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20G17)}
  {$define SAMD20}
  {$define SAMD20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20G18)}
  {$define SAMD20}
  {$define SAMD20G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD20J14)}
  {$define SAMD20}
  {$define SAMD20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMD20J15)}
  {$define SAMD20}
  {$define SAMD20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMD20J16)}
  {$define SAMD20}
  {$define SAMD20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMD20J17)}
  {$define SAMD20}
  {$define SAMD20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMD20J18)}
  {$define SAMD20}
  {$define SAMD20J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tc0} {$define has_tc1} {$define has_tc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMD21E15A)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E16A)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E17A)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E18A)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G15A)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G16A)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G17A)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G17AU)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G18A)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G18AU)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(SAMD21J15A)}
  {$define SAMD21}
  {$define SAMD21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(SAMD21J16A)}
  {$define SAMD21}
  {$define SAMD21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(SAMD21J17A)}
  {$define SAMD21}
  {$define SAMD21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(SAMD21J18A)}
  {$define SAMD21}
  {$define SAMD21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E15B)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E15BU)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E15L)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD21E16B)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E16BU)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21E16L)}
  {$define SAMD21}
  {$define SAMD21E}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
{$endif}

{$if defined(SAMD21G15B)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G15L)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMD21G16B)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5}
  {$define has_usb}
{$endif}

{$if defined(SAMD21G16L)}
  {$define SAMD21}
  {$define SAMD21G}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
{$endif}

{$if defined(SAMD21J15B)}
  {$define SAMD21}
  {$define SAMD21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(SAMD21J16B)}
  {$define SAMD21}
  {$define SAMD21J}
  {$define has_porta} {$define has_portb}
  {$define has_sercom0} {$define has_sercom1} {$define has_sercom2} {$define has_sercom3} {$define has_sercom4} {$define has_sercom5}
  {$define has_adc}
  {$define has_dac}
  {$define has_i2s}
  {$define has_tcc0} {$define has_tcc1} {$define has_tcc2} {$define has_tc3} {$define has_tc4} {$define has_tc5} {$define has_tc6} {$define has_tc7}
  {$define has_usb}
{$endif}

{$if defined(has_porta)} {$define has_gpioa} {$endif}
{$if defined(has_portb)} {$define has_gpiob} {$endif}

{$if defined(has_sercom0)} {$define has_uart0} {$define has_i2c0} {$define has_spi0} {$endif}
{$if defined(has_sercom1)} {$define has_uart1} {$define has_i2c1} {$define has_spi1} {$endif}
{$if defined(has_sercom2)} {$define has_uart2} {$define has_i2c2} {$define has_spi2} {$endif}
{$if defined(has_sercom3)} {$define has_uart3} {$define has_i2c3} {$define has_spi3} {$endif}
{$if defined(has_sercom4)} {$define has_uart4} {$define has_i2c4} {$define has_spi4} {$endif}
{$if defined(has_sercom5)} {$define has_uart5} {$define has_i2c5} {$define has_spi5} {$endif}
{$if defined(has_sercom6)} {$define has_uart6} {$define has_i2c6} {$define has_spi6} {$endif}

{$if defined(SAMD10) or defined(SAMD11) or defined(SAMD20) or defined(SAMD21)}
  {$define SAMD}
  {$define CortexM0}
  {$DEFINE __CONTROLLERTYPE__:=SAMCD}
  {$ALIGN 2}
{$endif}
