unit MBF.PIC32MX.SPI;
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

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.PIC32MX.GPIO,
  MBF.PIC32MX.SystemCore;

{$REGION PinDefinitions}
type
  TSPIMOSIPins = (
    {$if defined(has_SPI1 ) and defined(has_gpioa) }  PA1_SPI1  = ALT3 or TNativePin.PA1  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) } ,PA2_SPI1  = ALT3 or TNativePin.PA2  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) } ,PA4_SPI1  = ALT3 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) } ,PA8_SPI1  = ALT3 or TNativePin.PA8  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) } ,PA9_SPI1  = ALT3 or TNativePin.PA9  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB1_SPI1  = ALT3 or TNativePin.PB1  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB2_SPI1  = ALT3 or TNativePin.PB2  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB5_SPI1  = ALT3 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB6_SPI1  = ALT3 or TNativePin.PB6  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB8_SPI1  = ALT3 or TNativePin.PB8  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB11_SPI1 = ALT3 or TNativePin.PB11 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB13_SPI1 = ALT3 or TNativePin.PB13 {$endif}
    {$if defined(chipkitlenny) }                     ,D11_SPI   = ALT3 or TNativePin.PB13 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC1_SPI1  = ALT3 or TNativePin.PC1  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC3_SPI1  = ALT3 or TNativePin.PC3  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC6_SPI1  = ALT3 or TNativePin.PC6  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC8_SPI1  = ALT3 or TNativePin.PC8  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA1_SPI2  = ALT4 or TNativePin.PA1  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA2_SPI2  = ALT4 or TNativePin.PA2  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA4_SPI2  = ALT4 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA8_SPI2  = ALT4 or TNativePin.PA8  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA9_SPI2  = ALT4 or TNativePin.PA9  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB1_SPI2  = ALT4 or TNativePin.PB1  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB2_SPI2  = ALT4 or TNativePin.PB2  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB5_SPI2  = ALT4 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB6_SPI2  = ALT4 or TNativePin.PB6  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB8_SPI2  = ALT4 or TNativePin.PB8  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB11_SPI2 = ALT4 or TNativePin.PB11 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB13_SPI2 = ALT4 or TNativePin.PB13 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC1_SPI2  = ALT4 or TNativePin.PC1  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC3_SPI2  = ALT4 or TNativePin.PC3  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC6_SPI2  = ALT4 or TNativePin.PC6  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC8_SPI2  = ALT4 or TNativePin.PC8  {$endif}
  );
  TSPIMISOPins = (
    {$if defined(has_SPI1 ) and defined(has_gpioa) }  PA1_SPI1  = ALT0 or TNativePin.PA1  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA2_SPI2  = ALT0 or TNativePin.PA2  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB5_SPI1  = ALT1 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB6_SPI2  = ALT1 or TNativePin.PB6  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA4_SPI2  = ALT2 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB1_SPI1  = ALT2 or TNativePin.PB1  {$endif}
    {$if defined(chipkitlenny) }                     ,D12_SPI   = ALT2 or TNativePin.PB1  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB11_SPI1 = ALT3 or TNativePin.PB11 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB13_SPI2 = ALT3 or TNativePin.PB13 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB2_SPI2  = ALT4 or TNativePin.PB2  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB8_SPI1  = ALT4 or TNativePin.PB8  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) } ,PA8_SPI1  = ALT5 or TNativePin.PA8  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC6_SPI2  = ALT5 or TNativePin.PC6  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC1_SPI2  = ALT6 or TNativePin.PC1  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC8_SPI1  = ALT6 or TNativePin.PC8  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) } ,PA9_SPI1  = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC3_SPI2  = ALT7 or TNativePin.PC3  {$endif}
  );
  TSPISCLKPins = (
    {$if defined(has_SPI1 ) and defined(has_gpiob) }  PB14_SCK1 =         TNativePin.PB14 {$endif}
    {$if defined(chipkitlenny) }                     ,  D13_SPI =         TNativePin.PB14 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB15_SCK2 =         TNativePin.PB15 {$endif}
  );
  TSPINSSPins = (
    {$if defined(chipkitlenny) }                      D10_SPI   =         TNativePin.PC1, {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioa) }  PA0_SS1   = ALT0 or TNativePin.PA0  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioa) } ,PA3_SS2   = ALT0 or TNativePin.PA3  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB3_SS1   = ALT1 or TNativePin.PB3  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB14_SS2  = ALT1 or TNativePin.PB14 {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB0_SS2   = ALT2 or TNativePin.PB0  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB4_SS1   = ALT2 or TNativePin.PB4  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB10_SS2  = ALT3 or TNativePin.PB10 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB15_SS1  = ALT3 or TNativePin.PB15 {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpiob) } ,PB7_SS1   = ALT4 or TNativePin.PB7  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpiob) } ,PB9_SS2   = ALT4 or TNativePin.PB9  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC7_SS1   = ALT5 or TNativePin.PC7  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC9_SS2   = ALT5 or TNativePin.PC9  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC0_SS1   = ALT6 or TNativePin.PC0  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC2_SS2   = ALT6 or TNativePin.PC2  {$endif}
    {$if defined(has_SPI2 ) and defined(has_gpioc) } ,PC4_SS2   = ALT7 or TNativePin.PC4  {$endif}
    {$if defined(has_SPI1 ) and defined(has_gpioc) } ,PC5_SS1   = ALT7 or TNativePin.PC5  {$endif}
  );

