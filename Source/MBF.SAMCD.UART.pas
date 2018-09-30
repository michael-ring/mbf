unit MBF.SAMCD.UART;
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
{< Atmel SAMD series GPIO functions. }

interface

{$include MBF.Config.inc}

uses
  MBF.SAMCD.Helpers,
  MBF.SAMCD.SerCom,
  MBF.SAMCD.GPIO;

const
  DefaultUARTBaudrate=115200;

  //UART includes are complex and automagically created, so include them to keep Sourcecode clean
  {$include MBF.SAMCD.UART.inc}

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
    APB1orAPB2 = %00,
    SYSCLK = %01,
    LSE = %10,
    HSI = %11
  );


type
  TUART_Registers = record helper for TSercomUsart_Registers
  strict private const
    USART_SAMPLE_NUM=16;
    BAUD_INT_MAX=8192;
    BAUD_FP_MAX=8;
  strict private
    function  GetBaud(const Value: Cardinal):cardinal;
    function  GetBaud2(const Value: Cardinal):cardinal;
    function  GetBaudFrac(const Value: Cardinal):cardinal;
    function  GetBaudFrac2(const Value: Cardinal):cardinal;
    function  TX_Ready:boolean;
    function  DRE_Ready:boolean;
    function  RXC_Ready:boolean;
    function GetBaudRate: Cardinal;
    procedure SetBaudRate(const Value: Cardinal);
    function GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const Value: TUARTBitsPerWord);
    function GetParity: TUARTParity;
    procedure SetParity(const Value: TUARTParity);
    function GetStopBits: TUARTStopBits;
    procedure SetStopBits(const Value: TUARTStopBits);
    procedure SetRxPin(const Value : TUARTRXPins);
    procedure SetTxPin(const Value : TUARTTXPins);
    procedure SetClockSource(const Value : TUARTClockSource);
    function GetClockSource : TUARTClockSource;

  public
    procedure Initialize;
    procedure Initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins;const ABitRate:longWord=115200);
    procedure Close;

    { Attempts to write a byte to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
      while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
      byte has been written. @True is returned when the operation was successful and @False when the byte could not be
      written. }
    function WriteByte(const aByte: Byte; const Timeout: Cardinal = 0): Boolean; inline;

    { Attempts to read a byte from UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
      while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
      byte has been read. @True is returned when the operation was successful and @False when the byte could not be
      read. }
    function ReadByte(out aByte: Byte; const Timeout: Cardinal = 0): Boolean; inline;

    { Attempts to write multiple bytes to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to
      wait while attempting to do so; if this parameter is set to zero, then the function will block indefinitely,
      attempting to write until the specified bytes have been written. @True is returned when the operation was
      successful and @False when not all bytes could be written. }
    function WriteBytes(const aBytes: array of Byte; const Timeout: Cardinal = 0): Boolean;

    { Reads string from UART (serial) port.
      @param(aString String that will hold the incoming data.)
      @param(MaxCharacters Maximum number of characters to read. Once this number of characters has been read, the
        function immediately returns, even if there is more data to read. When this parameter is set to zero, then
        the function will continue to read the data, depending on value of @code(Timeout).)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter
        is set to zero, then the function will read only as much data as fits in readable FIFO buffers (or fail when
        such buffers are not supported).)
      @returns(Number of bytes that were actually read.) }
    function ReadString(out aString: String; const MaxCharacters: Cardinal = 0;
      const Timeout: Cardinal = 0): Boolean;

    { Writes string to UART (serial) port.
        @param(Text String that should be sent.)
        @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
          is set to zero, then the function will write only what fits in writable FIFO buffers (or fail when such
          buffers are not supported).)
        @returns(Number of bytes that were actually read.) }
    function WriteString(const aString: String; const Timeout: Cardinal = 0): Boolean;

    property BaudRate : Cardinal read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
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
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) }UART : TSercomUsart_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) }DEBUG_UART : TSercomUsart_Registers absolute SERCOM3_BASE;{$endif}

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

function TUART_Registers.GetBaud(const Value: Cardinal):cardinal;
const
  SHIFT=32;
var
  ratio,scale,temp1:uint64;
begin
  temp1 := ((uint64(USART_SAMPLE_NUM) * uint64(Value)) shl SHIFT);
  ratio := temp1 DIV SystemCore.CPUFrequency;
  scale := (uint64(1) shl SHIFT) - ratio;
  result := ((65536 * scale) shr SHIFT);
end;

function TUART_Registers.GetBaud2(const Value: Cardinal):cardinal;
var
  temp1:uint64;
begin
  temp1:=(uint64(Value) shl 20);
  temp1:=(temp1 + (SystemCore.CPUFrequency shr 1)) DIV SystemCore.CPUFrequency;
  result:=65536 - word(temp1);
end;

function TUART_Registers.GetBaudFrac(const Value: Cardinal):cardinal;
var
  baud_fp:byte;
  temp1,temp2:uint64;
  baud_int:cardinal;
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

function TUART_Registers.GetBaudFrac2(const Value: Cardinal):cardinal;
var
  baud,fp,mul_ratio:uint64;
begin
  mul_ratio:=(SystemCore.CPUFrequency*1000) DIV (Value*USART_SAMPLE_NUM);
  baud:= (mul_ratio DIV 1000);
  fp:=((mul_ratio - (baud*1000))*8) DIV 1000;
  result:=((baud AND $FFF) OR ((fp AND $7) shl 13));
end;

procedure TUART_Registers.Initialize;
begin
  //TODO
end;

