unit MBF.LPC8xx.UART;
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
{< ST Micro F4xx board series functions. }
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.LPC8xx.GPIO;

{$REGION PinDefinitions}

{$define has_uart0}
{$define has_uart1}
{$define has_uart2}
{$if defined(lpc810m021fn8) or defined(lpc811m001jdh16) or defined(lpc812m101jd20)}
  {$undefine as_uart2}
{$endif}

const
  DefaultUARTBaudrate=115200;
type
  TUARTRXPins = (
     PA0_UART0 =  ALT1 or TNativePin.PA0
     {$IF DEFINED(HAS_ARDUINOPINS)}
     ,D0_UART   =  ALT1 or TNativePin.PA0
     {$endif}
    ,PA1_UART0 =  ALT1 or TNativePin.PA1
    ,PA2_UART0 =  ALT1 or TNativePin.PA2
    ,PA3_UART0 =  ALT1 or TNativePin.PA3
    ,PA4_UART0 =  ALT1 or TNativePin.PA4
    ,PA5_UART0 =  ALT1 or TNativePin.PA5
    ,PA6_UART0 =  ALT1 or TNativePin.PA6
    ,PA7_UART0 =  ALT1 or TNativePin.PA7
    ,PA8_UART0 =  ALT1 or TNativePin.PA8
    ,PA9_UART0 =  ALT1 or TNativePin.PA9
    ,PA10_UART0 = ALT1 or TNativePin.PA10
    ,PA11_UART0 = ALT1 or TNativePin.PA11
    ,PA12_UART0 = ALT1 or TNativePin.PA12
    ,PA13_UART0 = ALT1 or TNativePin.PA13
    ,PA14_UART0 = ALT1 or TNativePin.PA14
    ,PA15_UART0 = ALT1 or TNativePin.PA15
    ,PA16_UART0 = ALT1 or TNativePin.PA16
    ,PA17_UART0 = ALT1 or TNativePin.PA17
    ,PA18_UART0 = ALT1 or TNativePin.PA18
    ,PA19_UART0 = ALT1 or TNativePin.PA19
    ,PA20_UART0 = ALT1 or TNativePin.PA20
    ,PA21_UART0 = ALT1 or TNativePin.PA21
    ,PA22_UART0 = ALT1 or TNativePin.PA22
    ,PA23_UART0 = ALT1 or TNativePin.PA23
    ,PA24_UART0 = ALT1 or TNativePin.PA24
    ,PA25_UART0 = ALT1 or TNativePin.PA25
    ,PA26_UART0 = ALT1 or TNativePin.PA26
    ,PA27_UART0 = ALT1 or TNativePin.PA27
    ,PA28_UART0 = ALT1 or TNativePin.PA28

    ,PA0_UART1 =  ALT6 or TNativePin.PA0
    ,PA1_UART1 =  ALT6 or TNativePin.PA1
    ,PA2_UART1 =  ALT6 or TNativePin.PA2
    ,PA3_UART1 =  ALT6 or TNativePin.PA3
    ,PA4_UART1 =  ALT6 or TNativePin.PA4
    ,PA5_UART1 =  ALT6 or TNativePin.PA5
    ,PA6_UART1 =  ALT6 or TNativePin.PA6
    ,PA7_UART1 =  ALT6 or TNativePin.PA7
    ,PA8_UART1 =  ALT6 or TNativePin.PA8
    ,PA9_UART1 =  ALT6 or TNativePin.PA9
    ,PA10_UART1 = ALT6 or TNativePin.PA10
    ,PA11_UART1 = ALT6 or TNativePin.PA11
    ,PA12_UART1 = ALT6 or TNativePin.PA12
    ,PA13_UART1 = ALT6 or TNativePin.PA13
    ,PA14_UART1 = ALT6 or TNativePin.PA14
    ,PA15_UART1 = ALT6 or TNativePin.PA15
    ,PA16_UART1 = ALT6 or TNativePin.PA16
    ,PA17_UART1 = ALT6 or TNativePin.PA17
    ,PA18_UART1 = ALT6 or TNativePin.PA18
    ,PA19_UART1 = ALT6 or TNativePin.PA19
    ,PA20_UART1 = ALT6 or TNativePin.PA20
    ,PA21_UART1 = ALT6 or TNativePin.PA21
    ,PA22_UART1 = ALT6 or TNativePin.PA22
    ,PA23_UART1 = ALT6 or TNativePin.PA23
    ,PA24_UART1 = ALT6 or TNativePin.PA24
    ,PA25_UART1 = ALT6 or TNativePin.PA25
    ,PA26_UART1 = ALT6 or TNativePin.PA26
    ,PA27_UART1 = ALT6 or TNativePin.PA27
    ,PA28_UART1 = ALT6 or TNativePin.PA28
{$if defined (has_uart2)}
    ,PA0_UART2 =  ALT11 or TNativePin.PA0
    ,PA1_UART2 =  ALT11 or TNativePin.PA1
    ,PA2_UART2 =  ALT11 or TNativePin.PA2
    ,PA3_UART2 =  ALT11 or TNativePin.PA3
    ,PA4_UART2 =  ALT11 or TNativePin.PA4
    ,PA5_UART2 =  ALT11 or TNativePin.PA5
    ,PA6_UART2 =  ALT11 or TNativePin.PA6
    ,PA7_UART2 =  ALT11 or TNativePin.PA7
    ,PA8_UART2 =  ALT11 or TNativePin.PA8
    ,PA9_UART2 =  ALT11 or TNativePin.PA9
    ,PA10_UART2 = ALT11 or TNativePin.PA10
    ,PA11_UART2 = ALT11 or TNativePin.PA11
    ,PA12_UART2 = ALT11 or TNativePin.PA12
    ,PA13_UART2 = ALT11 or TNativePin.PA13
    ,PA14_UART2 = ALT11 or TNativePin.PA14
    ,PA15_UART2 = ALT11 or TNativePin.PA15
    ,PA16_UART2 = ALT11 or TNativePin.PA16
    ,PA17_UART2 = ALT11 or TNativePin.PA17
    ,PA18_UART2 = ALT11 or TNativePin.PA18
    ,PA19_UART2 = ALT11 or TNativePin.PA19
    ,PA20_UART2 = ALT11 or TNativePin.PA20
    ,PA21_UART2 = ALT11 or TNativePin.PA21
    ,PA22_UART2 = ALT11 or TNativePin.PA22
    ,PA23_UART2 = ALT11 or TNativePin.PA23
    ,PA24_UART2 = ALT11 or TNativePin.PA24
    ,PA25_UART2 = ALT11 or TNativePin.PA25
    ,PA26_UART2 = ALT11 or TNativePin.PA26
    ,PA27_UART2 = ALT11 or TNativePin.PA27
    ,PA28_UART2 = ALT11 or TNativePin.PA28
{$endif}
  );

  TUARTTXPins = (
     PA0_UART0 =  ALT0 or TNativePin.PA0
    ,PA1_UART0 =  ALT0 or TNativePin.PA1
    ,PA2_UART0 =  ALT0 or TNativePin.PA2
    ,PA3_UART0 =  ALT0 or TNativePin.PA3
    ,PA4_UART0 =  ALT0 or TNativePin.PA4
    {$IF DEFINED(HAS_ARDUINOPINS)}
    ,D1_UART   =  ALT0 or TNativePin.PA4
    {$endif}
    ,PA5_UART0 =  ALT0 or TNativePin.PA5
    ,PA6_UART0 =  ALT0 or TNativePin.PA6
    ,PA7_UART0 =  ALT0 or TNativePin.PA7
    ,PA8_UART0 =  ALT0 or TNativePin.PA8
    ,PA9_UART0 =  ALT0 or TNativePin.PA9
    ,PA10_UART0 = ALT0 or TNativePin.PA10
    ,PA11_UART0 = ALT0 or TNativePin.PA11
    ,PA12_UART0 = ALT0 or TNativePin.PA12
    ,PA13_UART0 = ALT0 or TNativePin.PA13
    ,PA14_UART0 = ALT0 or TNativePin.PA14
    ,PA15_UART0 = ALT0 or TNativePin.PA15
    ,PA16_UART0 = ALT0 or TNativePin.PA16
    ,PA17_UART0 = ALT0 or TNativePin.PA17
    ,PA18_UART0 = ALT0 or TNativePin.PA18
    ,PA19_UART0 = ALT0 or TNativePin.PA19
    ,PA20_UART0 = ALT0 or TNativePin.PA20
    ,PA21_UART0 = ALT0 or TNativePin.PA21
    ,PA22_UART0 = ALT0 or TNativePin.PA22
    ,PA23_UART0 = ALT0 or TNativePin.PA23
    ,PA24_UART0 = ALT0 or TNativePin.PA24
    ,PA25_UART0 = ALT0 or TNativePin.PA25
    ,PA26_UART0 = ALT0 or TNativePin.PA26
    ,PA27_UART0 = ALT0 or TNativePin.PA27
    ,PA28_UART0 = ALT0 or TNativePin.PA28

    ,PA0_UART1 =  ALT5 or TNativePin.PA0
    ,PA1_UART1 =  ALT5 or TNativePin.PA1
    ,PA2_UART1 =  ALT5 or TNativePin.PA2
    ,PA3_UART1 =  ALT5 or TNativePin.PA3
    ,PA4_UART1 =  ALT5 or TNativePin.PA4
    ,PA5_UART1 =  ALT5 or TNativePin.PA5
    ,PA6_UART1 =  ALT5 or TNativePin.PA6
    ,PA7_UART1 =  ALT5 or TNativePin.PA7
    ,PA8_UART1 =  ALT5 or TNativePin.PA8
    ,PA9_UART1 =  ALT5 or TNativePin.PA9
    ,PA10_UART1 = ALT5 or TNativePin.PA10
    ,PA11_UART1 = ALT5 or TNativePin.PA11
    ,PA12_UART1 = ALT5 or TNativePin.PA12
    ,PA13_UART1 = ALT5 or TNativePin.PA13
    ,PA14_UART1 = ALT5 or TNativePin.PA14
    ,PA15_UART1 = ALT5 or TNativePin.PA15
    ,PA16_UART1 = ALT5 or TNativePin.PA16
    ,PA17_UART1 = ALT5 or TNativePin.PA17
    ,PA18_UART1 = ALT5 or TNativePin.PA18
    ,PA19_UART1 = ALT5 or TNativePin.PA19
    ,PA20_UART1 = ALT5 or TNativePin.PA20
    ,PA21_UART1 = ALT5 or TNativePin.PA21
    ,PA22_UART1 = ALT5 or TNativePin.PA22
    ,PA23_UART1 = ALT5 or TNativePin.PA23
    ,PA24_UART1 = ALT5 or TNativePin.PA24
    ,PA25_UART1 = ALT5 or TNativePin.PA25
    ,PA26_UART1 = ALT5 or TNativePin.PA26
    ,PA27_UART1 = ALT5 or TNativePin.PA27
    ,PA28_UART1 = ALT5 or TNativePin.PA28
{$if defined (has_uart2)}
    ,PA0_UART2 =  ALT10 or TNativePin.PA0
    ,PA1_UART2 =  ALT10 or TNativePin.PA1
    ,PA2_UART2 =  ALT10 or TNativePin.PA2
    ,PA3_UART2 =  ALT10 or TNativePin.PA3
    ,PA4_UART2 =  ALT10 or TNativePin.PA4
    ,PA5_UART2 =  ALT10 or TNativePin.PA5
    ,PA6_UART2 =  ALT10 or TNativePin.PA6
    ,PA7_UART2 =  ALT10 or TNativePin.PA7
    ,PA8_UART2 =  ALT10 or TNativePin.PA8
    ,PA9_UART2 =  ALT10 or TNativePin.PA9
    ,PA10_UART2 = ALT10 or TNativePin.PA10
    ,PA11_UART2 = ALT10 or TNativePin.PA11
    ,PA12_UART2 = ALT10 or TNativePin.PA12
    ,PA13_UART2 = ALT10 or TNativePin.PA13
    ,PA14_UART2 = ALT10 or TNativePin.PA14
    ,PA15_UART2 = ALT10 or TNativePin.PA15
    ,PA16_UART2 = ALT10 or TNativePin.PA16
    ,PA17_UART2 = ALT10 or TNativePin.PA17
    ,PA18_UART2 = ALT10 or TNativePin.PA18
    ,PA19_UART2 = ALT10 or TNativePin.PA19
    ,PA20_UART2 = ALT10 or TNativePin.PA20
    ,PA21_UART2 = ALT10 or TNativePin.PA21
    ,PA22_UART2 = ALT10 or TNativePin.PA22
    ,PA23_UART2 = ALT10 or TNativePin.PA23
    ,PA24_UART2 = ALT10 or TNativePin.PA24
    ,PA25_UART2 = ALT10 or TNativePin.PA25
    ,PA26_UART2 = ALT10 or TNativePin.PA26
    ,PA27_UART2 = ALT10 or TNativePin.PA27
    ,PA28_UART2 = ALT10 or TNativePin.PA28
{$endif}
  );

