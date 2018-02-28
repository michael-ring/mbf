unit MBF.PIC32MX.GPIO;
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
{< PIC32MX series GPIO functions. }
interface

{$include MBF.Config.inc}

{$REGION PinDefinitions}

const
  ALT0=$1000;
  ALT1=$1100;
  ALT2=$1200;
  ALT3=$1300;
  ALT4=$1400;
  ALT5=$1500;
  ALT6=$1600;
  ALT7=$1700;

type
  TNativePin = record
  const
    None=-1;
    {$if defined (has_gpioa)} PA0=  0;  PA1=  1;  PA2=  2;  PA3=  3;  PA4=  4;  PA5=  5;  PA6=  6;  PA7=  7;
                              PA8=  8;  PA9=  9; PA10= 10; PA11= 11; PA12= 12; PA13= 13; PA14= 14; PA15= 15; {$endif}
    {$if defined (has_gpiob)} PB0= 16;  PB1= 17;  PB2= 18;  PB3= 19;  PB4= 20;  PB5= 21;  PB6= 22;  PB7= 23;
                              PB8= 24;  PB9= 25; PB10= 26; PB11= 27; PB12= 28; PB13= 29; PB14= 30; PB15= 31; {$endif}
    {$if defined (has_gpioc)} PC0= 32;  PC1= 33;  PC2= 34;  PC3= 35;  PC4= 36;  PC5= 37;  PC6= 38;  PC7= 39;
                              PC8= 40;  PC9= 41; PC10= 42; PC11= 43; PC12= 44; PC13= 45; PC14= 46; PC15= 47; {$endif}
    {$if defined (has_gpiod)} PD0= 48;  PD1= 49;  PD2= 50;  PD3= 51;  PD4= 52;  PD5= 53;  PD6= 54;  PD7= 55;
                              PD8= 56;  PD9= 57; PD10= 58; PD11= 59; PD12= 60; PD13= 61; PD14= 62; PD15= 63; {$endif}
    {$if defined (has_gpioe)} PE0= 64;  PE1= 65;  PE2= 66;  PE3= 67;  PE4= 68;  PE5= 69;  PE6= 70;  PE7= 71;
                              PE8= 72;  PE9= 73; PE10= 74; PE11= 75; PE12= 76; PE13= 77; PE14= 78; PE15= 79; {$endif}
    {$if defined (has_gpiof)} PF0= 80;  PF1= 81;  PF2= 82;  PF3= 83;  PF4= 84;  PF5= 85;  PF6= 86;  PF7= 87;
                              PF8= 88;  PF9= 89; PF10= 90; PF11= 91; PF12= 92; PF13= 93; PF14= 94; PF15= 95; {$endif}
    {$if defined (has_gpiog)} PG0= 96;  PG1= 97;  PG2= 98;  PG3= 99;  PG4=100;  PG5=101;  PG6=102;  PG7=103;
                              PG8=104;  PG9=105; PG10=106; PG11=107; PG12=108; PG13=109; PG14=110; PG15=111; {$endif}
    {$if defined (has_gpioh)} PH0=112;  PH1=113;  PH2=114;  PH3=115;  PH4=116;  PH5=117;  PH6=118;  PH7=119;
                              PH8=120;  PH9=121; PH10=122; PH11=123; PH12=124; PH13=125; PH14=126; PH15=127; {$endif}
    {$if defined (has_gpioi)} PI0=128;  PI1=129;  PI2=130;  PI3=131;  PI4=132;  PI5=133;  PI6=134;  PI7=135;
                              PI8=136;  PI9=137; PI10=138; PI11=139; PI12=140; PI13=141; PI14=142; PI15=143; {$endif}
    {$if defined (has_gpioj)} PJ0=144;  PJ1=145;  PJ2=146;  PJ3=147;  PJ4=148;  PJ5=149;  PJ6=150;  PJ7=151;
                              PJ8=152;  PJ9=153; PJ10=154; PJ11=155; PJ12=156; PJ13=157; PJ14=158; PJ15=159; {$endif}
    {$if defined (has_gpiok)} PK0=160;  PK1=161;  PK2=162;  PK3=163;  PK4=164;  PK5=165;  PK6=166;  PK7=167; {$endif}
  end;


  {$if defined(has_arduinopins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PA3;  D1 =TNativePin.PA2;  D2 =TNativePin.PA10;  D3 =TNativePin.PB3;
      D4 =TNativePin.PB10; D5 =TNativePin.PB4;  D6 =TNativePin.PB5;   D7 =TNativePin.PA4;
      D8 =TNativePin.PB4;  D9 =TNativePin.PA3;  D10=TNativePin.PB15;   D11=TNativePin.PB12;
      D12=TNativePin.PB13;  D13=TNativePin.PB14;  D14=TNativePin.PB9;   D15=TNativePin.PB8;

      A0 =TNativePin.PA0;  A1 =TNativePin.PA1;  A2 =TNativePin.PA4;   A3 =TNativePin.PB0;
      A4 =TNativePin.PB1;  A5 =TNativePin.PB0;
    end;
  {$endif}

{$endregion}

type
  TPinValue=0..1;
  TPinIdentifier=-1..167;
  TPinMode = (Input=%00, Output=%01, Analog=%11, AF0=$10, AF1=$11);
  TPinDrive = (None=%00,PullUp=%01,PullDown=%10);
  TPinOutputMode = (PushPull=0,OpenDrain=1);
  TPinOutputSpeed = (Slow=%00, Medium=%01, High=%10, VeryHigh=%11);

type
  TGPIO = record
  private type
    pGPIORegisters = ^TGPIO_Registers;
  private const
    // Indexed mapping to GPIO registers.
    GPIOMem: array[0..8] of pGPIORegisters = ({$ifdef has_gpioa}@GPIOA{$else}nil{$endif},
                                              {$ifdef has_gpiob}@GPIOB{$else}nil{$endif},
                                              {$ifdef has_gpioc}@GPIOC{$else}nil{$endif},
                                              {$ifdef has_gpiod}@GPIOD{$else}nil{$endif},
                                              {$ifdef has_gpioe}@GPIOE{$else}nil{$endif},
                                              {$ifdef has_gpiof}@GPIOF{$else}nil{$endif},
                                              {$ifdef has_gpiog}@GPIOG{$else}nil{$endif},
                                              {$ifdef has_gpioh}@GPIOH{$else}nil{$endif},
                                              {$ifdef has_gpioi}@GPIOI{$else}nil{$endif});

    function GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
    function GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
    function GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
    procedure SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);

  public
    procedure Initialize;
    function  GetPinValue(const Pin: TPinIdentifier): TPinValue;
    procedure SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
    procedure SetPinValueHigh(const Pin: TPinIdentifier);
    procedure SetPinValueLow(const Pin: TPinIdentifier);
    procedure TogglePinValue(const Pin: TPinIdentifier);

    property PinMode[const Pin : TPinIdentifier]: TPinMode read getPinMode write setPinMode;
    property PinDrive[const Pin : TPinIdentifier] : TPinDrive read getPinDrive write setPinDrive;
    property PinOutputMode[const Pin : TPinIdentifier] : TPinOutputMode read getPinOutputMode write setPinOutputMode;
    property PinValue[const Pin : TPinIdentifier] : TPinValue read getPinValue write setPinValue;
  end;

var
  GPIO : TGPIO;

implementation

const
  PeripheralOutput : array [0..47] of pLongWord = (
    @RCON.RPA0R,  @RCON.RPA1R,  @RCON.RPA2R,  @RCON.RPA3R,
    @RCON.RPA4R,  nil,          nil,          nil,
    @RCON.RPA8R,  @RCON.RPA9R,  nil,          nil,
    nil,          nil,          nil,          nil,

    @RCON.RPB0R,  @RCON.RPB1R,  @RCON.RPB2R,  @RCON.RPA3R,
    @RCON.RPB4R,  @RCON.RPB5R,  @RCON.RPB6R,  @RCON.RPB7R,
    @RCON.RPB8R,  @RCON.RPB9R,  @RCON.RPB10R, @RCON.RPB11R,
    @RCON.RPB12R, @RCON.RPB13R, @RCON.RPB14R, @RCON.RPB15R,

    @RCON.RPC0R,  @RCON.RPC1R,  @RCON.RPC2R,  @RCON.RPC3R,
    @RCON.RPC4R,  @RCON.RPC5R,  @RCON.RPC6R,  @RCON.RPC7R,
    @RCON.RPC8R,  @RCON.RPC9R,  nil,          nil,
    nil,          nil,          nil,          nil
  );

const
  PeripheralInputPins : array[0..3] of array[0..7] of TPinIdentifier = (
  (
    TNativePin.PA0,  TNativePin.PB3,  TNativePin.PB4,  TNativePin.PB15,
    TNativePin.PB7,
    {$if defined(GPIOC)}TNativePin.PC7,  TNativePin.PC0,  TNativePin.PC5
    {$else}TNativePin.None, TNativePin.None,TNativePin.None{$endif}
  ),
  (
    TNativePin.PA1,  TNativePin.PB5,  TNativePin.PB1,  TNativePin.PB11,
    TNativePin.PB8,  TNativePin.PA8,
    {$if defined(GPIOC)}TNativePin.PC8{$else}TNativePin.None{$endif},
    TNativePin.PA9
  ),
  (
    TNativePin.PA2,  TNativePin.PB6,  TNativePin.PA4,  TNativePin.PB13,
    TNativePin.PB2,
    {$if defined(GPIOC)}TNativePin.PC6,  TNativePin.PC1,  TNativePin.PC3
    {$else}TNativePin.None, TNativePin.None,TNativePin.None{$endif}
  ),
  (
    TNativePin.PA3,  TNativePin.PB14,  TNativePin.PB0,  TNativePin.PB10,
    TNativePin.PB9,
    {$if defined(GPIOC)}TNativePin.PC9,  TNativePin.PC2,  TNativePin.PC4
    {$else}TNativePin.None, TNativePin.None,TNativePin.None{$endif}
  ));

procedure TGPIO.Initialize;
begin
  // Nothing to do (yet) here
end;

function TGPIO.GetPinMode(const Pin: TPinIdentifier): TPinMode;
type
  TPeripheralArray = array[0..62] of LongWord;
var
  GPIO,Bit : byte;
  i : byte;
  pPeripheralInput : ^TPeripheralArray;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;
  if (GPIOMem[GPIO]^.ANSEL shr Bit) and %1 = 1 then
    Result := TPinMode.Analog
  else
  begin
    case (GPIOMem[GPIO]^.TRIS shr ((Bit) shl 1)) and $01 of
      0:     Result := TPinMode.Output;
      1:     Result := TPinMode.Input;
    end;

    if PeripheralOutput[Pin]^ and %1111 <> 0 then
      Result := TPinMode.AF0;
    (* TODO
    for i := 0 to 62 do
      if pPeripheralInput(@RCOM.INT1R)^[i] <> 0 then
    *)
  end;
end;

procedure TGPIO.SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
var
  BitMask : longWord;
  Bit,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;
  BitMask := 1 shl Bit;

  //Now set default Mode with some sane settings

  case Value of
    TPinMode.Input     : begin
                             //Enable Input Mode
                             GPIOMem[GPIO]^.TRISSET := BitMask;
                             //Disable Analog Mode
                             GPIOMem[GPIO]^.ANSELCLR := BitMask;
                             //Disable Pullup/Pulldown
                             GPIOMem[GPIO]^.CNPUCLR := BitMask;
                             GPIOMem[GPIO]^.CNPDCLR := BitMask;
                             //Disable Open Collector Mode
                             GPIOMem[GPIO]^.ODCCLR := BitMask;
    end;
    TPinMode.Output    : begin
                             //Enable Output Mode
                             GPIOMem[GPIO]^.TRISCLR := BitMask;
                             //Disable Analog Mode
                             GPIOMem[GPIO]^.ANSELCLR := BitMask;
                             //Disable Pullup/Pulldown
                             GPIOMem[GPIO]^.CNPUCLR := BitMask;
                             GPIOMem[GPIO]^.CNPDCLR := BitMask;
                             //Disable Open Collector Mode
                             GPIOMem[GPIO]^.ODCCLR := BitMask;
    end;

    TPinMode.Analog    : begin
                             //Enable Input Mode
                             GPIOMem[GPIO]^.TRISSET := BitMask;
                             //Enable Analog Mode
                             GPIOMem[GPIO]^.ANSELSET := BitMask;
                             //Disable Pullup/Pulldown
                             GPIOMem[GPIO]^.CNPUCLR := BitMask;
                             GPIOMem[GPIO]^.CNPDCLR := BitMask;
    end
    else
                         begin

                         end;
  end;
end;

function TGPIO.GetPinValue(const Pin: TPinIdentifier): TPinValue;
begin
  if GPIOMem[Pin shr 4]^.PORT and (1 shl (Pin and $0f)) <> 0 then
    Result := 1
  else
    Result := 0;
end;

procedure TGPIO.SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
begin
  if Value = 1 then
    GPIOMem[Pin shr 4]^.LATSET := 1 shl (Pin and $0f)
  else
    GPIOMem[Pin shr 4]^.LATCLR := 1 shl (Pin and $0f)
end;

procedure TGPIO.SetPinValueHigh(const Pin: TPinIdentifier);
begin
  GPIOMem[Pin shr 4]^.LATSET := 1 shl (Pin and $0f)
end;

procedure TGPIO.SetPinValueLow(const Pin: TPinIdentifier);
begin
  GPIOMem[Pin shr 4]^.LATCLR := 1 shl (Pin and $0f)
end;

procedure TGPIO.TogglePinValue(const Pin: TPinIdentifier);
begin
  GPIOMem[Pin shr 4]^.LATINV := 1 shl (Pin and $0f)
end;

function TGPIO.GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
begin
  Result := TPinDrive.None;
  if GPIOMem[Pin shr 4]^.CNPU and (1 shl (Pin and $0f)) <> 0 then
    Result := TPinDrive.PullUp;
  if GPIOMem[Pin shr 4]^.CNPD and (1 shl (Pin and $0f)) <> 0 then
    Result := TPinDrive.PullDown;
end;

procedure TGPIO.SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
var
  BitMask,GPIO : byte;
begin
  BitMask := 1 shl (Pin and $0f);
  GPIO := Pin shr 4;
  case Value of
    TPinDrive.None :     begin
                           GPIOMem[Pin shr 4]^.CNPUCLR  := BitMask;
                           GPIOMem[Pin shr 4]^.CNPUCLR  := BitMask;
    end;
    TPinDrive.PullUp :   begin
                           GPIOMem[Pin shr 4]^.CNPUSET  := BitMask;
                           GPIOMem[Pin shr 4]^.CNPUCLR  := BitMask;
    end;
    TPinDrive.PullDown : begin
                           GPIOMem[Pin shr 4]^.CNPUCLR  := BitMask;
                           GPIOMem[Pin shr 4]^.CNPUSET  := BitMask;
    end;
  end;
end;

function TGPIO.GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
var
  GPIO : byte;
begin
  GPIO := Pin shr 4;
  if GPIOMem[Pin shr 4]^.ODC and (1 shl (Pin and $0f)) <> 0 then
    Result := TPinOutputMode.OpenDrain
  else
    Result := TPinOutputMode.PushPull;
end;

procedure TGPIO.SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
var
  GPIO : byte;
begin
  if Value = TPinOutputMode.OpenDrain then
    GPIOMem[Pin shr 4]^.ODCSET := 1 shl (Pin and $0f)
  else
    GPIOMem[Pin shr 4]^.ODCCLR := 1 shl (Pin and $0f);
end;

end.
