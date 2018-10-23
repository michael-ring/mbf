unit MBF.STM32L4.UART;
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
{< ST Micro L4xx board series functions. }
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32L4.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeout=10000;
type
    TUARTRXPins = (
    {$if defined(has_USART2) and defined(has_gpioa)  }   PA15_USART2 = ALT3 or TNativePin.PA15 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa)  },   PA3_USART2 = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)                },   DEBUG_UART = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)  },  PA10_USART1 = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)                },      D0_UART = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(HAS_ARDUINOPINS)                    },      D0_UART = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(HAS_ARDUINOPINS)                    },   DEBUG_UART = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)  },   PB7_USART1 = ALT7 or TNativePin.PB7  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)  },  PB11_USART3 = ALT7 or TNativePin.PB11 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)  },   PC5_USART3 = ALT7 or TNativePin.PC5  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)  },  PC11_USART3 = ALT7 or TNativePin.PC11 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)  },   PD6_USART2 = ALT7 or TNativePin.PD6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)  },   PD9_USART3 = ALT7 or TNativePin.PD9  {$endif}
    {$if defined(has_USART1) and defined(has_gpiog)  },  PG10_USART1 = ALT7 or TNativePin.PG10 {$endif}
    {$if defined(has_UART4) and defined(has_gpioa)   },   PA1_UART4  = ALT8 or TNativePin.PA1  {$endif}
    {$if defined(has_LPUART1) and defined(has_gpioa) },  PA3_LPUART1 = ALT8 or TNativePin.PA3  {$endif}
    {$if defined(has_LPUART1) and defined(has_gpiob) }, PB10_LPUART1 = ALT8 or TNativePin.PB10 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpioc) },  PC0_LPUART1 = ALT8 or TNativePin.PC0  {$endif}
    {$if defined(has_UART4) and defined(has_gpioc)   },   PC11_UART4 = ALT8 or TNativePin.PC11 {$endif}
    {$if defined(has_UART5) and defined(has_gpiod)   },    PD2_UART5 = ALT8 or TNativePin.PD2  {$endif}
    {$if defined(has_LPUART1) and defined(has_gpiog) },  PG8_LPUART1 = ALT8 or TNativePin.PG8  {$endif}
  );
  TUARTTXPins = (
    {$if defined(has_USART2) and defined(has_gpioa)  }    PA2_USART2 = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)                },   DEBUG_UART = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)  },   PA9_USART1 = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)                },      D1_UART = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(HAS_ARDUINOPINS)                    },      D1_UART = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(HAS_ARDUINOPINS)                    },   DEBUG_UART = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)  },   PB6_USART1 = ALT7 or TNativePin.PB6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)  },  PB10_USART3 = ALT7 or TNativePin.PB10 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)  },   PC4_USART3 = ALT7 or TNativePin.PC4  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)  },  PC10_USART3 = ALT7 or TNativePin.PC10 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)  },   PD5_USART2 = ALT7 or TNativePin.PD5  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)  },   PD8_USART3 = ALT7 or TNativePin.PD8  {$endif}
    {$if defined(has_USART1) and defined(has_gpiog)  },   PG9_USART1 = ALT7 or TNativePin.PG9  {$endif}
    {$if defined(has_UART4) and defined(has_gpioa)   },    PA0_UART4 = ALT8 or TNativePin.PA0  {$endif}
    {$if defined(has_LPUART1) and defined(has_gpioa) },  PA2_LPUART1 = ALT8 or TNativePin.PA2  {$endif}
    {$if defined(has_LPUART1) and defined(has_gpiob) }, PB11_LPUART1 = ALT8 or TNativePin.PB11 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpioc) },  PC1_LPUART1 = ALT8 or TNativePin.PC1  {$endif}
    {$if defined(has_UART4) and defined(has_gpioc)   },   PC10_UART4 = ALT8 or TNativePin.PC10 {$endif}
    {$if defined(has_UART5) and defined(has_gpioc)   },   PC12_UART5 = ALT8 or TNativePin.PC12 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpiog) },  PG7_LPUART1 = ALT8 or TNativePin.PG7  {$endif}
  );
  {$ENDREGION}

  TUARTBitsPerWord = (
    Eight = %00,
    Nine = %01,
    Seven = %10
  );

  TUARTParity = (
    None = %00,
    Even = %10,
    Odd  = %11
  );

  TUARTStopBits = (
    One = %00,
    ZeroDotFive = %01,
    Two = %10,
    OneDotFive = %11
  );

  TUARTClockSource = (
    APB2 = %00,
    SYSCLK = %01,
    HSI = %10,
    LSE = %11
  );

  TUARTRegistersHelper = record helper for TUART_Registers
  private
    function  GetBaudRate: Cardinal;
    procedure SetBaudRate(const Value: Cardinal);
    function  GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const Value: TUARTBitsPerWord);
    function  GetParity: TUARTParity;
    procedure SetParity(const Value: TUARTParity);
    function  GetStopBits: TUARTStopBits;
    procedure SetStopBits(const Value: TUARTStopBits);
    procedure SetRxPin(const Value : TUARTRXPins);
    procedure SetTxPin(const Value : TUARTTXPins);
    procedure SetClockSource(const Value : TUARTClockSource);
    function GetClockSource : TUARTClockSource;
  public
    procedure initialize;
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
    function Disable : boolean;
    procedure Enable;

    function ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: Cardinal=0): Cardinal;
    function WriteBuffer(const aWriteBuffer: Pointer; aWriteCount : integer; TimeOut: Cardinal=0): Cardinal;

    function ReadByte(var aReadByte: byte; const Timeout : Cardinal=0):boolean;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;

    function WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0) : boolean;

    function ReadString(var aReadString: String; aReadCount: Integer = -1;
      const Timeout: Cardinal = 0): Boolean;
    function ReadString(var aReadString: String; const aDelimiter : char;
      const Timeout: Cardinal = 0): Boolean;
    function WriteString(const aWriteString: String; const Timeout: cardinal = 0): Boolean;

    property BaudRate : Cardinal read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property RxPin : TUARTRxPins write setRxPin;
    property TxPin : TUARTTxPins write setTxPin;
    property ClockSource : TUARTClockSource read getClockSource write setClockSource;
  end;

