unit mbf.stm32f4.i2c;
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
  PXL.TypeDef,
  MBF.STM32F4.GPIO;

{$REGION PinDefinitions}
type
  TI2CSDAPins = (
    //{$if defined(has_FMPI2C1) and defined(has_gpiob) },  PB3_FMPI2C1 = ALT4 or TNativePin.PB3  {$endif}
    {$if defined(has_I2C2) and defined(has_gpiob)
         and defined(STM32F446)}                      PB3_I2C2 = ALT4 or TNativePin.PB3  {$endif}
    {$if defined(has_I2C3) and defined(has_gpiob)
         and defined(STM32F446)                   },  PB4_I2C3 = ALT4 or TNativePin.PB4  {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob) }   PB7_I2C1 = ALT4 or TNativePin.PB7  {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob) },  PB9_I2C1 = ALT4 or TNativePin.PB9  {$endif}
    {$if defined(has_I2C2) and defined(has_gpiob) }, PB11_I2C2 = ALT4 or TNativePin.PB11 {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiob) }, PB14_FMPI2C1 = ALT4 or TNativePin.PB14 {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpioc) },  PC7_FMPI2C1 = ALT4 or TNativePin.PC7  {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpioc) },  PC9_FMPI2C1 = ALT4 or TNativePin.PC9  {$endif}
    {$if defined(has_I2C3) and defined(has_gpioc) },  PC9_I2C3 = ALT4 or TNativePin.PC9  {$endif}
    {$if defined(has_I2C2) and defined(has_gpioc) }, PC12_I2C2 = ALT4 or TNativePin.PC12 {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiod) }, PD13_FMPI2C1 = ALT4 or TNativePin.PD13 {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiod) }, PD15_FMPI2C1 = ALT4 or TNativePin.PD15 {$endif}
    {$if defined(has_I2C2) and defined(has_gpiof) },  PF0_I2C2 = ALT4 or TNativePin.PF0  {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiof) }, PF15_FMPI2C1 = ALT4 or TNativePin.PF15 {$endif}
    {$if defined(has_I2C2) and defined(has_gpioh) },  PH5_I2C2 = ALT4 or TNativePin.PH5  {$endif}
    {$if defined(has_I2C3) and defined(has_gpioh) },  PH8_I2C3 = ALT4 or TNativePin.PH8  {$endif}
    {$if defined(has_I2C2) and defined(has_gpiob)
         and not defined(STM32F446)               },  PB3_I2C2 = ALT9 or TNativePin.PB3  {$endif}
    {$if defined(has_I2C3) and defined(has_gpiob)
         and not defined(STM32F446)               },  PB4_I2C3 = ALT9 or TNativePin.PB4  {$endif}
    {$if defined(has_I2C3) and defined(has_gpiob) },  PB8_I2C3 = ALT9 or TNativePin.PB8  {$endif}
    {$if defined(has_I2C2) and defined(has_gpiob) },  PB9_I2C2 = ALT9 or TNativePin.PB9  {$endif}
  );
  TI2CSCLPins = (
    //{$if defined(has_FMPI2C1) and defined(has_gpioa) },  PA8_FMPI2C1 = ALT4 or TNativePin.PA8  {$endif}
    {$if defined(has_I2C3) and defined(has_gpioa) }   PA8_I2C3 = ALT4 or TNativePin.PA8  {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob) },  PB6_I2C1 = ALT4 or TNativePin.PB6  {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob) },  PB8_I2C1 = ALT4 or TNativePin.PB8  {$endif}
    {$if defined(has_I2C2) and defined(has_gpiob) }, PB10_I2C2 = ALT4 or TNativePin.PB10 {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiob) }, PB15_FMPI2C1 = ALT4 or TNativePin.PB15 {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpioc) },  PC6_FMPI2C1 = ALT4 or TNativePin.PC6  {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiod) }, PD12_FMPI2C1 = ALT4 or TNativePin.PD12 {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiod) }, PD14_FMPI2C1 = ALT4 or TNativePin.PD14 {$endif}
    {$if defined(has_I2C2) and defined(has_gpiof) },  PF1_I2C2 = ALT4 or TNativePin.PF1  {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiof) }, PF14_FMPI2C1 = ALT4 or TNativePin.PF14 {$endif}
    {$if defined(has_I2C2) and defined(has_gpioh) },  PH4_I2C2 = ALT4 or TNativePin.PH4  {$endif}
    {$if defined(has_I2C3) and defined(has_gpioh) },  PH7_I2C3 = ALT4 or TNativePin.PH7  {$endif}
    //{$if defined(has_FMPI2C1) and defined(has_gpiob) }, PB10_FMPI2C1 = ALT9 or TNativePin.PB10 {$endif}
  );
  {$ENDREGION}

