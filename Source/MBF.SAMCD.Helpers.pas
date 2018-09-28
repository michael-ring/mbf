unit MBF.SAMCD.Helpers;

interface

{$INCLUDE MBF.Config.inc}

{$i atsamcd/samcd-adc.inc}
{$i atsamcd/samcd-gclk.inc}
{$i atsamcd/samcd-mclk.inc}
{$i atsamcd/samcd-nvmctrl.inc}
{$i atsamcd/samcd-pm.inc}
{$i atsamcd/samcd-port.inc}
{$i atsamcd/samcd-sercom.inc}
{$i atsamcd/samcd-sysctrl.inc}
{$i atsamcd/samcd-tc.inc}

function ReadCal(Position,Size:byte):longword;
function DivCeiling(a,b:longint):longint;

implementation

function ReadCal(Position,Size:byte):longword;
begin
  result:=(({%H-}plongword(NVMCTRL_OTP4+(Position DIV 32))^ shr (Position MOD 32)) AND (1 shl Size));
end;

function DivCeiling(a,b:longint):longint;
begin
  result:=(((a) + (b) - 1) DIV (b));
end;

end.

