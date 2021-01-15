unit MBF.SAMCD.UART;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  Copyright (c) 2018 -  Alfred Glänzer

  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}
{< Atmel SAMD series GPIO functions. }

interface

{$include MBF.Config.inc}

uses
  MBF.SAMCD.Helpers,
  MBF.SAMCD.SerCom,
  MBF.SAMCD.GPIO,
  MBF.SAMCD.SystemCore;

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut = 10000;

  //UART includes are complex and automagically created, so include them to keep Sourcecode clean
  {$include MBF.SAMCD.UART.inc}

  TUARTBitsPerWord = (
    Eight = %000,
    Nine  = %001,
    Five  = %101,
    Six   = %110,
    Seven = %111
  );

  TUARTParity = (
    None = %00000,
    Even = %00010,
    Odd  = %00011
  );

  TUARTStopBits = (
    One = %0,
    Two = %1
  );

  TUARTClockSource = (
    GCLK_ID_CORE
    );


type
  TUART_Registers = TSercomUsart_Registers;
  TUARTRegistersHelper = record helper for TUART_Registers
  strict private const
    USART_SAMPLE_NUM=16;
    BAUD_INT_MAX=8192;
    BAUD_FP_MAX=8;
  strict private
    function  GetBaud2(const Value: longWord):longWord;
    function  GetBaudFrac(const Value: longWord):longWord;
    function  GetBaudFrac2(const Value: longWord):longWord;
    function  TX_Ready:boolean;
    function  DRE_Ready:boolean;
    function  RXC_Ready:boolean;

    function  GetBaudRate: longWord;
    procedure SetBaudRate(const Value: longWord);
    function  GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const Value: TUARTBitsPerWord);
    function  GetParity: TUARTParity;
    procedure SetParity(const Value: TUARTParity);
    function  GetStopBits: TUARTStopBits;
    procedure SetStopBits(const Value: TUARTStopBits);
    procedure SetRxPin(const Value : TUARTRXPins);
    procedure SetTxPin(const Value : TUARTTXPins);
    procedure SetClockSource(const Value : TUARTClockSource);
    function  GetClockSource : TUARTClockSource;
  public
    procedure Initialize;
    procedure Initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
    function Disable : boolean;
    procedure Enable;

    function ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: TMilliSeconds=0): longWord;
    function WriteBuffer(const aWriteBuffer: Pointer; aWriteCount : integer; TimeOut: TMilliSeconds=0): longWord;

    function ReadByte(var aReadByte: byte; const TimeOut: TMilliSeconds=0):boolean; inline;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const TimeOut: TMilliSeconds=0):boolean;

    function WriteByte(const aWriteByte: byte; const TimeOut: TMilliSeconds=0) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer= -1; const TimeOut: TMilliSeconds=0) : boolean;

    function ReadString(var aReadString: String; aReadCount: Integer = -1;
      const TimeOut: TMilliSeconds = 0): Boolean;
    function ReadString(var aReadString: String; const aDelimiter : char;
      const TimeOut: TMilliSeconds = 0): Boolean;
    function WriteString(const aWriteString: String; const TimeOut: TMilliSeconds = 0): Boolean;

    property BaudRate : longWord read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord; //write setBitsPerWord; We do currently not allow to set 9Bits
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property RxPin : TUARTRxPins write setRxPin;
    property TxPin : TUARTTxPins write setTxPin;
    property ClockSource : TUARTClockSource read getClockSource write setClockSource;

  end;

