unit MBF.SAMCD.I2C;
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
  MBF.SAMCD.GPIO,
  MBF.SAMCD.SerCom;

//I2C includes are complex and automagically created, so include them to keep Sourcecode clean
{$include MBF.SAMCD.I2C.inc}

type
  TI2COperatingMode = (Slave=0, Master=1);
  TI2CAddressSize = (SevenBits=0, TenBits=1);
  TI2CBaudRates = (Standard100k=100000,Full400k=400000,Fast1M=1000000,High3M2=3200000);

const
  DefaultI2CBaudrate=TI2CBaudRates.Standard100k;
  DefaultI2CTimeout = 10000;

type
  TI2C_Registers = TSercomI2CM_Registers;
  TI2CRegistersHelper = record helper for TI2C_Registers
  //PAD[0] Digital I/O SDA
  //PAD[1] Digital I/O SCL
  //PAD[2] Digital I/O SDA_OUT (4-wire)
  //PAD[3] Digital I/O SDC_OUT (4-wire)
  strict private type
    TSercomWireBusState=record
      const
        WIRE_UNKNOWN_STATE=0;
        WIRE_IDLE_STATE=1;
        WIRE_OWNER_STATE=2;
        WIRE_BUSY_STATE=3;
    end;
    TSercomMasterCommandWire=record
      const
        WIRE_MASTER_ACT_NO_ACTION=0;
        WIRE_MASTER_ACT_REPEAT_START=1;
        WIRE_MASTER_ACT_READ=2;
        WIRE_MASTER_ACT_STOP=3;
    end;
  strict private const
    I2C_TRANSFER_WRITE=0;
    I2C_TRANSFER_READ=1;
    T_RISE=215; // In ns; depends on the board/pull-up-resistors
    SPEED100KHZ=100;
  strict private
    procedure SyncWait;
    function GetBaud(const Value: Cardinal):cardinal;
    function isMasterWIRE:boolean;
    //TODO function isSlaveWIRE:boolean;
    function isBusIdleWIRE:boolean;
    function isBusOwnerWIRE:boolean;
    //TODO function isDataReadyWIRE:boolean;
    //TODO function isStopDetectedWIRE:boolean;
    //TODO function isRestartDetectedWIRE:boolean;
    //TODO function isAddressMatch:boolean;
    //TODO function isMasterReadOperationWIRE:boolean;
    function isRXNackReceivedWIRE:boolean;
    function errorOnWIRE:boolean;
    function busErrorOnWIRE:boolean;
    function busClockHoldWIRE:boolean;
    function availableWIRE:boolean;
    function availableMasterWIRE:boolean;
    function readDataWIRE:byte;
    procedure resetWIRE;
    procedure enableWIRE;
    procedure disableWIRE;
    procedure prepareNackBitWIRE;
    procedure prepareAckBitWIRE;
    procedure prepareCommandBitsWire(aCommand:byte);
    function startTransmissionWIRE(const Address:byte;const aDirection:byte):boolean;
    function stopTransmissionWIRE:boolean;
    function sendDataMasterWIRE(data:byte):boolean;
    //TODO function sendDataSlaveWIRE(data:byte):boolean;
  public
    procedure Initialize;
    procedure Initialize(const ASDAPin : TI2CSDAPins;
                         const ASCLPin  : TI2CSCLPins); overload;
    function Read(const Address:byte; const buffer: pointer; const length: byte; const stopBit: boolean):byte;
    function Write(const Address:byte; const buffer: pointer; const length: integer; const stopBit: boolean):boolean;
    function ReadByte(const Address:byte; out aByte:byte):boolean;
    function WriteByte(const Address:byte; const aByte:byte):boolean;
    function WriteWord(const Address:byte; const aWord:word):boolean;
    function WriteLongWord(const Address:byte; const aLongWord:longword):boolean;
    function ReadRegister(var aReadByte : byte ; const aRegister : byte; const TimeOut : longWord=0; const DeviceAddress : word = 0):boolean;
    function ReadRegister(var aReadBuffer : array of byte ; const aStartRegister : byte; const TimeOut : longWord=0; const DeviceAddress : word = 0):boolean;
    function WriteRegister(const aWriteByte : byte ; const aRegister : byte; const TimeOut : longWord=0; const DeviceAddress : word = 0):boolean;
  end;

 var
  {$if defined(has_i2c0)}I2C0 : TSercomI2cm_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(has_i2c1)}I2C1 : TSercomI2cm_Registers absolute SERCOM1_BASE;{$endif}
  {$if defined(has_i2c2)}I2C2 : TSercomI2cm_Registers absolute SERCOM2_BASE;{$endif}
  {$if defined(has_i2c3)}I2C3 : TSercomI2cm_Registers absolute SERCOM3_BASE;{$endif}
  {$if defined(has_i2c4)}I2C4 : TSercomI2cm_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(has_i2c5)}I2C5 : TSercomI2cm_Registers absolute SERCOM5_BASE;{$endif}
  {$if defined(has_i2c6)}I2C6 : TSercomI2cm_Registers absolute SERCOM6_BASE;{$endif}

  {$if defined(SAMC21XPRO)  }I2C : TSercomI2cm_Registers absolute SERCOM2_BASE;{$endif}
  {$if defined(SAMD10XMINI) }I2C : TSercomI2cm_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD11XPRO)  }I2C : TSercomI2cm_Registers absolute SERCOM_BASE;{$endif}
  {$if defined(SAMD20XPRO)  }I2C : TSercomI2cm_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD21XPRO)  }I2C : TSercomI2cm_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(ARDUINOZERO) }I2C : TSercomI2cm_Registers absolute SERCOM3_BASE;{$endif}

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

