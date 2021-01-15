unit mbf.stm32f1.spi;
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

  STM32F100xx advanced ARM
  http://www.st.com/resource/en/reference_manual/CD00246267.pdf

  STM32F101xx, STM32F102xx, STM32F103xx, STM32F105xx and STM32F107xx advanced Arm
  http://www.st.com/resource/en/reference_manual/CD00171190.pdf
}

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F1.SystemCore,
  MBF.STM32F1.GPIO;

{$REGION PinDefinitions}

//SPI2 has disappeared in recent STM32F1 CMSIS Definitions, no idea why....
type
  TSPIMOSIPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA7_SPI1 = ALT0 or TNativePin.PA7 {$endif}
    {$if defined(has_arduinopins)                },  D11_SPI = ALT0 or TNativePin.PA7 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob)}, PB5_SPI3 = ALT0 or TNativePin.PB5 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)}, PB5_SPI1 = ALT3 or TNativePin.PB5 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc)},PC12_SPI3 = ALT3 or TNativePin.PC12{$endif}
  );
  TSPIMISOPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA6_SPI1 = ALT0 or TNativePin.PA6 {$endif}
    {$if defined(has_arduinopins)                },  D12_SPI = ALT0 or TNativePin.PA6 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob)}, PB4_SPI3 = ALT0 or TNativePin.PB4 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)}, PB4_SPI1 = ALT3 or TNativePin.PB4 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc)},PC11_SPI3 = ALT3 or TNativePin.PC11{$endif}
  );
  TSPISCLKPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA5_SPI1 = ALT0 or TNativePin.PA5 {$endif}
    {$if defined(has_arduinopins)                },  D13_SPI = ALT0 or TNativePin.PA5 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob)}, PB3_SPI3 = ALT0 or TNativePin.PB3 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)}, PB3_SPI1 = ALT3 or TNativePin.PB3 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc)},PC10_SPI3 = ALT3 or TNativePin.PC10{$endif}
  );
  TSPINSSPins = (
    NONE_SPI = TNativePin.None
    //For some braindead Reason D10 Pin is not mapped to a 'real' NSS pin
    {$if defined(has_arduinopins)                },  D10_SPI = TNativePin.PB6         {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA4_SPI1 = ALT0 or TNativePin.PA4 {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa)},PA15_SPI3 = ALT0 or TNativePin.PA15{$endif}
    {$if defined(has_SPI3) and defined(has_gpioa)}, PA4_SPI3 = ALT3 or TNativePin.PA4 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)},PA15_SPI1 = ALT3 or TNativePin.PA15{$endif}
  );

{$ENDREGION}

const
  DefaultSPIBaudrate=8000000;
  MaxSPIBaudrate=50000000;
  DefaultSPITimeOut=10000;
  SPICount = 3;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Eight=0,
    Sixteen=1
  );
  {$DEFINE HAS_SPI_16Bits}

  TSPIOperatingMode = (
    Slave=%0,
    Master=%1
  );

  TSPIRegistersHelper = record helper for TSPI_Registers
  protected
    function  FindDividerValue(const Baudrate: longWord) : longWord;
    function  GetBaudrate: longWord;
    procedure SetBaudrate(const aBaudrate: longWord);
    function  GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
    function  GetMode: TSPIMode;
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
                       const ANSSPin  : TSPINSSPins);
    function  Disable : boolean;
    procedure Enable;

    procedure BeginTransaction; inline;
    procedure EndTransaction; inline;
    procedure BeginTransaction(const SoftNSSPin : TPinIdentifier); inline;
    procedure EndTransaction(const SoftNSSPin : TPinIdentifier); inline;

    procedure WaitForTXReady; inline;
    procedure WaitForRXReady; inline;
    procedure WaitForTXFinished; inline;

    function  WaitForTXReady(EndTime : TMilliSeconds):boolean; inline;
    function  WaitForRXReady(EndTime : TMilliSeconds):boolean; inline;
    function  WaitForTXFinished(EndTime : TMilliSeconds):boolean; inline;

    procedure WriteDR(const Value : byte); inline;
    function ReadDR:byte; inline;

    {$IF Defined(HAS_SPI_16Bits)}
    procedure WriteDRWord(const Value : word); inline;
    function ReadDRWord:word; inline;
    {$ENDIF}

    {$DEFINE INTERFACE}
    {$I MBF.STM32.SPI.inc}
    {$UNDEF INTERFACE}
  end;

  {$IF DEFINED(HAS_ARDUINOPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

type
  TByteArray = array of byte;
  pTByteArray = ^TByteArray;

var
  NSSPins : array[1..3] of longInt;

procedure TSPIRegistersHelper.Initialize(
                     const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins);
var
  i : longWord;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : RCC.APB2ENR := RCC.APB2ENR or (1 shl 12);{$endif}
    {$ifdef has_spi2}SPI2_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 14);{$endif}
    {$ifdef has_spi3}SPI3_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 15);{$endif}
  end;

  //We need to save the primary SPI Pin in Memory so that we can reuse it
  for i := 1 to 3 do
    NSSPins[i] := longInt(TArduinoPin.None);

  // Set Defaults, all crazy Modes turned off, SPI disabled
  CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  CR2:= 0;

  // MSTR Always set Master Mode
  SetBitLevelHigh(CR1,2);

  // Set correct Polarity and Phase aka as Mode 0-3
  setBitsMasked(CR1,longWord(TSPIMode.Mode0),%11 shl 0,0);

  //Disable I2S Mode
  self.I2SCFGR := 0;

  //Enable Soft Slave Management
  SetBitLevelHigh(CR1,9);
  SetBitLevelHigh(CR1,8);

  //Start with Eight Bits per Word
  SetBitsPerWord(TSPIBitsPerWord.Eight);

  setBaudRate(DefaultSPIBaudrate);

  //Set configuration as defined by user
  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode.AF0;
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode.Input;
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode.AF0;

  GPIO.PinMode[longWord(aNSSPin) and $ff] := TPinMode.Output;
  GPIO.SetPinLevelHigh(longWord(aNSSPin) and $ff);

  case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : begin
        NSSPins[1] := longInt(aNSSPin);
        if (longWord(AMOSIPIN) and $ff = longWord(TNativePin.PA7))
        or (longWord(AMISOPIN) and $ff = longWord(TNativePin.PA6))
        or (longWord(ASCLKPIN) and $ff = longWord(TNativePin.PA5)) then
          ClearBit(AFIO.MAPR,0)
        else
          SetBit(AFIO.MAPR,0)
      end;
      {$endif}
      {$ifdef has_spi2}SPI2_BASE : begin
        NSSPins[2] := longInt(aNSSPin);
      end;
      {$endif}
      {$ifdef has_spi3}SPI3_BASE : begin
        NSSPins[3] := longInt(aNSSPin);
        if (longWord(AMOSIPIN) and $ff = longWord(TNativePin.PB5))
        or (longWord(AMISOPIN) and $ff = longWord(TNativePin.PB4))
        or (longWord(ASCLKPIN) and $ff = longWord(TNativePin.PB3)) then
          ClearBit(AFIO.MAPR,28)
        else
          SetBit(AFIO.MAPR,28)
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
begin
    Divider := FindDividerValue(aBaudrate);
    SetBitsMasked(CR1,Divider,%111 shl 3,3);
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord(GetBitValue(CR1,11));
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
begin
  SetBitValue(CR1,TBitValue(aBitsPerWord),11);
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode(GetCrumb(CR1,0));
end;

