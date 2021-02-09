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
Modul        : CAO_VERTRETER
Stand        : 16.08.2003
Version      : 1.1.3.30
Beschreibung : Vertreter erstellen, bearbeiten

History :

20.08.2003 - Karl Unit erstellt
16.11.2003 - JP Unit überarbeitet, Farben, Enter statt TAB, Menüs etc.


TODO:

-
01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert


-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Vertreter;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Messages, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ComCtrls, DBGrids, StdCtrls, DBCtrls, Buttons, Menus, RxDBGrid,
  ZDataset, ZAbstractRODataset, CAO_VAR_CONST;

type

  { TVertreterForm }

  TVertreterForm = class(TForm)
    AllgemeinGB: TGroupBox;
    BemerkungGB: TGroupBox;
    CaoGroupBox2: TGroupBox;
    CaoGroupBox1: TGroupBox;
    BankGB: TGroupBox;
    BlZEdi: TDBEdit;
    BankNameEdi: TDBEdit;
    KontoEdi: TDBEdit;
    KontoInhEdi: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label75: TLabel;
    Label74: TLabel;
    Label73: TLabel;
    Label78: TLabel;
    Label2: TLabel;
    ProvArtEdi: TDBEdit;
    MaBemerkung: TDBMemo;
    DBNavigator3: TDBNavigator;
    N6: TMenuItem;
    N5: TMenuItem;
    Panel2: TPanel;
    BlZEdiBtn: TSpeedButton;
    SuchBeg: TEdit;
    Label35: TLabel;
    MainMenu1: TMainMenu;
    MainTopLab: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label56: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    VeEmailEdi: TDBEdit;
    VeFunkEdi: TDBEdit;
    VeFaxEdi: TDBEdit;
    Vert_TabABRECHNUNGSZEITPUNKT: TZRawStringField;
    Vert_TabANREDE: TZRawStringField;
    Vert_TabBANK: TZRawStringField;
    Vert_TabBEMERKUNG: TMemoField;
    Vert_TabBESCHAEFTIGUNGSART: TZSmallIntField;
    Vert_TabBESCHAEFTIGUNGSGRAD: TZSmallIntField;
    Vert_TabBLZ: TZRawStringField;
    Vert_TabEMAIL: TZRawStringField;
    Vert_TabERSTELLT: TZDateTimeField;
    Vert_TabERSTELLT_NAME: TZRawStringField;
    Vert_TabFAMSTAND: TZSmallIntField;
    Vert_TabFAX: TZRawStringField;
    Vert_TabFUNK: TZRawStringField;
    Vert_TabGEAEND: TZDateTimeField;
    Vert_TabGEAEND_NAME: TZRawStringField;
    Vert_TabGEBDATUM: TZDateTimeField;
    Vert_TabGESCHLECHT: TZRawStringField;
    Vert_TabGUELTIG_BIS: TZDateTimeField;
    Vert_TabGUELTIG_VON: TZDateTimeField;
    Vert_TabINTERNET: TZRawStringField;
    Vert_TabKTO: TZRawStringField;
    Vert_TabLAND: TZRawStringField;
    Vert_TabLETZTEABRECHNUNG: TZDateField;
    Vert_TabNAME: TZRawStringField;
    Vert_TabORT: TZRawStringField;
    Vert_TabPLZ: TZRawStringField;
    Vert_TabPROVISION: TFloatField;
    Vert_TabPROVISIONMITTRANSPORT: TZRawStringField;
    Vert_TabPROVISIONSART: TZRawStringField;
    Vert_TabPROVISIONSATZ: TFloatField;
    Vert_TabSPRACH_ID: TZSmallIntField;
    Vert_TabSTRASSE: TZRawStringField;
    Vert_TabTELEFON: TZRawStringField;
    Vert_TabTITEL: TZRawStringField;
    Vert_TabUMSATZ: TFloatField;
    Vert_TabVERTRETER_ID: TZIntegerField;
    Vert_TabVERTR_NUMMER: TZRawStringField;
    Vert_TabVNAME: TZRawStringField;
    Vert_TabZUHAENDEN: TZRawStringField;
    Vert_TabZUSATZ: TZRawStringField;
    Vert_TabZUSATZ2: TZRawStringField;
    VeTelEdi: TDBEdit;
    VeOrtEdi: TDBEdit;
    VePLZEdi: TDBEdit;
    VeStrasseEdi: TDBEdit;
    VeVNameEdi: TDBEdit;
    VeNameEdi: TDBEdit;
    VeNumEdi: TDBEdit;
    Kommunikation: TGroupBox;
    Adresse1: TMenuItem;
    Extras1: TMenuItem;
    Loeschen1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Nummer: TMenuItem;
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
    Liste_Btn: TSpeedButton;
    ProBtn: TSpeedButton;
    AllgBtn: TSpeedButton;
    SuchGrid: TDBGrid;
    Vert_DS: TDataSource;
    MainPanel: TPanel;
    KunToolbar: TToolBar;
    Main_PC: TPageControl;
    Allg_TS: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Such_TS: TTabSheet;
    TopPan: TPanel;
    Vert_Tab: TZQuery;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure BlZEdiButtonClick(Sender: TObject);
    procedure BlZEdiExit(Sender: TObject);
    procedure ListeBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure ListeBtnMouseEnter(Sender: TObject);
    procedure ListeBtnMouseLeave(Sender: TObject);
    procedure Loeschen1Click(Sender: TObject);
    procedure Main_PCChange(Sender: TObject);
    procedure SuchBegChange(Sender: TObject);
    procedure SuchBegKeyPress(Sender: TObject; var Key: char);
    procedure Suchen1Click(Sender: TObject);
    procedure VeNumEdiEnter(Sender: TObject);
    procedure VeNumEdiExit(Sender: TObject);
    procedure VeNumEdiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure VeNumEdiKeyPress(Sender: TObject; var Key: char);
    procedure Vert_TabAfterPost(DataSet: TDataSet);
    procedure Vert_TabAfterScroll(DataSet: TDataSet);
    procedure Vert_TabBeforeInsert(DataSet: TDataSet);
    procedure Vert_TabBeforePost(DataSet: TDataSet);
    procedure Neu1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure SortierungClick(Sender: TObject);
    procedure SuchGridDblClick(Sender: TObject);
    procedure SuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
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
  VertreterForm: TVertreterForm;

