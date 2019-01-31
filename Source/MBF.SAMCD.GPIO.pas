unit MBF.SAMCD.GPIO;
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
{< Atmel SAMD series GPIO functions. }

interface

{$include MBF.Config.inc}

uses
  MBF.SAMCD.Helpers,
  MBF.BitHelpers;

const
  GPIO_PIN_FUNCTION_OFF          = $ffffffff;
  MuxA=$1000;
  MuxB=$1100;
  MuxC=$1200;
  MuxD=$1300;
  MuxE=$1400;
  MuxF=$1400;
  MuxG=$1600;
  MuxH=$1700;
  MuxI=$1800;

  Pad0=$100000;
  Pad1=$110000;
  Pad2=$120000;
  Pad3=$130000;

type
  TPinLevel=(Low=0,High=1);
  TPinValue=0..1;
  TPinIdentifier=-1..160;
  TPinMode = (Off,Input,Output,Analog);
  TPinMux = (MuxA=0,MuxB,MuxC,MuxD,MuxE,MuXF,MuxG,MuxH,MuxI,None=$FF);
  TPinDrive = (None,PullUp,PullDown,StrongPullUp,StrongPullDown);

{$REGION PinDefinitions}

type
  TNativePin = record
  const
    None=-1;
    {$if defined (has_gpioa)} PA0 = 0;  PA1 = 1;  PA2 = 2;  PA3 = 3;  PA4 = 4;  PA5 = 5;  PA6 = 6;  PA7 = 7;
                              PA8 = 8;  PA9 = 9;  PA10=10;  PA11=11;  PA12=12;  PA13=13;  PA14=14;  PA15=15;
                              PA16=16;  PA17=17;  PA18=18;  PA19=19;  PA20=20;  PA21=21;  PA22=22;  PA23=23;
                              PA24=24;  PA25=25;  PA26=26;  PA27=27;  PA28=28;  PA29=29;  PA30=30;  PA31=31; {$endif}

    {$if defined (has_gpiob)} PB0 =32;  PB1 =33;  PB2 =34;  PB3 =35;  PB4 =36;  PB5 =37;  PB6 =38;  PB7 =39;
                              PB8 =40;  PB9 =41;  PB10=42;  PB11=43;  PB12=44;  PB13=45;  PB14=46;  PB15=47;
                              PB16=48;  PB17=49;  PB18=50;  PB19=51;  PB20=52;  PB21=53;  PB22=54;  PB23=55;
                              PB24=56;  PB25=57;  PB26=58;  PB27=59;  PB28=60;  PB29=61;  PB30=62;  PB31=63; {$endif}

    {$if defined (has_gpioc)} PC0 =64;  PC1 =65;  PC2 =66;  PC3 =67;  PC4 =68;  PC5 =69;  PC6 =70;  PC7 =71;
                              PC8 =72;  PC9 =73;  PC10=74;  PC11=75;  PC12=76;  PC13=77;  PC14=78;  PC15=79;
                              PC16=80;  PC17=81;  PC18=82;  PC19=83;  PC20=84;  PC21=85;  PC22=86;  PC23=87;
                              PC24=88;  PC25=89;  PC26=90;  PC27=91;  PC28=92;  PC29=93;  PC30=94;  PC31=95; {$endif}

    {$if defined (has_gpiod)} PD0 =96;  PD1 =97;  PD2 =98;  PD3 =99;  PD4 =100; PD5 =101; PD6 =102; PD7 =103;
                              PD8 =104; PD9 =105; PD10=106; PD11=107; PD12=108; PD13=109; PD14=110; PD15=111;
                              PD16=112; PD17=113; PD18=114; PD19=115; PD20=116; PD21=117; PD22=118; PD23=119;
                              PD24=120; PD25=121; PD26=122; PD27=123; PD28=124; PD29=125; PD30=126; PD31=127; {$endif}

    {$if defined (has_gpioe)} PE0 =128; PE1 =129; PE2 =130; PE3 =131; PE4 =132; PE5 =133; PE6 =134; PE7 =135;
                              PE8 =136; PE9 =137; PE10=138; PE11=139; PE12=140; PE13=141; PE14=142; PE15=143;
                              PE16=144; PE17=145; PE18=146; PE19=147; PE20=148; PE21=149; PE22=150; PE23=151;
                              PE24=152; PE25=153; PE26=154; PE27=155; PE28=156; PE29=157; PE30=158; PE31=159; {$endif}
  end;

  {$if defined(has_arduinopins)}
  {$if defined(SAMD10XMINI) }
  type
    TArduinoPin = record
    const
      None=-1;
      D0 = TNativePin.PA11;  D1 = TNativePin.PA10;  D2 = TNativePin.PA16;  D3 = TNativePin.PA17;
      D4 = TNativePin.PA27;  D5 = TNativePin.PA25;  D6 = TNativePin.PA30;  D7 = TNativePin.PA31;

      D8 = TNativePin.None;  D9 = TNativePin.None;  D10= TNativePin.PA23;  D11= TNativePin.PA22;
      D12= TNativePin.PA24;  D13= TNativePin.PA9;   D14= TNativePin.PA14;  D15= TNativePin.PA15;

      A0 = TNativePin.PA2;   A1 = TNativePin.PA3;   A2 = TNativePin.PA4;   A3 = TNativePin.PA5;
      A4 = TNativePin.PA6;   A5 = TNativePin.PA7;
    end;
  {$endif}

  {$if defined(ARDUINOZERO) }
  type
    TArduinoPin = record
    const
      None=-1;
      D0 = TNativePin.PA11;   D1 = TNativePin.PA10;   D2 = TNativePin.PA8;  D3 = TNativePin.PA9;
      D4 = TNativePin.PA14;   D5 = TNativePin.PA15;  D6 = TNativePin.PA20;  D7 = TNativePin.PA21;

      D8 = TNativePin.PA6;   D9 = TNativePin.PA7;   D10= TNativePin.PA18;   D11= TNativePin.PA16;
      D12= TNativePin.PA19;   D13= TNativePin.PA17;   D14= TNativePin.PA22;   D15= TNativePin.PA23;

      A0 = TNativePin.PA2;   A1 = TNativePin.PB8;   A2 = TNativePin.PB9;  A3 = TNativePin.PA4;
      A4 = TNativePin.PA5;   A5 = TNativePin.PB2;
    end;
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) }
  // Arduino Pins via AtmelXPlained Shield Adapter
  type
    TArduinoPin = record
    const
      None=-1;
      D0 = TNativePin.PB9;   D1 = TNativePin.PB8;   D2 = TNativePin.PB14;  D3 = TNativePin.PB2;
      D4 = TNativePin.PB5;   D5 = TNativePin.PA21;  D6 = TNativePin.PB15;  D7 = TNativePin.PA17;

      D8 = TNativePin.PB6;   D9 = TNativePin.PB7;   D10= TNativePin.PA5;   D11= TNativePin.PA6;
      D12= TNativePin.PA4;   D13= TNativePin.PA7;   D14= TNativePin.PA8;   D15= TNativePin.PA9;

      A0 = TNativePin.PB0;   A1 = TNativePin.PB1;   A2 = TNativePin.PA10;  A3 = TNativePin.PA11;
      A4 = TNativePin.PA8;   A5 = TNativePin.PA9;
    end;
  {$endif}

  {$if defined(SAMC21XPRO) }
  type
    TArduinoPin = record
    const
      None=-1;
      D0 = TNativePin.PA23;  D1 = TNativePin.PA22;  D2 = TNativePin.PA20;  D3 = TNativePin.PB12;
      D4 = TNativePin.PA21;  D5 = TNativePin.PB13;  D6 = TNativePin.PB30;  D7 = TNativePin.PB4;

      D8 = TNativePin.PB5;   D9 = TNativePin.PB31;  D10= TNativePin.PA27;  D11= TNativePin.PB0;
      D12= TNativePin.PB2;   D13= TNativePin.PB1;   D14= TNativePin.PA12;  D15= TNativePin.PA13;

      A0 = TNativePin.PB9;   A1 = TNativePin.PB8;   A2 = TNativePin.PA8;   A3 = TNativePin.PA9;
      A4 = TNativePin.PB7;   A5 = TNativePin.PB6;
    end;
  {$endif}
  {$endif}

  {$ifdef has_samd20_xplained_pro}
  const
    LED0                     = TNativePin.PA14;
    SW0                      = TNativePin.PA15;
    // Extension header #1 pin definitions
    EXT1_PIN_3               = TNativePin.PB0;
    EXT1_PIN_4               = TNativePin.PB1;
    EXT1_PIN_5               = TNativePin.PB6;
    EXT1_PIN_6               = TNativePin.PB7;
    EXT1_PIN_7               = TNativePin.PB2;
    EXT1_PIN_8               = TNativePin.PB3;
    EXT1_PIN_9               = TNativePin.PB4;
    EXT1_PIN_10              = TNativePin.PB5;
    EXT1_PIN_11              = TNativePin.PA8;
    EXT1_PIN_12              = TNativePin.PA9;
    EXT1_PIN_13              = TNativePin.PB9;
    EXT1_PIN_14              = TNativePin.PB8;
    EXT1_PIN_15              = TNativePin.PA5;
    EXT1_PIN_16              = TNativePin.PA6;
    EXT1_PIN_17              = TNativePin.PA4;
    EXT1_PIN_18              = TNativePin.PA7;

    // Extension header #2 pin definitions
    EXT2_PIN_3               = TNativePin.PA10;
    EXT2_PIN_4               = TNativePin.PA11;
    EXT2_PIN_5               = TNativePin.PA20;
    EXT2_PIN_6               = TNativePin.PA21;
    EXT2_PIN_7               = TNativePin.PA22;
    EXT2_PIN_8               = TNativePin.PA23;
    EXT2_PIN_9               = TNativePin.PB14;
    EXT2_PIN_10              = TNativePin.PB15;
    EXT2_PIN_11              = TNativePin.PA8;
    EXT2_PIN_12              = TNativePin.PA9;
    EXT2_PIN_13              = TNativePin.PB13;
    EXT2_PIN_14              = TNativePin.PB12;
    EXT2_PIN_15              = TNativePin.PA17;
    EXT2_PIN_16              = TNativePin.PA18;
    EXT2_PIN_17              = TNativePin.PA16;
    EXT2_PIN_18              = TNativePin.PA19;

    // Extension header #3 pin definitions
    EXT3_PIN_3               = TNativePin.PA2;
    EXT3_PIN_4               = TNativePin.PA3;
    EXT3_PIN_5               = TNativePin.PB30;
    EXT3_PIN_6               = TNativePin.PA15;
    EXT3_PIN_7               = TNativePin.PA12;
    EXT3_PIN_8               = TNativePin.PA13;
    EXT3_PIN_9               = TNativePin.PA28;
    EXT3_PIN_10              = TNativePin.PA27;
    EXT3_PIN_11              = TNativePin.PA8;
    EXT3_PIN_12              = TNativePin.PA9;
    EXT3_PIN_13              = TNativePin.PB11;
    EXT3_PIN_14              = TNativePin.PB10;
    EXT3_PIN_15              = TNativePin.PB17;
    EXT3_PIN_16              = TNativePin.PB22;
    EXT3_PIN_17              = TNativePin.PB16;
    EXT3_PIN_18              = TNativePin.PB23;
  {$endif}

  {$ifdef has_samd21_xplained_pro}
  const
    LED0                     = TNativePin.PB30;
    SW0                      = TNativePin.PA15;

    // Extension header #1 pin definitions
    EXT1_PIN_3               = TNativePin.PB0;
    EXT1_PIN_4               = TNativePin.PB1;
    EXT1_PIN_5               = TNativePin.PB6;
    EXT1_PIN_6               = TNativePin.PB7;
    EXT1_PIN_7               = TNativePin.PB2;
    EXT1_PIN_8               = TNativePin.PB3;
    EXT1_PIN_9               = TNativePin.PB4;
    EXT1_PIN_10              = TNativePin.PB5;
    EXT1_PIN_11              = TNativePin.PA8;
    EXT1_PIN_12              = TNativePin.PA9;
    EXT1_PIN_13              = TNativePin.PB9;
    EXT1_PIN_14              = TNativePin.PB8;
    EXT1_PIN_15              = TNativePin.PA5;
    EXT1_PIN_16              = TNativePin.PA6;
    EXT1_PIN_17              = TNativePin.PA4;
    EXT1_PIN_18              = TNativePin.PA7;

    // Extension header #2 pin definitions
    EXT2_PIN_3               = TNativePin.PA10;
    EXT2_PIN_4               = TNativePin.PA11;
    EXT2_PIN_5               = TNativePin.PA20;
    EXT2_PIN_6               = TNativePin.PA21;
    EXT2_PIN_7               = TNativePin.PB12;
    EXT2_PIN_8               = TNativePin.PB13;
    EXT2_PIN_9               = TNativePin.PB14;
    EXT2_PIN_10              = TNativePin.PB15;
    EXT2_PIN_11              = TNativePin.PA8;
    EXT2_PIN_12              = TNativePin.PA9;
    EXT2_PIN_13              = TNativePin.PB11;
    EXT2_PIN_14              = TNativePin.PB10;
    EXT2_PIN_15              = TNativePin.PA17;
    EXT2_PIN_16              = TNativePin.PA18;
    EXT2_PIN_17              = TNativePin.PA16;
    EXT2_PIN_18              = TNativePin.PA19;

    // Extension header #3 pin definitions
    EXT3_PIN_3               = TNativePin.PA2;
    EXT3_PIN_4               = TNativePin.PA3;
    EXT3_PIN_5               = TNativePin.PB30;
    EXT3_PIN_6               = TNativePin.PA15;
    EXT3_PIN_7               = TNativePin.PA12;
    EXT3_PIN_8               = TNativePin.PA13;
    EXT3_PIN_9               = TNativePin.PA28;
    EXT3_PIN_10              = TNativePin.PA27;
    EXT3_PIN_11              = TNativePin.PA8;
    EXT3_PIN_12              = TNativePin.PA9;
    EXT3_PIN_13              = TNativePin.PB11;
    EXT3_PIN_14              = TNativePin.PB10;
    EXT3_PIN_15              = TNativePin.PB17;
    EXT3_PIN_16              = TNativePin.PB22;
    EXT3_PIN_17              = TNativePin.PB16;
    EXT3_PIN_18              = TNativePin.PB23;

  {$endif}

  {$ifdef has_samc21_xplained_pro}
  const
    LED0                     = TNativePin.PA15;
    SW0                      = TNativePin.PA28;

    EXT1_PIN_3               = TNativePin.PB9;
    EXT1_PIN_4               = TNativePin.PB8;
    EXT1_PIN_5               = TNativePin.PA20;
    EXT1_PIN_6               = TNativePin.PA21;
    EXT1_PIN_7               = TNativePin.PB12;
    EXT1_PIN_8               = TNativePin.PB13;
    EXT1_PIN_9               = TNativePin.PB14;
    EXT1_PIN_10              = TNativePin.PB15;
    EXT1_PIN_11              = TNativePin.PA12;
    EXT1_PIN_12              = TNativePin.PA13;
    EXT1_PIN_13              = TNativePin.PA23;
    EXT1_PIN_14              = TNativePin.PA22;
    EXT1_PIN_15              = TNativePin.PA17;
    EXT1_PIN_16              = TNativePin.PA18;
    EXT1_PIN_17              = TNativePin.PA16;
    EXT1_PIN_18              = TNativePin.PA19;

    EXT2_PIN_3 = TNativePin.PA8;
    EXT2_PIN_4 = TNativePin.PA9;
    EXT2_PIN_5 = TNativePin.PA10;
    EXT2_PIN_6 = TNativePin.PA11;
    EXT2_PIN_7 = TNativePin.PB30;
    EXT2_PIN_8 = TNativePin.PB31;
    EXT2_PIN_9 = TNativePin.PB16;
    EXT2_PIN_10 = TNativePin.PB17;
    EXT2_PIN_11 = TNativePin.PA12;
    EXT2_PIN_12 = TNativePin.PA13;
    EXT2_PIN_13 = TNativePin.PA23;
    EXT2_PIN_14 = TNativePin.PA22;
    EXT2_PIN_15 = TNativePin.PB3;
    EXT2_PIN_16 = TNativePin.PB0;
    EXT2_PIN_17 = TNativePin.PB2;
    EXT2_PIN_18 = TNativePin.PB1;

    EXT3_PIN_3 = TNativePin.PB7;
    EXT3_PIN_4 = TNativePin.PB6;
    EXT3_PIN_5 = TNativePin.PB4;
    EXT3_PIN_6 = TNativePin.PB5;
    EXT3_PIN_7 = TNativePin.PA14;
    EXT3_PIN_8 = TNativePin.PA15;
    EXT3_PIN_9 = TNativePin.PA28;
    EXT3_PIN_10 = TNativePin.PA27;
    EXT3_PIN_11 = TNativePin.PA12;
    EXT3_PIN_12 = TNativePin.PA13;
    EXT3_PIN_13 = TNativePin.PA23;
    EXT3_PIN_14 = TNativePin.PA22;
    EXT3_PIN_15 = TNativePin.PA2;
    EXT3_PIN_16 = TNativePin.PB0;
    EXT3_PIN_17 = TNativePin.PB2;
    EXT3_PIN_18 = TNativePin.PB1;

  {$endif}