function TI2CRegistersHelper.isMasterWIRE:boolean;
begin
  result:=((CTRLA AND SERCOM_MODE_Msk)=SERCOM_MODE_I2C_MASTER);
end;

//TODO
//function TI2C_Registers.isSlaveWIRE:boolean;
//begin
//  result:=((CTRLA AND SERCOM_MODE_Msk)=SERCOM_MODE_I2C_SLAVE);
//end;

function TI2CRegistersHelper.isBusIdleWIRE:boolean;
begin
  result:=((STATUS AND SERCOM_I2CM_STATUS_BUSSTATE_Msk)=(TSercomWireBusState.WIRE_IDLE_STATE shl SERCOM_I2CM_STATUS_BUSSTATE_Pos));
end;

function TI2CRegistersHelper.isBusOwnerWIRE:boolean;
begin
  result:=((STATUS AND SERCOM_I2CM_STATUS_BUSSTATE_Msk)=(TSercomWireBusState.WIRE_OWNER_STATE shl SERCOM_I2CM_STATUS_BUSSTATE_Pos));
end;

//TODO
//function TI2C_Registers.isDataReadyWIRE:boolean;
//begin
//  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.INTFLAG,SERCOM_I2CS_INTFLAG_DRDY_Pos);
//  result:=GetBit(INTFLAG,SERCOM_I2CS_INTFLAG_DRDY_Pos);
//end;

//TODO
//function TI2C_Registers.isStopDetectedWIRE:boolean;
//begin
//  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.INTFLAG,SERCOM_I2CS_INTFLAG_PREC_Pos)
//  result:=GetBit(INTFLAG,SERCOM_I2CS_INTFLAG_PREC_Pos);
//end;

//function TI2C_Registers.isRestartDetectedWIRE:boolean;
//begin
//  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.STATUS,SERCOM_I2CS_STATUS_SR_Pos)
//  result:=GetBit(STATUS,SERCOM_I2CS_STATUS_SR_Pos);
//end;

//TODO
//function TI2C_Registers.isAddressMatch:boolean;
//begin
//  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.INTFLAG,SERCOM_I2CS_INTFLAG_AMATCH_Pos);
//  result:=GetBit(INTFLAG,SERCOM_I2CS_INTFLAG_AMATCH_Pos);
//end;

//TODO
//function TI2C_Registers.isMasterReadOperationWIRE:boolean;
//begin
//  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.STATUS,SERCOM_I2CS_STATUS_DIR_Pos);
//  result:=GetBit(STATUS,SERCOM_I2CS_STATUS_DIR_Pos);
//end;

function TI2CRegistersHelper.isRXNackReceivedWIRE:boolean;
begin
  result:=GetBit(STATUS,SERCOM_I2CM_STATUS_RXNACK_Pos)=1;
end;

function TI2CRegistersHelper.errorOnWIRE:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_I2CM_INTFLAG_ERROR_Pos)=1;
  // clear the error flag
  SetBit(INTFLAG,SERCOM_I2CM_INTFLAG_ERROR_Pos);
end;

function TI2CRegistersHelper.busErrorOnWIRE:boolean;
begin
  result:=GetBit(STATUS,SERCOM_I2CM_STATUS_BUSERR_Pos)=1;
end;

function TI2CRegistersHelper.busClockHoldWIRE:boolean;
begin
  result:=GetBit(STATUS,SERCOM_I2CM_STATUS_CLKHOLD_Pos)=1;
end;


function TI2CRegistersHelper.availableWIRE:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_I2CM_INTFLAG_SB_Pos)=1;
end;

function TI2CRegistersHelper.availableMasterWIRE:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_I2CM_INTFLAG_MB_Pos)=1;
end;

