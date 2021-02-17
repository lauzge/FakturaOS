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
Modul        : CAO_JOURNAL_VKLIEF
Stand        : 16.05.2004
Version      : 1.2.5.4
Beschreibung : Lieferscheinjournal

History :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
09.11.2003 - Positionsdetails wurden nach erneutem Öffnen nicht aktualisiert
13.03.2004 - Dateilinks implementiert

17.02.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Journal_VKLIEF;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, DBGrids, Menus, DBCtrls, ZDataset, ZAbstractRODataset, VolPeriod,
  cao_var_const, Grids;

type

  { TJournalVKLiefForm }

  TJournalVKLiefForm = class(TForm)
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
    JournalPanel: TPanel;
    ArtPan: TPanel;
    JourPosGrid: TDBGrid;
    JQueryADDR_ID: TZIntegerField;
    JQueryBSUMME: TFloatField;
    JQueryCalcStad: TStringField;
    JQueryCALC_NAME: TStringField;
    JQueryERST_NAME: TZRawStringField;
    JQueryKOST_NETTO: TFloatField;
    JQueryKUN_ANREDE: TZRawStringField;
    JQueryKUN_NAME1: TZRawStringField;
    JQueryKUN_NAME2: TZRawStringField;
    JQueryKUN_NAME3: TZRawStringField;
    JQueryKUN_NUM: TZRawStringField;
    JQueryLDATUM: TZDateField;
    JQueryMSUMME: TFloatField;
    JQueryMWST_1: TFloatField;
    JQueryMWST_2: TFloatField;
    JQueryMWST_3: TFloatField;
    JQueryNSUMME: TFloatField;
    JQueryOrgNum: TZRawStringField;
    JQueryPRINT_FLAG: TBooleanField;
    JQueryProjekt: TZRawStringField;
    JQueryRDatum: TStringField;
    JQueryRDATUM_ORG: TZDateField;
    JQueryREC_ID: TZIntegerField;
    JQuerySOLL_NTAGE: TZSmallIntField;
    JQuerySOLL_SKONTO: TFloatField;
    JQuerySOLL_STAGE: TZSmallIntField;
    JQuerySTADIUM: TZSmallIntField;
    JQueryVLSNUM: TZIntegerField;
    JQueryVRENUM: TZIntegerField;
    JQueryWAEHRUNG: TZRawStringField;
    JQueryWERT_NETTO: TFloatField;
    FilterLab: TLabel;
    Label35: TLabel;
    DatumAW: TVolgaPeriod;
    DateiPan: TPanel;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Kopieren1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Journaldrucken1: TMenuItem;
    Lieferscheindrucken1: TMenuItem;
    Filter1: TMenuItem;
    Aktualisieren1: TMenuItem;
    alleLieferscheine1: TMenuItem;
    nurungedruckteLieferschein1: TMenuItem;
    N4: TMenuItem;
    Positionen1: TMenuItem;
    N1: TMenuItem;
    Preis1: TMenuItem;
    Stadium1: TMenuItem;
    Name1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N2: TMenuItem;
    Storno1: TMenuItem;
    N3: TMenuItem;
    Suchen1: TMenuItem;
    Sortierung1: TMenuItem;
    ReInfoPC: TPageControl;
    Panel1: TPanel;
    DetailPan: TPanel;
    Splitter1: TSplitter;
    Allgemein: TTabSheet;
    TabSheet1: TTabSheet;
    DateiTS: TTabSheet;
    ToolBar2: TToolBar;
    JQuery: TZQuery;
    JoArtTab: TZQuery;
    StornoBtn: TToolButton;
    PrintJournalBtn: TToolButton;
    RePrintBtn: TToolButton;
    ToolButton2: TToolButton;
    ViewPosBtn: TToolButton;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure JahrCBChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure JQueryCalcFields(DataSet: TDataSet);
    procedure Kopieren1Click(Sender: TObject);
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure PrintJournalBtn1Click(Sender: TObject);
    procedure ReInfoPCChange(Sender: TObject);
    procedure RePrintBtn1Click(Sender: TObject);
    procedure SetFilterClick(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
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
  JournalVKLiefForm: TJournalVKLiefForm;

implementation

{$R *.frm}

uses CAO_Tool1, CAO_MAIN, CAO_DM,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     CAO_Link, cao_dbgrid_layout;

{ TJournalVKLiefForm }

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FormCreate(Sender: TObject);
var ja,mo,ta:word;
begin
     Scaled:=TRUE;
     //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
     OnUpdateStatusBar :=nil;
     First     :=True;
     LastID    :=-1;
     LastSDate :=-1;
     Filter    :=0;  // kein Filter

     decodedate (now,ja,mo,ta);

     DatumAW.KindRange :=ksMonth;
     DatumAW.StartDate :=now;
     LastRange         :=ord(ksMonth);

     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;

     SortName  :='Belegnummer';
     SortField :='VLSNUM, RDATUM';
     JahrCBChange(Sender);

     Allgemein.Tabvisible :=False;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FormDeactivate(Sender: TObject);
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
procedure TJournalVKLiefForm.JoArtTabCalcFields(DataSet: TDataSet);
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
procedure TJournalVKLiefForm.JourDSDataChange(Sender: TObject;
  Field: TField);
begin
     if JQueryRec_ID.Value <> LastID then JQueryAfterScroll (nil);
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JourGridDrawColumnCell(Sender: TObject;
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
           20..79   :if JQueryPrint_Flag.AsBoolean = False
                      then num :=3   // gelb für ungedruckt
                      else num :=0;  // cyan für gedruckt
           80..99   :num :=2;
           else num :=0;
         end;
         mainform.imagelist1.Draw (Canvas,rect.left,rect.top,num,true);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then UpdateReView;

  Journaldrucken1.Enabled      :=JQuery.RecordCount>0;
  Lieferscheindrucken1.Enabled :=JQuery.RecordCount>0;
  Kopieren1.Enabled            :=JQuery.RecordCount>0;
  Storno1.Enabled              :=JQuery.RecordCount>0;
  Suchen1.Enabled              :=JQuery.RecordCount>0;

  LastID :=JQueryRec_ID.Value;

  UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JQueryCalcFields(DataSet: TDataSet);
var S : String;
begin
     JQueryCalcStad.Value :=GetLiefStatus(JQueryStadium.Value,JQueryPrint_Flag.AsBoolean);

     if (JQueryVRENUM.Value>10)and(JQueryRDATUM_ORG.AsDateTime>10)
      then JQueryRDatum.Value   :=formatdatetime('dd.mm.yyyy',JQueryRDATUM_ORG.AsDateTime);

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
procedure TJournalVKLiefForm.Kopieren1Click(Sender: TObject);
begin
     DM1.CopyRechnung (JQueryRec_ID.Value,VK_LIEF_EDI);
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_VKLIEF',101);
     dm1.GridSaveLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_VKLIEF',101);
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Positionen1Click(Sender: TObject);
begin
     Positionen1.Checked :=not Positionen1.Checked;
     ReInfoPC.Visible    :=Positionen1.Checked;
     Splitter1.Visible   :=Positionen1.Checked;
     Splitter1.Top       :=ReInfoPC.Top;

     if Positionen1.Checked then UpdateReView;
     ViewPosBtn.Down :=Positionen1.Checked;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Preis1Click(Sender: TObject);
begin
     SetSort(tMenuItem(Sender).Tag);
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.PrintJournalBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowJournalDlg (VK_LIEF, trunc(vonDatum), trunc(bisDatum), DatumAW.Text);
     MainForm.FormActivate (Self);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Lieferscheinjournal'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.ReInfoPCChange(Sender: TObject);
begin
     if (ReInfoPC.Visible) and
        (ReInfoPC.ActivePage=DateiTS) then
     begin
        if LinkForm.MainPanel.Parent <> DateiPan
          then LinkForm.MainPanel.Parent :=DateiPan;

        LinkForm.SetModul (VK_LIEF,JQueryRec_ID.AsInteger, DateiPan);
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.RePrintBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowBelegDlg (VK_LIEF,JQueryRec_ID.AsInteger,False);
     MainForm.FormActivate (Self);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Lieferscheines'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
     Aktualisieren1Click(Sender);
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.SetFilterClick(Sender: TObject);
begin
     if (Sender is TMenuItem) then
     begin
        Filter :=tMenuItem(Sender).Tag;
        DM1.WriteIntegerU ('Journale\VK-LIEF','FILTER',Filter);
        UpdateQuery;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.SichtbareSpalten1Click(Sender: TObject);
begin
     VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.StornoBtn1Click(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie den Lieferschein Nr.:'+
                    Inttostr(JQueryVLSnum.Value)+
                    ' wirklich stornieren ?',
                    mtconfirmation,[mbyes,mbno],0)=mryes then
     begin
       if DM1.Storno_Lieferschein (JQueryRec_ID.Value) then
       begin
          JQuery.Refresh;
          JQueryAfterScroll(nil);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.SuchenBtn1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FormActivate(Sender: TObject);
var ID : Integer;
begin
     if First then
     begin
          LastID :=-1;

//          JourGrid.RowColor1 :=DM1.C2Color;
//          JourPosGrid.RowColor1 :=DM1.C2Color;

          //JourGrid.EditColor :=DM1.EditColor;
          //JourPosGrid.EditColor :=DM1.EditColor;

          dm1.GridLoadLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_VKLIEF',101);
          dm1.GridLoadLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_VKLIEF',101);

          ID :=DM1.ReadIntegerU ('Journale\VK-LIEF','RANGE',-1);
          if (ID>-1) and (LastRange<>ID) then
          begin
               LastRange :=ID;
               DatumAW.KindRange :=tKindRange(LastRange);
          end;

          LastSDate :=DM1.ReadIntegerU ('Journale\VK-LIEF','START-DATE',-1);
          if (LastSDate<>-1)and(LastSDate<>DatumAW.StartDate) then DatumAW.StartDate :=LastSDate;

          Filter :=DM1.ReadIntegerU ('Journale\VK-LIEF','FILTER',0);

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

procedure TJournalVKLiefForm.Aktualisieren1Click(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.ArtPanResize(Sender: TObject);
begin
     DatumAW.Left :=ArtPan.Width - DatumAW.Width-4;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JahrCBChange(Sender: TObject);
begin
     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;
     LastID   :=-1;

     if First then Exit;

     UpdateQuery;

     if ord(DatumAW.KindRange)<>LastRange then
     begin
          DM1.WriteStringU ('Journale','Default','Benutzer-Journaleinstellungen');
          DM1.WriteIntegerU ('Journale\VK-LIEF','RANGE',Ord(DatumAW.KindRange));
     end;
     DM1.WriteIntegerU ('Journale\VK-LIEF','START-DATE',Trunc(DatumAW.StartDate));
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.UpdateReView;
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
procedure TJournalVKLiefForm.SetSort (Index : Integer);
begin
     case Index of
{RDATUM} 2:begin Datum1.Checked :=True;
                 sortfield :='LDATUM, VLSNUM';
                 SortName  :='Datum';
           end;
{NAME}   3:begin Name1.Checked :=True;
                 sortfield :='KUN_NAME1';
                 SortName  :='Name';
           end;
{STADIUM}4:begin Stadium1.Checked :=True;
                 sortfield :='STADIUM, LDATUM, VLSNUM';
                 SortName  :='Stadium';
           end;
{PREIS}  5:begin Preis1.Checked :=True;
                 sortfield :='BSUMME, LDATUM, VLSNUM';
                 SortName  :='Summe';
           end;
{RNUM}else begin Belegnummer1.Checked :=True;
                 sortfield :='VLSNUM, LDATUM';
                 SortName  :='Belegnummer';
           end;
     end;
     if Not First then UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FindDialog1Find(Sender: TObject);
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
procedure TJournalVKLiefForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung : String;
begin
     SuchZeit   :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
     Datensatz  :=Inttostr(JQuery.RecNo)+' von '+inttostr (JQuery.RecordCount);
     Sortierung :='Sortierung : '+SortName;

     if assigned (OnUpdateStatusBar)
      then OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JourGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var fn : string; i:integer;
begin
     fn :=uppercase (Field.FieldName);

     if fn='VLSNUM'    then I :=1 else
     if fn='LDATUM'    then I :=2 else
     if fn='KUN_NAME1' then I :=3 else
     if fn='STADIUM'   then I :=4 else
     if fn='CALCSTAD'  then I :=4 else
     if fn='WARENWERT' then I :=5
     else I :=0;

     SetSort (I);
end;
//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.UpdateQuery;
var OldTime : DWord;
begin
     Application.ProcessMessages;
     try
        OldTime :=GetTickCount;
        Screen.Cursor :=crSQLWait;
        JQuery.Close;
        JQuery.SQL.Clear;
        JQuery.SQL.Add ('SELECT');
        JQuery.SQL.Add ('REC_ID,ADDR_ID,VLSNUM,LDATUM,');
        JQuery.SQL.Add ('NSUMME,MSUMME,BSUMME,STADIUM,KUN_NUM,');
        JQuery.SQL.Add ('KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,WAEHRUNG,');
        JQuery.SQL.Add ('KOST_NETTO, WERT_NETTO,');
        JQuery.SQL.Add ('RDATUM AS RDATUM_ORG,VRENUM,');
        JQuery.SQL.Add ('SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,PRINT_FLAG,');
        JQuery.SQL.Add ('MWST_1, MWST_2, MWST_3, PROJEKT, ORGNUM, ERST_NAME');
        JQuery.SQL.Add ('FROM JOURNAL');
        JQuery.SQL.Add ('WHERE LDATUM >=:VON AND LDATUM<=:BIS');
        JQuery.SQL.Add ('AND QUELLE='+inttostr (VK_LIEF));

        if Filter=1 then JQuery.SQL.Add ('AND PRINT_FLAG="N"');

        JQuery.SQL.Add ('ORDER BY '+sortfield);
        JQuery.ParamByName ('VON').AsDate :=VonDatum;
        JQuery.ParamByName ('BIS').AsDate :=BisDatum+0.99999;
        JQuery.Open;
     finally
       Screen.Cursor :=crDefault;
       QueryTime :=gettickcount-oldtime;

       if Filter=1 then
       begin
          nurungedruckteLieferschein1.Checked :=True;
          FilterLab.Caption :=' gefiltert (nur ungedruckte Lieferscheine)';
       end
        else
       begin
          alleLieferscheine1.Checked :=True;
          FilterLab.Caption :='';
       end;
     end;
end;
//------------------------------------------------------------------------------

end.