const
  DefaultI2CFrequency=400000;

type
  I2CMode = (Slave=0, Master=1);

  I2CAddressSize = (SevenBits=0, TenBits=1);

type
  { Abstract I2C (Inter-Integrated Circuit) communication manager. }
  TI2CRegistersHelper = record helper for TI2C_Registers
  private
    function FindDividerValue(const Baudrate: Cardinal) : Cardinal;
    function GetFrequency: Cardinal;
    procedure SetFrequency(const Value: Cardinal);
    procedure SetSDAPin(const Value : TI2CSDAPins);
    procedure SetSCLPin(const Value : TI2CSCLPins);
    procedure TransferConfig(DevAddress: word; Size: byte; Mode, Request: longword);
  public
    procedure Initialize;
    procedure Initialize(const ASDAPin : TI2CSDAPins;
                         const ASCLPin  : TI2CSCLPins); overload;
    { Specifies new device address to which the communication will be made. }
    procedure SetAddress(const Address: Cardinal);

    { Reads a single byte from current address. Returns @True when the operation was successful and @False otherwise. }
    function ReadByte(out Value: Byte): Boolean;

    { Write a single byte to current address. Returns @True when the operation was successful and @False otherwise. }
    function WriteByte(const Value: Byte): Boolean;

    { Write one or more bytes to current address. Returns @True when the operation was successful and @False otherwise. }
    function WriteBytes(const Values: array of Byte): Boolean;

    { Writes command to current address and reads a single byte from it. Although this varies depending on
      implementation, but typically stop bit is given at the end of the whole transmission (so there is no stop bit
      between command and read operation). Returns @True when the operation was successful and @False otherwise. }
    function ReadByteData(const Command: Byte; out Value: Byte): Boolean;

    { Writes command and a single byte of data to current address. Returns @True when the operation was successful and
      @False otherwise. }
    function WriteByteData(const Command, Value: Byte): Boolean;

    { Writes command to current address and reads a word (16-bit unsigned) from it. Although this varies depending on
      implementation, but typically stop bit is given at the end of the whole transmission (so there is no stop bit
      between command and read operation). Returns @True when the operation was successful and @False otherwise. }
    function ReadWordData(const Command: Byte; out Value: Word): Boolean;

    { Writes command and a word (16-bit unsigned) of data to current address. Returns @True when the operation was
      successful and @False otherwise. }
    function WriteWordData(const Command: Byte; const Value: Word): Boolean;

    { Writes command to current address and reads specified block of data from it. Although this varies depending on
      implementation, but typically stop bit is given at the end of the whole transmission (so there is no stop bit
      between command and read operation). Returns @True when the operation was successful and @False otherwise. }
    function ReadBlockData(const Command: Byte; const Buffer: Pointer;
      const BufferSize: Cardinal): Cardinal;

    { Writes command and specified block of data to current address. Returns @True when the operation was
      successful and @False otherwise. }
    function WriteBlockData(const Command: Byte; const Buffer: Pointer;
      const BufferSize: Cardinal): Cardinal;
    { Abstract communication manager can be used for reading and writing data. }

    { Reads specified number of bytes to buffer and returns actual number of bytes read. }
    function Read(const Buffer: Pointer; const BufferSize: Cardinal): Cardinal;

    { Writes specified number of bytes from buffer and returns actual number of bytes written. }
    function Write(const Buffer: Pointer; const BufferSize: Cardinal): Cardinal;

    property SDAPin : TI2CSDAPins write setSDAPin;
    property SCLPin : TI2CSCLPins write setSCLPin;
    property Frequency : Cardinal read getFrequency write setFrequency;
  end;

{$IF DEFINED(HAS_ARDUINOPINS)}
var
  I2C : TI2C_Registers absolute I2C1_BASE;
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.STM32F4.SystemCore;

function TI2CRegistersHelper.GetFrequency: Cardinal;
begin

end;

procedure TI2CRegistersHelper.SetFrequency(const Value: Cardinal);
type
  TI2CDutyCycle = (two=0,sixteentonine=1);
var
  DutyCycle : TI2CDutyCycle;
  SPEED,PCLK,I2C_SPEED_FAST,freqrange : longWord;
