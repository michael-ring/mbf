unit MBF.SAMCD.I2C;
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
  MBF.SAMCD.SerCom;

type
  TI2C_Registers = record
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
    FSerCom:TSerCom;
    procedure SetPort(aPort:TPortIdentifier);
    function GetBaud(const Value: Cardinal):cardinal;
    function isMasterWIRE:boolean;
    function isSlaveWIRE:boolean;
    function isBusIdleWIRE:boolean;
    function isBusOwnerWIRE:boolean;
    function isDataReadyWIRE:boolean;
    function isStopDetectedWIRE:boolean;
    function isRestartDetectedWIRE:boolean;
    function isAddressMatch:boolean;
    function isMasterReadOperationWIRE:boolean;
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
    function sendDataSlaveWIRE(data:byte):boolean;
  public
    procedure initMasterWIRE(const aPort:TPortIdentifier;const Speed:cardinal=SPEED100KHZ);
    function Read(const Address:byte; const buffer: pointer; const length: byte; const stopBit: boolean):byte;
    function Write(const Address:byte; const buffer: pointer; const length: integer; const stopBit: boolean):boolean;
    function ReadByte(const Address:byte; out aByte:byte):boolean;
    function WriteByte(const Address:byte; const aByte:byte):boolean;
    function WriteWord(const Address:byte; const aWord:word):boolean;
    function WriteLongWord(const Address:byte; const aLongWord:longword):boolean;
  end;

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

function TI2C_Registers.isMasterWIRE:boolean;
begin
  result:=((FSerCom.PSerComRegisters^.I2CM.CTRLA AND SERCOM_MODE_Msk)=SERCOM_MODE_I2C_MASTER);
end;

function TI2C_Registers.isSlaveWIRE:boolean;
begin
  result:=((FSerCom.PSerComRegisters^.I2CM.CTRLA AND SERCOM_MODE_Msk)=SERCOM_MODE_I2C_SLAVE);
end;

function TI2C_Registers.isBusIdleWIRE:boolean;
begin
  result:=((FSerCom.PSerComRegisters^.I2CM.STATUS AND SERCOM_I2CM_STATUS_BUSSTATE_Msk)=(TSercomWireBusState.WIRE_IDLE_STATE shl SERCOM_I2CM_STATUS_BUSSTATE_Pos));
end;

function TI2C_Registers.isBusOwnerWIRE:boolean;
begin
  result:=((FSerCom.PSerComRegisters^.I2CM.STATUS AND SERCOM_I2CM_STATUS_BUSSTATE_Msk)=(TSercomWireBusState.WIRE_OWNER_STATE shl SERCOM_I2CM_STATUS_BUSSTATE_Pos));
end;

function TI2C_Registers.isDataReadyWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.INTFLAG,SERCOM_I2CS_INTFLAG_DRDY_Pos);
end;

function TI2C_Registers.isStopDetectedWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.INTFLAG,SERCOM_I2CS_INTFLAG_PREC_Pos);
end;

function TI2C_Registers.isRestartDetectedWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.STATUS,SERCOM_I2CS_STATUS_SR_Pos);
end;

function TI2C_Registers.isAddressMatch:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.INTFLAG,SERCOM_I2CS_INTFLAG_AMATCH_Pos);
end;

function TI2C_Registers.isMasterReadOperationWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CS.STATUS,SERCOM_I2CS_STATUS_DIR_Pos);
end;

function TI2C_Registers.isRXNackReceivedWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CM.STATUS,SERCOM_I2CM_STATUS_RXNACK_Pos);
end;

function TI2C_Registers.errorOnWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CM.INTFLAG,SERCOM_I2CM_INTFLAG_ERROR_Pos);
  // clear the error flag
  SetBit(FSerCom.PSerComRegisters^.I2CM.INTFLAG,SERCOM_I2CM_INTFLAG_ERROR_Pos);
end;

function TI2C_Registers.busErrorOnWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CM.STATUS,SERCOM_I2CM_STATUS_BUSERR_Pos);
end;

function TI2C_Registers.busClockHoldWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CM.STATUS,SERCOM_I2CM_STATUS_CLKHOLD_Pos);
end;


function TI2C_Registers.availableWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CM.INTFLAG,SERCOM_I2CM_INTFLAG_SB_Pos);
end;

function TI2C_Registers.availableMasterWIRE:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.I2CM.INTFLAG,SERCOM_I2CM_INTFLAG_MB_Pos);
end;

function TI2C_Registers.readDataWIRE:byte;
begin
  FSerCom.SyncWait;
  result:=FSerCom.PSerComRegisters^.I2CM.DATA;
  while (NOT availableWIRE) do begin end;
end;

procedure TI2C_Registers.resetWIRE;
begin
  FSerCom.Reset;
end;

procedure TI2C_Registers.enableWIRE;
begin
  FSerCom.Enable;
  // Go (by force) from unknow busstate to idle
  PutValue(FSerCom.PSerComRegisters^.I2CM.STATUS,SERCOM_I2CM_STATUS_BUSSTATE_Msk,TSercomWireBusState.WIRE_IDLE_STATE,SERCOM_I2CM_STATUS_BUSSTATE_Pos);
  FSerCom.SyncWait;
end;

procedure TI2C_Registers.disableWIRE;
begin
  FSerCom.Disable;
end;

