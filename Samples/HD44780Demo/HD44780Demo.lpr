program US2066Demo;
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
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO;

procedure command(i : byte);
begin
  GPIO.SetPinValueHigh(TArduinoPin.D5); //RD = 1;
  GPIO.SetPinValueLow(TArduinoPin.D3); //D_C = 0; 

  GPIO.SetPinValueLow(TArduinoPin.D10); //C_S = 0;
  GPIO.SetPinValueLow(TArduinoPin.D4); //WR = 0;

  if i and %00010000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D6)
  else
    GPIO.SetPinValueLow(TArduinoPin.D6);

  if i and %00100000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D7)
  else
    GPIO.SetPinValueLow(TArduinoPin.D7);

  if i and %01000000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D8)
  else
    GPIO.SetPinValueLow(TArduinoPin.D8);

  if i and %10000000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D9)
  else
    GPIO.SetPinValueLow(TArduinoPin.D9);
  Systemcore.BusyWait(1);
  GPIO.SetPinValueHigh(TArduinoPin.D4); //WR = 1;
  Systemcore.BusyWait(1);
  GPIO.SetPinValueLow(TArduinoPin.D4); //WR = 0;

  if i and %0001 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D6)
  else
    GPIO.SetPinValueLow(TArduinoPin.D6);

  if i and %0010 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D7)
  else
    GPIO.SetPinValueLow(TArduinoPin.D7);

  if i and %0100 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D8)
  else
    GPIO.SetPinValueLow(TArduinoPin.D8);

  if i and %1000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D9)
  else
    GPIO.SetPinValueLow(TArduinoPin.D9);

  Systemcore.BusyWait(1);
  GPIO.SetPinValueHigh(TArduinoPin.D4); //WR = 1;
  Systemcore.BusyWait(1);
  GPIO.SetPinValueHigh(TArduinoPin.D10) //C_S = 1;
end;

procedure data(i : byte);
begin
  GPIO.SetPinValueHigh(TArduinoPin.D5); //RD = 1;
  GPIO.SetPinValueHigh(TArduinoPin.D3); //D_C = 1;

  GPIO.SetPinValueLow(TArduinoPin.D10); //C_S = 0;
  GPIO.SetPinValueLow(TArduinoPin.D4); //WR = 0;

  if i and %00010000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D6)
  else
    GPIO.SetPinValueLow(TArduinoPin.D6);

  if i and %00100000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D7)
  else
    GPIO.SetPinValueLow(TArduinoPin.D7);

  if i and %01000000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D8)
  else
    GPIO.SetPinValueLow(TArduinoPin.D8);

  if i and %10000000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D9)
  else
    GPIO.SetPinValueLow(TArduinoPin.D9);

  GPIO.SetPinValueHigh(TArduinoPin.D4); //WR = 1;
  GPIO.SetPinValueLow(TArduinoPin.D4); //WR = 0;

  if i and %0001 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D6)
  else
    GPIO.SetPinValueLow(TArduinoPin.D6);

  if i and %0010 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D7)
  else
    GPIO.SetPinValueLow(TArduinoPin.D7);

  if i and %0100 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D8)
  else
    GPIO.SetPinValueLow(TArduinoPin.D8);

  if i and %1000 <> 0 then
    GPIO.SetPinValueLow(TArduinoPin.D9)
  else
    GPIO.SetPinValueLow(TArduinoPin.D9);

  GPIO.SetPinValueHigh(TArduinoPin.D4); //WR = 1;
  GPIO.SetPinValueHigh(TArduinoPin.D10) //C_S = 1;
end;

var
  i : longWord;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  //D/C Data / Command select
  GPIO.PinMode[TArduinoPin.D3] := TPinMode.Output;
  //R/W Read/Write select / WR Write Select
  GPIO.PinMode[TArduinoPin.D4] := TPinMode.Output;
  //E Enable select / RD Read Select
  GPIO.PinMode[TArduinoPin.D5] := TPinMode.Output;
  //Bit4
  GPIO.PinMode[TArduinoPin.D6] := TPinMode.Output;
  //Bit5
  GPIO.PinMode[TArduinoPin.D7] := TPinMode.Output;
  //Bit6
  GPIO.PinMode[TArduinoPin.D8] := TPinMode.Output;
  //Bit7
  GPIO.PinMode[TArduinoPin.D9] := TPinMode.Output;
  //CS Chip Select
  GPIO.PinMode[TArduinoPin.D10] := TPinMode.Output;
  //Reset
  GPIO.PinMode[TArduinoPin.D11] := TPinMode.Output;
  //Mode Select 0
  GPIO.PinMode[TArduinoPin.D12] := TPinMode.Output;
  //Mode Select 1
  GPIO.PinMode[TArduinoPin.D13] := TPinMode.Output;
  //Mode Select 2
  GPIO.PinMode[TArduinoPin.D14] := TPinMode.Output;

  //Reset Chip
  GPIO.SetPinValueHigh(TArduinoPin.D11);
  // Set 4-Bit 8080 Mode
  GPIO.SetPinValueHigh(TArduinoPin.D12);
  GPIO.SetPinValueHigh(TArduinoPin.D13);
  GPIO.SetPinValueHigh(TArduinoPin.D14);

  //Reset Chip
  GPIO.SetPinValueLow(TArduinoPin.D11);
  GPIO.SetPinValueHigh(TArduinoPin.D11);
  SystemCore.Delay(1);
  command($2A); //function set (extended command set)
  command($71); //function selection A
  data($00);    // disable internal VDD regulator (2.8V I/O). data($5C)
  command($28); //function set (fundamental command set)
  command($08); //display off, cursor off, blink off
  command($2A); //function set (extended command set)
  command($79); //OLED command set enabled
  command($D5); //set display clock divide ratio/oscillator frequency
  command($70); //set display clock divide ratio/oscillator frequency
  command($78); //OLED command set disabled
  command($09); //extended function set (4-lines)
  command($06); //COM SEG direction
  command($72); //function selection B
  data($00);    //ROM CGRAM selection
  command($2A); //function set (extended command set)
  command($79); //OLED command set enabled
  command($DA); //set SEG pins hardware configuration
  command($10); //set SEG pins hardware configuration
  command($DC); //function selection C
  command($00); //function selection C
  command($81); //set contrast control
  command($7F); //set contrast control
  command($D9); //set phase length
  command($F1); //set phase length
  command($DB); //set VCOMH deselect level
  command($40); //set VCOMH deselect level
  command($78); //OLED command set disabled
  command($28); //function set (fundamental command set)
  command($01); //clear display
  command($80); //set DDRAM address to $00
  command($0C); //display ON
  SystemCore.delay(100);  //delay

  command($01); 
  command($02); 
  for i := 0 to 19 do
    data($1F);
  command($A0); 
  for i := 0 to 19 do
    data($1F);
  command($C0); 
  for i := 0 to 19 do
    data($1F);
  command($E0); 
  for i := 0 to 19 do
    data($1F);

  repeat
  until 1=0;
end.
