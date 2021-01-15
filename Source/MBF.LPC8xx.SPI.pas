unit MBF.LPC8xx.SPI;
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
  MBF.LPC8xx.GPIO;

{$REGION PinDefinitions}

{$define has_spi0}
{$define has_spi1}

{$if defined(LPC810M021FN8) or defined( LPC811M001JDH16) or defined(LPC812M101JD20)}
  {$undefine has_spi1}
{$endif}

type
  TSPIMOSIPins = (
     PA0_SPI0 =  ALT16 or TNativePin.PA0
    ,PA1_SPI0 =  ALT16 or TNativePin.PA1
    ,PA2_SPI0 =  ALT16 or TNativePin.PA2
    ,PA3_SPI0 =  ALT16 or TNativePin.PA3
    ,PA4_SPI0 =  ALT16 or TNativePin.PA4
    ,PA5_SPI0 =  ALT16 or TNativePin.PA5
    ,PA6_SPI0 =  ALT16 or TNativePin.PA6
    ,PA7_SPI0 =  ALT16 or TNativePin.PA7
    ,PA8_SPI0 =  ALT16 or TNativePin.PA8
    ,PA9_SPI0 =  ALT16 or TNativePin.PA9
    ,PA10_SPI0 = ALT16 or TNativePin.PA10
    ,PA11_SPI0 = ALT16 or TNativePin.PA11
    ,PA12_SPI0 = ALT16 or TNativePin.PA12
    ,PA13_SPI0 = ALT16 or TNativePin.PA13
    ,PA14_SPI0 = ALT16 or TNativePin.PA14
    ,PA15_SPI0 = ALT16 or TNativePin.PA15
    ,PA16_SPI0 = ALT16 or TNativePin.PA16
    ,PA17_SPI0 = ALT16 or TNativePin.PA17
    ,PA18_SPI0 = ALT16 or TNativePin.PA18
    ,PA19_SPI0 = ALT16 or TNativePin.PA19
    ,PA20_SPI0 = ALT16 or TNativePin.PA20
    ,PA21_SPI0 = ALT16 or TNativePin.PA21
    ,PA22_SPI0 = ALT16 or TNativePin.PA22
    ,PA23_SPI0 = ALT16 or TNativePin.PA23
    ,PA24_SPI0 = ALT16 or TNativePin.PA24
    ,PA25_SPI0 = ALT16 or TNativePin.PA25
    ,PA26_SPI0 = ALT16 or TNativePin.PA26
    {$IF DEFINED(HAS_ARDUINOPINS)}
    ,D11_SPI  =  ALT16 or TNativePin.PA26
    {$endif}
    ,PA27_SPI0 = ALT16 or TNativePin.PA27
    ,PA28_SPI0 = ALT16 or TNativePin.PA28
   {$if defined(has_spi1)}
    ,PA0_SPI1 =  ALT23 or TNativePin.PA0
    ,PA1_SPI1 =  ALT23 or TNativePin.PA1
    ,PA2_SPI1 =  ALT23 or TNativePin.PA2
    ,PA3_SPI1 =  ALT23 or TNativePin.PA3
    ,PA4_SPI1 =  ALT23 or TNativePin.PA4
    ,PA5_SPI1 =  ALT23 or TNativePin.PA5
    ,PA6_SPI1 =  ALT23 or TNativePin.PA6
    ,PA7_SPI1 =  ALT23 or TNativePin.PA7
    ,PA8_SPI1 =  ALT23 or TNativePin.PA8
    ,PA9_SPI1 =  ALT23 or TNativePin.PA9
    ,PA10_SPI1 = ALT23 or TNativePin.PA10
    ,PA11_SPI1 = ALT23 or TNativePin.PA11
    ,PA12_SPI1 = ALT23 or TNativePin.PA12
    ,PA13_SPI1 = ALT23 or TNativePin.PA13
    ,PA14_SPI1 = ALT23 or TNativePin.PA14
    ,PA15_SPI1 = ALT23 or TNativePin.PA15
    ,PA16_SPI1 = ALT23 or TNativePin.PA16
    ,PA17_SPI1 = ALT23 or TNativePin.PA17
    ,PA18_SPI1 = ALT23 or TNativePin.PA18
    ,PA19_SPI1 = ALT23 or TNativePin.PA19
    ,PA20_SPI1 = ALT23 or TNativePin.PA20
    ,PA21_SPI1 = ALT23 or TNativePin.PA21
    ,PA22_SPI1 = ALT23 or TNativePin.PA22
    ,PA23_SPI1 = ALT23 or TNativePin.PA23
    ,PA24_SPI1 = ALT23 or TNativePin.PA24
    ,PA25_SPI1 = ALT23 or TNativePin.PA25
    ,PA26_SPI1 = ALT23 or TNativePin.PA26
    ,PA27_SPI1 = ALT23 or TNativePin.PA27
    ,PA28_SPI1 = ALT23 or TNativePin.PA28
  {$endif}
  );

  TSPIMISOPins = (
       PA0_SPI0 =  ALT17 or TNativePin.PA0
    ,PA1_SPI0 =  ALT17 or TNativePin.PA1
    ,PA2_SPI0 =  ALT17 or TNativePin.PA2
    ,PA3_SPI0 =  ALT17 or TNativePin.PA3
    ,PA4_SPI0 =  ALT17 or TNativePin.PA4
    ,PA5_SPI0 =  ALT17 or TNativePin.PA5
    ,PA6_SPI0 =  ALT17 or TNativePin.PA6
    ,PA7_SPI0 =  ALT17 or TNativePin.PA7
    ,PA8_SPI0 =  ALT17 or TNativePin.PA8
    ,PA9_SPI0 =  ALT17 or TNativePin.PA9
    ,PA10_SPI0 = ALT17 or TNativePin.PA10
    ,PA11_SPI0 = ALT17 or TNativePin.PA11
    ,PA12_SPI0 = ALT17 or TNativePin.PA12
    ,PA13_SPI0 = ALT17 or TNativePin.PA13
    ,PA14_SPI0 = ALT17 or TNativePin.PA14
    ,PA15_SPI0 = ALT17 or TNativePin.PA15
    ,PA16_SPI0 = ALT17 or TNativePin.PA16
    ,PA17_SPI0 = ALT17 or TNativePin.PA17
    ,PA18_SPI0 = ALT17 or TNativePin.PA18
    ,PA19_SPI0 = ALT17 or TNativePin.PA19
    ,PA20_SPI0 = ALT17 or TNativePin.PA20
    ,PA21_SPI0 = ALT17 or TNativePin.PA21
    ,PA22_SPI0 = ALT17 or TNativePin.PA22
    ,PA23_SPI0 = ALT17 or TNativePin.PA23
    ,PA24_SPI0 = ALT17 or TNativePin.PA24
    ,PA25_SPI0 = ALT17 or TNativePin.PA25
    {$IF DEFINED(HAS_ARDUINOPINS)}
    ,D12_SPI   = ALT17 or TNativePin.PA25
    {$endif}
    ,PA26_SPI0 = ALT17 or TNativePin.PA26
    ,PA27_SPI0 = ALT17 or TNativePin.PA27
    ,PA28_SPI0 = ALT17 or TNativePin.PA28
   {$if defined(has_spi1)}
    ,PA0_SPI1 =  ALT24 or TNativePin.PA0
    ,PA1_SPI1 =  ALT24 or TNativePin.PA1
    ,PA2_SPI1 =  ALT24 or TNativePin.PA2
    ,PA3_SPI1 =  ALT24 or TNativePin.PA3
    ,PA4_SPI1 =  ALT24 or TNativePin.PA4
    ,PA5_SPI1 =  ALT24 or TNativePin.PA5
    ,PA6_SPI1 =  ALT24 or TNativePin.PA6
    ,PA7_SPI1 =  ALT24 or TNativePin.PA7
    ,PA8_SPI1 =  ALT24 or TNativePin.PA8
    ,PA9_SPI1 =  ALT24 or TNativePin.PA9
    ,PA10_SPI1 = ALT24 or TNativePin.PA10
    ,PA11_SPI1 = ALT24 or TNativePin.PA11
    ,PA12_SPI1 = ALT24 or TNativePin.PA12
    ,PA13_SPI1 = ALT24 or TNativePin.PA13
    ,PA14_SPI1 = ALT24 or TNativePin.PA14
    ,PA15_SPI1 = ALT24 or TNativePin.PA15
    ,PA16_SPI1 = ALT24 or TNativePin.PA16
    ,PA17_SPI1 = ALT24 or TNativePin.PA17
    ,PA18_SPI1 = ALT24 or TNativePin.PA18
    ,PA19_SPI1 = ALT24 or TNativePin.PA19
    ,PA20_SPI1 = ALT24 or TNativePin.PA20
    ,PA21_SPI1 = ALT24 or TNativePin.PA21
    ,PA22_SPI1 = ALT24 or TNativePin.PA22
    ,PA23_SPI1 = ALT24 or TNativePin.PA23
    ,PA24_SPI1 = ALT24 or TNativePin.PA24
    ,PA25_SPI1 = ALT24 or TNativePin.PA25
    ,PA26_SPI1 = ALT24 or TNativePin.PA26
    ,PA27_SPI1 = ALT24 or TNativePin.PA27
    ,PA28_SPI1 = ALT24 or TNativePin.PA28
  {$endif}
  );

  TSPISCLKPins = (
    PA0_SPI0 =  ALT15 or TNativePin.PA0
    ,PA1_SPI0 =  ALT15 or TNativePin.PA1
    ,PA2_SPI0 =  ALT15 or TNativePin.PA2
    ,PA3_SPI0 =  ALT15 or TNativePin.PA3
    ,PA4_SPI0 =  ALT15 or TNativePin.PA4
    ,PA5_SPI0 =  ALT15 or TNativePin.PA5
    ,PA6_SPI0 =  ALT15 or TNativePin.PA6
    ,PA7_SPI0 =  ALT15 or TNativePin.PA7
    ,PA8_SPI0 =  ALT15 or TNativePin.PA8
    ,PA9_SPI0 =  ALT15 or TNativePin.PA9
    ,PA10_SPI0 = ALT15 or TNativePin.PA10
    ,PA11_SPI0 = ALT15 or TNativePin.PA11
    ,PA12_SPI0 = ALT15 or TNativePin.PA12
    ,PA13_SPI0 = ALT15 or TNativePin.PA13
    ,PA14_SPI0 = ALT15 or TNativePin.PA14
    ,PA15_SPI0 = ALT15 or TNativePin.PA15
    ,PA16_SPI0 = ALT15 or TNativePin.PA16
    ,PA17_SPI0 = ALT15 or TNativePin.PA17
    ,PA18_SPI0 = ALT15 or TNativePin.PA18
    ,PA19_SPI0 = ALT15 or TNativePin.PA19
    ,PA20_SPI0 = ALT15 or TNativePin.PA20
    ,PA21_SPI0 = ALT15 or TNativePin.PA21
    ,PA22_SPI0 = ALT15 or TNativePin.PA22
    ,PA23_SPI0 = ALT15 or TNativePin.PA23
    ,PA24_SPI0 = ALT15 or TNativePin.PA24
    {$IF DEFINED(HAS_ARDUINOPINS)}
    ,D13_SPI   = ALT15 or TNativePin.PA24
    {$endif}
    ,PA25_SPI0 = ALT15 or TNativePin.PA25
    ,PA26_SPI0 = ALT15 or TNativePin.PA26
    ,PA27_SPI0 = ALT15 or TNativePin.PA27
    ,PA28_SPI0 = ALT15 or TNativePin.PA28
    {$if defined(has_spi1)}
    ,PA0_SPI1 =  ALT22 or TNativePin.PA0
    ,PA1_SPI1 =  ALT22 or TNativePin.PA1
    ,PA2_SPI1 =  ALT22 or TNativePin.PA2
    ,PA3_SPI1 =  ALT22 or TNativePin.PA3
    ,PA4_SPI1 =  ALT22 or TNativePin.PA4
    ,PA5_SPI1 =  ALT22 or TNativePin.PA5
    ,PA6_SPI1 =  ALT22 or TNativePin.PA6
    ,PA7_SPI1 =  ALT22 or TNativePin.PA7
    ,PA8_SPI1 =  ALT22 or TNativePin.PA8
    ,PA9_SPI1 =  ALT22 or TNativePin.PA9
    ,PA10_SPI1 = ALT22 or TNativePin.PA10
    ,PA11_SPI1 = ALT22 or TNativePin.PA11
    ,PA12_SPI1 = ALT22 or TNativePin.PA12
    ,PA13_SPI1 = ALT22 or TNativePin.PA13
    ,PA14_SPI1 = ALT22 or TNativePin.PA14
    ,PA15_SPI1 = ALT22 or TNativePin.PA15
    ,PA16_SPI1 = ALT22 or TNativePin.PA16
    ,PA17_SPI1 = ALT22 or TNativePin.PA17
    ,PA18_SPI1 = ALT22 or TNativePin.PA18
    ,PA19_SPI1 = ALT22 or TNativePin.PA19
    ,PA20_SPI1 = ALT22 or TNativePin.PA20
    ,PA21_SPI1 = ALT22 or TNativePin.PA21
    ,PA22_SPI1 = ALT22 or TNativePin.PA22
    ,PA23_SPI1 = ALT22 or TNativePin.PA23
    ,PA24_SPI1 = ALT22 or TNativePin.PA24
    ,PA25_SPI1 = ALT22 or TNativePin.PA25
    ,PA26_SPI1 = ALT22 or TNativePin.PA26
    ,PA27_SPI1 = ALT22 or TNativePin.PA27
    ,PA28_SPI1 = ALT22 or TNativePin.PA28
  {$endif}
);

  TSPINSSPins = (
  PA0_SPI0 =  ALT18 or TNativePin.PA0
,PA1_SPI0 =  ALT18 or TNativePin.PA1
,PA2_SPI0 =  ALT18 or TNativePin.PA2
,PA3_SPI0 =  ALT18 or TNativePin.PA3
,PA4_SPI0 =  ALT18 or TNativePin.PA4
,PA5_SPI0 =  ALT18 or TNativePin.PA5
,PA6_SPI0 =  ALT18 or TNativePin.PA6
,PA7_SPI0 =  ALT18 or TNativePin.PA7
,PA8_SPI0 =  ALT18 or TNativePin.PA8
,PA9_SPI0 =  ALT18 or TNativePin.PA9
,PA10_SPI0 = ALT18 or TNativePin.PA10
,PA11_SPI0 = ALT18 or TNativePin.PA11
,PA12_SPI0 = ALT18 or TNativePin.PA12
,PA13_SPI0 = ALT18 or TNativePin.PA13
,PA14_SPI0 = ALT18 or TNativePin.PA14
,PA15_SPI0 = ALT18 or TNativePin.PA15
{$IF DEFINED(HAS_ARDUINOPINS)}
,D10_SPI   = ALT18 or TNativePin.PA15
{$endif}
,PA16_SPI0 = ALT18 or TNativePin.PA16
,PA17_SPI0 = ALT18 or TNativePin.PA17
,PA18_SPI0 = ALT18 or TNativePin.PA18
,PA19_SPI0 = ALT18 or TNativePin.PA19
,PA20_SPI0 = ALT18 or TNativePin.PA20
,PA21_SPI0 = ALT18 or TNativePin.PA21
,PA22_SPI0 = ALT18 or TNativePin.PA22
,PA23_SPI0 = ALT18 or TNativePin.PA23
,PA24_SPI0 = ALT18 or TNativePin.PA24
,PA25_SPI0 = ALT18 or TNativePin.PA25
,PA26_SPI0 = ALT18 or TNativePin.PA26
,PA27_SPI0 = ALT18 or TNativePin.PA27
,PA28_SPI0 = ALT18 or TNativePin.PA28
{$if defined(has_spi1)}
,PA0_SPI1 =  ALT25 or TNativePin.PA0
,PA1_SPI1 =  ALT25 or TNativePin.PA1
,PA2_SPI1 =  ALT25 or TNativePin.PA2
,PA3_SPI1 =  ALT25 or TNativePin.PA3
,PA4_SPI1 =  ALT25 or TNativePin.PA4
,PA5_SPI1 =  ALT25 or TNativePin.PA5
,PA6_SPI1 =  ALT25 or TNativePin.PA6
,PA7_SPI1 =  ALT25 or TNativePin.PA7
,PA8_SPI1 =  ALT25 or TNativePin.PA8
,PA9_SPI1 =  ALT25 or TNativePin.PA9
,PA10_SPI1 = ALT25 or TNativePin.PA10
,PA11_SPI1 = ALT25 or TNativePin.PA11
,PA12_SPI1 = ALT25 or TNativePin.PA12
,PA13_SPI1 = ALT25 or TNativePin.PA13
,PA14_SPI1 = ALT25 or TNativePin.PA14
,PA15_SPI1 = ALT25 or TNativePin.PA15
,PA16_SPI1 = ALT25 or TNativePin.PA16
,PA17_SPI1 = ALT25 or TNativePin.PA17
,PA18_SPI1 = ALT25 or TNativePin.PA18
,PA19_SPI1 = ALT25 or TNativePin.PA19
,PA20_SPI1 = ALT25 or TNativePin.PA20
,PA21_SPI1 = ALT25 or TNativePin.PA21
,PA22_SPI1 = ALT25 or TNativePin.PA22
,PA23_SPI1 = ALT25 or TNativePin.PA23
,PA24_SPI1 = ALT25 or TNativePin.PA24
,PA25_SPI1 = ALT25 or TNativePin.PA25
,PA26_SPI1 = ALT25 or TNativePin.PA26
,PA27_SPI1 = ALT25 or TNativePin.PA27
,PA28_SPI1 = ALT25 or TNativePin.PA28
{$endif}
);

