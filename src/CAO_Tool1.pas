{

CAO-Faktura für Windows Version 1.0
Copyright (C) 2003 Jan Pokrandt / Jan@JP-SOFT.de

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************

Programm     : CAO-Faktura
Modul        : CAO_TOOL1
Stand        : 26.10.2003
Version      : 1.1.3.24
Beschreibung : 2 Funktionen, die von den Journalen zur Ermittlung des
               Klartext-Status (Stadium) verwendet werden

History      :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
17.01.2002 - Glob. Variable IsNT + Betriebssystemerkennung eingebaut
10.05.2003 - Funktion GetEKBestStatus hinzugefügt
29.07.2003 - neue Zahlungsarten hinzugefügt
26.10.2003 - neue Funktion CAO_ROUND hinzugefügt, die richtig rundet ;-)
             ab 0,5 wird aufgerundet (Kaufmännisch)
15.03.2004 - Diverse Datumsfunktionen hinzugefügt
13.04.2004 - Funktionen zur Prüfung von EMail eingebunden (von LEXA)
           - Funktion zur umwandlung von bel. Text in Dateinamen eingebunden
             (von LEXA)

-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

//------------------------------------------------------------------------------
unit CAO_Tool1;

{$IFDEF FPC} {$MODE DELPHI} {$H+} {$ENDIF}

{$I CAO32.INC}

//------------------------------------------------------------------------------
interface

{$R-}

uses Windows;
//------------------------------------------------------------------------------
FUNCTION GetRechStatus(NumStatus:Byte;Quelle:Integer) : String;
FUNCTION GetLiefStatus(NumStatus:Byte; Print : Boolean) : String;
FUNCTION GetEKBestStatus(NumStatus:Byte) : String;
function CAO_ROUND (Val : Extended): Int64;
function tapiRequestMakeCall( lpszDestAddress,
                              lpszAppName,
                              lpszCalledParty,
                              lpszComment: LPCSTR): DWORD; stdcall;

function Kalenderwoche(Datum:TDateTime) : byte;
function FirstDayOfWeek (D : tDateTime) : tDateTime; // liefert Mo der Woche
function LastDayOfWeek  (D : tDateTime) : tDateTime; // liefert So der Woche

function StringToFilename(StringToConvert: String; MaxLength: integer): String;

{ Convert float value to string with '.' delimiter }
function FloatToStrEx(Value: Double): string;

{ Format date in ISO format }
function FormatSqlDate(Value: TDateTime): string;

{ Form number with leading zeros }
function FormatNumber(Value, Width: Word): string;

{ Format time in ISO format }
function FormatSqlTime(Value: TDateTime): string;

{ Convert TDateTime to SQL Ansi-92 Date }
function DateTimeToSqlDate(Value: TDateTime): string;

function Get_File_Size(sFileToExamine: string; bInKBytes: Boolean): Integer;

var IsNT : boolean;  // True, Wenn Windown NT, 2000 oder XP
//------------------------------------------------------------------------------
implementation

uses cao_var_const, sysutils;
//------------------------------------------------------------------------------
function tapiRequestMakeCall; external 'TAPI32.DLL' name 'tapiRequestMakeCall';
//------------------------------------------------------------------------------
function CAO_ROUND (Val : Extended): Int64;
begin
     if Val>0
      then Result :=Trunc(Trunc((Val+0.5)*100)/100)
      else Result :=Trunc(Trunc((Val-0.5)*100)/100);
end;
//------------------------------------------------------------------------------
FUNCTION GetLiefStatus(NumStatus:Byte; Print : Boolean) : String;
var status : string[20];
begin
     if print then
     begin
       case NumStatus of
         00..19 : status :='  bearbeiten  ';
         20..79 : status :=' LS gedruckt  ';
         80..99 : status :='LS+RE gedruckt';
         else     status :='- UNBEKANNT - ';
       end;
     end
        else
     begin
       case NumStatus of
         00..19 : status :='  bearbeiten  ';
         20..99 : status :='nicht gedruckt';
         else     status :='- UNBEKANNT - ';
       end;
     end;
     Result :=Status;
end;
//------------------------------------------------------------------------------
FUNCTION GetEKBestStatus(NumStatus:Byte) : String;
var status : string[20];
begin
     case NumStatus of
       00..19 : status :='bearbeiten';
       20     : status :='offen';
       30     : status :='Teillieferung';
       100    : status :='voll geliefert';
       101    : status :='nicht lieferbar';
       else     status :='- UNBEKANNT - ';
     end;
     Result :=Status;
