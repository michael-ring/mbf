unit MBF.Kinetis.GPIO;
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
{< Freescale Kinetis Chip series GPIO functions. }

interface

{$include MBF.Config.inc}

//Define Offsets for Alternate Functions so that the AF Code can be added to the Pin Definition
const
  ALT1=$100;
  ALT2=$200;
  ALT3=$300;
  ALT4=$400;
  ALT5=$500;
  ALT6=$600;
  ALT7=$700;

type
  TNativePin = record
  const
    PA0 =0;   PA1 =1;   PA2 =2;   PA3 =3;   PA4 =4;   PA5 =5;   PA6 =6;   PA7 =7;
    PA8 =8;   PA9 =9;   PA10=10;  PA11=11;  PA12=12;  PA13=13;  PA14=14;  PA15=15;
    PA16=16;  PA17=17;  PA18=18;  PA19=19;  PA20=20;  PA21=21;  PA22=22;  PA23=23;
    PA24=24;  PA25=25;  PA26=26;  PA27=27;  PA28=28;  PA29=29;  PA30=30;  PA31=31;

    PB0 =32;  PB1 =33;  PB2 =34;  PB3 =35;  PB4 =36;  PB5 =37;  PB6 =38;  PB7 =39;
    PB8 =40;  PB9 =41;  PB10=42;  PB11=43;  PB12=44;  PB13=45;  PB14=46;  PB15=47;
    PB16=48;  PB17=49;  PB18=50;  PB19=51;  PB20=52;  PB21=53;  PB22=54;  PB23=55;
    PB24=56;  PB25=57;  PB26=58;  PB27=59;  PB28=60;  PB29=61;  PB30=62;  PB31=63;

    PC0 =64;  PC1 =65;  PC2 =66;  PC3 =67;  PC4 =68;  PC5 =69;  PC6 =70;  PC7 =71;
    PC8 =72;  PC9 =73;  PC10=74;  PC11=75;  PC12=76;  PC13=77;  PC14=78;  PC15=79;
    PC16=80;  PC17=81;  PC18=82;  PC19=83;  PC20=84;  PC21=85;  PC22=86;  PC23=87;
    PC24=88;  PC25=89;  PC26=90;  PC27=91;  PC28=92;  PC29=93;  PC30=94;  PC31=95;

    PD0 =96;  PD1 =97;  PD2 =98;  PD3 =99;  PD4 =100; PD5 =101; PD6 =102; PD7 =103;
    PD8 =104; PD9 =105; PD10=106; PD11=107; PD12=108; PD13=109; PD14=110; PD15=111;
    PD16=112; PD17=113; PD18=114; PD19=115; PD20=116; PD21=117; PD22=118; PD23=119;
    PD24=120; PD25=121; PD26=122; PD27=123; PD28=124; PD29=125; PD30=126; PD31=127;

    PE0 =128; PE1 =129; PE2 =130; PE3 =131; PE4 =132; PE5 =133; PE6 =134; PE7 =135;
    PE8 =136; PE9 =137; PE10=138; PE11=139; PE12=140; PE13=141; PE14=142; PE15=143;
    PE16=144; PE17=145; PE18=146; PE19=147; PE20=148; PE21=149; PE22=150; PE23=151;
    PE24=152; PE25=153; PE26=154; PE27=155; PE28=156; PE29=157; PE30=158; PE31=159;

    NONE=-1;
  end;

