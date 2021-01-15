unit mbf.stm32f4.spi;
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

  STM32F405415, STM32F407417, STM32F427437 and STM32F429439 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00031020.pdf

  STM32F401xBC and STM32F401xDE advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00096844.pdf

  STM32F411xCE advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00119316.pdf

  STM32F446xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00135183.pdf

  STM32F469xx and STM32F479xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00127514.pdf

  STM32F410 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00180366.pdf

  STM32F412 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00180369.pdf

  STM32F413423 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00305666.pdf
}

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F4.GPIO,
  MBF.STM32F4.SystemCore;
  //MBF.STM32F4.DMA;

{$REGION PinDefinitions}

type
  TSPIMOSIPins = (
  {$if defined(has_SPI1) and defined(has_gpioa) }   PA7_SPI1 = ALT5 or TNativePin.PA7  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioa) },  PA1_SPI4 = ALT5 or TNativePin.PA1  {$endif}
  {$if defined(has_arduinopins)                 },  D11_SPI  = ALT5 or TNativePin.PA7  {$endif}
  {$if defined(has_SPI1) and defined(has_gpiob) },  PB5_SPI1 = ALT5 or TNativePin.PB5  {$endif}
  {$if defined(has_SPI2) and defined(has_gpiob) }, PB15_SPI2 = ALT5 or TNativePin.PB15 {$endif}
  {$if defined(has_SPI2) and defined(has_gpioc) },  PC1_SPI2 = ALT5 or TNativePin.PC1  {$endif}
  {$if defined(has_SPI3) and defined(has_gpioc) },  PC1_SPI3 = ALT5 or TNativePin.PC1  {$endif}
  {$if defined(has_SPI2) and defined(has_gpioc) },  PC3_SPI2 = ALT5 or TNativePin.PC3  {$endif}
  {$if defined(has_SPI3) and defined(has_gpiod) },  PD6_SPI3 = ALT5 or TNativePin.PD6  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioe) },  PE6_SPI4 = ALT5 or TNativePin.PE6  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioe) }, PE14_SPI4 = ALT5 or TNativePin.PE14 {$endif}
  {$if defined(has_SPI5) and defined(has_gpiof) },  PF9_SPI5 = ALT5 or TNativePin.PF9  {$endif}
  {$if defined(has_SPI5) and defined(has_gpiof) }, PF11_SPI5 = ALT5 or TNativePin.PF11 {$endif}
  {$if defined(has_SPI6) and defined(has_gpiog) }, PG14_SPI6 = ALT5 or TNativePin.PG14 {$endif}
  {$if defined(has_SPI2) and defined(has_gpioi) },  PI3_SPI2 = ALT5 or TNativePin.PI3  {$endif}
  {$if defined(has_SPI5) and defined(has_gpioa) }, PA10_SPI5 = ALT6 or TNativePin.PA10 {$endif}
  {$if defined(has_SPI3) and defined(has_gpiob) },  PB5_SPI3 = ALT6 or TNativePin.PB5  {$endif}
  {$if defined(has_SPI5) and defined(has_gpiob) },  PB8_SPI5 = ALT6 or TNativePin.PB8  {$endif}
  {$if defined(has_SPI3) and defined(has_gpioc) }, PC12_SPI3 = ALT6 or TNativePin.PC12 {$endif}
  {$if defined(has_SPI3) and defined(has_gpiod) },  PD0_SPI3 = ALT6 or TNativePin.PD0  {$endif}
  {$if defined(has_SPI5) and defined(has_gpioe) },  PE6_SPI5 = ALT6 or TNativePin.PE6  {$endif}
  {$if defined(has_SPI5) and defined(has_gpioe) }, PE14_SPI5 = ALT6 or TNativePin.PE14 {$endif}
  {$if defined(has_SPI4) and defined(has_gpiog) }, PG13_SPI4 = ALT6 or TNativePin.PG13 {$endif}
  {$if defined(has_SPI3) and defined(has_gpiob) },  PB0_SPI3 = ALT7 or TNativePin.PB0  {$endif}
  {$if defined(has_SPI3) and defined(has_gpiob) },  PB2_SPI3 = ALT7 or TNativePin.PB2  {$endif}
  //{$if defined(has_SPI2) and defined(has_gpioc) },  PC1_SPI2 = ALT7 or TNativePin.PC1  {$endif}
  );


  TSPIMISOPins = (
  {$if defined(has_SPI1) and defined(has_gpioa) }   PA6_SPI1 = ALT5 or TNativePin.PA6  {$endif}
  {$if defined(has_arduinopins)                 },  D12_SPI  = ALT5 or TNativePin.PA6  {$endif}
  {$if defined(has_SPI1) and defined(has_gpiob) },  PB4_SPI1 = ALT5 or TNativePin.PB4  {$endif}
  {$if defined(has_SPI2) and defined(has_gpiob) }, PB14_SPI2 = ALT5 or TNativePin.PB14 {$endif}
  {$if defined(has_SPI2) and defined(has_gpioc) },  PC2_SPI2 = ALT5 or TNativePin.PC2  {$endif}
  {$if defined(has_SPI4) and defined(has_gpiod) },  PD0_SPI4 = ALT5 or TNativePin.PD0  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioe) },  PE5_SPI4 = ALT5 or TNativePin.PE5  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioe) }, PE13_SPI4 = ALT5 or TNativePin.PE13 {$endif}
  {$if defined(has_SPI5) and defined(has_gpiof) },  PF8_SPI5 = ALT5 or TNativePin.PF8  {$endif}
  {$if defined(has_SPI6) and defined(has_gpiog) }, PG12_SPI6 = ALT5 or TNativePin.PG12 {$endif}
  {$if defined(has_SPI5) and defined(has_gpioh) },  PH7_SPI5 = ALT5 or TNativePin.PH7  {$endif}
  {$if defined(has_SPI2) and defined(has_gpioi) },  PI2_SPI2 = ALT5 or TNativePin.PI2  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioa) }, PA11_SPI4 = ALT6 or TNativePin.PA11 {$endif}
  {$if defined(has_SPI5) and defined(has_gpioa) }, PA12_SPI5 = ALT6 or TNativePin.PA12 {$endif}
  {$if defined(has_SPI3) and defined(has_gpiob) },  PB4_SPI3 = ALT6 or TNativePin.PB4  {$endif}
  {$if defined(has_SPI3) and defined(has_gpioc) }, PC11_SPI3 = ALT6 or TNativePin.PC11 {$endif}
  {$if defined(has_SPI5) and defined(has_gpioe) },  PE5_SPI5 = ALT6 or TNativePin.PE5  {$endif}
  {$if defined(has_SPI5) and defined(has_gpioe) }, PE13_SPI5 = ALT6 or TNativePin.PE13 {$endif}
  {$if defined(has_SPI4) and defined(has_gpiog) }, PG12_SPI4 = ALT6 or TNativePin.PG12 {$endif}  );

  TSPISCLKPins = (
  {$if defined(has_SPI1) and defined(has_gpioa) }   PA5_SPI1 = ALT5 or TNativePin.PA5  {$endif}
  {$if defined(has_arduinopins)                 },  D13_SPI  = ALT5 or TNativePin.PA5  {$endif}
  {$if defined(has_SPI2) and defined(has_gpioa) },  PA9_SPI2 = ALT5 or TNativePin.PA9  {$endif}
  {$if defined(has_SPI1) and defined(has_gpiob) },  PB3_SPI1 = ALT5 or TNativePin.PB3  {$endif}
  {$if defined(has_SPI2) and defined(has_gpiob) }, PB10_SPI2 = ALT5 or TNativePin.PB10 {$endif}
  {$if defined(has_SPI2) and defined(has_gpiob) }, PB13_SPI2 = ALT5 or TNativePin.PB13 {$endif}
  {$if defined(has_SPI2) and defined(has_gpioc) },  PC7_SPI2 = ALT5 or TNativePin.PC7  {$endif}
  {$if defined(has_SPI2) and defined(has_gpiod) },  PD3_SPI2 = ALT5 or TNativePin.PD3  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioe) },  PE2_SPI4 = ALT5 or TNativePin.PE2  {$endif}
  {$if defined(has_SPI4) and defined(has_gpioe) }, PE12_SPI4 = ALT5 or TNativePin.PE12 {$endif}
  {$if defined(has_SPI5) and defined(has_gpiof) },  PF7_SPI5 = ALT5 or TNativePin.PF7  {$endif}
  {$if defined(has_SPI6) and defined(has_gpiog) }, PG13_SPI6 = ALT5 or TNativePin.PG13 {$endif}
  {$if defined(has_SPI5) and defined(has_gpioh) },  PH6_SPI5 = ALT5 or TNativePin.PH6  {$endif}
  {$if defined(has_SPI2) and defined(has_gpioi) },  PI1_SPI2 = ALT5 or TNativePin.PI1  {$endif}
  {$if defined(has_SPI5) and defined(has_gpiob) },  PB0_SPI5 = ALT6 or TNativePin.PB0  {$endif}
  {$if defined(has_SPI3) and defined(has_gpiob) },  PB3_SPI3 = ALT6 or TNativePin.PB3  {$endif}
  {$if defined(has_SPI4) and defined(has_gpiob) }, PB13_SPI4 = ALT6 or TNativePin.PB13 {$endif}
  {$if defined(has_SPI3) and defined(has_gpioc) }, PC10_SPI3 = ALT6 or TNativePin.PC10 {$endif}
  {$if defined(has_SPI5) and defined(has_gpioe) },  PE2_SPI5 = ALT6 or TNativePin.PE2  {$endif}
  {$if defined(has_SPI5) and defined(has_gpioe) }, PE12_SPI5 = ALT6 or TNativePin.PE12 {$endif}
  {$if defined(has_SPI4) and defined(has_gpiog) }, PG11_SPI4 = ALT6 or TNativePin.PG11 {$endif}
  {$if defined(has_SPI3) and defined(has_gpiob) }, PB12_SPI3 = ALT7 or TNativePin.PB12 {$endif}  );

  TSPINSSPins = (
    //For some braindead Reason D10 Pin is not mapped to a 'real' NSS pin
    {$if defined(has_arduinopins)                 }   D10_SPI  = TNativePin.PB6  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) },  PA4_SPI1 = ALT5 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) }, PA15_SPI1 = ALT5 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) },  PB9_SPI2 = ALT5 or TNativePin.PB9  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) }, PB12_SPI2 = ALT5 or TNativePin.PB12 {$endif}
    {$if defined(has_SPI4) and defined(has_gpioe) },  PE4_SPI4 = ALT5 or TNativePin.PE4  {$endif}
    {$if defined(has_SPI4) and defined(has_gpioe) }, PE11_SPI4 = ALT5 or TNativePin.PE11 {$endif}
    {$if defined(has_SPI5) and defined(has_gpiof) },  PF6_SPI5 = ALT5 or TNativePin.PF6  {$endif}
    {$if defined(has_SPI6) and defined(has_gpiog) },  PG8_SPI6 = ALT5 or TNativePin.PG8  {$endif}
    {$if defined(has_SPI5) and defined(has_gpioh) },  PH5_SPI5 = ALT5 or TNativePin.PH5  {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi) },  PI0_SPI2 = ALT5 or TNativePin.PI0  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa) },  PA4_SPI3 = ALT6 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa) }, PA15_SPI3 = ALT6 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI5) and defined(has_gpiob) },  PB1_SPI5 = ALT6 or TNativePin.PB1  {$endif}
    {$if defined(has_SPI4) and defined(has_gpiob) }, PB12_SPI4 = ALT6 or TNativePin.PB12 {$endif}
    {$if defined(has_SPI5) and defined(has_gpioe) },  PE4_SPI5 = ALT6 or TNativePin.PE4  {$endif}
    {$if defined(has_SPI5) and defined(has_gpioe) }, PE11_SPI5 = ALT6 or TNativePin.PE11 {$endif}
    {$if defined(has_SPI4) and defined(has_gpiog) }, PG14_SPI4 = ALT6 or TNativePin.PG14 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) },  PB4_SPI2 = ALT7 or TNativePin.PB4  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod) },  PD1_SPI2 = ALT7 or TNativePin.PD1  {$endif}
  );

  TSPIDMAChannels = (
    {$if defined(has_arduinopins) }   DMA_SPI_RX =   DMA2_Stream0_BASE {$endif}
    {$if defined(has_arduinopins) },  DMA_SPI_TX =   DMA2_Stream3_BASE,{$endif}
    {$if defined(has_SPI1)        }   DMA2_STREAM0_SPI1_RX = DMA2_Stream0_BASE {$endif}
    {$if defined(has_SPI1)        },  DAM2_STREAM2_SPI1_RX = DMA2_Stream2_BASE {$endif}
    {$if defined(has_SPI1)        },  DMA2_STREAM3_SPI1_TX = DMA2_Stream3_BASE {$endif}
    {$if defined(has_SPI1)        },  DMA2_STREAM5_SPI1_TX = DMA2_Stream5_BASE {$endif}

    {$if defined(has_SPI2)        },  DMA1_STREAM3_SPI2_RX = DMA1_Stream3_BASE {$endif}
    {$if defined(has_SPI2)        },  DMA1_STREAM4_SPI2_TX = DMA1_Stream4_BASE {$endif}

    {$if defined(has_SPI3)        },  DMA1_STREAM0_SPI3_RX = DMA1_Stream0_BASE {$endif}
    {$if defined(has_SPI3)        },  DMA1_STREAM2_SPI3_RX = DMA1_Stream2_BASE {$endif}
    {$if defined(has_SPI3)        },  DMA1_STREAM5_SPI3_TX = DMA1_Stream5_BASE {$endif}
    {$if defined(has_SPI3)        },  DMA1_STREAM7_SPI3_TX = DMA1_Stream7_BASE {$endif}

    {$if defined(has_SPI4)        },  DMA2_STREAM0_SPI4_RX = DMA2_Stream0_BASE {$endif}
    {$if defined(has_SPI4)        },  DMA2_STREAM1_SPI4_TX = DMA2_Stream1_BASE {$endif}
    {$if defined(has_SPI4)        },  DMA2_STREAM3_SPI3_RX = DMA2_Stream3_BASE {$endif}
    {$if defined(has_SPI4)        },  DMA2_STREAM4_SPI3_TX = DMA2_Stream4_BASE {$endif}
  );

