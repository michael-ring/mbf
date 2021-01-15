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

{$REGION PinDefinitions}

type
  TI2CSDAPins = (
    NONE_I2C = TNativePin.None
    //{$if defined(has_I2C2) and defined(has_gpiob)}, PB3_I2C2 = ALT4 or TNativePin.PB3 {$endif}
    //{$if defined(has_I2C3) and defined(has_gpiob)}, PB4_I2C3 = ALT4 or TNativePin.PB4 {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob)}, PB7_I2C1  = ALT4 or TNativePin.PB7 {$endif}
    {$if defined(has_arduinopins)                }, D14_I2C   = ALT4 or TNativePin.PB9 {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob)}, PB9_I2C1  = ALT4 or TNativePin.PB9 {$endif}
    //{$if defined(has_I2C2) and defined(has_gpiob)}, PB11_I2C2 = ALT4 or TNativePin.PB11 {$endif}
    {$if defined(has_I2C3) and defined(has_gpioc)}, PC9_I2C3  = ALT4 or TNativePin.PC9 {$endif}
    //{$if defined(has_I2C2) and defined(has_gpioc)}, PC12_I2C2 = ALT4 or TNativePin.PC12 {$endif}
    //{$if defined(has_I2C2) and defined(has_gpiof)}, PF0_I2C2 = ALT4 or TNativePin.PF0 {$endif}
    //{$if defined(has_I2C2) and defined(has_gpioh)}, PH5_I2C2 = ALT4 or TNativePin.PH5 {$endif}
    //{$if defined(has_I2C3) and defined(has_gpioh)}, PH8_I2C3 = ALT4 or TNativePin.PH8 {$endif}
    {$if defined(has_I2C2) and defined(has_gpiob)}, PB3_I2C2  = ALT9 or TNativePin.PB3 {$endif}
    {$if defined(has_I2C3) and defined(has_gpiob)}, PB4_I2C3  = ALT9 or TNativePin.PB4 {$endif}
    //{$if defined(has_I2C3) and defined(has_gpiob)}, PB8_I2C3 = ALT9 or TNativePin.PB8 {$endif}
    //{$if defined(has_I2C2) and defined(has_gpiob)}, PB9_I2C2 = ALT9 or TNativePin.PB9 {$endif}
  );
  TI2CSCLPins = (
    NONE_I2C = TNativePin.None
    {$if defined(has_I2C3) and defined(has_gpioa)}, PA8_I2C3  = ALT4 or TNativePin.PA8 {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob)}, PB6_I2C1  = ALT4 or TNativePin.PB6 {$endif}
    {$if defined(has_arduinopins)                }, D15_I2C   = ALT4 or TNativePin.PB8 {$endif}
    {$if defined(has_I2C1) and defined(has_gpiob)}, PB8_I2C1  = ALT4 or TNativePin.PB8 {$endif}
    {$if defined(has_I2C2) and defined(has_gpiob)}, PB10_I2C2 = ALT4 or TNativePin.PB10 {$endif}
    //{$if defined(has_I2C2) and defined(has_gpiof)}, PF1_I2C2 = ALT4 or TNativePin.PF1 {$endif}
    //{$if defined(has_I2C2) and defined(has_gpioh)}, PH4_I2C2 = ALT4 or TNativePin.PH4 {$endif}
    //{$if defined(has_I2C3) and defined(has_gpioh)}, PH7_I2C3 = ALT4 or TNativePin.PH7 {$endif}
  );
{$ENDREGION}

const
  DefaultI2CFrequency=400000;

type
  TI2CMode = (Slave=0, Master=1);

  TI2CAddressSize = (SevenBits=0, TenBits=1);

