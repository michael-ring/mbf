unit MBF.TypeHelpers;
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

{$mode objfpc}
{$modeswitch typehelpers}

interface
type
  TStringHelper = Type Helper for String
    {$IF defined(ANSISTRINGS)}
    // Compares two 0-based strings for equality.
    function Compare(const S1: string; const S2: string): Integer; inline;
    // CompareOrdinal compares two strings by evaluating the numeric values of the corresponding characters in each string.
    // function CompareOrdinal
    // Compares two strings by their ordinal value, without case sensitivity.
    function CompareText(const S1: string; const S2: string): Integer; inline;
    // Compares this 0-based string against a given string.
    function CompareTo(const S2: string): Integer;
    // Returns whether this 0-based string contains the given string.
    {$ENDIF}
    function Contains(const Value: string): Boolean;
    // Copies and returns the 0-based given string.
    //function Copy
    // Copies memory allocated for several characters in the 0-based string to the memory allocated for characters in another 0-based string.
    //function CopyTo
    // CountChar counts the occurrences of the C character in the string.
    function CountChar(const C: Char): Integer;
    //function Create
    // This method removes the quote characters from a string.
    //function DeQuotedString
    // Returns whether the given 0-based string ends with the given 0-based substring.
    // function EndsText(const ASubText, AText: string): Boolean;
    // Returns whether this 0-based string ends with the given substring.
    function EndsWith(const Value: string): Boolean;
    // Returns whether the two given 0-based strings are identical.
    //function Equals
    // Identical to Format function.
    //function Format
    // Returns the hash code for this string.
    //function GetHashCode
    // Returns an integer that specifies the position of the first occurrence of a character or a substring within this 0-based string, starting the search at StartIndex. This method returns -1 if the value is not found or StartIndex specifies an invalid value.
    function IndexOf(value: Char): Integer; inline;
    function IndexOf(const Value: string): Integer; inline;
    {$if defined(ANSISTRINGS)}
    function IndexOf(Value: Char; StartIndex: Integer): Integer;
    function IndexOf(const Value: string; StartIndex: Integer): Integer;
    function IndexOf(Value: Char; StartIndex: Integer; Count: Integer): Integer;
    function IndexOf(const Value: string; StartIndex: Integer; Count: Integer): Integer;
    {$ENDIF}
    // Returns an integer indicating the position of the first given character found in the 0-based string.
    function IndexOfAny(const AnyOf: array of Char): Integer; overload;
    function IndexOfAny(const AnyOf: array of Char; StartIndex: Integer): Integer; overload;
    function IndexOfAny(const AnyOf: array of Char; StartIndex: Integer; Count: Integer): Integer; overload;
    //function IndexOfAnyUnquoted
    // Inserts a string in this 0-based string at the given position.
    function Insert(StartIndex: Integer; const Value: string): string;
    // Indicates whether a specified character in this 0-based string matches one of a set of delimiters.
    //function IsDelimiter
    // Returns whether this 0-based string is empty (does not contain any characters).
    function IsEmpty: Boolean;
    // Is a static class function that returns whether the given string is empty or not (does not contain any characters).
    //function IsNullOrEmpty
    // Indicates if a specified string is empty or consists only of white-space characters.
    function IsNullOrWhiteSpace(const Value: string): Boolean;
    // Joins two or more 0-based strings together separated by the given Separator.
    //function Join
    // Returns the string index in this 0-based string of the rightmost whole character that matches any character in Delims (except null = #0).
    //function LastDelimiter
    // Returns the last index of the Value string in the current 0-based string.
    function LastIndexOf(Value: Char): Integer;
    function LastIndexOf(const Value: string): Integer;
    function LastIndexOf(Value: Char; StartIndex: Integer): Integer;
    function LastIndexOf(const Value: string; StartIndex: Integer): Integer;
    //function LastIndexOf(Value: Char; StartIndex: Integer; Count: Integer): Integer;
    //function LastIndexOf(const Value: string; StartIndex: Integer; Count: Integer): Integer;
        //function LastIndexOfAny
        // Returns the last index of any character of the AnyOf character array, in the current 0-based string.
        //function LowerCase
        // Converts an ASCII string to lowercase.
        //function PadLeft
        // Left-aligns a 0-based string into a fixed length text space.
        //function PadRight
        // Right aligns this 0-based string into a fixed length text space.
        //function Parse
        // Parse converts Integer, Boolean and Extended types to their string representations.
        //function QuotedString
        // QuotedString doubles all the occurrences of a character and also adds it to the edges of the string.
        //function Remove
        // Removes the substring at the position StartIndex and optionally until the position StartIndex + Count, if specified, from this 0-based string.
        //function Replace
        // Replaces an old character or string with a new given character or string.
        //function Split
        // Splits this 0-based string into substrings, using the given Separator.
        //function StartsWith
        // Returns whether this 0-based string starts with the given string.
        //function Substring
        // Returns the substring starting at the position StartIndex and optionally ending at the position StartIndex + Length, if specified, from this 0-based string.
        //function ToBoolean
        // Converts a string to a Boolean value.
        //function ToCharArray
        // Transforms this 0-based string into a TArray<Char> (a character array) and returns it.
        //function ToDouble
        // Converts a given string to a floating-point value.
        //function ToExtended
        // Converts a given string to a floating-point value.
        //function ToInt64
        //
        //function ToInteger
        // Converts a string that represents an integer (decimal or hex notation) into a number.
        //function ToLower
        // Transforms this 0-based string into an all lowercase characters 0-based string and returns it.
        //function ToLowerInvariant
        // Transforms this 0-based string into an all-lowercase characters 0-based string and returns it. The conversion is done using the UTF-16 character representation, according to Unicode specification.
        //function ToSingle
        // Converts a given string to a floating-point value.
        //function ToUpper
        // Transforms this 0-based string into an all-uppercase characters 0-based string and returns it.
        //function ToUpperInvariant
        // Transforms this zero-based string into an all-uppercase characters zero-based string and returns it. The conversion is done using the UTF-16 character representation, according to the Unicode specification.
        //function Trim
        // Trims leading and trailing spaces and control characters from this 0-based string.
        //function TrimEnd (deprecated)
        // Trims the given trailing characters from this 0-based string.
        //function TrimLeft
        // Trims the given leading characters from this 0-based string.
        //function TrimRight
        // Trims the given trailing characters from a 0-based string.
        //function TrimStart (deprecated)
        // Trims the given leading characters from this 0-based string.
        //function UpperCase
        // Converts an ASCII string to uppercase.
  end;

