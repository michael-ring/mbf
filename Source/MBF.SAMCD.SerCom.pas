unit MBF.SAMCD.SerCom;
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
  MBF.SAMCD.Helpers;

type
  TPortIdentifier=-1..8;

type
  TSerCom = record helper for TSercom_Registers
  public
    procedure Initialize;
    procedure Close;
    procedure SetCoreClockSource(aClockSource:longword);
    procedure Reset;
    procedure Enable;
    function Disable : boolean;
  end;

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

procedure TSerCom.Initialize;
begin
  {$ifdef samd}
  case longWord(@Self) of
    {$ifdef has_sercom0}SERCOM0_BASE: SetBit(PM.APBCMASK,PM_APBCMASK_SERCOM0_Pos);{$endif}
    {$ifdef has_sercom1}SERCOM1_BASE: SetBit(PM.APBCMASK,PM_APBCMASK_SERCOM1_Pos);{$endif}
    {$ifdef has_sercom2}SERCOM2_BASE: SetBit(PM.APBCMASK,PM_APBCMASK_SERCOM2_Pos);{$endif}
    {$ifdef has_sercom3}SERCOM3_BASE: SetBit(PM.APBCMASK,PM_APBCMASK_SERCOM3_Pos);{$endif}
    {$ifdef has_sercom4}SERCOM4_BASE: SetBit(PM.APBCMASK,PM_APBCMASK_SERCOM4_Pos);{$endif}
    {$ifdef has_sercom5}SERCOM5_BASE: SetBit(PM.APBCMASK,PM_APBCMASK_SERCOM5_Pos);{$endif}
    {$ifdef has_sercom6}SERCOM6_BASE: SetBit(PM.APBCMASK,PM_APBCMASK_SERCOM6_Pos);{$endif}
  else
    exit;
  end;
  {$endif}
  {$ifdef samc}
  case longWord(@Self) of
    {$ifdef has_sercom0}SERCOM0_BASE: SetBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM0_Pos);{$endif}
    {$ifdef has_sercom1}SERCOM1_BASE: SetBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM1_Pos);{$endif}
    {$ifdef has_sercom2}SERCOM2_BASE: SetBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM2_Pos);{$endif}
    {$ifdef has_sercom3}SERCOM3_BASE: SetBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM3_Pos);{$endif}
    {$ifdef has_sercom4}SERCOM4_BASE: SetBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM4_Pos);{$endif}
    {$ifdef has_sercom5}SERCOM5_BASE: SetBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM5_Pos);{$endif}
    {$ifdef has_sercom6}SERCOM6_BASE: SetBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM6_Pos);{$endif}
  else
    exit;
  end;
  {$endif}

  Disable;
  Reset;
end;

procedure TSerCom.Close;
begin
  Disable;
  {$ifdef samd}
  case longWord(@Self) of
    {$ifdef has_sercom0}SERCOM0_BASE: ClearBit(PM.APBCMASK,PM_APBCMASK_SERCOM0_Pos);{$endif}
    {$ifdef has_sercom1}SERCOM1_BASE: ClearBit(PM.APBCMASK,PM_APBCMASK_SERCOM1_Pos);{$endif}
    {$ifdef has_sercom2}SERCOM2_BASE: ClearBit(PM.APBCMASK,PM_APBCMASK_SERCOM2_Pos);{$endif}
    {$ifdef has_sercom3}SERCOM3_BASE: ClearBit(PM.APBCMASK,PM_APBCMASK_SERCOM3_Pos);{$endif}
    {$ifdef has_sercom4}SERCOM4_BASE: ClearBit(PM.APBCMASK,PM_APBCMASK_SERCOM4_Pos);{$endif}
    {$ifdef has_sercom5}SERCOM5_BASE: ClearBit(PM.APBCMASK,PM_APBCMASK_SERCOM5_Pos);{$endif}
    {$ifdef has_sercom6}SERCOM6_BASE: ClearBit(PM.APBCMASK,PM_APBCMASK_SERCOM6_Pos);{$endif}
  else
    exit;
  end;
  {$endif}
  {$ifdef samc}
  case longword(@Self) of
    {$ifdef has_sercom0}SERCOM0_BASE: ClearBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM0_Pos);{$endif}
    {$ifdef has_sercom1}SERCOM1_BASE: ClearBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM1_Pos);{$endif}
    {$ifdef has_sercom2}SERCOM2_BASE: ClearBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM2_Pos);{$endif}
    {$ifdef has_sercom3}SERCOM3_BASE: ClearBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM3_Pos);{$endif}
    {$ifdef has_sercom4}SERCOM4_BASE: ClearBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM4_Pos);{$endif}
    {$ifdef has_sercom5}SERCOM5_BASE: ClearBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM5_Pos);{$endif}
    {$ifdef has_sercom6}SERCOM6_BASE: ClearBit(MCLK.APBCMASK,MCLK_APBCMASK_SERCOM6_Pos);{$endif}
  else
    exit;
  end;
  {$endif}
end;

procedure TSerCom.SetCoreClockSource(aClockSource:longword);
var
  aID:longword;
begin
  case longword(@Self) of
    {$ifdef has_sercom0}SERCOM0_BASE: aID:=SERCOM0_GCLK_ID_CORE;{$endif}
    {$ifdef has_sercom1}SERCOM1_BASE: aID:=SERCOM1_GCLK_ID_CORE;{$endif}
    {$ifdef has_sercom2}SERCOM2_BASE: aID:=SERCOM2_GCLK_ID_CORE;{$endif}
    {$ifdef has_sercom3}SERCOM3_BASE: aID:=SERCOM3_GCLK_ID_CORE;{$endif}
    {$ifdef has_sercom4}SERCOM4_BASE: aID:=SERCOM4_GCLK_ID_CORE;{$endif}
    {$ifdef has_sercom5}SERCOM5_BASE: aID:=SERCOM5_GCLK_ID_CORE;{$endif}
    {$ifdef has_sercom6}SERCOM6_BASE: aID:=SERCOM6_GCLK_ID_CORE;{$endif}
  else
    exit;
  end;
  SystemCore.SetClockSourceTarget(aClockSource,aID);
end;

procedure TSerCom.Reset;
begin
  // Reset is on the same spot for every configuration, so just choose one : usart
  SetBit(USART.CTRLA,SERCOM_SWRST_Pos);
  // All syncbusy registers are at offset $1C, so just choose one ... usart ... ;-)
  {$ifdef samd20}
  WaitBitIsCleared(USART.STATUS,15);
  {$else}
  WaitBitIsCleared(USART.SYNCBUSY,0);
  {$endif}
end;

procedure TSerCom.Enable;
begin
  // Enable is on the same spot for every configuration, so just choose one : usart
  SetBit(USART.CTRLA,SERCOM_ENABLE_Pos);
  // All syncbusy registers are at offset $1C, so just choose one ... usart ... ;-)
  {$ifdef samd20}
  WaitBitIsCleared(USART.STATUS,15);
  {$else}
  WaitBitIsCleared(USART.SYNCBUSY,1);
  {$endif}
end;

function TSerCom.Disable : boolean;
begin
  //Result returns the current enable state of the SerCom
  Result := GetBit(USART.CTRLA,SERCOM_ENABLE_Pos) = 1;
  ClearBit(USART.CTRLA,SERCOM_ENABLE_Pos);
  // All syncbusy registers are at offset $1C, so just choose one ... usart ... ;-)
  {$ifdef samd20}
  WaitBitIsCleared(USART.STATUS,15);
  {$else}
  WaitBitIsCleared(USART.SYNCBUSY,1);
  {$endif}
end;

end.
