unit MBF.Kinetis.SPI;
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

{< Freescale Kinetis Chip series SPI functions. }
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.Kinetis.GPIO;

{$REGION PinDefinitions}
{$define has_spi0}
{$define has_spi1}

type
  TSPIMOSIPins = (
    PA16_SPI0 = ALT2 or TNativePin.PA16,
    PB16_SPI1 = ALT2 or TNativePin.PB16,
     PC6_SPI0 = ALT2 or TNativePin.PC6,
     {$IF DEFINED(teensy)}D11_SPI = ALT2 or TNativePin.PC6,{$ENDIF}
     PD2_SPI0 = ALT2 or TNativePin.PD2,
     PE1_SPI1 = ALT2 or TNativePin.PE1,
     PD6_SPI1 = ALT7 or TNativePin.PD6,
     {$IF DEFINED(freedom_k22f)}D11_SPI = ALT7 or TNativePin.PD6,{$ENDIF}
     PE3_SPI1 = ALT2 or TNativePin.PE3
  );

  TSPIMISOPins = (
    PA17_SPI0 = ALT2 or TNativePin.PA17,
    PB17_SPI1 = ALT2 or TNativePin.PB17,
     PC7_SPI0 = ALT2 or TNativePin.PC7,
     {$IF DEFINED(teensy)}D12_SPI = ALT2 or TNativePin.PC7,{$ENDIF}
     PD3_SPI0 = ALT2 or TNativePin.PD3,
     PE3_SPI1 = ALT2 or TNativePin.PE3,
     PD7_SPI1 = ALT7 or TNativePin.PD7,
     {$IF DEFINED(freedom_k22f)}D12_SPI = ALT7 or TNativePin.PD7,{$ENDIF}
     PE1_SPI1 = ALT7 or TNativePin.PE1
  );

  TSPISCLKPins=(
    PA15_SPI0 = ALT2 or TNativePin.PA15,
    PB11_SPI1 = ALT2 or TNativePin.PB11,
     PC5_SPI0 = ALT2 or TNativePin.PC5,
     {$IF DEFINED(teensy)}D13_SPI = ALT2 or TNativePin.PC5,{$ENDIF}
     PD1_SPI0 = ALT2 or TNativePin.PD1,
     PE2_SPI1 = ALT2 or TNativePin.PE2,
     PD5_SPI1 = ALT7 or TNativePin.PD5
     {$IF DEFINED(freedom_k22f)},D13_SPI = ALT7 or TNativePin.PD5{$ENDIF}
  );

  TSPINSSPins=(
    None=TNativePin.None,
    PA14_SPI0 = ALT2 or TNativePin.PA14,
    PB10_SPI1 = ALT2 or TNativePin.PB10,
     PC4_SPI0 = ALT2 or TNativePin.PC4,
     {$IF DEFINED(teensy)}D10_SPI = ALT2 or TNativePin.PC4,{$ENDIF}
     PD0_SPI0 = ALT2 or TNativePin.PD0,
     PE4_SPI1 = ALT2 or TNativePin.PE4,
     PD4_SPI1 = ALT7 or TNativePin.PD4
     {$IF DEFINED(freedom_k22f)},D10_SPI = ALT7 or TNativePin.PD4{$ENDIF}
  );

  {$ENDREGION}

