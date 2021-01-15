procedure TGPIO.Initialize;
begin
  // Nothing to do (yet) here
end;

function TGPIO.GetPinMode(const Pin: TPinIdentifier): TPinMode;
begin
  case getCrumb(GPIOMem[Pin shr 4]^.MODER,(Pin and $0f) shl 1) of
    00:     Result := TPinMode.Input;
    01:     Result := TPinMode.Output;
    02:     Result := TPinMode(getNibble(GPIOMem[Pin shr 4]^.AFR[(Pin shr 3) and %1],(Pin and $0f) shl 1) +$10);
    03:     Result := TPinMode.Analog;
  end;
end;

procedure TGPIO.SetPinMode(const Pin: TPinIdentifier; const Value: TPinMode);
var
  Bit,Bit2x,Bit4x,GPIO : byte;
begin
  GPIO := Pin shr 4;
  Bit := Pin and $0f;
  Bit2x := Bit shl 1;
  Bit4x := Bit shl 2;

  //First make sure that the GPIO Clock is enabled
  EnableGPIOPort(GPIO);

  //Now set default Mode with some sane settings

  case Value of
    TPinMode.Input     : begin
                             //Enable Input Mode
                             SetCrumb(GPIOMem[GPIO]^.MODER,byte(TPinMode.Input),Bit2x);
                             //Disable Pullup/Pulldown
                             SetCrumb(GPIOMem[GPIO]^.PUPDR,byte(TPinDrive.None),Bit2x);
    end;
    TPinMode.Output    : begin
                             //Enable Output Mode
                             SetCrumb(GPIOMem[GPIO]^.MODER,byte(TPinMode.Output),Bit2x);
                             //Disable Pullup/Pulldown
                             SetCrumb(GPIOMem[GPIO]^.PUPDR,byte(TPinDrive.None),Bit2x);
                             //Enable Push/Pull Mode
                             SetBitValue(GPIOMem[GPIO]^.OTYPER,byte(TPinOutputMode.PushPull),Bit);
                             //Enable Fast Speed of GPIO
                             SetCrumb(GPIOMem[GPIO]^.OSPEEDR,byte(TPinOutputSpeed.High),Bit2x);
    end;

    TPinMode.Analog    : begin
                             //Enable Analog Mode
                             SetCrumb(GPIOMem[GPIO]^.MODER,byte(TPinMode.Analog),Bit2x);
                             //Disable Pullup/Pulldown
                             SetCrumb(GPIOMem[GPIO]^.PUPDR,byte(TPinDrive.None),Bit2x);
    end
    else
                         begin
                             //Enable Alternate Node
                             SetCrumb(GPIOMem[GPIO]^.MODER,%10,Bit2x);
                             //Disable Pullup/Pulldown
                             SetCrumb(GPIOMem[GPIO]^.PUPDR,byte(TPinDrive.None),Bit2x);
                             //Enable Push/Pull Mode
                             SetBitValue(GPIOMem[GPIO]^.OTYPER,byte(TPinOutputMode.PushPull),Bit);
                             //Enable Fast Speed of GPIO
                             SetCrumb(GPIOMem[GPIO]^.OSPEEDR,byte(TPinOutputSpeed.High),Bit2x);
                             //Select correct Device for Pin
                             SetNibble(GPIOMem[GPIO]^.AFR[Bit shr 3],longWord(Value) and $0f,Bit4x and %11111);
    end;
  end;
end;

function TGPIO.GetPinValue(const Pin: TPinIdentifier): TPinValue;
begin
  Result := GetBitValue(GPIOMem[Pin shr 4]^.IDR,Pin and $0f);
end;

procedure TGPIO.SetPinValue(const Pin: TPinIdentifier; const Value: TPinValue);
begin
  if Value = 1 then
    SetBit(GPIOMem[Pin shr 4]^.BSRR,Pin and $0f)
  else
    SetBit(GPIOMem[Pin shr 4]^.BSRR,(Pin and $0f)+16);
