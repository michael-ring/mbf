unit mbf.megaAVR.i2c;
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

}

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.megaAVR.GPIO,
  MBF.megaAVR.SystemCore;

{$REGION PinDefinitions}

type
  TI2CSDAPins = (
    NONE_I2C = TNativePin.None
    {$if defined(has_arduinopins)                }, D14_I2C  = TNativePin.PC4 {$endif}
    {$if defined(has_arduinopins)                },  A4_I2C  = TNativePin.PC4 {$endif}
  );
  TI2CSCLPins = (
    NONE_I2C = TNativePin.None
    {$if defined(has_arduinopins)                }, D15_I2C  = TNativePin.PC5 {$endif}
    {$if defined(has_arduinopins)                },  A5_I2C  = TNativePin.PC5 {$endif}
  );

  TI2C_Registers = record
    BR  : byte;  // TWI Bit Rate register
    SR  : byte;  // TWI Status Register
    AR  : byte;  // TWI (Slave) Address register  end;
    DR  : byte;  // TWI Data register
    CR  : byte;  // TWI Control Register
    AMR : byte;  // TWI (Slave) Address Mask Register
  end;
{$ENDREGION}

const
  DefaultI2CFrequency=100000;
  I2C0_BASE=$B8;

type
  TI2CMode = (Slave=0, Master=1);
  TI2CAddressSize = (SevenBits=0);
  TI2CTransactionMode = (Write=0,Read=1);

type
  { Abstract I2C (Inter-Integrated Circuit) communication manager. }
  TI2CRegistersHelper = record helper for TI2C_Registers
  private
    function FindDividerValue(const aBaudrate: longWord) : Word;
    function GetBaudrate: longWord;
    procedure SetBaudrate(const aBaudrate: longWord);
    function  GetMode: TI2CMode;
    procedure SetMode(const aMode: TI2CMode);

  public
    property Baudrate : longWord read getBaudrate write setBaudrate;
    property Mode : TI2CMode read getMode write setMode;

    procedure Initialize(const ASDAPin : TI2CSDAPins;
                         const ASCLPin  : TI2CSCLPins;
                         const aBaudrate : longWord = 100000); overload;

    function  Disable : boolean;
    procedure Enable;

    function WaitForAck : boolean; //inline;

    procedure WaitForReady; inline;
    function WaitForReady(EndTime : TMilliSeconds):boolean; //inline;

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

var
  I2C : TI2C_Registers absolute I2C0_BASE;

implementation
uses
  MBF.BitHelpers;

var
  TargetAddress : byte = 0;

procedure TI2CRegistersHelper.Initialize(const ASDAPin : TI2CSDAPins;
                     const ASCLPin  : TI2CSCLPins;
                     const aBaudrate : longWord = 100000);
begin
  Disable;
  GPIO.PinMode[TPinIdentifier(ASDAPin)] := TPinMode.Input;
  GPIO.PinMode[TPinIdentifier(ASCLPin)] := TPinMode.Input;
  GPIO.PinDrive[TPinIdentifier(ASDAPin)] := TPinDrive.PullUp;
  GPIO.PinDrive[TPinIdentifier(ASCLPin)] := TPinDrive.PullUp;
  SetBaudrate(aBaudrate);
  Self.DR := $ff;
  Self.CR := %10000100; // Clear TWINT Flag and Enable I2C
end;

function TI2CRegistersHelper.Disable : boolean;
begin
  Result := GetBitValue(Self.CR,2)>0;
  ClearBit(Self.CR,2);
end;

procedure TI2CRegistersHelper.Enable;
begin
  SetBit(Self.CR,2);
end;

function TI2CRegistersHelper.FindDividerValue(const aBaudrate: longWord): Word;
begin
  Result := ((SystemCore.GetCPUFrequency div (aBaudrate)) - 16) div 2;
  // Check if we need to set the PreScaler
  if Result >= 64*256 then
    Result := (Result shr 6) or $300
  else if Result >= 16*256 then
    Result := (Result shr 4) or $200
  else if Result >= 4*256 then
    Result := (Result shr 2) or $100;
end;

function TI2CRegistersHelper.GetBaudrate: longWord;
begin
  Result := SystemCore.GetCPUFrequency div (16+2*Self.BR*GetBitsMasked(Self.SR,%11,0));
end;

procedure TI2CRegistersHelper.SetBaudrate(const aBaudrate: longWord);
var
  Temp : Word;
begin
  Disable;
  Temp := FindDividerValue(aBaudrate);
  Self.BR := Temp and $ff;
  SetBitsMasked(Self.SR,Temp shr 8,%11,0);
end;

function TI2CRegistersHelper.GetMode: TI2CMode;
begin
  Result := TI2CMode.Master;