TIntegerHelper = Type Helper for Integer { for LongInt Type too }
public
  const
    MaxValue = 2147483647;
    MinValue = -2147483648;
//Public
  //Class Function Size: Integer; inline; static;
  //Function ToString(const AValue: Integer): string; overload; inline;
  //Function Parse(const AString: string): Integer; inline;
  //Function TryParse(const AString: string; out AValue: Integer): Boolean; inline;
Public
  Function ToBoolean: Boolean; inline;
  {$if not defined(FPUNONE)}
  Function ToDouble: Double; inline;
  Function ToExtended: Extended; inline;
  {$endif}
  Function ToHexString(const AMinDigits: Integer): string; overload; inline;
  Function ToHexString: string; overload; inline;
  {$if not defined(FPUNONE)}
  Function ToSingle: Single; inline;
  Function ToString: string; overload; inline;
  {$endif}
end;

TLongWordHelper = Type Helper for LongWord { for LongInt Type too }
public
  const
    MaxValue = 4294967295;
    MinValue = 0;
  //Public
    //Class Function Size: Integer; inline; static;
    //Function ToString(const AValue: Integer): string; overload; inline;
    //Function Parse(const AString: string): Integer; inline;
    //Function TryParse(const AString: string; out AValue: Integer): Boolean; inline;
Public
  Function ToBoolean: Boolean; inline;
  {$if not defined(FPUNONE)}
  Function ToDouble: Double; inline;
  Function ToExtended: Extended; inline;
  {$endif}
  Function ToHexString(const AMinDigits: Integer): string; overload; inline;
  Function ToHexString: string; overload; inline;
  {$if not defined(FPUNONE)}
  Function ToSingle: Single; inline;
  {$endif}
  Function ToString: string; overload;
