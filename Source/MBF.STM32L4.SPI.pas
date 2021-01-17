unit MBF.STM32L4.SPI;
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

  STM32L4x5 and STM32L4x6 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00083560.pdf

  STM32L4x1 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00149427.pdf

  STM32L41xxx42xxx43xxx44xxx45xxx46xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00151940.pdf

  STM32L4Rxxx and STM32L4Sxxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00310109.pdf
}

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32L4.SystemCore,
  MBF.STM32L4.GPIO;

{$REGION PinDefinitions}

type
  TSPIMOSIPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI2) and defined(has_gpioc)},  PC1_SPI2 = ALT3 or TNativePin.PC1 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)},  PA7_SPI1 = ALT5 or TNativePin.PA7 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA12_SPI1 = ALT5 or TNativePin.PA12{$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)},  PB5_SPI1 = ALT5 or TNativePin.PB5 {$endif}
    {$if defined(has_arduinominipins)            },   D11_SPI = ALT5 or TNativePin.PB5 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB15_SPI2 = ALT5 or TNativePin.PB15{$endif}
    {$if defined(has_SPI2) and defined(has_gpioc)},  PC3_SPI2 = ALT5 or TNativePin.PC3 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)},  PD4_SPI2 = ALT5 or TNativePin.PD4 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiod)},  PD6_SPI3 = ALT5 or TNativePin.PD6 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe)}, PE15_SPI1 = ALT5 or TNativePin.PE15{$endif}
    {$if defined(has_SPI1) and defined(has_gpiog)},  PG4_SPI1 = ALT5 or TNativePin.PG4 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi)},  PI3_SPI2 = ALT5 or TNativePin.PI3 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob)},  PB5_SPI3 = ALT6 or TNativePin.PB5 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc)}, PC12_SPI3 = ALT6 or TNativePin.PC12{$endif}
    {$if defined(has_SPI3) and defined(has_gpiog)}, PG11_SPI3 = ALT6 or TNativePin.PG11{$endif}
  );

  TSPIMISOPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1) and defined(has_gpioa)},  PA6_SPI1 = ALT5 or TNativePin.PA6 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA11_SPI1 = ALT5 or TNativePin.PA11{$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)},  PB4_SPI1 = ALT5 or TNativePin.PB4 {$endif}
    {$if defined(has_arduinominipins)            },   D12_SPI = ALT5 or TNativePin.PB4 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB14_SPI2 = ALT5 or TNativePin.PB14{$endif}
    {$if defined(has_SPI2) and defined(has_gpioc)},  PC2_SPI2 = ALT5 or TNativePin.PC2 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)},  PD3_SPI2 = ALT5 or TNativePin.PD3 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe)}, PE14_SPI1 = ALT5 or TNativePin.PE14{$endif}
    {$if defined(has_SPI1) and defined(has_gpiog)},  PG3_SPI1 = ALT5 or TNativePin.PG3 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi)},  PI2_SPI2 = ALT5 or TNativePin.PI2 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob)},  PB4_SPI3 = ALT6 or TNativePin.PB4 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc)}, PC11_SPI3 = ALT6 or TNativePin.PC11{$endif}
    {$if defined(has_SPI3) and defined(has_gpiog)}, PG10_SPI3 = ALT6 or TNativePin.PG10{$endif}
  );

  TSPISCLKPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI2) and defined(has_gpioa)},  PA9_SPI2 = ALT3 or TNativePin.PA9 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)},  PD3_SPI2 = ALT3 or TNativePin.PD3 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)},  PA1_SPI1 = ALT5 or TNativePin.PA1 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)},  PA5_SPI1 = ALT5 or TNativePin.PA5 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)},  PB3_SPI1 = ALT5 or TNativePin.PB3 {$endif}
    {$if defined(has_arduinominipins)            },   D13_SPI = ALT5 or TNativePin.PB3 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB10_SPI2 = ALT5 or TNativePin.PB10{$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB13_SPI2 = ALT5 or TNativePin.PB13{$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)},  PD1_SPI2 = ALT5 or TNativePin.PD1 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe)}, PE13_SPI1 = ALT5 or TNativePin.PE13{$endif}
    {$if defined(has_SPI1) and defined(has_gpiog)},  PG2_SPI1 = ALT5 or TNativePin.PG2 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi)},  PI1_SPI2 = ALT5 or TNativePin.PI1 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob)},  PB3_SPI3 = ALT6 or TNativePin.PB3 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc)}, PC10_SPI3 = ALT6 or TNativePin.PC10{$endif}
    {$if defined(has_SPI3) and defined(has_gpiog)},  PG9_SPI3 = ALT6 or TNativePin.PG9 {$endif}
  );

  TSPINSSPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_arduinominipins)            },   D10_SPI =         TNativePin.PA11{$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)},  PA4_SPI1 = ALT5 or TNativePin.PA4 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA15_SPI1 = ALT5 or TNativePin.PA15{$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)},  PB0_SPI1 = ALT5 or TNativePin.PB0 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)},  PB9_SPI2 = ALT5 or TNativePin.PB9 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB12_SPI2 = ALT5 or TNativePin.PB12{$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)},  PD0_SPI2 = ALT5 or TNativePin.PD0 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe)}, PE12_SPI1 = ALT5 or TNativePin.PE12{$endif}
    {$if defined(has_SPI1) and defined(has_gpiog)},  PG5_SPI1 = ALT5 or TNativePin.PG5 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi)},  PI0_SPI2 = ALT5 or TNativePin.PI0 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa)},  PA4_SPI3 = ALT6 or TNativePin.PA4 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa)}, PA15_SPI3 = ALT6 or TNativePin.PA15{$endif}
    {$if defined(has_SPI3) and defined(has_gpiog)}, PG12_SPI3 = ALT6 or TNativePin.PG12{$endif}
  );