end;
//------------------------------------------------------------------------------
FUNCTION GetRechStatus(NumStatus:Byte;Quelle:Integer) : String;
var status : string[20];
begin
     case NumStatus of
      00..09 : status :='editieren       ';
      10..19 : status :='Liefersch. gedr.';
      20     : status :='Vorkasse offen  ';
      21..23 : status :='-> o f f e n <- ';
      24     : status :='Nachnahme offen ';
      25     : status :='-> o f f e n <- ';
      26     : status :='EC-KARTE        ';
      27     : status :='Kreditkarte     ';
      28     : status :='PayPal          ';
      29     : status :='off. Lastschrift';
      30..39 : status :='1x gemahnt      ';
      40..49 : status :='2x gemahnt      ';
      50..59 : status :='3x gemahnt      ';
      60..69 : status :='INKASSO ! ';
      70..79 : status :='Teilzahlung';

      80     : status :='Vorkasse m. Sk. ';
      81     : status :='BAR mit Skonto  ';
      82     : status :='Überw. m. Skonto';
      83     : status :='Post NN m. Sk.  ';
      84     : status :='UPS NN m. Sk.   ';
      85     : status :='Scheck m. Skonto';
      86     : status :='EC-Karte m. Sk. ';
      87     : status :='Kreditk. m. Sk  ';
      88     : status :='PayPal          ';
      89     : status :='Lastschr. m. Sk.';

      90     : status :='Vorkasse        ';
      91     : status :='BAR erhalten    ';
      92     : status :='Überweisung BANK';
      93     : status :='Post Nachnahme  ';
      94     : status :='UPS Nachnahme   ';
      95     : status :='Scheck erhalten ';
      96     : status :='EC-KARTE        ';
      97     : status :='Kreditkarte     ';
      98     : status :='PayPal          ';
      99     : status :='Lastschrift     ';
      110    : if Quelle = VK_RECH
                then status :='Lastschrift'
                else status :='Angewiesen';
      else     status :='-  UNBEKANNT  - ';
     end;
     Result :=Status;
end;
//------------------------------------------------------------------------------
{
*** Bemerkungen zur Berechnung der Wochennummer nach DIN 1355 ***
Der Montag ist der erste Tag der Woche
Eine Woche gehört zu demjenigen Kalenderjahr,
in dem 3 oder mehr Tage der Woche liegen.
Der Donnerstag einer Woche liegt immer in demjenigen Kalenderjahr,
dem die Woche zugerechnet wird.
Der 4. Januar liegt immer in der ersten Kalenderwoche.
Der 28. Dezember liegt immer in der letzten Kalenderwoche. }

//Quelle : http://www.delphi-fundgrube.de/faq04.htm

function Kalenderwoche(Datum:TDateTime):byte;
var
  AYear,
  dummy : word;
  First : TDateTime;
begin
  DecodeDate(Datum+((8-DayOfWeek(Datum)) mod 7)-3, AYear, dummy, dummy);
  First := EncodeDate(AYear, 1, 1);
  Result:=(trunc(Datum-First-3+(DayOfWeek(First)+1) mod 7) div 7)+1;
end;

//------------------------------------------------------------------------------
function FirstDayOfWeek (D : tDateTime) : tDateTime; // liefert Mo der Woche
var WT : Integer;
begin
   D :=Int(D);  // nur Datum ohne Zeit
   WT :=DayOfWeek (D); //Wochentag ermitteln 1=So, 2=Mo ...
   if WT=1 then WT :=8; // Montag bleibt 2, Sonntag = 8
   dec(WT,2); // 0=Montag, 1= Dienstag u.s.w.

   if WT>0 then D :=D-WT; // Wenn akt. Tag > Montag, dann x Tage abziehen um
                          // den Montag zu erhalten
   Result :=D;
end;
//------------------------------------------------------------------------------
function LastDayOfWeek  (D : tDateTime) : tDateTime; // liefert So der Woche
var WT : Integer;
begin
   D :=Int(D);  // nur Datum ohne Zeit
   WT :=DayOfWeek (D); //Wochentag ermitteln 1=So, 2=Mo ...
   if WT=1 then WT :=8; // Montag bleibt 2, Sonntag = 8
   dec(WT,2); // 0=Montag, 1= Dienstag u.s.w.

   if WT<6 then D :=D+6-WT; // Wenn akt. Tag < Sonntag, dann x Tage
                            // hinzuaddieren um den Sonntag zu erhalten
   Result :=D;
