unit MBF.SAMCD.SystemCore;
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

{< Atmel SAMD series core functions. }

interface

{$INCLUDE MBF.Config.inc}

uses
  MBF.SystemCore;

const
{$if defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21) }
  OSC8MFrequency     = 8000000;
  ResetCPUFrequency  = (OSC8MFrequency shr 3);
  MaxCPUFrequency    = 48000000;
  DefaultPrescaler   = 0;
{$elseif defined(samc20) or defined(samc21) }
  OSC48MFrequency    = 48000000;
  ResetCPUFrequency  = (OSC48MFrequency DIV 12);
  MaxCPUFrequency    = 48000000;
  DefaultDivider     = 6;
{$else}
  {$error Unknown Chip, please check mbf.boards.samxxx.inc and then define maximum CPU Frequency here}
{$endif}

var
  FCPUFrequency : longWord = ResetCPUFrequency;

type
  TClockType = (RC,XTAL32_PLL,RC_PLL{$ifdef has_fdpll},XTAL32_FPLL,RC_FPLL{$endif has_fdpll});

  TSAMCDSystemCore = record helper for TSystemCore
  type
    TOSCParameters = record
    FREQUENCY : longWord;
    USBPRE : integer;
    PREDIV : byte;
    PLLMUL : byte;
    AHBPRE : byte;
  end;
  private
    procedure ConfigureSystem;
    function GetSysTickClockFrequency : Cardinal;
  public
    procedure Initialize;
    function GetSystemClockFrequency: Cardinal;
    function getMaxCPUFrequency : Cardinal;
    procedure SetClockSourceTarget(aClockSource,aClockTarget:longword);
    function GetCPUFrequency: Cardinal;
    procedure SetCPUFrequency(const Value: Cardinal; aClockType : TClockType = TClockType.RC);
    property CPUFrequency: Cardinal read GetCPUFrequency write SetCPUFrequency;
  end;

var
  SystemCore : TSystemCore;

implementation

uses
  MBF.SAMCD.Helpers,
  MBF.BitHelpers;

{$REGION 'TSystemCore'}

procedure TSAMCDSystemCore.Initialize;
begin
  FCPUFrequency := ResetCPUFrequency;
  ConfigureSystem;
  ConfigureTimer;
end;

function TSAMCDSystemCore.GetSystemClockFrequency: Cardinal;
begin
  Result := FCPUFrequency;
end;

function TSAMCDSystemCore.GetSysTickClockFrequency : Cardinal; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
  Result := GetSystemClockFrequency;
end;

procedure TSAMCDSystemCore.ConfigureSystem;
begin
  {$ifdef SAMD}
  //Run at 8MHz
  SetBitsMasked(SysCtrl.OSC8M,DefaultPrescaler,SYSCTRL_OSC8M_PRESC_Msk,SYSCTRL_OSC8M_PRESC_Pos);
  //Enable clock
  SetBit(SysCtrl.OSC8M,SYSCTRL_OSC8M_ENABLE_Pos);

  FCPUFrequency := OSC8MFrequency;

  //Overwriting the default value of the NVMCTRL.CTRLB.MANW bit (errata reference 13134) */
  SetBit(NvmCtrl.CTRLB,NVMCTRL_CTRLB_MANW_Pos);

  {$ifdef TODO_has_usb}
  /* Change default QOS values to have the best performance and correct USB behaviour */
  SBMATRIX->SFR[SBMATRIX_SLAVE_HMCRAMC0].reg = 2;
  #if defined(ID_USB)
  USB->DEVICE.QOSCTRL.bit.CQOS = 2;
  USB->DEVICE.QOSCTRL.bit.DQOS = 2;
  #endif
  DMAC->QOSCTRL.bit.DQOS = 2;
  DMAC->QOSCTRL.bit.FQOS = 2;
  DMAC->QOSCTRL.bit.WRBQOS = 2;
  {$endif has_usb}

  {$ifdef samd10}
  //SAMD10 errata
  //The SYSTICK calibration value is incorrect. Errata reference: 14157
  //The correct SYSTICK calibration value is 0x40000000
  SysTick.Calib:=$40000000;
  {$endif}

  {$endif samd}

  {$ifdef samc}
  //Run at 8MHz
  OSCCTRL.OSC48MDIV:=(OSCCTRL_OSC48MDIV_DIV_Msk AND ((DefaultDivider-1) shl OSCCTRL_OSC48MDIV_DIV_Pos));
  //Enable clock
  OSCCTRL.OSC48MCTRL:=OSCCTRL_OSC48MCTRL_ENABLE;

  FCPUFrequency := (OSC48MFrequency DIV DefaultDivider);
  {$endif samc}
end;

function TSAMCDSystemCore.GetCPUFrequency: Cardinal;
begin
  result:=FCPUFrequency;
end;