var
  {$if defined(has_uart0)}UART0 : TSercomUsart_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(has_uart1)}UART1 : TSercomUsart_Registers absolute SERCOM1_BASE;{$endif}
  {$if defined(has_uart2)}UART2 : TSercomUsart_Registers absolute SERCOM2_BASE;{$endif}
  {$if defined(has_uart3)}UART3 : TSercomUsart_Registers absolute SERCOM3_BASE;{$endif}
  {$if defined(has_uart4)}UART4 : TSercomUsart_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(has_uart5)}UART5 : TSercomUsart_Registers absolute SERCOM5_BASE;{$endif}
  {$if defined(has_uart6)}UART6 : TSercomUsart_Registers absolute SERCOM6_BASE;{$endif}

  {$if defined(SAMC21XPRO)  }UART : TSercomUsart_Registers absolute SERCOM3_BASE;{$endif}
  {$if defined(SAMD10XMINI) }UART : TSercomUsart_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD11XPRO)  }UART : TSercomUsart_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD20XPRO)  }UART : TSercomUsart_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(SAMD21XPRO)  }UART : TSercomUsart_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(ARDUINOZERO) }UART : TSercomUsart_Registers absolute SERCOM0_BASE;{$endif}

  {$if defined(SAMC21XPRO)  }DEBUG_UART : TSercomUsart_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(SAMD10XMINI) }DEBUG_UART : TSercomUsart_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD11XPRO)  }DEBUG_UART : TSercomUsart_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(SAMD20XPRO)  }DEBUG_UART : TSercomUsart_Registers absolute SERCOM3_BASE;{$endif}
  {$if defined(SAMD21XPRO)  }DEBUG_UART : TSercomUsart_Registers absolute SERCOM3_BASE;{$endif}
  {$if defined(ARDUINOZERO) }DEBUG_UART : TSercomUsart_Registers absolute SERCOM5_BASE;{$endif}

implementation

uses
  MBF.BitHelpers;

function TUARTRegistersHelper.GetBaud2(const Value: longWord):longWord;
var
  temp1:uint64;
begin
  temp1:=(uint64(Value) shl 20);
  temp1:=(temp1 + (SystemCore.CPUFrequency shr 1)) DIV SystemCore.CPUFrequency;
  result:=65536 - word(temp1);
end;

function TUARTRegistersHelper.GetBaudFrac(const Value: longWord):longWord;
var
  baud_fp:byte;
  temp1,temp2:uint64;
  baud_int:longWord;
begin
  result:=0;
  baud_fp:=0;
  while (baud_fp<BAUD_FP_MAX) do
  begin
    temp1:=uint64(BAUD_FP_MAX) * uint64(SystemCore.CPUFrequency);
    temp2:=uint64(Value) * uint64(USART_SAMPLE_NUM);
    baud_int:=temp1 DIV temp2;
    baud_int:=baud_int-baud_fp;
    baud_int:=baud_int DIV BAUD_FP_MAX;
    if (baud_int < BAUD_INT_MAX) then break;
    Inc(baud_fp);
  end;
  if (baud_fp=BAUD_FP_MAX) then exit;
  result:=((baud_int AND longword($FFF)) OR ((baud_fp AND byte($7)) shl 13));
end;

function TUARTRegistersHelper.GetBaudFrac2(const Value: longWord):longWord;
var
  baud,fp,mul_ratio:uint64;
begin
  mul_ratio:=(SystemCore.CPUFrequency*1000) DIV (Value*USART_SAMPLE_NUM);
  baud:= (mul_ratio DIV 1000);
  fp:=((mul_ratio - (baud*1000))*8) DIV 1000;
  result:=((baud AND $FFF) OR ((fp AND $7) shl 13));
end;

function TUARTRegistersHelper.TX_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_TXC_Pos)=1;
end;

function TUARTRegistersHelper.DRE_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_DRE_Pos)=1;
end;

function TUARTRegistersHelper.RXC_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos)=1;
end;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  //TODO First allow other Clocks than GCLK0 for UART
  Result := TUARTClockSource.GCLK_ID_CORE;
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  //TODO First allow other Clocks than GCLK0 for UART
end;

