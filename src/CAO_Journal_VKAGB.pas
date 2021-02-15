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
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, DBGrids, StdCtrls, DBCtrls, Menus, ZDataset, ZAbstractRODataset,
  cao_var_const, VolPeriod, Types, Grids, Buttons;

type

  { TJournalVKAGBForm }

  TJournalVKAGBForm = class(TForm)
    JourInfoMemo: TDBMemo;
    JoArtTabARTIKELTYP: TZRawStringField;
    JoArtTabARTIKEL_ID: TZIntegerField;
    JoArtTabARTNUM: TZRawStringField;
    JoArtTabATRNUM: TZIntegerField;
    JoArtTabBARCODE: TZRawStringField;
    JoArtTabBEZEICHNUNG: TMemoField;
    JoArtTabEPREIS: TFloatField;
    JoArtTabG_PREIS: TFloatField;
    JoArtTabJOURNAL_ID: TZIntegerField;
    JoArtTabMATCHCODE: TZRawStringField;
    JoArtTabMENGE: TFloatField;
    JoArtTabME_EINHEIT: TZRawStringField;
    JoArtTabPOSITION: TZIntegerField;
    JoArtTabPR_EINHEIT: TFloatField;
    JoArtTabRABATT: TFloatField;
    JoArtTabREC_ID: TZIntegerField;
    JoArtTabSteuer: TStringField;
    JoArtTabSTEUER_CODE: TZSmallIntField;
    JoArtTabVLSNUM: TZIntegerField;
    JoArtTabVRENUM: TZIntegerField;
    JourDS: TDataSource;
    JoArtDS: TDataSource;
    DBNavigator1: TDBNavigator;
    JourPosGrid: TDBGrid;
    JourGrid: TDBGrid;
    JournalPanel: TPanel;
    ArtPan: TPanel;
    JQueryADATUM: TZDateField;
    JQueryADDR_ID: TZIntegerField;
    JQueryBSUMME: TFloatField;
    JQueryCALC_NAME: TStringField;
    JQueryERST_NAME: TZRawStringField;
    JQueryINFO: TMemoField;
    JQueryKondit: TStringField;
    JQueryKUN_ANREDE: TZRawStringField;
    JQueryKUN_NAME1: TZRawStringField;
    JQueryKUN_NAME2: TZRawStringField;
    JQueryKUN_NAME3: TZRawStringField;
    JQueryKUN_NUM: TZRawStringField;
    JQueryMSUMME: TFloatField;
    JQueryMSUMME_0: TFloatField;
    JQueryMSUMME_1: TFloatField;
    JQueryMSUMME_2: TFloatField;
    JQueryMSUMME_3: TFloatField;
    JQueryMWST_1: TFloatField;
    JQueryMWST_2: TFloatField;
    JQueryMWST_3: TFloatField;
    JQueryNSUMME: TFloatField;
    JQueryORGNUM: TZRawStringField;
    JQueryPROJEKT: TZRawStringField;
    JQueryRDATUM: TZDateField;
    JQueryREC_ID: TZIntegerField;
    JQuerySOLL_NTAGE: TZShortIntField;
    JQuerySOLL_SKONTO: TFloatField;
    JQuerySOLL_STAGE: TZSmallIntField;
    JQuerySTADIUM: TZSmallIntField;
    JQueryVRENUM: TZIntegerField;
    JQueryWAEHRUNG: TZRawStringField;
    Label35: TLabel;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Kopieren1: TMenuItem;
    InRechnungwandeln1: TMenuItem;
    inEKBestellungumwandeln1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Journaldrucken1: TMenuItem;
    Angebotdrucken1: TMenuItem;
    Aktualisieren1: TMenuItem;
    MnuStadiumUmgewandelt: TMenuItem;
    MnuStadiumAbgelehnt: TMenuItem;
    MnuStadiumPruefen: TMenuItem;
    MnuStadiumOffen: TMenuItem;
    DateiPan: TPanel;
    Panel2: TPanel;
    InfoSaveBtn: TSpeedButton;
    InfoCancelBtn: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Stadiumndern1: TMenuItem;
    N4: TMenuItem;
    Positionen1: TMenuItem;
    Preis1: TMenuItem;
    Stadium1: TMenuItem;
    Name1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N5: TMenuItem;
    Storno1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Suchen1: TMenuItem;
    Sortierung1: TMenuItem;
    PopupMenu1: TPopupMenu;
    ReInfoPC: TPageControl;
    Panel1: TPanel;
    DetailPan: TPanel;
    Splitter1: TSplitter;
    Allgemein: TTabSheet;
    TabSheet1: TTabSheet;
    JourInfoTS: TTabSheet;
    DateiTS: TTabSheet;
    ToolBar2: TToolBar;
    DatumAW: TVolgaPeriod;
    StornoBtn: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    PrintJournalBtn: TToolButton;
    RePrintBtn: TToolButton;
    ViewPosBtn: TToolButton;
    JQuery: TZQuery;
    JoArtTab: TZQuery;
    procedure AgbPrintBtn1Click(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure inEKBestellungumwandeln1Click(Sender: TObject);
    procedure InfoCancelBtnClick(Sender: TObject);
    procedure InfoSaveBtnClick(Sender: TObject);
    procedure InRechnungwandeln1Click(Sender: TObject);
    procedure JahrCBChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure JourGridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JourGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure JQueryCalcFields(DataSet: TDataSet);
    procedure Kopieren1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure MnuStadiumChange(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure PrintJournalBtn1Click(Sender: TObject);
    procedure ReInfoPCChange(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure StornoBtn1Click(Sender: TObject);
    procedure SuchenBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
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

    procedure UpdateReView;
    procedure SetSort (Index : Integer);
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure UpdateQuery;
  end;

var
  JournalVKAGBForm: TJournalVKAGBForm;

implementation

{$R *.frm}

uses CAO_Tool1, CAO_MAIN, CAO_DM,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     CAO_Link, cao_dbgrid_layout;

{ TJournalVKAGBForm }

procedure TJournalVKAGBForm.FormCreate(Sender: TObject);
var ja,mo,ta:word;
begin
     Scaled:=TRUE;
     //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
     OnUpdateStatusBar :=nil;
     First     :=True;
     LastID    :=-1;
     LastSDate :=-1;
     decodedate (now,ja,mo,ta);

     DatumAW.KindRange :=ksMonth;
     DatumAW.StartDate :=now;
     LastRange         :=ord(ksMonth);

     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;

     SortName  :='Belegnummer';
     SortField :='VRENUM, RDATUM';
     JahrCBChange(Sender);

     Allgemein.Tabvisible :=False;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.FormDeactivate(Sender: TObject);
begin
     if JQuery.Active then JQuery.Close;
     if JoArtTab.Active then JoArtTab.Close;

     if LinkForm.MainPanel.Parent = DateiPan then
     begin
        LinkForm.MainPanel.Parent :=Twincontrol(LinkForm.MainPanel.Owner);
        LinkForm.FormDeactivate (Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JoArtTabCalcFields(DataSet: TDataSet);
begin
     Case JoArtTabSteuer_Code.Value of
          0: JoArtTabSteuer.Value :='-';
          1: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',JQueryMWST_1.Value);
          2: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',JQueryMWST_2.Value);
          3: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',JQueryMWST_3.Value);
          else JoArtTabSteuer.Value :='???';
     end;

     if JoArtTabArtikelTyp.Value='T' then JoArtTabSteuer.Value :='';
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JourDSDataChange(Sender: TObject;
  Field: TField);
begin
     if JQueryRec_ID.Value <> LastID then JQueryAfterScroll (nil);
     InfoSaveBtn.Enabled :=(JQuery.RecordCount>0)and
                           (JQuery.State in [dsEdit, dsInsert]);
     InfoCancelBtn.Enabled :=InfoSaveBtn.Enabled;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JourGridContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
     // Popup unterdrücken wenn keine Daten vorhanden
     Handled :=JQuery.RecordCount=0;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JourGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var num : integer;
begin
     with sender as tdbgrid do
     begin
       if (column.fieldname='STADIUM') then
       begin
         canvas.fillrect (rect);
         Case column.field.asinteger of
           //0   :num :=3; // gelb, in Bearbeitung
           //10  :num :=4; // violett, warte auf Freigabe
           //20  :num :=0; // cyan, Fertig
           //30..69   :num :=1; // rot
           //30  :num :=2; // grün, in Rechnung gewandelt

           100: num :=2; // grün, in Rechnung gewandelt
           101: num :=1; // rot, vom Kunden abgelehnt
           102: num :=3; // bitte prüfen
           else num :=0;
         end;
         mainform.imagelist1.Draw (Canvas,rect.left,rect.top,num,true);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JourGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=vk_f5 then begin key :=0; JQuery.Refresh; end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then UpdateReView;

  Journaldrucken1.Enabled    :=JQuery.RecordCount>0;
  angebotdrucken1.Enabled    :=JQuery.RecordCount>0;
  Kopieren1.Enabled          :=JQuery.RecordCount>0;
  InRechnungwandeln1.Enabled :=JQuery.RecordCount>0;
  Storno1.Enabled            :=JQuery.RecordCount>0;
  Suchen1.Enabled            :=JQuery.RecordCount>0;

  LastID :=JQueryRec_ID.Value;

  UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JQueryCalcFields(DataSet: TDataSet);
var S : String;
begin
     if (JQuerySOLL_SKONTO.Value>0)and(JQuerySOLL_STAGE.Value>0)
      then JQueryKondit.Value :=JQuerySOLL_STAGE.AsString+' T. '+
                                formatfloat ('0.0"%"',JQuerySOLL_SKONTO.Value)+' '+
                                JQuerySOLL_NTAGE.AsString+' T.Netto'
      else if JQuerySOLL_NTAGE.Value < 2
            then JQueryKondit.Value :='sofort'
            else JQueryKondit.Value :=JQuerySOLL_NTAGE.AsString+' Tage Netto';

     S:=JqueryKUN_Anrede.AsString;

     if length(JQueryKUN_NAME1.AsString)>0 then
     begin
        if length (S)>0 then S :=S+' ';
        S :=S+JQueryKUN_NAME1.AsString;
     end;
     if length(JQueryKUN_NAME2.AsString)>0 then
     begin
        if length (S)>0 then S :=S+' ';
        S :=S+JQueryKUN_NAME2.AsString;
     end;
     if length(JQueryKUN_NAME3.AsString)>0 then
     begin
        if length (S)>0 then S :=S+' ';
        S :=S+JQueryKUN_NAME3.AsString;
     end;
     JQueryCalc_Name.AsString :=S;

end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.Kopieren1Click(Sender: TObject);
begin
     DM1.CopyRechnung (JQueryRec_ID.Value,VK_AGB_EDI);
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_VKAGB',102);
     dm1.GridSaveLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_VKAGB',101);
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.MnuStadiumChange(Sender: TObject);
begin
     if JQuery.RecordCount=0 then exit;
     if Sender is tMenuItem then
     begin
        JQuery.Edit;
        JQueryStadium.AsInteger :=tMenuItem(Sender).Tag;
        JQuery.Post;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.Positionen1Click(Sender: TObject);
begin
     Positionen1.Checked :=not Positionen1.Checked;
     ReInfoPC.Visible    :=Positionen1.Checked;
     Splitter1.Visible   :=Positionen1.Checked;
     Splitter1.Top       :=ReInfoPC.Top;

     if Positionen1.Checked then UpdateReView;
     ViewPosBtn.Down :=Positionen1.Checked;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.Preis1Click(Sender: TObject);
begin
     SetSort(tMenuItem(Sender).Tag);
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.PrintJournalBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowJournalDlg (VK_AGB, trunc(vonDatum), trunc(bisDatum), DatumAW.Text);
     MainForm.FormActivate (Self);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Angebotsjournales'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.ReInfoPCChange(Sender: TObject);
begin
     if (ReInfoPC.Visible) and
        (ReInfoPC.ActivePage=DateiTS) then
     begin
        if LinkForm.MainPanel.Parent <> DateiPan
          then LinkForm.MainPanel.Parent :=DateiPan;

        LinkForm.SetModul (VK_AGB,JQueryRec_ID.AsInteger, DateiPan);
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.SichtbareSpalten1Click(Sender: TObject);
begin
     VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.StornoBtn1Click(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie das Angebot Nr.:'+
                    Inttostr(JQueryVRenum.Value)+
                    ' wirklich stornieren ?',
                    mtconfirmation,[mbyes,mbno],0)=mryes then
     begin
       if DM1.Storno_Angebot (JQueryRec_ID.Value) then
       begin
          JQuery.Refresh;
          JQueryAfterScroll(nil);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.SuchenBtn1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.FormActivate(Sender: TObject);
var ID : Integer;
begin
     if First then
     begin
          LastID :=-1;

//          JourGrid.RowColor1    :=DM1.C2Color;
//          JourPosGrid.RowColor1 :=DM1.C2Color;
//          JourGrid.EditColor    :=DM1.EditColor;
//          JourPosGrid.EditColor :=DM1.EditColor;

          dm1.GridLoadLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_VKAGB',102);
          dm1.GridLoadLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_VKAGB',101);

          ID :=DM1.ReadIntegerU ('Journale\VK-AGB','RANGE',-1);
          if (ID>-1) and (LastRange<>ID) then
          begin
               LastRange :=ID;
               DatumAW.KindRange :=tKindRange(LastRange);
          end;

          LastSDate :=DM1.ReadIntegerU ('Journale\VK-AGB','START-DATE',-1);
          if (LastSDate<>-1)and(LastSDate<>DatumAW.StartDate) then DatumAW.StartDate :=LastSDate;

          First :=False;
          UpdateQuery;
     end;
     if not JQuery.Active then
     begin
          ID :=LastID;
          JQuery.Open;
          if LastID >-1 then JQuery.Locate ('REC_ID',ID,[]);
          if Positionen1.Checked then UpdateReView;
     end;
     UpdateStatus;
     JourGrid.SetFocus;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JahrCBChange(Sender: TObject);
begin
     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;
     LastID   :=-1;

     if First then Exit;

     UpdateQuery;

     if ord(DatumAW.KindRange)<>LastRange then
     begin
          DM1.WriteStringU ('Journale','Default','Benutzer-Journaleinstellungen');
          DM1.WriteIntegerU ('Journale\VK-AGB','RANGE',Ord(DatumAW.KindRange));
     end;
     DM1.WriteIntegerU ('Journale\VK-AGB','START-DATE',Trunc(DatumAW.StartDate));
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.ArtPanResize(Sender: TObject);
begin
     DatumAW.Left :=ArtPan.Width - DatumAW.Width-4;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.AgbPrintBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowBelegDlg (VK_AGB,JQueryRec_ID.AsInteger,False);
     MainForm.FormActivate (Self);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Angebotes'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.Aktualisieren1Click(Sender: TObject);
begin
     JQuery.Refresh;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.inEKBestellungumwandeln1Click(Sender: TObject);
var ID : Integer;
begin
     ID :=DM1.CopyRechnung (JQueryRec_ID.Value,EK_BEST_EDI);
     if MessageDlg('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?',
                   mtconfirmation,[mbyes, mbno],0)=mryes
      then MainForm.JumpTo (EK_BEST_EDI, ID, 0, False);
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.InfoCancelBtnClick(Sender: TObject);
begin
     JQuery.Cancel;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.InfoSaveBtnClick(Sender: TObject);
begin
     JQuery.Post;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.InRechnungwandeln1Click(Sender: TObject);
var ID : Integer;
begin
     ID :=DM1.CopyRechnung (JQueryRec_ID.Value,VK_RECH_EDI);

     try
        JQuery.Edit;
        JQuerySTADIUM.AsInteger :=100; // Stadium für "in Rechnung gewandelt"
        JQuery.Post;
     except
        JQuery.Cancel;
     end;

     if MessageDlg('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?',
                   mtconfirmation,[mbyes, mbno],0)=mryes
      then MainForm.JumpTo (VK_RECH_EDI, ID, 0, False);
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.UpdateReView;
var mwst1,mwst2,mwst3 : string;

begin
     mwst1 :=formatfloat ('0.0',JQueryMWST_1.Value)+'%';
     mwst2 :=formatfloat ('0.0',JQueryMWST_2.Value)+'%';
     mwst3 :=formatfloat ('0.0',JQueryMWST_3.Value)+'%';

     JoArtTab.Close;
     JoArtTab.ParamByName('ID').AsInteger :=JQueryREC_ID.AsInteger;
     JoArtTab.Open;

     ReInfoPCChange(Self);
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.SetSort (Index : Integer);
begin
     case Index of
{RDATUM} 2:begin Datum1.Checked :=True;
                 sortfield :='RDATUM, VRENUM';
                 SortName  :='Datum';
           end;
{NAME}   3:begin Name1.Checked :=True;
                 sortfield :='KUN_NAME1';
                 SortName  :='Name';
           end;
{STADIUM}4:begin Stadium1.Checked :=True;
                 sortfield :='STADIUM, RDATUM, VRENUM';
                 SortName  :='Stadium';
           end;
{PREIS}  5:begin Preis1.Checked :=True;
                 sortfield :='BSUMME, RDATUM, VRENUM';
                 SortName  :='Summe';
           end;
{RNUM}else begin Belegnummer1.Checked :=True;
                 sortfield :='VRENUM, RDATUM';
                 SortName  :='Belegnummer';
           end;
     end;
     if Not First then UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung : String;
begin
     SuchZeit   :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
     Datensatz  :=Inttostr(JQuery.RecNo)+' von '+inttostr (JQuery.RecordCount);
     Sortierung :='Sortierung : '+SortName;

     if assigned (OnUpdateStatusBar)
      then OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.UpdateQuery;
var OldTime : DWord;
begin
     Application.ProcessMessages;
     try
        OldTime :=GetTickCount;
        Screen.Cursor :=crSQLWait;
        JQuery.Close;
        JQuery.SQL.Clear;
        JQuery.SQL.Add ('SELECT');
        JQuery.SQL.Add ('REC_ID,ADDR_ID,VRENUM,RDATUM,LDATUM,ADATUM,ATRNUM,VLSNUM,');
        JQuery.SQL.Add ('NSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,MSUMME,BSUMME,STADIUM,KUN_NUM,SOLL_STAGE,SOLL_NTAGE,');
        JQuery.SQL.Add ('KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG,MWST_1,MWST_2,MWST_3,');
        JQuery.SQL.Add ('LDATUM AS LDATUM_ORG,ADATUM,ATRNUM,VLSNUM,KM_STAND,IST_SKONTO,');
        JQuery.SQL.Add ('IST_BETRAG,IST_ZAHLDAT AS IST_ZAHLDAT_ORG,MAHNKOSTEN,SOLL_SKONTO,');
        JQuery.SQL.Add ('ERST_NAME,INFO FROM JOURNAL');
        JQuery.SQL.Add ('WHERE RDATUM >=:VON AND RDATUM<=:BIS');
        JQuery.SQL.Add ('AND QUELLE='+inttostr (VK_AGB));
        JQuery.SQL.Add ('ORDER BY '+sortfield);
        JQuery.ParamByName ('VON').AsDate :=VonDatum;
        JQuery.ParamByName ('BIS').AsDate :=BisDatum;
        JQuery.Open;
     finally
       Screen.Cursor :=crDefault;
       QueryTime :=gettickcount-oldtime;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.JourGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var fn : string; i:integer;
begin
     fn :=uppercase (Field.FieldName);

     if fn='VRENUM'    then I :=1 else
     if fn='RDATUM'    then I :=2 else
     if fn='KUN_NAME1' then I :=3 else
     if fn='STADIUM'   then I :=4 else
     if fn='CALCSTAD'  then I :=4 else
     if fn='NSUMME'    then I :=5 else
     if fn='MSUMME'    then I :=5 else
     if fn='BSUMME'    then I :=5
     else I :=0;

     SetSort (I);
end;
//------------------------------------------------------------------------------
procedure TJournalVKAGBForm.FindDialog1Find(Sender: TObject);
var f,t : string;
    i : integer;
    Found : Boolean;
begin
//     i :=JourGrid.Col;          // von Volker geändert
     i :=JourGrid.Columns.Count;  // von Volker geändert
     f :=JourGrid.Columns[i-1].FieldName;
     t :=MainForm.FindDialog1.FindText;
     Found :=False;
     if frDown in MainForm.FindDialog1.Options then JQuery.Next
                                               else JQuery.Prior;
     repeat
           if frMatchCase in MainForm.FindDialog1.Options then
           begin
                // Groß- und Kleinschreibung beachten
                Found :=Pos (t,JQuery.FieldByName(f).AsString)>0;
           end
              else
           begin
                // Groß- und Kleinschreibung nicht beachten
                Found :=Pos (uppercase(t),uppercase(JQuery.FieldByName(f).AsString))>0;
           end;

           if not Found then
           begin
             if frDown in MainForm.FindDialog1.Options then JQuery.Next
                                                       else JQuery.Prior;
           end;
     until (JQuery.Eof)or(JQuery.Bof)or(Found);
end;
//------------------------------------------------------------------------------

end.