end;

{$SCOPEDENUMS ON}
  TUseBoolStrs = (False, True);
{$SCOPEDENUMS OFF}

TBooleanHelper = Type Helper for Boolean
//public
//  Class Function Parse(const S: string): Boolean; inline; static;
//  Class Function Size: Integer; inline; static;
//  Class Function ToString(const AValue: Boolean; UseBoolStrs: TUseBoolStrs = TUseBoolStrs.False): string; overload; inline; static;
//  Class Function TryToParse(const S: string; out AValue: Boolean): Boolean; inline; static;
Public
  Function ToInteger: Integer; inline;
  Function ToString(UseBoolStrs: TUseBoolStrs = TUseBoolStrs.False): string; overload; inline;
end;


implementation
{$IF defined(ANSISTRINGS)}
uses
  HeapMgr;
{$ENDIF}
{$IF defined(ANSISTRINGS)}
function CompareMemRange(P1, P2: Pointer; Length: PtrUInt): integer;inline;
begin
  Result:=CompareByte(P1^,P2^,Length);
end;

function TStringHelper.Compare(const S1: string; const S2: string): Integer;
var count, count1, count2: integer;
begin
  result := 0;
  Count1 := Length(S1);
  Count2 := Length(S2);
  if Count1>Count2 then
    Count:=Count2
  else
    Count:=Count1;
  result := CompareMemRange(Pointer(S1),Pointer(S2), Count);
  if result=0 then
    result:=Count1-Count2;
end;

function TStringHelper.CompareText(const S1: string; const S2: string): Integer;
var
  i, count, count1, count2: integer; Chr1, Chr2: byte;
  P1, P2: PChar;
begin
  Count1 := Length(S1);
  Count2 := Length(S2);
  if (Count1>Count2) then
    Count := Count2
  else
    Count := Count1;
  i := 0;
  if count>0 then
    begin
      P1 := @S1[1];
      P2 := @S2[1];
      while i < Count do
        begin
          Chr1 := byte(p1^);
          Chr2 := byte(p2^);
          if Chr1 <> Chr2 then
            begin
              if Chr1 in [97..122] then
                dec(Chr1,32);
              if Chr2 in [97..122] then
                dec(Chr2,32);
              if Chr1 <> Chr2 then
                Break;
            end;
          Inc(P1); Inc(P2); Inc(I);
        end;
    end;
  if i < Count then
    result := Chr1-Chr2
  else
    result := count1-count2;
end;

function TStringHelper.CompareTo(const S2: string): Integer;
var count, count1, count2: integer;
begin
  result := 0;
  Count1 := Length(Self);
  Count2 := Length(S2);
  if Count1>Count2 then
    Count:=Count2
  else
    Count:=Count1;
  result := CompareMemRange(Pointer(Self),Pointer(S2), Count);
  if result=0 then
    result:=Count1-Count2;
end;
{$ENDIF}

function TStringHelper.Contains(const Value: string): Boolean;
begin
  Result := pos(Value,Self) > 0;
end;

function TStringHelper.CountChar(const C: Char): Integer;
var
  P1 : pChar;
  i : byte;
begin
  result := 0;
  P1 := @Self[1];
  for i := 1 to length(self) do
  begin
    if C = P1^ then
      inc(result);
    inc(P1);
  end;
end;

function TStringHelper.EndsWith(const Value: string): Boolean;
begin
  if length(Value) < length(Self) then
    Result := (copy(Self,length(self)-length(Value),length(Value)) = Value)
  else
    Result := (Self = Value);
end;

function TStringHelper.IndexOf(value: Char): Integer;
begin
  Result := Pos(value,Self);
end;

function TStringHelper.IndexOf(const Value: string): Integer; inline;
begin
  Result := Pos(value,Self);
end;

{$IF defined(ANSISTRINGS)}
function TStringHelper.IndexOf(Value: Char; StartIndex: Integer): Integer;
begin
  Result := Pos(Value,StartIndex);
end;

function TStringHelper.IndexOf(const Value: string; StartIndex: Integer): Integer;
begin
  Result := Pos(Value,StartIndex);