{$ENDREGION}

const
  DefaultSPIBaudrate=8000000;
  DefaultSPITimeOut=10000;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Eight=%00,
    Sixteen=%01,
    ThirtyTwo=%10
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
    function  GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
    function  GetMode: TSPIMode;
    procedure SetMode(const aMode: TSPIMode);
    function  GetOperatingMode: TSPIOperatingMode;
    procedure SetOperatingMode(const aOperatingMode: TSPIOperatingMode);

  procedure SetMOSIPin(const aMOSIPin : TSPIMOSIPins);
  procedure SetMISOPin(const aMISOPin : TSPIMISOPins);
  procedure SetSCLKPin(const aSCLKPin : TSPISCLKPins);
  procedure SetNSSPin( const aNSSPin : TSPINSSPins);
  procedure SetNSSPinLow(const SoftNSSPin : TPinIdentifier);
  procedure SetNSSPinHigh(const SoftNSSPin : TPinIdentifier);

  public
    procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;

    function  Disable : boolean;
    procedure Enable;

    { Reads specified number of bytes to buffer and returns actual number of bytes read. }
    { Writes specified number of bytes from buffer and returns actual number of bytes written. }
    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(ReadBuffer Pointer to data buffer where the data will be read from. If this parameter is set to @nil,
        then no reading will be done.)
      @param(WriteBuffer Pointer to data buffer where the data will be written to. If this parameter is set to @nil,
        then no writing will be done.)
      @param(BufferSize The size of read and write buffers in bytes.)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Number of bytes that were actually transferred.) }
    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Buffer Pointer to data buffer where the data will be read from and at the same time written to,
        overwriting its contents.)
      @param(BufferSize The size of buffer in bytes.)
      @returns(Number of bytes that were actually transferred.) }
    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Value  Word sized Data Value that weill get sent over SPI When in 8 Bit Mode then 2 bytes will be transfered)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Word Data that was received. When in 8 Bit Mode then 2 bytes will be combined in 1 word) }

    function ReadByte(var aReadByte: byte; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadWord(var aReadWord: word; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadWord(var aReadBuffer: array of word; aReadCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;

    function WriteByte(const aWriteByte: byte; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteBuffer(pWriteBuffer: pByte; aWriteCount : longWord; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteWord(const aWriteWord: word; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteWord(const aWriteBuffer: array of word; aWriteCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;

    function TransferByte(const aWriteByte : byte; var aReadByte : byte; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferByte(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aTransferCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferWord(const aWriteWord: word; var aReadWord : word; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferWord(const aWriteBuffer: array of word; var aReadBuffer : array of word; aTransferCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;

    property Baudrate : longWord read getBaudrate write setBaudrate;
    property Mode : TSPIMode read getMode write setMode;
    property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
    property OperatingMode : TSPIOperatingMode read getOperatingMode write setOperatingMode;

    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
  end;

  {$IF DEFINED(chipkitlenny)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF}

implementation
uses
  MBF.BitHelpers;

var
  NSSPins : array[1..4] of longInt;

procedure TSPIRegistersHelper.Initialize;
var
  i,CR1,Divider : longWord;
begin
  for i := 1 to 6 do
    NSSPins[i] := -1;
  //Reset Status Bits
  SPISTAT:= 0;
  //Baudrate Divider
  SPIBRG:= 0;
  //Default Mode, no interrupts
  SPICON2 := 0;
  //Enable Hardware Slave Select, Active Low, use PBCLK, Enhanced Buffer off, 8bit mode, Mode 0, Master
  SPICON := $18020;
  // MSTR Always set Master Mode
  SetBitLevelHigh(SPICON,5);

  // Set correct Polarity and Phase aka as Mode 0
  clearBit(SPICON,8);
  clearBit(SPICON,6);
end;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins); overload;
begin
  Initialize;
  setBaudRate(DefaultSPIBaudrate);

  //Set configuration as defined by user
  SetMOSIPin(AMOSIPin);
  SetMISOPin(AMISOPin);
  SetSCLKPin(ASCLKPin);
  // Some special handling needed
  SetNSSPin(ANSSPin);
end;

procedure TSPIRegistersHelper.SetMOSIPin(const aMOSIPin : TSPIMOSIPins);
begin
  SystemCore.RegUnlock;
  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode.Output;
  GPIO.SetPPOS(longWord(AMOSIPin) and $ff,TPinAlternateMode((longWord(AMOSIPin) shr 8) and %1111));
  SystemCore.RegLock;
end;

procedure TSPIRegistersHelper.setMISOPin(const aMISOPIN : TSPIMISOPins);
begin
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode.Input;
  SystemCore.RegUnlock;
  case longWord(@Self) of
    {$if defined(has_SPI1 )} SPI1_BASE : PPIS.SDI1R := (longWord(aMISOPIN) shr 8) and %1111;{$endif}
    {$if defined(has_SPI2 )} SPI2_BASE : PPIS.SDI2R := (longWord(aMISOPIN) shr 8) and %1111;{$endif}
    {$if defined(has_SPI3 )} SPI3_BASE : PPIS.SDI3R := (longWord(aMISOPIN) shr 8) and %1111;{$endif}
    {$if defined(has_SPI4 )} SPI4_BASE : PPIS.SDI4R := (longWord(aMISOPIN) shr 8) and %1111;{$endif}
    {$if defined(has_SPI5 )} SPI5_BASE : PPIS.SDI5R := (longWord(aMISOPIN) shr 8) and %1111;{$endif}
    {$if defined(has_SPI6 )} SPI6_BASE : PPIS.SDI6R := (longWord(aMISOPIN) shr 8) and %1111;{$endif}
  end;
  SystemCore.RegLock;
end;

procedure TSPIRegistersHelper.setSCLKPin(const aSCLKPin : TSPISCLKPins);
begin
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode.Output;
end;

procedure TSPIRegistersHelper.setNSSPin(const aNSSPin : TSPINSSPins);
begin
  if longInt(aNSSPin) >=ALT0 then
  begin
    GPIO.PinMode[longWord(ANSSPin) and $ff] := TPinMode.Output;
    GPIO.PinMode[longWord(aNSSPin) and $ff] := TPinMode((longWord(aNSSPin) shr 8) and $0f);
    GPIO.SetPPOS(longWord(ANSSPin) and $ff,TPinAlternateMode((longWord(ANSSPin) shr 8) and %1111));
    //Enable Hardware NSS
    SetBitLevelHigh(SPICON,28);
    SetBitLevelLow(SPICON,29);
  end
  else
  begin
    SetBitLevelLow(SPICON,28);

    if longInt(aNSSPin) >= 0 then
    begin
      GPIO.PinMode[longWord(aNSSPin)] := TPinMode.Output;
      GPIO.SetPinLevelHigh(longWord(aNSSPin));
    end;
  end;

  case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : NSSPins[1] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi2}SPI2_BASE : NSSPins[2] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi3}SPI3_BASE : NSSPins[3] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi4}SPI4_BASE : NSSPins[4] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi5}SPI3_BASE : NSSPins[5] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi6}SPI4_BASE : NSSPins[6] := longInt(aNSSPin);{$endif}
  end;
end;

procedure TSPIRegistersHelper.SetNSSPinLow(const SoftNSSPin : TPinIdentifier);
var
  _NSSPin : longWord;
begin
  // Are we doing Hardware NSS?
  if (GetBitValue(SPICON,28) = 1) and (SoftNSSPin=TNativePin.None) then
    exit;

  if SoftNSSPin > TNativePin.None then
  begin
    GPIO.SetPinLevelLow(SoftNSSPin);
    SetBitLevelLow(SPICON,28);
    exit;
  end;

  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
    {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
    {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
    {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    {$ifdef has_spi5}SPI5_BASE : _NSSPin := NSSPins[5];{$endif}
    {$ifdef has_spi6}SPI6_BASE : _NSSPin := NSSPins[6];{$endif}
  end;

  if _NSSPin >= ALT0 then
  begin
    //Enable Hardware NSS
    SetBitLevelLow(SPICON,29);
    SetBitLevelHigh(SPICON,28);
  end
  else
  begin
    SetBitLevelHigh(SPICON,28);
    GPIO.SetPinLevelLow(_NSSPin);
  end
end;

procedure TSPIRegistersHelper.SetNSSPinHigh(const SoftNSSPin : TPinIdentifier);
var
  _NSSPin : longWord;
begin
  // Are we doing Hardware NSS?
  if (GetBitValue(SPICON,28) = 1) and (SoftNSSPin=TNativePin.None) then
    exit;

  if SoftNSSPin > TNativePin.None then
  begin
    GPIO.SetPinLevelHigh(SoftNSSPin);
    exit;
  end;

  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
    {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
    {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
    {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    {$ifdef has_spi5}SPI5_BASE : _NSSPin := NSSPins[5];{$endif}
    {$ifdef has_spi6}SPI6_BASE : _NSSPin := NSSPins[6];{$endif}
  end;

  //Take the NSS Pin High in software Mode (end transfer)
  GPIO.SetPinLevelHigh(_NSSPin);
end;

function TSPIRegistersHelper.Disable : boolean;
begin
  Result := GetBitValue(SPICON,15) > 0;
  SetBitLevelLow(SPICON,15);
end;

procedure TSPIRegistersHelper.Enable;
begin
  SetBitLevelHigh(SPICON,15);
end;

function TSPIRegistersHelper.FindDividerValue(const Baudrate: longWord): longWord;
var
  BaseFrequency : longWord;
begin
  if GetBit(SPICON,23) = 0 then
    BaseFrequency := SystemCore.GetPBCLKFrequency
  else
    //TODO is Sysclock correct here????
    BaseFrequency := SystemCore.GetSYSCLKFrequency;

  for result := 0 to 1 shl 13 do
    if BaudRate >= (BaseFrequency div result) then
      break;
end;

function TSPIRegistersHelper.GetBaudrate: longWord;
var
  BaseFrequency : longWord;
begin
  if GetBit(SPICON,23) = 0 then
    BaseFrequency := SystemCore.GetPBCLKFrequency
  else
    //TODO is Sysclock correct here????
    BaseFrequency := SystemCore.GetSYSCLKFrequency;
  Result := BaseFrequency div (SPIBRG and %1111111111111);
end;

procedure TSPIRegistersHelper.SetBaudrate(const aBaudrate: longWord);
var
  Divider : longWord;
begin
    Divider := FindDividerValue(aBaudrate);
    SPIBRG := Divider;
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord(GetBitsMasked(SPICON,%11 shl 10,10));
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
begin
  SetBitValue(CR1,TBitValue(aBitsPerWord),10);
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

function TSPIRegistersHelper.ReadByte(var aReadByte: byte; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := $ff;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadByte := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  dummy : byte;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aReadCount = -1 then
    aReadCount := High(aReadBuffer) - Low(aReadBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aReadbuffer) to Low(aReadbuffer)+aReadCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := $ff;

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.ReadWord(var aReadWord: word; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := $ffff;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadWord := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;


  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.ReadWord(var aReadBuffer: array of word; aReadCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  Result := true;

  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aReadCount = -1 then
    aReadCount := High(aReadBuffer) - Low(aReadBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aReadBuffer) to Low(aReadBuffer)+aReadCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := $ffff;

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteByte(const aWriteByte: byte; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  Dummy : byte;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  DR := aWriteByte;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  Dummy := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteBuffer(pWriteBuffer: pByte; aWriteCount : longWord; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  dummy : byte;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := 1 to aWriteCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := pWriteBuffer^;

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    Dummy := DR;
    inc(pWriteBuffer);
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  dummy : byte;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aWriteCount = -1 then
    aWriteCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aWriteCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := aWriteBuffer[i];

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    Dummy := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteWord(const aWriteWord: word; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  Dummy : Word;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 16 bits
  setBitsPerWord(TSPIBitsPerWord.Sixteen);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  DR := aWriteWord;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  Dummy := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;


function TSPIRegistersHelper.WriteWord(const aWriteBuffer: array of Word; aWriteCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  dummy : Word;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aWriteCount = -1 then
    aWriteCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 16 bits
  setBitsPerWord(TSPIBitsPerWord.Sixteen);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aWriteCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    self.DR := aWriteBuffer[i];
    // TXE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    Dummy := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferByte(const aWriteByte : Byte; var aReadByte : Byte; const TimeOut: TMilliSeconds=0;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := aWriteByte;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadByte := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferByte(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aTransferCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);

  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aTransferCount = -1 then
    aTransferCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aTransferCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := aWriteBuffer[i];

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferWord(const aWriteWord : Word; var aReadWord : Word; const TimeOut: TMilliSeconds=0;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := aWriteWord;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadWord := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferWord(const aWriteBuffer: array of word; var aReadBuffer : array of word; aTransferCount : integer=-1; const TimeOut: TMilliSeconds=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);

  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aTransferCount = -1 then
    aTransferCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aTransferCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := aWriteBuffer[i];

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;



(*
function TSPIRegistersHelper.TransferWord(const Value : Word;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): word;
var
  tmpPin,_NSSPin : TPinIdentifier;
  CR1 : longWord;
begin
  // This is a hack that is only necessary because on Nucleo boards the Pin D10 is not mapped to Hardware-NSS Pin
  _NSSPin := SoftNSSPin;
  if _NSSPin = TNativePin.None then
  begin
    case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
      {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
      {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
      {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    end;
  end;

  //Take the NSS Pin Low in software Mode (start transfer)
  if _NSSPin < ALT0 then
  begin
    if _NSSPin > TNativePin.None then
      GPIO.PinValue[_NSSPin] := 0;
    // Switch to Software Mode
    self.CR1 := self.CR1 or (1 shl 9) or (1 shl 8);
  end
  else
    //Disable Software Mode
    self.CR1 := self.CR1 and (not (1 shl 8));


  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  self.CR1 := self.CR1 or (1 shl 6);

  //wait for TXE to go high (no more data to shift out)
  while self.SR and (1 shl 1) = 0 do
    ;

  //read data from rx buffer if available and discard it
  if self.SR and (1 shl 0) = 1 then
    Result := self.DR;

  //Put Data into Send Register
  self.DR := Value;

  // RXNE Wait until data is completely shifted in
  while self.SR and (1 shl 0) = 0 do
    ;

  // TXE Wait until data is completely shifted in
  while self.SR and (1 shl 1) = 0 do
    ;

  // TXE Wait until data is completely shifted in
  while self.SR and (1 shl 7) <> 0 do
    ;

  // Now read the result back from Data Register
  Result := self.DR;

  // Take NSS High again in Software Mode (end of Transfer)
  if _NSSPin < ALT0 then
    if (_NSSPin > TNativePin.None) and (_NSSPin < ALT0) then
      GPIO.PinValue[_NSSPin] := 0;

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  self.CR1 := self.CR1 and (not (1 shl 6));
end;

function TSPIRegistersHelper.Transfer(const ReadBuffer, WriteBuffer: Pointer; const BufferSize: longWord;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;
var
  ReadBytes,WriteBytes : longWord;
  tmpPin, _NSSPin : TPinIdentifier;
begin
  ReadBytes := 0;
  WriteBytes := 0;

  // This is a hack that is only necessary because on Nucleo boards the Pin D10 is not mapped to Hardware-NSS Pin
  _NSSPin := SoftNSSPin;

  if _NSSPin = TNativePin.None then
  begin
    case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
      {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
      {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
      {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    end;
  end;

  //Take the NSS Pin Low in software Mode (start transfer)
  if _NSSPin < ALT0 then
    // Switch to Software Mode as either no pin is selected or a GPIO Pin
    self.CR1 := self.CR1 or (1 shl 9) or (1 shl 8)
  else
    //Disable Software Mode
    self.CR1 := self.CR1 and (not (1 shl 8));

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  self.CR1 := self.CR1 or (1 shl 6);

  //wait for TXE to go high (no more data to shift out)
  while self.SR and (1 shl 1) = 0 do
    ;

  //read data from rx buffer if available and discard it
  if self.SR and (1 shl 0) = 1 then
    Result := self.DR;

  while ((ReadBuffer <> nil) and (ReadBytes < BufferSize)) or ((WriteBuffer <> nil) and (WriteBytes < BufferSize)) do
  begin
    if (_NSSPin > TNativePin.None) and (_NSSPin < ALT0) then
      GPIO.PinValue[_NSSPin] := TPinValue.low;
    if WriteBuffer <> nil then
    begin
      if getBitsPerWord = TSPIBitsPerWord.Sixteen then
      begin
        self.DR := PWord(PByte(WriteBuffer) + WriteBytes)^;
        Inc(WriteBytes);
        Inc(WriteBytes);
      end
      else
      begin
        self.DR := PByte(PByte(WriteBuffer) + WriteBytes)^;
        Inc(WriteBytes);
      end;
    end
    else
      self.DR := $ff; //We need to send dummy data to be able to receive

    // RXNE Wait until data is completely shifted in
    while self.SR and (1 shl 0) = 0 do
      ;

    // TXE Wait until data is completely shifted in
    while self.SR and (1 shl 1) = 0 do
      ;

    // TXE Wait until data is completely shifted in
    while self.SR and (1 shl 7) <> 0 do
      ;

    Result := self.DR;

    if ReadBuffer <> nil then
    begin // Get data from Read FIFOs.
      if (ReadBytes < BufferSize) and ((ReadBuffer <> WriteBuffer) or (ReadBytes < WriteBytes)) then
      begin
        if getBitsPerWord = TSPIBitsPerWord.Sixteen then
        begin
          PWord(PByte(ReadBuffer) + ReadBytes)^ := result;
          Inc(WriteBytes);
          Inc(WriteBytes);
        end
        else
        begin
          PByte(PByte(ReadBuffer) + ReadBytes)^ := result;
          Inc(ReadBytes);
        end;
      end;
    end;

    if (_NSSPin > TNativePin.None) and (_NSSPin < ALT0) then
      GPIO.PinValue[_NSSPin] := 1;
  end;

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  self.CR1 := self.CR1 and (not (1 shl 6));
  if WriteBytes > ReadBytes then
    Result := WriteBytes
  else
    Result := ReadBytes;
end;
*)
end.

