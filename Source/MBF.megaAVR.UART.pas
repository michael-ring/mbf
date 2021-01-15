unit mbf.megaAVR.uart;
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
  MBF.megaAVR.GPIO,
  MBF.megaAVR.SystemCore;

type
  TUART_Registers = record
    UCSRA : byte;
    UCSRB : byte;
    UCSRC : byte;
    Reserved : byte;
    UBRRL : byte;
    UBRRH : byte;
    UDR : byte;
  end;
const
  USART0_BASE = $C0;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut=10000;
type
  TUARTRXPins = (
                                                         PD0_USART0 = TNativePin.PD0
    {$if defined(HAS_ARDUINOPINS)                   },   D0_UART    = TNativePin.PD0  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },   DEBUG_UART = TNativePin.PD0  {$endif}
    );

  TUARTTXPins = (
                                                         PD1_USART0 = TNativePin.PD1
    {$if defined(HAS_ARDUINOPINS)                   },   D1_UART    = TNativePin.PD1  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },   DEBUG_UART = TNativePin.PD1  {$endif}
  );

{$ENDREGION}

  TUARTBitsPerWord = (
    Five = %000,
    Six = %001,
    Seven = %010,
    Eight = %011,
    Nine = %111
  );

  TUARTParity = (
    None = %00,
    Even = %10,
    Odd  = %11
  );

  TUARTStopBits = (
    One=%0,
    Two=%1
  );

  TUARTClockSource = (
    SystemClock = %0
  );

  TUARTMode = (
    AsyncUSART = %00,
    SyncUSART = %01,
    MasterSPI = %11
  );

  TUARTRegistersHelper = record helper for TUART_Registers
  private
    function  GetBaudRate: longWord;
    procedure SetBaudRate(const aBaudrate: longWord);
    function  GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const aBitsPerWord: TUARTBitsPerWord);
    function  GetParity: TUARTParity;
    procedure SetParity(const aParity: TUARTParity);
    function  GetStopBits: TUARTStopBits;
    procedure SetStopBits(const aStopbit: TUARTStopBits);
    procedure SetRxPin(const aRxPin : TUARTRXPins);
    procedure SetTxPin(const aTxPin : TUARTTXPins);
    function  GetClockSource : TUARTClockSource;
    procedure SetClockSource(const aClockSource : TUARTClockSource);


  public
    property BaudRate : longWord read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property ClockSource : TUARTClockSource read getClockSource write setClockSource;

    procedure initialize(const ARxPin : TUARTRXPins;
                         const ATxPin : TUARTTXPins;aBaudRate : longWord = 115200);
    function Disable : boolean;
    procedure Enable;

    procedure WaitForTXReady; inline;
    procedure WaitForRXReady; inline;

    function  WaitForTXReady(EndTime : TMilliSeconds):boolean; inline;
    function  WaitForRXReady(EndTime : TMilliSeconds):boolean; inline;

    procedure WriteDR(const Value : byte); inline;
    function ReadDR:byte; inline;

    {$DEFINE INTERFACE}
    {$I MBF.megaAVR.UART.inc}
    {$UNDEF INTERFACE}
  end;

{$IF DEFINED(HAS_ARDUINOPINS)}
var
  UART : TUART_Registers absolute USART0_BASE;
  DEBUG_UART : TUART_Registers absolute USART0_BASE;
{$ENDIF HAS_ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

function TUARTRegistersHelper.getClockSource : TUARTClockSource;
begin
  //No choice on ATMega x8 family
  Result := TUARTClockSource.SystemClock;
end;

procedure TUARTRegistersHelper.setClockSource(const aClockSource : TUARTClockSource);
begin
  //No choice on ATMega x8 family
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins; aBaudRate : longWord = 115200);
begin
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.UCSRB := 0;
  self.UCSRA := 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.UCSRC := %00000110;

  // RE TE Enable both receiver and sender
  SetBaudRate(DefaultUARTBaudrate);
  setRxPin(ARxPin);
  setTxPin(ATxPin);
  Enable;
end;


procedure TUARTRegistersHelper.SetRxPin(const aRxPin : TUARTRXPins);
begin
  //This code currently does nothing as RX/TX Pins are fixed on ATMEGA328p
end;

procedure TUARTRegistersHelper.SetTxPin(const aTxPin : TUARTTXPins);
begin
  //This code currently does nothing as RX/TX Pins are fixed on ATMEGA328p
end;

function TUARTRegistersHelper.Disable:boolean;
begin
  // By disabling the Transmitter the GPIO Pins will get available for normal use
  // after Transmitter Buffer is empty
  Result := self.UCSRB and %00011000 <> 0;
  clearBit(self.UCSRB,3);
  clearBit(self.UCSRB,4);
  //TODO wait for Send complete if currently sending
end;

