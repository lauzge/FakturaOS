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
Modul        : CAO_MITARBEITER
Stand        : 16.08.2003
Version      : 1.1.2.8
Beschreibung : Mitarbeiter erstellen, bearbeiten

History :

16.08.2003 - JP Unit erstellt


TODO:

-

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Mitarbeiter;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Messages, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ComCtrls, DBGrids, StdCtrls, DBCtrls, Buttons, Menus, ZDataset,
  ZAbstractRODataset, CAO_VAR_CONST;

type

  { TMitarbeiterForm }

  TMitarbeiterForm = class(TForm)
    AllgemeinGB: TGroupBox;
    BemerkungGB: TGroupBox;
    DBMemo1: TDBMemo;
    DBNavigator3: TDBNavigator;
    SuchBeg: TEdit;
    Label1: TLabel;
    Label35: TLabel;
    MainMenu1: TMainMenu;
    MainTopLab: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label56: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    MaEmailEdi: TDBEdit;
    MaFunkEdi: TDBEdit;
    MaFaxEdi: TDBEdit;
    MaTelEdi: TDBEdit;
    MaOrtEdi: TDBEdit;
    MaPLZEdi: TDBEdit;
    MaStrasseEdi: TDBEdit;
    MaVNameEdi: TDBEdit;
    MaNameEdi: TDBEdit;
    MaAnzeigeEdi: TDBEdit;
    MaLoginEdi: TDBEdit;
    MaNumEdi: TDBEdit;
    Kommunikation: TGroupBox;
    Adresse1: TMenuItem;
    Extras1: TMenuItem;
    Loeschen1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    MANummer: TMenuItem;
    Allgemein1: TMenuItem;
    Ansprechpartner1: TMenuItem;
    Liste1: TMenuItem;
    Aktualisieren1: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N2001: TMenuItem;
    N5001: TMenuItem;
    alle1: TMenuItem;
    N101: TMenuItem;
    N4: TMenuItem;
    UebernahmeBtn: TToolButton;
    ToolButton6: TToolButton;
    Treffer1: TMenuItem;
    N3: TMenuItem;
    Provision1: TMenuItem;
    Ort: TMenuItem;
    Name: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N2: TMenuItem;
    Suchen1: TMenuItem;
    N1: TMenuItem;
    Neu1: TMenuItem;
    MenuItem2: TMenuItem;
    Sortierung1: TMenuItem;
    Panel1: TPanel;
    ListeBtn: TSpeedButton;
    PositionenBtn: TSpeedButton;
    AuswahlBtn: TSpeedButton;
    AllgBtn: TSpeedButton;
    SuchGrid: TDBGrid;
    Mita_DS: TDataSource;
    MainPanel: TPanel;
    KunToolbar: TToolBar;
    Main_PC: TPageControl;
    Allg_TS: TTabSheet;
    Mita_TabANREDE: TZRawStringField;
    Mita_TabANZEIGE_NAME: TZRawStringField;
    Mita_TabBANK: TZRawStringField;
    Mita_TabBEMERKUNG: TZRawCLobField;
    Mita_TabBESCHAEFTIGUNGSART: TZSmallIntField;
    Mita_TabBESCHAEFTIGUNGSGRAD: TZSmallIntField;
    Mita_TabBLZ: TZRawStringField;
    Mita_TabEMAIL: TZRawStringField;
    Mita_TabERSTELLT: TZDateTimeField;
    Mita_TabERSTELLT_NAME: TZRawStringField;
    Mita_TabFAMSTAND: TZSmallIntField;
    Mita_TabFAX: TZRawStringField;
    Mita_TabFUNK: TZRawStringField;
    Mita_TabGEAEND: TZDateTimeField;
    Mita_TabGEAEND_NAME: TZRawStringField;
    Mita_TabGEBDATUM: TZDateTimeField;
    Mita_TabGESCHLECHT: TZRawStringField;
    Mita_TabGUELTIG_BIS: TZDateTimeField;
    Mita_TabGUELTIG_VON: TZDateTimeField;
    Mita_TabINTERNET: TZRawStringField;
    Mita_TabJAHRESURLAUB: TZDoubleField;
    Mita_TabKTO: TZRawStringField;
    Mita_TabLAND: TZRawStringField;
    Mita_TabLOGIN_NAME: TZRawStringField;
    Mita_TabMA_ID: TZCardinalField;
    Mita_TabMA_NUMMER: TZRawStringField;
    Mita_TabNAME: TZRawStringField;
    Mita_TabORT: TZRawStringField;
    Mita_TabPLZ: TZRawStringField;
    Mita_TabSPRACH_ID: TZSmallIntField;
    Mita_TabSTRASSE: TZRawStringField;
    Mita_TabTELEFON: TZRawStringField;
    Mita_TabTITEL: TZRawStringField;
    Mita_TabVNAME: TZRawStringField;
    Mita_TabZUHAENDEN: TZRawStringField;
    Mita_TabZUSATZ: TZRawStringField;
    Mita_TabZUSATZ2: TZRawStringField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Such_TS: TTabSheet;
    TopPan: TPanel;
    Mita_Tab: TZQuery;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure AnsichtAuswahlClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure ListeBtnMouseEnter(Sender: TObject);
    procedure ListeBtnMouseLeave(Sender: TObject);
    procedure Loeschen1Click(Sender: TObject);
    procedure Main_PCChange(Sender: TObject);
    procedure Mita_TabAfterPost(DataSet: TDataSet);
    procedure Mita_TabAfterScroll(DataSet: TDataSet);
    procedure Mita_TabBeforeInsert(DataSet: TDataSet);
    procedure Mita_TabBeforePost(DataSet: TDataSet);
    procedure Neu1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure SortierungClick(Sender: TObject);
    procedure SuchBegChange(Sender: TObject);
    procedure SuchGridDblClick(Sender: TObject);
    procedure TrefferClick(Sender: TObject);
  private
    { Private-Deklarationen }

    querytime   : Integer;
    Limit       : Integer;

    Sortfield   : String;
    SearchField : String;
    Sortname    : string;
    SuchBegr    : String;
    aktsort     : integer;

    procedure SetSort (Sort : Integer);
    procedure UpdateQuery;
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    First : Boolean;
    OnUpdateStatusBar : TOnUpdateStatusBar;
  end;