{$ENDREGION}

const
  DefaultSPIFrequency=8000000;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    One=1,
    Two=2,
    Three=3,
    Four=4,
    Five=5,
    Six=6,
    Seven=7,
    Eight=8,
    Nine=9,
    Ten=10,
    Eleven=11,
    Twelve=12,
    Thirteen=13,
    Fourteen=14,
    Fiveteen=15,
    Sixteen=16
  );

    TSPIRegistersHelper = record helper for TSPI_Registers
  protected
    function FindDividerValue(const Baudrate: longWord) : longWord;
    function GetFrequency: longWord;
    procedure SetFrequency(const Value: longWord);
    function GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const Value: TSPIBitsPerWord);
    function GetMode: TSPIMode;
    procedure SetMode(const Value: TSPIMode);
    //function GetNssMode: TSPINssMode;
    //procedure SetNssMode(const Value : TSPINssMode);
    procedure SetMOSIPin(const Value : TSPIMOSIPins);
    procedure SetMISOPin(const Value : TSPIMISOPins);
    procedure SetSCLKPin(const Value : TSPISCLKPins);
    procedure SetNSSPin( const Value : TSPINSSPins);
  public
    procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;

    { Reads specified number of bytes to buffer and returns actual number of bytes read. }
    function Read(const Buffer: Pointer; const BufferSize: longWord;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;

    { Writes specified number of bytes from buffer and returns actual number of bytes written. }
    function Write(const Buffer: Pointer; const BufferSize: longWord;
                   const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(ReadBuffer Pointer to data buffer where the data will be read from. If this parameter is set to @nil,
        then no reading will be done.)
      @param(WriteBuffer Pointer to data buffer where the data will be written to. If this parameter is set to @nil,
        then no writing will be done.)
      @param(BufferSize The size of read and write buffers in bytes.)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Number of bytes that were actually transferred.) }
    function Transfer(const ReadBuffer, WriteBuffer: Pointer; const BufferSize: longWord;
                      const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Buffer Pointer to data buffer where the data will be read from and at the same time written to,
        overwriting its contents.)
      @param(BufferSize The size of buffer in bytes.)
      @returns(Number of bytes that were actually transferred.) }
    function Transfer(const Buffer: Pointer; const BufferSize: longWord;
                      const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Value  Word sized Data Value that weill get sent over SPI When in 8 Bit Mode then 2 bytes will be transfered)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Word Data that was received. When in 8 Bit Mode then 2 bytes will be combined in 1 word) }
    function TransferWord(const Value : word; const SoftNSSPin : TPinIdentifier = TNativePin.None): word;

    //property NssMode : TSPINssMode  read GetNssMode write SetNssMode;
    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
    property Frequency : longWord read getFrequency write setFrequency;
    property Mode : TSPIMode read getMode write setMode;
    property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
  end;

  {$IF DEFINED(HAS_ARDUINOPINS)}
  var
    SPI : TSPI_Registers absolute SPI0_BASE;
  {$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.LPC8xx.SystemCore;

var
  NSSPins : array[0..1] of longInt;

procedure TSPIRegistersHelper.Initialize;
var
  i,CFG,Divider : longWord;
begin
  case longWord(@Self) of
    SPI0_BASE : begin
                  SysCon.SYSAHBCLKCTRL := SysCon.SYSAHBCLKCTRL or 1 shl 11;
                  SysCon.PRESETCTRL := SysCon.PRESETCTRL or 1 shl 0;
                end;
    {$ifdef has_spi1}
    SPI1_BASE : begin
                  SysCon.SYSAHBCLKCTRL := SysCon.SYSAHBCLKCTRL or 1 shl 12;
                  SysCon.PRESETCTRL := SysCon.PRESETCTRL or 1 shl 1;
                end;
    {$endif}
  end;

  NSSPins[0] := -1;
  NSSPins[1] := -1;
  // Set Defaults, SPI disabled
  self.CFG := 0;

  // Set Defaults
  self.TXCTL:= 0;

  divider := FindDividerValue(DefaultSPIFrequency);
  self.&DIV := Divider;

  // MSTR Always set Master Mode
  CFG := CFG or (1 shl 2);

  // Set correct Polarity and Phase aka as Mode 0-3
  CFG := CFG or (longWord(TSPIMode.Mode0) shl 4);

  self.CFG := CFG;
  self.DLY := 0;
  self.TXCTL := longWord(TSPIBitsPerWord.Eight) shl 24

end;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins); overload;
begin
  Initialize;

  //Set configuration as defined by user

  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode(LongWord(AMOSIPin) shr 8);
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode(LongWord(AMISOPin) shr 8);
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode(LongWord(ASCLKPin) shr 8);
  // Some special handling needed
  setNSSPin(ANSSPin);
