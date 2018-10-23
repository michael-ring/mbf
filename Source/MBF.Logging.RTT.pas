unit MBF.Logging.RTT;
{$INCLUDE MBF.Config.inc}
interface
{$IF DEFINED(LOGGING)}
uses
  MBF.Logging,
  MBF.Logging.SeggerRTT;
type
  TRTT_Logger = object(TLogger)
  private
    procedure LogString(const aLogString : String);
  public
  end;
var
  Log : TRTT_Logger;
{$ENDIF}

implementation

{$IF DEFINED(LOGGING)}
procedure TRTT_Logger.LogString(const aLogString : String); [public, alias: 'MBF_LogString'];
begin
  SEGGER_RTT_WriteLn(aLogString);
end;
{$ENDIF}

begin
end.