{$ifdef samc}
procedure TSAMCDSystemCore.SetCPUFrequency(const Value: Cardinal; aClockType : TClockType = TClockType.RC);
const
  PLLREFCLOCK=1;
  PLLREFCLOCK32=2;
procedure WaitGLK;
begin
  while (GCLK.SYNCBUSY>0) do begin end; // Wait for synchronization
end;
procedure WaitDPLLSync;
begin
  while (OSCCTRL.DPLLSYNCBUSY>0) do begin end; // Wait for synchronization
end;
var
  ValidPLLFrequency:longword;
  GCLKGEN0InputFrequency:longword;
  OSC48M_divider:word;
  GEN0_divider:word;
  WaitStates:byte;
  PllFactInt:longword;
  PllFactFra:longword;
begin

  if (FCPUFrequency<>Value) then
  begin

    GEN0_divider:=1;
    OSC48M_divider:=DefaultDivider;

    if aClockType=TClockType.RC then
    begin
      OSC48M_divider:=(OSC48MFrequency DIV Value);
      if OSC48M_divider<1 then OSC48M_divider:=1;
      if (OSC48M_divider>16) then OSC48M_divider:=16;
      GCLKGEN0InputFrequency:=(OSC48MFrequency DIV OSC48M_divider);
    end;

    if (aClockType = TClockType.RC_PLL) OR (aClockType = TClockType.XTAL32_PLL) then
    begin
      if Value<48000000 then
        ValidPLLFrequency:=48000000
      else
      if Value>96000000 then
        ValidPLLFrequency:=96000000
      else
      begin
        ValidPLLFrequency:=Value;
        //As the CPU frequency must be <48MHz, always divide by 2 !!
        //Todo ... does not work yet.
        //DPLLPRESC could also be used.
        //GEN0_divider:=2;
      end;
      if (aClockType = TClockType.XTAL32_PLL) then
      begin
        PllFactInt := (ValidPLLFrequency DIV 32768) - 1;
        PllFactFra := (32*(ValidPLLFrequency - 32768*(PllFactInt+1))) DIV 32768;
        GCLKGEN0InputFrequency:=32768*(PllFactInt+1) + ((32768*PllFactFra) DIV 32);
      end;
      if (aClockType = TClockType.RC_PLL) then
      begin
        //the PLL is run from OSC48M on 8MHz that is divided by 256 to produce a 31.250kHz clock for the PLL
        PllFactInt := (ValidPLLFrequency DIV 31250) - 1;
        PllFactFra := (32*(ValidPLLFrequency - 31250*(PllFactInt+1))) DIV 31250;
        GCLKGEN0InputFrequency:=31250*(PllFactInt+1) + ((31250*PllFactFra) DIV 32);
      end;
    end;

    // GEN0    : 8 division factor bits  - DIV[7:0]
    // GEN1    : 16 division factor bits - DIV[15:0]
    // GEN2-11 : 5 division factor bits  - DIV[4:0]
    GEN0_divider:=(GCLKGEN0InputFrequency DIV Value);
    if (GEN0_divider<1) then GEN0_divider:=1;
    if (GEN0_divider>255) then GEN0_divider:=255;
    FCPUFrequency:=(GCLKGEN0InputFrequency DIV GEN0_divider);

    WaitStates:=0;
    if (FCPUFrequency>=22000000)  then Inc(WaitStates);
    if (FCPUFrequency>=44000000)  then Inc(WaitStates);
    if (FCPUFrequency>=67000000)  then Inc(WaitStates);
    if (FCPUFrequency>=89000000)  then Inc(WaitStates);
    if (FCPUFrequency>=111000000) then Inc(WaitStates);
    if (FCPUFrequency>=120000000) then Inc(WaitStates);

    // Enable the bus clock for the clock system.
    SetBit(MCLK.APBCMASK,MCLK_APBAMASK_GCLK_Pos);

    //Make a software reset of the clock system.
    //We need the OSC48M, because this clock is used after a reset
    //So, enable OSC48M oscillator
    OSCCTRL.OSC48MCTRL:=OSCCTRL_OSC48MCTRL_ENABLE;
    //Run OSC48M at 8MHz
    OSCCTRL.OSC48MDIV:=(OSCCTRL_OSC48MDIV_DIV_Msk AND ((DefaultDivider-1) shl OSCCTRL_OSC48MDIV_DIV_Pos));
    while (OSCCTRL.OSC48MSYNCBUSY>0) do begin end;                         // Wait until synced
    //Perform reset
    SetBit(GCLK.CTRLA,GCLK_CTRL_SWRST_Pos);
    WaitBitIsCleared(GCLK.CTRLA,GCLK_CTRL_SWRST_Pos); // Wait for synchronization
    //System now runs on OSC48M at 8MHz.

    // Set waitstates
    NVMCTRL.CTRLB:=(NVMCTRL_CTRLB_RWS_Msk AND ((WaitStates) shl NVMCTRL_CTRLB_RWS_Pos));

    if (aClockType = TClockType.RC) then
    begin
      OSCCTRL.OSC48MDIV  := (OSCCTRL_OSC48MDIV_DIV_Msk AND ((OSC48M_divider-1) shl OSCCTRL_OSC48MDIV_DIV_Pos));
      OSCCTRL.OSC48MSTUP := $07; // ~21uS startup;

      while (OSCCTRL.OSC48MSYNCBUSY>0) do begin end;                         // Wait until synced
      while ((OSCCTRL.STATUS AND OSCCTRL_STATUS_OSC48MRDY)=0) do begin end;  // Wait until ready

      // Default setting for GEN0
      GCLK.GENCTRL[0] :=
        GCLK_GENCTRL_SRC_OSC48M OR
        GCLK_GENCTRL_GENEN OR
        (GCLK_GENCTRL_DIV_Msk AND ((GEN0_divider) shl GCLK_GENCTRL_DIV_Pos));
      WaitGLK;
    end;

    if (aClockType = TClockType.RC_PLL) then
    begin
      // Default setting for PLLREFCLOCK: feed with 8Mhz, divide by 256 to get 31.250kHz to feed PLL
      GCLK.GENCTRL[1] :=
        GCLK_GENCTRL_SRC_OSC48M OR
        GCLK_GENCTRL_GENEN OR
        (GCLK_GENCTRL_DIV_Msk AND ((256) shl GCLK_GENCTRL_DIV_Pos));
      WaitGLK;

      SetClockSourceTarget(1,0); //GCLK Generator 1 -> GCLK_DPLL [0] = FDPLL96M input clock source for reference
    end;

    if (aClockType = TClockType.XTAL32_PLL) then
    begin
      //Enable the 32.768 khz external crystal oscillator
      OSC32KCTRL.XOSC32K:=((OSC32KCTRL_XOSC32K_STARTUP_Msk AND ((5) shl OSC32KCTRL_XOSC32K_STARTUP_Pos)) OR OSC32KCTRL_XOSC32K_XTALEN OR OSC32KCTRL_XOSC32K_EN32K OR OSC32KCTRL_XOSC32K_ENABLE);

      //Wait for the crystal oscillator to start up
      WaitBitIsSet(OSC32KCTRL.STATUS,OSC32KCTRL_STATUS_XOSC32KRDY_Pos); // Wait for synchronization
    end;

    if (aClockType = TClockType.RC_PLL) OR (aClockType = TClockType.XTAL32_PLL) then
    begin
      OSCCTRL.DPLLCTRLA:=0;//disable DPLL

      OSCCTRL.DPLLRATIO:=(PllFactFra shl 16) + PllFactInt;
      WaitDPLLSync;

      if (aClockType = TClockType.XTAL32_PLL) then
      begin
        OSCCTRL.DPLLCTRLB:=
          OSCCTRL_DPLLCTRLB_LBYPASS OR  // CLK_DPLL0 output clock is always on, and not dependent on frequency lock
          (OSCCTRL_DPLLCTRLB_REFCLK_Msk AND ((0) shl OSCCTRL_DPLLCTRLB_REFCLK_Pos)) //XOSC32K clock reference
        ;
      end;

      if (aClockType = TClockType.RC_PLL) then
      begin
        OSCCTRL.DPLLCTRLB:=
          OSCCTRL_DPLLCTRLB_LBYPASS OR  // CLK_DPLL0 output clock is always on, and not dependent on frequency lock
          (OSCCTRL_DPLLCTRLB_REFCLK_Msk AND ((2) shl OSCCTRL_DPLLCTRLB_REFCLK_Pos)) //GCLK clock reference
        ;
      end;

      SetBit(OSCCTRL.DPLLCTRLA,1);//enable DPLL
      WaitDPLLSync;

      WaitBitIsSet(OSCCTRL.DPLLSTATUS,0);//DPLLSTATUS_LOCK
      WaitBitIsSet(OSCCTRL.DPLLSTATUS,1);//DPLLSTATUS_CLKRDY

      // Default setting for GEN0
      GCLK.GENCTRL[0] :=
        //GCLK_GENCTRL_SRC_XOSC32K OR
        GCLK_GENCTRL_SRC_DPLL96M OR
        GCLK_GENCTRL_GENEN OR
        (GCLK_GENCTRL_DIV_Msk AND ((GEN0_divider) shl GCLK_GENCTRL_DIV_Pos));
      WaitGLK;
    end;

    //Switch off XTAL32 if it is not in use anymore
    if (NOT ((aClockType = TClockType.XTAL32_PLL))) then
    begin
      OSC32KCTRL.XOSC32K:=0;
    end;

    //Switch off OSC48M if it is not in use anymore
    if (NOT ((aClockType = TClockType.RC) OR (aClockType = TClockType.RC_PLL))) then
    begin
      OSCCTRL.OSC48MCTRL:=0;
    end;

    //Switch off DPLL96M if it is not in use anymore
    if (NOT ((aClockType = TClockType.RC_PLL) OR (aClockType = TClockType.XTAL32_PLL))) then
    begin
      OSCCTRL.DPLLCTRLA:=0;//disable DPLL
    end;

    ConfigureTimer;

  end;