procedure TUARTRegistersHelper.Initialize;
begin
  TSercom_Registers(Self).Initialize;
  TSercom_Registers(Self).SetCoreClockSource(GCLK_CLKCTRL_GEN_GCLK0); // use gclk0 at 1Mhz or 48MHz

  //Using 8N1 for setting the CTRLA/CTRLB registers

  //Setting the CTRLA register
  CTRLA:=
    SERCOM_USART_CTRLA_DORD OR // DWORD
    SERCOM_MODE_USART_INT_CLK;

  //Setting the CTRLB register
  CTRLB:=0;
  SetBit(CTRLB,SERCOM_USART_CTRLB_RXEN_Pos); //RX_EN
  SetBit(CTRLB,SERCOM_USART_CTRLB_TXEN_Pos); //TX_EN
end;

procedure TUARTRegistersHelper.Initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
var
  aRXPO,aTXPO : longWord;
begin
  Initialize;
  SetBaudRate(DefaultUARTBaudrate);
  SetRxPin(ARxPin);
  SetTxPin(ATxPin);
  Enable;
end;

procedure TUARTRegistersHelper.Enable;
begin
  TSercom_Registers(Self).Enable;
end;

function TUARTRegistersHelper.Disable : boolean;
begin
  Result :=  TSercom_Registers(Self).Disable;
end;

function TUARTRegistersHelper.GetBaudRate: longWord;
begin
  Result := (uint64(SystemCore.CPUFrequency)*(65536-BAUD)) shr 4 shr 16 //Divide by 16, Divide by 65536
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: longWord);
const
  SHIFT=32;
var
  ratio,scale,temp1:uint64;
  ReEnable : boolean;
begin
  ReEnable := Disable;
  temp1 := ((uint64(USART_SAMPLE_NUM) * uint64(Value)) shl SHIFT);
  ratio := temp1 DIV SystemCore.CPUFrequency;
  scale := (uint64(1) shl SHIFT) - ratio;
  BAUD := ((65536 * scale) shr SHIFT);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord(CTRLB and %111);
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  CTRLB := (CTRLB and (not %111)) or longWord(Value);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  if not odd(CTRLA shr 24) then
    Result := TUARTParity.None
  else
    if not odd(CTRLB shr 13) then
      Result := TUARTParity.Even
    else
      Result := TUARTParity.Odd;
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  CTRLA := (CTRLA and ((not %1111) shl 24)) or ((longWord(Value) shr 1) shl 24);
  CTRLB := CTRLB and (not (%1 shl 13)) or ((longWord(Value) and %1) shl 13);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits((CTRLB shr 6) and %1);
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  CTRLB := CTRLB and (not (%1 shl 6)) or (longWord(Value) shl 6);
  if ReEnable then
    Enable;
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
var
  aRXPO : longWord;
  ReEnable : boolean;
begin
  ReEnable := Disable;
  aRXPO := (longword(Value) shr 16) and %11;
  GPIO.PinMux[longWord(Value) and $ff] := TPinMux((longWord(Value) shr 8) and %111);
  CTRLA:= CTRLA OR (SERCOM_USART_CTRLA_RXPO_Msk AND ((aRXPO) shl SERCOM_USART_CTRLA_RXPO_Pos));
  if ReEnable then
    Enable;
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
var
  aTXPO : longWord;
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  //TX has only 2 possible Pads (PAD0 and PAD2) and the following Pad (PAD1 and PAD3) is reserved for Clock
  //When PAD0 is used only PAD2 and PAD3 can be used for RX
  //When PAD2 is used only PAD0 and PAD1 can be used for RX
  aTXPO := (longWord(Value) shr 17) and %1;

  GPIO.PinMux[longWord(Value) and $ff] := TPinMux((longWord(Value) shr 8) and %111);

  CTRLA:= CTRLA or (SERCOM_USART_CTRLA_TXPO_Msk AND ((aTXPO) shl SERCOM_USART_CTRLA_TXPO_Pos));
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: TMilliSeconds=0): longWord;
var
  EndTime : longWord;
