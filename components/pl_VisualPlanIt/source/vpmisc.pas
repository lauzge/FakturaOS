{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

unit VpMisc;
  {-Miscellaneous functions and procedures}

interface

{$I vp.inc}

uses
  LCLProc, LCLType, LCLIntf,
  Buttons, Classes, Controls, StdCtrls, ExtCtrls, Forms, Graphics, Menus,
  SysUtils, VpBase, VpData, VpConst;

type
  TDayList = array[1..12] of Word;


  TVpDayType = (dtSunday, dtMonday, dtTuesday, dtWednesday, dtThursday, dtFriday, dtSaturday);

  TVpDateFormat = (dfShort, dfLong);

  TVpDayNameWidth = Integer;

const
  MonthDays: array [Boolean] of TDayList =
    ((31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),
     (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31));

  GranularityMinutes: Array[TVpGranularity] of Integer = (5, 6, 10, 15, 20, 30, 60);

function DefaultEpoch : Integer;
  {-return the current century}
  
//=== ct9999 =============
function DaysInMonth(Year, Month: integer): integer;
{-return the number of days in the specified month of a given year}
//========================

//function GetLeftButton : Byte;
procedure GetRGB(Clr : TColor; var IR, IG, IB : Byte);
function GetStartOfWeek(Date: TDateTime; StartOn: TVpDayType): TDateTime;

procedure StripString(var Str: string);
  { strips non-alphanumeric characters from the beginning and end of the string}

function AssembleName(AContact: TVpContact): string;
  { returns an assembled name string }

function AssembleCSZ(AContact: TVpContact; AType: Integer; AFormat: String): String;
  { returns an assembled city-state-zip string }

procedure ParseName(Contact: TVpContact; const Value: string);
  { parses the name into it's elements and updates the contact }

procedure ParseCSZ(Str: string; var City, State, Zip: string);
{ parses the string and returns the city, state and zip parameters }

function HeightOf(const R : TRect) : Integer;
  {- returns the height of the TRect}

function WidthOf(const R : TRect) : Integer;
  {- returns the width of the TRect}

function RightOf(AControl: TControl): Integer;
  {- returns the right edge of a control }

function BottomOf(AControl: TControl): Integer;
  {- returns the bottom edge of a control }

function GetDisplayString(Canvas : TCanvas; const S : string;
  MinChars, MaxWidth : Integer) : string;
  { given a string, a minimum number of chars to display, and a max width,
    find the string that can be displayed in that width - add ellipsis to
    the end if necessary and possible }

function GetDateDisplayString(ACanvas: TCanvas; ADate: TDateTime;
  AFormat, AHoliday: String; AWidth: Integer): String;

procedure DrawBevelRect(const Canvas: TCanvas; R: TRect;
  Shadow, Highlight: TColor);
  { Draws a bevel in the specified TRect, using the specified colors }

function PointInRect(Point: TPoint; Rect: TRect): Boolean;
  { Determines if the specified point resides inside the specified TRect }

function GetAlarmAdvanceTime(Advance: Integer; AdvanceType: TVpAlarmAdvType): TDateTime;

function GetJulianDate(Date: TDateTime): Word;
function GetWeekOfYear(ADate: TDateTime): byte;
function IsWeekEnd(ADate: TDateTime): Boolean;
function SameDate(dt1, dt2: TDateTime): Boolean;
function DateInRange(ADate, StartDate, EndDate: TDateTime; IncludeLimits: Boolean): Boolean;
function TimeInRange(ATime, StartTime, EndTime: TDateTime; IncludeLimits: Boolean): Boolean;

function GetTimeFormat: TVpTimeFormat;
function GetTimeFormatStr(ATimeFormat: TVpTimeFormat): String;
function HourToAMPM(Hour: TVpHours): string;
function HourToStr(Hour: TVpHours; Mil: Boolean): string;

function HourToLine(const Value: TVpHours; const Granularity: TVpGranularity): Integer;
function GetStartLine(StartTime: TDateTime; Granularity: TVpGranularity): Integer;
function GetEndLine(EndTime: TDateTime; Granularity: TVpGranularity): Integer;
function LineToStartTime(Line: Integer; Granularity: TVpGranularity): TDateTime;
function GetLineDuration(Granularity: TVpGranularity): Double;

function GranularityToStr(Gran: TVpGranularity): string;

function TaskPriorityToStr(APriority: TVpTaskPriority): String;

function AutoHeight(ARadioGroup: TRadioGroup): Integer;
function GetButtonWidth(AButton: TButton): Integer;
function GetLabelWidth(ALabel: TLabel): Integer;
function GetRealFontHeight(AFont: TFont): Integer;

function DecodeLineEndings(const AText: String): String;
function EncodeLineEndings(const AText: String): String;
function StripLastLineEnding(const AText: String): String;

procedure AddResourceGroupMenu(AMenu: TMenuItem; AResource: TVpResource;
  AEventHandler: TNotifyEvent);
function OverlayPatternToBrushStyle(APattern: TVpOverlayPattern): TBrushStyle;

procedure HighDPI(FromDPI: integer);
procedure ScaleDPI(Control: TControl; FromDPI: integer);

const
  DesignTimeDPI = 96;

procedure Unused(const A1); overload;
procedure Unused(const A1, A2); overload;
procedure Unused(const A1, A2, A3); overload;

implementation

uses
  DateUtils, StrUtils,
  VpException, VpSR, VpBaseDS;

procedure StripString(var Str: string);
begin
  if Length(Str) < 1 then
    Exit;
  while (Length(Str) > 0) and (not (Str[1] in ['A'..'Z', 'a'..'z', '0'..'9'])) do
    delete(Str, 1, 1);
  while (Length(Str) > 0) and (not (Str[Length(Str)] in ['A'..'Z', 'a'..'z', '0'..'9'])) do
    delete(Str, Length(Str), 1);
end;


function AssembleName(AContact: TVpContact): string;
begin
  Result := AContact.LastName;
  if Assigned(AContact.Owner) then begin
    if AContact.Owner.ContactSort = csFirstLast then begin
      if AContact.FirstName <> '' then
        Result := AContact.FirstName + ' ' + Result;
    end else begin
      if AContact.FirstName <> '' then
        Result := Result + ', ' + AContact.FirstName;
    end;
  end else begin
    if AContact.FirstName <> '' then
      Result := Result + ', ' + AContact.FirstName;
  end;
end;

function AssembleCSZ(AContact: TVpContact; AType: Integer; AFormat: String): String;
var
  city: String;
  state: String;
  zip: String;
begin
  case AType of
    1:  // work address
      begin
        city := AContact.City1;
        state := AContact.State1;
        zip := AContact.Zip1;
      end;
    2:  // home address
      begin
        city := AContact.City2;
        state := AContact.State2;
        zip := AContact.Zip2;
      end;
  end;
  if AFormat = '' then
  begin
    Result := city;
    if (Result <> '') and (state <> '') then
      Result := Result + ', ' + state;
    if (Result <> '') and (zip <> '') then
      Result := Result + ' ' + zip;
  end else
  begin
    Result := AFormat;
    Result := ReplaceStr(Result, '@CITY', city);
    Result := ReplaceStr(Result, '@STATE', state);
    Result := ReplaceStr(Result, '@ZIP', zip);
    while (Length(Result) > 0) and (Result[1] in [' ', ',', '.']) do
      Delete(Result, 1, 1);
    while (Length(Result) > 0) and (Result[Length(Result)] in [' ', ',', '.']) do
      Delete(Result, Length(Result), 1);
  end;
end;


procedure ParseName(Contact: TVpContact; const Value: string);
var
  name, ln, fn: string;
begin
  name := Value;

  { strip spaces from the beginning and end of the name string }
  StripString(name);

  { parse string }
  if pos(',', name) > 0 then begin
    { lastname, firstname }
    ln := copy(name, 1, pos(',', name) -1);
    fn := copy(name, pos(',', name), length(name));
  end else begin
    { firstname lastname }
    ln := copy(name, LastDelimiter(' ', name), length(name));
    fn := copy(name, 1, LastDelimiter(' ', name) - 1);
  end;

  { strip fn and ln strings }
  StripString(fn);
  StripString(ln);

  { assign the strings to the proper contact fields }
  Contact.LastName := ln;
  Contact.FirstName := fn;
end;


procedure ParseCSZ(Str: string; var City, State, Zip: string);
var
  num: integer;
begin
  StripString(Str);

  if Pos(',', Str) > 0 then begin
    City := copy (Str, 1, pos(',', str) - 1);
    delete(str, 1, pos(',', str));
  end;

  num := LastDelimiter(' ', Str);

  if (num > 0)
  and (num < Length(Str))
  and (Str[num + 1] in ['0'..'9']) then begin
    Zip := copy(Str, num, length(Str));
    Delete(Str, num, length(str));
  end;

  State := Str;

  StripString(City);
  StripString(State);
  StripString(Zip);
end;

function WidthOf(const R : TRect) : Integer;
begin
  Result := R.Right - R.Left;
end;


function HeightOf(const R : TRect) : Integer;
begin
  Result := R.Bottom - R.Top;
end;


function GetDisplayString(Canvas : TCanvas; const S : string;
  MinChars, MaxWidth : Integer) : string;
const
  ELLIPSIS = '...';
var
  iDots, EllipsisWidth, Extent, Len, Width : Integer;
  ShowEllipsis : Boolean;
begin
  {be sure that the Canvas Font is set before entering this routine}
  EllipsisWidth := Canvas.TextWidth(ELLIPSIS);
  Len := Length(S);
  Result := S;
  Extent := Canvas.TextWidth(Result);
  ShowEllipsis := False;
  Width := MaxWidth;
  while (Extent > Width) do begin
    ShowEllipsis := True;
    Width := MaxWidth - EllipsisWidth;
    if Len > MinChars then begin
      Delete(Result, Len, 1);
      dec(Len);
    end else
      break;
    Extent := Canvas.TextWidth(Result);
  end;
  if ShowEllipsis then begin
    Result := Result + ELLIPSIS;
    inc(Len, 3);
    Extent := Canvas.TextWidth(Result);
    iDots := 3;
    while (iDots > 0) and (Extent > MaxWidth) do begin
      Delete(Result, Len, 1);
      Dec(Len);
      Extent := Canvas.TextWidth(Result);
      Dec(iDots);
    end;
  end;
end;

function GetDateDisplayString(ACanvas: TCanvas; ADate: TDateTime;
  AFormat, AHoliday: String; AWidth: Integer): String;
begin
  // Check long date format with holiday name
  if AHoliday <> '' then begin
    Result := Format('%s - %s', [FormatDateTime(AFormat, ADate), AHoliday]);
    if ACanvas.TextWidth(Result) <= AWidth then
      exit;

    // Check short date format with holiday name
    if AFormat <> 'ddddd' then begin
      Result := Format('%s - %s', [FormatDateTime('ddddd', ADate), AHoliday]);
      if ACanvas.TextWidth(Result) <= AWidth then
        exit;
    end;
  end;

  // Check long date format without holiday name
  Result := FormatDateTime(AFormat, ADate);
  if ACanvas.TextWidth(Result) <= AWidth then
    exit;

  // Check short date format without holiday name
  if AFormat <> 'ddddd' then begin
    Result := FormatDateTime('ddddd', ADate);
    if ACanvas.TextWidth(Result) <= AWidth then
      exit;
  end;

  // Chop off the short-date-format string and add '...'
  Result := GetDisplayString(ACanvas, Result, 0, AWidth);
end;


procedure DrawBevelRect(const Canvas: TCanvas; R: TRect;
  Shadow, Highlight: TColor);
begin
  with Canvas do
  begin
    Pen.Color := Shadow;
    PolyLine([Point(R.Left, R.Bottom), Point(R.Left, R.Top),
      Point(R.Right, R.Top)]);
    Pen.Color := Highlight;
    PolyLine([Point(R.Right, R.Top), Point(R.Right, R.Bottom),
      Point(R.Left, R.Bottom)]);
  end;
end;


function PointInRect(Point: TPoint; Rect: TRect): Boolean;
begin
  result := (Point.X >= Rect.Left) and (Point.X <= Rect.Right)
        and (Point.Y >= Rect.Top) and (Point.Y <= Rect.Bottom);
end;

//=== ct9999 ==================
function DaysInMonth(Year, Month: integer): integer;
begin
  if (Year < 100) then
    raise EVpDateException.Create(RSInvalidYear + ' "' + IntToStr(Year) + '"');
  case Month of
    1, 3, 5, 7, 8, 10, 12: Result := 31;
    4, 6, 9, 11: Result := 30;
    2: Result := 28 + Ord(IsLeapYear(Year));
    else
      Result := 0;
  end;
end;
//==================================

function DefaultEpoch : Integer;
var
  ThisYear   : Word;
  ThisMonth  : Word;
  ThisDay    : Word;
begin
  DecodeDate(SysUtils.Date, ThisYear, ThisMonth, ThisDay);
  Result := (ThisYear div 100) * 100;
end;

procedure GetRGB(Clr : TColor; var IR, IG, IB : Byte);
begin
  IR := GetRValue(Clr);
  IG := GetGValue(Clr);
  IB := GetBValue(Clr);
end;


function GetStartOfWeek(Date: TDateTime; StartOn: TVpDayType): TDateTime;
begin
  result := Date;
  case StartOn of
    dtSunday:    result := Date - (DayOfWeek(Date) - 1);
    dtMonday:    result := Date - (DayOfWeek(Date) - 2);
    dtTuesday:   result := Date - (DayOfWeek(Date) - 3);
    dtWednesday: result := Date - (DayOfWeek(Date) - 4);
    dtThursday:  result := Date - (DayOfWeek(Date) - 5);
    dtFriday:    result := Date - (DayOfWeek(Date) - 6);
    dtSaturday:  result := Date - (DayOfWeek(Date) - 7);
  end;
end;

function GetJulianDate(Date: TDateTime): Word;
var
  y, m, d, I: word;
  Julian: Word;
begin
  Julian := 0;
  DecodeDate(Date, y, m, d);

  { Inc Julian by the number of days in each of the elapsed months }
  for I := 1 to M do
    Inc(Julian, DaysInAMonth(Y, I));

  { add in the elapsed days from this month }
  Julian := Julian + D;

  { return the value }
  result := Julian;
end;


function GetTimeFormat: TVpTimeFormat;
var
  s: String;
  p: Integer;
begin
  s := lowercase(FormatDateTime('hh:nn ampm', 0.25));
  p := pos(lowercase(FormatSettings.TimeAMString), s);
  if p = Length(s) - Length(FormatSettings.TimeAMString) then
    Result := tf12Hour
  else
    Result := tf24Hour;
end;

function GetTimeFormatStr(ATimeFormat: TVpTimeFormat): String;
begin
  case ATimeFormat of
    tf12Hour: Result := 'hh:nn am/pm';
    tf24Hour: Result := 'hh:nn';
  end;
end;

function GranularityToStr(Gran: TVpGranularity): string;
begin
  Result := IntToStr(GranularityMinutes[Gran]);
end;

function HourToAMPM(Hour: TVpHours): string;
begin
  if (Hour >= H_00) and (Hour <= H_11) then
    Result := 'AM'
  else
    Result := 'PM';
end;

function HourToLine(const Value: TVpHours; const Granularity: TVpGranularity): Integer;
begin
  Result := Ord(Value) * 60 div GranularityMinutes[Granularity];
end;

function HourToStr(Hour: TVpHours; Mil: Boolean): string;
begin
  if Mil then
    Result := IntToStr(ord(Hour))
  else
  if ord(Hour) mod 12 = 0 then
    Result := '12'
  else
    Result := IntToStr(ord(Hour) mod 12);
end;

function GetStartLine(StartTime: TDateTime; Granularity: TVpGranularity): Integer;
var
  LineDuration: Double;    // percentage of a day covered by each line
  Time: Double;
begin
  { remove the date part, and add one minute to the time }
  Time := TimeOf(StartTime) + OneMinute;
  LineDuration := GranularityMinutes[Granularity] / MinutesInDay;
  result := trunc(Time / LineDuration);
end;


function GetEndLine(EndTime: TDateTime; Granularity: TVpGranularity): Integer;
var
  LineDuration: Double;    // percentage of a day covered by each line
  Time: Double;
begin
  { remove the date part, and subtract one minute from the time }
  Time := TimeOf(EndTime) - OneMinute;
  LineDuration := GranularityMinutes[Granularity] / MinutesInDay;
  result := trunc(Time / LineDuration);
end;


function GetAlarmAdvanceTime(Advance: Integer;
  AdvanceType: TVpAlarmAdvType): TDateTime;
begin
  result := 0.0;
  case AdvanceType of
    atMinutes : result := Advance * OneMinute;
    atHours   : result := Advance * OneHour;
    atDays    : result := Advance;
  end;
end;


{ Checks whether the given date value is within the specified date interval
  between StartDate and EndDate. If IncludeLimits is true then the function
  result is true also if the date is equal to the date parts of the StartDate
  or EndDate. }
function DateInRange(ADate, StartDate, EndDate: TDateTime;
  IncludeLimits: Boolean): Boolean;
begin
  ADate := trunc(ADate);
  StartDate := trunc(StartDate);
  EndDate := trunc(EndDate);
  Result := (StartDate < ADate) and (ADate < EndDate);
  if IncludeLimits and (not Result) then
    Result := (StartDate = ADate) or (EndDate = ADate);
end;

{ Checks whether the given time value is within the specified time interval
  between StartTime and EndTime. If IncludeLimits is true then the function
  result is true also if time is equal to the start or end times. Equality is
  checked with a precision of 0.1 sec (see: CompareTimeEps). }
function TimeInRange(ATime, StartTime, EndTime: TDateTime;
  IncludeLimits: Boolean): Boolean;
var
  equStart, equEnd: Boolean;
begin
  equStart := abs(ATime - StartTime) < CompareTimeEps;
  equEnd := abs(ATime - EndTime) < CompareTimeEps;

  if IncludeLimits then
    Result := equStart or equEnd  or ((ATime > StartTime) and (ATime < EndTime))
  else
    Result := (not equStart) and (not equEnd) and (ATime > StartTime) and (ATime < EndTime);
end;

{ Returns true of the two specified date/time variables have the same date part }
function SameDate(dt1, dt2: TDateTime): Boolean;
begin
  Result := trunc(dt1) = trunc(dt2);
end;

// Calculates ISO week number (checked with Jan 1, 2016, which is in week 53).
function GetWeekOfYear(ADate: TDateTime): byte;
// wp: was in TvWeekView.
var
  yr, dummy: word;
  First: TDateTime;
begin
  DecodeDate(ADate + (8 - DayOfWeek(ADate)) mod 7 - 3, yr, dummy,dummy);
  First := EncodeDate(yr, 1, 1);
  Result := trunc(ADate - First - 3 + (DayOfWeek(First) + 1) mod 7) div 7 + 1;
end;

// Returns true if the specified date is on the weekend.
function IsWeekend(ADate: TDateTime): Boolean;
begin
  Result := (DayOfWeek(ADate) in [1, 7]);
end;

function LineToStartTime(Line: Integer; Granularity: TVpGranularity): TDateTime;
begin
  Result := frac(Line * GranularityMinutes[Granularity] / MinutesInDay);
end;


function GetLineDuration(Granularity: TVpGranularity): Double;
begin
  Result := GranularityMinutes[Granularity] / MinutesInDay;
end;

function TaskPriorityToStr(APriority: TVpTaskPriority): String;
begin
  Result := '';
  case APriority of
    tpLow    : Result := RSLow;
    tpNormal : Result := RSNormal;
    tpHigh   : Result := RSHigh;
  end;
end;

function AutoHeight(ARadioGroup: TRadioGroup): Integer;
var
  w: Integer;
begin
  w := ARadioGroup.Width;
  ARadioGroup.AutoSize := true;
  Result := ARadioGroup.Height;
  ARadioGroup.AutoSize := false;
  ARadioGroup.Width := w;
end;

function GetLabelWidth(ALabel: TLabel): Integer;
var
  canvas: TControlCanvas;
begin
  canvas := TControlCanvas.Create;
  canvas.Control := ALabel;
  canvas.Font.Assign(ALabel.Font);
  Result := canvas.TextWidth(ALabel.Caption);
  canvas.Free;
end;

function GetButtonWidth(AButton: TButton): Integer;
const
  MARGIN = 24;
var
  canvas: TControlCanvas;
begin
  canvas := TControlCanvas.Create;
  canvas.Control := AButton;
  canvas.Font.Assign(AButton.Font);
  Result := canvas.TextWidth(AButton.Caption) + MARGIN * Screen.PixelsPerInch div DesignTimeDPI;
  canvas.Free;
end;

function GetRealFontHeight(AFont: TFont): Integer;
begin
  if AFont.Size = 0 then
    Result := GetFontData(AFont.Reference.Handle).Height * Screen.PixelsPerInch div DesignTimeDPI
  else
    Result := AFont.Height;
end;

{ Returns the coordinate of the control's right boundary }
function RightOf(AControl: TControl): Integer;
begin
  Result := AControl.Left + AControl.Width;
end;

{ Returns the coordinate of the control's bottom boundary }
function Bottomof(AControl: TControl): Integer;
begin
  Result := AControl.Top + AControl.Height;
end;

{ Replaces embedded C-style line endings (\n) by FPC line endings (#13#10, #13,
  #10, depending on system) }
function DecodeLineEndings(const AText: String): String;
begin
  Result := StringReplace(AText, '\n', LineEnding, [rfReplaceAll]);
end;

{ Replaces FPC line endings (#13#10, #13, #10, depending on system) by
  embedded C-style line endings (\n) }
function EncodeLineEndings(const AText: String): String;
begin
  Result := StringReplace(AText, LineEnding, '\n', [rfReplaceAll]);
end;

{ Makes sure that the string AText does not end with a line ending (#13#10,
  #13, #10, depending on system). }
function StripLastLineEnding(const AText: String): String;
begin
  Result := AText;
  while (Length(Result) > 0) and (Result[Length(Result)] in [#10, #13]) do
    Delete(Result, Length(Result), 1);
end;

procedure AddResourceGroupMenu(AMenu: TMenuItem; AResource: TVpResource;
  AEventHandler: TNotifyEvent);
var
  datastore: TVpCustomDatastore;
  grp: TVpResourceGroup;
  list: TList;
  newItem: TMenuItem;
  newSubItem: TMenuItem;
  i: Integer;
begin
  if (AMenu = nil) or (AResource = nil) or (AResource.Owner = nil) then
    exit;

  datastore := AResource.Owner.Owner as TVpCustomDatastore;

  if (RSPopupResourceGroups <> '') and
     (datastore <> nil) and (datastore.Resource <> nil) then
  begin
    list := TList.Create;
    try
      datastore.Resource.GetResourceGroups(list);
      if list.Count > 0 then begin
        newItem := TMenuItem.Create(AMenu.Owner);
        newItem.Caption := RSPopupResourceGroups;
        newItem.Tag := 0;
        AMenu.Add(newItem);

        newSubItem := TMenuItem.Create(AMenu.Owner);
        newSubItem.Caption := RSNoOverlayedEvents;
        newSubItem.OnClick := AEventHandler;
        newSubItem.GroupIndex := 1;
        newSubItem.AutoCheck := true;
        newSubItem.Checked := datastore.Resource.Group = nil;
        newSubItem.Tag := 0;
        newItem.Add(newSubItem);

        if list.Count > 1 then begin
          newSubItem := TMenuItem.Create(AMenu.Owner);
          newSubItem.Caption := '-';
          newItem.Add(newSubItem);
        end;

        for i:=0 to list.Count-1 do begin
          grp := TVpResourceGroup(list[i]);
          newSubItem := TMenuItem.Create(AMenu.Owner);
          newSubItem.Caption := grp.Caption;
          newSubItem.OnClick := AEventHandler;
          newSubItem.GroupIndex := 1;
          newSubItem.AutoCheck := true;
          newSubItem.Checked := (datastore.Resource.Group = grp);
          newSubItem.Tag := PtrInt(grp);
          newItem.Add(NewSubItem);
        end;
      end;
    finally
      list.Free;
    end;
  end;
end;

function OverlayPatternToBrushStyle(APattern: TVpOverlayPattern): TBrushStyle;
begin
  Result := TBrushStyle(APattern);
end;

procedure HighDPI(FromDPI: integer);
var
  i: integer;
begin
  if Screen.PixelsPerInch = FromDPI then
    exit;

  for i := 0 to Screen.FormCount - 1 do
    ScaleDPI(Screen.Forms[i], FromDPI);
end;

procedure ScaleDPI(Control: TControl; FromDPI: integer);
var
  i: integer;
  WinControl: TWinControl;
begin
  if Screen.PixelsPerInch = FromDPI then
    exit;

  with Control do
  begin
    Left := ScaleX(Left, FromDPI);
    Top := ScaleY(Top, FromDPI);
    Width := ScaleX(Width, FromDPI);
    Height := ScaleY(Height, FromDPI);
  end;

  if Control is TWinControl then
  begin
    WinControl := TWinControl(Control);
    if WinControl.ControlCount = 0 then
      exit;
    for i := 0 to WinControl.ControlCount - 1 do
      ScaleDPI(WinControl.Controls[i], FromDPI);
  end;
end;

{$PUSH}{$HINTS OFF}
procedure Unused(const A1);
begin
end;

procedure Unused(const A1, A2);
begin
end;

procedure Unused(const A1, A2, A3);
begin
end;
{$POP}

end.
