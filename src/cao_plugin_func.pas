// allg. Funktionen für die Plugin-Einbindung CAO - Faktura
// diese Unit wird nur von CAO und nicht von der Plugin-DLL verwendet

// Stand 01.03.2004 © 2004 JP
{
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_plugin_func;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

interface

uses
  Windows, cao_plugin_def, cao_dm;

function GetCaoRegistryFunc : tCaoRegistry;

implementation

var GlobalCaoRegistry : tCaoRegistry;
    S : String; // glob. String, wichtig, da Rückgabewerte vom Typ PChar
                // hier nur einen Pointer auf eine Variable übergeben

//------------------------------------------------------------------------------
// Die Folgenden Funktionen dienen als Wrapper-Funktionen um aus einer
// Plugin-DLL einen Zugriff auf die SQL-Registry von CAO u erhalten
//------------------------------------------------------------------------------
procedure SqlRegWriteString (Key, Name, Value : PChar); stdcall;
begin
     if assigned(DM1) then DM1.WriteString (Key,Name,Value);
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteStringU (Key, Name, Value : PChar); stdcall;
begin
     if assigned(DM1) then DM1.WriteStringU (Key,Name,Value);
end;
//------------------------------------------------------------------------------
function SqlRegReadString (Key, Name, Default : PChar):PChar; stdcall;
begin
     S :=Default;
     if assigned(DM1) then S :=DM1.ReadString (Key,Name,Default);
     S :=S+#0;
     Result :=PChar(@S[1]);
end;
//------------------------------------------------------------------------------
function SqlRegReadStringU (Key, Name, Default : PChar):PChar; stdcall;
begin
     S :=Default;
     if assigned(DM1) then S :=DM1.ReadStringU (Key,Name,Default);
     S :=S+#0;
     Result :=@S[1];
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteLongString (Key, Name, Value : PChar); stdcall;
begin
     if assigned(DM1) then DM1.WriteLongString (Key,Name,Value);
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteLongStringU (Key, Name, Value : PChar); stdcall;
begin
     if assigned(DM1) then DM1.WriteLongStringU (Key,Name,Value);
end;
//------------------------------------------------------------------------------
function SqlRegReadLongString (Key, Name, Default : PChar):PChar; stdcall;
begin
     S :=Default;
     if assigned(DM1) then S :=DM1.ReadLongString (Key,Name,Default);
     S :=S+#0;
     Result :=@S[1];
end;
//------------------------------------------------------------------------------
function SqlRegReadLongStringU      (Key, Name, Default : PChar):PChar; stdcall;
begin
     S :=Default;
     if assigned(DM1) then S :=DM1.ReadLongStringU (Key,Name,Default);
     S :=S+#0;
     Result :=@S[1];
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteBoolean (Key, Name :PChar; Value : Boolean); stdcall;
begin
     if assigned(DM1) then DM1.WriteBoolean (Key,Name,Value);
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteBooleanU (Key, Name : PChar; Value : Boolean); stdcall;
begin
     if assigned(DM1) then DM1.WriteBooleanU (Key,Name,Value);
end;
//------------------------------------------------------------------------------
function SqlRegReadBoolean (Key, Name : PChar; Default : Boolean): Boolean; stdcall;
begin
     if assigned(DM1)
      then Result :=DM1.ReadBoolean (Key,Name,Default)
      else Result :=Default;
end;
//------------------------------------------------------------------------------
function SqlRegReadBooleanU (Key, Name : PChar; Default : Boolean): Boolean; stdcall;
begin
     if assigned(DM1)
      then Result :=DM1.ReadBooleanU (Key,Name,Default)
      else Result :=Default;
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteInteger (Key, Name :PChar; Value : Integer); stdcall;
begin
     if assigned(DM1) then DM1.WriteInteger (Key,Name,Value);
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteIntegerU (Key, Name : PChar; Value : Integer); stdcall;
begin
     if assigned(DM1) then DM1.WriteIntegerU (Key,Name,Value);
end;
//------------------------------------------------------------------------------
function SqlRegReadInteger (Key, Name : PChar; Default : Integer): Integer; stdcall;
begin
     if assigned(DM1)
      then Result :=DM1.ReadInteger (Key,Name,Default)
      else Result :=Default;
end;
//------------------------------------------------------------------------------
function SqlRegReadIntegerU (Key, Name : PChar; Default : Integer): Integer; stdcall;
begin
     if assigned(DM1)
      then Result :=DM1.ReadIntegerU (Key,Name,Default)
      else Result :=Default;
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteDouble (Key, Name :PChar; Value : Double); stdcall;
begin
     if assigned(DM1) then DM1.WriteDouble (Key,Name,Value);
end;
//------------------------------------------------------------------------------
procedure SqlRegWriteDoubleU (Key, Name : PChar; Value : Double); stdcall;
begin
     if assigned(DM1) then DM1.WriteDoubleU (Key,Name,Value);
end;
//------------------------------------------------------------------------------
function SqlRegReadDouble (Key, Name : PChar; Default : Double): Double; stdcall;
begin
     if assigned(DM1)
      then Result :=DM1.ReadDouble (Key,Name,Default)
      else Result :=Default;
end;
//------------------------------------------------------------------------------
function SqlRegReadDoubleU (Key, Name : PChar; Default : Double): Double; stdcall;
begin
     if assigned(DM1)
      then Result :=DM1.ReadDoubleU (Key,Name,Default)
      else Result :=Default;
end;
//------------------------------------------------------------------------------
// globales Array mit Funktionspointern erzeugen
//------------------------------------------------------------------------------
function GetCaoRegistryFunc : tCaoRegistry;
begin
     GlobalCaoRegistry.ReadBoolean       :=SqlRegReadBoolean;
     GlobalCaoRegistry.ReadBooleanU      :=SqlRegReadBooleanU;
     GlobalCaoRegistry.ReadDouble        :=SqlRegReadDouble;
     GlobalCaoRegistry.ReadDoubleU       :=SqlRegReadDoubleU;
     GlobalCaoRegistry.ReadInteger       :=SqlRegReadInteger;
     GlobalCaoRegistry.ReadIntegerU      :=SqlRegReadIntegerU;
     GlobalCaoRegistry.ReadLongString    :=SqlRegReadLongString;
     GlobalCaoRegistry.ReadLongStringU   :=SqlRegReadLongStringU;
     GlobalCaoRegistry.ReadString        :=SqlRegReadString;
     GlobalCaoRegistry.ReadStringU       :=SqlRegReadStringU;

     GlobalCaoRegistry.WriteBoolean      :=SqlRegWriteBoolean;
     GlobalCaoRegistry.WriteBooleanU     :=SqlRegWriteBooleanU;
     GlobalCaoRegistry.WriteDouble       :=SqlRegWriteDouble;
     GlobalCaoRegistry.WriteDoubleU      :=SqlRegWriteDoubleU;
     GlobalCaoRegistry.WriteInteger      :=SqlRegWriteInteger;
     GlobalCaoRegistry.WriteIntegerU     :=SqlRegWriteIntegerU;
     GlobalCaoRegistry.WriteLongString   :=SqlRegWriteLongString;
     GlobalCaoRegistry.WriteLongStringU  :=SqlRegWriteLongStringU;
     GlobalCaoRegistry.WriteString       :=SqlRegWriteString;
     GlobalCaoRegistry.WriteStringU      :=SqlRegWriteStringU;

     Result :=GlobalCaoRegistry;
end;
//------------------------------------------------------------------------------
// INIT
//------------------------------------------------------------------------------
begin
     // glob. Variablen mit nil initialisieren

     GlobalCaoRegistry.ReadBoolean       :=nil;
     GlobalCaoRegistry.ReadBooleanU      :=nil;
     GlobalCaoRegistry.ReadDouble        :=nil;
     GlobalCaoRegistry.ReadDoubleU       :=nil;
     GlobalCaoRegistry.ReadInteger       :=nil;
     GlobalCaoRegistry.ReadIntegerU      :=nil;
     GlobalCaoRegistry.ReadLongString    :=nil;
     GlobalCaoRegistry.ReadLongStringU   :=nil;
     GlobalCaoRegistry.ReadString        :=nil;
     GlobalCaoRegistry.ReadStringU       :=nil;

     GlobalCaoRegistry.WriteBoolean      :=nil;
     GlobalCaoRegistry.WriteBooleanU     :=nil;
     GlobalCaoRegistry.WriteDouble       :=nil;
     GlobalCaoRegistry.WriteDoubleU      :=nil;
     GlobalCaoRegistry.WriteInteger      :=nil;
     GlobalCaoRegistry.WriteIntegerU     :=nil;
     GlobalCaoRegistry.WriteLongString   :=nil;
     GlobalCaoRegistry.WriteLongStringU  :=nil;
     GlobalCaoRegistry.WriteString       :=nil;
     GlobalCaoRegistry.WriteStringU      :=nil;
end.
//------------------------------------------------------------------------------