{$endregion}

type
  TGPIO_Registers = record
  strict private type
    PTPortGroup_Registers=^TPortGroup_Registers;
  strict private
    FPGPIOPort:PTPortGroup_Registers;
    FGPIOMask:longword;
    FGPIOPinNo:byte;
    property GPIOMask:longword read FGPIOMask;
    property GPIOPinNo:byte read FGPIOPinNo;
    property PGPIOPort:PTPortGroup_Registers read FPGPIOPort;
  strict private const
    procedure GetPinPortMask(const Pin: TPinIdentifier);
    function  GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
    function  GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);

    { Sets new mux for the specified pin. }
    procedure SetPinMux(const Pin: TPinIdentifier; const Value: TPinMux);
  public
    procedure Initialize;

    function  GetPinValue(const Pin: TPinIdentifier): TPinValue;
    procedure SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
    procedure TogglePinValue(const Pin: TPinIdentifier);

    function  GetPinLevel(const Pin: TPinIdentifier): TPinLevel;
    procedure SetPinLevel(const Pin: TPinIdentifier; const Value: TPinLevel);
    procedure SetPinLevelHigh(const Pin: TPinIdentifier);
    procedure SetPinLevelLow(const Pin: TPinIdentifier);
    procedure TogglePinLevel(const Pin: TPinIdentifier);

    property  PinMux[const Pin: TPinIdentifier]      : TPinMux   write SetPinMux;
    property  PinMode[const Pin : TPinIdentifier]    : TPinMode  read GetPinMode  write SetPinMode;
    property  PinDrive[const Pin : TPinIdentifier]   : TPinDrive read GetPinDrive write SetPinDrive;
    property  PinValue[const Pin : TPinIdentifier]   : TPinValue read GetPinValue write SetPinValue;
    property  PinLevel[const Pin : TPinIdentifier]   : TPinLevel read GetPinLevel write SetPinLevel;
  end;