{$if defined(teensy30)or defined(teensy31) or defined(teensy32)}
  type
    TTeensy = record
    const
      Pin0 =TNativePin.PB16; Pin1 =TNativePin.PB17; Pin2 =TNativePin.PD0;   Pin3 =TNativePin.PA12;
      Pin4 =TNativePin.PA13; Pin5 =TNativePin.PD7;  Pin6 =TNativePin.PD4;   Pin7 =TNativePin.PD2;
      Pin8 =TNativePin.PD3;  Pin9 =TNativePin.PC3;  Pin10=TNativePin.PC4;   Pin11=TNativePin.PC6;
      Pin12=TNativePin.PC7;  Pin13=TNativePin.PC5;  Pin14=TNativePin.PD1;   Pin15=TNativePin.PC0;
      Pin16=TNativePin.PB0;  Pin17=TNativePin.PB1;  Pin18=TNativePin.PB3;   Pin19=TNativePin.PB2;
      Pin20=TNativePin.PD5;  Pin21=TNativePin.PD6;  Pin22=TNativePin.PC1;   Pin23=TNativePin.PC2;
      Pin24=TNativePin.PA5;  Pin25=TNativePin.PB19; Pin26=TNativePin.PE1;   Pin27=TNativePin.PC9;
      Pin28=TNativePin.PC8;  Pin29=TNativePin.PC10; Pin30=TNativePin.PC11;  Pin31=TNativePin.PE0;
      Pin32=TNativePin.PB18; Pin33=TNativePin.PA4;
    end;

  type
    //This is for the SparkFun Teensy Adapter
    TArduinoPin = record
    const
      D0 =TNativePin.PB16; D1 =TNativePin.PB17; D2 =TNativePin.PD0;   D3 =TNativePin.PA12;
      D4 =TNativePin.PA13; D5 =TNativePin.PD7;  D6 =TNativePin.PD4;   D7 =TNativePin.PD2;
      D8 =TNativePin.PD3;  D9 =TNativePin.PC3;  D10=TNativePin.PC4;   D11=TNativePin.PC6;
      D12=TNativePin.PC7;  D13=TNativePin.PC5;  D14=TNativePin.PB3;   D15=TNativePin.PB2;

      A0 =TNativePin.PD1;  A1 =TNativePin.PC0;  A2 =TNativePin.PB0;   A3 =TNativePin.PB1;
      A4 =TNativePin.PD5;  A5 =TNativePin.PD6;
      NONE=$ffffffff;
    end;

{$endif}

{$if defined(freedom_k22f)}
type
  TArduinoPin = record
  const
    D0 =TNativePin.PD2;  D1 =TNativePin.PD3;  D2 =TNativePin.PB16;  D3 =TNativePin.PA2;
    D4 =TNativePin.PA4;  D5 =TNativePin.PB18; D6 =TNativePin.PC3;   D7 =TNativePin.PC6;
    D8 =TNativePin.PB19; D9 =TNativePin.PA1;  D10=TNativePin.PD4;   D11=TNativePin.PD6;
    D12=TNativePin.PD7;  D13=TNativePin.PD5;  D14=TNativePin.PE0;   D15=TNativePin.PE1;

    A0 =TNativePin.PB0;  A1 =TNativePin.PB1;  A2 =TNativePin.PC1;   A3 =TNativePin.PC2;
    A4 =TNativePin.PB3;  A5 =TNativePin.PB2;
    NONE=$ffffffff;
  end;
{$endif}

type
  TPinLevel=(Low=0,High=1);
  TPinValue=0..1;
  TPinIdentifier=-1..160;
  TPinMode = (Analog=0, Input=1, AF2=2, AF3=3, AF4=4, AF5=5, AF6=6, AF7=7, Output=8);
  TPinDrive = (None=0,PullDown=%01,PullUp=%11);
  TPinOutputMode = (PushPull=0,OpenDrain=1);
  TPinSlewRate = (Fast=0, Slow=1);
  TPinDriveStrength = (Low=0, High=1);
  TPinInputFilter = (Disabled=0, Enabled=1);

  pTGPIO_Registers = ^TGPIO_Registers;
  pTPort_Registers = ^TPort_Registers;

  TGPIO = record
  private
  const
    PortMem: array[0..4] of pTPort_Registers = (@PortA,
                                                @PortB,
                                                @PortC,
                                                @PortD,
                                                @PortE);
    GPIOMem: array[0..4] of pTGPIO_Registers = (@PTA,
                                                @PTB,
                                                @PTC,
                                                @PTD,
                                                @PTE);
  end;

