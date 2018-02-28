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
{$DEFINE MBF_BOARDS_KINETIS_CONFIG}


// first, convert user friendly controller names to the real controller used in the design

{$if defined(teensy30) }
  {$define teensy}
  {$define has_arduinopins}
  {$define mk20dx128vlh5}
{$endif}

{$if defined(teensy31) or defined(teensy32) }
  {$define teensy}
  {$define has_arduinopins}
  {$define mk20dx256vlh7}
{$endif}

{$if defined(freedom_k22f) }
  {$define freedom}
  {$define has_arduinopins}
  {$define mk22fn512vlh12}
{$endif}

// We now need to define the casing (often needed for finding out how many GPIO and devices a controller has)
// Also a more general devices name is assigned to group devices that are similar (same datasheet)

{$if defined(mk20dx64vlh7) or defined(mk20dx128vlh7)  or defined(mk20dx256vlh7)}
  {$define lqfp64}
  {$define mk20dx7}
{$endif}

{$if defined(mk20dx64vlk7) or defined(mk20dx128vlk7)  or defined(mk20dx256vlk7)}
  {$define lqfp80}
  {$define mk20dx7}
{$endif}

{$if defined(mk20dx128vll7)  or defined(mk20dx256vll7)}
  {$define lqfp100}
  {$define mk20dx7}
{$endif}

{$if defined(mk20dx64vmc7) or defined(mk20dx128vmc7)  or defined(mk20dx256vmc7)}
  {$define bga121}
  {$define mk20dx7}
{$endif}

{$if defined(mk22fn256vlh12) or defined(mk22fn512vlh12)}
  {$define lqfp64}
  {$define mk22fn12}
{$endif}

{$if defined(mk22fn256vmp12) or defined(mk22fn512vmp12) }
  {$define bga64}
  {$define mk22fn12}
{$endif}

{$if defined(mk22fn256cah12) }
  {$define wlcsp64}
  {$define mk22fn12}
{$endif}

{$if defined(mk22fn256cap12) or defined(mk22fn512cap12)  or defined(mk22fn512cbp12) }
  {$define wlcsp80}
  {$define mk22fn12}
{$endif}

{$if defined(mk22fn256vll12) or defined(mk22fn512vll12) }
  {$define lqfp100}
  {$define mk22fn12}
{$endif}

{$if defined(mk22fn256vdc12) or defined(mk22fn512vdc12) }
  {$define bga121}
  {$define mk22fn12}
{$endif}

{$if defined(mk20dx7) or defined(mk22fn12)}
  {$define CortexM4}
  {$DEFINE __CONTROLLERTYPE__:=Kinetis}
  {$DEFINE Kinetis}
  {$ALIGN 2}
{$ENDIF}