var
  GPIO : TGPIO_Registers;

implementation

procedure TGPIO_Registers.Initialize;
begin
  {$ifdef samd}
  SetBit(PM.APBBMASK,PM_APBBMASK_PORT_Pos);
  {$endif}
  {$ifdef samc}
  SetBit(MCLK.APBBMASK,MCLK_APBBMASK_PORT_Pos);
  {$endif}
end;

procedure TGPIO_Registers.GetPinPortMask(const Pin: TPinIdentifier);
begin
  FGPIOPinNo:=(Pin AND $1F);
  FGPIOMask:=(1 shl FGPIOPinNo);
  FPGPIOPort:=@PORT.Group[Pin shr 5];
end;

procedure TGPIO_Registers.SetPinMux(const Pin: TPinIdentifier; const Value: TPinMux);
var
  aPINCFG:PByte;
  aMuxIndex:byte;
begin
  GetPinPortMask(Pin);
  aPINCFG:=@PGPIOPort^.PINCFG[GPIOPinNo];

  if (Value=TPinMux.None) then
  begin
    ClearBit(aPINCFG^,PORT_PINCFG_PMUXEN_Pos);
  end
  else
  begin
    aMuxIndex:=(GPIOPinNo shr 1);
    if ((GPIOPinNo AND 1) = 1) then
      SetBitsMasked(PGPIOPort^.PMUX[aMuxIndex],Ord(Value),PORT_PMUX_PMUXO_Msk,PORT_PMUX_PMUXO_Pos)
    else
      SetBitsMasked(PGPIOPort^.PMUX[aMuxIndex],Ord(Value),PORT_PMUX_PMUXE_Msk,PORT_PMUX_PMUXE_Pos);
    SetBit(aPINCFG^,PORT_PINCFG_PMUXEN_Pos);
  end;