end;
//------------------------------------------------------------------------------



function StringToFilename(StringToConvert: String; MaxLength: integer): String;
{*** function by lexa for CAO-Faktura MailClient, 31.3.2004 ***}
//
// Wandelt einen beliebigen String in einen gültigen Windows-Dateinamen um
// Der Name wird aus 'StringToConvert' generiert.
//
// * Prüfkriterien für 'StringToConvert':
//   - ungültige Zeichen werden ersetzt durch DefaultReplaceChar
//     Es werden auch Sonderzeichen abgefangen, z.B. ALT+0160 auf Num-Block
//   - Punkte, Kommas, Leerzeichen usw. am Anfang und Ende werden entfernt (TrimString)
//   - Falsche Hochkommas sind in Dateinamen prinzipiell gültig, diese werden aber
//     trotzdem ersetzt durch normales Hochkomma -> ' (für Samba gut???)
//   - Der String wird bei MaxLength abgeschnitten.
//       : Ist MaxLength > MaxAllowedLength wird MaxLength auf MaxAllowedLength gesetzt
//       : Ist MaxLength ungültig (kleiner 1), wird MaxLength auf MaxAllowedLength gesetzt
//   - Ist der generierte Name ein Windows Gerätename, wird er geändert (con, aux, ...)
//
// * Rückgabewerte
//   - Ein Kennzeichner (Marker) kann optional vorangestellt werden: 'CAO-MC ' + ...
//   - OKAY: Ist der Rückgabewert <> '', wurde ein gültiger Dateiname generiert
//   - ERROR: Ist der Rückgabewert = '', konnte aus folgenden Gründen kein Name generiert werden:
//       : der String war von Anfang an leer, oder
//       : der String enthielt ausschließlich ungültige Zeichen und ist nach dem Filtern leer
//   - Die Datei-Erweiterung wird NICHT geliefert und muss außerhalb angehängt werden (.html etc.)
// -----------------------------------------------------------------------------

const
   // gültige Zeichen f. einen Dateinamen. Bei Bedarf solche nachrüsten: ô, á ... etc.
   // Euro Zeichen '€' rausgenommen, kann Probleme auf WinNT machen (??)
   // Nach Test wieder einfügen (NT mit SP5 sollte jeder haben)
   ValidChars: set of char = ['A'..'Z','a'..'z','0','1',
                              '2','3','4','5','6','7','8','9',Char(142),
                              Char(153),Char(154),Char(132),Char(148),Char(129),
                              Char(225),Char(44),'_','-','+',' ','~','#','(',')','=','[',']',
                              '&','%',';','^','{','}','.'];

   // ungültige Zeichen werden durch dieses ersetzt.
   // Optional änderbar, ABER es darf NICHT in CharsToDel enthalten sein!!!
   DefaultReplaceChar = '_';

   // diese Zeichen werden am Anfang u. Ende des Strings ersatzlos gelöscht
   CharsToDel: set of char = [' ', '.', ',', ';'];

   // max. Länge des Dateinamens
   // Windows FAT : max. 255 Zeichen Dateiname inkl. Pfad
   // Windows NTFS: max. 255 Zeichen Dateiname, Pfad unbegrenzt
   MaxAllowedLength = 45; // Zeichen

   // sicherheitshalber Gerätenamen abfangen!
   InvalidFilenames: array[1..3] of String = ('nul', 'aux', 'con');

   // Optional. Wird jedem generierten Dateinamen vorangesetzt, kann auch leer sein
   // und ist dann wirkungslos. Kennzeichnet den Ursprung der Datei
   CAO_Marker: String = 'CAO-MC ';