{$ENDREGION}

  TUARTBitsPerWord = (
    Seven = %00,
    Eight = %01,
    Nine  = %10
  );

  TUARTParity = (
    None = %00,
    Even = %10,
    Odd  = %11
  );

  TUARTStopBits = (
    One = 0,
    Two = 1
  );

  TUARTRegistersHelper = record helper for TUART_Registers
  private
    //function GetIndex : byte;
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
  public
    procedure initialize;
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
    procedure TearDown;
    procedure Flush;

    { Reads data buffer from UART (serial) port.
      @param(Buffer Pointer to data buffer where the data will be written to.)
      @param(BufferSize Number of bytes to read.)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter is
        set to zero, then the function will block indefinitely, attempting to read until the specified number of
        bytes have been read.)
      @returns(Number of bytes that were actually read.) }
    function ReadBuffer(const Buffer: Pointer; const BufferSize,TimeOut: Cardinal): Cardinal;

    { Writes data buffer to UART (serial) port.
      @param(Buffer Pointer to data buffer where the data will be read from.)
      @param(BufferSize Number of bytes to write.)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
        is set to zero, then the function will block indefinitely, attempting to write until the specified number of
        bytes have been written.)
      @returns(Number of bytes that were actually written.) }
    function WriteBuffer(const Buffer: Pointer; const BufferSize,TimeOut: Cardinal): Cardinal;

    { Attempts to read a byte from UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
      while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
      byte has been read. @True is returned when the operation was successful and @False when the byte could not be
      read. }
    function ReadByte(out Value: Byte; const Timeout: Cardinal = 0): Boolean; inline;

    { Attempts to write a byte to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
      while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
      byte has been written. @True is returned when the operation was successful and @False when the byte could not be
      written. }
    function WriteByte(const Value: Byte; const Timeout: Cardinal = 0): Boolean; inline;

    { Attempts to write multiple bytes to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to
      wait while attempting to do so; if this parameter is set to zero, then the function will block indefinitely,
      attempting to write until the specified bytes have been written. @True is returned when the operation was
      successful and @False when not all bytes could be written. }
    function WriteBytes(const Values: array of Byte; const Timeout: Cardinal = 0): Boolean;

    { Reads string from UART (serial) port.
      @param(Text String that will hold the incoming data.)
      @param(MaxCharacters Maximum number of characters to read. Once this number of characters has been read, the
        function immediately returns, even if there is more data to read. When this parameter is set to zero, then
        the function will continue to read the data, depending on value of @code(Timeout).)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter
        is set to zero, then the function will read only as much data as fits in readable FIFO buffers (or fail when
        such buffers are not supported).)
      @returns(Number of bytes that were actually read.) }
    function ReadString(out Text: StdString; const MaxCharacters: Cardinal = 0;
      const Timeout: Cardinal = 0): Boolean;

    { Writes string to UART (serial) port.
        @param(Text String that should be sent.)
        @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
          is set to zero, then the function will write only what fits in writable FIFO buffers (or fail when such
          buffers are not supported).)
        @returns(Number of bytes that were actually read.) }
    function WriteString(const Text: StdString; const Timeout: Cardinal = 0): Boolean;

    property BaudRate : Cardinal read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property RxPin : TUARTRxPins write setRxPin;
    property TxPin : TUARTTxPins write setTxPin;
  end;