end;


function TGPIO_Registers.GetPinMode(const Pin: TPinIdentifier): TPinMode;
begin
  GetPinPortMask(Pin);
  result:=TPinMode.Off;
  if GetBit(PGPIOPort^.DIR,GPIOPinNo) = 1 then
  begin
    result:=TPinMode.Output;
  end
  else
  begin
    if GetBit(PGPIOPort^.PINCFG[GPIOPinNo],PORT_PINCFG_INEN_Pos)=1 then
      result:=TPinMode.Input;
  end;
end;

procedure TGPIO_Registers.SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
var
  aPINCFG:PByte;
begin
  GetPinPortMask(Pin);
  aPINCFG:=@PGPIOPort^.PINCFG[GPIOPinNo];

  case (Value) of
    TPinMode.Off,TPinMode.Analog:
    begin
      PGPIOPort^.DIRCLR:=GPIOMask;
      // disable input buffer for the I/O pin
      ClearBit(aPINCFG^,PORT_PINCFG_INEN_Pos);
      // disable input pullup for the I/O pin
      ClearBit(aPINCFG^,PORT_PINCFG_PULLEN_Pos);
      if Value=TPinMode.Off then SetPinMux(Pin,TPinMux.None);
      if Value=TPinMode.Analog then SetPinMux(Pin,TPinMux.MuxB); // presume analogue is always on MuxB ... ;-)
    end;

    TPinMode.Input:
    begin
      PGPIOPort^.DIRCLR:=GPIOMask;
      // enable input buffer for the I/O pin: input value will be sampled when required
      SetBit(aPINCFG^,PORT_PINCFG_INEN_Pos);
       // disable input pullup for the I/O pin
      ClearBit(aPINCFG^,PORT_PINCFG_PULLEN_Pos);
    end;

    TPinMode.Output:
    begin
      // set pin as output
      PGPIOPort^.DIRSET:=GPIOMask;
      // enable input buffer for the I/O pin: input value will be sampled when required
      SetBit(aPINCFG^,PORT_PINCFG_INEN_Pos);
      // Cannot use a pullup if the output driver is enabled
      ClearBit(aPINCFG^,PORT_PINCFG_PULLEN_Pos);
    end;

  end;