function TI2CRegistersHelper.readDataWIRE:byte;
begin
  SyncWait;
  result:=Self.DATA;
  while (NOT availableWIRE) do begin end;
end;

procedure TI2CRegistersHelper.resetWIRE;
begin
  TSerCom_Registers(Self).Reset;
end;

procedure TI2CRegistersHelper.enableWIRE;
begin
  TSerCom_Registers(Self).Enable;
  // Go (by force) from unknow busstate to idle
  SetBitsMasked(STATUS,TSercomWireBusState.WIRE_IDLE_STATE,SERCOM_I2CM_STATUS_BUSSTATE_Msk,SERCOM_I2CM_STATUS_BUSSTATE_Pos);
  SyncWait;
end;

procedure TI2CRegistersHelper.disableWIRE;
begin
  TSerCom_Registers(Self).Disable;
end;

procedure TI2CRegistersHelper.SyncWait;
begin
  {$if defined(SAMD20))}
  WaitBitIsCleared(Self.STATUS,10);
  {$else}
  WaitBitIsCleared(Self.SYNCBUSY,2);
  //while (Self.SYNCBUSY>0) do begin end;
  {$endif}
end;

procedure TI2CRegistersHelper.Initialize;
begin
  TSerCom_Registers(Self).Initialize;
  TSerCom_Registers(Self).SetCoreClockSource(GCLK_CLKCTRL_GEN_GCLK0); // use gclk0 at 48MHz
end;

procedure TI2CRegistersHelper.Initialize(const ASDAPin : TI2CSDAPins;
                     const ASCLPin  : TI2CSCLPins);
var
  speed,baud,baudlow:cardinal;
begin
  Initialize;

  GPIO.PinMux[longWord(ASDAPin) and $ff] := TPinMux((longWord(ASDAPin) shr 8) and %111);
  GPIO.PinMux[longWord(ASCLPin) and $ff] := TPinMux((longWord(ASCLPin) shr 8) and %111);

  Speed := SPEED100KHZ;

  //Enable Smart Mode: (N)ACK is sent when DATA.DATA is read)
  //Do not use smart mode (yet)
  //FSerCom.PSerComRegisters^.I2CM.CTRLB:=SERCOM_I2CM_CTRLB_SMEN;
  //FSerCom.SyncWait;

  baudlow:=GetBaud(Speed);
  baud:=(baudlow DIV 2);
  baudlow:=baudlow-baud;
  Self.BAUD:=(baudlow shl 8) OR baud;
  SyncWait;

  Self.CTRLA:=
     SERCOM_MODE_I2C_MASTER OR
     //SERCOM_I2CM_CTRLA_SCLSM OR //SCL stretch only after ACK bit.
     ((SERCOM_I2CM_CTRLA_SDAHOLD_Msk AND ((3) shl SERCOM_I2CM_CTRLA_SDAHOLD_Pos)));
  SyncWait;

  enableWIRE;
end;

procedure TI2CRegistersHelper.prepareNackBitWIRE;
begin
  SetBit(CTRLB,SERCOM_I2CM_CTRLB_ACKACT_Pos);
end;

procedure TI2CRegistersHelper.prepareAckBitWIRE;
begin
  ClearBit(CTRLB,SERCOM_I2CM_CTRLB_ACKACT_Pos);
end;

procedure TI2CRegistersHelper.prepareCommandBitsWire(aCommand:byte);
begin
  SetBitsMasked(CTRLB,aCommand,SERCOM_I2CM_CTRLB_CMD_Msk,SERCOM_I2CM_CTRLB_CMD_Pos);
end;


function TI2CRegistersHelper.startTransmissionWIRE(const Address:byte;const aDirection:byte):boolean;
begin
  result:=false;

  SyncWait;

  // clear the error flag
  errorOnWIRE;

  // Wait idle or owner bus mode
  while ( (NOT isBusIdleWIRE) AND (NOT isBusOwnerWIRE) ) do begin end;

  prepareAckBitWIRE;

  // Send start and address and R/W bit
  Self.ADDR:=((Address shl 1) OR aDirection);
  SyncWait;

  if aDirection=I2C_TRANSFER_READ then
  begin
    while (NOT availableWIRE) do begin end;
    // If the slave NACKS the address, the MB bit will be set.
    // In that case, send a stop condition and return false.
    if availableMasterWIRE then
    begin
      stopTransmissionWIRE;
      exit;
    end;
  end
  else
  begin
    while (NOT availableMasterWIRE) do begin end;
    //while (NOT busClockHoldWIRE) do begin end;
  end;

  if (
    isRXNackReceivedWIRE
    OR
    errorOnWIRE
    ) then
  begin
    stopTransmissionWIRE;
    exit;
  end;

  result:=true;