implementation

{$R *.frm}

uses cao_dm, cao_dbgrid_layout, CAO_BLZ, cao_progress;

//------------------------------------------------------------------------------
procedure TVertreterForm.FormCreate(Sender: TObject);
var I : Integer;
begin
     First :=True;
     Limit :=50;
     SortName    :='Name';
     SortField   :='NAME';
     SearchField :='NAME';

     ListeBtn.Align :=alRight;
     AllgBtn.Align  :=alRight;
     ProBtn.Align   :=alRight;

     OnUpdateStatusBar      :=nil;
     For i:=0 to Main_PC.PageCount-1 do Main_PC.Pages[i].TabVisible :=False;
     Main_PC.ActivePage :=Main_PC.Pages[0];
     SetSort (1);
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.FormActivate(Sender: TObject);
var me,I : Integer;
begin
     if First then
     begin
        First :=False;
{kl        SichtbareSpalten1.Visible :=False;
        Layoutspeichern1.Visible :=False;
}//       SuchGrid.RowColor1 :=DM1.C2Color;
//        SuchGrid.EditColor :=DM1.EditColor;
        MainPanel.Color:=clInfoBk;
        KunToolbar.Color:=clBtnFace;

        dm1.GridLoadLayout (tDBGrid(SuchGrid),'VERTRETER_LISTE');
        // letztes Tabsheet wiederherstellen
        me :=DM1.ReadIntegerU ('','VERTRETER_TABSHEET',-1);
        if (me>=0)and(me<Main_PC.PageCount)
           then Main_PC.ActivePage :=Main_PC.Pages[me]
           else Main_PC.ActivePage :=Allg_TS;

        Limit :=DM1.ReadIntegerU ('','VERTRETER_TREFFER',50);
        case Limit of
                 10 : N101.Checked :=True;
                 50 : N501.Checked :=True;
                100 : N1001.Checked :=True;
                200 : N2001.Checked :=True;
                500 : N5001.Checked :=True;
          999999999 : alle1.Checked :=True;
        end;

        SortField :=DM1.ReadStringU  ('','VERTRETER_SORTFELD','NAME');
        SortName  :=DM1.ReadStringU  ('','VERTRETER_SORTNAME','Name');

        Vert_TabUMSATZ.DisplayFormat    :=',#0.00" '+DM1.LeitWaehrung+'"';
        Vert_TabPROVISION.DisplayFormat :=',#0.00" '+DM1.LeitWaehrung+'"';

        for i:=0 to SuchGrid.Columns.Count-1 do
        begin
           try  // von Volker zur Fehlersuche hinzugefügt
             if SuchGrid.Columns[i].Field.DisplayLabel=SortName
               then SuchGrid.Columns[i].Title.Font.Style :=[fsBold]
               else SuchGrid.Columns[i].Title.Font.Style :=[];
           except end;
        end;
     end;
     Main_PCChange (Self);
     UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.FormDeactivate(Sender: TObject);