{$ENDREGION}

const
  DefaultSPIBaudrate=8000000;


type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Four=3,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Ten,
    Eleven,
    Twelve,
    Thirteen,
    Fourteen,
    Fiveteen,
    Sixteen
  );

  TSPIOperatingMode = (
    Slave=%0,
    Master=%1
  );

  TSPIRegistersHelper = record helper for TSPI_Registers
  protected
    function  FindDividerValue(const Baudrate: longWord) : longWord;
    function  GetBaudrate: longWord;
    procedure SetBaudrate(const aBaudrate: longWord);
    function  GetBitsPerWord: TSPIBitsPerWord; //inline;
    procedure SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
    function  GetMode: TSPIMode; //inline;
    procedure SetMode(const aMode: TSPIMode);
    function  GetOperatingMode: TSPIOperatingMode;
    procedure SetOperatingMode(const aOperatingMode: TSPIOperatingMode);

  public
    property Baudrate : longWord read getBaudrate write setBaudrate;
    property Mode : TSPIMode read getMode write setMode;
    property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
    property OperatingMode : TSPIOperatingMode read getOperatingMode write setOperatingMode;

    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;
    function  Disable : boolean;
    procedure Enable;

    procedure BeginTransaction; //inline;
    procedure EndTransaction; //inline;
    procedure BeginTransaction(const SoftNSSPin : TPinIdentifier); //inline;
    procedure EndTransaction(const SoftNSSPin : TPinIdentifier); //inline;

    procedure WaitForTXReady; //inline;
    procedure WaitForRXReady; //inline;
    procedure WaitForTXFinished; //inline;

    function  WaitForTXReady(EndTime : TMilliSeconds):boolean; //inline;
    function  WaitForRXReady(EndTime : TMilliSeconds):boolean; //inline;
    function  WaitForTXFinished(EndTime : TMilliSeconds):boolean; //inline;

    procedure WriteDR(const Value : byte); //inline;
    function ReadDR:byte; //inline;

    {$IF Defined(HAS_SPI_16Bits)}
    procedure WriteDRWord(const Value : word); //inline;
    function ReadDRWord:word; //inline;
    {$ENDIF}

    {$DEFINE INTERFACE}
    {$I MBF.STM32.SPI.inc}
    {$UNDEF INTERFACE}

  end;

  {$IF DEFINED(HAS_ARDUINOPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOPINS}

  {$IF DEFINED(HAS_ARDUINOMINIPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOMINIPINS}

implementation
uses
  MBF.BitHelpers;

type
  TByteArray = array of byte;
  pTByteArray = ^TByteArray;

var
  NSSPins : array[1..3] of longInt;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins); overload;
var
  i : longWord;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : RCC.APB2ENR  := RCC.APB2ENR or (1 shl 12);{$endif}
    {$ifdef has_spi2}SPI2_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 14);{$endif}
    {$ifdef has_spi3}SPI3_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 15);{$endif}
  end;

  for i := 1 to 3 do
    NSSPins[i] := -1;

  // Set Defaults, all crazy Modes turned off, SPI disabled
  CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  CR2:= 0;

  // MSTR Always set Master Mode
  SetBitLevelHigh(CR1,2);
  // Set Software NSS
  SetBitLevelHigh(CR1,9);
  SetBitLevelHigh(CR1,8);

  // Set correct Polarity and Phase aka as Mode 0-3
  setBitsMasked(CR1,longWord(TSPIMode.Mode0),%11 shl 0,0);

  setBaudRate(DefaultSPIBaudrate);
  setBitsPerWord(TSPIBitsPerWord.Eight);

  //Set configuration as defined by user

  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode((LongWord(AMOSIPin) shr 8) and $0f);
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode((LongWord(AMISOPin) shr 8) and $0f);
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode((LongWord(ASCLKPin) shr 8) and $0f);

  GPIO.PinMode[longWord(aNSSPin) and $ff] := TPinMode.Output;
  GPIO.SetPinLevelHigh(longWord(aNSSPin) and $ff);

  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : begin
      NSSPins[1] := longInt(aNSSPin);
    end;
    {$endif}
    {$ifdef has_spi2}SPI2_BASE : begin
      NSSPins[2] := longInt(aNSSPin);
    end;
    {$endif}
    {$ifdef has_spi2}SPI3_BASE : begin
      NSSPins[3] := longInt(aNSSPin);
    end;
    {$endif}
  end;
  Enable;
