unit MBF.SAMCD.Helpers;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  Copyright (c) 2018 -  Alfred Glänzer

  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}  

interface

{$INCLUDE MBF.Config.inc}

{$i atsamcd/samcd-adc.inc}
{$i atsamcd/samcd-gclk.inc}
{$i atsamcd/samcd-mclk.inc}
{$i atsamcd/samcd-nvmctrl.inc}
{$i atsamcd/samcd-pm.inc}
{$i atsamcd/samcd-port.inc}
{$i atsamcd/samcd-sercom.inc}
{$i atsamcd/samcd-sysctrl.inc}
{$i atsamcd/samcd-tc.inc}

function ReadCal(Position,Size:byte):longword;
function DivCeiling(a,b:longint):longint;

implementation

function ReadCal(Position,Size:byte):longword;
begin
  result:=(({%H-}plongword(NVMCTRL_OTP4+(Position DIV 32))^ shr (Position MOD 32)) AND (1 shl Size));
end;

function DivCeiling(a,b:longint):longint;
begin
  result:=(((a) + (b) - 1) DIV (b));
end;

end.