end;

function TGPIO_Registers.GetPinValue(const Pin: TPinIdentifier): TPinValue;
begin
  GetPinPortMask(Pin);
  result:=0;
  if GetBit(PGPIOPort^.&IN,GPIOPinNo) = 1 then result:=1;
end;

procedure TGPIO_Registers.SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
begin
  GetPinPortMask(Pin);
  case (Value) of
    0:
    begin
      PGPIOPort^.OUTCLR:=GPIOMask;
    end;
    1:
    begin
      PGPIOPort^.OUTSET:=GPIOMask;
    end;
  end;
end;

procedure TGPIO_Registers.TogglePinValue(const Pin: TPinIdentifier);
begin
  GetPinPortMask(Pin);
  PGPIOPort^.OUTTGL:=GPIOMask;
end;

function TGPIO_Registers.GetPinLevel(const Pin: TPinIdentifier): TPinLevel;
begin
  GetPinPortMask(Pin);
  result:=TPinLevel.Low;
  if GetBit(PGPIOPort^.&IN,GPIOPinNo) = 1 then result:=TPinLevel.High;
end;

procedure TGPIO_Registers.SetPinLevel(const Pin: TPinIdentifier; const Value: TPinLevel);
begin
  GetPinPortMask(Pin);
  case (Value) of
    TPinLevel.Low:
      PGPIOPort^.OUTCLR:=GPIOMask;
    else
      PGPIOPort^.OUTSET:=GPIOMask;
  end;
