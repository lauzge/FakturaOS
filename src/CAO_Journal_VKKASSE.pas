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
Modul        : CAO_JOURNAL_VKKASSE
Stand        : 01.01.2004
Version      : 1.2.0.3
Beschreibung : Kassenjournal

History :

- 22.01.2003 Version 1.0.0.49 released Jan Pokrandt
- 23.06.2003 Bugfix, Button Tagesabschlß war aktiv wenn keine Daten im Journal
             angezeigt wurden
- 24.05.2003 Version zum GNU-Source hinzugefügt
- 29.07.2003 In den Tagessummen werden jetzt die Überschriften korrekt angezeigt
- 01.01.2004 Tagesjournal/Druck hinzugefügt

14.02.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Journal_VKKASSE;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Menus, StdCtrls, ComCtrls, DBCtrls, DBGrids, ZDataset, ZAbstractRODataset,
  cao_var_const, VolPeriod, Grids;

type

  { TJournalVKKasseForm }

  TJournalVKKasseForm = class(TForm)
    DateField1: TZDateField;
    Bearbeiten1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Aktualisieren1: TMenuItem;
    Journaldrucken1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N2: TMenuItem;
    Storno1: TMenuItem;
    N3: TMenuItem;
    Suchen1: TMenuItem;
    Tagesabschlu1: TMenuItem;
    Rechnungdrucken1: TMenuItem;
    Tagesjournal1: TMenuItem;
    N4: TMenuItem;
    Summen1: TMenuItem;
    Positionen1: TMenuItem;
    Sortierung1: TMenuItem;
    TagBelegeGrid: TDBGrid;
    JourPosGrid: TDBGrid;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    B_SUM_PAN: TPanel;
    M_SUM_PAN: TPanel;
    N_SUM_PAN: TPanel;
    Splitter1: TSplitter;
    TagSumDetailGrid: TDBGrid;
    JourGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    Label35: TLabel;
    MainMenu1: TMainMenu;
    ArtPan: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SumPanel: TPanel;
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabAbschlussQueryBSUMME: TFloatField;
    TagAbschlussQueryNSUMME: TFloatField;
    TagAbschlussQueryREC_ID: TZIntegerField;
    TagAbschlussQueryuw_num: TZIntegerField;
    TagAbschlussQueryVRENUM: TZIntegerField;
    TagAbschlussQueryWAEHRUNG: TZRawStringField;
    TagAbschlussQueryzahlart: TZSmallIntField;
    TagSumDetailDS: TDataSource;
    FloatField1: TFloatField;
    JourDS: TDataSource;
    JQueryANZAHL: TZInt64Field;
    JQueryBSUMME: TFloatField;
    JQueryGEBUCHT: TZIntegerField;
    JQueryMSUMME: TFloatField;
    JQueryMSUMME_0: TFloatField;
    JQueryMSUMME_1: TFloatField;
    JQueryMSUMME_2: TFloatField;
    JQueryMSUMME_3: TFloatField;
    JQueryNSUMME: TFloatField;
    JQueryRDATUM: TZDateField;
    JQueryRN_BIS: TZIntegerField;
    JQueryRN_VON: TZIntegerField;
    JQueryWAEHRUNG: TZRawStringField;
    SumQueryBrutto: TFloatField;
    SumQueryMwSt: TFloatField;
    SumQueryNetto: TFloatField;
    SumQueryWAEHRUNG: TZRawStringField;
    TagBelegeBSUMME: TFloatField;
    TagBelegeDS: TDataSource;
    JoArtDS: TDataSource;
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
    JournalPanel: TPanel;
    JoArtTab: TZQuery;
    TagBelege: TZQuery;
    TagBelegeERST_NAME: TZRawStringField;
    TagBelegeGEGENKONTO: TZIntegerField;
    TagBelegeMSUMME: TFloatField;
    TagBelegeMSUMME_0: TFloatField;
    TagBelegeMSUMME_1: TFloatField;
    TagBelegeMSUMME_2: TFloatField;
    TagBelegeMSUMME_3: TFloatField;
    TagBelegeMWST_1: TFloatField;
    TagBelegeMWST_2: TFloatField;
    TagBelegeMWST_3: TFloatField;
    TagBelegeNSUMME: TFloatField;
    TagBelegeRDATUM: TZDateField;
    TagBelegeREC_ID: TZIntegerField;
    TagBelegeSTADIUM: TZShortIntField;
    TagBelegeVRENUM: TZIntegerField;
    TagBelegeWAEHRUNG: TZRawStringField;
    TagBelegeZahlart_Kurz: TZRawStringField;
    JQuery: TZQuery;
    SumQuery: TZQuery;
    TagSumDetail: TZQuery;
    TagSumDetailANZAHL: TZInt64Field;
    TagSumDetailBSUMME: TFloatField;
    TagSumDetailMSUMME: TFloatField;
    TagSumDetailMSUMME_0: TFloatField;
    TagSumDetailMSUMME_1: TFloatField;
    TagSumDetailMSUMME_2: TFloatField;
    TagSumDetailMSUMME_3: TFloatField;
    TagSumDetailNSUMME: TFloatField;
    TagSumDetailRDATUM: TZDateField;
    TagSumDetailRN_BIS: TZIntegerField;
    TagSumDetailRN_VON: TZIntegerField;
    TagSumDetailWAEHRUNG: TZRawStringField;
    TagSumDetailZahlart_Kurz: TZRawStringField;
    TagAbschlussQuery: TZQuery;
    DatumAW: TVolgaPeriod;
    ToolBar1: TToolBar;
    SuchenBtn: TToolButton;
    StornoBtn: TToolButton;
    TabAbschlussBtn: TToolButton;
    PrintJournalBtn: TToolButton;
    TagesJournalBtn: TToolButton;
    ViewSumBtn: TToolButton;
    ViewPosBtn: TToolButton;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure JahrCBChange(Sender: TObject);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JourGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure PrintJournalBtnClick(Sender: TObject);
    procedure RePrintBtnClick(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure StornoBtnClick(Sender: TObject);
    procedure SortCBChange(Sender: TObject);
    procedure Summen1Click(Sender: TObject);
    procedure SumQueryAfterOpen(DataSet: TDataSet);
    procedure TagBelegeAfterOpen(DataSet: TDataSet);
    procedure Tagesabschlu1Click(Sender: TObject);
    procedure Tagesjournal1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    SortField       : String;
    SortName        : String;
    First           : Boolean;
    QueryTime       : DWord;
    LastRange       : Integer;
    LastSDate       : Integer;

    procedure UpdateStatus;

  public
    { Public-Deklarationen }
    vonDatum,
    bisDatum  : tDateTime;
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure UpdateQuery;
  end;

var
  JournalVKKasseForm: TJournalVKKasseForm;

implementation

{$R *.frm}

uses CAO_Tool1, CAO_MAIN, CAO_DM,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     cao_dbgrid_layout;

{ TJournalVKKasseForm }

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.FormCreate(Sender: TObject);
var ja,mo,ta:word;
begin
     Scaled            :=TRUE;
     //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
     OnUpdateStatusBar :=nil;
     First             :=True;
     QueryTime         :=0;
     decodedate (now,ja,mo,ta);


     DatumAW.KindRange :=ksMonth;
     DatumAW.StartDate :=now;
     LastRange         :=ord(ksMonth);


     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;

     JahrCBChange(Sender);



     sortname :='Belegnr.';sortfield :='VRENUM, RDATUM';

     PC1.ActivePage :=TabSheet1;
     PC1Change(Sender);

     StornoBtn.Visible  :=False;
     Storno1.Enabled    :=False;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.FormDeactivate(Sender: TObject);
begin
     //
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JahrCBChange(Sender: TObject);
begin
     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;

     if First then Exit;

     UpdateQuery;
     PC1Change(Sender);

     if ord(DatumAW.KindRange)<>LastRange then
     begin
          DM1.WriteStringU ('Journale','Default','Benutzer-Journaleinstellungen');
          DM1.WriteIntegerU ('Journale\VK-KAS','RANGE',Ord(DatumAW.KindRange));
     end;
     DM1.WriteIntegerU ('Journale\VK-KAS','START-DATE',Trunc(DatumAW.StartDate));
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JoArtTabCalcFields(DataSet: TDataSet);
begin
     Case JoArtTabSteuer_Code.Value of
          0: JoArtTabSteuer.Value :='-';
          1: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',TagBelegeMWST_1.Value);
          2: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',TagBelegeMWST_2.Value);
          3: JoArtTabSteuer.Value :=FormatFloat ('0.0"%"',TagBelegeMWST_3.Value);
          else JoArtTabSteuer.Value :='???';
     end;

     if JoArtTabArtikelTyp.Value='T' then
     begin
        JoArtTabSteuer.Value :='';
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JourGridDrawColumnCell(Sender: TObject;
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
procedure TJournalVKKasseForm.SortCBChange(Sender: TObject);
begin
     UpdateStatus;
     if not First then UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JourGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var fn : string;
begin
     fn :=uppercase (Field.FieldName);
     SortCBChange (Sender);
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JourGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=vk_f5 then begin key :=0; JQuery.Refresh; end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;

  Tagesabschlu1.Enabled :=(JQuery.Active)and
                          (JQuery.RecordCount>0)and
                          (JQueryGEBUCHT.Value<>1);
  TabAbschlussBtn.Enabled :=Tagesabschlu1.Enabled;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_VKKASSE',100);
     dm1.GridSaveLayout (tDBGrid(TagSumDetailGrid),'JOURNAL_TAGSUMDETAIL_VKKASSE');
     dm1.GridSaveLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_VKKASSE',101);
     dm1.GridSaveLayout (tDBGrid(TagBelegeGrid),'JOURNAL_TAGBELEGE_VKKASSE');
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.PC1Change(Sender: TObject);
begin
     if first then exit;

     SuchenBtn.Visible        :=PC1.ActivePage=TabSheet2;
     Suchen1.Enabled          :=PC1.ActivePage=TabSheet2;
     TagBelege.Active         :=PC1.ActivePage=TabSheet2;
     ViewSumBtn.Visible       :=PC1.ActivePage=TabSheet1;
     TabAbschlussBtn.Visible  :=PC1.ActivePage=TabSheet1;
     PrintJournalBtn.Visible  :=PC1.ActivePage=TabSheet1;

     try TagSumDetail.Active  :=PC1.ActivePage=TabSheet1; except end;


     if PC1.ActivePage=TabSheet1 then
     begin
          DBNavigator1.DataSource  :=JourDS;
          JoArtTab.Active          :=False;
          Storno1.Enabled          :=False;
          StornoBtn.Enabled        :=False;
          Rechnungdrucken1.Enabled :=False;
          ViewPosBtn.Visible       :=False;
          Tagesjournal1.Enabled    :=JQuery.RecordCount>0;
          PrintJournalBtn.Enabled  :=JQuery.RecordCount>0;
          TagesJournalBtn.Enabled  :=JQuery.RecordCount>0;
     end
        else
     begin
          DBNavigator1.DataSource  :=TagBelegeDS;
          JoArtTab.Active          :=Positionen1.Checked;
          Tagesabschlu1.Enabled    :=False;
          Storno1.Enabled          :=(TagBelege.Active)and(TagBelege.RecordCount>0);
          StornoBtn.Enabled        :=Storno1.Enabled;
          Rechnungdrucken1.Enabled :=(TagBelege.Active)and(TagBelege.RecordCount>0);
          ViewPosBtn.Visible       :=(TagBelege.Active)and(TagBelege.RecordCount>0);
          Tagesjournal1.Enabled    :=(TagBelege.Active)and(TagBelege.RecordCount>0);
          TagesJournalBtn.Enabled  :=(TagBelege.Active)and(TagBelege.RecordCount>0);
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Positionen1Click(Sender: TObject);
begin
     Positionen1.Checked  :=not Positionen1.Checked;
     ViewPosBtn.Down      :=Positionen1.Checked;
     Splitter1.Visible    :=Positionen1.Checked;
     JourPosGrid.Visible    :=Positionen1.Checked;
     Splitter1.Top        :=JourPosGrid.Top;
     if Positionen1.Checked then JoArtTab.Open;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.PrintJournalBtnClick(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowJournalDlg (VK_KASSE, trunc(vonDatum), trunc(bisDatum), DatumAW.Text);
     MainForm.FormActivate (Self);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.RePrintBtnClick(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     // Bon drucken
     PrintRechForm.ShowBelegDlg (VK_KASSE,TagBelegeRec_ID.AsInteger,False);
     MainForm.FormActivate (Self);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.SichtbareSpalten1Click(Sender: TObject);
var I,J : Integer; FN : String;
begin
     if PC1.ActivePage=TabSheet2
      then VisibleSpaltenForm.UpdateTable (tDBGrid(TagBelegeGrid))
      else VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));

     for i:=0 to JourGrid.Columns.Count-1 do
     begin
        FN :=uppercase (JourGrid.Columns[i].FieldName);
        for j:=0 to TagSumDetailGrid.Columns.Count-1 do
        begin
           if Uppercase (TagSumDetailGrid.Columns[j].FieldName)=FN then
           begin
              TagSumDetailGrid.Columns[j].Title.Caption :=
                JourGrid.Columns[i].Title.Caption;
           end;
        end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.StornoBtnClick(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie den Kassenbelg Nr.:'+
                    Inttostr(TagBelegeVRenum.Value)+
                    ' wirklich stornieren ?',
                    mtconfirmation,[mbyes,mbno],0)=mryes then
     begin
       if DM1.Storno_Verkauf (TagBelegeREC_ID.Value) then
       begin
          TagBelege.Refresh;
          TagBelegeAfterOpen(nil);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Summen1Click(Sender: TObject);
begin
     Summen1.Checked :=not Summen1.Checked;
     ViewSumBtn.Down :=Summen1.Checked;
     SumPanel.Visible :=Summen1.Checked;
     if SumPanel.Visible then
     begin
          SumQuery.ParamByName ('VDAT').AsDateTime  :=VonDatum;
          SumQuery.ParamByName ('BDAT').AsDateTime  :=BisDatum+0.99999;
          SumQuery.ParamByName ('QUELLE').AsInteger :=VK_RECH;
          SumQuery.Open;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.SumQueryAfterOpen(DataSet: TDataSet);
var N, M, B : Double;

begin
     SumQuery.First;
     N :=0;
     M :=0;
     B :=0;

     while not SumQuery.Eof do
     begin
        N :=N + DM1.CalcLeitWaehrung(SumQueryNetto.Value,SumQueryWAEHRUNG.Value);
        M :=M + DM1.CalcLeitWaehrung(SumQueryMwSt.Value,SumQueryWAEHRUNG.Value);
        B :=B + DM1.CalcLeitWaehrung(SumQueryBrutto.Value,SumQueryWAEHRUNG.Value);
        SumQuery.Next;
     end;
     SumQuery.Close;

     N_SUM_PAN.Caption :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',n);
     M_SUM_PAN.Caption :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',m);
     B_SUM_PAN.Caption :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',b);
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.TagBelegeAfterOpen(DataSet: TDataSet);
begin
     UpdateStatus;
     StornoBtn.Enabled :=(TagBelege.Active)and(TagBelege.RecordCount>0);
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Tagesabschlu1Click(Sender: TObject);
var BarSum : Double;
    Error  : Integer;
    BelVon,
    BelBis,
    Anz    : Integer;

begin
     if messageDlg ('Wollen Sie den aktuellen Tag ('+
                    FormatDateTime('dd.mm.yyyy',JQueryRDATUM.AsDateTime)+
                    ') abschließen ?',mtconfirmation,mbyesnocancel,0)=mryes then
     begin
          BarSum :=0;
          Anz    :=0;
          Error  :=0;
          BelBis :=-1;

          TagAbschlussQuery.Open;

          while not TagAbschlussQuery.eof do
          begin
             if TagAbschlussQueryzahlart.Value=1 then
             begin
               BarSum :=BarSum +
                        DM1.CalcLeitWaehrung (TabAbschlussQueryBSumme.AsFloat,
                                              TagAbschlussQueryWaehrung.Value);
               if Anz=0 then BelVon :=TagAbschlussQueryVRENUM.Value;
               inc (Anz);
               if BelBis < TagAbschlussQueryVRENUM.Value
                then BelBis :=TagAbschlussQueryVRENUM.Value;

             end;
             TagAbschlussQuery.Edit;
             try
               TagAbschlussQueryuw_num.Value :=0;
               TagAbschlussQuery.Post;
             except
               inc(Error);
               TagAbschlussQuery.Cancel;
             end;

             TagAbschlussQuery.Next;
          end;

          // Kassenbuch aktualisieren
          DM1.BucheKasse (JQueryRDATUM.AsDateTime, 13, -1, 'diverse', -1, 0, BarSum,
                          'Tagesabschluß Kasse Bareinnahmen'+#13#10+
                          InttoStr(Anz)+
                          ' Belege : '+
                          Inttostr(BelVon)+
                          ' bis '+
                          Inttostr(BelBis));

          JQuery.Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Tagesjournal1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowJournalDlg (VK_KASSE,
                                   JQueryRDATUM.AsDateTime,
                                   JQueryRDATUM.AsDateTime,
                                   'Tagesjournal '+
                                   FormatDateTime ('dd.mm.yyyy',
                                                   JQueryRDATUM.AsDateTime)
                                  );
     MainForm.FormActivate (Self);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.FormActivate(Sender: TObject);
var id,I,J : Integer; FN : String;
begin
     if First then
     begin
        First :=False;

//        JourGrid.RowColor1         :=DM1.C2Color;
//        JourPosGrid.RowColor1      :=DM1.C2Color;
//        TagSumDetailGrid.RowColor1 :=DM1.C2Color;
//        TagBelegeGrid.RowColor1    :=DM1.C2Color;

//        JourGrid.EditColor         :=DM1.EditColor;
//        JourPosGrid.EditColor      :=DM1.EditColor;
//        TagSumDetailGrid.EditColor :=DM1.EditColor;
//        TagBelegeGrid.EditColor    :=DM1.EditColor;

        UpdateQuery;
        dm1.GridLoadLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_VKKASSE',100);
        dm1.GridLoadLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_VKKASSE',101);
        dm1.GridLoadLayout (tDBGrid(TagSumDetailGrid),'JOURNAL_TAGSUMDETAIL_VKKASSE');
        dm1.GridLoadLayout (tDBGrid(TagBelegeGrid),'JOURNAL_TAGBELEGE_VKKASSE');

        ID :=DM1.ReadIntegerU ('Journale\VK-KAS','RANGE',-1);
        if (ID>-1) and (LastRange<>ID) then
        begin
             LastRange :=ID;
             DatumAW.KindRange :=tKindRange(LastRange);
        end;

        for i:=0 to JourGrid.Columns.Count-1 do
        begin
          FN :=uppercase (JourGrid.Columns[i].FieldName);
          for j:=0 to TagSumDetailGrid.Columns.Count-1 do
          begin
             if Uppercase (TagSumDetailGrid.Columns[j].FieldName)=FN then
             begin
                TagSumDetailGrid.Columns[j].Title.Caption :=
                  JourGrid.Columns[i].Title.Caption;
             end;
          end;
        end;

        LastSDate :=DM1.ReadIntegerU ('Journale\VK-KAS','START-DATE',-1);
        if (LastSDate<>-1)and
           (LastSDate<>DatumAW.StartDate)
         then DatumAW.StartDate :=LastSDate;
     end;
     PC1Change(Sender);
     try
       if PC1.ActivePage=TabSheet1
        then JourGrid.SetFocus
        else TagBelegeGrid.SetFocus;
     except end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Aktualisieren1Click(Sender: TObject);
begin
     JQuery.Refresh;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.ArtPanResize(Sender: TObject);
begin
     DatumAW.Left :=ArtPan.Width - DatumAW.Width-4;
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung : String;
begin
     SuchZeit   :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';

     if PC1.ActivePage=TabSheet1 then
     begin
       Datensatz  :=Inttostr(JQuery.RecNo)+' von '+
                    Inttostr (JQuery.RecordCount);
     end else
     if PC1.ActivePage=TabSheet2 then
     begin
       Datensatz  :=Inttostr(TagBelege.RecNo)+' von '+
                    Inttostr (TagBelege.RecordCount);
     end else Datensatz :='';
     Sortierung :='Sortierung : '+SortName;

     if assigned (OnUpdateStatusBar)
      then OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;
//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.UpdateQuery;
begin
     Application.ProcessMessages;
     try
        Screen.Cursor :=crSQLWait;
        JQuery.Close;

        JQuery.ParamByName ('VON').AsDate :=VonDatum;
        JQuery.ParamByName ('BIS').AsDate :=BisDatum+0.99999;
        try JQuery.Open; except end;
     finally
       Screen.Cursor :=crDefault;
       UpdateStatus;
       if SumPanel.Visible then
       begin
          SumQuery.ParamByName ('VDAT').AsDateTime  :=VonDatum;
          SumQuery.ParamByName ('BDAT').AsDateTime  :=BisDatum+0.99999;
          SumQuery.ParamByName ('QUELLE').AsInteger :=VK_RECH;
          SumQuery.Open;
       end;
     end;
end;
//------------------------------------------------------------------------------

end.

