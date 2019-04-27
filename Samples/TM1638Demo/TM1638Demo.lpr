program TM1638Demo;
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

{$INCLUDE MBF.Config.inc}

uses
  HeapMgr,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.Devices.TM1638;

var
  TM1638 : TTM1638;

begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  TM1638.Initialize(TArduinoPin.D3,TArduinoPin.D4,TArduinoPin.D5);
  TM1638.Clear;
  while true do
  begin
    TM1638.Character[1] := '1';
    TM1638.Character[2] := '2';
    TM1638.Character[3] := '3';
    TM1638.Character[4] := '4';
    TM1638.Character[5] := '5';
    TM1638.Character[6] := '6';
    TM1638.Character[7] := '7';
    TM1638.Character[8] := '8';
    TM1638.Digits[9] := $55;
    Systemcore.Delay(1000);

    TM1638.Character[1] := '0';
    TM1638.Character[2] := '9';
    TM1638.Character[3] := '8';
    TM1638.Character[4] := '7';
    TM1638.Character[5] := '6';
    TM1638.Character[6] := '5';
    TM1638.Character[7] := '4';
    TM1638.Character[8] := '3';
    TM1638.Digits[9] := $AA;
    Systemcore.Delay(1000);
  end;
end.