end;

procedure TI2CRegistersHelper.SetMode(const aMode: TI2CMode);
begin
end;

procedure TI2CRegistersHelper.WaitForReady; //inline;
begin
  WaitBitIsSet(Self.CR,7);
end;

function TI2CRegistersHelper.WaitForAck : boolean; //inline;
begin
  WaitForReady;

  case Self.SR and $F8 of
    $20,$30,$38: Result := False
  else
    Result := True;
  end;
end;

function  TI2CRegistersHelper.WaitForReady(EndTime : TMilliSeconds):boolean; inline;
begin
  WaitBitIsSet(Self.CR,7,EndTime);
end;

function TI2CRegistersHelper.BeginWriteTransaction(const Address : byte):boolean; //inline;
begin
  Self.CR := %10100100; // Clear TWINT Flag, Request Start and Enable I2C
  WaitForReady;
  if Self.SR and $F8 = $08 then
  begin
    Self.DR := (Address shl 1);
    Self.CR := %10000100; // Clear TWINT Flag, keep I2C enabled
    WaitForReady;
    if Self.SR and $F8 = $18 then
      Result := true
    else
      Result := false;
  end
  else
    Result := false;
end;

function TI2CRegistersHelper.BeginReadTransaction(const  Address: byte):boolean; //inline;
begin
  Self.CR := %10100100; // Clear TWINT Flag, Request Start and Enable I2C
  WaitForReady;
  if Self.SR and $F8 = $40 then
  begin
    Self.DR := (Address shl 1) or %1;
    Self.CR := %10000100; // Clear TWINT Flag, keep I2C enabled
    WaitForReady;
    if Self.SR and $F8 = $18 then
      Result := true
    else
      Result := false
  end
  else
    Result := false;
end;

function TI2CRegistersHelper.RestartWriteTransaction(const Address : byte):boolean; //inline;
begin
  Self.CR := %10100100; // Clear TWINT Flag, Request Start and Enable I2C
  WaitForReady;
  if Self.SR and $F8 = $10 then
  begin
    Self.DR := (Address shl 1);
    Self.CR := %10000100; // Clear TWINT Flag, keep I2C enabled
    WaitForReady;
    if Self.SR and $F8 = $18 then
      Result := true
    else
      Result := false
  end
  else
    Result := false;
end;

function TI2CRegistersHelper.RestartReadTransaction(const Address : byte):boolean; //inline;
begin
  Self.CR := %10100100; // Clear TWINT Flag, Request Start and Enable I2C
  WaitForReady;
  if Self.SR and $F8 = $10 then
  begin
    Self.DR := (Address shl 1) or %1;
    Self.CR := %10000100; // Clear TWINT Flag, keep I2C enabled
    WaitForReady;
    if Self.SR and $F8 = $40 then
      Result := true
    else
      Result := false
  end
  else
    Result := false;
end;

procedure TI2CRegistersHelper.EndTransaction; inline;
begin
  Self.CR := %10010100; // Clear TWINT Flag, Request Stop and Enable I2C
  WaitBitIsCleared(Self.CR,4);
end;

function TI2CRegistersHelper.ReadByte(out aReadByte: byte):boolean; inline;
begin
  Self.CR := %10000100; // Clear TWINT Flag, keep I2C enabled
  WaitForReady;
  case Self.SR and $F8  of
  $50 : begin
    aReadByte := Self.DR;
    Result := true
  end;
  $58 : begin
    aReadByte := Self.DR;
    Result := false;
  end
  else
    Result := false;
  end;
end;

function TI2CRegistersHelper.WriteByte(const aWriteByte: byte):boolean; inline;
begin
  Self.DR := aWriteByte;
  Self.CR := %10000100; // Clear TWINT Flag, keep I2C enabled
  WaitForReady;
  if Self.SR and $F8 = $28 then
    Result := true
  else
    Result := false;
end;

function TI2CRegistersHelper.ReadRegister(const aAddress,aRegister : byte; out aReadByte : byte):boolean;
begin
  Result := false;
  if BeginWriteTransaction(aAddress) then
  begin
    // Prepare Read from Device ID Register
    WriteByte(aRegister);
    RestartReadTransaction(aAddress);
    ReadByte(aReadByte);
    EndTransaction;
  end;
end;

function TI2CRegistersHelper.WriteRegister(const aAddress,aRegister,aWriteByte : byte):boolean;
begin
  Result := false;
  if BeginWriteTransaction(aAddress) then
  begin
    // Prepare Read from Device ID Register
    WriteByte(aRegister);
    WriteByte(aWriteByte);
    EndTransaction;
  end;
end;

end.

