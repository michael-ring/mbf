unit MBF.STM32F3.SPI;
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
{$WARN 3031 off : Values in enumeration types have to be ascending}
{$WARN 4055 off : Conversion between ordinals and pointers is not portable}
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F3.SystemCore,
  MBF.STM32F3.GPIO;

{$REGION PinDefinitions}

{$if defined(has_arduinopins) and defined(nucleof302r8)}
  {$undefine has_arduinopins}
  {$define has_arduinopins2}
{$endif}

type
    TSPIMOSIPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1 ) and defined(has_gpioa) },  PA7_SPI1 = ALT5 or TNativePin.PA7  {$endif}
    {$if defined(has_arduinopins)                  },  PA7_SPI1 = ALT5 or TNativePin.PA7  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) }, PA10_SPI2 = ALT5 or TNativePin.PA10 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) }, PA11_SPI2 = ALT5 or TNativePin.PA11 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) },  PB0_SPI1 = ALT5 or TNativePin.PB0  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) },  PB5_SPI1 = ALT5 or TNativePin.PB5  {$endif}
    {$if defined(has_arduinominipins)              },  D11_SPI  = ALT5 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) }, PB15_SPI2 = ALT5 or TNativePin.PB15 {$endif}
    {$if defined(has_arduinopins2)                 },  D11_SPI  = ALT5 or TNativePin.PB15 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) },  PC3_SPI2 = ALT5 or TNativePin.PC3  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) },  PC9_SPI1 = ALT5 or TNativePin.PC9  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiod) },  PD4_SPI2 = ALT5 or TNativePin.PD4  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) },  PE6_SPI4 = ALT5 or TNativePin.PE6  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) }, PE14_SPI4 = ALT5 or TNativePin.PE14 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiof) },  PF6_SPI1 = ALT5 or TNativePin.PF6  {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioa) },  PA3_SPI3 = ALT6 or TNativePin.PA3  {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpiob) },  PB5_SPI3 = ALT6 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioc) }, PC12_SPI3 = ALT6 or TNativePin.PC12 {$endif}  );
  TSPIMISOPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1 ) and defined(has_gpioa) },  PA6_SPI1 = ALT5 or TNativePin.PA6  {$endif}
    {$if defined(has_arduinopins)                  },  D12_SPI  = ALT5 or TNativePin.PA6  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) },  PA9_SPI2 = ALT5 or TNativePin.PA9  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) }, PA10_SPI2 = ALT5 or TNativePin.PA10 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) },  PB4_SPI1 = ALT5 or TNativePin.PB4  {$endif}
    {$if defined(has_arduinominipins)              },  D12_SPI  = ALT5 or TNativePin.PB4  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) }, PB14_SPI2 = ALT5 or TNativePin.PB14 {$endif}
    {$if defined(has_arduinopins2)                 },  D12_SPI  = ALT5 or TNativePin.PB14 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) },  PC2_SPI2 = ALT5 or TNativePin.PC2  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) },  PC8_SPI1 = ALT5 or TNativePin.PC8  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiod) },  PD3_SPI2 = ALT5 or TNativePin.PD3  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) },  PE5_SPI4 = ALT5 or TNativePin.PE5  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) }, PE13_SPI4 = ALT5 or TNativePin.PE13 {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioa) },  PA2_SPI3 = ALT6 or TNativePin.PA2  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) }, PA13_SPI1 = ALT6 or TNativePin.PA13 {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpiob) },  PB4_SPI3 = ALT6 or TNativePin.PB4  {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioc) }, PC11_SPI3 = ALT6 or TNativePin.PC11 {$endif}

  );
  TSPISCLKPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_SPI1 ) and defined(has_gpioa) },  PA5_SPI1 = ALT5 or TNativePin.PA5  {$endif}
    {$if defined(has_arduinopins)                  },  PA5_SPI1 = ALT5 or TNativePin.PA5  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) },  PA8_SPI2 = ALT5 or TNativePin.PA8  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) },  PB3_SPI1 = ALT5 or TNativePin.PB3  {$endif}
    {$if defined(has_arduinominipins)              },  D13_SPI  = ALT5 or TNativePin.PB3  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) },  PB8_SPI2 = ALT5 or TNativePin.PB8  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) }, PB10_SPI2 = ALT5 or TNativePin.PB10 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) }, PB13_SPI2 = ALT5 or TNativePin.PB13 {$endif}
    {$if defined(has_arduinopins2)                 },  D13_SPI  = ALT5 or TNativePin.PB13 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) },  PC7_SPI1 = ALT5 or TNativePin.PC7  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiod) },  PD7_SPI2 = ALT5 or TNativePin.PD7  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiod) },  PD8_SPI2 = ALT5 or TNativePin.PD8  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) },  PE2_SPI4 = ALT5 or TNativePin.PE2  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) }, PE12_SPI4 = ALT5 or TNativePin.PE12 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiof) },  PF1_SPI2 = ALT5 or TNativePin.PF1  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiof) },  PF9_SPI2 = ALT5 or TNativePin.PF9  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiof) }, PF10_SPI2 = ALT5 or TNativePin.PF10 {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioa) },  PA1_SPI3 = ALT6 or TNativePin.PA1  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) }, PA12_SPI1 = ALT6 or TNativePin.PA12 {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpiob) },  PB3_SPI3 = ALT6 or TNativePin.PB3  {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioc) }, PC10_SPI3 = ALT6 or TNativePin.PC10 {$endif}  );
  TSPINSSPins = (
    NONE_SPI = TNativePin.None
    {$if defined(has_arduinopins)                  },  D10_SPI  =         TNativePin.PB6  {$endif}
    {$if defined(has_arduinopins2)                 },  D10_SPI  =         TNativePin.PB6  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) },  PA4_SPI1 = ALT5 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) }, PA11_SPI2 = ALT5 or TNativePin.PA11 {$endif}
    {$if defined(has_arduinominipins)              },  D10_SPI  =         TNativePin.PA11 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) }, PA15_SPI1 = ALT5 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) },  PB9_SPI2 = ALT5 or TNativePin.PB9  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) }, PB12_SPI2 = ALT5 or TNativePin.PB12 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) },  PC6_SPI1 = ALT5 or TNativePin.PC6  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiod) },  PD6_SPI2 = ALT5 or TNativePin.PD6  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) },  PE3_SPI4 = ALT5 or TNativePin.PE3  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) },  PE4_SPI4 = ALT5 or TNativePin.PE4  {$endif}
    {$if defined(has_SPI4 ) and defined(has_gpioe) }, PE11_SPI4 = ALT5 or TNativePin.PE11 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiof) },  PF0_SPI2 = ALT5 or TNativePin.PF0  {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioa) },  PA4_SPI3 = ALT6 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) }, PA11_SPI1 = ALT6 or TNativePin.PA11 {$endif}
    {$if defined(has_SPI3 ) and defined(has_gpioa) }, PA15_SPI3 = ALT6 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiod) }, PD15_SPI2 = ALT6 or TNativePin.PD15 {$endif}  );