end;
{$endif}

{$ifdef samd}
procedure TSAMCDSystemCore.SetCPUFrequency(const Value: Cardinal; aClockType : TClockType = TClockType.RC);
const
  PLLREFCLOCK=3;
procedure WaitGLK;
begin
  WaitBitIsCleared(GCLK.STATUS,GCLK_STATUS_SYNCBUSY_Pos); // Wait for synchronization
end;
procedure WaitDFLLRDY;
begin
  WaitBitIsSet(SYSCTRL.PCLKSR,SYSCTRL_PCLKSR_DFLLRDY_Pos); // Wait for synchronization
end;
var
  ValidPLLFrequency:longword;
  GCLKGEN0InputFrequency:longword;
  OSC8M_divider:word;
  OSC8M_prescaler:word;
  WaitStates:byte;
  GEN0_divider:word;
  coarse,fine:longword;
  PllFactInt:longword;
  PllFactFra:longword;
begin

  //GEN0 is the CPU clock source
  //GEN3 (PLLREFCLOCK) is used as the intermediate clock source

  if (FCPUFrequency<>Value) then
  begin

    GEN0_divider:=1;
    OSC8M_divider:=1;

    // Fractional PLL (FDPLL96M) can output between 48MHz and 96MHz
    // Fractional PLL (FDPLL96M) wants an input of between 32kHz and 2000kHz
    {$ifdef has_fdpll}
    if (aClockType = TClockType.XTAL32_FPLL) OR (aClockType = TClockType.RC_FPLL) then
    begin
      if Value<48000000 then
        ValidPLLFrequency:=48000000
      else
      if Value>96000000 then
        ValidPLLFrequency:=96000000
      else
      begin
        ValidPLLFrequency:=Value;
        //As the CPU frequency must be <48MHz, always divide by 2 !!
        //Todo ... does not work yet
        //GEN0_divider:=2;
      end;

      //Calculate PLL settings
      if (aClockType = TClockType.XTAL32_FPLL) then
      begin
        // XTAL32 has (normally) a crystal of 32.768kHz
        PllFactInt := (ValidPLLFrequency DIV 32768) - 1;
        PllFactFra := (32*(ValidPLLFrequency - 32768*(PllFactInt+1))) DIV 32768;
        GCLKGEN0InputFrequency:=32768*(PllFactInt+1) + ((32768*PllFactFra) DIV 32);
      end
      else
      begin
        // Lets choose 1MHz as direct input into FPLL from OSC8M (8MHz) with the prescaler
        OSC8M_divider:=8;
        PllFactInt := (ValidPLLFrequency DIV 1000000) - 1;
        PllFactFra := (32*(ValidPLLFrequency - 1000000*(PllFactInt+1))) DIV 1000000;
        GCLKGEN0InputFrequency:=1000000*(PllFactInt+1) + ((1000000*PllFactFra) DIV 32);
      end;
    end;
    {$endif has_fdpll}

    // Normal PLL (DFLL48M) can only output 48MHz
    // Normal PLL (DFLL48M) wants an input of between 0.7kHz and 33kHz (optimum:32.768kHz)
    if (aClockType = TClockType.XTAL32_PLL) OR (aClockType = TClockType.RC_PLL) then
    begin
      if (aClockType = TClockType.RC_PLL) then
      begin
        //Set OSC8M at 1MHz : divide later by 32 (by GCLK3) to get 31.250kHz
        OSC8M_divider:=8;
        PllFactInt:=(48000000 DIV 31250)-1;
        GCLKGEN0InputFrequency:=31250*(PllFactInt+1);
      end;
      if (aClockType = TClockType.XTAL32_PLL) then
      begin
        PllFactInt:=(48000000 DIV 32768)-1;
        GCLKGEN0InputFrequency:=32768*(PllFactInt+1);
      end;
    end;

    if (aClockType = TClockType.RC) then
    begin
      OSC8M_divider:=(OSC8MFrequency DIV Value);
      if OSC8M_divider<1 then OSC8M_divider:=1;
      if (OSC8M_divider>2) then OSC8M_divider:=2;
      GCLKGEN0InputFrequency:=(OSC8MFrequency DIV OSC8M_divider);
    end;

    // GEN0    : 8 division factor bits  - DIV[7:0]
    // GEN1    : 16 division factor bits - DIV[15:0]
    // GEN2    : 5 division factor bits  - DIV[4:0]
    // GEN3-8  : 8 division factor bits  - DIV[7:0]
    GEN0_divider:=(GCLKGEN0InputFrequency DIV Value);
    if (GEN0_divider<1) then GEN0_divider:=1;
    if (GEN0_divider>255) then GEN0_divider:=255;
    FCPUFrequency:=(GCLKGEN0InputFrequency DIV GEN0_divider);

    // Enable the bus clock for the clock system.
    SetBit(PM.APBAMASK,PM_APBAMASK_GCLK_Pos);

    //Make a software reset of the clock system.
    //We need the OSC8M, because this clock is used after a reset
    //So, enable OSC8M oscillator
    SetBitsMasked(SysCtrl.OSC8M,DefaultPrescaler,SYSCTRL_OSC8M_PRESC_Msk,SYSCTRL_OSC8M_PRESC_Pos);
    ClearBit(SYSCTRL.OSC8M,SYSCTRL_OSC8M_ONDEMAND_Pos);
    SetBit(SYSCTRL.OSC8M,SYSCTRL_OSC8M_ENABLE_Pos);
    WaitBitIsSet(SYSCTRL.OSC8M,SYSCTRL_OSC8M_ENABLE_Pos);
    //Perform reset
    SetBit(GCLK.CTRL,GCLK_CTRL_SWRST_Pos);
    WaitBitIsCleared(GCLK.CTRL,GCLK_CTRL_SWRST_Pos); // Wait for synchronization
    WaitGLK;
    //System now runs on OSC8M at 8MHz.

    //Set the divisor of generic (CPU) clock 0 in an early stage.
    GCLK.GENDIV:=
      (GCLK_GENDIV_ID_Msk AND ((0) shl GCLK_GENDIV_ID_Pos)) OR // Select generator 0
      (GCLK_GENDIV_DIV_Msk AND ((GEN0_divider) shl GCLK_GENDIV_DIV_Pos)); //  // Set the division factor
    WaitGLK;

    WaitStates:=0;
    if (FCPUFrequency>=14000000)  then Inc(WaitStates);
    if (FCPUFrequency>=28000000)  then Inc(WaitStates);
    if (FCPUFrequency>=42000000)  then Inc(WaitStates);
    if (FCPUFrequency>=48000000)  then Inc(WaitStates);
    //Set waitstates in an early stage
    SetBitsMasked(NVMCTRL.CTRLB,WaitStates,NVMCTRL_CTRLB_RWS_Msk,NVMCTRL_CTRLB_RWS_Pos);

    // Set OSC8M_prescaler
    if (aClockType = TClockType.RC) OR (aClockType = TClockType.RC_PLL) {$ifdef has_fdpll}OR (aClockType = TClockType.RC_FPLL){$endif has_fdpll} then
    begin
      OSC8M_prescaler:=0;
      while (OSC8M_divider>1) do
      begin
        Inc(OSC8M_prescaler);
        OSC8M_divider:=(OSC8M_divider shr 1);
      end;
      //Set OSC8M prescaler
      SetBitsMasked(SysCtrl.OSC8M,OSC8M_prescaler,SYSCTRL_OSC8M_PRESC_Msk,SYSCTRL_OSC8M_PRESC_Pos);
      //No need to enable OSC8M: it is already enabled !
      //See reset code above: after a reset, the system NEEDS to be clocked by OSC8M !!!
    end;

    if (aClockType = TClockType.XTAL32_PLL){$ifdef has_fdpll} OR (aClockType = TClockType.XTAL32_FPLL){$endif has_fdpll} then
    begin
      //Set the 32.768 khz external crystal oscillator
      SYSCTRL.XOSC32K:=((SYSCTRL_XOSC32K_STARTUP_Msk AND ((5) shl SYSCTRL_XOSC32K_STARTUP_Pos)) OR SYSCTRL_XOSC32K_XTALEN OR SYSCTRL_XOSC32K_EN32K);
      //Enable the 32.768 khz external crystal oscillator
      //Separate call, as described in chapter 15.6.3
      SetBit(SYSCTRL.XOSC32K,SYSCTRL_XOSC32K_ENABLE_Pos);
      //Wait for the crystal oscillator to start up
      WaitBitIsSet(SysCtrl.PCLKSR,SYSCTRL_PCLKSR_XOSC32KRDY_Pos);
    end;

    // Finalize OSC8M settings for GCLK0 for clocktype RC
    if (aClockType = TClockType.RC) then
    begin
      // 2. Switch generic clock 0 to the OSC8M
      GCLK.GENCTRL:=
        (GCLK_GENCTRL_ID_Msk AND ((0) shl GCLK_GENCTRL_ID_Pos)) OR // Select generator 0
        GCLK_GENCTRL_SRC_OSC8M OR // Select source OSC8M
        GCLK_GENCTRL_IDC OR // Set improved duty cycle 50/50
        GCLK_GENCTRL_GENEN; // Enable this generic clock generator
    end;

    if (aClockType = TClockType.RC_PLL) OR (aClockType = TClockType.XTAL32_PLL) then
    begin
      // Clear interrupt flags
      SYSCTRL.INTFLAG := SYSCTRL_INTFLAG_BOD33RDY OR SYSCTRL_INTFLAG_BOD33DET OR SYSCTRL_INTFLAG_DFLLRDY;

      //ClearBit(SysCtrl.DFLLCTRL,SYSCTRL_DFLLCTRL_ENABLE_Pos);
      //WaitDFLLRDY;

      if (aClockType = TClockType.RC_PLL) then
      begin
        // Set the division factor of GCLK3 to 32, which reduces the 1MHz OSC8M source to 31.250kHz
        GCLK.GENDIV:=
          (GCLK_GENDIV_ID_Msk AND ((PLLREFCLOCK) shl GCLK_GENDIV_ID_Pos)) OR     // Select generator 3
          (GCLK_GENDIV_DIV_Msk AND ((32) shl GCLK_GENDIV_DIV_Pos));                 // Set the division factor to 32
        WaitGLK;

        // Create generic clock generator 3 for the 31.250KHz signal of the DFLL
        GCLK.GENCTRL:=(
          (GCLK_GENCTRL_ID_Msk AND ((PLLREFCLOCK) shl GCLK_GENCTRL_ID_Pos)) OR   // Select generator 3
          GCLK_GENCTRL_SRC_OSC8M OR  // Select source OSC8M
          GCLK_GENCTRL_IDC OR        // Set improved duty cycle 50/50
          GCLK_GENCTRL_GENEN);       // Enable this generic clock generator
        WaitGLK;
      end;

      if (aClockType = TClockType.XTAL32_PLL) then
      begin
        //Set the division factor of GCLK3 to 1, to produce the original 32.768kHz
        GCLK.GENDIV:=
          (GCLK_GENDIV_ID_Msk AND ((PLLREFCLOCK) shl GCLK_GENDIV_ID_Pos)) OR     // Select generator 3
          (GCLK_GENDIV_DIV_Msk AND ((1) shl GCLK_GENDIV_DIV_Pos));                  // Set the division factor to 1
        WaitGLK;

        //Create generic clock generator 3 for the 32.768KHz signal of the DFLL
        GCLK.GENCTRL:=(
          (GCLK_GENCTRL_ID_Msk AND ((PLLREFCLOCK) shl GCLK_GENCTRL_ID_Pos)) OR       // Select generator 3
          GCLK_GENCTRL_SRC_XOSC32K OR  // Select source XOSC32K
          GCLK_GENCTRL_IDC OR          // Set improved duty cycle 50/50
          GCLK_GENCTRL_GENEN);         // Enable this generic clock generator
        WaitGLK;
      end;

      //Configure DFLL48 reference clock
      //This is the input clock for the DFLL48M PLL
      //Target is DFLL48M
      //Select generator [PLLREFCLOCK] as source.
      SetClockSourceTarget((GCLK_CLKCTRL_GEN_Msk AND ((PLLREFCLOCK) shl GCLK_CLKCTRL_GEN_Pos)),GCLK_CLKCTRL_ID_DFLL48);

      // 6. Workaround to be able to configure the DFLL.
      //  Errata 9905:
      //  The DFLL clock must be requested before being configured otherwise a write access
      //  to a DFLL register can freeze the device.
      ClearBit(SysCtrl.DFLLCTRL,SYSCTRL_DFLLCTRL_ONDEMAND_Pos);
      WaitDFLLRDY;

      // 6a Load in DFLL48 factory calibrations
      coarse := ReadCal(NVM_DFLL48M_COARSE_CAL_POS,NVM_DFLL48M_COARSE_CAL_SIZE);
      // In some revision chip, the coarse calibration value is not correct.
      if (coarse = $3f) then coarse := $1f;
      fine := ReadCal(NVM_DFLL48M_FINE_CAL_POS,NVM_DFLL48M_FINE_CAL_SIZE);
      if (fine = $3ff) then coarse := $1ff;
      SetBitsMasked(SysCtrl.DFLLVAL,coarse,SYSCTRL_DFLLVAL_COARSE_Msk,SYSCTRL_DFLLVAL_COARSE_Pos);
      WaitDFLLRDY;
      SetBitsMasked(SysCtrl.DFLLVAL,fine,SYSCTRL_DFLLVAL_FINE_Msk,SYSCTRL_DFLLVAL_FINE_Pos);
      WaitDFLLRDY;

      // 7. Change the multiplication factor.
      SysCtrl.DFLLMUL:=(
        (PllFactInt shl SYSCTRL_DFLLMUL_MUL_Pos) OR
      (5 shl SYSCTRL_DFLLMUL_CSTEP_Pos) OR  // Coarse step = 5
      (10 shl SYSCTRL_DFLLMUL_FSTEP_Pos)     // Fine step = 10
        );
      WaitDFLLRDY;

      // Start closed-loop mode
      SysCtrl.DFLLCTRL:=
        SYSCTRL_DFLLCTRL_MODE OR // 1 = Closed loop mode.
        {$ifdef samd20}
        SYSCTRL_DFLLCTRL_STABLE OR // See SAMD20 errata
        {$endif}
        SYSCTRL_DFLLCTRL_WAITLOCK OR
        SYSCTRL_DFLLCTRL_QLDIS OR // 1 = Disable quick lock.
        {$ifdef has_usb}
        //SYSCTRL_DFLLCTRL_USBCRM OR //* USB correction */
        {$endif}
        SYSCTRL_DFLLCTRL_ENABLE;
      WaitDFLLRDY;

      // Wait for the coarse locks.
      WaitBitIsSet(SysCtrl.PCLKSR,SYSCTRL_PCLKSR_DFLLLCKC_Pos);
      // 11. Wait for the fine locks.
      WaitBitIsSet(SysCtrl.PCLKSR,SYSCTRL_PCLKSR_DFLLLCKF_Pos);

      // Switch generic clock 0 to the DFLL
      GCLK.GENCTRL:=
        (GCLK_GENCTRL_ID_Msk AND ((0) shl GCLK_GENCTRL_ID_Pos)) OR // Select generator 0
        GCLK_GENCTRL_SRC_DFLL48M OR // Select source DFLL
        GCLK_GENCTRL_IDC OR // Set improved duty cycle 50/50
        GCLK_GENCTRL_GENEN; // Enable this generic clock generator
      WaitGLK;
    end;

    {$ifdef has_fdpll}
    if (aClockType = TClockType.RC_FPLL) OR (aClockType = TClockType.XTAL32_FPLL) then
    begin
      SYSCTRL.DPLLCTRLA:=0;//disable DPLL
      WaitBitIsCleared(SYSCTRL.DPLLSTATUS,SYSCTRL_DPLLSTATUS_ENABLE_Pos);

      SYSCTRL.DPLLRATIO:=(PllFactFra shl 16) + PllFactInt;

      if (aClockType = TClockType.RC_FPLL) then
      begin
        // Set the division factor of GCLK3 to 1, which just passes the 1MHz OSC8M source
        GCLK.GENDIV:=
          (GCLK_GENDIV_ID_Msk AND ((PLLREFCLOCK) shl GCLK_GENDIV_ID_Pos)) OR     // Select generator 3
          (GCLK_GENDIV_DIV_Msk AND ((1) shl GCLK_GENDIV_DIV_Pos));                 // Set the division factor to 1
        WaitGLK;

        // Create generic clock generator 3 for the 1MHz signal of the DFLL
        GCLK.GENCTRL:=(
          (GCLK_GENCTRL_ID_Msk AND ((PLLREFCLOCK) shl GCLK_GENCTRL_ID_Pos)) OR   // Select generator 3
          GCLK_GENCTRL_SRC_OSC8M OR  // Select source OSC8M
          GCLK_GENCTRL_IDC OR        // Set improved duty cycle 50/50
          GCLK_GENCTRL_GENEN);       // Enable this generic clock generator
        WaitGLK;

        //Configure FDPLL reference clock
        //This is the input clock for the FDPLL
        //Target is FDPLL
        //Select generator [PLLREFCLOCK] as source.
        SetClockSourceTarget((GCLK_CLKCTRL_GEN_Msk AND ((PLLREFCLOCK) shl GCLK_CLKCTRL_GEN_Pos)),GCLK_CLKCTRL_ID_FDPLL);
      end;

      if (aClockType = TClockType.RC_FPLL) then
      begin
        SYSCTRL.DPLLCTRLB:=
          SYSCTRL_DPLLCTRLB_LBYPASS OR  // CLK_DPLL0 output clock is always on, and not dependent on frequency lock
          (SYSCTRL_DPLLCTRLB_REFCLK_Msk AND ((2) shl SYSCTRL_DPLLCTRLB_REFCLK_Pos)) //GENCLK clock reference
        ;
      end;
      if (aClockType = TClockType.XTAL32_FPLL) then
      begin
        SYSCTRL.DPLLCTRLB:=
          SYSCTRL_DPLLCTRLB_LBYPASS OR  // CLK_DPLL0 output clock is always on, and not dependent on frequency lock
          (SYSCTRL_DPLLCTRLB_REFCLK_Msk AND ((0) shl SYSCTRL_DPLLCTRLB_REFCLK_Pos)) //XOSC32K clock reference
        ;
      end;

      SYSCTRL.DPLLCTRLA:=SYSCTRL_DPLLCTRLA_ENABLE;//enable FDPLL
      WaitBitIsSet(SYSCTRL.DPLLSTATUS,SYSCTRL_DPLLSTATUS_ENABLE_Pos);
      WaitBitIsSet(SYSCTRL.DPLLSTATUS,SYSCTRL_DPLLSTATUS_CLKRDY_Pos);

      // Switch generic clock 0 to the FDPLL
      GCLK.GENCTRL:=
        (GCLK_GENCTRL_ID_Msk AND ((0) shl GCLK_GENCTRL_ID_Pos)) OR // Select generator 0
        GCLK_GENCTRL_SRC_FDPLL OR // Select source FDPLL
        GCLK_GENCTRL_IDC OR // Set improved duty cycle 50/50
        GCLK_GENCTRL_GENEN; // Enable this generic clock generator
      WaitGLK;
    end;
    {$endif has_fdpll}

    //Switch off XTAL32 if it is not in use anymore
    if (NOT ((aClockType = TClockType.XTAL32_PLL){$ifdef has_fdpll} OR (aClockType = TClockType.XTAL32_FPLL){$endif has_fdpll})) then
    begin
      if GetBit(SYSCTRL.XOSC32K,SYSCTRL_XOSC32K_ENABLE_Pos)=1 then
      begin
        ClearBit(SYSCTRL.XOSC32K,SYSCTRL_XOSC32K_ENABLE_Pos);
        WaitBitIsCleared(SYSCTRL.XOSC32K,SYSCTRL_XOSC32K_ENABLE_Pos);
      end;
    end;

    //Switch off OSC8M if it is not in use anymore
    if (NOT ((aClockType = TClockType.RC) OR (aClockType = TClockType.RC_PLL){$ifdef has_fdpll} OR (aClockType = TClockType.RC_FPLL){$endif has_fdpll})) then
    begin
      ClearBit(SYSCTRL.OSC8M,SYSCTRL_OSC8M_ENABLE_Pos);
      WaitBitIsCleared(SYSCTRL.OSC8M,SYSCTRL_OSC8M_ENABLE_Pos);
    end;

    //Switch off DFLL48 if it is not in use anymore
    if (NOT ((aClockType = TClockType.RC_PLL) OR (aClockType = TClockType.XTAL32_PLL))) then
    begin
      if GetBit(SYSCTRL.DFLLCTRL,SYSCTRL_DFLLCTRL_ENABLE_Pos)=1 then
      begin
        ClearBit(SYSCTRL.DFLLCTRL,SYSCTRL_DFLLCTRL_ENABLE_Pos);
        WaitDFLLRDY;
      end;
    end;

    //Switch off FDPLL if it is not in use anymore
    {$ifdef has_fdpll}
    if (NOT ((aClockType = TClockType.RC_FPLL) OR (aClockType = TClockType.XTAL32_FPLL))) then
    begin
      if GetBit(SYSCTRL.DPLLCTRLA,SYSCTRL_DPLLCTRLA_ENABLE_Pos) = 1 then
      begin
        ClearBit(SYSCTRL.DPLLCTRLA,SYSCTRL_DPLLCTRLA_ENABLE_Pos);
        WaitBitIsCleared(SYSCTRL.DPLLSTATUS,SYSCTRL_DPLLSTATUS_ENABLE_Pos);
      end;
    end;
    {$endif has_fdpll}

    //Now that all system clocks are configured, we can set CPU and APBx BUS clocks.
    //There values are normally the one present after Reset.
    //PM.CPUSEL     := PM_GENERALDIV_DIV1;
    //PM.APBASEL    := PM_GENERALDIV_DIV1;
    //PM.APBBSEL    := PM_GENERALDIV_DIV1;
    //PM.APBCSEL    := PM_GENERALDIV_DIV1;

    ConfigureTimer;
  end
end;
{$endif}

function TSAMCDSystemCore.getMaxCPUFrequency : Cardinal;
begin
  Result := MaxCPUFrequency;
end;

procedure TSAMCDSystemCore.SetClockSourceTarget(aClockSource,aClockTarget:longword);
begin
  {$ifdef samc}
  GCLK.PCHCTRL[aClockTarget]:=(
    aClockSource OR
    GCLK_PCHCTRL_CLKEN);
  while ((GCLK.PCHCTRL[aClockTarget] AND GCLK_PCHCTRL_CLKEN)=0) do begin end;
  {$endif}
  {$ifdef samd}
  GCLK.CLKCTRL:=(
    aClockTarget OR
    aClockSource OR
    GCLK_CLKCTRL_CLKEN);
  // Wait for GCLK-synchronization
  WaitBitIsCleared(GCLK.STATUS,GCLK_STATUS_SYNCBUSY_Pos);
  {$endif}
end;

{$ENDREGION}

begin
end.