end;

function TI2CRegistersHelper.stopTransmissionWIRE:boolean;
begin
  result:=false;
  if (availableMasterWIRE OR availableWIRE) then
  begin
    prepareCommandBitsWire(TSercomMasterCommandWire.WIRE_MASTER_ACT_STOP);   // Send Stop
    result:=true;
  end;
end;

function TI2CRegistersHelper.sendDataMasterWIRE(data:byte):boolean;
begin
  result:=false;

  //Send data
  Self.DATA := data;

  SyncWait;

  //Wait transmission successful
  while (NOT availableMasterWIRE) do
  begin
    // If a bus error occurs, the MB bit may never be set.
    // Check the bus error bit and bail if it's set.
    if busErrorOnWIRE then exit;
  end;

  //Problems on line? nack received?
  if (isRXNackReceivedWIRE) then exit;

  result:=true;
end;

(*
function TI2C_Registers.sendDataSlaveWIRE(data:byte):boolean;
begin
  result:=false;

  //Send data
  Self.DATA := data;
  SyncWait;

  //Problems on line? nack received?
  if ((isRXNackReceivedWIRE) OR (NOT isDataReadyWIRE)) then exit;

  result:=true;
end;
*)

function TI2CRegistersHelper.GetBaud(const Value: Cardinal):cardinal;
var
  tmp_baud, correction:longword;
begin
   tmp_baud   := DivCeiling(SystemCore.CPUFrequency,(1000*Value));
   correction := (10 + (((SystemCore.CPUFrequency DIV 1000)*T_RISE) DIV 1000000));
   result:= tmp_baud-correction;
end;

function TI2CRegistersHelper.Read(const Address:byte; const buffer: pointer; const length: byte; const stopBit: boolean):byte;
var
  i:byte;
begin
  i:=0;
  if length>0 then
  begin
    if startTransmissionWIRE(Address,I2C_TRANSFER_READ) then
    begin
      while i<length do
      begin
        if i=(length-1) then
        begin
          prepareNackBitWIRE; // Final read: Prepare Nack
          prepareCommandBitsWire(TSercomMasterCommandWire.WIRE_MASTER_ACT_READ);
        end
        else
        begin
          prepareAckBitWIRE; // Normal read: Prepare Ack
          prepareCommandBitsWire(TSercomMasterCommandWire.WIRE_MASTER_ACT_READ);
        end;
        PByte(buffer+i)^:=readDataWIRE; // Read data and send the (N)ACK
        Inc(i);
      end;
    end;
  end;

  if (stopBit) then stopTransmissionWIRE;

  result:=i;
end;

function TI2CRegistersHelper.ReadByte(const Address:byte; out aByte:byte):boolean;
begin
  result:=(Read(Address, @aByte, 1, true)=1);
end;

function TI2CRegistersHelper.Write(const Address:byte; const buffer: pointer; const length: integer; const stopBit: boolean):boolean;
var
  i:longword;
begin
  result:=startTransmissionWIRE(Address,I2C_TRANSFER_WRITE);

  if result then
  begin
    for i:=0 to (length-1) do
    begin
      result:=sendDataMasterWIRE(PByte(buffer+i)^);
      if not result then break;
    end;
  end;

  if ((stopBit) OR (NOT result)) then
  begin
    if (NOT result) then prepareNackBitWIRE;
    stopTransmissionWIRE;
  end;
end;

function TI2CRegistersHelper.WriteByte(const Address:byte; const aByte:byte):boolean;
begin
  result:=Write(Address, @aByte, 1,true);
end;

function TI2CRegistersHelper.WriteWord(const Address:byte; const aWord:word):boolean;
begin
  result:=Write(Address, @aWord, SizeOf(aWord),true);
end;

function TI2CRegistersHelper.WriteLongWord(const Address:byte; const aLongWord:longword):boolean;
begin
  result:=Write(Address, @aLongWord, SizeOf(aLongWord),true);
end;

function TI2CRegistersHelper.ReadRegister(var aReadByte : byte ; const aRegister : byte; const TimeOut : longWord=0; const DeviceAddress : word = 0):boolean;
var
   EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultI2CTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
end;

function TI2CRegistersHelper.ReadRegister(var aReadBuffer : array of byte ; const aStartRegister : byte; const TimeOut : longWord=0; const DeviceAddress : word = 0):boolean;
var
   EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultI2CTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
end;

function TI2CRegistersHelper.WriteRegister(const aWriteByte : byte ; const aRegister : byte; const TimeOut : longWord=0; const DeviceAddress : word = 0):boolean;
var
   EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultI2CTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
end;

end.