begin
     if (Vert_Tab.State in [dsEdit,dsInsert]) then
     begin
        if MessageDlg ('Der aktuelle Vertreter wurde verändert,'+#13#10+
                       'wollen Sie die Änderung speichern ?',
                       mtconfirmation,[mbYes, mbNo],0) = mryes
        then Vert_Tab.Post
        else Vert_Tab.Cancel;
     end;

     DM1.WriteIntegerU ('','VERTRETER_TABSHEET',Main_PC.ActivePageIndex);
     DM1.WriteStringU  ('','VERTRETER_SORTFELD',SortField);
     DM1.WriteStringU  ('','VERTRETER_SORTNAME',SortName);

     if (not (MainPanel.Parent is tForm)) and
        (MainPanel.Parent.Parent is tForm) and
        (assigned(tForm(MainPanel.Parent.Parent).ActiveControl))
     then tDBEdit(tForm(MainPanel.Parent.Parent).ActiveControl).Color :=clWindow;

     Vert_Tab.Close;
     // globale Vertretertabelle aktualisieren
     if DM1.VertreterTab.Active then DM1.VertreterTab.Close;
     DM1.VertreterTab.Open;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert : String;
begin
     if assigned(OnUpdateStatusBar) then
     begin
        if Vert_Tab.RecordCount=0
         then Datensatz :='keine'
         else
           if Vert_Tab.RecordCount=Limit
             then Datensatz :=inttostr (Vert_Tab.RecNo)+' von >='+
                              inttostr (Vert_Tab.RecordCount)
             else Datensatz :=inttostr (Vert_Tab.RecNo)+' von '+
                              inttostr (Vert_Tab.RecordCount);

        Sortierung :='Sortierung : '+sortname;

        if (Vert_Tab.active)and(Vert_Tab.recordcount>0) then
        begin
           Erstellt  :='Erstellt:'+formatdatetime ('dd.mm.yyyy',Vert_TabErstellt.AsDateTime);
           if Vert_TabGeaend.AsDateTime>1
            then Geaendert :='Geändert:'+
                             formatdatetime ('dd.mm.yyyy',Vert_TabGeaend.AsDateTime)
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
procedure TVertreterForm.Vert_TabAfterPost(DataSet: TDataSet);
begin
     Vert_TabAfterScroll(DataSet);
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Vert_TabAfterScroll(DataSet: TDataSet);
begin
     UpdateStatus;
     ProgressForm.Stop;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Vert_TabBeforePost(DataSet: TDataSet);