var
   i: integer;

   { Sub-Function }
   function StringIsConvertable(s: String): boolean;
   // ist ein konvertierbarer String vorhanden? d.h. <> '' und nach Löschen führender
   // u. abschließender Zeichen verbleibt mindestens 1 gültiges oder ungültiges Zeichen
   var
      b: boolean;
      i: integer;
   begin
      if (length(s) = 0) then                // der String ist leer
      begin
         b := false;
      end
       else
      begin
         b := true;
         for i := 1 to length(s) do          // ist mindestens 1 gültiges Zeichen drin?
         begin
            if not (s[i] in CharsToDel) then break;
         end;
         if i > length(s) then
            b := false;                      // enthält kein gültiges Zeichen
      end;
      StringIsConvertable := b;
   end;

   { Sub-Function }
   function TrimString(s: String): String;
   // Punkte, Kommas, Leerzeichen usw. (CharsToDel) am Anfang u. Ende entfernen
   // Der String kann am Ende leer sein, darf aber nicht leer reinkommen!
   begin
      while (length(s) > 0) and (s[1] in CharsToDel) do          // führende CharsToDel entfernen
         s := copy(s, 2, length(s));
      while (length(s) > 0) and (s[length(s)] in CharsToDel) do // abschließende CharsToDel entfernen
         s := copy(s, 1, length(s) - 1);
      TrimString := s;
   end;

   { Sub-Function }
   function ReplaceWrongApostrophes(s: String): String;
   // ersetzt 'falsche' Hochkommas (stört evtl. auf Samba Shares)
   var
      i: integer;
   const
      ap1 = Char(96);
      ap2 = Char(239);

   const
      WrongApostrophes: set of char = [ap1,ap2];
      GoodApostrophe = '''';   // normales Hochkomma -> '
   begin
      for i := 1 to length(s) do if s[i] in WrongApostrophes then
         s[i] := GoodApostrophe;
      ReplaceWrongApostrophes := s;
   end;

{ Main-Function }
begin
   // ist StringToConvert leer bzw. überhaupt konvertierbar?
   if not StringIsConvertable(StringToConvert) then
   begin
      StringToFilename := '';
      exit;
   end;

   // String trimmen (führende/abschließende Leerzeichen etc)
   StringToConvert := TrimString(StringToConvert);

   // ist StringToConvert nach dem Trimmen konvertierbar oder leer?
   if not StringIsConvertable(StringToConvert) then
   begin
      StringToFilename := '';
      exit;
   end;

   // MaxLength (gewünschte maximale Stringlänge) prüfen bzw. korrigieren
   if (MaxLength > MaxAllowedLength) or (MaxLength < 1) then
      MaxLength := MaxAllowedLength;

   // 'falsche' Hochkommas ersetzen
   StringToConvert := ReplaceWrongApostrophes(StringToConvert);

   // CAO_Marker vor den Betreff setzen (Dateiursprung kennzeichnen)
   // Der Marker kann leer sein und hat dann keine Funktion
   StringToConvert := CAO_Marker + StringToConvert;

   // String auf MaxLength abschneiden
   StringToConvert := copy(StringToConvert, 1, MaxLength);

   // ungültige Dateinamen-Zeichen im verbliebenen String ersetzen
   for i := 1 to length(StringToConvert) do
   begin
      if not (char(StringToConvert[i]) in ValidChars) then
         StringToConvert[i] := DefaultReplaceChar;
   end;

   // reservierte Gerätenamen abfangen, falls Windows das mal vergißt ;-)
   // Ist nicht nötig, wenn der Marker davorsteht
   if (CAO_Marker = '') then
   begin
      for i := low(InvalidFilenames) to high(InvalidFilenames) do
      begin
         if lowercase(InvalidFilenames[i]) = lowercase(StringToConvert) then
            StringToConvert := DefaultReplaceChar + StringToConvert;
      end;
   end;

   // hier ist StringToConvert niemals leer !!
   StringToFilename := StringToConvert;

end; { Main-Function }


//------------------------------------------------------------------------------
//     *** function by lexa for CAO-Faktura MailClient, 04.04.2004 ***
//------------------------------------------------------------------------------
function ValidateEMailAdresse(Adresse: string): boolean;

// Lockere Prüfung eines Strings anhand RFC #822 auf einige Merkmale einer
// Mailadresse mit Domänenpart oder IP-Adresse
// Quellen:
//  - RFC #733 (veraltet), RFC #822 (ersetzt RFC #733, Format von Internet-Mails
//  - RFC #822: die Adresse darf Leerzeichen enthalten,
//              wenn gequotet: "Hans Wurst"@foo.bar
//              (Relikt aus RFC #733, deshalb hier 'verboten')
//  - RFC #733: der lokale Part muss keinen Domänenpart enthalten, "ich@daheim"
//              ist nach RFC #733  gültig, jedoch nicht nach RFC #822 und
//              deshalb hier 'verboten' }
//
// Return: FALSE: der String kann keine gültige Mailadresse sein
//         TRUE : der String ist als Mailadresse zulässig
//                (blah@da.heim, foo@192.168.1.1)
const
   Punkt = '.';
   At = '@';
   ValidChars: set of char =[At, 'A'..'Z', '0'..'9', Punkt, '-', '_', '[', ']'];

var
   s: String;
   b: boolean;
   i: integer;

begin
      b := true;
      Adresse := uppercase(Adresse);

      // String hat zu wenig Zeichen oder enthält nicht '@'
      if (length(Adresse) <= 4) or (pos(At, Adresse) = 0) then
         b := false;

      // Domänenpart oder IP Adresse vorhanden?
      //(mind. ein '.' MUSS rechts vom '@' enthalten sein)
      if b then
      begin
         s := copy( Adresse,
                    pos(At, Adresse) + 1,
                    length(Adresse) - pos(At, Adresse) + 1);

         if (pos(Punkt, s) = 0) or (s[1] = Punkt) or (s[length(s)] = Punkt)
          then b := false;
      end;

      // ungültige Zeichen enthalten?
      if b then
      begin
         for i := 1 to length(Adresse) do
         begin
            if not (Adresse[i] in ValidChars) then
            begin
               b := false;
               break;
            end; {if}
         end; {for }
      end;

      ValidateEMailAdresse := b;
end;
//------------------------------------------------------------------------------
{ Convert float value to string with '.' delimiter }
function FloatToStrEx(Value: Double): string;
var
  Temp: Integer;
begin
  Result := FloatToStr(Value);
  if DefaultFormatSettings.DecimalSeparator <> '.' then
  begin
    Temp := AnsiPos(DefaultFormatSettings.DecimalSeparator,Result);
    if Temp <> 0 then Result[Temp] := '.';
  end;
end;
//------------------------------------------------------------------------------
{ Format date in ISO format }
function FormatSqlDate(Value: TDateTime): string;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Value, Year, Month, Day);
  Result := FormatNumber(Year, 4) + '-' + FormatNumber(Month, 2)
    + '-' + FormatNumber(Day, 2);
end;
//------------------------------------------------------------------------------
{ Form number with leading zeros }
function FormatNumber(Value, Width: Word): string;
begin
  Result := IntToStr(Value);
  while Length(Result) < Width do
    Result := '0' + Result;
end;
//------------------------------------------------------------------------------
{ Format time in ISO format }
function FormatSqlTime(Value: TDateTime): string;
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(Value, Hour, Min, Sec, MSec);
  Result := FormatNumber(Hour, 2) + ':' + FormatNumber(Min, 2)
    + ':' + FormatNumber(Sec, 2);
end;
//------------------------------------------------------------------------------
{ Convert TDateTime to SQL Ansi-92 Date }
function DateTimeToSqlDate(Value: TDateTime): string;
begin
  Result := '';
  if Trunc(Value) <> 0 then
    Result := FormatSqlDate(Value);
  if Frac(Value) <> 0 then
  begin
    if Result <> '' then
      Result := Result + ' ';
    Result := Result + FormatSqlTime(Value);
  end;
end;
//------------------------------------------------------------------------------
function Get_File_Size(sFileToExamine: string; bInKBytes: Boolean): Integer;
var
  SearchRec: TSearchRec;
  sgPath: string;
  inRetval, I1: Integer;
begin
  sgPath := ExpandFileName(sFileToExamine);
  try
    inRetval := FindFirst(ExpandFileName(sFileToExamine), faAnyFile, SearchRec);
    if inRetval = 0 then
      I1 := SearchRec.Size
    else
      I1 := -1;
  finally
    SysUtils.FindClose(SearchRec);
  end;
  Result := I1;
end;
//------------------------------------------------------------------------------
// Unit-Init
//------------------------------------------------------------------------------
var JvVerInf : TOSVersionInfo;
begin
   IsNT:=false;
   JvVerInf.dwOSVersionInfoSize:=sizeof(JvVerInf);
   if (GetVersionEx(JvVerInf))
    then IsNT:=JvVerInf.dwPlatformId=VER_PLATFORM_WIN32_NT;
end.
//------------------------------------------------------------------------------