{$ENDREGION}

const
  DefaultSPIBaudrate=8000000;
  MaxSPIBaudrate=50000000;
  DefaultSPITimeOut=10000;
  SPICount = 4;

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
  {$Define HAS_SPI_16Bits}

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

  {$IF DEFINED(HAS_ARDUINOPINS2)}
  var
    SPI : TSPI_Registers absolute SPI2_BASE;
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
  NSSPins : array[1..SPICount] of longInt;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins); overload;
var
  i : longWord;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : setBit(RCC.APB2ENR,12);{$endif}
    {$ifdef has_spi2}SPI2_BASE : setBit(RCC.APB1ENR,14);{$endif}
    {$ifdef has_spi3}SPI3_BASE : setBit(RCC.APB1ENR,15);{$endif}
    {$ifdef has_spi4}SPI4_BASE : setBit(RCC.APB2ENR,15);{$endif}
  end;

  for i := 1 to SPICount do
    NSSPins[i] := -1;

    // Set Defaults, all crazy Modes turned off, SPI disabled
  self.CR1:= 0;

 // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.CR2:= 0;

  // MSTR Always set Master Mode
  SetBit(Self.CR1,2);

  // Set correct Polarity and Phase aka as Mode 0-3
  setCrumb(self.CR1,longWord(TSPIMode.Mode0),0);

  //Disable I2S Mode
  //self.I2SCFGR := 0;

  //Enable Soft Slave Management
  SetBitLevelHigh(self.CR1,9);
  SetBitLevelHigh(self.CR1,8);

  //Start with Eight Bits per Word
  SetBitsPerWord(TSPIBitsPerWord.Eight);

  setBaudRate(DefaultSPIBaudrate);

  //Set configuration as defined by user

  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode((LongWord(AMOSIPin) shr 8) and $3f);
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode((LongWord(AMISOPin) shr 8) and $3f);
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode((LongWord(ASCLKPin) shr 8) and $3f);

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
      {$ifdef has_spi3}SPI3_BASE : begin
        NSSPins[3] := longInt(aNSSPin);
      end;
      {$endif}
      {$ifdef has_spi4}SPI4_BASE : begin
        NSSPins[4] := longInt(aNSSPin);
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
    {$ifdef has_spi4}SPI4_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
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
      {$ifdef has_spi4}SPI4_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;
  Result := BaseFrequency shr (GetBitsMasked(CR1,%111 shl 3,3)+1);
end;

procedure TSPIRegistersHelper.SetBaudrate(const aBaudrate: longWord);
begin
    SetBitsMasked(CR1,FindDividerValue(aBaudrate),%111 shl 3,3);
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord(GetNibble(Self.CR2,8));
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
begin
  SetBitsMasked(CR2,longWord(aBitsPerWord),%1111 shl 8,8);
  //Set FIFOreceptionthreshold correctly
  if aBitsPerWord >  TSPIBitsPerWord.Eight then
    SetBitLevelLow(CR2,12)
  else
    SetBitLevelHigh(CR2,12)
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode(GetCrumb(Self.CR1,0));
end;

procedure TSPIRegistersHelper.SetMode(const aMode: TSPIMode);
begin
  SetCrumb(Self.CR1,longWord(aMode),0);
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
    {$ifdef has_spi4}SPI4_BASE : GPIO.SetPinLevelLow(NSSPins[4] and $ff);{$endif}
  end;
end;

procedure TSPIRegistersHelper.EndTransaction;
begin
  WaitForTXFinished;
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : GPIO.SetPinLevelHigh(NSSPins[1] and $ff);{$endif}
    {$ifdef has_spi2}SPI2_BASE : GPIO.SetPinLevelHigh(NSSPins[2] and $ff);{$endif}
    {$ifdef has_spi3}SPI3_BASE : GPIO.SetPinLevelHigh(NSSPins[3] and $ff);{$endif}
    {$ifdef has_spi4}SPI4_BASE : GPIO.SetPinLevelHigh(NSSPins[4] and $ff);{$endif}
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

procedure TSPIRegistersHelper.WaitForTXFinished; //inline;
begin
  // Wait for TX Fifo empty
  while GetCrumb(Self.SR,11) <> %00 do ;
  //Wait for Busy Cleared
  WaitBitIsCleared(SR,7);
  //Clear Overflow
  ReadDR;
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
