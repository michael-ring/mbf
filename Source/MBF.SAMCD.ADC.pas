unit MBF.SAMCD.ADC;
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
{< Atmel SAMD series ADC functions. }

interface

{$include MBF.Config.inc}

uses
  MBF.SAMCD.Helpers,
  MBF.SAMCD.GPIO;

const
{$if defined(samd10) or defined(samd21)}
  ADCMux = PORT_PMUX_B_Val;
{$elseif defined(samc21)}
  ADCMux = PORT_PMUX_B_Val;
  ADC1Mux = PORT_PMUX_B_Val;
{$else}
  {$error Unknown Chip, please check mbf.boards.samd10.inc and then define ADC Mux here}
{$endif}

type
  TADCHelper = record helper for TADC_Registers
  private
    procedure SyncWait;
    procedure ConversionWait;
    function GetRawValue(const Channel: TPinIdentifier): longWord;
  public
    procedure Initialize;
    property GetADCResult[const Channel: TPinIdentifier]:longWord read GetRawValue;
  end;

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

type
  {$ifdef samd10}
  TADCPin = (AIN0,AIN1,AIN2,AIN3,AIN4,AIN5,AIN6,AIN7,AIN8,AIN9,None);
  {$endif}
  {$ifdef samd21}
  TADCPin = (AIN0,AIN1,AIN2,AIN3,AIN4,AIN5,AIN6,AIN7,AIN8,AIN9,AIN10,AIN11,AIN12,AIN13,AIN14,AIN15,AIN16,AIN17,AIN18,AIN19,None);
  {$endif}
  {$ifdef samc21}
  TADCPin = (AIN0,AIN1,AIN2,AIN3,AIN4,AIN5,AIN6,AIN7,AIN8,AIN9,AIN10,AIN11,None);
  TADC1Pin = (AIN0,AIN1,AIN2,AIN3,AIN4,AIN5,AIN6,AIN7,AIN8,AIN9,AIN10,AIN11,None);
  {$endif}

  TADCPins = set of TADCPin;
  {$ifdef samc21}
  TADC1Pins = set of TADC1Pin;
  {$endif}

const
  {$ifdef samd10}
  TADCPinsMap : array[TADCPin] of TPinIdentifier=(
      TNativePin.PA2,TNativePin.PA3,TNativePin.PA4,TNativePin.PA5,TNativePin.PA6,TNativePin.PA7,TNativePin.PA14,TNativePin.PA15,
      TNativePin.PA10,TNativePin.PA11,TNativePin.None);
  {$endif}

  {$ifdef samd21}
  TADCPinsMap : array[TADCPin] of TPinIdentifier=(
      TNativePin.PA2,TNativePin.PA3,TNativePin.PB8,TNativePin.PB9,TNativePin.PA4,TNativePin.PA5,TNativePin.PA6,TNativePin.PA7,
      TNativePin.PB0,TNativePin.PB1,TNativePin.PB2,TNativePin.PB3,TNativePin.PB4,TNativePin.PB5,TNativePin.PB6,TNativePin.PB7,
      TNativePin.PA8,TNativePin.PA9,TNativePin.PA10,TNativePin.PA11,TNativePin.None);
  {$endif}

  {$ifdef samc21}
  TADCPinsMap : array[TADCPin] of TPinIdentifier=(
      TNativePin.PA2,TNativePin.PA3,TNativePin.PB8,TNativePin.PB9,TNativePin.PA4,TNativePin.PA5,TNativePin.PA6,TNativePin.PA7,
      TNativePin.PA8,TNativePin.PA9,TNativePin.PA10,TNativePin.PA11,TNativePin.None);
  TADC1PinsMap : array[TADC1Pin] of TPinIdentifier=(
      TNativePin.PB0,TNativePin.PB1,TNativePin.PB2,TNativePin.PB3,TNativePin.PB8,TNativePin.PB9,TNativePin.PB4,TNativePin.PB5,
      TNativePin.PB6,TNativePin.PB7,TNativePin.PA8,TNativePin.PA9,TNativePin.None);
  {$endif}

procedure TADCHelper.SyncWait;
begin
  {$ifdef samd}
  while (GetBit(Self.STATUS,ADC_STATUS_SYNCBUSY_Pos)) do begin end;   // Wait for synchronization
  {$endif}
  {$ifdef samc}
  while (Self.SYNCBUSY>0) do begin end;   // Wait for synchronization
  {$endif}
end;

procedure TADCHelper.ConversionWait;
begin
  while (NOT GetBit(Self.INTFLAG,ADC_INTFLAG_RESRDY_Pos)) do begin end;
end;

procedure TADCHelper.Initialize;
var
  bias,linearity:word;
