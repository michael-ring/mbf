unit mbf.megaavr.gpio;
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
{< Atmel x8 series GPIO functions. }
interface

{$include MBF.Config.inc}

{$REGION PinDefinitions}

type
  TNativePin = record
  const
    None=-1;
    {$if defined (has_gpioa)} PA0=  0;  PA1=  1;  PA2=  2;  PA3=  3;  PA4=  4;  PA5=  5;  PA6=  6;  PA7=  7; {$endif}
    {$if defined (has_gpiob)} PB0= 16;  PB1= 17;  PB2= 18;  PB3= 19;  PB4= 20;  PB5= 21;  PB6= 22;  PB7= 23; {$endif}
    {$if defined (has_gpioc)} PC0= 32;  PC1= 33;  PC2= 34;  PC3= 35;  PC4= 36;  PC5= 37;  PC6= 38;  PC7= 39; {$endif}
    {$if defined (has_gpiod)} PD0= 48;  PD1= 49;  PD2= 50;  PD3= 51;  PD4= 52;  PD5= 53;  PD6= 54;  PD7= 55; {$endif}
    {$if defined (has_gpioe)} PE0= 64;  PE1= 65;  PE2= 66;  PE3= 67;  PE4= 68;  PE5= 69;  PE6= 70;  PE7= 71; {$endif}
    {$if defined (has_gpiof)} PF0= 80;  PF1= 81;  PF2= 82;  PF3= 83;  PF4= 84;  PF5= 85;  PF6= 86;  PF7= 87; {$endif}
    {$if defined (has_gpiog)} PG0= 96;  PG1= 97;  PG2= 98;  PG3= 99;  PG4=100;  PG5=101;  PG6=102;  PG7=103; {$endif}
    {$if defined (has_gpioh)} PH0=112;  PH1=113;  PH2=114;  PH3=115;  PH4=116;  PH5=117;  PH6=118;  PH7=119; {$endif}
    {$if defined (has_gpioi)} PI0=128;  PI1=129;  PI2=130;  PI3=131;  PI4=132;  PI5=133;  PI6=134;  PI7=135; {$endif}
    {$if defined (has_gpioj)} PJ0=144;  PJ1=145;  PJ2=146;  PJ3=147;  PJ4=148;  PJ5=149;  PJ6=150;  PJ7=151; {$endif}
    {$if defined (has_gpiok)} PK0=160;  PK1=161;  PK2=162;  PK3=163;  PK4=164;  PK5=165;  PK6=166;  PK7=167; {$endif}
    {$if defined (has_gpiol)} PL0=176;  PL1=177;  PL2=178;  PL3=179;  PL4=180;  PL5=181;  PL6=182;  PL7=183; {$endif}
  end;


  {$if defined(has_arduinopins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PD0;  D1 =TNativePin.PD1;  D2 =TNativePin.PD2;  D3 =TNativePin.PD3;
      D4 =TNativePin.PD4;  D5 =TNativePin.PD5;  D6 =TNativePin.PD6;  D7 =TNativePin.PD7;
      D8 =TNativePin.PB0;  D9 =TNativePin.PB1;  D10=TNativePin.PB2;   D11=TNativePin.PB3;
      D12=TNativePin.PB4;  D13=TNativePin.PB5;  D14=TNativePin.PB6;   D15=TNativePin.PB7;

      A0 =TNativePin.PC0;  A1 =TNativePin.PC1;  A2 =TNativePin.PC2;   A3 =TNativePin.PC3;
      A4 =TNativePin.PC4;  A5 =TNativePin.PC5;
    end;
  {$endif}
{$endregion}
type
  TPinLevel=(Low=0,High=1);
  TPinValue=0..1;
  TPinIdentifier=-1..183;
  TPinMode = (Input=%00, Output=%01, Analog=%10);
  TPinDrive = (None=%00,PullUp=%01);
  TBit = (Bit0, Bit1, Bit2, Bit3, Bit4, Bit5, Bit6, Bit7);
  TBitSet = set of TBit;
  TGPIORegisters = record
    PIN : byte;
    DDR : byte;
    PORT : byte;
  end;
  pGPIORegisters = ^TGPIORegisters;

type
  TGPIO = record
  private const
    // Indexed mapping to GPIO registers.
    GPIOMem: array[0..11] of pGPIORegisters = ({$ifdef has_gpioa}@PINA{$else}nil{$endif},
                                               {$ifdef has_gpiob}@PINB{$else}nil{$endif},
                                               {$ifdef has_gpioc}@PINC{$else}nil{$endif},
                                               {$ifdef has_gpiod}@PIND{$else}nil{$endif},
                                               {$ifdef has_gpioe}@PINE{$else}nil{$endif},
                                               {$ifdef has_gpiof}@PINF{$else}nil{$endif},
                                               {$ifdef has_gpiog}@PING{$else}nil{$endif},
                                               {$ifdef has_gpioh}@PINH{$else}nil{$endif},
                                               {$ifdef has_gpioi}@PINI{$else}nil{$endif},
                                               {$ifdef has_gpioj}@PINJ{$else}nil{$endif},
                                               {$ifdef has_gpiok}@PINK{$else}nil{$endif},
                                               {$ifdef has_gpiol}@PINL{$else}nil{$endif});
    function GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
    function GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
  public
    procedure Initialize;
    function  GetPinValue(const Pin: TPinIdentifier): TPinValue;
    procedure SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
    function  GetPinLevel(const Pin: TPinIdentifier): TPinLevel;
    procedure SetPinLevel(const Pin: TPinIdentifier; const Level: TPinLevel);

    procedure SetPinLevelHigh(const Pin: TPinIdentifier);
    procedure SetPinLevelLow(const Pin: TPinIdentifier);
    procedure TogglePinValue(const Pin: TPinIdentifier);
    procedure TogglePinLevel(const Pin: TPinIdentifier);

    property PinMode[const Pin : TPinIdentifier]: TPinMode read getPinMode write setPinMode;
    property PinDrive[const Pin : TPinIdentifier] : TPinDrive read getPinDrive write setPinDrive;
    property PinValue[const Pin : TPinIdentifier] : TPinValue read getPinValue write setPinValue;
    property PinLevel[const Pin : TPinIdentifier] : TPinLevel read getPinLevel write setPinLevel;
  end;

  TGPIOPort = record
  public
    procedure Initialize;
    function GetPortValues : byte;
    function GetPortBits : TBitSet;
    procedure SetPortValues(const Values : byte);
    procedure SetPortBits(const Bits : TBitSet);
    procedure ClearPortBits(const Bits : TBitSet);
    procedure SetPortMode(PortMode : TPinMode);
    procedure SetPortDrive(Drive : TPinDrive);
  end;

var
  GPIO : TGPIO;

implementation
uses
  MBF.BitHelpers;

procedure TGPIOPort.Initialize;
begin
end;

function TGPIOPort.GetPortValues : byte; inline;
begin
end;

function TGPIOPort.GetPortBits : TBitSet; inline;
begin
end;

procedure TGPIOPort.SetPortValues(const Values : byte); inline;
begin
end;

procedure TGPIOPort.SetPortBits(const Bits : TBitSet); inline;
begin
end;

procedure TGPIOPort.ClearPortBits(const Bits : TBitSet); inline;
begin
end;

procedure TGPIOPort.SetPortMode(PortMode : TPinMode); inline;
begin
end;

procedure TGPIOPort.SetPortDrive(Drive : TPinDrive); inline;
begin
end;

procedure TGPIO.Initialize;
begin
end;

function TGPIO.GetPinMode(const Pin: TPinIdentifier): TPinMode;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  Result := TPinMode(getBit(GPIOMem[GPIO]^.DDR,Bit));
end;

procedure TGPIO.SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;

  //Now set default Mode with some sane settings

  case Value of
    TPinMode.Input     : begin
                             //Enable Input Mode
                             clearBit(GPIOMem[GPIO]^.DDR,bit);
                             //Turn on Pullup Resistor
                             setBit(GPIOMem[GPIO]^.PORT,bit);
    end;
    TPinMode.Output    : begin
                             //Enable Output Mode
                             setBit(GPIOMem[GPIO]^.DDR,bit);
    end;

    TPinMode.Analog    : begin
                             //Enable Input Mode
                             clearBit(GPIOMem[GPIO]^.DDR,bit);
                             //Turn off Pullup Resistor
                             clearBit(GPIOMem[GPIO]^.PORT,bit);
    end;
  end;
end;

function TGPIO.GetPinValue(const Pin: TPinIdentifier): TPinValue; inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  Result := getBit(GPIOMem[GPIO]^.PIN,Bit)
end;

procedure TGPIO.SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue); inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  setBitValue(GPIOMem[GPIO]^.PORT,Value,Bit);
end;

function TGPIO.GetPinLevel(const Pin: TPinIdentifier): TPinLevel; inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  Result := TPinLevel(getBitValue(GPIOMem[GPIO]^.PIN,bit));
end;

procedure TGPIO.SetPinLevel(const Pin: TPinIdentifier; const Level: TPinLevel); inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  setBitLevel(GPIOMem[GPIO]^.PORT,TBitLevel(Level),bit);
end;

procedure TGPIO.SetPinLevelHigh(const Pin: TPinIdentifier); inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  setBit(GPIOMem[GPIO]^.PORT,bit);
end;

procedure TGPIO.SetPinLevelLow(const Pin: TPinIdentifier); inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  clearBit(GPIOMem[GPIO]^.PORT,bit);
end;

procedure TGPIO.TogglePinValue(const Pin: TPinIdentifier); inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  setBit(GPIOMem[GPIO]^.PIN,Bit);
end;

procedure TGPIO.TogglePinLevel(const Pin: TPinIdentifier); inline;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  setBit(GPIOMem[GPIO]^.PIN,Bit);
end;

function TGPIO.GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  Result := TPinDrive.None;
  if getBit(GPIOMem[GPIO]^.DDR,bit) = 0 then
    if getBit(GPIOMem[GPIO]^.PORT,bit) <> 0 then
      Result := TPinDrive.PullUp;
end;

procedure TGPIO.SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
var
  GPIO,Bit : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $07;
  if getBit(GPIOMem[GPIO]^.DDR,Bit) = 0 then
    setBitValue(GPIOMem[GPIO]^.PORT,TBitValue(Value),bit);
end;

end.
