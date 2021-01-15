program AS5311Demo;
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
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.UART,
  MBF.TypeHelpers;

type
  TAS5311Data = record
    Value : longWord;
    OCF,
    COF,
    LIN,
    MagInc,
    MagDec,
    Parity: boolean;
  end;

type
  TAS5311DataArray = array[0..3] of TAS5311Data;

function ReadAS5311(CS,CLOCK,DATA : TPinIdentifier):TAS5311Data;
var
  rawValue, c : longWord;
  inputStream : TPinValue;
begin
  inputStream := 0;
  rawValue := 0;
  GPIO.pinValue[CS] := 1;
  GPIO.pinValue[CLOCK] := 1;
  GPIO.pinValue[CS] := 0;
  GPIO.pinValue[CLOCK] := 0;
  for c := 0 to 17 do
  begin
    GPIO.pinValue[CLOCK] := 1;
    inputStream := GPIO.PinValue[DATA];
    case c of
      0..11: rawValue := (rawValue shl 1) + inputStream;
      12: Result.OCF:= (inputStream <> 0);
      13: Result.COF:= (inputStream <> 0);
      14: Result.LIN:= (inputStream <> 0);
      15: Result.MagInc := (inputStream <> 0);
      16: Result.MagDec := (inputStream <> 0);
      17: Result.Parity := (inputStream <> 0);
    end;
    GPIO.pinValue[CLOCK] := 0;
  end;
  result.Value := rawValue;
end;

function ReadAS5311(CS,CLOCK,DATA1,DATA2,DATA3,DATA4 : TPinIdentifier):TAS5311DataArray;
var
  rawValue1,rawValue2,rawValue3,rawValue4,c : longWord;
  inputstream1,inputstream2,inputstream3,inputstream4 : TPinValue;
begin
  inputStream1 := 0;
  inputStream2 := 0;
  inputStream3 := 0;
  inputStream4 := 0;
  rawValue1 := 0;
  rawValue2 := 0;
  rawValue3 := 0;
  rawValue4 := 0;

  GPIO.pinValue[CS] := 1;
  GPIO.pinValue[CLOCK] := 1;
  GPIO.pinValue[CS] := 0;
  GPIO.pinValue[CLOCK] := 0;

  for c := 0 to 17 do
  begin
    GPIO.pinValue[CLOCK] := 1;

    inputStream1 := GPIO.PinValue[DATA1];
    inputStream2 := GPIO.PinValue[DATA2];
    inputStream3 := GPIO.PinValue[DATA3];
    inputStream4 := GPIO.PinValue[DATA4];
    case c of
      0..11: begin
               rawValue1 := (rawValue1 shl 1) + inputStream1;
               rawValue2 := (rawValue2 shl 1) + inputStream2;
               rawValue3 := (rawValue3 shl 1) + inputStream3;
               rawValue4 := (rawValue4 shl 1) + inputStream4;
             end;
      12: begin
            Result[0].OCF:= (inputStream1 <> 0);
            Result[1].OCF:= (inputStream2 <> 0);
            Result[2].OCF:= (inputStream3 <> 0);
            Result[3].OCF:= (inputStream4 <> 0);
          end;
      13: begin
            Result[0].COF:= (inputStream1 <> 0);
            Result[1].COF:= (inputStream2 <> 0);
            Result[2].COF:= (inputStream3 <> 0);
            Result[3].COF:= (inputStream4 <> 0);
          end;
      14: begin
            Result[0].LIN:= (inputStream1 <> 0);
            Result[1].LIN:= (inputStream2 <> 0);
            Result[2].LIN:= (inputStream3 <> 0);
            Result[3].LIN:= (inputStream4 <> 0);
          end;
      15: begin
            Result[0].MagInc := (inputStream1 <> 0);
            Result[1].MagInc := (inputStream2 <> 0);
            Result[2].MagInc := (inputStream3 <> 0);
            Result[3].MagInc := (inputStream4 <> 0);
          end;
      16: begin
            Result[0].MagDec := (inputStream1 <> 0);
            Result[1].MagDec := (inputStream2 <> 0);
            Result[2].MagDec := (inputStream3 <> 0);
            Result[3].MagDec := (inputStream4 <> 0);
          end;
      17: begin
            Result[0].Parity := (inputStream1 <> 0);
            Result[1].Parity := (inputStream2 <> 0);
            Result[2].Parity := (inputStream3 <> 0);
            Result[3].Parity := (inputStream4 <> 0);
          end;
    end;
    GPIO.pinValue[CLOCK] := 0;
  end;
  result[0].Value := rawValue1;
  result[1].Value := rawValue2;
  result[2].Value := rawValue3;
  result[3].Value := rawValue4;
end;

var
  data : TAS5311Data;
  i,average,duration : longWord;
begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  SystemCore.GetCPUFrequency;
  //SystemCore.DisableJTAGInterface;
  GPIO.Initialize;
  GPIO.PinMode[TArduinoPin.D2] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D3] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D4] := TPinMode.Input;

  UART.Initialize;
  UART.RxPin := TUARTRXPins.D0_UART;
  UART.TxPin := TUARTTXPins.D1_UART;

  repeat
    Duration := Systemcore.GetTickCount;
    average := 0;
    for i := 1 to 100 do
    begin
      data := ReadAS5311(TArduinoPin.D2,TArduinoPin.D3,TArduinoPin.D4);
      average := average + data.Value;
    end;
    average := average div 100;
    Duration := SystemCore.GetTickCount - Duration;
    UART.WriteString('100x duration '+Duration.toString+' ms ');
    UART.WriteString('OCF '+data.ocf.toString);
    UART.WriteString(' COF '+data.cof.toString);
    UART.WriteString(' LIN '+data.lin.toString);
    UART.WriteString(' MagINC '+data.maginc.toString);
    UART.WriteString(' MagDec '+data.magdec.toString);
    UART.WriteString(' CurrentPos '+average.toString+#13#10);
    SystemCore.Delay(500);
  until 1=0;
end.