{$IF DEFINED(HAS_ARDUINOMINIPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART1_BASE;
  DEBUG_UART : TUART_Registers absolute USART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}
{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART1_BASE;
  DEBUG_UART : TUART_Registers absolute USART1_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.STM32L4.SystemCore;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  case longWord(@self) of
    USART1_BASE : Result :=  TUARTClockSource((RCC.CCIPR shr 0) and %11);
    USART2_BASE : Result :=  TUARTClockSource((RCC.CCIPR shr 2) and %11);
    {$ifdef has_uart3}Result :=  TUARTClockSource((RCC.CCIPR shr 4) and %11){$endif}
    {$ifdef has_uart4}Result :=  TUARTClockSource((RCC.CCIPR shr 6) and %11);{$endif}
  end;
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  case longWord(@self) of
    USART1_BASE : RCC.CCIPR := RCC.CCIPR and (not %11 shl 0) or (longWord(Value) shl 0);
    USART2_BASE : RCC.CCIPR := RCC.CCIPR and (not %11 shl 2) or (longWord(Value) shl 2);
    {$ifdef has_uart3}RCC.CCIPR := RCC.CCIPR and (not %11 shl 4) or (longWord(Value) shl 4){$endif}
    {$ifdef has_uart4}RCC.CCIPR := RCC.CCIPR and (not %11 shl 6) or (longWord(Value) shl 6){$endif}
  end;
end;

procedure TUARTRegistersHelper.Initialize;
begin
  case longWord(@Self) of
    USART1_BASE : RCC.APB2ENR := RCC.APB2ENR or (1 shl 14);
    USART2_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 17);
    {$ifdef has_uart3}USART3_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 18);{$endif}
    {$ifdef has_uart4}UART4_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 19);{$endif}
    {$ifdef has_lpuart1}LPUART1_BASE : RCC.APB1ENR2 := RCC.APB1ENR2 or (1 shl 0);{$endif}
  end;
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.CR2:= 0;

  // Set Defaults not RTS/CTS
  self.CR3:= 0;

  setClockSource(TUARTClockSource.APB2);

  // RE TE Enable both receiver and sender
  self.CR1 := self.CR1 or (1 shl 2) or (1 shl 3);
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  Initialize;
  SetBaudRate(DefaultUARTBaudrate);
  setRxPin(ARxPin);
  setTxPin(ATxPin);
  Enable;
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

