unit MBF.Devices.ULN2003;
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

interface
{$INCLUDE MBF.Config.inc}
uses
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SystemCore;
type
   TULN2003Direction=(Left,Right);
   TULN2003 = record
   private
     FDelay : TMilliSeconds;
     FDirection : TULN2003Direction;
     StepState : SmallInt;
     Pins : array[0..3] of TPinIdentifier;
   public
     procedure Initialize(const Pin1,Pin2,Pin3,Pin4 : TPinIdentifier);
     procedure SetDirection(Value : TULN2003Direction);
     procedure SetDelay(Value : TMilliSeconds);
     procedure Step;
     procedure PowerDown;
     property Delay : TMilliSeconds read FDelay write SetDelay;
     property Direction : TULN2003Direction read FDirection write SetDirection;
   end;

implementation
  
procedure TULN2003.initialize(const Pin1,Pin2,Pin3,Pin4 : TPinIdentifier);
begin
  Pins[0] := Pin1;
  Pins[1] := Pin2;
  Pins[2] := Pin3;
  Pins[3] := Pin4;
  SetDelay(100);
  SetDirection(TULN2003Direction.Left);
  StepState := 0;
end;

procedure TULN2003.SetDirection(Value : TULN2003Direction);
begin
  FDirection := Value;
end;

procedure TULN2003.SetDelay(Value : TMilliSeconds);
begin
  FDelay := Value;
end;

procedure TULN2003.Step;
const
  Matrix: array[0..7] of array[0..3] of TPinLevel = ((TPinLevel.Low ,TPinLevel.Low ,TPinLevel.Low ,TPinLevel.High),
                                                     (TPinLevel.Low ,TPinLevel.Low ,TPinLevel.High,TPinLevel.High),
                                                     (TPinLevel.Low ,TPinLevel.Low ,TPinLevel.High,TPinLevel.Low),
                                                     (TPinLevel.Low ,TPinLevel.High,TPinLevel.High,TPinLevel.Low),
                                                     (TPinLevel.Low ,TPinLevel.High,TPinLevel.Low ,TPinLevel.Low),
                                                     (TPinLevel.High,TPinLevel.High,TPinLevel.Low ,TPinLevel.Low),
                                                     (TPinLevel.High,TPinLevel.Low ,TPinLevel.Low ,TPinLevel.Low),
                                                     (TPinLevel.High,TPinLevel.Low ,TPinLevel.Low ,TPinLevel.High));
var
  i : byte;
begin
  if FDirection = TULN2003Direction.Left then
  begin
    for i := 0 to 3 do
      GPIO.SetPinLevel(longWord(Pins[i]),Matrix[StepState,i]);
    SystemCore.Delay(Delay);
    StepState := StepState + 1;
    if StepState >= 8 then
      StepState := 0;
  end
  else
  begin
    for i := 0 to 3 do
      GPIO.SetPinLevel(longWord(Pins[i]),Matrix[StepState,i]);
    SystemCore.Delay(Delay);
    StepState := StepState - 1;
    if StepState < 0  then
      StepState := 7;
  end;
end;

procedure TULN2003.Powerdown;
var
  i : byte;
begin
  for i := 0 to 3 do
    GPIO.SetPinLevel(longWord(Pins[i]),TPinLevel.Low);
end;

end.