end;

procedure TGPIO_Registers.SetPinLevelHigh(const Pin: TPinIdentifier);
begin
  SetPinValue(Pin,1);
end;
procedure TGPIO_Registers.SetPinLevelLow(const Pin: TPinIdentifier);
begin
  SetPinValue(Pin,0);
end;

procedure TGPIO_Registers.TogglePinLevel(const Pin: TPinIdentifier);
begin
  GetPinPortMask(Pin);
  PGPIOPort^.OUTTGL:=GPIOMask;
end;


function TGPIO_Registers.GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
var
  aPINCFG:PByte;
begin
  GetPinPortMask(Pin);
  aPINCFG:=@PGPIOPort^.PINCFG[GPIOPinNo];

  result:=TPinDrive.None;
  if GetBit(PGPIOPort^.DIR,GPIOPinNo)=0 then
  begin
    if GetBit(aPINCFG^,PORT_PINCFG_PULLEN_Pos)=1 then
    begin
      if GetBit(PGPIOPort^.OUT,GPIOPinNo) = 0 then
        result:=TPinDrive.PullDown
      else
        result:=TPinDrive.PullUp;
      if GetBit(aPINCFG^,PORT_PINCFG_DRVSTR_Pos)=1 then
      begin
        if result=TPinDrive.PullDown then result:=TPinDrive.StrongPullDown;
        if result=TPinDrive.PullUp then result:=TPinDrive.StrongPullUp;
      end;
    end;
  end;
end;

procedure TGPIO_Registers.SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
var
  aPINCFG:PByte;
begin
  GetPinPortMask(Pin);
  aPINCFG:=@PGPIOPort^.PINCFG[GPIOPinNo];

  if value=TPinDrive.None then
  begin
    ClearBit(aPINCFG^,PORT_PINCFG_PULLEN_Pos);
    ClearBit(aPINCFG^,PORT_PINCFG_DRVSTR_Pos);
  end
  else
  begin

    if value in [TPinDrive.PullDown,TPinDrive.StrongPullDown] then
    begin
      PGPIOPort^.OUTCLR:=GPIOMask;
    end;
    if value in [TPinDrive.PullUp,TPinDrive.StrongPullUp] then
    begin
      PGPIOPort^.OUTSET:=GPIOMask;
    end;

    SetBit(aPINCFG^,PORT_PINCFG_PULLEN_Pos);

    if value in [TPinDrive.StrongPullDown,TPinDrive.StrongPullUp] then
    begin
      SetBit(aPINCFG^,PORT_PINCFG_DRVSTR_Pos);
    end;
  end;
end;

end.