end;

function TSPIRegistersHelper.Disable : boolean;
begin
  Result := GetBitValue(CR1,6) > 0;
  SetBitLevelLow(CR1,6);
end;

procedure TSPIRegistersHelper.Enable;
begin
  SetBitLevelHigh(CR1,6);
end;

function TSPIRegistersHelper.FindDividerValue(const Baudrate: longWord): longWord;
var
  BaseFrequency : longWord;
begin
    case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
  end;

  for result := 0 to 7 do
    if BaudRate >= (BaseFrequency div word(2 shl result)) then
      break;
end;

function TSPIRegistersHelper.GetBaudrate: longWord;
var
  BaseFrequency : longWord;
begin
  case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
      {$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
  end;
  Result := BaseFrequency shr (GetBitsMasked(CR1,%111 shl 3,3)+1);
end;

procedure TSPIRegistersHelper.SetBaudrate(const aBaudrate: longWord);
var
  Divider : longWord;
  Status : boolean;
begin
  status := Disable;
  Divider := FindDividerValue(aBaudrate);
  SetBitsMasked(CR1,Divider,%111 shl 3,3);
  if status = true then
    Enable;
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord(GetBitsMasked(CR2,%1111 shl 8,8));
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
var
  Status : boolean;
begin
  status := Disable;
  SetBitsMasked(CR2,byte(aBitsPerWord),%1111 shl 8,8);
    //Set FIFOreceptionthreshold correctly
  if aBitsPerWord >  TSPIBitsPerWord.Eight then
    SetBitLevelLow(CR2,12)
  else
    SetBitLevelHigh(CR2,12);
  if status = true then
    Enable;
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode(GetBitsMasked(CR1,%11 shl 0,0));
end;

procedure TSPIRegistersHelper.SetMode(const aMode: TSPIMode);
var
  Status : boolean;
begin
  status := Disable;
  SetBitsMasked(CR1,longWord(aMode),%11 shl 0,0);
  if status = true then
    Enable;
end;


procedure TSPIRegistersHelper.SetOperatingMode(const aOperatingMode: TSPIOperatingMode);
begin
  //TODO
end;

function TSPIRegistersHelper.GetOperatingMode: TSPIOperatingMode;
begin
  Result := TSPIOperatingMode(GetBitValue(CR1,2));
end;

procedure TSPIRegistersHelper.BeginTransaction;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : GPIO.SetPinLevelLow(NSSPins[1] and $ff);{$endif}
    {$ifdef has_spi2}SPI2_BASE : GPIO.SetPinLevelLow(NSSPins[2] and $ff);{$endif}
    {$ifdef has_spi3}SPI3_BASE : GPIO.SetPinLevelLow(NSSPins[3] and $ff);{$endif}
  end;
end;

procedure TSPIRegistersHelper.EndTransaction;
begin
  WaitForTXFinished;
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : GPIO.SetPinLevelHigh(NSSPins[1] and $ff);{$endif}
    {$ifdef has_spi2}SPI2_BASE : GPIO.SetPinLevelHigh(NSSPins[2] and $ff);{$endif}
    {$ifdef has_spi3}SPI3_BASE : GPIO.SetPinLevelHigh(NSSPins[3] and $ff);{$endif}
  end;
end;

procedure TSPIRegistersHelper.BeginTransaction(const SoftNSSPin : TPinIdentifier);
begin
  GPIO.SetPinLevelLow(SoftNSSPin);
end;

procedure TSPIRegistersHelper.EndTransaction(const SoftNSSPin : TPinIdentifier);
begin
  WaitForTXFinished;
  GPIO.SetPinLevelHigh(SoftNSSPin);
end;


procedure TSPIRegistersHelper.WaitForTXReady; //inline;
begin
  WaitBitIsSet(self.SR,1);
end;

procedure TSPIRegistersHelper.WaitForRXReady; //inline;
begin
  WaitBitIsSet(self.SR,0);
end;

procedure TSPIRegistersHelper.WaitForTXFinished;
begin
  // Wait for TX Fifo empty
  while GetBitsMasked(SR,%11 shl 11,11) <> %00 do ;
  //Wait for Busy Cleared
  WaitBitIsCleared(SR,7);
end;

function TSPIRegistersHelper.WaitForTXReady(EndTime : TMilliSeconds):boolean; //inline;
begin
  Result := WaitBitIsSet(self.SR,1,EndTime);
end;

function TSPIRegistersHelper.WaitForRXReady(EndTime : TMilliSeconds):boolean; //inline;
begin
  Result := WaitBitIsSet(self.SR,0,EndTime);
end;

function TSPIRegistersHelper.WaitForTXFinished(EndTime : TMilliSeconds):boolean; //inline;
begin
  //Make sure are Data is shifted out
  if WaitBitIsSet(SR,1,EndTime) = false then
    exit(false);
  //Wait for Busy Flag to be cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
    exit(false);
  //Clear Overflow
  ReadDR;
  Result := true;
end;

procedure TSPIRegistersHelper.WriteDR(const Value : byte); //inline;
begin
  pByte(@self.DR)^ := Value;
end;

function TSPIRegistersHelper.ReadDR : byte ; //inline;
begin
  Result := pByte(@self.DR)^;
end;

{$IF Defined(HAS_SPI_16Bits)}
procedure TSPIRegistersHelper.WriteDRWord(const Value : word); //inline;
begin
  self.DR := Value;
end;

function TSPIRegistersHelper.ReadDRWord : word ; //inline;
begin
  Result := self.DR;
end;
{$ENDIF}

{$DEFINE IMPLEMENTATION}
{$I MBF.STM32.SPI.inc}
{$UNDEF IMPLEMENTATION}

{$ENDREGION}
end.