end;

function TGPIO.GetPinLevel(const Pin: TPinIdentifier): TPinLevel;
begin
  if GetBit(GPIOMem[Pin shr 4]^.IDR,Pin and $0f) <> 0 then
    Result := TPinLevel.High
  else
    Result := TPinLevel.Low;
end;

procedure TGPIO.SetPinLevel(const Pin: TPinIdentifier; const Level: TPinLevel);
begin
  if Level = TPinLevel.High then
    SetBit(GPIOMem[Pin shr 4]^.BSRR,Pin and $0f)
  else
    SetBit(GPIOMem[Pin shr 4]^.BSRR,(Pin and $0f)+16);
end;

procedure TGPIO.SetPinLevelHigh(const Pin: TPinIdentifier);
begin
  SetBit(GPIOMem[Pin shr 4]^.BSRR,Pin and $0f);
end;

procedure TGPIO.SetPinLevelLow(const Pin: TPinIdentifier);
begin
  SetBit(GPIOMem[Pin shr 4]^.BSRR,(Pin and $0f)+16);
end;

procedure TGPIO.TogglePinValue(const Pin: TPinIdentifier);
begin
  if GetBit(GPIOMem[Pin shr 4]^.ODR,Pin and $0f) = 0 then
    SetBit(GPIOMem[Pin shr 4]^.BSRR,Pin and $0f)
  else
    SetBit(GPIOMem[Pin shr 4]^.BSRR,(Pin and $0f)+16);
end;

procedure TGPIO.TogglePinLevel(const Pin: TPinIdentifier);
begin
  if GetBit(GPIOMem[Pin shr 4]^.ODR,Pin and $0f) = 0 then
    SetBit(GPIOMem[Pin shr 4]^.BSRR,Pin and $0f)
  else
    SetBit(GPIOMem[Pin shr 4]^.BSRR,(Pin and $0f)+16);
end;

function TGPIO.GetPinDrive(const Pin: TPinIdentifier): TPinDrive;
var
  Bit2x : byte;
begin
  Bit2x := (Pin and $0f) shl 1;

  case GetCrumb(GPIOMem[Pin shr 4]^.PUPDR,Bit2x) of
    %01: Result := TPinDrive.PullUp;
    %10: Result := TPinDrive.PullDown;
  else
    Result := TPinDrive.None;
  end;
end;

procedure TGPIO.SetPinDrive(const Pin: TPinIdentifier; const Value: TPinDrive);
begin
  case Value of
    TPinDrive.None :     SetCrumb(GPIOMem[Pin shr 4]^.PUPDR,%00,(Pin and $0f) shl 1);
    TPinDrive.PullUp :   SetCrumb(GPIOMem[Pin shr 4]^.PUPDR,%01,(Pin and $0f) shl 1);
    TPinDrive.PullDown : SetCrumb(GPIOMem[Pin shr 4]^.PUPDR,%10,(Pin and $0f) shl 1);
  end;
end;

function TGPIO.GetPinOutputMode(const Pin: TPinIdentifier): TPinOutputMode;
begin
  Result := TPinOutputMode(getBit(GPIOMem[Pin shr 4]^.OTYPER,Pin and $0f));
end;

procedure TGPIO.SetPinOutputMode(const Pin: TPinIdentifier; const Value: TPinOutputMode);
begin
  if value = TPinOutputMode.OpenDrain then
    SetBit(GPIOMem[Pin shr 4]^.OTYPER,Pin and $0f)
  else
    ClearBit(GPIOMem[Pin shr 4]^.OTYPER,Pin and $0f);
end;

function TGPIO.GetPinOutputSpeed(const Pin: TPinIdentifier): TPinOutputSpeed;
begin
  Result := TPinOutputSpeed(GetCrumb(GPIOMem[Pin shr 4]^.OSPEEDR,(Pin and $0f) shl 1));