const
  DefaultSPIFrequency=8000000;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Four=3,
    Five=4,
    Six=5,
    Seven=6,
    Eight=7,
    Nine=8,
    Ten=9,
    Eleven=10,
    Twelve=11,
    Thirteen=12,
    Fourteen=13,
    Fiveteen=14,
    Sixteen=15
  );

  TSPIRegistersHelper = record helper for TSPI_Registers
  protected
    function FindDividerValue(const Baudrate: Cardinal) : Cardinal;
    function GetFrequency: Cardinal;
    procedure SetFrequency(const Value: Cardinal);
    function GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const Value: TSPIBitsPerWord);
    function GetMode: TSPIMode;
    procedure SetMode(const Value: TSPIMode);
    //function GetNssMode: TSPINssMode;
    //procedure SetNssMode(const Value : TSPINssMode);
    procedure SetMOSIPin(const Value : TSPIMOSIPins);
    procedure SetMISOPin(const Value : TSPIMISOPins);
    procedure SetSCLKPin(const Value : TSPISCLKPins);
    procedure SetNSSPin( const Value : TSPINSSPins);
  public
    procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;

    { Reads specified number of bytes to buffer and returns actual number of bytes read. }
    function Read(const Buffer: Pointer; const BufferSize: Cardinal;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Writes specified number of bytes from buffer and returns actual number of bytes written. }
    function Write(const Buffer: Pointer; const BufferSize: Cardinal;
                   const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(ReadBuffer Pointer to data buffer where the data will be read from. If this parameter is set to @nil,
        then no reading will be done.)
      @param(WriteBuffer Pointer to data buffer where the data will be written to. If this parameter is set to @nil,
        then no writing will be done.)
      @param(BufferSize The size of read and write buffers in bytes.)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Number of bytes that were actually transferred.) }
    function Transfer(const ReadBuffer, WriteBuffer: Pointer; const BufferSize: Cardinal;
                      const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Buffer Pointer to data buffer where the data will be read from and at the same time written to,
        overwriting its contents.)
      @param(BufferSize The size of buffer in bytes.)
      @returns(Number of bytes that were actually transferred.) }
    function Transfer(const Buffer: Pointer; const BufferSize: Cardinal;
                      const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Value  Word sized Data Value that weill get sent over SPI When in 8 Bit Mode then 2 bytes will be transfered)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Word Data that was received. When in 8 Bit Mode then 2 bytes will be combined in 1 word) }
    function TransferWord(const Value : word; const SoftNSSPin : TPinIdentifier = TNativePin.None): word;

    //property NssMode : TSPINssMode  read GetNssMode write SetNssMode;
    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
    property Frequency : Cardinal read getFrequency write setFrequency;
    property Mode : TSPIMode read getMode write setMode;
    property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
  end;

  {$IF DEFINED(HAS_ARDUINOPINS)}
    {$IF DEFINED(teensy)}
  var
    SPI : TSPI_Registers absolute SPI0_BASE;
    {$ELSEIF DEFINED(freedom_k22f)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
    {$ELSE}
      {$ERROR This Device has Arduinopins defined but is not yet known to MBF.Kinetis.UART}
    {$ENDIF}
  {$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.Kinetis.SystemCore;

const
  SPIBaudRatePrescaler : array[0..3] of byte = (2,3,5,7);
  SPIBaudRateScaler : array[0..15] of word = (2,4,6,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768);

procedure TSPIRegistersHelper.Initialize;
begin
  // Enable Clock
  case longWord(@Self) of
    SPI0_BASE : SIM.SCGC6 := SIM.SCGC6 or (1 shl 12);
    SPI1_BASE : SIM.SCGC6 := SIM.SCGC6 or (1 shl 13);
  end;

  // first, make sure the module is enabled to allow writes to certain registers
  self.MCR := self.MCR and not (1 shl 14);

  // Halt all transfers
  self.MCR := self.MCR or (1 shl 0);

  // set the registers to their default states
  // clear the status bits (write-1-to-clear)
  self.SR := (1 shl 31) or (1 shl 28) or (1 shl 27) or (1 shl 25) or (1 shl 19) or (1 shl 17);

  self.TCR := 0;

  // Set Baudrate first
  self.CTAR[0] := FindDividerValue(DefaultSPIFrequency);
  self.CTAR[1] := 0;
  self.RSER := 0;

  // Clear out PUSHR register. Since DSPI is halted, nothing should be transmitted. Be
  // sure the flush the FIFOs afterwards

  self.PUSHR := 0;

  // flush the fifos
  self.MCR := self.MCR or (1 shl 11);
  self.MCR := self.MCR or (1 shl 10);

  // Now set MCR to default value, which disables module: set MDIS and HALT, clear other bits
  self.MCR := (1 shl 14) or (1 shl 0);

  //DFF Switch between 8/16 Bits Mode
  //if FBitsPerWord = TSPIBitsPerWordEx.Sixteen then
  //  pSPI^.CTAR[0] := pSPI^.CTAR[0] and not (%1111 shl 27) or (15 shl 27) //This means 16
  //else
  //Initially set Bits to 8
  self.CTAR[0] := self.CTAR[0] and not (%1111 shl 27) or (7 shl 27); //This means 8

  self.CTAR[0] := self.CTAR[0] and not (1 shl 24); //MSB First

  self.CTAR[0] := self.CTAR[0] and not (1 shl 26);
  self.CTAR[0] := self.CTAR[0] and not (1 shl 25);

  //Enable Module as Master
  self.MCR := 1 shl 31;
  self.MCR := self.MCR or (1 shl 16)  //Configure Active Low
end;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                                          const AMisoPin : TSPIMISOPins;
                                          const ASCLKPin : TSPISCLKPins;
                                          const ANSSPin  : TSPINSSPins);
begin
  Initialize;

  //Set configuration as defined by user

  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode(LongWord(AMOSIPin) shr 8);
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode(LongWord(AMISOPin) shr 8);
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode(LongWord(ASCLKPin) shr 8);
  GPIO.PinMode[longWord(ANSSPin)  and $ff] := TPinMode(longWord(ANSSPin) shr 8);
end;

function TSPIRegistersHelper.FindDividerValue(const Baudrate: Cardinal): Cardinal;
var
  prescaler, bestPrescaler,
  scaler, bestScaler,
  dbr, bestDbr,
  realBaudrate,
  diff, min_diff : longWord;
  sysClock : longWord;

begin
  // find combination of prescaler and scaler resulting in baudrate closest to the
  // requested value
  min_diff := $FFFFFFFF;
  bestPrescaler := 0;
  bestScaler := 0;
  bestDbr := 1;
  sysClock := SystemCore.GetSystemClockFrequency;
 // In all for loops, if min_diff = 0, the exit for loop*/
  for prescaler := 0 to 3 do
  begin
    for scaler := 0 to 15 do
    begin
      for dbr := 1 to 2 do
      begin
        realBaudrate := ((sysClock * dbr) div
                        (SPIBaudratePrescaler[prescaler] * SPIBaudrateScaler[scaler]));

        // calculate the baud rate difference based on the conditional statement
        // that states that the calculated baud rate must not exceed the desired baud rate

        if (baudrate >= realBaudrate) then
        begin
          diff := baudrate-realBaudrate;
          if (min_diff > diff) then
          begin
            // a better match found
            min_diff := diff;
            bestPrescaler := prescaler;
            bestScaler := scaler;
            bestDbr := dbr;
          end;
        end;
      end;
    end;
  end;
  // write the best dbr, prescalar, and baud rate scalar to the CTAR */
  result := ((bestDbr - 1)) shl 31 or (bestPrescaler shl 16) or bestScaler;
  //pSPI^.CTAR[0] := pSPI^.CTAR[0] and not (1 shl 31) or (bestDbr - 1);
  //pSPI^.CTAR[0] := pSPI^.CTAR[0] and not (%11 shl 16) or bestPrescaler;
  //pSPI^.CTAR[0] := pSPI^.CTAR[0] and not (%1111 shl 0) or bestScaler;
end;

function TSPIRegistersHelper.GetFrequency: Cardinal;
var
  dbr,prescaler,scaler : byte;
begin
  dbr := (self.CTAR[0] shr 31)+1;
  prescaler := (self.CTAR[0] shr 16) and %11;
  scaler := (self.CTAR[0] shr 0) and %1111;
  Result := ((SystemCore.getSystemClockFrequency * dbr) div (SPIBaudratePrescaler[prescaler] * SPIBaudrateScaler[scaler]));
end;

procedure TSPIRegistersHelper.SetFrequency(const Value: Cardinal);
begin
  self.CTAR[0] := self.CTAR[0] and (not ((%1 shr 31) or (%11 shr 16) or %1111)) or FindDividerValue(Value);
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord((self.CTAR[0] shr 27) and %1111);
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const Value: TSPIBitsPerWord);
begin
  self.CTAR[0] := self.CTAR[0] and (not (%1111 shr 27)) or longWord(Value);
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode((self.CTAR[0] shr 25) and %11);
end;