function TUARTRegistersHelper.Disable : boolean;
begin
  //Save the initial state of UART
  result := (CR1 or %1) <> 0;
  CR1 := CR1 and (not %1);
end;

procedure TUARTRegistersHelper.Enable;
begin
  CR1 := CR1 or %1;
end;

function TUARTRegistersHelper.GetBaudRate: Cardinal;
var
  ClockFreq : longWord;
begin
  case GetClockSource of
    TUARTClockSource.APB2 : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
    TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
    TUARTClockSource.HSI : ClockFreq := SystemCore.GetHSIClockFrequency;
    TUARTClockSource.LSE : ClockFreq := XTALRTCFreq;
  end;

  //OVER8
  if self.CR1 and (1 shl 15) = 0 then
  begin
    Result := ClockFreq div self.BRR
  end
  else
  begin
    Result := Self.BRR and %1111 shl 1;
    Result := 2*ClockFreq div ((Self.BRR and not(%1111)) or Result)
  end
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
var
  ClockFreq,Mantissa,Fraction : longWord;
  ReEnable : boolean = false;
begin
    // set Baudrate
    // UE disable Serial interface
    ReEnable := Disable;

    case GetClockSource of
      TUARTClockSource.APB2 : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
      TUARTClockSource.HSI : ClockFreq := HSIClockFrequency;
      TUARTClockSource.LSE : ClockFreq := XTALRTCFreq;
      TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
    end;
    //OVER8
    if self.CR1 and (1 shl 15) = 0 then
      SELF.BRR := ClockFreq div Value
    else
      Self.BRR := ((2*ClockFreq div Value) and not %1111) or (((2*ClockFreq div Value) and %1111) shr 1);
    if ReEnable then
      Enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((((Self.CR1 shr (28)) and %1) shl 1) or ((Self.CR1 shr 12) and %1));
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  Self.CR1 := Self.CR1 and (not ((1 shl 28) or (1 shl 12)) or ((longWord(Value) and %10) shl (28-1))
                       or ((longWord(Value) and %1) shl 12));
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity((Self.CR1 shr 9) and %11);
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  Self.CR1 := Self.CR1 and (not (%11 shl 9)) or (longWord(Value) shl 9);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits((Self.CR2 shr 12) and %11);
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  Self.CR2 := Self.CR2  and (not (%11 shl 12)) or (longWord(Value) shl 12);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: Cardinal=0): longWord;
var
  EndTime : longWord;
begin
  Result := 0;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  while (Result < aReadCount) do
  begin
    while self.ISR and (1 shl 5) = 0 do
    begin
      if SystemCore.GetTickCount > EndTime then
        Exit;
    end;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      PByte(PByte(aReadBuffer) + Result)^ := self.RDR
    else
    begin
      PWord(PByte(aReadBuffer) + Result)^ := self.RDR;
      inc(Result);
    end;
    Inc(Result);
  end;
end;