var
  MitarbeiterForm: TMitarbeiterForm;

implementation

{$R *.frm}

uses cao_main, cao_dm, cao_dbgrid_layout, cao_progress;

procedure TMitarbeiterForm.FormCreate(Sender: TObject);
var I : Integer;
begin
     First :=True;
     Limit :=50;
     SortName    :='Name';
     SortField   :='NAME';
     SearchField :='NAME';

     ListeBtn.Align :=alRight;
     AllgBtn.Align  :=alRight;

     OnUpdateStatusBar      :=nil;
     For i:=0 to Main_PC.PageCount-1 do Main_PC.Pages[i].TabVisible :=False;
     Main_PC.ActivePage :=Main_PC.Pages[0];
     SetSort (1);
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.FormDeactivate(Sender: TObject);
begin
     if (Mita_Tab.State in [dsEdit,dsInsert]) then
     begin
        if MessageDlg ('Der aktuelle Mitarbeiter wurde verändert,'+#13#10+
                       'wollen Sie die Änderung speichern ?',
                       mtconfirmation,[mbYes, mbNo],0) = mryes
        then Mita_Tab.Post
        else Mita_Tab.Cancel;
     end;

     DM1.WriteIntegerU ('','MITARBEITER_TABSHEET',Main_PC.ActivePageIndex);
     DM1.WriteStringU  ('','MITARBEITER_SORTFELD',SortField);
     DM1.WriteStringU  ('','MITARBEITER_SORTNAME',SortName);

     if (not (MainPanel.Parent is tForm)) and
        (MainPanel.Parent.Parent is tForm) and
        (assigned(tForm(MainPanel.Parent.Parent).ActiveControl))
     then tDBEdit(tForm(MainPanel.Parent.Parent).ActiveControl).Color :=clWindow;

     Mita_Tab.Close;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(SuchGrid),'MITARBEITER_LISTE');
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.ListeBtnMouseEnter(Sender: TObject);
begin
     if (sender is tSpeedButton)and
        (tSpeedButton(Sender).Enabled) then
     begin
       tSpeedButton(Sender).Transparent :=False;
       tSpeedButton(Sender).Font.Color :=clBlack;
     end;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.ListeBtnMouseLeave(Sender: TObject);
begin
     if (sender is tSpeedButton) then
     begin
       tSpeedButton(Sender).Transparent :=True;
       tSpeedButton(Sender).Font.Color :=clWhite;
     end;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Loeschen1Click(Sender: TObject);
