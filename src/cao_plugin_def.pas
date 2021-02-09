// Definitionen Plugin-Einbindung für CAO - Faktura
{
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_plugin_def;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

interface

uses
  Windows;

Const
  // dient vor allem als Information in welches Menue die Funktion
  // eingefügt wird.
  ARTIKEL_PLUGIN    : Integer = 100;
  ADRESS_PLUGIN     : Integer = 200;

  // dient als Info von welchem Programmteil das Plugin
  // aufgerufen wurde
  ARTIKEL_SUCHE_CMD : Integer = 110;
  ADRESS_SUCHE_CMD  : Integer = 210;


// diese Daten ruft das Hauptprogramm mit GetInfo ab
type
  TPlugInfo = record
    Name    : PChar;    // Plugin-Name (freie Bezeichnung)
    APP     : PChar;    // hier muss "CAO" stehen
    Id      : Integer;  // ID der DLL bzw. des Plugins
    Autor   : PChar;    // Name des Entwicklers
    About   : PChar;    // Info
  end;

type
  TPlunginFunktionInfo = record
    Typ     : integer;  // ARTIKEL_PLUGIN oder ADRESS_PLUGIN
    Cmd     : integer;
    Caption : PChar;    // Menuetext
  end;


// Diese Daten werden vom Programm an das Plugin beim
// Aufruf der ExecuteCmd-Funktion übergebén

  TDBInfo = record
    Host	: PChar;
    Database 	: PChar;
    Login	: PChar;
    Password	: PChar;
    Fkt		: Integer;  //ARTIKEL_CMD oder ADRESS_CMD
    Rec_Id	: Integer;  // Datensatznummer
  end;

// Diese Funktionen müssen im Plugin implementiert sein
// GetInfo wird beim Start des Main aufgerufen
  TCaoPluginInfo = function (var Info : Array of TPlunginFunktionInfo) : TPluginfo; StdCall;

// ExecuteCmd wird beim Aktivieren des Menues aufgerufen
// Wenn der Result-String nicht leer ist wird eine select
// Anweisung ausgeführt un der Result-Teil als where-Clausel
// angehängt
  TCaoPluginExecCmd = function(Typ, Cmd, Rechte : Integer;
                               var Res : PChar) : Boolean; StdCall;


//Hilfsfunktionen um aus der DLL auf die SQL-Registry von CAO zuzugreifen

  tSqlRegWriteString       = procedure (Key, Name, Value : PChar); stdcall;
  tSqlRegReadString        = function  (Key, Name, Default : PChar):PCHar; stdcall;
  tSqlRegWriteBoolean      = procedure (Key, Name : PChar; Value : Boolean); stdcall;
  tSqlRegReadBoolean       = function  (Key, Name : PChar; Default : Boolean):Boolean; stdcall;
  tSqlRegWriteInteger      = procedure (Key, Name : PChar; Value : Integer); stdcall;
  tSqlRegReadInteger       = function  (Key, Name : PChar; Default : Integer):Integer; stdcall;
  tSqlRegWriteDouble       = procedure (Key, Name : PChar; Value : Double); stdcall;
  tSqlRegReadDouble        = function  (Key, Name : PChar; Default : Double):Double; stdcall;
  tSqlRegWriteLongString   = procedure (Key, Name, Value : PChar); stdcall;
  tSqlRegReadLongString    = function  (Key, Name, Default : PChar):PCHar; stdcall;

  tSqlRegWriteStringU      = procedure (Key, Name, Value : PChar); stdcall;
  tSqlRegReadStringU       = function  (Key, Name, Default : PChar):PCHar; stdcall;
  tSqlRegWriteBooleanU     = procedure (Key, Name : PChar; Value : Boolean); stdcall;
  tSqlRegReadBooleanU      = function  (Key, Name : PChar; Default : Boolean):Boolean; stdcall;
  tSqlRegWriteIntegerU     = procedure (Key, Name : PChar; Value : Integer); stdcall;
  tSqlRegReadIntegerU      = function  (Key, Name : PChar; Default : Integer):Integer; stdcall;
  tSqlRegWriteDoubleU      = procedure (Key, Name : PChar; Value : Double); stdcall;
  tSqlRegReadDoubleU       = function  (Key, Name : PChar; Default : Double):Double; stdcall;
  tSqlRegWriteLongStringU  = procedure (Key, Name, Value : PChar); stdcall;
  tSqlRegReadLongStringU   = function  (Key, Name, Default : PChar):PCHar; stdcall;

  tCaoRegistry = Record
     WriteString         : tSqlRegWriteString;
     ReadString          : tSqlRegReadString;
     WriteBoolean        : tSqlRegWriteBoolean;
     ReadBoolean         : tSqlRegReadBoolean;
     WriteInteger        : tSqlRegWriteInteger;
     ReadInteger         : tSqlRegReadInteger;
     WriteDouble         : tSqlRegWriteDouble;
     ReadDouble          : tSqlRegReadDouble;
     WriteLongString     : tSqlRegWriteLongString;
     ReadLongString      : tSqlRegReadLongString;

     WriteStringU        : tSqlRegWriteStringU;
     ReadStringU         : tSqlRegReadStringU;
     WriteBooleanU       : tSqlRegWriteBooleanU;
     ReadBooleanU        : tSqlRegReadBooleanU;
     WriteIntegerU       : tSqlRegWriteIntegerU;
     ReadIntegerU        : tSqlRegReadIntegerU;
     WriteDoubleU        : tSqlRegWriteDoubleU;
     ReadDoubleU         : tSqlRegReadDoubleU;
     WriteLongStringU    : tSqlRegWriteLongStringU;
     ReadLongStringU     : tSqlRegReadLongStringU;
  end;

  // Diese Funktion wird von CAO aus aufgerufen um der DLL zu initialisieren
  // und einen Record mit allesn Funktionen der CAO-Registry zu übergeben
  tCaoPluginInit = procedure (Mandant : PChar; CaoRegistry : tCaoRegistry); stdcall;

implementation



end.