type
  { Abstract I2C (Inter-Integrated Circuit) communication manager. }
  TI2CRegistersHelper = record helper for TI2C_Registers
  private
    function GetBaudrate: longWord;
    procedure SetBaudrate(const aBaudrate: longWord);
    function  GetMode: TI2CMode;
    procedure SetMode(const aMode: TI2CMode);

  public
    property Baudrate : longWord read getBaudrate write setBaudrate;
    property Mode : TI2CMode read getMode write setMode;

    procedure Initialize(const ASDAPin : TI2CSDAPins;
                         const ASCLPin  : TI2CSCLPins;
                         const aBaudrate : longWord = 100000);

    function  Disable : boolean;
    procedure Enable;

    procedure WaitForReady; inline;
    //function WaitForReady(EndTime : TMilliSeconds):boolean; //inline;

    function BeginWriteTransaction(const Address : byte):boolean; //inline;
    function BeginReadTransaction(const Address : byte):boolean; //inline;
    function RestartWriteTransaction(const Address : byte):boolean; //inline;
    function RestartReadTransaction(const Address : byte):boolean; //inline;
    procedure EndTransaction; //inline;
    function ReadByte(out aReadByte: byte):boolean;
    function WriteByte(const aWriteByte: byte):boolean;
    function ReadRegister(const aAddress,aRegister : byte; out aReadByte : byte):boolean;
    function WriteRegister(const aAddress,aRegister,aWriteByte : byte):boolean;
  end;

{$IF DEFINED(HAS_ARDUINOPINS)}
var
  I2C : TI2C_Registers absolute I2C1_BASE;
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

function TI2CRegistersHelper.Disable : boolean;
begin
  Result := GetBitValue(Self.CR1,0)>0;
  ClearBit(Self.CR1,0);
end;

procedure TI2CRegistersHelper.Enable;
begin
  SetBit(Self.CR1,0);
end;

function TI2CRegistersHelper.GetBaudrate: longWord;
var
  Divider,PCLK : longWord;
begin
  Divider := GetBitsMasked(Self.CCR,%111111111111,0);
  PCLK := SystemCore.GetAPB1PeripheralClockFrequency;
  Result := PCLK div (Self.CCR - 1);
  //TODO Handle I2C Speeds > 100000
  Result := Result shr 1;
end;

procedure TI2CRegistersHelper.SetBaudrate(const aBaudrate: longWord);
var
  PCLK,FreqMHz,DutyCycle,I2C_SPEED_FAST : longWord;
begin
  Disable;
  PCLK := SystemCore.GetAPB1PeripheralClockFrequency;
  // Set Correct Timing Params by writing APB Clock Speed to CR2
  FreqMHz := PCLK div 1000000;
  Self.CR2 := FreqMHz;
  //DutyCycle := TI2CDutyCycle.Two;

  if aBaudrate <= 100000 then
  begin
    Self.TRISE := FreqMHz + 1;
    if (((PCLK div aBaudrate) shl 1) and %111111111111) < 4 then
      Self.CCR := 4
    else
      Self.CCR := (PCLK div (aBaudrate shl 1))+1
  end
  else
  begin
    Self.TRISE := ((FreqMHz * 300) div 1000) + 1;
    //if DUTYCYCLE = TI2CDutyCycle.Two then
      I2C_SPEED_FAST := PCLK div (aBaudrate * 3);
    //else
    //  I2C_SPEED_FAST := ((PCLK div (aBaudrate * 25)) or (1 shl 14));
    if I2C_SPEED_FAST and %111111111111 = 0 then
      Self.CCR := 1
    else
      Self.CCR := I2C_SPEED_FAST or (1 shl 15);
  end;
end;

function TI2CRegistersHelper.GetMode:TI2CMode;
begin
  //TODO Implement Slave Mode
  Result := TI2CMode.Master;
end;

procedure TI2CRegistersHelper.SetMode(const aMode: TI2CMode);
begin
  Disable;
  //TODO Implement Slave Mode
  ClearBit(Self.CCR,15);
end;

procedure TI2CRegistersHelper.Initialize(const ASDAPin : TI2CSDAPins;
                     const ASCLPin  : TI2CSCLPins;
                     const aBaudrate : longWord = 100000);