{$IF DEFINED(HAS_ARDUINOPINS)}
var
  UART : TUART_Registers absolute UART0_BASE;
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.LPC8xx.SystemCore;

//type
//  TUARTHandle = pointer;

(*  TUARTConfig = record
    sys_clk_in_hz : longword; // main clock/UARTCLKDIV in Hz
    baudrate_in_hz: longword; // Baudrate in hz
    config : byte;    //bit 1:0
                      // 00: 7 bits length, 01: 8 bits lenght, others: reserved //bit3:2
                      // 00: No Parity, 01: reserved, 10: Even, 11: Odd //bit4
                      // 0: 1 Stop bit, 1: 2 Stop bits
    sync_mod : byte;  //bit0: 0(Async mode), 1(Sync mode)
                      //bit1: 0(Un_RXD is sampled on the falling edge of SCLK)
                      // 1(Un_RXD is sampled on the rising edge of SCLK) //bit2: 0(Start and stop bits are transmitted as in asynchronous mode)
                      // 1(Start and stop bits are not transmitted)
                      //bit3: 0(the UART is a slave on Sync mode)
                      // 1(the UART is a master on Sync mode)
     error_en : word; //Bit0: OverrunEn, bit1: UnderrunEn, bit2: FrameErrEn, // bit3: ParityErrEn, bit4: RxNoiseEn
  end;

  TUARTParam = record
    buffer : pointer;     // The pointer of buffer.
                          // For uart_get_line function, buffer for receiving data.
                          // For uart_put_line function, buffer for transmitting data.
    size : longWord;      // [IN] The size of buffer.
                          // [OUT] The number of bytes transmitted/received.
    transfer_mode : word; // 0x00: For uart_get_line function, transfer without
                          // termination.
                          // For uart_put_line function, transfer without termination.
                          // 0x01: For uart_get_line function, stop transfer when
                          // <CR><LF> are received.
                          // For uart_put_line function, transfer is stopped after
                          // reaching \0. <CR><LF> characters are sent out after that.
                          // 0x02: For uart_get_line function, stop transfer when <LF> // is received.
                          // For uart_put_line function, transfer is stopped after
                          // reaching \0. A <LF> character is sent out after that.
                          // 0x03: For uart_get_line function, RESERVED.
                          // For uart_put_line function, transfer is stopped after // reaching \0.
    driver_mode : word;   // 0x00: Polling mode, function is blocked until transfer is
                          // finished.
                          // 0x01: Intr mode, function exit immediately, callback function // is invoked when transfer is finished.
                          // 0x02: RESERVED
    callback : pointer;   // callback function
  end;

  uart_get_mem_size_proc = function : longWord; cdecl;
  uart_setup_proc = function(const base_addr : pointer; var Ram : array of byte) : TUARTHandle; cdecl;
  uart_init_proc = function(const handle : TUARTHandle; const _set : TUARTConfig) : longWord; cdecl;
  uart_get_char_proc = function(const handle : TUARTHandle) : byte; cdecl;
  uart_put_char_proc = procedure(const handle : TUARTHandle; const Data : byte); cdecl;
  uart_get_line_proc = procedure(const handle : TUARTHandle; var Param : TUARTParam); cdecl;
  uart_put_line_proc = procedure(const handle : TUARTHandle; var Param : TUARTParam); cdecl;
  uart_isr_proc = procedure(const handle : TUARTHandle); cdecl;

  TLPC82xUARTDriver = record
    uart_get_mem_size : uart_get_mem_size_proc;
    uart_setup : uart_setup_proc;
    uart_init : uart_init_proc;
    uart_get_char : uart_get_char_proc;
    uart_put_char : uart_put_char_proc;
    uart_get_line : uart_get_line_proc;
    uart_put_line : uart_put_line_proc;
    uart_isr : uart_isr_proc;
  end;
*)
//type
//  TUARTHelper = record
//    Handle : TUARTHandle;
//    RAM : array[0..20] of byte;
    //Params : TUARTConfig;
