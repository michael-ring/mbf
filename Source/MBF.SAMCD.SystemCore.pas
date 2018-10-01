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
  OSC8MFrequency    = 8000000;
  ResetCPUFrequency = (OSC8MFrequency shr 3);
  MaxCPUFrequency   = 48000000;
{$elseif defined(samc20) or defined(samc21) }
  OSC48MFrequency    = 48000000;
  ResetCPUFrequency = (OSC48MFrequency DIV 12);
  MaxCPUFrequency   = 48000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.samxxx.inc and then define maximum CPU Frequency here}
{$endif}

var
  FCPUFrequency : longWord = ResetCPUFrequency;

type
  TClockType = (RC,XTAL32_PLL,RC_PLL);

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
  // presetscaler=0 : run at 8MHz
  PutValue(SysCtrl.OSC8M,SYSCTRL_OSC8M_PRESC_Msk,0,SYSCTRL_OSC8M_PRESC_Pos);
  // enable clock
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

end;

function TSAMCDSystemCore.GetCPUFrequency: Cardinal;
begin
  //TODO Return real CPU Frequency
  result:=FCPUFrequency;
end;

{$ifdef samc}
procedure TSAMCDSystemCore.SetCPUFrequency(const Value: Cardinal; aClockType : TClockType = TClockType.RC);
procedure WaitDPLLSync;
begin
  while (OSCCTRL.DPLLSYNCBUSY>0) do begin end; // Wait for synchronization
end;
var
  PLLFrequency:longword;
  OSC48M_divider:word;
  GEN0_divider:word;
  WaitStates:byte;
  PllFactInt:longword;
  PllFactFra:longword;
begin

  if (FCPUFrequency<>Value) then
  begin

    GEN0_divider:=1;

    if aClockType=TClockType.RC then