begin
  // Calculate frequency range */
  PCLK := SystemCore.GetAPB1PeripheralClockFrequency;
  SPEED := Value;
  DutyCycle := TI2CDutyCycle.Two;
  freqrange := SystemCore.GetAPB1PeripheralClockFrequency div 1000000;

  //---------------------------- I2Cx CR2 Configuration ----------------------*/
  // Configure I2Cx: Frequency range */
  Self.CR2 := freqrange;

  //---------------------------- I2Cx TRISE Configuration --------------------*/
  // Configure I2Cx: Rise Time */
  if SPEED <= 100000 then
    Self.Trise := freqrange + 1
  else
    Self.Trise := ((freqrange * 300) div 1000) + 1;

  //---------------------------- I2Cx CCR Configuration ----------------------*/
  // Configure I2Cx: Speed */
  if Value <= 100000 then
  begin
    if (((PCLK div SPEED) shl 1) and %111111111111) < 4 then
      Self.CCR := 4
    else
      Self.CCR := (PCLK div (SPEED shl 1))
  end
  else
  begin
    if DUTYCYCLE = TI2CDutyCycle.Two then
      I2C_SPEED_FAST := PCLK div (SPEED * 3)
    else
      I2C_SPEED_FAST := ((PCLK div (SPEED * 25)) or (1 shl 14));
    if I2C_SPEED_FAST and %111111111111 = 0 then
      Self.CCR := 1
    else
      Self.CCR := I2C_SPEED_FAST or (1 shl 15);
  end;
end;

procedure TI2CRegistersHelper.SetSDAPin(const Value : TI2CSDAPins);
begin

end;

procedure TI2CRegistersHelper.SetSCLPin(const Value : TI2CSCLPins);
begin

end;

procedure TI2CRegistersHelper.Initialize;
begin
  case longWord(@Self) of
    {$if defined(has_I2C1)}I2C1_BASE:  RCC.APB1ENR := RCC.APB1ENR or (1 shl 21);{$endif}
    {$if defined(has_I2C2)}I2C2_BASE:  RCC.APB1ENR := RCC.APB1ENR or (1 shl 22);{$endif}
    {$if defined(has_I2C3)}I2C3_BASE:  RCC.APB1ENR := RCC.APB1ENR or (1 shl 30);{$endif}
  end;

  // Disable the selected I2C peripheral
  Self.CR1  := Self.CR1 and not(1 shl 0);

  //---------------------------- I2Cx CR1 Configuration ----------------------*/
  // Configure I2Cx: Generalcall and NoStretch mode */
  Self.CR1 := 0;

  //---------------------------- I2Cx OAR1 Configuration ---------------------*/
  // Configure I2Cx: Own Address1 and addressing mode */
  Self.OAR1 := 0;

  //---------------------------- I2Cx OAR2 Configuration ---------------------*/
  // Configure I2Cx: Dual mode and Own Address2 */
  Self.OAR2 := 0;

  //---------------------------- I2Cx CR1 Configuration ----------------------*/
  Self.CR2 := (1 shl 25) or (1 shl 15);     //Enable AutoEnd and NACK

  // Enable the selected I2C peripheral */
  Self.CR1 := Self.CR1 or (1 shl 0);
end;

procedure TI2CRegistersHelper.Initialize(const ASDAPin : TI2CSDAPins;
                     const ASCLPin  : TI2CSCLPins); overload;
begin
  Initialize;
end;

procedure TI2CRegistersHelper.SetAddress(const Address: Cardinal);
begin

end;

procedure TI2CRegistersHelper.TransferConfig(DevAddress: word; Size: byte; Mode, Request: longword);
var
  tmpreg: longword;
begin
  (* Get the CR2 register value *)
  tmpreg := self.CR2;

  (* clear tmpreg specific bits *)
  tmpreg := tmpreg and (not ((I2C_CR2_SADD or I2C_CR2_NBYTES or I2C_CR2_RELOAD or I2C_CR2_AUTOEND or I2C_CR2_RD_WRN or I2C_CR2_START or I2C_CR2_STOP)));

  (* update tmpreg *)
  tmpreg := tmpreg or (longword(DevAddress and I2C_CR2_SADD) or longword((Size shl 16) and I2C_CR2_NBYTES) or Mode or Request);

  (* update CR2 register *)
  self.CR2 := tmpreg;
end;

function TI2CRegistersHelper.ReadBlockData(const Command: Byte; const Buffer: Pointer;
  const BufferSize: Cardinal): Cardinal;
begin

end;

function TI2CRegistersHelper.WriteBlockData(const Command: Byte; const Buffer: Pointer;
  const BufferSize: Cardinal): Cardinal;
var
  sizetmp: longword;