end;

function TStringHelper.IndexOf(Value: Char; StartIndex: Integer; Count: Integer): Integer;
begin
  Result := Pos(Value,StartIndex);
  if Result > StartIndex+Count then
    Result := 0;
end;

function TStringHelper.IndexOf(const Value: string; StartIndex: Integer; Count: Integer): Integer;
begin
  Result := Pos(Value,StartIndex);
  if Result > StartIndex+Count then
    Result := 0;
end;
{$ENDIF}

function TStringHelper.IndexOfAny(const AnyOf: array of Char): Integer;
var
  i,j : byte;
begin
  Result := 0;
  for i := 1 to length(self) do
    for j := 1 to sizeOf(AnyOf) do
      if Self[i] = AnyOf[j] then
      begin
        Result := i;
        break;
      end;
end;

function TStringHelper.IndexOfAny(const AnyOf: array of Char; StartIndex: Integer): Integer;
var
  i,j : byte;
begin
  Result := 0;
  if StartIndex > length(Self) then
    exit;
  for i := StartIndex to length(self) do
    for j := 1 to sizeOf(AnyOf) do
      if Self[i] = AnyOf[j] then
      begin
        Result := i;
        break;
      end;
end;

function TStringHelper.IndexOfAny(const AnyOf: array of Char; StartIndex: Integer; Count: Integer): Integer;
var
  i,j : byte;
begin
  Result := 0;
  if StartIndex > length(Self) then
    exit;
  if Count > Length(Self) - StartIndex then
    Count := Length(Self) - StartIndex;
  for i := StartIndex to StartIndex+Count do
    for j := 1 to sizeOf(AnyOf) do
      if Self[i] = AnyOf[j] then
      begin
        Result := i;
        break;
      end;
end;

function TStringHelper.Insert(StartIndex: Integer; const Value: string): string;
begin
  if StartIndex > length(Self) then
    Result := Self + Value
  else
    Result := copy(Self,1,StartIndex-1)+Value+Copy(Self,StartIndex,255);
end;

function TStringHelper.IsEmpty: Boolean;
begin
  Result := length(Self)=0;
end;

function TStringHelper.IsNullOrWhiteSpace(const Value: string): Boolean;
var
  i : byte;
begin
  Result := true;
  if length(Self)=0 then
    exit;
  for i := 1 to length(Self) do
    if Byte(Self[i]) > 32 then
    begin
      Result := false;
      break;
    end;
end;

function TStringHelper.LastIndexOf(Value: Char): Integer;
var
  i : integer;
begin
  Result := 0;
  if length(Self) = 0 then
    exit;
  for i := length(Self) downto 1 do
    if Self[i] = Value then
    begin
      Result := i;
      exit;
    end;
end;

function TStringHelper.LastIndexOf(const Value: string): Integer;
var
  i : integer;
begin
  Result := 0;
  if (length(Value) > length(Self)) or (length(Value) = 0) or (length(Self) = 0) then
    exit;
  for i := length(Self) - length(Value) downto 1 do
    if Value = copy(Self,i,length(Value)) then
    begin
      Result := i;
      exit;
    end;
end;

function TStringHelper.LastIndexOf(Value: Char; StartIndex: Integer): Integer;
var
  i : integer;
begin
  Result := 0;
  if (length(Self) = 0) then
    exit;
  if StartIndex > length(Self) then
    StartIndex := length(self);
  for i := StartIndex downto 1 do
    if Self[i] = Value then
    begin
      Result := i;
      exit;
    end;
end;

function TStringHelper.LastIndexOf(const Value: string; StartIndex: Integer): Integer;
var
  i : integer;
begin
  Result := 0;
  if (length(Self) = 0) or (length(Value) = 0) or (length(value) > length(self)) then
    exit;
  if StartIndex > length(Self) then
    StartIndex := length(self);
  for i := StartIndex downto 1 do
    if Self[i] = Value then
    begin
      Result := i;
      exit;
    end;
end;

//function TStringHelper.LastIndexOf(Value: Char; StartIndex: Integer; Count: Integer): Integer;
//function TStringHelper.LastIndexOf(const Value: string; StartIndex: Integer; Count: Integer): Integer;

