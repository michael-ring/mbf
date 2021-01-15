unit mbf.stm32g0.spi;
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

  STM32G4 Series advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00355726.pdf
}

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32G4.SystemCore,
  MBF.STM32G4.GPIO;

{$REGION PinDefinitions}

type
  TSPIMOSIPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA2_SPI1 = ALT0 or TNativePin.PA2 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA7_SPI1 = ALT0 or TNativePin.PA7 {$endif}
    {$if defined(has_arduinopins)                }, D11_SPI  = ALT0 or TNativePin.PA7 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioa)}, PA10_SPI2 = ALT0 or TNativePin.PA10 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA12_SPI1 = ALT0 or TNativePin.PA12 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)}, PB5_SPI1 = ALT0 or TNativePin.PB5 {$endif}
    {$if defined(has_arduinominipins)                }, D11_SPI  = ALT0 or TNativePin.PB5 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB11_SPI2 = ALT0 or TNativePin.PB11 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB15_SPI2 = ALT0 or TNativePin.PB15 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioa)}, PA4_SPI2 = ALT1 or TNativePin.PA4 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB7_SPI2 = ALT1 or TNativePin.PB7 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioc)}, PC3_SPI2 = ALT1 or TNativePin.PC3 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)}, PD4_SPI2 = ALT1 or TNativePin.PD4 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiod)}, PD6_SPI1 = ALT1 or TNativePin.PD6 {$endif}
  );
  TSPIMISOPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI2) and defined(has_gpioa)}, PA3_SPI2 = ALT0 or TNativePin.PA3 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA6_SPI1 = ALT0 or TNativePin.PA6 {$endif}
    {$if defined(has_arduinopins)                }, D12_SPI  = ALT0 or TNativePin.PA6 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA11_SPI1 = ALT0 or TNativePin.PA11 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)}, PB4_SPI1 = ALT0 or TNativePin.PB4 {$endif}
    {$if defined(has_arduinominipins)            }, D12_SPI  = ALT0 or TNativePin.PB4 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB14_SPI2 = ALT0 or TNativePin.PB14 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB2_SPI2 = ALT1 or TNativePin.PB2 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioc)}, PC2_SPI2 = ALT1 or TNativePin.PC2 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)}, PD3_SPI2 = ALT1 or TNativePin.PD3 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiod)}, PD5_SPI1 = ALT1 or TNativePin.PD5 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioa)}, PA9_SPI2 = ALT4 or TNativePin.PA9 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB6_SPI2 = ALT4 or TNativePin.PB6 {$endif}
  );
  TSPISCLKPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI2) and defined(has_gpioa)}, PA0_SPI2 = ALT0 or TNativePin.PA0 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA1_SPI1 = ALT0 or TNativePin.PA1 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA5_SPI1 = ALT0 or TNativePin.PA5 {$endif}
    {$if defined(has_arduinopins)                }, D13_SPI  = ALT0 or TNativePin.PA5 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)}, PB3_SPI1 = ALT0 or TNativePin.PB3 {$endif}
    {$if defined(has_arduinominipins)            }, D13_SPI  = ALT0 or TNativePin.PB3 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB13_SPI2 = ALT0 or TNativePin.PB13 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB8_SPI2 = ALT1 or TNativePin.PB8 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)}, PD1_SPI2 = ALT1 or TNativePin.PD1 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiod)}, PD8_SPI1 = ALT1 or TNativePin.PD8 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB10_SPI2 = ALT5 or TNativePin.PB10 {$endif}
  );
  TSPINSSPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_arduinominipins)            }, D10_SPI =          TNativePin.PB9 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA4_SPI1 = ALT0 or TNativePin.PA4 {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa)}, PA15_SPI1 = ALT0 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob)}, PB0_SPI1 = ALT0 or TNativePin.PB0 {$endif}
    {$if defined(has_arduinopins)                }, D10_SPI  = ALT0 or TNativePin.PB0 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB12_SPI2 = ALT0 or TNativePin.PB12 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioa)}, PA8_SPI2 = ALT1 or TNativePin.PA8 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod)}, PD0_SPI2 = ALT1 or TNativePin.PD0 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiod)}, PD9_SPI1 = ALT1 or TNativePin.PD9 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob)}, PB9_SPI2 = ALT5 or TNativePin.PB9 {$endif}
  );

{$ENDREGION}

const
  DefaultSPIBaudrate=8000000;
  MaxSPIBaudrate=50000000;
  DefaultSPITimeOut=10000;

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
    Fifteen,
    Sixteen
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

  {$IF DEFINED(HAS_ARDUINOPINS) or DEFINED(HAS_ARDUINOMINIPINS)}
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
  NSSPins : array[1..2] of longInt;

procedure TSPIRegistersHelper.Initialize(
                     const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins);
var
  i : longWord;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : setBit(RCC.APBENR2,12);{$endif}
    {$ifdef has_spi2}SPI2_BASE : setBit(RCC.APBENR1,14);{$endif}
  end;

  //We need to save the primary SPI Pin in Memory so that we can reuse it
  for i := 1 to 2 do
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
  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode((LongWord(AMOSIPin) shr 8) and $ff);
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode((LongWord(AMISOPin) shr 8) and $ff);
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode((LongWord(ASCLKPin) shr 8) and $ff);

  //GPIO.PinMode[longWord(aNSSPin) and $ff] := TPinMode((LongWord(aNSSPin) shr 8) and $0f);
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
    //case longWord(@Self) of
    //{$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    //{$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    //{$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
  //end;

  BaseFrequency := SystemCore.GetAPBPeripheralClockFrequency;

  for result := 0 to 7 do
    if BaudRate >= (BaseFrequency div word(2 shl result)) then
      break;
end;

function TSPIRegistersHelper.GetBaudrate: longWord;
var
  BaseFrequency : longWord;
begin
  //case longWord(@Self) of
  //    {$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  //    {$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
  //    {$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
  //end;

  BaseFrequency := SystemCore.GetAPBPeripheralClockFrequency;
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
  Result := TSPIBitsPerWord(GetBitsMasked(CR2,%1111 shl 8,8));
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
begin
  SetBitsMasked(CR2,TBitValue(aBitsPerWord),%1111 shl 8,8);
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode(GetBitsMasked(CR1,%11 shl 0,0));
end;

procedure TSPIRegistersHelper.SetMode(const aMode: TSPIMode);
begin
  SetBitsMasked(CR1,longWord(aMode),%11 shl 0,0);
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
  end;
end;

procedure TSPIRegistersHelper.EndTransaction; inline;
begin
  WaitForTXFinished;
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : GPIO.SetPinLevelHigh(NSSPins[1] and $ff);{$endif}
    {$ifdef has_spi2}SPI2_BASE : GPIO.SetPinLevelHigh(NSSPins[2] and $ff);{$endif}
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
  //We need to force 8 Bit access here otherwise a 16bit transfer is done on G4 Chips (data packing feature of fifo's)
  pByte(@self.DR)^ := Value;
end;

function TSPIRegistersHelper.ReadDR : byte ; inline;
begin
  //We need to force 8 Bit access here otherwise a 16bit transfer is done on G4 Chips (data packing feature of fifo's)
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