begin
     if Vert_TabERSTELLT.AsDateTime=0 then
     begin
        Vert_TabERSTELLT.AsDateTime    :=Now;
        Vert_TabERSTELLT_NAME.AsString :=DM1.View_User;
     end
        else
     begin
        Vert_TabGEAEND.AsDateTime    :=Now;
        Vert_TabGEAEND_NAME.AsString :=DM1.View_User;
     end;

     if length(Vert_TabLand.AsString)=0
      then Vert_TabLand.AsString :=DM1.LandK2;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.SuchGridDblClick(Sender: TObject);
begin
     Main_PC.ActivePage :=Allg_TS;
     Main_PCChange (Sender);
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.ListeBtnClick(Sender: TObject);
begin
     if (Sender is tMenuItem)
      then Main_PC.ActivePage :=Main_PC.Pages[tMenuitem(sender).Tag-1]
      else Main_PC.ActivePage :=Main_PC.Pages[tSpeedButton(sender).Tag-1];
     Main_PCChange (Sender);
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.UpdateQuery;
var LastTime : DWord;
begin
     LastTime :=GetTickCount64;

     if vert_tab.active then vert_tab.close;
     vert_tab.sql.clear;
     vert_tab.sql.add ('select * from VERTRETER');
     vert_tab.sql.add ('order by '+SortField);
     vert_tab.SQL.add ('LIMIT 0,'+Inttostr(limit));
     Screen.Cursor :=crSQLWait;
     try
       try
         vert_tab.Open;
       except end;
     finally
        Screen.Cursor :=crDefault;
     end;
     QueryTime :=GetTickCount64-LastTime;
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.SuchGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var i:Integer;
begin
     for i:=0 to SuchGrid.Columns.Count-1 do
     begin
        if SuchGrid.Columns[i].Field.DisplayLabel=Field.DisplayLabel
          then SuchGrid.Columns[i].Title.Font.Style :=[fsBold]
          else SuchGrid.Columns[i].Title.Font.Style :=[];
     end;

     if SearchField <> Field.FieldName then
     begin
          SearchField :=uppercase(Field.FieldName);
          SortField   :=Searchfield;
          SortName    :=Field.DisplayLabel;
          UpdateQuery;
     end
        else
     begin
          SearchField :=SearchField + ' DESC';
          SortField   :=Searchfield;
          SortName    :=Field.DisplayLabel;
          UpdateQuery;
     end;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.SortierungClick(Sender: TObject);
begin
    if (tmenuitem (sender).tag>0)and(tmenuitem (sender).tag<4) then
    begin
      tmenuitem (sender).checked :=not tmenuitem (sender).checked;
      SetSort (tmenuitem (sender).tag);
    end;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.SetSort (Sort : Integer);
var I : Integer;
begin
     if sort = aktsort then exit;
     if sort<0 then sort :=aktsort;
     case sort of
{Name}     1:begin sortname :='Name';    SortField :='NAME,VNAME';   end;
{Ort}      2:begin sortname :='Ort';     SortField :='ORT,NAME'; end;
{Nummer}   3:begin sortname :='Nummer';  SortField :='VERTR_NUMMER'; end;
     end;
     if not first then UpdateStatus;
     AktSort :=Sort;

     if first then exit;
     for i:=0 to SuchGrid.Columns.Count-1 do
     begin
        if SuchGrid.Columns[i].Field.DisplayLabel=SortName
          then SuchGrid.Columns[i].Title.Font.Style :=[fsBold]
          else SuchGrid.Columns[i].Title.Font.Style :=[];
     end;

     if not first then UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Aktualisieren1Click(Sender: TObject);
begin
     Vert_Tab.Refresh;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Main_PCChange(Sender: TObject);