begin
  {$ifdef samd}
  SetBit(PM.APBCMASK,PM_APBCMASK_ADC_Pos);
  {$endif}

  {$ifdef samc}
  case {%H-}longword(@Self) of
    //{$ifdef has_adc}ADC_BASE : SetBit(MCLK.APBCMASK,MCLK_APBCMASK_ADC_Pos);{$endif}
    {$ifdef has_adc0}ADC0_BASE : SetBit(MCLK.APBCMASK,MCLK_APBCMASK_ADC0_Pos);{$endif}
    {$ifdef has_adc0}ADC1_BASE : SetBit(MCLK.APBCMASK,MCLK_APBCMASK_ADC1_Pos);{$endif}
  end;
  {$endif}

  // Switch ADC off to be sure
  ClearBit(Self.CTRLA,ADC_CTRLA_ENABLE_Pos);
  SyncWait;

  SystemCore.SetClockSourceTarget(GCLK_CLKCTRL_GEN_GCLK0,ADC_GCLK_ID);

  // Software Reset: Resets all registers in the ADC, except DBGCTRL
  SetBit(Self.CTRLA,ADC_CTRLA_SWRST_Pos);
  SyncWait;

  {$ifdef samd}
  Self.REFCTRL:=(ADC_REFCTRL_REFSEL_INTVCC1 OR ADC_REFCTRL_REFCOMP);
  {$endif}
  {$ifdef samc}
  Self.REFCTRL:=(ADC_REFCTRL_REFSEL_INTVCC2 OR ADC_REFCTRL_REFCOMP);
  {$endif}

  SyncWait;

  {$ifdef samd}
  Self.CTRLB:=(ADC_CTRLB_RESSEL_16BIT OR ADC_CTRLB_PRESCALER_DIV512);// OR ADC_CTRLB_FREERUN;
  {$endif}
  {$ifdef samc}
  Self.CTRLB:=(ADC_CTRLB_PRESCALER_DIV256);
  Self.CTRLC:=(ADC_CTRLB_RESSEL_16BIT);
  {$endif}
  SyncWait;

  Self.AVGCTRL:=ADC_AVGCTRL_SAMPLENUM_256;
  SyncWait;

  //Sample time in half clock cycles will be set before conversion, set to max (slow but high impedance)
  Self.SAMPCTRL:=$3f;
  SyncWait;

  Self.INPUTCTRL:=
    (ADC_INPUTCTRL_MUXPOS_BANDGAP_Val shl ADC_INPUTCTRL_MUXPOS_Pos) OR  // Default: Internal bandgap
    (ADC_INPUTCTRL_MUXNEG_GND_Val shl ADC_INPUTCTRL_MUXNEG_Pos)  // Default: Internal Ground
    {$ifdef samd}
    OR ADC_INPUTCTRL_GAIN_DIV2
    {$endif}
    ;
  SyncWait;

  {$ifdef samd}
  bias := ReadCal(NVM_ADC_BIASCAL_POS,NVM_ADC_BIASCAL_SIZE);
  linearity := ReadCal(NVM_ADC_LINEARITY_POS,NVM_ADC_LINEARITY_SIZE);
  PutValue(Self.CALIB,ADC_CALIB_BIAS_CAL_Msk,bias,ADC_CALIB_BIAS_CAL_Pos);
  SyncWait;
  PutValue(Self.CALIB,ADC_CALIB_LINEARITY_CAL_Msk,linearity,ADC_CALIB_LINEARITY_CAL_Pos);
  SyncWait;
  {$endif}


  //SetBit(Self.CTRLA,ADC_CTRLA_ENABLE_Pos);
  Self.CTRLA:=ADC_CTRLA_ENABLE;
  SyncWait;
end;

function TADCHelper.GetRawValue(const Channel: TPinIdentifier): longWord;
var
  aPin,aChannel:TADCPin;
begin

  result:=0;

  // find correct ADC channel
  aChannel:=TADCPin.None;
  for aPin in TADCPins do
  begin
    if TADCPinsMap[aPin]=Channel then
    begin
      aChannel:=aPin;
      break;
    end;
  end;

  if aChannel=TADCPin.None then exit;

  SyncWait;

  //Set channel to measure
  PutValue(Self.INPUTCTRL,ADC_INPUTCTRL_MUXPOS_Msk,Ord(aChannel),ADC_INPUTCTRL_MUXPOS_Pos);
  SyncWait;
  //Dump first result
  //Trigger conversion
  //Self.SWTRIG:=ADC_SWTRIG_START;
  SetBit(Self.SWTRIG,ADC_SWTRIG_START_Pos);
  // Clear result ready flag
  Self.INTFLAG := ADC_INTFLAG_RESRDY;
  SyncWait;

  //Trigger conversion
  //Self.SWTRIG:=(ADC_SWTRIG_START {OR ADC_SWTRIG_FLUSH});
  SetBit(Self.SWTRIG,ADC_SWTRIG_START_Pos);
  SyncWait;
  ConversionWait;
  // reading a result also clear the ADC.INTFLAG -> ADC_INTFLAG_RESRDY flag
  //result:=(ADC.RESULT * 1000) DIV (4096 DIV 4);
  result:=(Self.RESULT);
end;

end.
