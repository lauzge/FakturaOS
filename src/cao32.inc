{

Programm     : CAO-Faktura
Modul        : CAO32.INC
Stand        : 11.04.2004
Version      : 1.2.5.1
Beschreibung : Include-Datei zur bedingten Compilierung

}

{$DEFINE GNU_SOURCE}       // nur freigegebene GNU-Module einbinden
{_$DEFINE REPORTBUILDER}   // Code für Report-Builder verwenden Achtung,
                           // porperitäre Lizenz, kein GNU/GPL !!!
{_$DEFINE WPTOOLS}         // Code für Texteditor verwenden Achtung,
                           // porperitäre Lizenz, kein GNU/GPL !!!
{_$DEFINE AVE}

{_$DEFINE WITHHELP}         // Integration des Hilfesystems einschalten

{.$DEFINE PRO}             // Pro-Version

{_$DEFINE ALPHA}           // APLHA-Code mitcompilieren
{_$DEFINE MULTILANG}       // Code für Mehrsprachigkeit verwenden

//------------------------------------------------------------------------------

{$IFDEF VER150} // DELPHI 7
  {$DEFINE COMPILER_D7}
  {$DEFINE COMPILER_D7_UP}
{$ENDIF}

{$IFDEF VER140}
  {$DEFINE COMPILER_D6}
  {$DEFINE COMPILER_D6_UP}
{$ENDIF}

{$IFDEF VER130}
  {$DEFINE COMPILER_D5}
  {$DEFINE COMPILER_D5_UP}
{$ENDIF}

{$IFDEF COMPILER_D5}
  {$DEFINE COMPILER_D5_UP}
{$ENDIF}

{$IFDEF COMPILER_D6}
  {$DEFINE COMPILER_D5_UP}
  {$DEFINE COMPILER_D6_UP}
{$ENDIF}

{$IFDEF COMPILER_D7}
  {$DEFINE COMPILER_D5_UP}
  {$DEFINE COMPILER_D6_UP}
  {$DEFINE COMPILER_D7_UP}
{$ENDIF}

//------------------------------------------------------------------------------

{$IFDEF AVE}
  {$DEFINE PRO}
{$ENDIF}

{$IFDEF DELPHI}
{$O-} // keine Optimierung
{$R-} // keine Bereichsprüfung
{$Q-} // keine Überlaufprüfung
{$B-} // Boolsche Ausdrücke nicht vollständig
{$ELSE}
{$H+}
{$ENDIF}