begin
     try
       if (VERT_DS.State=dsEdit)or(VERT_DS.State=dsInsert)
        then VERT_tab.Post;
     except end;

     SichtbareSpalten1.Enabled :=Main_PC.ActivePage=Such_TS;

     AllgBtn.Font.Style :=[];
     ProBtn.Font.Style :=[];
     Liste_Btn.Font.Style :=[];
     ListeBtn.Font.Style :=[];

     case Main_PC.ActivePageIndex of
       0: begin
               AllgBtn.Font.Style  :=[fsBold];
               Allgemein1.Checked :=True;
               VeNumEdi.SetFocus;
          end;
       1: begin
               ProBtn.Font.Style   :=[fsBold];
               Provision1.Checked :=True;
               ProvArtEdi.SetFocus;
          end;
//kl       2: begin Liste_Btn.Font.Style   :=[fsBold];  Ansprechpartner1.Checked :=True; end;
       3: begin
               ListeBtn.Font.Style :=[fsBold];
               Liste1.Checked :=True;
               SuchGrid.SetFocus;
          end;
     end;

end;
//------------------------------------------------------------------------------
procedure TVertreterForm.TrefferClick(Sender: TObject);
begin
     Limit :=tMenuItem(Sender).Tag;
     tMenuItem(Sender).Checked :=True;
     DM1.WriteIntegerU ('','VERTRETER_TREFFER',Limit);
     UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(SuchGrid),'VERTRETER_LISTE');
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Loeschen1Click(Sender: TObject);
begin
     IF MessageDlg ('Wollen Sie diesen Vertreter wirklich löschen ?',
                    mtconfirmation,mbyesnocancel,0)=mryes then Vert_Tab.Delete;

end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Neu1Click(Sender: TObject);
begin
     Vert_Tab.Append;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(SuchGrid));
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Vert_TabBeforeInsert(DataSet: TDataSet);
begin
     try
        if not Main_PC.Enabled then Main_PC.Enabled :=True;
        Main_PC.ActivePage :=Allg_TS;
        Main_PCChange (Self);
        VeNumEdi.SetFocus;
     except end;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.SuchBegChange(Sender: TObject);
var v : variant;
begin
     if (Vert_Tab.State in [dsEdit,dsInsert]) then
     begin
        if MessageDlg ('Der aktuelle Vertreter wurde verändert,'+#13#10+
                       'wollen Sie die Änderung speichern ?',
                       mtconfirmation,[mbYes, mbNo],0) = mryes
        then Vert_Tab.Post
        else Vert_Tab.Cancel;
     end;
     v :=suchbeg.text;
//kl     UpdateQuery (copy(suchbegr.text,1,4));
     Vert_tab.Locate (SearchField,V,[loCaseInsensitive,loPartialKey]);

//kl     searchtime :=15;
//kl     searchtimer.enabled :=true;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.ListeBtnMouseEnter(Sender: TObject);
begin
     if (sender is tSpeedButton)and
        (tSpeedButton(Sender).Enabled) then
     begin
       tSpeedButton(Sender).Transparent :=False;
       tSpeedButton(Sender).Font.Color :=clBlack;
     end;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.ListeBtnMouseLeave(Sender: TObject);
begin
     if (sender is tSpeedButton) then
     begin
       tSpeedButton(Sender).Transparent :=True;
       tSpeedButton(Sender).Font.Color :=clWhite;
     end;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.Suchen1Click(Sender: TObject);
begin
  try
//kl    Main_PC.ActivePage :=Main_PC.Pages[3];
    SuchBeg.SetFocus;
  except end;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.BlZEdiButtonClick(Sender: TObject);
var sblz,sbank : string;
begin
     if not Vert_Tab.Active then exit;
     SBLZ  := BLZEdi.Text;
     SBank := BankNameEdi.Text;
     if BLZForm.Get(tControl(Sender).Tag,SBLZ,SBank) then
     begin
       if not (Vert_Tab.State in [dsEdit,dsInsert]) then Vert_Tab.Edit;

       Vert_TabBLZ.Value   := SBLZ;
       Vert_TabBank.Value  := SBank;
     end;