end;

procedure TGPIO.SetPinOutputSpeed(const Pin: TPinIdentifier; const Value: TPinOutputSpeed);
begin
  SetCrumb(GPIOMem[Pin shr 4]^.OSPEEDR,longWord(Value),(Pin and $0f) shl 1);
end;

procedure TGPIOPort.Initialize;
begin
end;

function TGPIOPort.GetPortValues : word; inline;
begin
  Result := Self.IDR;
end;

function TGPIOPort.GetPortBits : TBitSet; inline;
begin
  Result := TBitSet(Self.IDR);
end;

procedure TGPIOPort.SetPortValues(const Values : word); inline;
begin
  Self.ODR := Values;
end;

procedure TGPIOPort.SetPortBits(const Bits : TBitSet); inline;
begin
  Self.BSRR := longWord(Bits);
end;

procedure TGPIOPort.ClearPortBits(const Bits : TBitSet); inline;
begin
  Self.BSRR := longWord(Bits) shl 16;
end;

procedure TGPIOPort.SetPortMode(PortMode : TPinMode); inline;
begin
  {$PUSH}
  {$WARN 4055 off : Conversion between ordinals and pointers is not portable}
  case longWord(@Self) of
    longWord(@GPIOA): EnableGPIOPort(0);
    longWord(@GPIOB): EnableGPIOPort(1);
    longWord(@GPIOC): EnableGPIOPort(2);
    {$ifdef has_gpiod}longWord(@GPIOD): EnableGPIOPort(3);{$endif}
    {$ifdef has_gpioe}longWord(@GPIOE): EnableGPIOPort(4);{$endif}
    {$ifdef has_gpiof}longWord(@GPIOF): EnableGPIOPort(5);{$endif}
    {$ifdef has_gpiog}longWord(@GPIOG): EnableGPIOPort(6);{$endif}
    {$ifdef has_gpioh}longWord(@GPIOH): EnableGPIOPort(7);{$endif}
    {$ifdef has_gpioi}longWord(@GPIOI): EnableGPIOPort(8);{$endif}
    {$ifdef has_gpioj}longWord(@GPIOJ): EnableGPIOPort(9);{$endif}
    {$ifdef has_gpiok}longWord(@GPIOK): EnableGPIOPort(10);{$endif}
  end;
  {$POP}
  if PortMode = TPinMode.Input then
    Self.MODER:= 0
  else if PortMode = TPinMode.Output then
    Self.MODER := %01010101010101010101010101010101
  else if PortMode = TPinMode.Analog then
    Self.MODER := %11111111111111111111111111111111
  else
  begin
    Self.MODER := %10101010101010101010101010101010;
    //TODO Set AF Modes, but it is a rare usecase
  end;
end;

procedure TGPIOPort.SetPortOutputSpeed(Speed : TPinOutputSpeed); inline;
begin
  if Speed = TPinOutputSpeed.Slow then
    Self.OSPEEDR:= 0
  else if Speed = TPinOutputSpeed.Medium then
    Self.OSPEEDR := %01010101010101010101010101010101
  else if Speed = TPinOutputSpeed.High then
    Self.OSPEEDR := %10101010101010101010101010101010
  else
    Self.OSPEEDR := %11111111111111111111111111111111;
end;

procedure TGPIOPort.SetPortDrive(Drive : TPinDrive); inline;
begin
  if Drive = TPinDrive.None then
    Self.PUPDR:= 0
  else if Drive = TPinDrive.PullDown then
    Self.PUPDR := %01010101010101010101010101010101
  else
    Self.MODER := %10101010101010101010101010101010;
end;

procedure TGPIOPort.SetPortOutputMode(OutputMode : TPinOutputMode); inline;
begin
  if OutputMode = TPinOutputMode.PushPull then
    Self.OTYPER:= 0
  else
    Self.OTYPER := %1111111111111111;
end;