(*
Class Function TStringHelper.Parse(const AString: string): TORDINALTYPE; inline;

begin
  Result:=StrToInt(AString);
end;

Class Function TStringHelper.Size: Integer; inline; static;

begin
  Result:=SizeOf(TORDINALTYPE);
end;

Class Function TStringHelper.ToString(const AValue: TORDINALTYPE): string; overload; inline; static;

begin
  Result:=IntToStr(AValue);
end;

Class Function TStringHelper.TryParse(const AString: string; out AValue: TORDINALTYPE): Boolean; inline; static;

Var
  C : Integer;

begin
  Val(AString,AValue,C);
  Result:=(C=0);
end;
*)

Function TIntegerHelper.ToBoolean: Boolean; inline;
begin
  Result:=(Self<>0);
end;

{$if not defined(FPUNONE)}
Function TIntegerHelper.ToDouble: Double; inline;
begin
  Result:=Self;
end;

Function TIntegerHelper.ToExtended: Extended; inline;
begin
  Result:=Self;
end;
{$endif}

Function TIntegerHelper.ToHexString(const AMinDigits: Integer): string; overload; inline;
begin
  Result:=HexStr(Self,AMinDigits);
end;

Function TIntegerHelper.ToHexString: string; overload; inline;
begin
  Result:=HexStr(Self,SizeOf(Integer)*2);
end;

{$if not defined(FPUNONE)}
Function TIntegerHelper.ToSingle: Single; inline;
begin
  Result:=Self;
end;

Function TIntegerHelper.ToString: string; overload; inline;
begin
  System.Str(Self, result);
end;
{$endif}

Class Function ToString(const AValue: Integer): string; overload; inline;
begin
  Str(AValue, result);
end;

Function TLongWordHelper.ToBoolean: Boolean; inline;
begin
  Result:=(Self<>0);
end;

{$if not defined(FPUNONE)}
Function TLongWordHelper.ToDouble: Double; inline;
begin
  Result:=Self;
end;

Function TLongWordHelper.ToExtended: Extended; inline;
begin
  Result:=Self;
end;
{$ENDIF}

Function TLongWordHelper.ToHexString(const AMinDigits: Integer): string; overload; inline;
begin
  Result:=HexStr(Self,AMinDigits);
end;

Function TLongWordHelper.ToHexString: string; overload; inline;
begin
  Result:=HexStr(Self,SizeOf(LongWord)*2);
end;

{$if not defined(FPUNONE)}
Function TLongWordHelper.ToSingle: Single; inline;
begin
  Result:=Self;
end;
{$ENDIF
}
Function TLongWordHelper.ToString: string; overload;
begin
  System.Str(Self, result);
end;

Class Function ToString(const AValue: LongWord): string; overload; inline;
begin
  System.Str(AValue, result);
end;

(*
Class Function TBooleanHelper.Parse(const S: string): Boolean; inline; static;
begin
  Result:=StrToBool(S);
end;

Class Function TBooleanHelper.Size: Integer; inline; static;
begin
  Result:=SizeOf(Boolean);
end;

Class Function TBooleanHelper.ToString(const AValue: Boolean; UseBoolStrs: TUseBoolStrs = TUseBoolStrs.False): string; overload; inline; static;
begin
  Result:=BoolToStr(AValue,UseBoolStrs=TUseBoolStrs.True);
end;

Class Function TBooleanHelper.TryToParse(const S: string; out AValue: Boolean): Boolean; inline; static;
begin
  Result:=TryStrToBool(S,AValue);
end;
*)

Function TBooleanHelper.ToInteger: Integer; inline;
begin
  Result:=Integer(Self);
end;

Function TBooleanHelper.ToString(UseBoolStrs: TUseBoolStrs = TUseBoolStrs.False): string; overload; inline;

begin
  if UseBoolStrs = TUseBoolStrs.true then
  begin
    if Self=true then
      Result := 'true'
    else
      Result := 'false';
  end
  else
  begin
    if Self=true then
      Result := '1'
    else
      Result := '0';
  end;
end;

end.