//  end;

//var
//  pLPC82xUARTDriver : ^TLPC82xUARTDriver;
//  UARTHelper : array[0..{$if defined (has_uart2)}2{$else}1{$endif}] of TUARTHelper;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  Initialize;
  setRxPin(ARxPin);
  setTxPin(ATxPin);
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  GPIO.UnassignPinOnSwitchMatrix(longWord(Value) and $ff);
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode(longWord(Value) shr 8);
end;

procedure TUARTRegistersHelper.TearDown;
begin
end;

(*function TUARTRegistersHelper.GetIndex : byte ; inline;
begin
  case longWord(@Self) of
    UART0_BASE: Result := 0;
    UART1_BASE: Result := 1;
    {$if defined (has_uart2)}
    UART2_BASE: Result := 2;
    {$endif}
  end;
end;*)

procedure TUARTRegistersHelper.Initialize;
begin
  (*
  pLPC82xUARTDriver := SystemCore.GetUARTDriverPointer;
  if length(TUARTHelper.RAM) < pLPC82xUARTDriver^.uart_get_mem_size() then
    ;
  index := getIndex;
  UARTHelper[index].Handle := pLPC82xUARTDriver^.uart_setup(@Self,UARTHelper[index].Ram);
  UARTHelper[index].Params.sys_clk_in_hz := SystemCore.GetSystemClockFrequency;
  UARTHelper[index].Params.baudrate_in_hz := DefaultUARTBaudrate;
  UARTHelper[index].Params.config := longWord(TUARTBitsPerWord.Eight) or (longWord(TUARTParity.None) shl 2)
                                     or (longWord(TUARTStopBits.One) shl 4);
  pLPC82xUARTDriver^.uart_init(UARTHelper[index].Handle,UARTHelper[index].Params);
  *)
  case longWord(@Self) of
    UART0_BASE: begin
                  SysCon.SYSAHBCLKCTRL := SysCon.SYSAHBCLKCTRL or 1 shl 14;
                  SysCon.PRESETCTRL := SysCon.PRESETCTRL or 1 shl 3;
    end;
    UART1_BASE: begin
                  SysCon.SYSAHBCLKCTRL := SysCon.SYSAHBCLKCTRL or 1 shl 15;
                  SysCon.PRESETCTRL := SysCon.PRESETCTRL or 1 shl 4;
    end;
    {$if defined (has_uart2)}
    UART2_BASE: begin
                  SysCon.SYSAHBCLKCTRL := SysCon.SYSAHBCLKCTRL or 1 shl 16;
                  SysCon.PRESETCTRL := SysCon.PRESETCTRL or 1 shl 5;
    end;
    {$endif}
  end;
  SetBaudrate(DefaultUARTBaudrate);
  Self.STAT := Self.STAT or (1 shl 0);
