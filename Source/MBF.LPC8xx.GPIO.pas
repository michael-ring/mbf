unit MBF.LPC8xx.GPIO;
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
{< NXP LPC8xx series GPIO functions. }
interface

{$include MBF.Config.inc}

{$REGION PinDefinitions}

{$define has_gpioa}

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
  ALT16=$2000;
  ALT17=$2100;
  ALT18=$2200;
  ALT19=$2300;
  ALT20=$2400;
  ALT21=$2500;
  ALT22=$2600;
  ALT23=$2700;
  ALT24=$2800;
  ALT25=$2900;
  ALT26=$2A00;
  ALT27=$2B00;
  ALT28=$2C00;
  ALT29=$2D00;
  ALT30=$2E00;
  ALT31=$2F00;
  ALT32=$3000;
  ALT33=$3100;
  ALT34=$3200;
  ALT35=$3300;
  ALT36=$3400;
  ALT37=$3500;
  ALT38=$3600;
  ALT39=$3700;
  ALT40=$3800;
  ALT41=$3900;
  ALT42=$3A00;
  ALT43=$3B00;
  ALT44=$3C00;

type
  TNativePin = record
  const
    None=-1;
    PA0 =0;   PA1 =1;   PA2 =2;   PA3 =3;   PA4 =4;   PA5 =5;   PA6 =6;   PA7 =7;
    PA8 =8;   PA9 =9;   PA10=10;  PA11=11;  PA12=12;  PA13=13;  PA14=14;  PA15=15;
    PA16=16;  PA17=17;  PA18=18;  PA19=19;  PA20=20;  PA21=21;  PA22=22;  PA23=23;
    PA24=24;  PA25=25;  PA26=26;  PA27=27;  PA28=28;  PA29=29;  PA30=30;  PA31=31;
  end;

  {$if defined(has_arduinopins)}
    {$if defined(lpcxpresso812max)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PA0;   D1 =TNativePin.PA4;   D2 =TNativePin.PA6;   D3 =TNativePin.PA8; 
      D4 =TNativePin.PA9;   D7 =TNativePin.PA7;
      D8 =TNativePin.PA17;  D9 =TNativePin.PA16;  D10=TNativePin.PA13;  D11=TNativePin.PA14;
      D12=TNativePin.PA15;  D13=TNativePin.PA12;  D14=TNativePin.PA10;  D15=TNativePin.PA11;

      A0 =TNativePin.PA6;   A1 =TNativePin.PA14;  A2 =TNativePin.PA23;  A3 =TNativePin.PA22;
      A4 =TNativePin.PA10;  A5 =TNativePin.PA11;
    end;
    {$endif}
    {$if defined(lpcxpresso824max)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PA0;   D1 =TNativePin.PA4;   D2 =TNativePin.PA19;  D3 =TNativePin.PA12;
      D4 =TNativePin.PA18;  D5 =TNativePin.PA28;  D6 =TNativePin.PA16;  D7 =TNativePin.PA17;
      D8 =TNativePin.PA13;  D9 =TNativePin.PA27;  D10=TNativePin.PA15;  D11=TNativePin.PA26;
      D12=TNativePin.PA25;  D13=TNativePin.PA24;  D14=TNativePin.PA11;  D15=TNativePin.PA10;

      A0 =TNativePin.PA6;   A1 =TNativePin.PA14;  A2 =TNativePin.PA23;  A3 =TNativePin.PA22;
      A4 =TNativePin.PA21;  A5 =TNativePin.PA20;
    end;
    {$endif}
  {$endif}

{$endregion}

type
  TPinValue=(Low=0,High=1);
  TPinIdentifier=-1..31;
  TPinMode = (Input=%00, Output=%01, Analog=%11, AF0=$10, AF1,  AF2,  AF3,  AF4,  AF5,  AF6,  AF7,  AF8,  AF9,
                                                 AF10,    AF11, AF12, AF13, AF14, AF15, AF16, AF17, AF18, AF19,
                                                 AF20,    AF21, AF22, AF23, AF24, AF25, AF26, AF27, AF28, AF29,
                                                 AF30,    AF31, AF32, AF33, AF34, AF35, AF36, AF37, AF38, AF39,
                                                 AF40,    AF41, AF42, AF43, AF44
                                                 );
  TPinDrive = (None=%00,PullDown=%01,PullUp=%10,Repeater=%11);
  TPinOutputMode = (PushPull=0,OpenDrain=1);
  TPinHysteresis = (None=0,Enabled=1);
  TPinInputSampleMode = (None=%00, OneCycle=%01, TwoCycles=%10, ThreeCycles=%11);
  TPinInputSampleClock = (IOCONCLKDIV0=0, IOCONCLKDIV1, IOCONCLKDIV2, IOCONCLKDIV3,
                          IOCONCLKDIV4,   IOCONCLKDIV5, IOCONCLKDIV6);

type
  TGPIO = record helper for TGPIO_Registers
    function GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
    function GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
    function GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
    procedure SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
    function GetPinHysteresis(const Pin: TPinIdentifier): TPinHysteresis;
    procedure SetPinHysteresis(const Pin: TPinIdentifier; const Value: TPinHysteresis);
    function GetPinInputSampleMode(const Pin: TPinIdentifier): TPinInputSampleMode;
    procedure SetPinInputSampleMode(const Pin: TPinIdentifier; const Value: TPinInputSampleMode);
    function GetPinInputSampleClock(const Pin: TPinIdentifier): TPinInputSampleClock;
    procedure SetPinInputSampleClock(const Pin: TPinIdentifier; const Value: TPinInputSampleClock);

  public
    procedure Initialize;
    function  GetPinValue(const Pin: TPinIdentifier): TPinValue;
    procedure SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
    procedure SetPinValueHigh(const Pin: TPinIdentifier);
    procedure SetPinValueLow(const Pin: TPinIdentifier);
    procedure TogglePinValue(const Pin: TPinIdentifier);
    procedure UnassignPinOnSwitchMatrix(const Pin : TPinIdentifier);


    property PinMode[const Pin : TPinIdentifier]: TPinMode read getPinMode write setPinMode;
    property PinDrive[const Pin : TPinIdentifier] : TPinDrive read getPinDrive write setPinDrive;
    property PinOutputMode[const Pin : TPinIdentifier] : TPinOutputMode read getPinOutputMode write setPinOutputMode;
    property PinHysteresis[const Pin : TPinIdentifier] : TPinHysteresis read getPinHysteresis write setPinHysteresis;
    property PinInputSampleMode[const Pin : TPinIdentifier] : TPinInputSampleMode read getPinInputSampleMode write setPinInputSampleMode;
    property PinInputSampleClock[const Pin : TPinIdentifier] : TPinInputSampleClock read getPinInputSampleClock write setPinInputSampleClock;
    property PinValue[const Pin : TPinIdentifier] : TPinValue read getPinValue write setPinValue;
  end;

implementation
const
  PinEnableHelper : array[0..24] of TPinIdentifier = (TNativePin.PA0, TNativePin.PA1, TNativePin.PA14,TNativePin.PA23,
                                                       TNativePin.PA3, TNativePin.PA2, TNativePin.PA8, TNativePin.PA9,
                                                       TNativePin.PA5, TNativePin.PA1, TNativePin.PA6, TNativePin.PA11,
                                                       TNativePin.PA10,TNativePin.PA7, TNativePin.PA6, TNativePin.PA14,
                                                       TNativePin.PA23,TNativePin.PA22,TNativePin.PA21,TNativePin.PA20,
                                                       TNativePin.PA19,TNativePin.PA18,TNativePin.PA17,TNativePin.PA13,
                                                       TNativePin.PA4);
  IOCONHelper : array[0..28] of longWord = (IOCON_BASE+$44,IOCON_BASE+$2C,IOCON_BASE+$18,IOCON_BASE+$14,
                                            IOCON_BASE+$10,IOCON_BASE+$0C,IOCON_BASE+$40,IOCON_BASE+$3C,
                                            IOCON_BASE+$38,IOCON_BASE+$34,IOCON_BASE+$20,IOCON_BASE+$1C,
                                            IOCON_BASE+$08,IOCON_BASE+$04,IOCON_BASE+$48,IOCON_BASE+$28,
                                            IOCON_BASE+$24,IOCON_BASE+$00,IOCON_BASE+$78,IOCON_BASE+$74,
                                            IOCON_BASE+$70,IOCON_BASE+$6C,IOCON_BASE+$68,IOCON_BASE+$64,
                                            IOCON_BASE+$60,IOCON_BASE+$5C,IOCON_BASE+$58,IOCON_BASE+$54,
                                            IOCON_BASE+$50);
  ADCMaskBitHelper : array[0..28] of byte = (0,  0,  0,  0,
                                              24, 0,  14, 13,
                                              0,  0,  0,  0,
                                              0,  23, 15, 0,
                                              0,  22, 21, 20,
                                              19, 18, 17, 16,
                                              0,  0,  0,  0,
                                              0);
procedure TGPIO.Initialize;
begin
  SYSCON.SYSAHBCLKCTRL := SYSCON.SYSAHBCLKCTRL or (1 shl 6) or (1 shl 7) or (1 shl 18); //Enable GPIO and IOCON
end;

function TGPIO.GetPinMode(const Pin: TPinIdentifier): TPinMode;
begin
  if (ADCMaskBitHelper[Pin] <> 0) and ((SWM.PINENABLE0 and (1 shl ADCMaskBitHelper[Pin])) = 0) then
    Result := TPinMode.Analog
  else
    Result := TPinMode((GPIO.DIR0 shr Pin) and %1);
  //TODO Find something good for Alternate Modes
end;

procedure TGPIO.SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
var
  index,subindex : longWord;
begin
  case Value of
    TPinMode.Input: begin
                       plongWord(IOCONHelper[Pin])^ := 0;
                       GPIO.DIR0 := GPIO.DIR0 and not (1 shl Pin);
    end;
    TPinMode.Output: begin
                       plongWord(IOCONHelper[Pin])^ := 0;
                       GPIO.DIR0 := GPIO.DIR0 or (1 shl Pin);
    end;
    TPinMode.Analog: begin
                       if ADCMaskBitHelper[Pin] <> 0 then
                         SWM.PINENABLE0 := SWM.PINENABLE0 or (1 shl ADCMaskBitHelper[Pin]);
                       plongWord(IOCONHelper[Pin])^ := 0;
                       GPIO.DIR0 := GPIO.DIR0 and not (1 shl Pin);
    end;
  else
    begin
      Index := (longWord(Value) - $10);
      SubIndex := (Index mod 4) shl 3;
      Index := Index shr 2;
      SWM.PinAssign[Index] := SWM.PinAssign[Index] and (not ($ff shl subindex)) or (longWord(Pin) shl SubIndex);
    end;
  end;

end;

function TGPIO.GetPinValue(const Pin: TPinIdentifier): TPinValue;
begin
  Result := TPinValue(GPIO.W[Pin] and %1);
end;

procedure TGPIO.SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
begin
  GPIO.W[Pin] := longWord(Value);
end;

procedure TGPIO.SetPinValueHigh(const Pin: TPinIdentifier);
begin
  GPIO.W[Pin] := 1;
end;

procedure TGPIO.SetPinValueLow(const Pin: TPinIdentifier);
begin
  GPIO.W[Pin] := 0;
end;

procedure TGPIO.TogglePinValue(const Pin: TPinIdentifier);
begin
  GPIO.NOT0 := 1 shl Pin;
end;

function TGPIO.GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
begin
  Result := TPinDrive((plongWord(IOCONHelper[Pin])^ shr 3) and %11);
end;

procedure TGPIO.SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
begin
  plongWord(IOCONHelper[Pin])^ := plongWord(IOCONHelper[Pin])^ and (not %11 shl 3) or (longWord(Value) shl 3);
end;

function TGPIO.GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
begin
  Result := TPinOutputMode((plongWord(IOCONHelper[Pin])^ shr 10) and %1);
end;

procedure TGPIO.SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
begin
  plongWord(IOCONHelper[Pin])^ := (plongWord(IOCONHelper[Pin])^ and (1 shl 10)) or (longWord(Value) shl 10);
end;

function TGPIO.GetPinHysteresis(const Pin: TPinIdentifier): TPinHysteresis;
begin
  Result := TPinHysteresis((plongWord(IOCONHelper[Pin])^ shr 5) and %1);
end;

procedure TGPIO.SetPinHysteresis(const Pin: TPinIdentifier; const Value: TPinHysteresis);
begin
  plongWord(IOCONHelper[Pin])^ := plongWord(IOCONHelper[Pin])^ and (not %1 shl 5) or (longWord(Value) shl 5);
end;

function TGPIO.GetPinInputSampleMode(const Pin: TPinIdentifier): TPinInputSampleMode;
begin
  Result := TPinInputSampleMode((plongWord(IOCONHelper[Pin])^ shr 11) and %11);
end;

procedure TGPIO.SetPinInputSampleMode(const Pin: TPinIdentifier; const Value: TPinInputSampleMode);
begin
  plongWord(IOCONHelper[Pin])^ := plongWord(IOCONHelper[Pin])^ and (not %11 shl 11) or (longWord(Value) shl 11);
end;

function TGPIO.GetPinInputSampleClock(const Pin: TPinIdentifier): TPinInputSampleClock;
begin
  Result := TPinInputSampleClock((plongWord(IOCONHelper[Pin])^ shr 13) and %111);
end;

procedure TGPIO.SetPinInputSampleClock(const Pin: TPinIdentifier; const Value: TPinInputSampleClock);
begin
  plongWord(IOCONHelper[Pin])^ := plongWord(IOCONHelper[Pin])^ and (not %111 shl 13) or (longWord(Value) shl 13);
end;

procedure TGPIO.unassignPinOnSwitchMatrix(const Pin : TPinIdentifier);
var
  i,j,k : byte;
begin
  for i := 0 to 11 do
    for j := 0 to 3 do
    begin
      k := j shl 3;
      if ((SWM.PinAssign[i] shr k) and $ff) = longWord(Pin) then
        SWM.PinAssign[i] := SWM.PinAssign[i] or ($ff shl j);
    end;
  for i := 0 to sizeof(PinEnableHelper)-1 do
    if PinEnableHelper[i] = Pin then
      SWM.PinEnable0 := SWM.PinEnable0 or (1 shl i);
end;

end.
