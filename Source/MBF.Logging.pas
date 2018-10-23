unit MBF.Logging;
{$INCLUDE MBF.Config.inc}

interface
{$IF DEFINED(LOGGING)}
type
  TLogger = object
  private
    function getTimeStamp : String;
    procedure LogString(const aLogString : String);
  public
    procedure d(const aTag : String;const aMessage : String);
    procedure e(const aTag : String;const aMessage : String);
    procedure i(const aTag : String;const aMessage : String);
    procedure v(const aTag : String;const aMessage : String);
    procedure w(const aTag : String;const aMessage : String);
  end;
{$ENDIF}
implementation
{$IF DEFINED(LOGGING)}
uses
  HeapMgr,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.TypeHelpers;

  function TLogger.getTimeStamp : String;
  var
    Timestamp : longWord;
  begin
    TimeStamp := SystemCore.GetTickCount;
    Result := (TimeStamp div 1000).toString;
    Result := Result + '.'+(TimeStamp mod 1000).toString;
  end;

  procedure TLogger.LogString(const aLogString : String); external name 'MBF_LogString';

  procedure TLogger.d(const aTag : String;const aMessage : String);
  begin
    LogString(getTimeStamp+' D '+aTag+': '+aMessage);
  end;

  procedure TLogger.e(const aTag : String;const aMessage : String);
  begin
    LogString(getTimeStamp+' E '+aTag+': '+aMessage);
  end;

  procedure TLogger.i(const aTag : String;const aMessage : String);
  begin
    LogString(getTimeStamp+' I '+aTag+': '+aMessage);
  end;

  procedure TLogger.v(const aTag : String;const aMessage : String);
  begin
    LogString(getTimeStamp+' V '+aTag+': '+aMessage);
  end;

  procedure TLogger.w(const aTag : String;const aMessage : String);
  begin
    LogString(getTimeStamp+' W '+aTag+': '+aMessage);
  end;
{$ENDIF}
end.
