{******************************************************************************}
{ PROJEKT      : CAO-FAKTURA                                                   }
{ DATEI        : CAO_MAHNLAUFDLG.PAS / DFM                                     }
{ BESCHREIBUNG : Mahnungen erstellen / verwalten                               }
{ STAND        : 19.04.2004                                                    }
{ VERSION      :                                                               }
{                                                                              }
{ © 2004 Jan Pokrandt / Jan@JP-Soft.de                                         }
{                                                                              }
{ Diese Unit gehört zum Projekt CAO-Faktura und wird unter der                 }
{ GNU General Public License Version 2.0 freigegeben                           }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ This program is free software; you can redistribute it and/or                }
{ modify it under the terms of the GNU General Public License                  }
{ as published by the Free Software Foundation; either version 2               }
{ of the License, or any later version.                                        }
{                                                                              }
{ This program is distributed in the hope that it will be useful,              }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of               }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                }
{ GNU General Public License for more details.                                 }
{                                                                              }
{ You should have received a copy of the GNU General Public License            }
{ along with this program; if not, write to the Free Software                  }
{ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.  }
{                                                                              }
{    ******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************     }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ Historie :                                                                   }
{ 22.02.2004 JP - Mahnfristen werden jetzt korrekt verwendet                   }
{ 19.04.2004 JP - Bug bei anzeige der zu druckenden Mahnungen gefixt           }
{                                                                              }
{                                                                              }
{                                                                              }
{                                                                              }
{                                                                              }
{ Todo :                                                                       }
{ - Mahngebühren                                                               }
{                                                                              }
{                                                                              }
{                                                                              }
{******************************************************************************}

{
11.02.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_MahnlaufDlg;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, Menus, ComCtrls, DBGrids, DBCtrls, ZDataset,
  ZAbstractRODataset, VolPeriod, cao_var_const;

type

  { TMahnForm }

  TMahnForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    MahnDS: TDataSource;
    MahnPrintDS: TDataSource;
    Label35: TLabel;
    MahnPrintTabADDR_ID: TZIntegerField;
    MahnPrintTabBSUMME: TFloatField;
    MahnPrintTabGEGENKONTO: TZIntegerField;
    MahnPrintTabKUN_NAME1: TZRawStringField;
    MahnPrintTabKUN_NUM: TZRawStringField;
    MahnPrintTabMAHNKOSTEN: TZDoubleField;
    MahnPrintTabMAHNPRINT: TZShortIntField;
    MahnPrintTabMAHNSTUFE: TZShortIntField;
    MahnPrintTabQUELLE: TZSmallIntField;
    MahnPrintTabRDATUM: TZDateField;
    MahnPrintTabREC_ID: TZIntegerField;
    MahnPrintTabSALDO: TFloatField;
    MahnPrintTabSOLL_NTAGE: TZSmallIntField;
    MahnPrintTabTAGE_OFFEN: TZIntegerField;
    MahnPrintTabVRENUM: TZIntegerField;
    MahnPrintTabWAEHRUNG: TZRawStringField;
    MahnTabBSUMME: TFloatField;
    MahnTabFREIGABE1_FLAG: TBooleanField;
    MahnTabKUN_NAME1: TZRawStringField;
    MahnTabMAHNDATUM: TZDateField;
    MahnTabMAHNPRINT: TZSmallIntField;
    MahnTabMAHNSTUFE: TZShortIntField;
    MahnTabNEW_MAHNSTUFE: TZIntegerField;
    MahnTabQUELLE: TZSmallIntField;
    MahnTabRDATUM: TZDateField;
    MahnTabREC_ID: TZIntegerField;
    MahnTabSOLL_NTAGE: TZSmallIntField;
    MahnTabSTADIUM: TZShortIntField;
    MahnTabTAGE_OFFEN: TZIntegerField;
    MahnTabVRENUM: TZIntegerField;
    MainMenu1: TMainMenu;
    MainPanel: TPanel;
    MahnErfassenBtn: TSpeedButton;
    MahnDruckenBtn: TSpeedButton;
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    AlleFreigebenBtn: TToolButton;
    KeineFreigebenBtn: TToolButton;
    ToolButton2: TToolButton;
    MahnenBtn: TToolButton;
    TopPan: TPanel;
    DatumAW: TVolgaPeriod;
    MahnTab: TZQuery;
    MahnPrintTab: TZQuery;
    SumTab: TZQuery;
  private
    { Private-Deklarationen }
    First : Boolean;
    Ausgewaehlt : Integer;
    QueryTime   : DWord;
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
  end;

//var
//  MahnForm: TMahnForm;

implementation

{$R *.frm}

uses cao_dm, CAO_MAIN,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     cao_dbgrid_layout;

//------------------------------------------------------------------------------
procedure TMahnForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert : String;
begin
     if assigned(OnUpdateStatusBar) then
     begin
       SuchZeit :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
       if PC1.ActivePage=TabSheet1 then
       begin
         if MahnTab.RecordCount=0 then Datensatz :='keine'
         else Datensatz :=inttostr (MahnTab.RecNo)+' von '+
                          inttostr (MahnTab.RecordCount);

         Sortierung :=Inttostr(MahnTab.RecordCount)+' mahnbare Rechnungen';
         Erstellt :=IntToStr(Ausgewaehlt)+' Mahnungen ausgewählt';
       end else
       begin
         Sortierung :=Inttostr(MahnPrintTab.RecordCount)+' druckbare Mahnungen';
         Erstellt :='';
         if MahnPrintTab.RecordCount=0 then Datensatz :='keine'
         else Datensatz :=inttostr (MahnPrintTab.RecNo)+' von '+
                          inttostr (MahnPrintTab.RecordCount);
       end;

       Geaendert :='';
       OnUpdateStatusBar (SuchZeit,DatenSatz,Sortierung,Erstellt,Geaendert);
     end;
end;
//------------------------------------------------------------------------------

end.