procedure TUARTRegistersHelper.Enable;
begin
  // By enabling the Transmitter the GPIO Pins will automagically be switched to the UART.
  setBit(self.UCSRB,3);
  setBit(self.UCSRB,4);
end;

function TUARTRegistersHelper.GetBaudRate: longWord;
var
  ClockFreq : longWord;
begin
  ClockFreq := SystemCore.GetCPUFrequency;
  // In Async Mode we can double the Baudrate with a flag in UCSRA
  if getBitsMasked(self.UCSRC,%11 shl 6,6) = 0 then
  begin
    if getBit(self.UCSRA,1) = 0 then
      ClockFreq := ClockFreq div 16
    else
      ClockFreq := ClockFreq div 8;
  end
  // In Synchronous mode the Divider is only 2
  else
    ClockFreq := ClockFreq div 2;

  Result := ClockFreq div longWord((self.UBRRH * 256) + self.UBRRL + 1);
end;

procedure TUARTRegistersHelper.SetBaudRate(const aBaudrate: longWord);
var
  UBRRData,UBRRData2 : Word;
  Error,Error1,Error2 : integer;
  CPUFrequency : longWord;
  reactivate : boolean;
begin
  // UE disable Serial interface
  reactivate := Disable;
  CPUFrequency := SystemCore.GetCPUFrequency;

  // In Async Mode we can double the Baudrate with a flag in UCSRA
  if getBitsMasked(self.UCSRC,%11 shl 6,6) = 0 then
  begin
    UBRRData :=  (CPUFrequency div (longword(aBaudRate)   shl 4)) - 1;
    UBRRData2 := (CPUFrequency div (longWord(aBaudRate)   shl 3)) - 1;
    Error  := ((CPUFrequency div (longWord(UBRRData+1)  shl 4))*100 div aBaudrate) - 100;
    Error1 := ((CPUFrequency div (longWord(UBRRData+2)  shl 4))*100 div aBaudrate) - 100;
    Error2 := ((CPUFrequency div (longWord(UBRRData2+1) shl 3))*100 div aBaudrate) - 100;
    if Abs(Error1) < Abs(Error) then
    begin
      Error := Error1;
      inc(UBRRData);
    end;
    // If doubling the frequency reduces error by at least 2% then use double frequency
    // Using double frequency makes receiving error correction worse so we use it with caution
    if Abs(Error) - Abs(Error2) > 2 then
    begin
      setBit(self.UCSRA,1);
      UBRRData := UBRRData2;
    end
    else
      clearBit(self.UCSRA,1);

    //For unknown reason the calculated register value for 115200 does not work
    //if (CPUFrequency = 16000000) and (UBRRData = 7) then
    //  UBRRData := 8;
  end
  // In Synchronous mode the Divider is fixed to 2
  else
  begin
    clearBit(self.UCSRA,1);
    UBRRData := (SystemCore.GetCPUFrequency div (longword(aBaudRate*2))) - 1;
  end;

  self.UBRRH := UBRRData shr 8;
  self.UBRRL := UBRRData and %11111111;

  if reactivate = true then
    Enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((getBitsMasked(Self.UCSRC,%11 shl 1,1) or (getBit(Self.UCSRB,2) shl 2)));
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const aBitsPerWord: TUARTBitsPerWord);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitsMasked(Self.UCSRC,byte(aBitsPerword),%11 shl 1,1);
  if aBitsPerWord = TUARTBitsPerWord.Nine then
    setBit(self.UCSRB,2)
  else
    clearBit(self.UCSRB,2);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity(getBitsMasked(self.UCSRC,%11 shl 4,4));
end;

procedure TUARTRegistersHelper.SetParity(const aParity: TUARTParity);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitsMasked(Self.UCSRC,byte(aParity),%11 shl 4,4);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits(getBit(self.UCSRC,3));
end;

procedure TUARTRegistersHelper.SetStopBits(const aStopbit: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitValue(self.UCSRC,byte(aStopBit),3);
  if ReEnable then
    Enable;
end;

procedure TUARTRegistersHelper.WaitForTXReady; inline;
begin
  WaitBitIsSet(self.UCSRA,5);
end;

procedure TUARTRegistersHelper.WaitForRXReady; inline;
begin
  waitBitIsSet(self.UCSRA,7);
end;

function TUARTRegistersHelper.WaitForTXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := WaitBitIsCleared(self.UCSRA,5,EndTime);
end;

function TUARTRegistersHelper.WaitForRXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := waitBitIsSet(self.UCSRA,7,EndTime);
end;

procedure TUARTRegistersHelper.WriteDR(const Value : byte); inline;
begin
  self.UDR := Value;
end;

function TUARTRegistersHelper.ReadDR : byte ; inline;
begin
  Result := self.UDR;
end;

{$DEFINE IMPLEMENTATION}
{$I MBF.megaAVR.UART.inc}
{$UNDEF IMPLEMENTATION}

{$ENDREGION}

end.