end;

function TUARTRegistersHelper.GetBaudRate: Cardinal;
begin
  Result := (SystemCore.getMainClockFrequency div SYSCON.UARTCLKDIV) * ((1 shl 10)+(SYSCON.UARTFRGMULT shl 10) div SYSCON.UARTFRGDIV) div (Self.BRG+1) div 16;
  Result := Result shr 10;
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
var
  temp : int64;
begin
  Self.STAT := Self.STAT and (not (1 shl 0));
  // There is only one common clock source for all three uart, so limit max. Baudrate to 460800 to have a good common base
  if SystemCore.getMainClockFrequency >= 921600 shl 4 then
    SYSCON.UARTCLKDIV := SystemCore.getMainClockFrequency div (921600 shl 4)
  else
    SYSCON.UARTCLKDIV := 1;

  Self.BRG := SystemCore.getMainClockFrequency div SYSCON.UARTCLKDIV div (Value shl 4) - 1;

   temp := ((SystemCore.getMainClockFrequency) shl 8 shl 10);
   temp := int64(temp) div int64((Self.BRG+1)*SYSCON.UARTCLKDIV*Value*16);
   temp := temp - 262144;
   SYSCON.UARTFRGDIV := $ff;
   SYSCON.UARTFRGMULT := (temp shr 10) and $ff;
   Self.STAT := Self.STAT or (1 shl 0);
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((Self.CFG shr 2) and %11);
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
begin
  Self.STAT := Self.STAT and (not (1 shl 0));
  Self.CFG := Self.CFG and (not (%11 shl 2)) or (longWord(Value) shl 2);
  Self.STAT := Self.STAT or (1 shl 0);
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity((Self.CFG shr 4) and %11);
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
begin
  Self.STAT := Self.STAT and (not (1 shl 0));
  Self.CFG := Self.CFG and (not (%11 shl 4)) or (longWord(Value) shl 4);
  Self.STAT := Self.STAT or (1 shl 0);
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits((Self.CFG shr 6) and %1);
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
begin
  Self.STAT := Self.STAT and (not (1 shl 0));
  Self.CFG := Self.CFG and (not (%1 shl 6)) or (longWord(Value) shl 6);
  Self.STAT := Self.STAT or (1 shl 0);