procedure TUART_Registers.Initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins;const ABitRate:longWord=115200);
var
  aRXPO,aTXPO : longWord;
begin
  TSercom_Registers(Self).Initialize;
  TSercom_Registers(Self).SetCoreClockSource(GCLK_CLKCTRL_GEN_GCLK0); // use gclk0 at 1Mhz or 48MHz
  //RX has 4 possible pads
  aRXPO := (longword(ARxPin) shr 16) and %11;
  //TX has only 2 possible Pads (PAD1 and PAD3)
  aTXPO := (longWord(ATxPin) shr 17) and %1;

  //Configure the provided Pins
  //GPIO.PinMode[longWord(ARxPin) and $ff] :=  TPinMode.Input;
  GPIO.PinMux[longWord(ARxPin) and $ff] := TPinMux((longWord(ARxPin) shr 8) and %111);
  //GPIO.PinMode[longWord(ATxPin) and $ff] :=  TPinMode.Output;
  GPIO.PinMux[longWord(ATxPin) and $ff] := TPinMux((longWord(ATxPin) shr 8) and %111);

  //Using 8N1 for setting the CTRLA/CTRLB registers

  //Setting the CTRLA register
  CTRLA:=
    SERCOM_USART_CTRLA_DORD OR // DWORD
    (SERCOM_USART_CTRLA_RXPO_Msk AND ((aRXPO) shl SERCOM_USART_CTRLA_RXPO_Pos)) OR
    (SERCOM_USART_CTRLA_TXPO_Msk AND ((aTXPO) shl SERCOM_USART_CTRLA_TXPO_Pos)) OR
    (SERCOM_USART_CTRLA_SAMPR_Msk AND ((0) shl SERCOM_USART_CTRLA_SAMPR_Pos)) OR
    SERCOM_MODE_USART_INT_CLK;
  TSercom_Registers(Self).SyncWait;

  BAUD:=GetBaud(AbitRate);
  TSercom_Registers(Self).SyncWait;

  //Setting the CTRLB register
  CTRLB:=0;
  TSercom_Registers(Self).SyncWait;

  SetBit(CTRLB,SERCOM_USART_CTRLB_RXEN_Pos); //RX_EN
  TSercom_Registers(Self).SyncWait;
  SetBit(CTRLB,SERCOM_USART_CTRLB_TXEN_Pos); //TX_EN
  TSercom_Registers(Self).SyncWait;

  SetBit(CTRLA,SERCOM_ENABLE_Pos);//UART_EN
  TSercom_Registers(Self).SyncWait;
end;

procedure TUART_Registers.Close;
begin
  TSercom_Registers(Self).Close;
end;

function TUART_Registers.GetBaudRate: Cardinal;
begin
  //TODO
end;

procedure TUART_Registers.SetBaudRate(const Value: Cardinal);
begin
  //TODO
end;

function TUART_Registers.GetBitsPerWord: TUARTBitsPerWord;
begin
  //TODO
end;

procedure TUART_Registers.SetBitsPerWord(const Value: TUARTBitsPerWord);
begin
  //TODO
end;

function TUART_Registers.GetParity: TUARTParity;
begin
  //TODO
end;

procedure TUART_Registers.SetParity(const Value: TUARTParity);
begin
  //TODO
end;

function TUART_Registers.GetStopBits: TUARTStopBits;
begin
  //TODO
end;

procedure TUART_Registers.SetStopBits(const Value: TUARTStopBits);
begin
  //TODO
end;

procedure TUART_Registers.SetRxPin(const Value : TUARTRXPins);
begin
  //TODO
end;

procedure TUART_Registers.SetTxPin(const Value : TUARTTXPins);
begin
  //TODO
end;

procedure TUART_Registers.SetClockSource(const Value : TUARTClockSource);
begin
  //TODO
end;

function TUART_Registers.GetClockSource : TUARTClockSource;
begin
  //TODO
end;

function TUART_Registers.WriteByte(const aByte: Byte; const Timeout: Cardinal = 0): Boolean; inline;
begin
  while (NOT DRE_Ready) do begin end;
  DATA:=aByte;
  while (NOT TX_Ready) do begin end;
  result:=true;
end;

function TUART_Registers.WriteBytes(const aBytes: array of Byte; const Timeout: Cardinal = 0): Boolean;
var
  i : longWord;
begin
  for i := low(aBytes) to high(aBytes) do
    Result := WriteByte(aBytes[i],Timeout);
end;

function TUART_Registers.WriteString(const aString: String; const Timeout: Cardinal = 0): Boolean;
var
  i:byte;
begin
  result:=false;
  for i:=1 to Length(aString) do
  begin
    if (NOT WriteByte(Ord(aString[i]))) then exit;
  end;
  result:=true;
end;


function TUART_Registers.ReadByte(out aByte: Byte; const Timeout: Cardinal = 0): Boolean; inline;
begin
  while (NOT RXC_Ready) do begin end;
  //check errors
  //if (sercom->USART.STATUS.bit.PERR || sercom->USART.STATUS.bit.FERR || sercom->USART.STATUS.bit.BUFOVF)
  //		/* Set the error flag */
  aByte:=DATA;
  //while (NOT TX_Ready) do begin end;
  result:=true;
end;

function TUART_Registers.ReadString(out aString: String; const MaxCharacters: Cardinal = 0;
      const Timeout: Cardinal = 0): Boolean;
begin
  //TODO
end;

function TUART_Registers.TX_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_TXC_Pos);
end;

function TUART_Registers.DRE_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_DRE_Pos);
end;

function TUART_Registers.RXC_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos);
end;

end.