begin
  sizetmp := 0;

  (* Send Slave Address *)
  (* Set NBYTES to write and reload if size > 255 and generate RESTART *)
  (* Size > 255, need to set RELOAD bit *)
  if (BufferSize > 255) then
  begin
    I2C_TransferConfig(hi2c, DevAddress, 255, I2C_RELOAD_MODE, I2C_GENERATE_START_WRITE);
    sizetmp := 255;
  end
  else
  begin
    I2C_TransferConfig(hi2c, DevAddress, BufferSize, I2C_AUTOEND_MODE, I2C_GENERATE_START_WRITE);
    sizetmp := BufferSize;
  end;

  repeat
    (* Wait until TXIS flag is set *)
    if (I2C_WaitOnTXISFlagUntilTimeout(hi2c, Timeout) <> HAL_OK) then
    begin
      if (hi2c.ErrorCode = HAL_I2C_ERROR_AF) then
      begin
        exit(HAL_ERROR);
      end
      else
      begin
        exit(HAL_TIMEOUT);
      end;
    end;
    (* Write data to TXDR *)
    hi2c.Instance^.TXDR := pData^;
    Inc(pdata);
    Dec(sizetmp);
    Dec(Size);

    if ((sizetmp = 0) and (Size <> 0)) then
    begin
      (* Wait until TXE flag is set *)
      if (I2C_WaitOnFlagUntilTimeout(hi2c, I2C_FLAG_TCR, False, Timeout) <> HAL_OK) then
      begin
        exit(HAL_TIMEOUT);
      end;

      if (Size > 255) then
      begin
        I2C_TransferConfig(hi2c, DevAddress, 255, I2C_RELOAD_MODE, I2C_NO_STARTSTOP);
        sizetmp := 255;
      end
      else
      begin
        I2C_TransferConfig(hi2c, DevAddress, Size, I2C_AUTOEND_MODE, I2C_NO_STARTSTOP);
        sizetmp := Size;
      end;
    end;
  until (Size <= 0);

  (* No need to Check TC flag, with AUTOEND mode the stop is automatically generated *)
  (* Wait until STOPF flag is set *)
  if (I2C_WaitOnSTOPFlagUntilTimeout(hi2c, Timeout) <> HAL_OK) then
  begin
    if (hi2c.ErrorCode = HAL_I2C_ERROR_AF) then
    begin
      exit(HAL_ERROR);
    end
    else
    begin
      exit(HAL_TIMEOUT);
    end;
  end;

  (* Clear STOP Flag *)
  __HAL_I2C_CLEAR_FLAG(hi2c, I2C_FLAG_STOPF);

  (* Clear Configuration Register 2 *)
  I2C_RESET_CR2(hi2c);

  hi2c.State := HAL_I2C_STATE_READY;

  (* Process Unlocked *)
  __HAL_UNLOCK(hi2c.Lock);

  exit(HAL_OK);
end;

function TI2CRegistersHelper.Read(const Buffer: Pointer; const BufferSize: Cardinal): Cardinal;
begin

end;

function TI2CRegistersHelper.Write(const Buffer: Pointer; const BufferSize: Cardinal): Cardinal;
begin

end;

function TI2CRegistersHelper.ReadByte(out Value: Byte): Boolean;
begin
  Result := Read(@Value, SizeOf(Byte)) = SizeOf(Byte);
end;

function TI2CRegistersHelper.WriteByte(const Value: Byte): Boolean;
begin
  Result := Write(@Value, SizeOf(Byte)) = SizeOf(Byte);
end;

function TI2CRegistersHelper.WriteBytes(const Values: array of Byte): Boolean;
begin
  if Length(Values) > 0 then
    Result := Write(@Values[0], Length(Values)) = Cardinal(Length(Values))
  else
    Result := False;
end;

function TI2CRegistersHelper.ReadByteData(const Command: Byte; out Value: Byte): Boolean;
begin
  Result := ReadBlockData(Command, @Value, SizeOf(Byte)) = SizeOf(Byte);
end;

function TI2CRegistersHelper.WriteByteData(const Command, Value: Byte): Boolean;
begin
  Result := WriteBlockData(Command, @Value, SizeOf(Byte)) = SizeOf(Byte);
end;

function TI2CRegistersHelper.ReadWordData(const Command: Byte; out Value: Word): Boolean;
begin
  Result := ReadBlockData(Command, @Value, SizeOf(Word)) = SizeOf(Word);
end;

function TI2CRegistersHelper.WriteWordData(const Command: Byte; const Value: Word): Boolean;
begin
  Result := WriteBlockData(Command, @Value, SizeOf(Word)) = SizeOf(Word);
end;
end.

