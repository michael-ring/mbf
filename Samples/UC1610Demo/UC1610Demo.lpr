program ucs1610Demo;
(*
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
*)
{$INCLUDE MBF.Config.inc}

uses
  HeapMgr,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI,
  MBF.Displays.CustomDisplay,
  MBF.Displays.UC1610;

var
  i : longWord;

begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  SystemCore.Delay(100);
  //SystemCore.DisableJTAGInterface;
  GPIO.Initialize;
  GPIO.PinMode[TArduinoPin.D8] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D9] := TPinMode.Output;
  GPIO.PinValue[TArduinoPin.D8] := 1;
  GPIO.PinValue[TArduinoPin.D9] := 1;

  SPI.Initialize(TSPIMOSIPins.D11_SPI,TSPIMISOPINS.D12_SPI,TSPISCLKPINS.D13_SPI,TSPINSSPins.D10_SPI);
  SPI.Frequency:= 8000000;

  UC1610.Initialize(SPI,TArduinopin.D9,TArduinoPin.D8,TUC1610.LCD160x104,TDisplayBitDepth.TwoBits);
  UC1610.InitSequence;


  UC1610.ClearScreen(true);
  i := ord('0');
  repeat
    UC1610.Write('X+0'+Chr(i)+Chr(i)+'.00mm',0,8);
    UC1610.Write('Y+000.00mm',0,40);
    UC1610.Write('Z+000.00mm',0,72);
    SystemCore.Delay(50);
    //UC1610.ClearScreen(true);
    //SystemCore.Delay(2000);
    inc(i);
    if i >ord('9') then
      i := ord('0');
  until 1=0;
end.