end;

procedure TUARTRegistersHelper.Flush;
begin
end;

function TUARTRegistersHelper.ReadBuffer(const Buffer: Pointer; const BufferSize,TimeOut: Cardinal): Cardinal;
var
  StartTime : longWord;
begin
  Result := 0;
  StartTime := SystemCore.GetTickCount;

  while (Result < BufferSize) do
  begin
    while self.STAT and (1 shl 0) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
    end;
    if not (GetBitsPerWord = TUARTBitsPerWord.Nine) then
      PByte(PByte(Buffer) + Result)^ := self.RXDAT
    else
    begin
      PWord(PByte(Buffer) + Result)^ := self.RXDAT;
      inc(Result);
    end;
    Inc(Result);
  end;
end;

function TUARTRegistersHelper.WriteBuffer(const Buffer: Pointer; const BufferSize, TimeOut: Cardinal): Cardinal;
var
  StartTime : longWord;
begin
  Result := 0;
  StartTime := SystemCore.GetTickCount;

  while Result < BufferSize do
  begin
    //TXIDLE
    while self.STAT and (1 shl 3) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
    end;
    if not (GetBitsPerWord = TUARTBitsPerWord.Nine) then
      self.TXDAT := PByte(pByte(Buffer) + Result)^
    else
    begin
      inc(Result);
      self.TXDAT := pword(pword(Buffer) + Result)^
    end;
    Inc(Result);
  end;
  //TXIDLE
  while self.STAT and (1 shl 3) = 0 do
  begin
    if TimeOut <> 0 then
    begin
      if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
        Exit;
    end;
  end;
end;

function TUARTRegistersHelper.ReadByte(out Value: Byte; const Timeout: Cardinal): Boolean;
begin
  Result := ReadBuffer(@Value, SizeOf(Byte), Timeout) = SizeOf(Byte);
end;

function TUARTRegistersHelper.WriteByte(const Value: Byte; const Timeout: Cardinal): Boolean;
begin
  Result := WriteBuffer(@Value, SizeOf(Byte), Timeout) = SizeOf(Byte);
end;

function TUARTRegistersHelper.WriteBytes(const Values: array of Byte; const Timeout: Cardinal): Boolean;
begin
  if Length(Values) > 0 then
    Result := WriteBuffer(@Values[0], Length(Values), Timeout) = Cardinal(Length(Values))
  else
    Result := False;
end;

function TUARTRegistersHelper.ReadString(out Text: StdString; const MaxCharacters: Cardinal = 0;
  const Timeout: Cardinal = 0): Boolean;
begin
  Text := '';
  Result := false;
end;

function TUARTRegistersHelper.WriteString(const Text: StdString; const Timeout: Cardinal = 0): Boolean;
begin
  WriteBuffer(@Text[1],length(Text),TimeOut);
  result := true;
end;

{$ENDREGION}

end.