begin
  Result := 0;
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  while (Result < aReadCount) do
  begin
    if GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos) = 0then
    begin
      if SystemCore.GetTickCount > EndTime then
        Exit;
    end;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      PByte(PByte(aReadBuffer) + Result)^ := self.DATA
    else
    begin
      PWord(PByte(aReadBuffer) + Result)^ := self.DATA;
      inc(Result);
    end;
    Inc(Result);
  end;
end;

function TUARTRegistersHelper.WriteBuffer(const aWriteBuffer: Pointer; aWriteCount : Integer; TimeOut: TMilliSeconds=0): longWord;
var
  EndTime : longWord;
begin
  Result := 0;
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  while Result < aWriteCount do
  begin
    //TXE
    while NOT DRE_Ready do
    begin
      if SystemCore.GetTickCount > EndTime then
        Exit;
    end;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      DATA := PByte(pByte(aWriteBuffer) + Result)^
    else
    begin
      inc(Result);
      DATA := pword(pword(WriteBuffer) + Result)^
    end;
    Inc(Result);
    while NOT TX_Ready do
    begin
      if SystemCore.GetTickCount > EndTime then
        Exit;
    end;
  end;
end;

function TUARTRegistersHelper.ReadByte(var aReadByte: byte; const TimeOut: TMilliSeconds = 0):boolean; inline;
var
  EndTime : longWord;
begin
  result := false;
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
  repeat
    if GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos) = 1 then
    begin
      aReadByte := DATA;
      result:=true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime); ;
  //check errors
  //if (sercom->USART.STATUS.bit.PERR || sercom->USART.STATUS.bit.FERR || sercom->USART.STATUS.bit.BUFOVF)
  //		/* Set the error flag */
end;

function TUARTRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const TimeOut: TMilliSeconds=0):boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : integer;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := Low(aReadBuffer);
  repeat
    if GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos) = 1 then
    begin
      aReadBuffer[i] := DATA;
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

function TUARTRegistersHelper.WriteByte(const aWriteByte: byte; const TimeOut: TMilliSeconds=0) : boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if DRE_Ready then
    begin
      DATA := aWriteByte;
      result := true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime);

  repeat
    if TX_Ready then
      exit;
  until  (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const TimeOut: TMilliSeconds=0) : boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := low(aWriteBuffer);
  begin
    repeat
      //Wait for TXE (Transmit Data Register Empty) to go high
      if DRE_Ready then
      begin
        DATA := aWriteBuffer[i];
        inc(i);
        if i > high(aWriteBuffer) then
        begin
          result := true;
          exit;
        end;
      end;
    until (SystemCore.GetTickCount > EndTime);
  end;
  repeat
    if TX_Ready then
      exit;
  until  (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; aReadCount: integer = -1;
  const TimeOut: TMilliSeconds = 0): Boolean;
var
  EndTime : longWord;
  i : integer;
begin
  Result := false;
  aReadString := '';
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
  i := 1;
  repeat
    if GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos) = 1 then
    begin
      aReadString := aReadString + char(DATA);
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
  const TimeOut: TMilliSeconds = 0): Boolean;
var
  EndTime : longWord;
  charRead : char;
begin
  Result := false;
  aReadString := '';
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos) = 1 then
    begin
      charRead := char(DATA);
      aReadString := aReadString + charread;
      if charRead = aDelimiter then
      begin
        result := true;
        exit;
      end;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.WriteString(const aWriteString: String; const TimeOut: TMilliSeconds = 0): Boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if TimeOut = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeOut
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := 1;
  begin
    repeat
      if DRE_Ready then
      begin
        DATA := byte(aWriteString[i]);
        inc(i);
        if i > length(aWriteString) then
        begin
          result := true;
          exit;
        end;
      end;
    until (SystemCore.GetTickCount > EndTime);
  end;
  repeat
    if TX_Ready then
      exit;
  until  (SystemCore.GetTickCount > EndTime);
end;

end.
