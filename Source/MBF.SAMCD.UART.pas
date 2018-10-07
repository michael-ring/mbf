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
  TUART_Registers = TSercomUsart_Registers;
  TUARTRegistersHelper = record helper for TUART_Registers
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
                       const ATxPin : TUARTTXPins;const ABaudRate:longWord=115200);
    procedure Close;

    function ReadByte(var aReadByte: byte; const Timeout : integer=-1):boolean;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;

    function WriteByte(const aWriteByte: byte; const Timeout : longWord=0) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer= -1; const Timeout : Cardinal=0) : boolean;

    function ReadString(var aReadString: String; const aReadCount: Integer = -1;
      const Timeout: Cardinal = 0): Boolean;
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
  {$if defined(ARDUINOZERO) }DEBUG_UART : TSercomUsart_Registers absolute SERCOM3_BASE;{$endif}

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

function TUARTRegistersHelper.GetBaud(const Value: Cardinal):cardinal;
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

function TUARTRegistersHelper.GetBaud2(const Value: Cardinal):cardinal;
var
  temp1:uint64;
begin
  temp1:=(uint64(Value) shl 20);
  temp1:=(temp1 + (SystemCore.CPUFrequency shr 1)) DIV SystemCore.CPUFrequency;
  result:=65536 - word(temp1);
end;

function TUARTRegistersHelper.GetBaudFrac(const Value: Cardinal):cardinal;
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

function TUARTRegistersHelper.GetBaudFrac2(const Value: Cardinal):cardinal;
var
  baud,fp,mul_ratio:uint64;
begin
  mul_ratio:=(SystemCore.CPUFrequency*1000) DIV (Value*USART_SAMPLE_NUM);
  baud:= (mul_ratio DIV 1000);
  fp:=((mul_ratio - (baud*1000))*8) DIV 1000;
  result:=((baud AND $FFF) OR ((fp AND $7) shl 13));
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

  BAUD:=GetBaud(DefaultUARTBaudrate);

  //Setting the CTRLB register
  CTRLB:=0;
  SetBit(CTRLB,SERCOM_USART_CTRLB_RXEN_Pos); //RX_EN
  SetBit(CTRLB,SERCOM_USART_CTRLB_TXEN_Pos); //TX_EN
end;

procedure TUARTRegistersHelper.Initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins;const ABaudRate:longWord=115200);
var
  aRXPO,aTXPO : longWord;
begin
  Initialize;
  //RX has 4 possible pads
  aRXPO := (longword(ARxPin) shr 16) and %11;
  //TX has only 2 possible Pads (PAD0 and PAD2) and the following Pad (PAD1 and PAD3) is reserved for Clock
  //When PAD0 is used only PAD2 and PAD3 can be used for RX
  //When PAD2 is used only PAD0 and PAD1 can be used for RX
  aTXPO := (longWord(ATxPin) shr 17) and %1;

  //Configure the provided Pins
  //GPIO.PinMode[longWord(ARxPin) and $ff] :=  TPinMode.Input;
  GPIO.PinMux[longWord(ARxPin) and $ff] := TPinMux((longWord(ARxPin) shr 8) and %111);
  //GPIO.PinMode[longWord(ATxPin) and $ff] :=  TPinMode.Output;
  GPIO.PinMux[longWord(ATxPin) and $ff] := TPinMux((longWord(ATxPin) shr 8) and %111);

  CTRLA:=
    CTRLA OR // DWORD
    (SERCOM_USART_CTRLA_RXPO_Msk AND ((aRXPO) shl SERCOM_USART_CTRLA_RXPO_Pos)) OR
    (SERCOM_USART_CTRLA_TXPO_Msk AND ((aTXPO) shl SERCOM_USART_CTRLA_TXPO_Pos));
end;

procedure TUARTRegistersHelper.Close;
begin
  TSercom_Registers(Self).Close;
end;

function TUARTRegistersHelper.GetBaudRate: Cardinal;
begin
  //TODO
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
begin
  //TODO
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  //TODO
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
begin
  //TODO
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  //TODO
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
begin
  //TODO
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  //TODO
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
begin
  //TODO
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  //TODO
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  //TODO
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  //TODO
end;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  //TODO
end;

function TUARTRegistersHelper.WriteByte(const aWriteByte: Byte; const Timeout: Cardinal = 0): Boolean; inline;
begin
  while (NOT DRE_Ready) do begin end;
  DATA:=aWriteByte;
  while (NOT TX_Ready) do begin end;
  result:=true;
end;

function TUARTRegistersHelper.WriteByte(const aWriteBuffer: array of Byte; aWriteCount : integer=-1; const Timeout: Cardinal = 0): Boolean;
var
  i : longWord;
begin
  if aWriteCount = -1 then
    aWriteCount := High(aWriteBuffer)-Low(aWriteBuffer);
  for i := low(aWriteBuffer) to low(aWriteBuffer)+aWriteCount do
    Result := WriteByte(aWriteBuffer[i],Timeout);
end;

function TUARTRegistersHelper.WriteString(const aString: String; const Timeout: Cardinal = 0): Boolean;
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


function TUARTRegistersHelper.ReadByte(var aReadByte: byte; const Timeout : integer=-1):boolean; inline;
begin
  while (NOT RXC_Ready) do begin end;
  //check errors
  //if (sercom->USART.STATUS.bit.PERR || sercom->USART.STATUS.bit.FERR || sercom->USART.STATUS.bit.BUFOVF)
  //		/* Set the error flag */
  aReadByte:=DATA;
  //while (NOT TX_Ready) do begin end;
  result:=true;
end;

function TUARTRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;
begin
  //TODO
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; const aReadCount: Integer = -1;
  const Timeout: Cardinal = 0): Boolean;
begin
  //TODO
end;

function TUARTRegistersHelper.TX_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_TXC_Pos);
end;

function TUARTRegistersHelper.DRE_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_DRE_Pos);
end;

function TUARTRegistersHelper.RXC_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_USART_INTFLAG_RXC_Pos);
end;

end.
