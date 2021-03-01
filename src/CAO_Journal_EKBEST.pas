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
Modul        : CAO_JOURNAL_EKBEST
Stand        : 16.05.2004
Version      : 1.2.5.4
Beschreibung : EK-Bestellungen Journal

History :

06.05.2003 - zum GNU-Source hinzugefügt
26.05.2003 - mit einem Rechtsclick im Journal kann jetzt der Bestellstatus
             manuell geändert werden
31.05.2003 - in der Positionsdetails wird jetzt auch die bereits eingekaufte
             Menge mit angezeigt
           - offene und überfällige Bestellungen werden jetzt im Journal rot
             angezeigt
09.11.2003 - Positionsdetails wurden nach erneutem Öffnen nicht aktualisiert
25.02.2004 - Filter für "nur offene Bestellungen" eingebaut
13.03.2004 - Dateilinks implementiert

18.02.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Journal_EKBEST;

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, DBGrids, Menus, DBCtrls, ZDataset, ZAbstractRODataset,
  cao_var_const, VolPeriod, Grids;

type

  { TJournalEKBestForm }

  TJournalEKBestForm = class(TForm)
    DBNavigator1: TDBNavigator;
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
    JoArtTabMENGE_EK: TFloatField;
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
    JourGrid: TDBGrid;
    JourPosGrid: TDBGrid;
    JournalPanel: TPanel;
    ArtPan: TPanel;
    FilterLab: TLabel;
    JQueryADDR_ID: TZIntegerField;
    JQueryBSUMME: TFloatField;
    JQueryCalcStad: TStringField;
    JQueryERST_NAME: TZRawStringField;
    JQueryKondit: TStringField;
    JQueryKUNLIEF_ID: TZIntegerField;
    JQueryKUN_NAME1: TZRawStringField;
    JQueryKUN_NUM: TZRawStringField;
    JQueryLTERMIN: TZDateField;
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
    JQuerySOLL_NTAGE: TZSmallIntField;
    JQuerySOLL_SKONTO: TFloatField;
    JQuerySOLL_STAGE: TZSmallIntField;
    JQuerySTADIUM: TZShortIntField;
    JQueryVRENUM: TZIntegerField;
    JQueryWAEHRUNG: TZRawStringField;
    Label35: TLabel;
    DatumAW: TVolgaPeriod;
    DateiPan: TPanel;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Kopieren1: TMenuItem;
    InEinkaufwandeln1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Journaldrucken1: TMenuItem;
    EKBestellungdrucken1: TMenuItem;
    Filter1: TMenuItem;
    Aktualisieren1: TMenuItem;
    AlleBestellungen1: TMenuItem;
    nuroffeneBestellungen1: TMenuItem;
    N4: TMenuItem;
    Positionen1: TMenuItem;
    N1: TMenuItem;
    Preis1: TMenuItem;
    Stadium1: TMenuItem;
    Name1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N5: TMenuItem;
    Storno1: TMenuItem;
    N2: TMenuItem;
    Suchen1: TMenuItem;
    N3: TMenuItem;
    Sortierung1: TMenuItem;
    ToolButton: TToolButton;
    StornoBtn: TToolButton;
    ToolButton1: TToolButton;
    PrintJournalBtn: TToolButton;
    EKBestPrintBtn: TToolButton;
    ViewPosBtn: TToolButton;
    vollgeliefert1: TMenuItem;
    teillieferung1: TMenuItem;
    offen1: TMenuItem;
    Stadiumndern1: TMenuItem;
    PopupMenu1: TPopupMenu;
    ReInfoPC: TPageControl;
    Panel1: TPanel;
    DetailPan: TPanel;
    Allgemein: TTabSheet;
    Splitter1: TSplitter;
    TabSheet1: TTabSheet;
    DateiTS: TTabSheet;
    ToolBar2: TToolBar;
    JQuery: TZQuery;
    JoArtTab: TZQuery;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure EKBestPrintBtn1Click(Sender: TObject);
    procedure FilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure InEinkaufwandeln1Click(Sender: TObject);
    procedure JahrCBChange(Sender: TObject);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure JourGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure JQueryCalcFields(DataSet: TDataSet);
    procedure JourGridApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; State: TGridDrawState);
    procedure Kopieren1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure vollgeliefert1Click(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure PrintJournalBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ReInfoPCChange(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure StornoBtn1Click(Sender: TObject);
    procedure SuchenBtn1Click(Sender: TObject);
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
    Filter          : Integer;

    procedure UpdateReView;
    procedure SetSort (Index : Integer);
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;

    procedure UpdateQuery;
  end;

var
  JournalEKBestForm: TJournalEKBestForm;

implementation

{$R *.frm}

uses CAO_Tool1, CAO_MAIN, CAO_DM,
     {$IFDEF REPORTBUILDER} CAO_PrintRech, {$ENDIF}
     CAO_Link, cao_dbgrid_layout;

{ TJournalEKBestForm }

procedure TJournalEKBestForm.FormCreate(Sender: TObject);
var ja,mo,ta:word;
begin
     Scaled:=TRUE;
     //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
     OnUpdateStatusBar :=nil;
     First     :=True;
     LastID    :=-1;
     LastSDate :=-1;
     Filter    :=0;
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
procedure TJournalEKBestForm.FormDeactivate(Sender: TObject);
begin
     if JQuery.Active then JQuery.Close;
     if JoArtTab.Active then JoArtTab.Close;

     {$IFDEF PRO}
     if LinkForm.MainPanel.Parent = DateiPan then
     begin
        LinkForm.MainPanel.Parent :=Twincontrol(LinkForm.MainPanel.Owner);
        LinkForm.FormDeactivate (Sender);
     end;
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.InEinkaufwandeln1Click(Sender: TObject);
var ID : INteger;
begin
     DM1.CopyRechnung (JQueryRec_ID.Value,EK_RECH_EDI);
     if MessageDlg('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?',
                   mtconfirmation,[mbyes, mbno],0)=mryes
      then MainForm.JumpTo (EK_RECH_EDI, ID, 0, False);
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JahrCBChange(Sender: TObject);
begin
     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;
     LastID   :=-1;

     if First then Exit;

     UpdateQuery;

     if ord(DatumAW.KindRange)<>LastRange then
     begin
          DM1.WriteStringU ('Journale','Default','Benutzer-Journaleinstellungen');
          DM1.WriteIntegerU ('Journale\EK-BEST','RANGE',Ord(DatumAW.KindRange));
     end;
     DM1.WriteIntegerU ('Journale\EK-BEST','START-DATE',Trunc(DatumAW.StartDate));
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JoArtTabCalcFields(DataSet: TDataSet);
begin
     Case JoArtTabSteuer_Code.Value of
          0: JoArtTabSteuer.Value :='-';
          1: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',JQueryMWST_1.Value);
          2: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',JQueryMWST_2.Value);
          3: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',JQueryMWST_3.Value);
          else JoArtTabSteuer.Value :='???';
     end;

     if JoArtTabArtikelTyp.Value='T' then
     begin
        JoArtTabSteuer.Value :='';
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourDSDataChange(Sender: TObject;
  Field: TField);
begin
     if JQueryRec_ID.Value <> LastID then JQueryAfterScroll (nil);
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourGridDrawColumnCell(Sender: TObject;
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
           20..29   :num :=0;
           30..69   :num :=1;
           70..79   :num :=3;
           80..99   :num :=2;
           100..255 :num :=4;
           else num :=0;
         end;
         mainform.imagelist1.Draw (Canvas,rect.left,rect.top,num,true);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=vk_f5 then begin key :=0; JQuery.Refresh; end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then UpdateReView;

  Journaldrucken1.Enabled      :=JQuery.RecordCount>0;
  ekbestellungdrucken1.Enabled :=JQuery.RecordCount>0;
  Kopieren1.Enabled            :=JQuery.RecordCount>0;
  Storno1.Enabled              :=JQuery.RecordCount>0;
  Suchen1.Enabled              :=JQuery.RecordCount>0;

  LastID :=JQueryRec_ID.Value;

  UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JQueryCalcFields(DataSet: TDataSet);
begin
     if (JQuerySOLL_SKONTO.Value>0)and(JQuerySOLL_STAGE.Value>0)
      then JQueryKondit.Value :=JQuerySOLL_STAGE.AsString+' T. '+
                                formatfloat ('0.0"%"',JQuerySOLL_SKONTO.Value)+' '+
                                JQuerySOLL_NTAGE.AsString+' T.Netto'
      else if JQuerySOLL_NTAGE.Value < 2
            then JQueryKondit.Value :='sofort'
            else JQueryKondit.Value :=JQuerySOLL_NTAGE.AsString+' Tage Netto';

      JQueryCalcStad.Value :=GetEKBestStatus(JQueryStadium.Value);
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.FormActivate(Sender: TObject);
var ID : Integer;
begin
     if First then
     begin
          LastID :=-1;

//          JourGrid.RowColor1    :=DM1.C2Color;
//          JourPosGrid.RowColor1 :=DM1.C2Color;
//          JourGrid.EditColor :=DM1.EditColor;
//          JourPosGrid.EditColor :=DM1.EditColor;

          dm1.GridLoadLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_EKBEST',101);
          dm1.GridLoadLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_EKBEST',101);

          ID :=DM1.ReadIntegerU ('Journale\EK-BEST','RANGE',-1);
          if (ID>-1) and (LastRange<>ID) then
          begin
               LastRange :=ID;
               DatumAW.KindRange :=tKindRange(LastRange);
          end;

          Filter :=DM1.ReadIntegerU ('Journale\EK-BEST','FILTER',0);

          LastSDate :=DM1.ReadIntegerU ('Journale\EK-BEST','START-DATE',-1);
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
procedure TJournalEKBestForm.ArtPanResize(Sender: TObject);
begin
     DatumAW.Left :=ArtPan.Width - DatumAW.Width-4;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Aktualisieren1Click(Sender: TObject);
begin
     JQuery.Refresh;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.EKBestPrintBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowBelegDlg (EK_BEST,JQueryRec_ID.AsInteger,False);
     MainForm.FormActivate (Self);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.FilterClick(Sender: TObject);
begin
     if (Sender is TMenuItem)and(tMenuItem(Sender).Tag in [0,1]) then
     begin
        Filter :=tMenuItem(Sender).Tag;
        DM1.WriteIntegerU ('Journale\EK-BEST','FILTER',Filter);
        UpdateQuery;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.UpdateReView;
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
procedure TJournalEKBestForm.SetSort (Index : Integer);
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
procedure TJournalEKBestForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung : String;
begin
     SuchZeit   :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
     Datensatz  :=Inttostr(JQuery.RecNo)+' von '+inttostr (JQuery.RecordCount);
     Sortierung :='Sortierung : '+SortName;

     if assigned (OnUpdateStatusBar)
      then OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.UpdateQuery;
var OldTime : DWord; I : Integer;
begin
     Application.ProcessMessages;
     try
        OldTime :=GetTickCount64;
        Screen.Cursor :=crSQLWait;
        JQuery.Close;
        JQuery.SQL.Clear;
        JQuery.SQL.Add ('SELECT');
        JQuery.SQL.Add ('REC_ID,ADDR_ID,VRENUM,RDATUM,LDATUM,ADATUM,ATRNUM as KUNLIEF_ID,VLSNUM,');
        JQuery.SQL.Add ('NSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,MSUMME,BSUMME,STADIUM,KUN_NUM,SOLL_STAGE,SOLL_NTAGE,');
        JQuery.SQL.Add ('KUN_NAME1,PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG,MWST_1,MWST_2,MWST_3,');
        JQuery.SQL.Add ('LDATUM AS LTERMIN,SOLL_SKONTO,ERST_NAME');
        JQuery.SQL.Add ('FROM JOURNAL');
        JQuery.SQL.Add ('WHERE RDATUM >=:VON AND RDATUM<=:BIS');
        JQuery.SQL.Add ('AND QUELLE='+inttostr (EK_BEST));

        if Filter=1
         then JQuery.SQL.Add ('AND STADIUM<100');

        JQuery.SQL.Add ('ORDER BY '+sortfield);
        JQuery.ParamByName ('VON').AsDate :=VonDatum;
        JQuery.ParamByName ('BIS').AsDate :=BisDatum;
        JQuery.Open;

        if Filter=1 then
        begin
           FilterLab.Caption :=' gefiltert (nur offene Bestellungen)';
           nuroffeneBestellungen1.Checked :=True;
        end
         else
        begin
           FilterLab.Caption :='';
           AlleBestellungen1.Checked :=True;
        end;

        for I:=0 to JourGrid.Columns.Count-1 do
        begin
           JourGrid.Columns[i].Title.Font.Style :=[];
           if Pos(uppercase(JourGrid.Columns[i].Field.FieldName),SortField)=1
            then JourGrid.Columns[i].Title.Font.Style :=[fsBold];
        end;

     finally
       Screen.Cursor :=crDefault;
       QueryTime :=gettickcount64-oldtime;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourGridApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
     if (Int(JQueryLTERMIN.AsDateTime)<=Int(Now)) and
        (JQuerySTADIUM.AsInteger>=20)and(JQuerySTADIUM.AsInteger<100)
      then Canvas.Font.Color :=clRed;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Kopieren1Click(Sender: TObject);
var ID : Integer;
begin
     ID :=DM1.CopyRechnung (JQueryRec_ID.Value,EK_BEST_EDI);
     if MessageDlg('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?',
                   mtconfirmation,[mbyes, mbno],0)=mryes
      then MainForm.JumpTo (EK_BEST_EDI, ID, 0, False);
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_EKBEST',101);
     dm1.GridSaveLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_EKBEST',101);
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.vollgeliefert1Click(Sender: TObject);
var ST : Integer;
begin
     if Sender is tMenuItem then
     begin
        case tMenuItem(Sender).Tag of
             1: st :=20;
             2: st :=30;
             3: st :=100;
           else st :=-1;
        end;
        if (jquery.recordcount>0) and (st>0) and
           (jquerystadium.asinteger <> st) then
        begin
           if not (jquery.state in [dsEdit, dsInsert]) then JQuery.Edit;
           JQueryStadium.AsInteger :=ST;
           JQuery.Post;
        end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Positionen1Click(Sender: TObject);
begin
     Positionen1.Checked :=not Positionen1.Checked;
     ReInfoPC.Visible    :=Positionen1.Checked;
     Splitter1.Visible   :=Positionen1.Checked;
     Splitter1.Top       :=ReInfoPC.Top;

     if Positionen1.Checked then UpdateReView;
     ViewPosBtn.Down :=Positionen1.Checked;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Preis1Click(Sender: TObject);
begin
     SetSort(tMenuItem(Sender).Tag);
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.PrintJournalBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowJournalDlg (EK_BEST, trunc(vonDatum), trunc(bisDatum), DatumAW.Text);
     MainForm.FormActivate (Self);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.ReInfoPCChange(Sender: TObject);
begin
     if (ReInfoPC.Visible) and
        (ReInfoPC.ActivePage=DateiTS) then
     begin
        if LinkForm.MainPanel.Parent <> DateiPan
          then LinkForm.MainPanel.Parent :=DateiPan;

        LinkForm.SetModul (EK_BEST,JQueryRec_ID.AsInteger, DateiPan);
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.SichtbareSpalten1Click(Sender: TObject);
begin
     VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.StornoBtn1Click(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie die EK-Bestellung Nr.:'+
                    Inttostr(JQueryVRenum.Value)+
                    ' wirklich stornieren ?',
                    mtconfirmation,[mbyes,mbno],0)=mryes then
     begin
       if DM1.Storno_EKBestellung (JQueryRec_ID.Value) then
       begin
          JQuery.Refresh;
          JQueryAfterScroll(nil);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.SuchenBtn1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourGridTitleBtnClick(Sender: TObject;
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
procedure TJournalEKBestForm.FindDialog1Find(Sender: TObject);
var f,t : string;
    i : integer;
    Found : Boolean;
begin
//     i :=JourGrid.Col;
     i :=JourGrid.Columns.Count;
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