begin
     IF MessageDlg ('Wollen Sie diesen Mitarbeiter wirklich löschen ?',
                    mtconfirmation,mbyesnocancel,0)=mryes then Mita_Tab.Delete;

end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Main_PCChange(Sender: TObject);
begin
     try
       if (MITA_DS.State=dsEdit)or(MITA_DS.State=dsInsert)
        then MITA_Tab.Post;
     except end;

     SichtbareSpalten1.Enabled :=Main_PC.ActivePage=Such_TS;

     AllgBtn.Font.Style :=[];
//kl     ProBtn.Font.Style :=[];
//kl     Liste_Btn.Font.Style :=[];
     ListeBtn.Font.Style :=[];

     case Main_PC.ActivePageIndex of
       0: begin
               AllgBtn.Font.Style  :=[fsBold];
               Allgemein1.Checked :=True;
               MaNumEdi.SetFocus;
          end;
//       1: begin ProBtn.Font.Style   :=[fsBold]; Provision1.Checked :=True; end;
//kl       2: begin Liste_Btn.Font.Style   :=[fsBold];  Ansprechpartner1.Checked :=True; end;
       3: begin
               ListeBtn.Font.Style :=[fsBold];
               Liste1.Checked :=True;
               SuchGrid.SetFocus;
          end;
     end;

end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabAfterPost(DataSet: TDataSet);
begin
     Mita_TabAfterScroll(DataSet);
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabAfterScroll(DataSet: TDataSet);
begin
     UpdateStatus;
     ProgressForm.Stop;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabBeforeInsert(DataSet: TDataSet);
begin
     try
        if not Main_PC.Enabled then Main_PC.Enabled :=True;
        Main_PC.ActivePage :=Allg_TS;
        Main_PCChange (Self);
        MaNumEdi.SetFocus;
     except end;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabBeforePost(DataSet: TDataSet);
begin
     if Mita_TabERSTELLT.AsDateTime=0 then
     begin
        Mita_TabERSTELLT.AsDateTime    :=Now;
        Mita_TabERSTELLT_NAME.AsString :=DM1.View_User;
     end
        else
     begin
        Mita_TabGEAEND.AsDateTime    :=Now;
        Mita_TabGEAEND_NAME.AsString :=DM1.View_User;
     end;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Neu1Click(Sender: TObject);
begin
  Mita_Tab.Append;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SichtbareSpalten1Click(Sender: TObject);
begin
     VisibleSpaltenForm.UpdateTable (tDBGrid(SuchGrid));
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SortierungClick(Sender: TObject);
begin
     if (tmenuitem (sender).tag>0)and(tmenuitem (sender).tag<4) then
     begin
        tmenuitem (sender).checked :=not tmenuitem (sender).checked;
        SetSort (tmenuitem (sender).tag);
     end;
end;

procedure TMitarbeiterForm.SuchBegChange(Sender: TObject);
begin
     if (Mita_Tab.State in [dsEdit,dsInsert]) then
     begin
        if MessageDlg ('Der aktuelle Mitarbeiter wurde verändert,'+#13#10+
                       'wollen Sie die Änderung speichern ?',
                       mtconfirmation,[mbYes, mbNo],0) = mryes
        then Mita_Tab.Post
        else Mita_Tab.Cancel;
     end;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SuchGridDblClick(Sender: TObject);
begin
     Main_PC.ActivePage :=Allg_TS;
     Main_PCChange (Sender);
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.TrefferClick(Sender: TObject);
begin
     Limit :=tMenuItem(Sender).Tag;
     tMenuItem(Sender).Checked :=True;
     DM1.WriteIntegerU ('','MITARBEITER_TREFFER',Limit);
     UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.FormActivate(Sender: TObject);
var me,I : Integer;
begin
     if First then
     begin
        First :=False;
{kl        SichtbareSpalten1.Visible :=False;
        Layoutspeichern1.Visible :=False; }