type
  TGPIOHelper = record helper for TGPIO
    function  GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);

    function  GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);

    function  GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
    procedure SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);

    function  GetPinSlewRate(const Pin: TPinIdentifier): TPinSlewRate;
    procedure SetPinSlewRate(const Pin: TPinIdentifier; const Value: TPinSlewRate);

    function  GetPinDriveStrength(const Pin: TPinIdentifier): TPinDriveStrength;
    procedure SetPinDriveStrength(const Pin: TPinIdentifier; const Value: TPinDriveStrength);

    function  GetPinInputFilter(const Pin: TPinIdentifier): TPinInputFilter;
    procedure SetPinInputFilter(const Pin: TPinIdentifier; const Value: TPinInputFilter);
  public
    procedure Initialize;
    function  GetPinValue(const Pin: TPinIdentifier): TPinValue;
    procedure SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
    function  GetPinLevel(const Pin: TPinIdentifier): TPinLevel;
    procedure SetPinLevel(const Pin: TPinIdentifier; const Value: TPinLevel);
    procedure SetPinLevelHigh(const Pin: TPinIdentifier);
    procedure SetPinLevelLow(const Pin: TPinIdentifier);
    procedure TogglePinValue(const Pin: TPinIdentifier);
    procedure TogglePinLevel(const Pin: TPinIdentifier);

    procedure configure(const Pin: TPinIdentifier;const Mode: TPinMode; Drive : TPinDrive = TPinDrive.None;
                                                                        OutputMode : TPinOutputMode = TPinOutputMode.PushPull;
                                                                        SlewRate : TPinSlewRate = TPinSlewRate.Slow;
                                                                        DriveStrength : TPinDriveStrength = TPinDriveStrength.High;
                                                                        InputFilter : TPinInputFilter = TPinInputFilter.Disabled);

    property PinMode[const Pin : TPinIdentifier]: TPinMode read getPinMode write setPinMode;
    property PinDrive[const Pin : TPinIdentifier] : TPinDrive read getPinDrive write setPinDrive;
    property PinOutputMode[const Pin : TPinIdentifier] : TPinOutputMode read getPinOutputMode write setPinOutputMode;
    property PinSlewRate[const Pin : TPinIdentifier] : TPinSlewRate read getPinSlewRate write setPinSlewRate;
    property PinDriveStrength[const Pin : TPinIdentifier] : TPinDriveStrength read getPinDriveStrength write setPinDriveStrength;
    property PinInputFilter[const Pin : TPinIdentifier] : TPinInputFilter read getPinInputFilter write setPinInputFilter;
    property PinValue[const Pin : TPinIdentifier] : TPinValue read getPinValue write setPinValue;
    property PinLevel[const Pin : TPinIdentifier] : TPinLevel read getPinLevel write setPinLevel;
  end;

var
  GPIO : TGPIO;

implementation
{$REGION 'Global Types, Constants and Variables'}
{$ENDREGION}

{$REGION 'TGPIO'}
procedure TGPIOHelper.Initialize;
begin
  //Nothing (yet) to do here
end;

function TGPIOHelper.GetPinMode(const Pin: TPinIdentifier): TPinMode;
var
  _PinMode : byte;
begin
  _PinMode := ((PortMem[Pin shr 5]^.PCR[Pin and $1f]) shr 8) and %111;
  if (_PinMode = 1) and ((GPIOMem[Pin shr 5]^.PDDR shr (Pin and $1f)) and %1 = 1) then
    _PinMode := 8;
  Result := TPinMode(_PinMode);  
end;

procedure TGPIOHelper.SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
const
  DefInputMode =     %00000000;
  DefOutputMode =    %01000000;
  DefAlternateMode = %00000000;
  DefAnalogMode =    %00000000;
var
  BitMask : longWord;
  Bit,GPIO : longWord;