procedure TSPIRegistersHelper.SetMode(const Value: TSPIMode);
begin
  self.CTAR[0] := self.CTAR[0] and (not (%11 shr 25)) or longWord(Value);
end;

function TSPIRegistersHelper.TransferWord(const Value : word;const SoftNSSPin : TPinIdentifier = TNativePin.None): word;
begin
  //wait for TXF to go high (no more data to shift out)
  //while pSPI^.SR and (1 shl 31) = 0 do
  //  ;
  self.SR := self.SR or (1 shl 31);

  //Take the NSS Pin Low in software Mode (start transfer)
    if SoftNSSPin <> TNativePin.None then
      GPIO.PinLevel[SoftNSSPin] := TPinLevel.Low;

  self.PUSHR := (1 shl 16) or Value;

  // Wait till TCF sets */
  while self.SR and (1 shl 31) = 0 do
    ;

  // Take NSS High again in Software Mode (end of Transfer)
    if SoftNSSPin <> TNativePin.None then
      GPIO.PinLevel[SoftNSSPin] := TPinLevel.High;
  Result :=  self.POPR;
end;

function TSPIRegistersHelper.Transfer(const ReadBuffer, WriteBuffer: Pointer; const BufferSize: Cardinal; const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
var
  ReadBytes,WriteBytes : cardinal;
begin
  ReadBytes := 0;
  WriteBytes := 0;

  //wait for TXF to go high (no more data to shift out)
  //while pSPI^.SR and (1 shl 31) = 0 do
  //  ;
  self.SR := self.SR or (1 shl 31);

  //read data from rx buffer if available and discard it
  //if pSPI^.SR and (1 shl 0) = 1 then
  Result :=  self.POPR;

  while ((ReadBuffer <> nil) and (ReadBytes < BufferSize)) or ((WriteBuffer <> nil) and (WriteBytes < BufferSize)) do
  begin
    if SoftNSSPin <> TNativePin.None then
      GPIO.PinLevel[SoftNSSPin] := TPinLevel.Low;
    if WriteBuffer <> nil then
    begin
      if ((self.CTAR[0] shr 27) and %1111) > 8 then
      begin
        self.PUSHR := (1 shl 16) or PWord(PByte(WriteBuffer) + WriteBytes)^;
        Inc(WriteBytes);
        Inc(WriteBytes);
      end
      else
      begin
        self.PUSHR := (1 shl 16) or PByte(PByte(WriteBuffer) + WriteBytes)^;
        Inc(WriteBytes);
      end;
    end
    else
      self.PUSHR := (1 shl 16) or $ff; //We need to send dummy data to be able to receive

    // RXNE Wait until data is completely shifted in
    while self.SR and (1 shl 31) = 0 do
      ;

    Result :=  self.POPR;

    if ReadBuffer <> nil then
    begin // Get data from Read FIFOs.
      if (ReadBytes < BufferSize) and ((ReadBuffer <> WriteBuffer) or (ReadBytes < WriteBytes)) then
      begin
        if ((self.CTAR[0] shr 27) and %1111) > 8 then
        begin
          PWord(PByte(ReadBuffer) + ReadBytes)^ := result;
          Inc(WriteBytes);
          Inc(WriteBytes);
        end
        else
        begin
          PByte(PByte(ReadBuffer) + ReadBytes)^ := result;
          Inc(ReadBytes);
        end;
      end;
    end;
    if SoftNSSPin <> TNativePin.None then
      GPIO.PinLevel[SoftNSSPin] := TPinLevel.High;
  end;

  if WriteBytes > ReadBytes then
    Result := WriteBytes
  else
    Result := ReadBytes;
end;

procedure TSPIRegistersHelper.SetMOSIPin(const value : TSPIMOSIPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode(longWord(value) shr 8);
end;

procedure TSPIRegistersHelper.setMISOPin(const value : TSPIMISOPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode(longWord(value) shr 8);
end;

procedure TSPIRegistersHelper.setSCLKPin(const value : TSPISCLKPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode(longWord(value) shr 8);
end;

procedure TSPIRegistersHelper.setNSSPin(const value : TSPINSSPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode(longWord(value) shr 8);
end;

function TSPIRegistersHelper.Read(const Buffer: Pointer; const BufferSize: Cardinal;
                                  const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
begin
  Result := Transfer(Buffer, nil, BufferSize, SoftNSSPin);
end;

function TSPIRegistersHelper.Write(const Buffer: Pointer; const BufferSize: Cardinal;
                                   const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
begin
  Result := Transfer(nil, Buffer, BufferSize, SoftNSSPin);
end;

function TSPIRegistersHelper.Transfer(const Buffer: Pointer; const BufferSize: Cardinal;
                                      const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
begin
  Result := Transfer(Buffer, Buffer, BufferSize, SoftNSSPin);
end;

{$ENDREGION}

end.