end;

function TSPIRegistersHelper.FindDividerValue(const Baudrate: longWord): longWord;
var
  BaseFrequency : longWord;
begin
  Result := SystemCore.GetSystemClockFrequency div Baudrate;
  if Result > 0 then
    Result := Result -1;
  if Result > $ffff then
    Result := $ffff;
end;

function TSPIRegistersHelper.GetFrequency: longWord;
var
  BaseFrequency : longWord;
begin
  Result := SystemCore.GetSystemClockFrequency div (Self.&DIV+1);
end;

procedure TSPIRegistersHelper.SetFrequency(const Value: longWord);
var
  Divider : longWord;
begin
  Divider := FindDividerValue(Value);
  Self.&DIV := Divider;
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord((Self.TXCTL shr 24) and %1111);
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const Value: TSPIBitsPerWord);
begin
  Self.TXCTL := Self.TXCTL and (not (%1111 shl 24)) or (longWord(Value) shl 24);
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode((Self.CFG shr 4) and %11);
end;

procedure TSPIRegistersHelper.SetMode(const Value: TSPIMode);
begin
  Self.CFG := Self.CFG and (not (%11 shl 4)) or (longWord(Value) shl 4);
end;

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
    if longWord(@Self) = SPI0_BASE then
     _NSSPin := NSSPins[0];
    {$ifdef has_spi1};
    if longWord(@Self) = SPI1_BASE then
      _NSSPin := NSSPins[1];
    {$endif}
  end;

  //Take the NSS Pin Low in software Mode (start transfer)
  if _NSSPin < ALT0 then
  begin
    if _NSSPin > TNativePin.None then
      GPIO.PinValue[_NSSPin] := 0;
    // Switch to Software Mode
    self.TXCTL := self.TXCTL and (not (%11111 shl 16));
  end
  else
    //Disable Software Mode by enabling NSS0
    self.TXCTL := self.TXCTL and (not (%1111 shl 16)) or %1 shl 16;


  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  self.CFG := self.CFG or (1 shl 0);

  //wait for TXRDY to go high (no more data to shift out)
  while self.STAT and (1 shl 1) = 0 do
    ;

  //read data from rx buffer if available and discard it
  if self.STAT and (1 shl 0) = 1 then
    Result := self.RXDAT;

  //Put Data into Send Register
  self.TXDAT := Value;

  // TXE Wait until data is completely shifted in
  while self.STAT and (1 shl 8) = 0 do
    ;

  // Now read the result back from Data Register
  Result := self.RXDAT;

  // Take NSS High again in Software Mode (end of Transfer)
  if _NSSPin < ALT0 then
    if (_NSSPin > TNativePin.None) and (_NSSPin < ALT0) then
      GPIO.PinValue[_NSSPin] := 0;

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  self.CFG := self.CFG and (not (1 shl 0));
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
      SPI1_BASE : _NSSPin := NSSPins[1];
      SPI2_BASE : _NSSPin := NSSPins[2];
      SPI3_BASE : _NSSPin := NSSPins[3];
      {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
      {$ifdef has_spi5}SPI5_BASE : _NSSPin := NSSPins[5];{$endif}
      {$ifdef has_spi6}SPI6_BASE : _NSSPin := NSSPins[6];{$endif}
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

procedure TSPIRegistersHelper.SetMOSIPin(const value : TSPIMOSIPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setMISOPin(const value : TSPIMISOPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setSCLKPin(const value : TSPISCLKPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setNSSPin(const value : TSPINSSPins);
begin
  if longInt(Value) >=ALT0 then
    GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f)
  else
    if longInt(Value) >= 0 then
      GPIO.PinMode[longWord(value)] := TPinMode.Output;

  case longWord(@Self) of
      SPI1_BASE : NSSPins[1] := longInt(value);
      SPI2_BASE : NSSPins[2] := longInt(value);
      SPI3_BASE : NSSPins[3] := longInt(value);
      {$ifdef has_spi4}SPI4_BASE : NSSPins[4] := longInt(value);{$endif}
      {$ifdef has_spi5}SPI5_BASE : NSSPins[5] := longInt(value);{$endif}
      {$ifdef has_spi6}SPI6_BASE : NSSPins[6] := longInt(value);{$endif}
  end;
end;

function TSPIRegistersHelper.Read(const Buffer: Pointer; const BufferSize: longWord;
                                  const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;
begin
  Result := Transfer(Buffer, nil, BufferSize, SoftNSSPin);
end;

function TSPIRegistersHelper.Write(const Buffer: Pointer; const BufferSize: longWord;
                                   const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;
begin
  Result := Transfer(nil, Buffer, BufferSize, SoftNSSPin);
end;

function TSPIRegistersHelper.Transfer(const Buffer: Pointer; const BufferSize: longWord;
                                      const SoftNSSPin : TPinIdentifier = TNativePin.None): longWord;
begin
  Result := Transfer(Buffer, Buffer, BufferSize, SoftNSSPin);
end;

end.