procedure TI2C_Registers.initMasterWIRE(const aPort:TPortIdentifier; const Speed:cardinal=SPEED100KHZ);
var
  baud,baudlow:cardinal;
begin
  SetPort(aPort);

  //Enable Smart Mode: (N)ACK is sent when DATA.DATA is read)
  //Do not use smart mode (yet)
  //FSerCom.PSerComRegisters^.I2CM.CTRLB:=SERCOM_I2CM_CTRLB_SMEN;
  //FSerCom.SyncWait;

  baudlow:=GetBaud(Speed);
  baud:=(baudlow DIV 2);
  baudlow:=baudlow-baud;
  FSerCom.PSerComRegisters^.I2CM.BAUD:=(baudlow shl 8) OR baud;
  FSerCom.SyncWait;

  FSerCom.PSerComRegisters^.I2CM.CTRLA:=
     SERCOM_MODE_I2C_MASTER OR
     //SERCOM_I2CM_CTRLA_SCLSM OR //SCL stretch only after ACK bit.
     ((SERCOM_I2CM_CTRLA_SDAHOLD_Msk AND ((3) shl SERCOM_I2CM_CTRLA_SDAHOLD_Pos)));
  FSerCom.SyncWait;

  enableWIRE;
end;

procedure TI2C_Registers.prepareNackBitWIRE;
begin
  SetBit(FSerCom.PSerComRegisters^.I2CM.CTRLB,SERCOM_I2CM_CTRLB_ACKACT_Pos);
  FSerCom.SyncWait;
end;

procedure TI2C_Registers.prepareAckBitWIRE;
begin
  ClearBit(FSerCom.PSerComRegisters^.I2CM.CTRLB,SERCOM_I2CM_CTRLB_ACKACT_Pos);
  FSerCom.SyncWait;
end;

procedure TI2C_Registers.prepareCommandBitsWire(aCommand:byte);
begin
  PutValue(FSerCom.PSerComRegisters^.I2CM.CTRLB,SERCOM_I2CM_CTRLB_CMD_Msk,aCommand,SERCOM_I2CM_CTRLB_CMD_Pos);
  FSerCom.SyncWait;
end;


function TI2C_Registers.startTransmissionWIRE(const Address:byte;const aDirection:byte):boolean;
begin
  result:=false;

  FSerCom.SyncWait;

  // clear the error flag
  errorOnWIRE;

  // Wait idle or owner bus mode
  while ( (NOT isBusIdleWIRE) AND (NOT isBusOwnerWIRE) ) do begin end;

  prepareAckBitWIRE;

  // Send start and address and R/W bit
  FSerCom.PSerComRegisters^.I2CM.ADDR:=((Address shl 1) OR aDirection);
  FSerCom.SyncWait;

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

function TI2C_Registers.stopTransmissionWIRE:boolean;
begin
  result:=false;
  if (availableMasterWIRE OR availableWIRE) then
  begin
    prepareCommandBitsWire(TSercomMasterCommandWire.WIRE_MASTER_ACT_STOP);   // Send Stop
    result:=true;
  end;
end;

function TI2C_Registers.sendDataMasterWIRE(data:byte):boolean;
begin
  result:=false;

  //Send data
  FSerCom.PSerComRegisters^.I2CM.DATA := data;
  FSerCom.SyncWait;

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

function TI2C_Registers.sendDataSlaveWIRE(data:byte):boolean;
begin
  result:=false;

  //Send data
  FSerCom.PSerComRegisters^.I2CS.DATA := data;
  FSerCom.SyncWait;

  //Problems on line? nack received?
  if ((isRXNackReceivedWIRE) OR (NOT isDataReadyWIRE)) then exit;

  result:=true;
end;


procedure TI2C_Registers.SetPort(aPort:TPortIdentifier);
begin
  FSerCom.Initialize(aPort);
  FSerCom.SetCoreClockSource(GCLK_CLKCTRL_GEN_GCLK0); // use gclk0 at 48MHz
end;


function TI2C_Registers.GetBaud(const Value: Cardinal):cardinal;
var
  tmp_baud, correction:longword;
begin
   tmp_baud   := DivCeiling(SystemCore.CPUFrequency,(1000*Value));
   correction := (10 + (((SystemCore.CPUFrequency DIV 1000)*T_RISE) DIV 1000000));
   result:= tmp_baud-correction;
end;

function TI2C_Registers.Read(const Address:byte; const buffer: pointer; const length: byte; const stopBit: boolean):byte;
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

function TI2C_Registers.ReadByte(const Address:byte; out aByte:byte):boolean;
begin
  result:=(Read(Address, @aByte, 1, true)=1);
end;

function TI2C_Registers.Write(const Address:byte; const buffer: pointer; const length: integer; const stopBit: boolean):boolean;
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

function TI2C_Registers.WriteByte(const Address:byte; const aByte:byte):boolean;
begin
  result:=Write(Address, @aByte, 1,true);
end;

function TI2C_Registers.WriteWord(const Address:byte; const aWord:word):boolean;
begin
  result:=Write(Address, @aWord, SizeOf(aWord),true);
end;

function TI2C_Registers.WriteLongWord(const Address:byte; const aLongWord:longword):boolean;
begin
  result:=Write(Address, @aLongWord, SizeOf(aLongWord),true);
end;


end.
