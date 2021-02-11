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
    MahnGrid: TDBGrid;
    MahnPrintGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
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
    Bearbeiten1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Aktualisieren1: TMenuItem;
    Allesmarkieren1: TMenuItem;
    keineMarkieren1: TMenuItem;
    mahnen1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Preis1: TMenuItem;
    Stadium1: TMenuItem;
    Name1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    Suchen1: TMenuItem;
    Sortierung1: TMenuItem;
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    MahnPrintToolBar: TToolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    AlleFreigebenBtn: TToolButton;
    KeineFreigebenBtn: TToolButton;
    ToolButton3: TToolButton;
    MahnenBtn: TToolButton;
    ToolButton2: TToolButton;
    B1: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    TopPan: TPanel;
    DatumAW: TVolgaPeriod;
    MahnTab: TZQuery;
    MahnPrintTab: TZQuery;
    SumTab: TZQuery;
    procedure Allesmarkieren1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure keineMarkieren1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure MahnDruckenBtnClick(Sender: TObject);
    procedure MahnDruckenBtnMouseEnter(Sender: TObject);
    procedure MahnDruckenBtnMouseLeave(Sender: TObject);
    procedure mahnen1Click(Sender: TObject);
    procedure MahnErfassenBtnClick(Sender: TObject);
    procedure MahnGridDblClick(Sender: TObject);
    procedure MahnPrintTabAfterOpen(DataSet: TDataSet);
    procedure MahnPrintTabBeforeDelete(DataSet: TDataSet);
    procedure MahnTabAfterOpen(DataSet: TDataSet);
    procedure MahnTabAfterScroll(DataSet: TDataSet);
    procedure PC1Change(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure SumTabAfterOpen(DataSet: TDataSet);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
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
procedure TMahnForm.FormCreate(Sender: TObject);
var I : Integer;
begin
     OnUpdateStatusBar :=nil;
     First :=True;
     For i:=0 to PC1.PageCount-1 do PC1.Pages[i].TabVisible :=False;
     PC1.TabHeight :=1;

     MahnErfassenBtn.Align :=alRight;
     MahnDruckenBtn.Align  :=alRight;
     DatumAW.Align         :=alRight;

     MahnErfassenBtn.Font.Style  :=[fsBold];

     MainPanel.HelpContext :=8300;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.FormDeactivate(Sender: TObject);
begin
     MahnTab.Close;
     MahnPrintTab.Close;
     SumTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.keineMarkieren1Click(Sender: TObject);
begin
     MahnTab.DisableControls;
     try
        MahnTab.First;
        while not MahnTab.Eof do
        begin
           MahnTab.Edit;
           MahnTabFreigabe1_Flag.AsBoolean :=False;
           MahnTab.Post;
           MahnTab.Next;
        end;
     finally
        MahnTab.EnableControls;
     end;
     SumTab.Open;
     SumTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSAveLayout (tDBGrid(MahnGrid),'MAHNUNGEN_AUSWAHL');
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnDruckenBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=TabSheet3;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnDruckenBtnMouseEnter(Sender: TObject);
begin
     if (sender is tSpeedButton)and
        (tSpeedButton(Sender).Enabled) then
     begin
       tSpeedButton(Sender).Transparent :=False;
       tSpeedButton(Sender).Font.Color :=clBlack;
     end;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnDruckenBtnMouseLeave(Sender: TObject);
begin
     if (sender is tSpeedButton) then
     begin
       tSpeedButton(Sender).Transparent :=True;
       tSpeedButton(Sender).Font.Color :=clWhite;
     end;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.mahnen1Click(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie die ausgewählten Rechnung wirklich mahnen ?',
                    mtconfirmation,mbyesnocancel,0)<>mryes then exit;

     MahnTab.DisableControls;
     try
        MahnTab.First;
        while not MahnTab.Eof do
        begin
           if MahnTabFreigabe1_Flag.Value=True then
           begin
             MahnTab.Edit;
             MahnTabFreigabe1_Flag.AsBoolean :=False;
             MahnTabmahndatum.AsDateTime :=Int(Now);
             if MahnTabstadium.AsInteger <50
              then MahnTabstadium.AsInteger :=MahnTabstadium.AsInteger + 10;
             MahnTabmahnstufe.AsInteger :=MahnTabnew_mahnstufe.AsInteger;
             MahnTabmahnprint.AsInteger :=MahnTabMahnPrint.AsInteger+1;

             MahnTab.Post;
           end;
           MahnTab.Next;
        end;
     finally
        MahnTab.Close;
        MahnTab.Open;
        MahnTab.EnableControls;
     end;
     if MessageDlg ('Wollen Sie die neu erstellten Mahnungen drucken ?',
                    mtconfirmation,mbyesnocancel,0)=mryes then
     begin
        PC1.ActivePage :=TabSheet3;
        PC1Change(Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnErfassenBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=TabSheet1;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnGridDblClick(Sender: TObject);
begin
     if MahnTab.RecordCount=0 then exit;

     if (MahnTabFreigabe1_Flag.Value=False) then
     begin
       if MahnTab.State <> dsEdit then MahnTab.Edit;
       MahnTabFreigabe1_Flag.Value :=True;
       try MahnTab.Post; except MahnTab.Cancel; end;
     end
        else
     begin
       if MahnTab.State <> dsEdit then MahnTab.Edit;
       MahnTabFreigabe1_Flag.Value :=False;
       try MahnTab.Post; except MahnTab.Cancel; end;
     end;

     SumTab.Open;
     SumTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnPrintTabAfterOpen(DataSet: TDataSet);
begin
     MahnPrintToolBar.Enabled :=MahnPrintTab.RecordCount>0;
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnPrintTabBeforeDelete(DataSet: TDataSet);
begin
     Abort; // Löschen nicht erlaubt;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnTabAfterOpen(DataSet: TDataSet);
begin
     Allesmarkieren1.Enabled   :=MahnTab.RecordCount > 0;
     keineMarkieren1.Enabled   :=MahnTab.RecordCount > 0;

     KeineFreigebenBtn.Enabled :=Allesmarkieren1.Enabled;
     AlleFreigebenBtn.Enabled  :=keineMarkieren1.Enabled;

     SumTab.Open;
     SumTab.Close;
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.MahnTabAfterScroll(DataSet: TDataSet);
begin
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.PC1Change(Sender: TObject);
begin
     if PC1.ActivePage=TabSheet1 then
     begin
        MahnErfassenBtn.Font.Style :=[fsBold];
        MahnDruckenBtn.Font.Style :=[];
        QueryTime  :=GetTickCount64;
        MahnTab.Open;
        QueryTime :=GetTickCount64-QueryTime;
        MahnPrintTab.Close;
        UpdateStatus;
     end
        else
     begin
        MahnErfassenBtn.Font.Style :=[];
        MahnDruckenBtn.Font.Style :=[fsBold];
        MahnTab.Close;
        QueryTime  :=GetTickCount64;
        MahnprintTab.Open;
        QueryTime :=GetTickCount64-QueryTime;
        Allesmarkieren1.enabled :=False;
        keineMarkieren1.enabled :=False;
        mahnen1.enabled :=False;
        UpdateStatus;
     end;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.SichtbareSpalten1Click(Sender: TObject);
begin
     VisibleSpaltenForm.UpdateTable (tDBGrid(MahnGrid));
end;
//------------------------------------------------------------------------------
procedure TMahnForm.SumTabAfterOpen(DataSet: TDataSet);
begin
     if SumTab.Locate ('FREIGABE1_FLAG',True,[])
      then Ausgewaehlt :=SumTab.FieldByName ('ANZAHL').AsInteger
      else Ausgewaehlt :=0;
     SumTab.Close;

     mahnen1.enabled :=Ausgewaehlt>0;
     MahnenBtn.enabled :=Ausgewaehlt>0;
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.ToolButton6Click(Sender: TObject);
begin
     MahnPrintTab.Edit;
     MahnPrintTabMahnPrint.Value :=0;
     MahnPrintTab.Post;
     MahnPrintTab.Refresh;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.ToolButton7Click(Sender: TObject);
begin
     if messageDlg ('Wollen Sie wirklich alle Mahnungen als gedruckt markieren ?',
                    mtconfirmation,mbyesnocancel,0)=mryes then
     begin
         MahnPrintTab.DisableControls;
         try
            MahnPrintTab.First;
            while not MahnPrintTab.Eof do
            begin
               MahnPrintTab.Edit;
               MahnPrintTabMahnPrint.Value :=0;
               MahnPrintTab.Post;
               MahnPrintTab.Next;
            end;
         finally
            MahnPrintTab.EnableControls;
         end;
         MahnPrintTab.Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.ToolButton8Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowMahnungDlg (MahnPrintTabAddr_ID.Value);
     MainForm.FormActivate (Self);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TMahnForm.FormActivate(Sender: TObject);
var i: integer;
begin
     if First then
     begin
        MainForm.SBar.SimpleText :='Lade Benutzereinstellungen...';
        MainForm.SBar.SimplePanel :=True;
        Application.ProcessMessages;

//        MahnGrid.RowColor1 :=DM1.C2Color;
//        MahnPrintGrid.RowColor1 :=DM1.C2Color;
//        MahnGrid.EditColor :=DM1.EditColor;
//        MahnPrintGrid.EditColor :=DM1.EditColor;


        if DM1.ReadString ('MAIN\MAHNUNG','DEFAULT','')='' then
        DM1.WriteString ('MAIN\MAHNUNG','DEFAULT','Einstellungen für Mahnlauf');

        for i:=1 to 5 do
        begin
          DM1.MahnFrist[i] :=DM1.ReadInteger ('MAIN\MAHNUNG','FRIST_STUFE_'+Inttostr(I),-1);
          if DM1.MahnFrist[i]<0 then
          begin
             DM1.MahnFrist[i] :=14;
             DM1.WriteInteger ('MAIN\MAHNUNG','FRIST_STUFE_'+Inttostr(I),DM1.MahnFrist[i]);
          end;
        end;

        dm1.GridLoadLayout (tDBGrid(MahnGrid),'MAHNUNGEN_AUSWAHL');

        MahnTab.ParamByName ('STUFE1_TAGE').AsInteger :=DM1.MahnFrist[1];
        MahnTab.ParamByName ('STUFE2_TAGE').AsInteger :=DM1.MahnFrist[2];
        MahnTab.ParamByName ('STUFE3_TAGE').AsInteger :=DM1.MahnFrist[3];
        MahnTab.ParamByName ('STUFE4_TAGE').AsInteger :=DM1.MahnFrist[4];

        First :=False;


        MainForm.SBar.SimpleText :='';
        MainForm.SBar.SimplePanel :=False;
        Application.ProcessMessages;
     end;
     PC1.ActivePage :=PC1.Pages[0];
     PC1Change(Sender);
     MahnGrid.SetFocus;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.Allesmarkieren1Click(Sender: TObject);
begin
     MahnTab.DisableControls;
     try
        MahnTab.First;
        while not MahnTab.Eof do
        begin
           MahnTab.Edit;
           MahnTabFreigabe1_Flag.AsBoolean :=True;
           MahnTab.Post;
           MahnTab.Next;
        end;
     finally
        MahnTab.EnableControls;
     end;
     SumTab.Open;
     SumTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMahnForm.B1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowMahnungDlg (-1);
     MainForm.FormActivate (Self);
     {$ENDIF}
end;
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