begin
      OSC48M_divider:=DivCeiling(OSC48MFrequency,Value);
      if OSC48M_divider=0 then OSC48M_divider:=1;
      if (OSC48M_divider>16) then
      begin
        OSC48M_divider:=16;
        GEN0_divider:=DivCeiling((OSC48MFrequency DIV OSC48M_divider),Value);
        if GEN0_divider=0 then GEN0_divider:=1;
      end;
      FCPUFrequency:=(OSC48MFrequency DIV OSC48M_divider);
    end;

    if aClockType = TClockType.XTAL32_PLL then
    begin
      if Value<48000000 then
      begin
        PLLFrequency:=48000000;
        GEN0_divider:=DivCeiling(PLLFrequency,Value);
        if GEN0_divider=0 then GEN0_divider:=1;
      end
      else
      begin
        PLLFrequency:=Value;
      end;
      PllFactInt := (PLLFrequency DIV 32768) - 1;
      PllFactFra := (32*(PLLFrequency - 32768*(PllFactInt+1))) DIV 32768;
      FCPUFrequency:=32768*(PllFactInt+1) + ((32768*PllFactFra) DIV 32);
    end;

    // GEN0    : 8 division factor bits  - DIV[7:0]
    // GEN1    : 16 division factor bits - DIV[15:0]
    // GEN2-11 : 5 division factor bits  - DIV[4:0]
    if (GEN0_divider>255) then GEN0_divider:=255;
    FCPUFrequency:=(FCPUFrequency DIV GEN0_divider);

    WaitStates:=0;
    if (FCPUFrequency>=22000000)  then Inc(WaitStates);
    if (FCPUFrequency>=44000000)  then Inc(WaitStates);
    if (FCPUFrequency>=67000000)  then Inc(WaitStates);
    if (FCPUFrequency>=89000000)  then Inc(WaitStates);
    if (FCPUFrequency>=111000000) then Inc(WaitStates);
    if (FCPUFrequency>=120000000) then Inc(WaitStates);

    // Enable the bus clock for the clock system.
    SetBit(MCLK.APBCMASK,MCLK_APBAMASK_GCLK_Pos);

    // Set waitstates
    NVMCTRL.CTRLB:=(NVMCTRL_CTRLB_RWS_Msk AND ((WaitStates) shl NVMCTRL_CTRLB_RWS_Pos));

    if aClockType = TClockType.RC then
    begin
      OSCCTRL.OSC48MCTRL := OSCCTRL_OSC48MCTRL_ONDEMAND OR OSCCTRL_OSC48MCTRL_ENABLE OR OSCCTRL_OSC48MCTRL_RUNSTDBY;
      OSCCTRL.OSC48MDIV  := (OSCCTRL_OSC48MDIV_DIV_Msk AND ((OSC48M_divider-1) shl OSCCTRL_OSC48MDIV_DIV_Pos));
      OSCCTRL.OSC48MSTUP := $07; // ~21uS startup;

      while (OSCCTRL.OSC48MSYNCBUSY>0) do begin end;                         // Wait until synced
      while ((OSCCTRL.STATUS AND OSCCTRL_STATUS_OSC48MRDY)=0) do begin end;  // Wait until ready

      // Default setting for GEN0
      GCLK.GENCTRL[0] :=
        GCLK_GENCTRL_SRC_OSC48M OR
        GCLK_GENCTRL_GENEN OR
        (($FF shl GCLK_GENCTRL_DIV_Pos) AND ((GEN0_divider) shl GCLK_GENCTRL_DIV_Pos));
    end;

    if aClockType = TClockType.XTAL32_PLL then
    begin
      //Enable the 32.768 khz external crystal oscillator
      OSC32KCTRL.XOSC32K:=((OSC32KCTRL_XOSC32K_STARTUP_Msk AND ((5) shl OSC32KCTRL_XOSC32K_STARTUP_Pos)) OR OSC32KCTRL_XOSC32K_XTALEN OR OSC32KCTRL_XOSC32K_EN32K OR OSC32KCTRL_XOSC32K_ENABLE);

      //Wait for the crystal oscillator to start up
      while (NOT GetBit(OSC32KCTRL.STATUS,OSC32KCTRL_STATUS_XOSC32KRDY_Pos)) do begin end; // Wait for synchronization

      ClearBit(OSCCTRL.DPLLCTRLA,1);//disable DPLL

      OSCCTRL.DPLLRATIO:=(PllFactFra shl 16) + PllFactInt;
      WaitDPLLSync;

      OSCCTRL.DPLLCTRLB:=
        OSCCTRL_DPLLCTRLB_LBYPASS OR  // CLK_DPLL0 output clock is always on, and not dependent on frequency lock
        (OSCCTRL_DPLLCTRLB_REFCLK_Msk AND ((0) shl OSCCTRL_DPLLCTRLB_REFCLK_Pos)) //XOSC32K clock reference
      ;

      SetBit(OSCCTRL.DPLLCTRLA,1);//enable DPLL
      WaitDPLLSync;

      //while (NOT GetBit(OSCCTRL.DPLLSTATUS,0)) do begin end;
      //while (NOT GetBit(OSCCTRL.DPLLSTATUS,1)) do begin end;

      // Default setting for GEN0
      GCLK.GENCTRL[0] :=
        //GCLK_GENCTRL_SRC_XOSC32K OR
        GCLK_GENCTRL_SRC_DPLL96M OR
        GCLK_GENCTRL_GENEN OR
        (GCLK_GENCTRL_DIV_Msk AND ((GEN0_divider) shl GCLK_GENCTRL_DIV_Pos));
    end;

    ConfigureTimer;

  end;

end;
{$endif}

{$ifdef samd}
procedure TSAMCDSystemCore.SetCPUFrequency(const Value: Cardinal; aClockType : TClockType = TClockType.RC);
procedure WaitGLK;
begin
  while GetBit(GCLK.STATUS,GCLK_STATUS_SYNCBUSY_Pos) do begin end; // Wait for synchronization
end;
procedure WaitSYSCTRL;
begin
  while (NOT GetBit(SYSCTRL.PCLKSR,SYSCTRL_PCLKSR_DFLLRDY_Pos)) do begin end; // Wait for synchronization
end;
var
  coarse,fine:longword;
