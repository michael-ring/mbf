unit mbf.stm32f7.gpio;
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

  STM32F75xxx and STM32F74xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00124865.pdf

  STM32F76xxx and STM32F77xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00224583.pdf

  STM32F72xxx and STM32F73xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00305990.pdf
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
    {$if defined (has_gpioh)} PH0=112;  PH1=113;  PH2=114;  PH3=115;  PH4=116;  PH5=117;  PH6=118;  PH7=119;
                              PH8=120;  PH9=121; PH10=122; PH11=123; PH12=124; PH13=125; PH14=126; PH15=127; {$endif}
    {$if defined (has_gpioi)} PI0=128;  PI1=129;  PI2=130;  PI3=131;  PI4=132;  PI5=133;  PI6=134;  PI7=135;
                              PI8=136;  PI9=137; PI10=138; PI11=139; PI12=140; PI13=141; PI14=142; PI15=143; {$endif}
    {$if defined (has_gpioj)} PJ0=144;  PJ1=145;  PJ2=146;  PJ3=147;  PJ4=148;  PJ5=149;  PJ6=150;  PJ7=151;
                              PJ8=152;  PJ9=153; PJ10=154; PJ11=155; PJ12=156; PJ13=157; PJ14=158; PJ15=159; {$endif}
    {$if defined (has_gpiok)} PK0=160;  PK1=161;  PK2=162;  PK3=163;  PK4=164;  PK5=165;  PK6=166;  PK7=167; {$endif}
  end;


  {$if defined(has_arduinopins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PG9;  D1 =TNativePin.PG14; D2 =TNativePin.PF15; D3 =TNativePin.PE13;
      D4 =TNativePin.PF14; D5 =TNativePin.PE11; D6 =TNativePin.PE9;  D7 =TNativePin.PF13;
      D8 =TNativePin.PF12; D9 =TNativePin.PD15; D10=TNativePin.PD14; D11=TNativePin.PA7;
      D12=TNativePin.PA6;  D13=TNativePin.PA5;  D14=TNativePin.PB9;  D15=TNativePin.PB8;

      A0 =TNativePin.PA3;  A1 =TNativePin.PC0;  A2 =TNativePin.PC3;  A3 =TNativePin.PF3;
      A4 =TNativePin.PF5;  A5 =TNativePin.PF10;
    end;
  {$endif}
{$endregion}
type
  TPinLevel=(Low=0,High=1);
  TPinValue=0..1;
  TPinIdentifier=-1..167;
  TPinMode = (Input=%00, Output=%01, Analog=%11, AF0=$10, AF1, AF2, AF3, AF4, AF5, AF6, AF7, AF8, AF9, AF10, AF11, AF12, AF13, AF14, AF15);
  TPinDrive = (None=%00,PullUp=%01,PullDown=%10);
  TPinOutputMode = (PushPull=0,OpenDrain=1);
  TPinOutputSpeed = (Slow=%00, Medium=%01, High=%10, VeryHigh=%11);

  TBit = (Bit0, Bit1, Bit2, Bit3, Bit4, Bit5, Bit6, Bit7,
          Bit8, Bit9, Bit10, Bit11, Bit12, Bit13, Bit14, Bit15);
  TBitSet = set of TBit;

type
  TGPIO = record
  private type
    pGPIORegisters = ^TGPIO_Registers;
  private const
    // Indexed mapping to GPIO registers.
    GPIOMem: array[0..10] of pGPIORegisters = (@GPIOA,
                                              @GPIOB,
                                              @GPIOC,
                                              {$ifdef has_gpiod}@GPIOD{$else}nil{$endif},
                                              {$ifdef has_gpioe}@GPIOE{$else}nil{$endif},
                                              {$ifdef has_gpiof}@GPIOF{$else}nil{$endif},
                                              {$ifdef has_gpiog}@GPIOG{$else}nil{$endif},
                                              {$ifdef has_gpioh}@GPIOH{$else}nil{$endif},
                                              {$ifdef has_gpioi}@GPIOI{$else}nil{$endif},
                                              {$ifdef has_gpioj}@GPIOJ{$else}nil{$endif},
                                              {$ifdef has_gpiok}@GPIOK{$else}nil{$endif});

    function  GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
    function  GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
    function  GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
    procedure SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
    function  GetPinOutputSpeed(const Pin: TPinIdentifier): TPinOutputSpeed;
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
  SetBit(RCC.AHB1ENR,GPIO);
end;

{$I MBF.STM32.GPIO.inc}

end.