begin
  case longWord(@Self) of
    {$if defined(has_I2C1)}I2C1_BASE:  RCC.APB1ENR := RCC.APB1ENR or (1 shl 21);{$endif}
    {$if defined(has_I2C2)}I2C2_BASE:  RCC.APB1ENR := RCC.APB1ENR or (1 shl 22);{$endif}
    {$if defined(has_I2C3)}I2C3_BASE:  RCC.APB1ENR := RCC.APB1ENR or (1 shl 23);{$endif}
  end;

  // Disable the selected I2C peripheral
  Disable;
  SetBit(Self.CR1,15); //Initiate a Software Reset
  Self.CR1 := 0;
  Self.CR2 := 0;
  Self.OAR1 := 0;
  Self.OAR2 := 0;
  Self.FLTR := 0;
  SetBaudRate(aBaudrate);
  GPIO.PinMode[longWord(aSCLPin) and $ff] := TPinMode((longWord(aSCLPin) shr 8));
  GPIO.PinMode[longWord(aSDAPin) and $ff] := TPinMode((longWord(aSDAPin) shr 8));
  GPIO.PinDrive[longWord(aSCLPin) and $ff] := TPinDrive.PullUp;
  GPIO.PinDrive[longWord(aSDAPin) and $ff] := TPinDrive.PullUp;
  GPIO.PinOutputMode[longWord(aSCLPin) and $ff] := TPinOutputMode.OpenDrain;
  GPIO.PinOutputMode[longWord(aSDAPin) and $ff] := TPinOutputMode.OpenDrain;
  GPIO.PinOutputSpeed[longWord(aSCLPin) and $ff] := TPinOutputSpeed.VeryHigh;
  GPIO.PinOutputSpeed[longWord(aSDAPin) and $ff] := TPinOutputSpeed.VeryHigh;
  Enable;
end;

procedure TI2CRegistersHelper.WaitForReady; inline;
begin

end;

function TI2CRegistersHelper.BeginWriteTransaction(const Address : byte):boolean; //inline;
var
  Temp : byte;
begin
  ClearBit(Self.CR1,11); //Clear Pos Bit
  SetBit(Self.CR1,8); //Send Start Condition
  WaitBitIsSet(Self.SR1,0); //Wait until Start Condition is sent
  Self.DR := Address shl 1;
  //Wait until Address sent is signaled or Acknowledge failed
  repeat
  until (Self.SR1 and %10000000010) <> 0;

  //Clear Addr Flag, keep ACK failed flag active
  Result := GetBit(Self.SR1,1) = 1;
  Temp := Self.SR2;
end;

function TI2CRegistersHelper.BeginReadTransaction(const Address : byte):boolean; //inline;
var
  Temp : byte;
begin
  ClearBit(Self.CR1,11); //Clear Pos Bit
  SetBit(Self.CR1,8); //Send Start Condition
  WaitBitIsSet(Self.SR1,0); //Wait until Start Condition is sent
  Self.DR := Address shl 1 or %1;
  //Wait until Address sent is signaled or Acknowledge failed
  repeat
  until (Self.SR1 and %10000000010) <> 0;

  //Clear Addr Flag
  Result := GetBit(Self.SR1,1) = 1;
  Temp := Self.SR2;
end;

function TI2CRegistersHelper.RestartWriteTransaction(const Address : byte):boolean; //inline;
begin
end;

function TI2CRegistersHelper.RestartReadTransaction(const Address : byte):boolean; //inline;
begin
end;

procedure TI2CRegistersHelper.EndTransaction; //inline;
begin
  // Only wait for Send Buffer to get empty if AF Bit is cleared (we have no NACK)
  if GetBit(Self.SR1,10)=0 then
    WaitBitIsSet(Self.SR1,7);
  SetBit(Self.CR1,9); //Set Stop Condition
end;

function TI2CRegistersHelper.ReadByte(out aReadByte: byte):boolean;
begin
end;

function TI2CRegistersHelper.WriteByte(const aWriteByte: byte):boolean;
begin
end;

function TI2CRegistersHelper.ReadRegister(const aAddress,aRegister : byte; out aReadByte : byte):boolean;
begin
  Result := false;
  if BeginWriteTransaction(aAddress) then
    if WriteByte(aRegister) then
      if RestartReadTransAction(aAddress) then
        Result := ReadByte(aReadByte);
end;

function TI2CRegistersHelper.WriteRegister(const aAddress,aRegister,aWriteByte : byte):boolean;
begin
  Result := false;
  if BeginWriteTransaction(aAddress) then
    if WriteByte(aRegister) then
      Result := WriteByte(aWriteByte);
end;

end.