begin
  GPIO := Pin shr 5;
  Bit := Pin and $1f;
  BitMask := not(1 shl Bit);

  //First make sure that the GPIO Clock is enabled
  SIM.SCGC5 := SIM.SCGC5 or longWord(1 shl (9+GPIO));

  case Value of
    TPinMode.Input     : begin
                           PortMem[GPIO]^.PCR[Bit] := (%001 shl 8) or DefInputMode;
                           //Enable Input Mode
                           GPIOMem[GPIO]^.PDDR := GPIOMem[GPIO]^.PDDR and BitMask;
                         end;
    TPinMode.Output    : begin
                           PortMem[GPIO]^.PCR[Bit] := (%001 shl 8) or DefOutputMode;
                           //Enable Output Mode
                           GPIOMem[GPIO]^.PDDR := GPIOMem[GPIO]^.PDDR or longWord(1 shl Bit);
                         end;

    TPinMode.Analog    : begin
                           PortMem[GPIO]^.PCR[Bit] := DefAnalogMode;
                         end;
    else
                         begin
                           PortMem[GPIO]^.PCR[Bit] := (Byte(Value) shl 8) or DefAlternateMode;
                         end;
  end;
end;

procedure TGPIOHelper.configure(const Pin: TPinIdentifier;const Mode: TPinMode; Drive : TPinDrive = TPinDrive.None;
                                                                    OutputMode : TPinOutputMode = TPinOutputMode.PushPull;
                                                                    SlewRate : TPinSlewRate = TPinSlewRate.Slow;
                                                                    DriveStrength : TPinDriveStrength = TPinDriveStrength.High;
                                                                    InputFilter : TPinInputFilter = TPinInputFilter.Disabled);
var
  BitMask : longWord;
  Bit,GPIO : longWord;
begin
  GPIO := Pin shr 5;
  Bit := Pin and $1f;
  BitMask := not(1 shl Bit);

  //First make sure that the GPIO Clock is enabled
  SIM.SCGC5 := SIM.SCGC5 or longWord(1 shl (9+GPIO));

  case Mode of
    TPinMode.Input     : begin
                           PortMem[GPIO]^.PCR[Bit] := (%001 shl 8) or (longWord(InputFilter) shl 4)
                                                                   or longWord(Drive);
                           //Enable Input Mode
                           GPIOMem[GPIO]^.PDDR := GPIOMem[GPIO]^.PDDR and BitMask;
                         end;
    TPinMode.Output    : begin
                           PortMem[GPIO]^.PCR[Bit] := (%001 shl 8) or (longWord(DriveStrength) shl 6)
                                                                   or (longWord(OutputMode) shl 5)
                                                                   or (longWord(SlewRate) shl 2)
                                                                   or longWord(Drive);
                           //Enable Output Mode
                           GPIOMem[GPIO]^.PDDR := GPIOMem[GPIO]^.PDDR or longWord(1 shl Bit);
                         end;

    TPinMode.Analog    : begin
                           PortMem[GPIO]^.PCR[Bit] := 0;
                         end;
    else
                         begin
                           PortMem[GPIO]^.PCR[Bit] := longWord(Byte(Mode) shl 8) or (longWord(DriveStrength) shl 6)
                                                                             or (longWord(OutputMode) shl 5)
                                                                             or (longWord(InputFilter) shl 4)
                                                                             or (longWord(SlewRate) shl 2)
                                                                             or longWord(Drive);
                         end;
  end;
end;

function TGPIOHelper.GetPinValue(const Pin: TPinIdentifier): TPinValue; inline;
begin
  if GPIOMem[Pin shr 5]^.PDIR and (1 shl (Pin and $1f)) <> 0 then
    Result := 1
  else
    Result := 0;
end;

procedure TGPIOHelper.SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue); inline;
begin
  if Value = 1 then
    GPIOMem[Pin shr 5]^.PSOR := 1 shl (Pin and $1f)
  else
    GPIOMem[Pin shr 5]^.PCOR := 1 shl (Pin and $1f);
end;

function TGPIOHelper.GetPinLevel(const Pin: TPinIdentifier): TPinLevel; inline;
begin
  if GPIOMem[Pin shr 5]^.PDIR and (1 shl (Pin and $1f)) <> 0 then
    Result := TPinLevel.High
  else
    Result := TPinLevel.Low;
end;