end;
//------------------------------------------------------------------------------
procedure TVertreterForm.BlZEdiExit(Sender: TObject);
var sblz,sbank : string;
begin
  tDBEdit(sender).Color :=clWindow;
  SBLZ  := Vert_TabBLZ.Value;
  SBank := Vert_TabBank.Value;
  if BLZForm.GetDataIfUniqueBLZ (SBLZ,SBank) then
  begin
     Vert_TabBLZ.Value   := SBLZ;
     Vert_TabBank.Value  := SBank;
  end;
  VeNumEdiExit(Sender);
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.SuchBegKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
     begin
        Key :=#0;
        if Main_PC.ActivePage=Allg_TS then VeNameEdi.SetFocus else
        if Main_PC.ActivePage=Such_TS then SuchGrid.SetFocus;
     end;

end;
//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiEnter(Sender: TObject);
begin
     tDBEdit(sender).Color :=DM1.EditColor;;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiExit(Sender: TObject);
begin
     tDBEdit(sender).Color :=clWindow;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Shift=[]) and (key=33) then // PGUP
     begin
          Vert_Tab.Prior;
          key :=0;
     end else
     if (Shift=[]) and (key=34) then // PGDOWN
     begin
          Vert_Tab.Next;
          key :=0;
     end else
     if (key=9)and
        (uppercase(tControl(Sender).Name)='MABEMERKUNG')and
        (Shift=[ssCtrl]) then
     begin
          MaBemerkung.SelText :=#9;
          key :=0;
     end else
     if (key=9)and
        (uppercase(tControl(Sender).Name)='MABEMERKUNG')and
        (Shift=[ssShift]) then
     begin
          VeEmailEdi.setfocus;
          key :=0;
     end else
     if (key=9)and
        (uppercase(tControl(Sender).Name)='MABEMERKUNG')and
        (Shift=[]) then
     begin
          VeNumEdi.setfocus;
          key :=0;
     end;
end;
//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
          key :=#0;
          try
            if (uppercase(tControl(Sender).Name)='MABEMERKUNG')
             then VeNumEdi.SetFocus
             else
            if (uppercase(tControl(Sender).Name)='BANKNAMEEDI')
             then ProvArtEdi.SetFocus
             else
            begin
              if MainPanel.Parent is tForm
                then SendMessage (MainPanel.Parent.Handle,WM_NEXTDLGCTL,0,0)
                else SendMessage (MainPanel.Parent.Parent.Handle,WM_NEXTDLGCTL,0,0);
            end;
          except end;
     end;
end;
//------------------------------------------------------------------------------
end.


{ SQL-Auswertungen :


select
JOURNAL.REC_ID, JOURNAL.VRENUM,JOURNAL.RDATUM, JOURNAL.STADIUM, JOURNAL.WARE, JOURNAL.LOHN, JOURNAL.TKOST, JOURNAL.NSUMME, JOURNAL.VERTRETER_ID, JOURNAL.PROVIS_BERECHNET, JOURNAL.PROVIS_WERT, JOURNAL.BRUTTO_FLAG,
SUM(JOURNALPOS.E_RGEWINN * JOURNALPOS.MENGE) as ROHGEWINN
from JOURNAL
left outer join JOURNALPOS on JOURNALPOS.JOURNAL_ID=JOURNAL.REC_ID
where JOURNAL.QUELLE=3 and JOURNAL.VERTRETER_ID>0
group BY JOURNALPOS.JOURNAL_ID

select VRENUM, ARTIKELTYP, MENGE, EPREIS, E_RGEWINN, PROVIS_PROZ, PROVIS_WERT, GEBUCHT, BRUTTO_FLAG
from JOURNALPOS
where QUELLE=3
order by VRENUM, POSITION

}
