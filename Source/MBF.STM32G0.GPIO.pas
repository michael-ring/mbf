unit MBF.STM32G0.GPIO;
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
{
  Related Reference Manuals

  STM32G0x1 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00371828.pdf

  STM32G0x0 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00463896.pdf
}

interface

{$include MBF.Config.inc}

{$REGION PinDefinitions}

const
  ALT0=$1000;
  ALT1=$1100;
  ALT2=$1200;
  ALT3=$1300;
  ALT4=$1400;
  ALT5=$1500;
  ALT6=$1600;
  ALT7=$1700;

type
  TNativePin = record
  const
    None=-1;
  {$if defined (has_gpioa)} PA0=  0;  PA1=  1;  PA2=  2;  PA3=  3;  PA4=  4;  PA5=  5;  PA6=  6;  PA7=  7;  PA8=  8;  PA9=  9; PA10= 10; PA11= 11; PA12= 12;{$endif}
  {$if defined (has_gpioa)}PA13= 13; PA14= 14; PA15= 15; {$endif}
  {$if defined (has_gpiob)} PB0= 16;  PB1= 17;  PB2= 18;  PB3= 19;  PB4= 20;  PB5= 21;  PB6= 22;  PB7= 23;  PB8= 24;  PB9= 25; PB10= 26; PB11= 27; PB12= 28; PB13= 29; PB14= 30; PB15= 31; {$endif}
  {$if defined (has_gpioc)} PC0= 32;  PC1= 33;  PC2= 34;  PC3= 35;  PC4= 36;  PC5= 37;  PC6= 38;  PC7= 39;  PC8= 40;  PC9= 41; PC10= 42; PC11= 43; PC12= 44; PC13= 45; PC14= 46; PC15= 47; {$endif}
  {$if defined (has_gpiod)} PD0= 48;  PD1= 49;  PD2= 50;  PD3= 51;  PD4= 52;  PD5= 53;  PD6= 54;  PD7= 55;  PD8= 56;  PD9= 57; {$endif}
  {$if defined (has_gpiof)} PF0= 80;  PF1= 81;  PF2= 82;  PF6= 86; {$endif}
  {$if defined (has_gpioi)} PI8=136; {$endif}
  end;

  {$if defined(has_arduinopins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PC5;  D1 =TNativePin.PC4;  D2 =TNativePin.PA10;  D3 =TNativePin.PB3;
      D4 =TNativePin.PB5;  D5 =TNativePin.PB4;  D6 =TNativePin.PB14;  D7 =TNativePin.PA8;
      D8 =TNativePin.PA9;  D9 =TNativePin.PC7;  D10=TNativePin.PB0;   D11=TNativePin.PA7;
      D12=TNativePin.PA6;  D13=TNativePin.PA5;  D14=TNativePin.PB9;   D15=TNativePin.PB8;

      A0 =TNativePin.PA0;  A1 =TNativePin.PA1;  A2 =TNativePin.PA4;   A3 =TNativePin.PB1;
      A4 =TNativePin.PB11;  A5 =TNativePin.PB12;
    end;
  {$endif}

  {$if defined(has_arduinominipins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PB7;  D1 =TNativePin.PB6;  D2 =TNativePin.PA15; D3 =TNativePin.PB1;
      D4 =TNativePin.PA10; D5 =TNativePin.PA9;  D6 =TNativePin.PB0;  D7 =TNativePin.PB2;
      D8 =TNativePin.PB8;  D9 =TNativePin.PA8;  D10=TNativePin.PB9;  D11=TNativePin.PB5;
      D12=TNativePin.PB4;  D13=TNativePin.PB3;

      A0 =TNativePin.PA0;  A1 =TNativePin.PA1;  A2 =TNativePin.PA4;  A3 =TNativePin.PA5;
      A4 =TNativePin.PA12; A5= TNativePin.PA11; A6 =TNativePin.PA6;  A7 =TNativePin.PA7;
    end;
  {$endif}

  {$if defined(has_morphopins)}
    TMorphoCN7Pin = record
    const
      None=-1;
      P1 =TNativePin.PC10; P2 =TNativePin.PC11; P3 =TNativePin.PC12; P4 =TNativePin.PD2;
      P7 =TNativePin.PA14; P9 =TNativePin.PD0;  P10=TNativePin.PD1;  P11=TNativePin.PD3;
      P13=TNativePin.PA13; P15=TNativePin.Pd4;  P17=TNativePin.PA15; P21=TNativePin.PB7;
      P23=TNativePin.PC13; P25=TNativePin.PC14; P27=TNativePin.PC15; P28=TNativePin.PA0;
      P29=TNativePin.PF0;  P30=TNativePin.PA1;  P31=TNativePin.PF1;  P32=TNativePin.PA4;
      P34=TNativePin.PB1;  P35=TNativePin.PC2;  P36=TNativePin.PB11; P37=TNativePin.PC3;
      P38=TNativePin.PB12;
    end;

    TMorphoCN10Pin = record
    const
      None=-1;
      P1 =TNativePin.PC9;  P2 =TNativePin.PC8;  P3 =TNativePin.PB8;  P4 =TNativePin.PC6;
      P5 =TNativePin.PB9;  P6 =TNativePin.PA3;  P10=TNativePin.PD6;  P11=TNativePin.PA5;
      P12=TNativePin.PA12; P13=TNativePin.PA6;  P14=TNativePin.PA11; P15=TNativePin.PA7;
      P16=TNativePin.PC1;  P17=TNativePin.PB0;  P19=TNativePin.PC7;  P21=TNativePin.PA9;
      P22=TNativePin.PB2;  P23=TNativePin.PA8;  P24=TNativePin.PB6;  P25=TNativePin.PB14;
      P26=TNativePin.PB15; P27=TNativePin.PB4;  P28=TNativePin.PB10; P29=TNativePin.PB5;
      P30=TNativePin.PB13; P31=TNativePin.PB3;  P33=TNativePin.PA10; P34=TNativePin.PA2;
      P35=TNativePin.PC4;  P36=TNativePin.PD8;  P37=TNativePin.PC5;  P38=TNativePin.PD9;
    end;
  {$endif}
{$endregion}

type
  TPinLevel=(Low=0,High=1);
  TPinValue=0..1;
  TPinIdentifier=-1..160;
  TPinMode = (Input=%00, Output=%01, Analog=%11, AF0=$10, AF1, AF2, AF3, AF4, AF5, AF6, AF7);
  TPinDrive = (None=%00,PullUp=%01,PullDown=%10);
  TPinOutputMode = (PushPull=0,OpenDrain=1);
  TPinOutputSpeed = (Slow=%00, Low=%01, Medium=%10, High=%11);

  TBit = (Bit0, Bit1, Bit2, Bit3, Bit4, Bit5, Bit6, Bit7,
          Bit8, Bit9, Bit10, Bit11, Bit12, Bit13, Bit14, Bit15);
  TBitSet = set of TBit;

type
  TGPIO = record
  private type
    pGPIORegisters = ^TGPIO_Registers;
  private const
    // Indexed mapping to GPIO registers.
    GPIOMem: array[0..8] of pGPIORegisters = ({$ifdef has_gpioa}@GPIOA{$else}nil{$endif},
                                              {$ifdef has_gpiob}@GPIOB{$else}nil{$endif},
                                              {$ifdef has_gpioc}@GPIOC{$else}nil{$endif},
                                              {$ifdef has_gpiod}@GPIOD{$else}nil{$endif},
                                              {$ifdef has_gpioe}@GPIOE{$else}nil{$endif},
                                              {$ifdef has_gpiof}@GPIOF{$else}nil{$endif},
                                              {$ifdef has_gpiog}@GPIOG{$else}nil{$endif},
                                              {$ifdef has_gpioh}@GPIOH{$else}nil{$endif},
                                              {$ifdef has_gpioi}@GPIOI{$else}nil{$endif});

    function GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
    function GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
    function GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
    procedure SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
    function GetPinOutputSpeed(const Pin: TPinIdentifier): TPinOutputSpeed;
    procedure SetPinOutputSpeed(const Pin: TPinIdentifier; const Value: TPinOutputSpeed);

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
    property PinOutputMode[const Pin : TPinIdentifier] : TPinOutputMode read getPinOutputMode write setPinOutputMode;
    property PinOutputSpeed[const Pin : TPinIdentifier] : TPinOutputSpeed read getPinOutputSpeed write setPinOutputSpeed;
    property PinValue[const Pin : TPinIdentifier] : TPinValue read getPinValue write setPinValue;
    property PinLevel[const Pin : TPinIdentifier] : TPinLevel read getPinLevel write setPinLevel;
  end;

  TGPIOPort = record helper for TGPIO_Registers
  public
    procedure Initialize;
    function GetPortValues : word;
    function GetPortBits : TBitSet;
    procedure SetPortValues(const Values : Word);
    procedure SetPortBits(const Bits : TBitSet);
    procedure ClearPortBits(const Bits : TBitSet);
    procedure SetPortMode(PortMode : TPinMode);
    procedure SetPortOutputSpeed(Speed : TPinOutputSpeed);
    procedure SetPortDrive(Drive : TPinDrive);
    procedure SetPortOutputMode(OutputMode : TPinOutputMode);
  end;

var
  GPIO : TGPIO;

implementation
uses
  MBF.BitHelpers;

procedure EnableGPIOPort(const GPIO : byte);
begin
  // Make sure that the GPIO Clock is enabled
  SetBit(RCC.IOPENR,GPIO)
end;

{$I MBF.STM32.GPIO.inc}

end.
