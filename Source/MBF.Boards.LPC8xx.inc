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
{$DEFINE MBF_BOARDS_LPC8xx_CONFIG}

// first, convert user friendly controller names to the real controller used in the design

{$if defined(lpcxpresso812max) }
  {$define lpcxpresso}
  {$define has_arduinopins}
  {$define lpc812m101jdh20}
{$endif}

{$if defined(lpcxpresso824max) }
  {$define lpcxpresso}
  {$define has_arduinopins}
  {$define lpc824m201jhi33}
{$endif}

{$if defined(lpc810m21fn8) }
  {$define lpc81x}
  {$define dip8}
{$endif}

{$if defined(lpc811m001jdh16) or defined(lpc812m101jdh16)}
  {$define lpc81x}
  {$define tssop16}
{$endif}

{$if defined(lpc812m101jdh20)}
  {$define lpc81x}
  {$define tssop20}
{$endif}

{$if defined(lpc812m101jd20)}
  {$define lpc81x}
  {$define so20}
{$endif}

{$if defined(lpc812m101jtb16)}
  {$define lpc81x}
  {$define xson16}
{$endif}

{$if defined(lpc822m101jdh20) or defined(lpc824m201jdh20)}
  {$define lpc82x}
  {$define tssop20}
{$endif}

{$if defined(lpc822m101jhi33) or defined(lpc824m201jhi33)}
  {$define lpc82x}
  {$define hvqfn32}
{$endif}

{$if defined(lpc81x) or defined(lpc82x)} 
  {$define CortexM0}
  {$DEFINE __CONTROLLERTYPE__:=LPC8xx}
  {$DEFINE LPC8xx}
  {$ALIGN 2}
{$endif}
