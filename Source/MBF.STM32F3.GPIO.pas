unit MBF.STM32F3.GPIO;
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

  STM32F37xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00041563.pdf

  STM32F303xBCDE, STM32F303x68, STM32F328x8, STM32F358xC, STM32F398xE advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00043574.pdf

  STM32F334xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00093941.pdf

  STM32F302xBCDE and STM32F302x68 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00094349.pdf

  STM32F301x68 and STM32F318x8 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00094350.pdf
}
{$WARN 4055 off : Conversion between ordinals and pointers is not portable}
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
  ALT8=$1800;
  ALT9=$1900;
  ALT10=$1A00;
  ALT11=$1B00;
  ALT12=$1C00;
  ALT13=$1D00;
  ALT14=$1E00;
  ALT15=$1F00;

type
  TNativePin = record
  const
    None=-1;
    {$if defined (has_gpioa)} PA0=  0;  PA1=  1;  PA2=  2;  PA3=  3;  PA4=  4;  PA5=  5;  PA6=  6;  PA7=  7;
                              PA8=  8;  PA9=  9; PA10= 10; PA11= 11; PA12= 12; PA13= 13; PA14= 14; PA15= 15; {$endif}
    {$if defined (has_gpiob)} PB0= 16;  PB1= 17;  PB2= 18;  PB3= 19;  PB4= 20;  PB5= 21;  PB6= 22;  PB7= 23;
                              PB8= 24;  PB9= 25; PB10= 26; PB11= 27; PB12= 28; PB13= 29; PB14= 30; PB15= 31; {$endif}
    {$if defined (has_gpioc)} PC0= 32;  PC1= 33;  PC2= 34;  PC3= 35;  PC4= 36;  PC5= 37;  PC6= 38;  PC7= 39;
                              PC8= 40;  PC9= 41; PC10= 42; PC11= 43; PC12= 44; PC13= 45; PC14= 46; PC15= 47; {$endif}
    {$if defined (has_gpiod)} PD0= 48;  PD1= 49;  PD2= 50;  PD3= 51;  PD4= 52;  PD5= 53;  PD6= 54;  PD7= 55;
                              PD8= 56;  PD9= 57; PD10= 58; PD11= 59; PD12= 60; PD13= 61; PD14= 62; PD15= 63; {$endif}
    {$if defined (has_gpioe)} PE0= 64;  PE1= 65;  PE2= 66;  PE3= 67;  PE4= 68;  PE5= 69;  PE6= 70;  PE7= 71;
                              PE8= 72;  PE9= 73; PE10= 74; PE11= 75; PE12= 76; PE13= 77; PE14= 78; PE15= 79; {$endif}
    {$if defined (has_gpiof)} PF0= 80;  PF1= 81;  PF2= 82;  PF3= 83;  PF4= 84;  PF5= 85;  PF6= 86;  PF7= 87;
                              PF8= 88;  PF9= 89; PF10= 90; PF11= 91; PF12= 92; PF13= 93; PF14= 94; PF15= 95; {$endif}
    {$if defined (has_gpiog)} PG0= 96;  PG1= 97;  PG2= 98;  PG3= 99;  PG4=100;  PG5=101;  PG6=102;  PG7=103;
                              PG8=104;  PG9=105; PG10=106; PG11=107; PG12=108; PG13=109; PG14=110; PG15=111; {$endif}
    {$if defined (has_gpioh)} PH0=112;  PH1=113;  PH2=114; {$endif}
  end;

  {$if defined(has_arduinopins)}
  type
    TArduinoPin = record
    const
      None=-1;
      {$if defined(nucleof302re)}
      D0 =TNativePin.PA3;  D1 =TNativePin.PA2;  D2 =TNativePin.PA10;  D3 =TNativePin.PB3;
      D4 =TNativePin.PB5;  D5 =TNativePin.PB4;  D6 =TNativePin.PB10;  D7 =TNativePin.PA8;
      D8 =TNativePin.PA9;  D9 =TNativePin.PC7;  D10=TNativePin.PB6;   D11=TNativePin.PB15;
      D12=TNativePin.PB14; D13=TNativePin.PB13; D14=TNativePin.PB9;   D15=TNativePin.PB8;
      {$else}
      D0 =TNativePin.PA3;  D1 =TNativePin.PA2;  D2 =TNativePin.PA10;  D3 =TNativePin.PB3;
      D4 =TNativePin.PB5;  D5 =TNativePin.PB4;  D6 =TNativePin.PB10;  D7 =TNativePin.PA8;
      D8 =TNativePin.PA9;  D9 =TNativePin.PC7;  D10=TNativePin.PB6;   D11=TNativePin.PA7;
      D12=TNativePin.PA6;  D13=TNativePin.PA5;  D14=TNativePin.PB9;   D15=TNativePin.PB8;
      {$endif}

      A0 =TNativePin.PA0;  A1 =TNativePin.PA1;  A2 =TNativePin.PA4;   A3 =TNativePin.PB0;
      A4 =TNativePin.PC1;  A5 =TNativePin.PC0;
    end;
  {$endif}

  {$if defined(has_arduinominipins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PA10; D1 =TNativePin.PA9;  D2 =TNativePin.PA12;  D3 =TNativePin.PB0;
      D4 =TNativePin.PB7;  D5 =TNativePin.PB6;  D6 =TNativePin.PB1;   D7 =TNativePin.PF0;
      D8 =TNativePin.PF1;  D9 =TNativePin.PA8;  D10=TNativePin.PA11;  D11=TNativePin.PB5;
      D12=TNativePin.PB4;  D13=TNativePin.PB3;

      A0 =TNativePin.PA0;  A1 =TNativePin.PA1;  A2 =TNativePin.PA3;   A3 =TNativePin.PA4;
      A4 =TNativePin.PA5;  A6 =TNativePin.PA7;  A7 =TNativePin.PA2;
    end;
  {$endif}

  {$if defined(has_morphopins)}
    TMorphoCN7Pin = record
    const
      None=-1;
      P1 =TNativePin.PC10; P2 =TNativePin.PC11; P3 =TNativePin.PC12; P4 =TNativePin.PD2;
      P13=TNativePin.PA13; P15=TNativePin.PA14; P17=TNativePin.PA15; P21=TNativePin.PB7;
      P23=TNativePin.PC13; P25=TNativePin.PC14; P27=TNativePin.PC15; P28=TNativePin.PA0;
      P29=TNativePin.PF0;  P30=TNativePin.PA1;  P31=TNativePin.PF1;  P32=TNativePin.PA4;
      P34=TNativePin.PB0;  P35=TNativePin.PC2;  P36=TNativePin.PC1;  P37=TNativePin.PC3;
      P38=TNativePin.PC0;
    end;

    TMorphoCN10Pin = record
    const
      None=-1;
      {$if defined(nucleof302re)}
      P1 =TNativePin.PC9;  P2 =TNativePin.PC8;  P3 =TNativePin.PB8;  P4 =TNativePin.PC6;
      P5 =TNativePin.PB9;  P6 =TNativePin.PC5;  P11=TNativePin.PB13; P12=TNativePin.PA12;
      P13=TNativePin.PB14; P14=TNativePin.PA11; P15=TNativePin.PB15; P16=TNativePin.PB12;
      P17=TNativePin.PB6;  P18=TNativePin.PB11; P19=TNativePin.PC7;  P21=TNativePin.PA9;
      P22=TNativePin.PB2;  P23=TNativePin.PA8;  P24=TNativePin.PB1;  P25=TNativePin.PB10;
      P26=TNativePin.PA7;  P27=TNativePin.PB4;  P28=TNativePin.PA6;  P29=TNativePin.PB5;
      P30=TNativePin.PA5;  P31=TNativePin.PB3;  P33=TNativePin.PA10; P34=TNativePin.PC4;
      P35=TNativePin.PA2;  P37=TNativePin.PA3;
      {$else}
      P1 =TNativePin.PC9;  P2 =TNativePin.PC8;  P3 =TNativePin.PB8;  P4 =TNativePin.PC6;
      P5 =TNativePin.PB9;  P6 =TNativePin.PC5;  P10=TNativePin.PD8;  P11=TNativePin.PA5;
      P12=TNativePin.PA12; P13=TNativePin.PA6;  P14=TNativePin.PA11; P15=TNativePin.PA7;
      P16=TNativePin.PB12; P17=TNativePin.PB6;  P19=TNativePin.PC7;  P21=TNativePin.PA9;
      P22=TNativePin.PB2;  P23=TNativePin.PA8;  P24=TNativePin.PB1;  P25=TNativePin.PB10;
      P26=TNativePin.PB15; P27=TNativePin.PB4;  P28=TNativePin.PB14; P29=TNativePin.PB5;
      P30=TNativePin.PB13; P31=TNativePin.PB3;  P33=TNativePin.PA10; P34=TNativePin.PC4;
      P35=TNativePin.PA2;  P37=TNativePin.PA3;
      {$endif}
    end;
  {$endif}
{$endregion}

type
  TPinLevel=(Low=0,High=1);
  TPinValue=0..1;
  TPinIdentifier=-1..160;
  TPinMode = (Input=%00, Output=%01, Analog=%11, AF0=$10, AF1, AF2, AF3, AF4, AF5, AF6, AF7, AF8, AF9, AF10, AF11, AF12, AF13, AF14, AF15);
  TPinDrive = (None=%00,PullUp=%01,PullDown=%10);
  TPinOutputMode = (PushPull=0,OpenDrain=1);
  TPinOutputSpeed = (Slow=%00, Medium=%10, High=%11);

  TBit = (Bit0, Bit1, Bit2, Bit3, Bit4, Bit5, Bit6, Bit7,
          Bit8, Bit9, Bit10, Bit11, Bit12, Bit13, Bit14, Bit15);
  TBitSet = set of TBit;

type
  TGPIO = record
  private type
    pGPIORegisters = ^TGPIO_Registers;
  private const
    // Indexed mapping to GPIO registers.
    GPIOMem: array[0..7] of pGPIORegisters = ({$ifdef has_gpioa}@GPIOA{$else}nil{$endif},
                                              {$ifdef has_gpiob}@GPIOB{$else}nil{$endif},
                                              {$ifdef has_gpioc}@GPIOC{$else}nil{$endif},
                                              {$ifdef has_gpiod}@GPIOD{$else}nil{$endif},
                                              {$ifdef has_gpioe}@GPIOE{$else}nil{$endif},
                                              {$ifdef has_gpiof}@GPIOF{$else}nil{$endif},
                                              {$ifdef has_gpiog}@GPIOG{$else}nil{$endif},
                                              {$ifdef has_gpioh}@GPIOH{$else}nil{$endif});

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
  if GPIO < 7 then
    SetBit(RCC.AHBENR,GPIO+17)
  else
    SetBit(RCC.AHBENR,16);
end;

{$I MBF.STM32.GPIO.inc}

end.