procedure TGPIOHelper.SetPinLevel(const Pin: TPinIdentifier; const Value: TPinLevel); inline;
begin
  if Value = TPinLevel.High then
    GPIOMem[Pin shr 5]^.PSOR := 1 shl (Pin and $1f)
  else
    GPIOMem[Pin shr 5]^.PCOR := 1 shl (Pin and $1f);
end;

procedure TGPIOHelper.SetPinLevelHigh(const Pin: TPinIdentifier); inline;
begin
  GPIOMem[Pin shr 5]^.PSOR := 1 shl (Pin and $1f)
end;

procedure TGPIOHelper.SetPinLevelLow(const Pin: TPinIdentifier); inline;
begin
  GPIOMem[Pin shr 5]^.PCOR := 1 shl (Pin and $1f);
end;

procedure TGPIOHelper.TogglePinValue(const Pin: TPinIdentifier); inline;
begin
  GPIOMem[Pin shr 5]^.PCOR := 1 shl (Pin and $1f);
end;

procedure TGPIOHelper.TogglePinLevel(const Pin: TPinIdentifier); inline;
begin
  GPIOMem[Pin shr 5]^.PCOR := 1 shl (Pin and $1f);
end;

function TGPIOHelper.GetPinDriveStrength(const Pin: TPinIdentifier): TPinDriveStrength; inline;
begin
  if PortMem[Pin shr 5]^.PCR[Pin and $1f] and (1 shl 6) <> 0 then
    Result := TPinDriveStrength.High
  else
    Result := TPinDriveStrength.Low;
end;

procedure TGPIOHelper.SetPinDriveStrength(const Pin: TPinIdentifier; const Value: TPinDriveStrength); inline;
begin
  if value = TPinDriveStrength.High then
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] or longWord(%1 shl 6)
  else
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] and (not longWord(%1 shl 6));
end;

function TGPIOHelper.GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode inline;
begin
  if PortMem[Pin shr 5]^.PCR[Pin and $1f] and (1 shl 5) <> 0 then
    Result := TPinOutputMode.OpenDrain
  else
    Result := TPinOutputMode.PushPull;
end;

procedure TGPIOHelper.SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode); inline;
begin
  if value = TPinOutputMode.OpenDrain then
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] or longWord(%1 shl 5)
  else
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] and (not longWord(%1 shl 5));
end;

function TGPIOHelper.GetPinInputFilter(const Pin: TPinIdentifier): TPinInputFilter inline;
begin
  if PortMem[Pin shr 5]^.PCR[Pin and $1f] and (1 shl 4) <> 0 then
    Result := TPinInputFilter.Enabled
  else
    Result := TPinInputFilter.Disabled;
end;

procedure TGPIOHelper.SetPinInputFilter(const Pin: TPinIdentifier; const Value: TPinInputFilter); inline;
begin
  if value = TPinInputFilter.Enabled then
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] or longWord(%1 shl 4)
  else
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] and (not longWord(%1 shl 4));
end;

function TGPIOHelper.GetPinSlewRate(const Pin: TPinIdentifier): TPinSlewRate; inline;
begin
  if PortMem[Pin shr 5]^.PCR[Pin and $1f] and (1 shl 2) <> 0 then
    Result := TPinSlewRate.Fast
  else
    Result := TPinSlewRate.Slow;
end;

procedure TGPIOHelper.SetPinSlewRate(const Pin: TPinIdentifier; const Value: TPinSlewRate); inline;
begin
  if value = TPinSlewRate.Fast then
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] or longWord(%1 shl 2)
  else
    PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] and (not longWord(%1 shl 2));
end;

function TGPIOHelper.GetPinDrive(const Pin: TPinIdentifier): TPinDrive; inline;
begin
  Result := TPinDrive(PortMem[Pin shr 5]^.PCR[Pin and $1f] and $03);
end;

procedure TGPIOHelper.SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive); inline;
begin
  PortMem[Pin shr 5]^.PCR[Pin and $1f] := PortMem[Pin shr 5]^.PCR[Pin and $1f] and (not %11) or longWord(Value);
end;

{$ENDREGION}

begin
end.