//        SuchGrid.RowColor1 :=DM1.C2Color;
//        SuchGrid.EditColor :=DM1.EditColor;

        dm1.GridLoadLayout (tDBGrid(SuchGrid),'MITARBEITER_LISTE');
        // letztes Tabsheet wiederherstellen
        me :=DM1.ReadIntegerU ('','MITARBEITER_TABSHEET',-1);
        if (me>=0)and(me<Main_PC.PageCount)
           then Main_PC.ActivePage :=Main_PC.Pages[me]
           else Main_PC.ActivePage :=Allg_TS;

        Limit :=DM1.ReadIntegerU ('','MITARBEITER_TREFFER',50);
        case Limit of
                 10 : N101.Checked :=True;
                 50 : N501.Checked :=True;
                100 : N1001.Checked :=True;
                200 : N2001.Checked :=True;
                500 : N5001.Checked :=True;
          999999999 : alle1.Checked :=True;
        end;

        SortField :=DM1.ReadStringU  ('','MITARBEITER_SORTFELD','NAME');
        SortName  :=DM1.ReadStringU  ('','MITARBEITER_SORTNAME','Name');

        try
           for i:=0 to SuchGrid.Columns.Count-1 do
           begin
              if SuchGrid.Columns[i].Title.Caption=SortName //.Field.DisplayLabel=SortName
                then SuchGrid.Columns[i].Title.Font.Style :=[fsBold]
                else SuchGrid.Columns[i].Title.Font.Style :=[];
           end;
        except
          on E: Exception do
          begin
            MessageDlg('Fehler: '+E.Message,mterror,[mbok],0);
          end;
        end;
     end;
     Main_PCChange (Self);
     UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.AnsichtAuswahlClick(Sender: TObject);
begin
     if (Sender is tMenuItem)
      then Main_PC.ActivePage :=Main_PC.Pages[tMenuitem(sender).Tag-1]
      else Main_PC.ActivePage :=Main_PC.Pages[tSpeedButton(sender).Tag-1];
     Main_PCChange (Sender);
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Aktualisieren1Click(Sender: TObject);
begin
     Mita_Tab.Refresh;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SetSort (Sort : Integer);
var I : Integer;
begin
     if sort = aktsort then exit;
     if sort<0 then sort :=aktsort;
     case sort of
{name}     1:begin sortname :='Name';    SortField :='NAME,VNAME'; end;
{plz}      2:begin sortname :='Ort';     SortField :='ORT,NAME';   end;
           3:begin sortname :='MA-Nr.';  SortField :='MA_NUMMER';  end;
     end;
     UpdateStatus;
     AktSort :=Sort;
     try
        for i:=0 to SuchGrid.Columns.Count-1 do
        begin
           if SuchGrid.Columns[i].Title.Caption=SortName //.Field.DisplayLabel=SortName
             then SuchGrid.Columns[i].Title.Font.Style :=[fsBold]
             else SuchGrid.Columns[i].Title.Font.Style :=[];
        end;
     except
       on E: Exception do
       begin
         MessageDlg('Fehler: '+E.Message,mterror,[mbok],0);
       end;
     end;

     if not first then UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.UpdateQuery;
var LastTime : DWord;
begin
     LastTime :=GetTickCount;

     if Mita_Tab.active then Mita_Tab.close;
     Mita_Tab.sql.clear;
     Mita_Tab.sql.add ('select * from MITARBEITER');
     Mita_Tab.sql.add ('order by '+SortField);
     Mita_tab.SQL.add ('LIMIT 0,'+Inttostr(limit));
     Screen.Cursor :=crSQLWait;
     try
        Mita_Tab.Open;
     finally
        Screen.Cursor :=crDefault;
     end;
     QueryTime :=GetTickCount-LastTime;
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert : String;
begin
     if assigned(OnUpdateStatusBar) then
     begin
        if Mita_Tab.RecordCount=0
         then Datensatz :='keine'
         else
           if Mita_Tab.RecordCount=Limit
             then Datensatz :=inttostr (Mita_Tab.RecNo)+' von >='+
                              inttostr (Mita_Tab.RecordCount)
             else Datensatz :=inttostr (Mita_Tab.RecNo)+' von '+
                              inttostr (Mita_Tab.RecordCount);

        Sortierung :='Sortierung : '+sortname;

        if (Mita_Tab.active)and(Mita_Tab.recordcount>0) then
        begin
           Erstellt  :='Erstellt:'+formatdatetime ('dd.mm.yyyy',Mita_TabErstellt.AsDateTime);
           if Mita_TabGeaend.AsDateTime>1
            then Geaendert :='Geändert:'+
                             formatdatetime ('dd.mm.yyyy',Mita_TabGeaend.AsDateTime)
            else Geaendert :='-';
        end
          else
        begin
           Erstellt  :='';
           Geaendert :='';
        end;

        SuchZeit :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
        OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
     end;
end;
//------------------------------------------------------------------------------

end.