procedure TSPIRegistersHelper.SetMode(const aMode: TSPIMode);
begin
  SetCrumb(CR1,longWord(aMode),0);
end;

procedure TSPIRegistersHelper.SetOperatingMode(const aOperatingMode: TSPIOperatingMode);
begin
  //TODO
end;

function TSPIRegistersHelper.GetOperatingMode: TSPIOperatingMode;
begin
  Result := TSPIOperatingMode(GetBitValue(CR1,2));
end;

procedure TSPIRegistersHelper.BeginTransaction; inline;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : GPIO.SetPinLevelLow(NSSPins[1] and $ff);{$endif}
    {$ifdef has_spi2}SPI2_BASE : GPIO.SetPinLevelLow(NSSPins[2] and $ff);{$endif}
    {$ifdef has_spi3}SPI3_BASE : GPIO.SetPinLevelLow(NSSPins[3] and $ff);{$endif}
  end;
end;

procedure TSPIRegistersHelper.EndTransaction; inline;
begin
  WaitForTXFinished;
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : GPIO.SetPinLevelHigh(NSSPins[1] and $ff);{$endif}
    {$ifdef has_spi2}SPI2_BASE : GPIO.SetPinLevelHigh(NSSPins[2] and $ff);{$endif}
    {$ifdef has_spi3}SPI3_BASE : GPIO.SetPinLevelHigh(NSSPins[3] and $ff);{$endif}
  end;
end;

procedure TSPIRegistersHelper.BeginTransaction(const SoftNSSPin : TPinIdentifier); inline;
begin
  GPIO.SetPinLevelLow(SoftNSSPin);
end;

procedure TSPIRegistersHelper.EndTransaction(const SoftNSSPin : TPinIdentifier); inline;
begin
  WaitForTXFinished;
  GPIO.SetPinLevelHigh(SoftNSSPin);
end;

procedure TSPIRegistersHelper.WaitForTXReady; inline;
begin
  WaitBitIsSet(self.SR,1);
end;

procedure TSPIRegistersHelper.WaitForRXReady; inline;
begin
  WaitBitIsSet(self.SR,0);
end;

procedure TSPIRegistersHelper.WaitForTXFinished;
begin
  //Make sure are Data is shifted out
  WaitBitIsSet(SR,1);
  //Wait for Busy Flag to be cleared
  WaitBitIsCleared(SR,7);
  //Clear Overflow
  ReadDR;
end;

function TSPIRegistersHelper.WaitForTXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := WaitBitIsSet(self.SR,1,EndTime);
end;

function TSPIRegistersHelper.WaitForRXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := WaitBitIsSet(self.SR,0,EndTime);
end;

function TSPIRegistersHelper.WaitForTXFinished(EndTime : TMilliSeconds):boolean; inline;
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

procedure TSPIRegistersHelper.WriteDR(const Value : byte); inline;
begin
  pByte(@self.DR)^ := Value;
end;

function TSPIRegistersHelper.ReadDR : byte ; inline;
begin
  Result := pByte(@self.DR)^;
end;

{$IF Defined(HAS_SPI_16Bits)}
procedure TSPIRegistersHelper.WriteDRWord(const Value : word); inline;
begin
  self.DR := Value;
end;

function TSPIRegistersHelper.ReadDRWord : word ; inline;
begin
  Result := self.DR;
end;
{$ENDIF}

{$DEFINE IMPLEMENTATION}
{$I MBF.STM32.SPI.inc}
{$UNDEF IMPLEMENTATION}

{$ENDREGION}
end.