begin
  if (FCPUFrequency<>Value) then
  begin
    FCPUFrequency:=Value;

    //if aClockType = TClockType.PLL then
    if true then
    begin
    // Clear interrupt flags
    SYSCTRL.INTFLAG := SYSCTRL_INTFLAG_BOD33RDY OR SYSCTRL_INTFLAG_BOD33DET OR SYSCTRL_INTFLAG_DFLLRDY;

    // Change the timing of the NVM access
    // 1 wait state for operating at 2.7-3.3V at 48MHz.
    PutValue(NVMCTRL.CTRLB,NVMCTRL_CTRLB_RWS_Msk,NVMCTRL_CTRLB_RWS_HALF);

    // Enable the bus clock for the clock system.
    SetBit(PM.APBAMASK,PM_APBAMASK_GCLK_Pos);

    // Initialise the DFLL to run in closed-loop mode at 48MHz
    // 1. Make a software reset of the clock system.
    SetBit(GCLK.CTRL,GCLK_CTRL_SWRST_Pos);
    while GetBit(GCLK.CTRL,GCLK_CTRL_SWRST_Pos) do begin end; // Wait for synchronization
    WaitGLK;

    // 2. Make sure the OCM8M keeps running.
    // presetscaler=3 : run at 1MHz
    PutValue(SysCtrl.OSC8M,SYSCTRL_OSC8M_PRESC_Msk,3,SYSCTRL_OSC8M_PRESC_Pos);
    ClearBit(SYSCTRL.OSC8M,SYSCTRL_OSC8M_ONDEMAND_Pos);

    // 3. Set the division factor to 32, which reduces the 1MHz source to 15.625kHz
    GCLK.GENDIV:=
      (GCLK_GENDIV_ID_Msk AND ((3) shl GCLK_GENDIV_ID_Pos)) OR         // Select generator 3
      (GCLK_GENDIV_DIV_Msk AND ((32) shl GCLK_GENDIV_DIV_Pos));        // Set the division factor to 64
    WaitGLK;

    // 4. Create generic clock generator 3 for the 15KHz signal of the DFLL
    GCLK.GENCTRL:=(
      (GCLK_GENCTRL_ID_Msk AND ((3) shl GCLK_GENCTRL_ID_Pos)) OR       // Select generator 3
      GCLK_GENCTRL_SRC_OSC8M OR  // Select source OSC8M
      GCLK_GENCTRL_IDC OR        // Set improved duty cycle 50/50
      GCLK_GENCTRL_GENEN);       // Enable this generic clock generator
    WaitGLK;

    // 5. Configure DFLL48
    GCLK.CLKCTRL:=(
      GCLK_CLKCTRL_ID_DFLL48 OR  // Target is DFLL48M
      (GCLK_CLKCTRL_GEN_Msk AND ((3) shl GCLK_CLKCTRL_GEN_Pos)) OR     // Select generator 3 as source.
      //((0) shl GCLK_CLKCTRL_WRTLOCK_Pos) OR // The generic clock and the associated generic clock generator and division factor are locked */
      GCLK_CLKCTRL_CLKEN);       // Enable the DFLL48M
    WaitGLK;

    // 6. Workaround to be able to configure the DFLL.
    //  Errata 9905:
    //  The DFLL clock must be requested before being configured otherwise a write access
    //  to a DFLL register can freeze the device.
    ClearBit(SysCtrl.DFLLCTRL,SYSCTRL_DFLLCTRL_ONDEMAND_Pos);
    WaitSYSCTRL;

    // 6a Load in DFLL48 factory calibrations
    coarse := ReadCal(NVM_DFLL48M_COARSE_CAL_POS,NVM_DFLL48M_COARSE_CAL_SIZE);
    // In some revision chip, the coarse calibration value is not correct.
    if (coarse = $3f) then coarse := $1f;
    fine := ReadCal(NVM_DFLL48M_FINE_CAL_POS,NVM_DFLL48M_FINE_CAL_SIZE);
    PutValue(SysCtrl.DFLLVAL,SYSCTRL_DFLLVAL_COARSE_Msk,coarse,SYSCTRL_DFLLVAL_COARSE_Pos);
    WaitSYSCTRL;
    PutValue(SysCtrl.DFLLVAL,SYSCTRL_DFLLVAL_FINE_Msk,fine,SYSCTRL_DFLLVAL_FINE_Pos);
    WaitSYSCTRL;

    // 7. Change the multiplication factor.
    SysCtrl.DFLLMUL:=(
//      (3000 shl SYSCTRL_DFLLMUL_MUL_Pos) OR // 48MHz / (1MHz / 64)
      (1500 shl SYSCTRL_DFLLMUL_MUL_Pos) OR // 48MHz / (1MHz / 32)
//      (5 shl SYSCTRL_DFLLMUL_CSTEP_Pos) OR  // Coarse step = 5
//      (10 shl SYSCTRL_DFLLMUL_FSTEP_Pos)     // Fine step = 10
      (31 shl SYSCTRL_DFLLMUL_CSTEP_Pos) OR  // Coarse step = half of max step
      (511 shl SYSCTRL_DFLLMUL_FSTEP_Pos)     // Fine step = half of max step
      );
    WaitSYSCTRL;

    // 8. Start closed-loop mode
    SysCtrl.DFLLCTRL:=0;
    while (NOT GetBit(SysCtrl.PCLKSR,SYSCTRL_PCLKSR_DFLLRDY_Pos)) do begin end; // Wait for synchronization
    SysCtrl.DFLLCTRL:=
      SYSCTRL_DFLLCTRL_MODE OR // 1 = Closed loop mode.
      {$ifdef samd20}
      SYSCTRL_DFLLCTRL_STABLE OR // See SAMD20 errata
      {$endif}
      {$ifdef CRYSTAL}
      SYSCTRL_DFLLCTRL_WAITLOCK OR
      SYSCTRL_DFLLCTRL_QLDIS; // 1 = Disable quick lock.
      {$else}
      SYSCTRL_DFLLCTRL_CCDIS OR
      {$ifdef has_usb}
      SYSCTRL_DFLLCTRL_USBCRM OR //* USB correction */
      {$endif}
      SYSCTRL_DFLLCTRL_BPLCKC;
      {$endif}
    WaitSYSCTRL;

    // 9. Enable the DFLL
    SetBit(SysCtrl.DFLLCTRL,SYSCTRL_DFLLCTRL_ENABLE_Pos);
    WaitSYSCTRL;

    // 10. Wait for the coarse locks.
    while (NOT GetBit(SysCtrl.PCLKSR,SYSCTRL_PCLKSR_DFLLLCKC_Pos)) do begin end;
    {$ifdef CRYSTAL}
    // 11. Wait for the fine locks.
    while (NOT GetBit(SysCtrl.PCLKSR,SYSCTRL_PCLKSR_DFLLLCKF_Pos)) do begin end;
    {$endif}


    // Switch the main clock speed.
    // 1. Set the divisor of generic clock 0 to 0
    GCLK.GENDIV:=
      (GCLK_GENDIV_ID_Msk AND ((0) shl GCLK_GENDIV_ID_Pos)) OR // Select generator 0
      //(GCLK_GENDIV_GEN_GCLK0) OR // Select generator 0
      (GCLK_GENDIV_DIV_Msk AND ((0) shl GCLK_GENDIV_DIV_Pos)); //  // Set the division factor to 0
    WaitGLK;

    // 2. Switch generic clock 0 to the DFLL
    GCLK.GENCTRL:=
      (GCLK_GENCTRL_ID_Msk AND ((0) shl GCLK_GENCTRL_ID_Pos)) OR // Select generator 0
      GCLK_GENCTRL_SRC_DFLL48M OR // Select source DFLL
      GCLK_GENCTRL_IDC OR // Set improved duty cycle 50/50
      GCLK_GENCTRL_GENEN; // Enable this generic clock generator
    WaitGLK;

    //Now that all system clocks are configured, we can set CPU and APBx BUS clocks.

    //There values are normally the one present after Reset.
    //PM.CPUSEL     := PM_GENERALDIV_DIV1;
    //PM.APBASEL    := PM_GENERALDIV_DIV1;
    //PM.APBBSEL    := PM_GENERALDIV_DIV1;
    //PM.APBCSEL    := PM_GENERALDIV_DIV1;
    end;

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
  while (GetBit(GCLK.STATUS,GCLK_STATUS_SYNCBUSY_Pos)) do begin end;
  {$endif}
end;

{$ENDREGION}

begin
end.