{$ENDREGION}

const
  DefaultSPIBaudrate=8000000;
  MaxSPIBaudrate=50000000;
  DefaultSPITimeOut=10000;
  SPICount = 6;

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
                         const ANSSPin  : TSPINSSPins); overload;
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

  {$IF DEFINED(HAS_ARDUINOPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

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
    SPI1_BASE : setBit(RCC.APB2ENR,12);
    SPI2_BASE : setBit(RCC.APB1ENR,14);
    SPI3_BASE : setBit(RCC.APB1ENR,15);
    {$ifdef has_spi4}SPI4_BASE : setBit(RCC.APB2ENR,13);{$endif}
    {$ifdef has_spi5}SPI5_BASE : setBit(RCC.APB2ENR,20);{$endif}
    {$ifdef has_spi6}SPI6_BASE : setBit(RCC.APB2ENR,21);{$endif}
  end;

  //We need to save the primary SPI Pin in Memory so that we can reuse it
  for i := 1 to SPICount do
    NSSPins[i] := -1;

  // Set Defaults, all crazy Modes turned off, SPI disabled
  CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  CR2:= 0;

  // MSTR Always set Master Mode
  SetBit(CR1,2);

  // Set correct Polarity and Phase aka as Mode 0-3
  setBitsMasked(CR1,longWord(TSPIMode.Mode0),%11 shl 0,0);

  //Disable I2S Mode
  self.I2SCFGR := 0;

  // Set Software NSS
  SetBitLevelHigh(CR1,9);
  SetBitLevelHigh(CR1,8);

  //Start with Eight Bits per Word
  setBitsPerWord(TSPIBitsPerWord.Eight);

  setBaudRate(DefaultSPIBaudrate);

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
      {$ifdef has_spi2}SPI4_BASE : begin
        NSSPins[4] := longInt(aNSSPin);
      end;
      {$endif}
      {$ifdef has_spi2}SPI5_BASE : begin
        NSSPins[5] := longInt(aNSSPin);
      end;
      {$endif}
      {$ifdef has_spi2}SPI6_BASE : begin
        NSSPins[6] := longInt(aNSSPin);
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
    {$ifdef has_spi5}SPI5_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_spi6}SPI6_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
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
      {$ifdef has_spi5}SPI5_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
      {$ifdef has_spi6}SPI6_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;
  Result := BaseFrequency shr (GetBitsMasked(CR1,%111 shl 3,3)+1);
end;

procedure TSPIRegistersHelper.SetBaudrate(const aBaudrate: longWord);
var
  Status : boolean;
begin
  status := Disable;
  SetBitsMasked(CR1,FindDividerValue(aBaudrate),%111 shl 3,3);
  if status = true then
    Enable;
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord(GetBitValue(CR1,11));
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
var
  Status : boolean;
begin
  status := Disable;
  SetBitValue(CR1,TBitValue(aBitsPerWord),11);
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

procedure TSPIRegistersHelper.WaitForTXFinished;
var
  Dummy : word;
begin
  //Make sure are Data is shifted out
  WaitBitIsSet(SR,1);
  //Wait for Busy Flag to be cleared
  WaitBitIsCleared(SR,7);
  //Clear Overflow
  dummy := DR;
end;

procedure TSPIRegistersHelper.BeginTransaction;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : GPIO.SetPinLevelLow(NSSPins[1] and $ff);{$endif}
    {$ifdef has_spi2}SPI2_BASE : GPIO.SetPinLevelLow(NSSPins[2] and $ff);{$endif}
    {$ifdef has_spi3}SPI3_BASE : GPIO.SetPinLevelLow(NSSPins[3] and $ff);{$endif}
    {$ifdef has_spi4}SPI4_BASE : GPIO.SetPinLevelLow(NSSPins[4] and $ff);{$endif}
    {$ifdef has_spi5}SPI5_BASE : GPIO.SetPinLevelLow(NSSPins[5] and $ff);{$endif}
    {$ifdef has_spi6}SPI6_BASE : GPIO.SetPinLevelLow(NSSPins[6] and $ff);{$endif}
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
    {$ifdef has_spi5}SPI5_BASE : GPIO.SetPinLevelHigh(NSSPins[5] and $ff);{$endif}
    {$ifdef has_spi6}SPI6_BASE : GPIO.SetPinLevelHigh(NSSPins[6] and $ff);{$endif}
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

procedure TSPIRegistersHelper.WaitForTXReady; inline;
begin
  WaitBitIsSet(self.SR,1);
end;

procedure TSPIRegistersHelper.WaitForRXReady; inline;
begin
  WaitBitIsSet(self.SR,0);
end;

procedure TSPIRegistersHelper.WaitForTXFinished; inline;
begin
  //Make sure are Data is shifted out
  WaitBitIsSet(Self.SR,1);
  //Wait for Busy Flag to be cleared
  WaitBitIsCleared(Self.SR,7);
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
