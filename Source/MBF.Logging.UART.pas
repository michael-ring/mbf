unit MBF.Logging.UART;
{$INCLUDE MBF.Config.inc}
interface
{$IF DEFINED(LOGGING)}
uses
  MBF.Logging,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.UART;
type
  TUART_Logger = object(TLogger)
  private
    pDebugUart :  ^TUART_Registers;
    procedure LogString(const aLogString : String);
  public
    procedure Initialize(var aDebugUart : TUART_Registers; aUARTRXPin : TUARTRXPins; aUARTTXPin : TUARTTXPins);
  end;
var
  Log : TUART_Logger;
{$ENDIF}

implementation
var
  CRLF : String = #13#10;

{$IF DEFINED(LOGGING)}
procedure TUART_Logger.LogString(const aLogString : String); [public, alias: 'MBF_LogString'];
begin
  pDebugUART^.WriteString(aLogString);
  pDebugUART^.WriteString(CRLF);
end;

procedure TUART_Logger.Initialize(var aDebugUart : TUART_Registers; aUARTRXPin : TUARTRXPins; aUARTTXPin : TUARTTXPins);
begin
  pDebugUart := @aDebugUart;
  GPIO.Initialize;
  pDebugUart^.Initialize(aUARTRXPin,aUARTTXPin);
end;

begin
{$ENDIF}
end.