function TUARTRegistersHelper.WriteBuffer(const aWriteBuffer: Pointer; aWriteCount : Integer; TimeOut: Cardinal=0): Cardinal;
var
  EndTime : longWord;
begin
  Result := 0;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  while Result < aWriteCount do
  begin
    //TXE
    while self.ISR and (1 shl 7) = 0 do
    begin
      if SystemCore.GetTickCount > EndTime then
        Exit;
    end;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      self.TDR := PByte(pByte(aWriteBuffer) + Result)^
    else
    begin
      inc(Result);
      self.TDR := pword(pword(WriteBuffer) + Result)^
    end;
    Inc(Result);
  end;
  repeat
    //Wait for TC (Transmission Complete) Bit Set
    if self.ISR and (1 shl 6) <> 0 then
      exit;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.ReadByte(var aReadByte: byte; const Timeout : Cardinal=0):boolean;
var
  EndTime : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if self.ISR and (1 shl 5) <> 0 then
    begin
      aReadByte := RDR;
      result := true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : integer;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := Low(aReadBuffer);
  repeat
    if self.ISR and (1 shl 5) <> 0 then
    begin
      aReadBuffer[i] := RDR;
      inc(i);
      if i > high(aReadBuffer) then
      begin
        result := true;
        exit;
      end;
    end;
  until (SystemCore.GetTickCount > EndTime);
  //TODO: SetLength does not work
  //if result = false then
    //setLength(aReadBuffer,i-1-Low(aReadBuffer));
end;

function TUARTRegistersHelper.WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0) : boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    //Wait for TXE (Transmit Data Register Empty) to go high
    if self.ISR and (1 shl 7) <> 0 then
    begin
      TDR := aWriteByte;
      result := true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime);
  repeat
    //Wait for TC (Transmission Complete) Bit Set
    if self.ISR and (1 shl 6) <> 0 then
      exit;
  until (SystemCore.GetTickCount > EndTime);
end;


function TUARTRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0) : boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := low(aWriteBuffer);
  begin
    repeat
      //Wait for TXE (Transmit Data Register Empty) to go high
      if self.ISR and (1 shl 7) <> 0 then
      begin
        TDR := aWriteBuffer[i];
        inc(i);
        if i > high(aWriteBuffer) then
        begin
          result := true;
          exit;
        end;
      end;
    until (SystemCore.GetTickCount > EndTime);
    repeat
      //Wait for TC (Transmission Complete) Bit Set
      if self.ISR and (1 shl 6) <> 0 then
        exit;
    until (SystemCore.GetTickCount > EndTime);
  end;
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; aReadCount: integer = -1;
  const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
  i : integer;
begin
  Result := false;
  aReadString := '';
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
  i := 1;
  repeat
    if self.ISR and (1 shl 5) <> 0 then
    begin
      aReadString := aReadString + char(RDR);
      inc(i);
      if i >aReadCount then
      begin
        result := true;
        exit;
      end;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; const aDelimiter: char;
  const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
  charRead : char;
begin
  Result := false;
  aReadString := '';
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if self.ISR and (1 shl 5) <> 0 then
    begin
      charRead := char(RDR);
      aReadString := aReadString + charread;
      if charRead = aDelimiter then
      begin
        result := true;
        exit;
      end;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.WriteString(const aWriteString: String; const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := 1;
  begin
    repeat
      //Wait for TXE (Transmit Data Register Empty) to go high
      if self.ISR and (1 shl 7) <> 0 then
      begin
        TDR := byte(aWriteString[i]);
        inc(i);
        if i > length(aWriteString) then
        begin
          result := true;
          exit;
        end;
      end;
    until (SystemCore.GetTickCount > EndTime);
    repeat
      //Wait for TC (Transmission Complete) Bit Set
      if self.ISR and (1 shl 6) <> 0 then
        exit;
    until (SystemCore.GetTickCount > EndTime);
  end;
end;

{$ENDREGION}

end.
