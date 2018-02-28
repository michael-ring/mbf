unit MBF.STM32F1.GPIO;
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

{< ST Micro F3xx series GPIO functions. }
interface

{$include MBF.Config.inc}

{$REGION PinDefinitions}

const
  ALT0=$1000;
  ALT1=$2000;
  ALT2=$3000;
  ALT3=$4000;

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
  end;

  {$if defined(has_arduinopins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PA3;  D1 =TNativePin.PA2;  D2 =TNativePin.PA10;  D3 =TNativePin.PB3;
      D4 =TNativePin.PB5;  D5 =TNativePin.PB4;  D6 =TNativePin.PB10;  D7 =TNativePin.PA8;
      D8 =TNativePin.PA9;  D9 =TNativePin.PC7;  D10=TNativePin.PB6;   D11=TNativePin.PA7;
      D12=TNativePin.PA6;  D13=TNativePin.PA5;  D14=TNativePin.PB9;   D15=TNativePin.PB8;

      A0 =TNativePin.PA0;  A1 =TNativePin.PA1;  A2 =TNativePin.PA4;   A3 =TNativePin.PB0;
      A4 =TNativePin.PC1;  A5 =TNativePin.PC0;
    end;
  {$endif}

  {$if defined(has_arduinominipins)}
  type
    TArduinoPin = record
    const
      None=-1;
      D0 =TNativePin.PA10; D1 =TNativePin.PA9;  D2 =TNativePin.PA12;  D3 =TNativePin.PB0;
      D4 =TNativePin.PB7;  D5 =TNativePin.PB6;  D6 =TNativePin.PB1;   D7 =TNativePin.PF0;
      D8 =TNativePin.PF1;  D9 =TNativePin.PA8;  D10=TNativePin.PA11;  D11=TNativePin.PB5;
      D12=TNativePin.PB4;  D13=TNativePin.PB3;

      A0 =TNativePin.PA0;  A1 =TNativePin.PA1;  A2 =TNativePin.PA3;   A3 =TNativePin.PA4;
      A4 =TNativePin.PA5;  A6 =TNativePin.PA7;  A7 =TNativePin.PA2;
    end;
  {$endif}

  {$if defined(has_morphopins)}
    TMorphoCN7Pin = record
    const
      None=-1;
      P1 =TNativePin.PC10; P2 =TNativePin.PC11; P3 =TNativePin.PC12; P4 =TNativePin.PD2;
      P13=TNativePin.PA13; P15=TNativePin.PA14; P17=TNativePin.PA15; P21=TNativePin.PB7;
      P23=TNativePin.PC13; P25=TNativePin.PC14; P27=TNativePin.PC15; P28=TNativePin.PA0;
      P29=TNativePin.PD0;  P30=TNativePin.PA1;  P31=TNativePin.PD1;  P32=TNativePin.PA4;
      P34=TNativePin.PB0;  P35=TNativePin.PC2;  P36=TNativePin.PC1;  P37=TNativePin.PC3;
      P38=TNativePin.PC0;
    end;

    TMorphoCN10Pin = record
    const
      None=-1;
      P1 =TNativePin.PC9;  P2 =TNativePin.PC8;  P3 =TNativePin.PB8;  P4 =TNativePin.PC6;
      P5 =TNativePin.PB9;  P6 =TNativePin.PC5;                       P11=TNativePin.PA5;
      P12=TNativePin.PA12; P13=TNativePin.PA6;  P14=TNativePin.PA11; P15=TNativePin.PA7;
      P16=TNativePin.PB12; P17=TNativePin.PB6;  P19=TNativePin.PB11; P21=TNativePin.PA9;
      P22=TNativePin.PB2;  P23=TNativePin.PA8;  P24=TNativePin.PB1;  P25=TNativePin.PB10;
      P26=TNativePin.PB15; P27=TNativePin.PB4;  P28=TNativePin.PB14; P29=TNativePin.PB5;
      P30=TNativePin.PB13; P31=TNativePin.PB3;  P33=TNativePin.PA10; P34=TNativePin.PC4;
      P35=TNativePin.PA2;  P37=TNativePin.PA3;
    end;
  {$endif}
{$endregion}

type
  TPinValue=(Low=0,High=1);
  TPinValues=0..1;
  TPinIdentifier=-1..160;
  TPinMode = (Analog=%00, Input=%01, Output=%10,  AF0=%100, AF1=%101, AF2=%110, AF3=%111);
  TPinDrive = (None=%00,PullUp=%01,PullDown=%10);
  TPinOutputMode = (PushPull=0,OpenDrain=1);
  TPinOutputSpeed = (Invalid=%00,Medium=%01, Slow=%10, High=%11);

type
  TGPIO = record
  private type
    pGPIORegisters = ^TGPIO_Registers;
  private const
    // Indexed mapping to GPIO registers.
    GPIOMem: array[0..6] of pGPIORegisters = ({$ifdef has_gpioa}@GPIOA{$else}nil{$endif},
                                              {$ifdef has_gpiob}@GPIOB{$else}nil{$endif},
                                              {$ifdef has_gpioc}@GPIOC{$else}nil{$endif},
                                              {$ifdef has_gpiod}@GPIOD{$else}nil{$endif},
                                              {$ifdef has_gpioe}@GPIOE{$else}nil{$endif},
                                              {$ifdef has_gpiof}@GPIOF{$else}nil{$endif},
                                              {$ifdef has_gpiog}@GPIOG{$else}nil{$endif});

    function GetPinMode(const Pin: TPinIdentifier): TPinMode;
    procedure SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
    function GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
    procedure SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
    function GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
    procedure SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
    function GetPinOutputSpeed(const Pin: TPinIdentifier): TPinOutputSpeed;
    procedure SetPinOutputSpeed(const Pin: TPinIdentifier; const Value: TPinOutputSpeed);

  public
    procedure Initialize;
    function  GetPinValue(const Pin: TPinIdentifier): TPinValues;
    procedure SetPinValue(const Pin: TPinIdentifier; const Value: TPinValues);
    procedure SetPinValueHigh(const Pin: TPinIdentifier);
    procedure SetPinValueLow(const Pin: TPinIdentifier);
    procedure TogglePinValue(const Pin: TPinIdentifier);

    property PinMode[const Pin : TPinIdentifier]: TPinMode read getPinMode write setPinMode;
    property PinDrive[const Pin : TPinIdentifier] : TPinDrive read getPinDrive write setPinDrive;
    property PinOutputMode[const Pin : TPinIdentifier] : TPinOutputMode read getPinOutputMode write setPinOutputMode;
    property PinOutputSpeed[const Pin : TPinIdentifier] : TPinOutputSpeed read getPinOutputSpeed write setPinOutputSpeed;
    property PinValue[const Pin : TPinIdentifier] : TPinValues read getPinValue write setPinValue;
  end;

var
  GPIO : TGPIO;

implementation

procedure TGPIO.Initialize;
begin
  // Nothing to do (yet) here
end;

function TGPIO.GetPinMode(const Pin: TPinIdentifier): TPinMode;
var
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  if Bit < 8 then
  begin
    case (GPIOMem[GPIO]^.CRL shr Bit4x) and $03 of
      00:     begin
                if (GPIOMem[GPIO]^.CRL shr (Bit4x+2)) and %11 = 0 then
                  Result := TPinMode.Analog
                else
                  Result := TPinMode.Input;
              end;
      else
              begin
                if (GPIOMem[GPIO]^.CRL shr (Bit4x+2)) and %10 = 0 then
                  Result := TPinMode.Output
                else
                  Result := TPinMode.AF0;
              end;
      end;
  end
  else
  begin
    case (GPIOMem[GPIO]^.CRH shr Bit4x) and $03 of
      00:     begin
                if (GPIOMem[GPIO]^.CRH shr (Bit4x+2)) and %11 = 0 then
                  Result := TPinMode.Analog
                else
                  Result := TPinMode.Input;
              end;
      else
             begin
               if (GPIOMem[GPIO]^.CRH shr (Bit4x+2)) and %10 = 0 then
                 Result := TPinMode.Output
               else
                 Result := TPinMode.AF0;
             end;
      end;
  end;
end;

procedure TGPIO.SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
var
  Bit4xMask : longWord;
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  Bit4xMask := not(%1111 shl Bit4x);

  //First make sure that the GPIO Clock is enabled
  RCC.APB2ENR := RCC.APB2ENR or longWord(1 shl (2+GPIO));

  //Now set default Mode with some sane settings

  if Bit < 8 then
  begin
    case Value of
      TPinMode.Input     : begin
                               //Enable Input Mode Free Floating
                               GPIOMem[GPIO]^.CRL := GPIOMem[GPIO]^.CRL and Bit4xMask or longword(%0100 shl Bit4x);
      end;
      TPinMode.Output    : begin
                               //Enable Output Mode Push/Pull Fastest IO Speed
                               GPIOMem[GPIO]^.CRL := GPIOMem[GPIO]^.CRL and Bit4xMask or longWord(%0011 shl Bit4x);
      end;

      TPinMode.Analog    : begin
                               //Enable Analog Mode no Pullup/Down
                               GPIOMem[GPIO]^.CRL := GPIOMem[GPIO]^.CRL and Bit4xMask;
      end
      else
                           begin
                               //Enable Alternate Node no Pullup/Down Fastest IO Speed
                               GPIOMem[GPIO]^.CRL := GPIOMem[GPIO]^.CRL and Bit4xMask or longWord(%1011 shl Bit4x);

      end;
    end;
  end
  else
  begin
    case Value of
      TPinMode.Input     : begin
                               //Enable Input Mode Free Floating
                               GPIOMem[GPIO]^.CRH := GPIOMem[GPIO]^.CRH and Bit4xMask or longword(%0100 shl Bit4x);
      end;
      TPinMode.Output    : begin
                               //Enable Output Mode Push/Pull Fastest IO Speed
                               GPIOMem[GPIO]^.CRH := GPIOMem[GPIO]^.CRH and Bit4xMask or longWord(%0011 shl Bit4x);
      end;

      TPinMode.Analog    : begin
                               //Enable Analog Mode no Pullup/Down
                               GPIOMem[GPIO]^.CRH := GPIOMem[GPIO]^.CRH and Bit4xMask;
      end
      else
                           begin
                               //Enable Alternate Node no Pullup/Down Fastest IO Speed
                               GPIOMem[GPIO]^.CRH := GPIOMem[GPIO]^.CRH and Bit4xMask or longWord(%1011 shl Bit4x);

      end;
    end;
  end;
end;

function TGPIO.GetPinValue(const Pin: TPinIdentifier): TPinValues;
begin
  if GPIOMem[Pin shr 4]^.IDR and (1 shl (Pin and $0f)) <> 0 then
    Result := 1
  else
    Result := 0;
end;

procedure TGPIO.SetPinValue(const Pin: TPinIdentifier; const Value: TPinValues);
begin
  if Value = 1 then
    GPIOMem[Pin shr 4]^.BSRR := 1 shl (Pin and $0f)
  else
    GPIOMem[Pin shr 4]^.BSRR := $10000 shl (Pin and $0f);
end;

procedure TGPIO.SetPinValueHigh(const Pin: TPinIdentifier);
begin
  GPIOMem[Pin shr 4]^.BSRR := 1 shl (Pin and $0f)
end;

procedure TGPIO.SetPinValueLow(const Pin: TPinIdentifier);
begin
  GPIOMem[Pin shr 4]^.BRR := 1 shl (Pin and $0f);
end;

procedure TGPIO.TogglePinValue(const Pin: TPinIdentifier);
begin
  if GPIOMem[Pin shr 4]^.ODR and (1 shl (Pin and $0f)) = 0 then
    GPIOMem[Pin shr 4]^.BSRR := 1 shl (Pin and $0f)
  else
    GPIOMem[Pin shr 4]^.BRR := 1 shl (Pin and $0f);
end;

function TGPIO.GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
var
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  if Bit < 8 then
  begin
    case (GPIOMem[GPIO]^.CRL shr Bit4x) and %1111 of
      %1000: begin
               if GPIOMem[GPIO]^.ODR and (%1 shl Bit) = 0 then
                 Result := TPinDrive.PullDown
               else
                 Result := TPinDrive.PullUp;
      end
      else
             Result := TPinDrive.None;
    end;
  end
  else
  begin
    case (GPIOMem[GPIO]^.CRH shr Bit4x) and %1111 of
      %1000: begin
               if GPIOMem[GPIO]^.ODR and (%1 shl Bit) = 0 then
                 Result := TPinDrive.PullDown
               else
                 Result := TPinDrive.PullUp;
      end
      else
             Result := TPinDrive.None;
    end;
  end;
end;

procedure TGPIO.SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
var
  Bit4xMask,Bit4xValue : longWord;
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  Bit4xMask := not(%1111 shl Bit4x);

  if Bit < 8 then
  begin
    Bit4xValue := (GPIOMem[GPIO]^.CRL and Bit4xMask) shr Bit4x;
    if Bit4xValue and %11 = 0 then
    begin
      if (Bit4xValue = %0100) and (Value <> TPinDrive.None) then
      begin
        GPIOMem[GPIO]^.CRL := (GPIOMem[GPIO]^.CRL and Bit4xMask) or longWord(%1000 shl Bit4x);
        if Value =  TPinDrive.PullDown then
          GPIOMem[GPIO]^.BRR := %1 shl Bit
        else
          GPIOMem[GPIO]^.BSRR := %1 shl Bit;
      end;
      if (Bit4xValue = %1000) then
      begin
        if Value = TPinDrive.None then
          GPIOMem[GPIO]^.CRL := (GPIOMem[GPIO]^.CRL and Bit4xMask) or longWord(%0100 shl Bit4x)
        else
        begin
          if Value =  TPinDrive.PullDown then
            GPIOMem[GPIO]^.BRR := %1 shl Bit
          else
            GPIOMem[GPIO]^.BSRR := %1 shl Bit;
        end;
      end;
    end;
  end
  else
  begin
    Bit4xValue := (GPIOMem[GPIO]^.CRH and Bit4xMask) shr Bit4x;
    if Bit4xValue and %11 = 0 then
    begin
      if (Bit4xValue = %0100) and (Value <> TPinDrive.None) then
      begin
        GPIOMem[GPIO]^.CRH := (GPIOMem[GPIO]^.CRL and Bit4xMask) or longWord(%1000 shl Bit4x);
        if Value =  TPinDrive.PullDown then
          GPIOMem[GPIO]^.BRR := %1 shl (Bit and %111)
        else
          GPIOMem[GPIO]^.BSRR := %1 shl (Bit and %111);
      end;
      if (Bit4xValue = %1000) then
      begin
        if Value = TPinDrive.None then
          GPIOMem[GPIO]^.CRH := (GPIOMem[GPIO]^.CRH and Bit4xMask) or longWord(%0100 shl Bit4x)
        else
        begin
          if Value =  TPinDrive.PullDown then
            GPIOMem[GPIO]^.BRR := %1 shl (Bit and %111)
          else
            GPIOMem[GPIO]^.BSRR := %1 shl (Bit and %111);
        end;
      end;
    end;
  end;
end;

function TGPIO.GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
var
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  if Bit < 8 then
    Result := TPinOutputMode((GPIOMem[GPIO]^.CRL shr (Bit4x+2) and %1))
  else
  Result := TPinOutputMode((GPIOMem[GPIO]^.CRH shr (Bit4x+2) and %1));
end;

procedure TGPIO.SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
var
  Bit4xMask : longWord;
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  Bit4xMask := not(%1111 shl Bit4x);

  if Bit < 8 then
  begin
    if ((GPIOMem[GPIO]^.CRL and Bit4xMask) shr Bit4x) and %0011 <> 0 then
      if Value = TPinOutputMode.PushPull then
       GPIOMem[GPIO]^.CRL := GPIOMem[GPIO]^.CRL and not( %1 shl (Bit4x+2) )
      else
        GPIOMem[GPIO]^.CRL := GPIOMem[GPIO]^.CRL or longWord( %1 shl (Bit4x+2) )
  end
  else
    begin
    if ((GPIOMem[GPIO]^.CRH and Bit4xMask) shr Bit4x) and %0011 <> 0 then
      if Value = TPinOutputMode.PushPull then
       GPIOMem[GPIO]^.CRH := GPIOMem[GPIO]^.CRH and not( %1 shl (Bit4x+2) )
      else
        GPIOMem[GPIO]^.CRH := GPIOMem[GPIO]^.CRH or longWord( %1 shl (Bit4x+2) )
  end;
end;

function TGPIO.GetPinOutputSpeed(const Pin: TPinIdentifier): TPinOutputSpeed;
var
  Bit4xMask : longWord;
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  Bit4xMask := not(%1111 shl Bit4x);

  if Bit < 8 then
    Result := TPinOutputSpeed(((GPIOMem[GPIO]^.CRL and Bit4xMask) shr Bit4x) and %11)
  else
  Result := TPinOutputSpeed(((GPIOMem[GPIO]^.CRH and Bit4xMask) shr Bit4x) and %11);
end;

procedure TGPIO.SetPinOutputSpeed(const Pin: TPinIdentifier; const Value: TPinOutputSpeed);
var
  Bit4xlMask : longWord;
  Bit,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;

  if Bit < 8 then
    Bit4x := Bit shl 2
  else
    Bit4x := (Bit and %111) shl 2;

  Bit4xlMask := not(%11 shl Bit4x);

  if Bit < 8 then
  begin
    if (Value <> TPinOutputSpeed.Invalid) and (GPIOMem[GPIO]^.CRL and (%11 shl Bit4x) <> 0) then
      GPIOMem[GPIO]^.CRL := (GPIOMem[GPIO]^.CRL and Bit4xlMask) or (longWord(Value) shl Bit4x);
  end
  else
  begin
    if (Value <> TPinOutputSpeed.Invalid) and (GPIOMem[GPIO]^.CRH and (%11 shl Bit4x) <> 0) then
      GPIOMem[GPIO]^.CRL := (GPIOMem[GPIO]^.CRH and Bit4xlMask) or (longWord(Value) shl Bit4x);
  end;

end;

end.
