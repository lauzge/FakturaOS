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
}

{

Programm     : CAO-Faktura
Modul        : CAO_JOURNAL_VKAGB
Stand        : 14.03.2004
Version      : 1.2.5.4
Beschreibung : Angebotsjournal

History :

26.04.2003 - Version 1.0.0.53 released Jan Pokrandt
06.05.2003 - Version zum GNU-Source hinzugefügt
27.10.2003 - Infofeld kann jetzt unter Details (neues Tabsheet) angezeigt und
             bearbeitet werden
02.11.2003 - neue Leuchtdiode für Stadium eingebaut,
             blau = AGB gedruckt, Grün = Angebot in Rechnung umgewandet
           - neuen Dialog eingebaut um nach umwandlung in eine Rechnung sofort
             in die Rechnungsbearbeitung zu springen
09.11.2003 - Positionsdetails wurden nach erneutem Öffnen nicht aktualisiert
26.02.2004 - neues Popup-Menü für "Stadium ändern" eingebaut
13.03.2004 - Dateilinks implementiert

15.02.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Journal_VKAGB;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, DBGrids, cao_var_const;

type

  { TJournalVKAGBForm }

  TJournalVKAGBForm = class(TForm)
    JourGrid: TDBGrid;
    JournalPanel: TPanel;
    ArtPan: TPanel;
    ReInfoPC: TPageControl;
    Panel1: TPanel;
    DetailPan: TPanel;
    Splitter1: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ToolBar2: TToolBar;
  private
    { Private-Deklarationen }
    SortField       : String;
    SortName        : String;
    First           : Boolean;
    QueryTime       : DWord;
    vonDatum,
    bisDatum        : tDateTime;
    LastID          : Integer;
    LastRange       : Integer;
    LastSDate       : Integer;

//    procedure UpdateReView;
//    procedure SetSort (Index : Integer);
//    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
//    procedure UpdateQuery;
  end;

var
  JournalVKAGBForm: TJournalVKAGBForm;

implementation

{$R *.frm}

uses CAO_Tool1, CAO_MAIN, CAO_DM,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     CAO_Link, cao_dbgrid_layout;

end.

