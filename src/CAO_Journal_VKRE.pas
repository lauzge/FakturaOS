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
Modul        : CAO_JOURNAL_VKRECH
Stand        : 16.05.2004
Version      : 1.2.5.4
Beschreibung : Rechnungsjournal

History :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
05.07.2003 - Filter eingebaut
27.10.2003 - Infofeld kann jetzt unter Details (neues Tabsheet) angezeigt und
             bearbeitet werden
09.11.2003 - Positionsdetails wurden nach erneutem Öffnen nicht aktualisiert
07.12.2003 - der Shop-Orderstatus kann jetzt geändert werrden
22.12.2003 - der Shop-Status wird jetzt in der Liste mit angezeigt
13.03.2004 - Dateilinks implementiert

17.02.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Journal_VKRE;

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, DBGrids, Menus, Buttons, DBCtrls, ZDataset, ZAbstractRODataset,
  VolPeriod, Grids, cao_var_const;

type

  { TJournalVKREForm }

  TJournalVKREForm = class(TForm)
    B_BEZSKONTO_PAN: TPanel;
    B_BEZ_PAN: TPanel;
    B_SUM_PAN: TPanel;
    DBNavigator1: TDBNavigator;
    Bearbeiten1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    inEKBestellungumwandeln1: TMenuItem;
    Kopieren1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Journaldrucken1: TMenuItem;
    Mahnung1: TMenuItem;
    Filter1: TMenuItem;
    Aktualisieren1: TMenuItem;
    alleRechnungen1: TMenuItem;
    nurunbezahlteRechnungen1: TMenuItem;
    nurbezahlteRechnungen1: TMenuItem;
    N4: TMenuItem;
    Summen1: TMenuItem;
    Positionen1: TMenuItem;
    N1: TMenuItem;
    Rechnungdrucken1: TMenuItem;
    Preis1: TMenuItem;
    Stadium1: TMenuItem;
    Name1: TMenuItem;
    Summennachberechnen1: TMenuItem;
    N6: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N5: TMenuItem;
    Zahlungseingang1: TMenuItem;
    N2: TMenuItem;
    Storno1: TMenuItem;
    N3: TMenuItem;
    Suchen1: TMenuItem;
    Sortierung1: TMenuItem;
    N_SUM_PAN: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    JourInfoMemo: TDBMemo;
    JourPosGrid: TDBGrid;
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
    JQueryADATUM: TZDateField;
    JQueryADDR_ID: TZIntegerField;
    JQueryATRNUM: TZIntegerField;
    JQueryBSUMME: TFloatField;
    JQueryCalcStad: TStringField;
    JQueryCALC_NAME: TStringField;
    JQueryCALC_SHOPSTATUS: TStringField;
    JQueryERST_NAME: TZRawStringField;
    JQueryGEGENKONTO: TZIntegerField;
    JQueryINFO: TMemoField;
    JQueryIST_BETRAG: TFloatField;
    JQueryIST_SKONTO: TFloatField;
    JQueryIST_ZAHLDAT: TDateField;
    JQueryIST_ZAHLDAT_ORG: TZDateField;
    JQueryKM_STAND: TZIntegerField;
    JQueryKondit: TStringField;
    JQueryKUN_ANREDE: TZRawStringField;
    JQueryKUN_NAME1: TZRawStringField;
    JQueryKUN_NAME2: TZRawStringField;
    JQueryKUN_NAME3: TZRawStringField;
    JQueryKUN_NUM: TZRawStringField;
    JQueryLDATUM: TDateField;
    JQueryLDATUM_ORG: TZDateField;
    JQueryMAHNKOSTEN: TFloatField;
    JQueryMAHNSTUFE: TZSmallIntField;
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
    JQueryPRINT_FLAG: TBooleanField;
    JQueryPROJEKT: TZRawStringField;
    JQueryRDATUM: TZDateField;
    JQueryREC_ID: TZIntegerField;
    JQuerySHOP_CHANGE_FLAG: TBooleanField;
    JQuerySHOP_ID: TZShortIntField;
    JQuerySHOP_ORDERID: TZIntegerField;
    JQuerySHOP_STATUS: TZWordField;
    JQuerySOLL_NTAGE: TZSmallIntField;
    JQuerySOLL_SKONTO: TFloatField;
    JQuerySOLL_STAGE: TZSmallIntField;
    JQuerySTADIUM: TZSmallIntField;
    JQueryVLSNUM: TZIntegerField;
    JQueryVRENUM: TZIntegerField;
    JQueryWAEHRUNG: TZRawStringField;
    Label1: TLabel;
    FilterLab: TLabel;
    DatumAW: TVolgaPeriod;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    M_BEZSKONTO_PAN: TPanel;
    M_BEZ_PAN: TPanel;
    B_OFF_PAN: TPanel;
    N_BEZSKONTO_PAN: TPanel;
    N_BEZ_PAN: TPanel;
    M_OFF_PAN: TPanel;
    M_SUM_PAN: TPanel;
    Panel2: TPanel;
    InfoSaveBtn: TSpeedButton;
    InfoCancelBtn: TSpeedButton;
    DateiPan: TPanel;
    OrderStatusSaveBtn: TSpeedButton;
    OrderStatusCancelBtn: TSpeedButton;
    N_OFF_PAN: TPanel;
    SpeedButton3: TSpeedButton;
    SumPan: TPanel;
    ReInfoPC: TPageControl;
    Panel1: TPanel;
    DetailPan: TPanel;
    Splitter1: TSplitter;
    Allgemein: TTabSheet;
    SumQueryBrutto: TFloatField;
    SumQueryMwSt: TFloatField;
    SumQueryNetto: TFloatField;
    SumQuerySTADIUM: TZShortIntField;
    SumQueryWAEHRUNG: TZRawStringField;
    TabSheet1: TTabSheet;
    ReInfoTS: TTabSheet;
    DateiTS: TTabSheet;
    ShopStatusTS: TTabSheet;
    ToolBar2: TToolBar;
    JQuery: TZQuery;
    SumQuery: TZQuery;
    JoArtTab: TZQuery;
    StornoBtn: TToolButton;
    PrintJournalBtn: TToolButton;
    RePrintBtn: TToolButton;
    MahnungBtn: TToolButton;
    ZEBtn: TToolButton;
    ToolButton2: TToolButton;
    ViewSumBtn: TToolButton;
    ViewPosBtn: TToolButton;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure inEKBestellungumwandeln1Click(Sender: TObject);
    procedure InfoCancelBtnClick(Sender: TObject);
    procedure InfoSaveBtnClick(Sender: TObject);
    procedure JahrCBChange(Sender: TObject);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure JQueryBeforeEdit(DataSet: TDataSet);
    procedure JQueryBeforePost(DataSet: TDataSet);
    procedure JQueryCalcFields(DataSet: TDataSet);
    procedure Kopieren1Click(Sender: TObject);
    procedure MahnungBtnClick(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure PrintJournalBtn1Click(Sender: TObject);
    procedure ReInfoPCChange(Sender: TObject);
    procedure RePrintBtn1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure StornoBtn1Click(Sender: TObject);
    procedure SuchenBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ViewSumBtn1Click(Sender: TObject);
    procedure Summennachberechnen1Click(Sender: TObject);
    procedure SumQueryAfterOpen(DataSet: TDataSet);
    procedure Zahlungseingang1Click(Sender: TObject);
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
    Filter          : Integer;
    OldShopStatus   : Integer;

    procedure UpdateReView;
    procedure SetSort (Index : Integer);
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure UpdateQuery;
  end;

var
  JournalVKREForm: TJournalVKREForm;

implementation

{$R *.frm}

uses CAO_Tool1, CAO_MAIN, CAO_DM,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     CAO_Link,
     {$IFDEF ALPHA}cao_recalc_summen_dlg,{$ENDIF}
     CAO_ZahlungseingangDlg, cao_dbgrid_layout;

{ TJournalVKREForm }

//------------------------------------------------------------------------------
procedure TJournalVKREForm.FormCreate(Sender: TObject);
//var ja,mo,ta:word;
begin
     Scaled:=TRUE;
     //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
     OnUpdateStatusBar :=nil;
     First     :=True;
     LastID    :=-1;
     Filter    :=3;
     alleRechnungen1.Checked :=True;

     //decodedate (now,ja,mo,ta);

     DatumAW.KindRange :=ksMonth;
     DatumAW.StartDate :=now;
     LastRange         :=ord(ksMonth);

     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;

     SortName  :='Belegnummer';
     SortField :='VRENUM, RDATUM';
     JahrCBChange(Sender);


     Allgemein.Tabvisible :=False;

     {$IFNDEF ALPHA}
     Summennachberechnen1.Visible :=False;
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.FormDeactivate(Sender: TObject);
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
procedure TJournalVKREForm.inEKBestellungumwandeln1Click(Sender: TObject);
var ID : Integer;
begin
     ID :=DM1.CopyRechnung (JQueryRec_ID.Value,EK_BEST_EDI);
     if MessageDlg('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?',
                   mtconfirmation,[mbyes, mbno],0)=mryes
      then MainForm.JumpTo (EK_BEST_EDI, ID, 0, False);
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.InfoCancelBtnClick(Sender: TObject);
begin
     JQuery.Cancel;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.InfoSaveBtnClick(Sender: TObject);
begin
     JQuery.Post;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.JahrCBChange(Sender: TObject);
begin
     VonDatum :=DatumAW.StartDate;
     BisDatum :=DatumAW.EndDate;
     LastID   :=-1;

     if First then Exit;

     UpdateQuery;

     if ord(DatumAW.KindRange)<>LastRange then
     begin
          DM1.WriteStringU ('Journale','Default','Benutzer-Journaleinstellungen');
          DM1.WriteIntegerU ('Journale\VK-RE','RANGE',Ord(DatumAW.KindRange));
     end;
     DM1.WriteIntegerU ('Journale\VK-RE','START-DATE',Trunc(DatumAW.StartDate));
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.JoArtTabCalcFields(DataSet: TDataSet);
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
procedure TJournalVKREForm.JourDSDataChange(Sender: TObject;
  Field: TField);
begin
     if JQueryRec_ID.Value <> LastID then JQueryAfterScroll (nil);
     InfoSaveBtn.Enabled :=(JQuery.RecordCount>0)and
                           (JQuery.State in [dsEdit, dsInsert]);
     InfoCancelBtn.Enabled :=InfoSaveBtn.Enabled;

     OrderStatusSaveBtn.Enabled :=InfoSaveBtn.Enabled;
     OrderStatusCancelBtn.Enabled :=InfoSaveBtn.Enabled;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.JourGridDrawColumnCell(Sender: TObject;
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
procedure TJournalVKREForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then UpdateReView;

  Zahlungseingang1.Enabled         :=(JQuery.RecordCount>0)and(JQueryStadium.Value<80);
  ZEBtn.Enabled                    :=Zahlungseingang1.Enabled;
  Journaldrucken1.Enabled          :=JQuery.RecordCount>0;
  Rechnungdrucken1.Enabled         :=JQuery.RecordCount>0;
  Kopieren1.Enabled                :=JQuery.RecordCount>0;
  InEKBestellungUmwandeln1.Enabled :=JQuery.RecordCount>0;
  Storno1.Enabled                  :=JQuery.RecordCount>0;
  Suchen1.Enabled                  :=JQuery.RecordCount>0;

  LastID :=JQueryRec_ID.Value;

  UpdateStatus;


  Mahnung1.Enabled :=(JQuery.RecordCount>0)and
                     (JQueryRDatum.AsDateTime>=EncodeDate(2001,1,1))and
                     (JQueryMahnStufe.Value>0)and
                     (JQueryStadium.AsInteger<80);
  MahnungBtn.Enabled :=Mahnung1.Enabled;

  ShopStatusTS.Enabled :=(JQuery.RecordCount>0)and
                         (JQueryShop_ID.AsInteger>0);

  try
     if (not ShopStatusTS.Enabled)and
        (ReInfoPC.ActivePage=ShopStatusTS)
      then ReInfoPC.ActivePage :=TabSheet1;
     ShopStatusTS.TabVisible :=ShopStatusTS.Enabled;
  except end;


end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.JQueryBeforeEdit(DataSet: TDataSet);
begin
     OldShopStatus :=JQuerySHOP_STATUS.AsInteger;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.JQueryBeforePost(DataSet: TDataSet);
begin
     if OldShopStatus<>JQuerySHOP_STATUS.Value
      then JQuerySHOP_CHANGE_FLAG.AsBoolean :=True;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.JQueryCalcFields(DataSet: TDataSet);
var S : STring;
begin
     if (JQuerySOLL_SKONTO.Value>0)and(JQuerySOLL_STAGE.Value>0)
      then JQueryKondit.Value :=JQuerySOLL_STAGE.AsString+' T. '+
                                formatfloat ('0.0"%"',JQuerySOLL_SKONTO.Value)+' '+
                                JQuerySOLL_NTAGE.AsString+' T.Netto'
      else if JQuerySOLL_NTAGE.Value < 2
            then JQueryKondit.Value :='sofort'
            else JQueryKondit.Value :=JQuerySOLL_NTAGE.AsString+' Tage Netto';


     JQueryCalcStad.Value :=GetRechStatus(JQueryStadium.Value,VK_RECH);

     if JQueryVLSNUm.Value>0
      then JQueryLDatum.Value   :=JQueryLDATUM_ORG.AsDateTime;

     if JQueryStadium.Value >=80
      then JQueryIST_ZAHLDAT.Value :=JQueryIST_Zahldat_Org.AsDateTime
      else JQueryIST_ZAHLDAT.AsString :='';


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

     if (JQueryShop_ID.AsInteger>0) then
     begin
       if DM1.ShopOrderStatusTab.Locate ('ORDERSTATUS_ID',
                                         JQueryShop_Status.AsInteger,[])
        then JQueryCalc_Shopstatus.AsString :=DM1.ShopOrderStatusTabLANGBEZ.AsString;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.Kopieren1Click(Sender: TObject);
var ID : Integer;
begin
     ID :=DM1.CopyRechnung (JQueryRec_ID.Value,VK_RECH_EDI);
     if MessageDlg('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?',
                   mtconfirmation,[mbyes, mbno],0)=mryes
      then MainForm.JumpTo (VK_RECH_EDI, ID, 0, False);
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.MahnungBtnClick(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowMahnungDlg (JQueryAddr_ID.Value);
     MainForm.FormActivate (Self);
     {$ELSE}
     MessageDlg ('Der Code zum drucken der Mahnung'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.Positionen1Click(Sender: TObject);
begin
     Positionen1.Checked :=not Positionen1.Checked;
     ReInfoPC.Visible    :=Positionen1.Checked;
     Splitter1.Visible   :=Positionen1.Checked;
     Splitter1.Top       :=ReInfoPC.Top;

     if Positionen1.Checked then UpdateReView;
     ViewPosBtn.Down :=Positionen1.Checked;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.Preis1Click(Sender: TObject);
begin
     SetSort(tMenuItem(Sender).Tag);
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.PrintJournalBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowJournalDlg (VK_RECH, trunc(vonDatum), trunc(bisDatum), DatumAW.Text);
     MainForm.FormActivate (Self);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Rechnungsjournales'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.ReInfoPCChange(Sender: TObject);
begin
     if (ReInfoPC.Visible) and
        (ReInfoPC.ActivePage=DateiTS) then
     begin
        if LinkForm.MainPanel.Parent <> DateiPan
          then LinkForm.MainPanel.Parent :=DateiPan;

        LinkForm.SetModul (VK_RECH,JQueryRec_ID.AsInteger, DateiPan);
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.RePrintBtn1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowBelegDlg (VK_RECH,JQueryRec_ID.AsInteger,False);
     MainForm.FormActivate (Self);
     {$ELSE}
     MessageDlg ('Der Code zum drucken der Rechnung'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.SichtbareSpalten1Click(Sender: TObject);
begin
     VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.StornoBtn1Click(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie die Rechnung Nr.:'+
                    Inttostr(JQueryVRenum.Value)+
                    ' wirklich stornieren ?',
                    mtconfirmation,[mbyes,mbno],0)=mryes then
     begin
       if DM1.Storno_Verkauf (JQueryRec_ID.Value) then
       begin
          JQuery.Refresh;
          JQueryAfterScroll(nil);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.SuchenBtn1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.ViewSumBtn1Click(Sender: TObject);
begin
     Summen1.Checked :=not Summen1.Checked;
     SumPan.Visible  :=Summen1.Checked;
     ViewSumBtn.Down :=Summen1.Checked;

     if SumPan.Visible then
     begin
       SumQuery.Close;
       SumQuery.ParamByName ('VDAT').AsDateTime  :=VonDatum;
       SumQuery.ParamByName ('BDAT').AsDateTime  :=BisDatum+0.99999;
       SumQuery.ParamByName ('QUELLE').AsInteger :=VK_RECH;
       SumQuery.Open;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.Summennachberechnen1Click(Sender: TObject);
{$IFDEF ALPHA}
var SumRecalcForm: TSumRecalcForm;
{$ENDIF}
begin
     {$IFDEF ALPHA}
     SumRecalcForm:=TSumRecalcForm.Create (Self);
     try
        SumRecalcForm.ShowModal;
     finally
        SumRecalcForm.Free;
     end;
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.SumQueryAfterOpen(DataSet: TDataSet);
var N_Offen,
    M_Offen,
    B_Offen,
    N_Bez,
    M_Bez,
    B_Bez,
    N_BezSkonto,
    M_BezSkonto,
    B_BezSkonto : Double;

begin
     SumQuery.First;
     N_Offen     :=0;
     M_Offen     :=0;
     B_Offen     :=0;
     N_Bez       :=0;
     M_Bez       :=0;
     B_Bez       :=0;
     N_BezSkonto :=0;
     M_BezSkonto :=0;
     B_BezSkonto :=0;

     while not SumQuery.Eof do
     begin
          case SumQueryStadium.Value of
               20..79 : begin
                          N_Offen :=N_Offen + DM1.CalcLeitWaehrung(SumQueryNetto.Value,SumQueryWAEHRUNG.Value);
                          M_Offen :=M_Offen + DM1.CalcLeitWaehrung(SumQueryMwSt.Value,SumQueryWAEHRUNG.Value);
                          B_Offen :=B_Offen + DM1.CalcLeitWaehrung(SumQueryBrutto.Value,SumQueryWAEHRUNG.Value);
                        end;
               80..89 : begin
                          N_BezSkonto :=N_BezSkonto + DM1.CalcLeitWaehrung(SumQueryNetto.Value,SumQueryWAEHRUNG.Value);
                          M_BezSkonto :=M_BezSkonto + DM1.CalcLeitWaehrung(SumQueryMwSt.Value,SumQueryWAEHRUNG.Value);
                          B_BezSkonto :=B_BezSkonto + DM1.CalcLeitWaehrung(SumQueryBrutto.Value,SumQueryWAEHRUNG.Value);
                        end;
               90..99 : begin
                          N_Bez :=N_Bez + DM1.CalcLeitWaehrung(SumQueryNetto.Value,SumQueryWAEHRUNG.Value);
                          M_Bez :=M_Bez + DM1.CalcLeitWaehrung(SumQueryMwSt.Value,SumQueryWAEHRUNG.Value);
                          B_Bez :=B_Bez + DM1.CalcLeitWaehrung(SumQueryBrutto.Value,SumQueryWAEHRUNG.Value);
                        end;
          end;
          SumQuery.Next;
     end;

     sumquery.close;

     N_OFF_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',n_offen);
     M_OFF_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',m_offen);
     B_OFF_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',b_offen);

     N_BEZSKONTO_PAN.Caption :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',n_BezSkonto);
     M_BEZSKONTO_PAN.Caption :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',m_BezSkonto);
     B_BEZSKONTO_PAN.Caption :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',b_BezSkonto);

     N_BEZ_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',n_bez);
     M_BEZ_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',m_bez);
     B_BEZ_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',b_bez);

     N_SUM_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',n_offen + n_bez + n_bezskonto);
     M_SUM_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',m_offen + m_bez + m_bezskonto);
     B_SUM_PAN.Caption       :=FormatFloat (',###,##0.00" '+DM1.LeitWaehrung+'  "',b_offen + b_bez + b_bezskonto);
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.Zahlungseingang1Click(Sender: TObject);
var ID : Integer;
begin
     ID :=JQueryRec_ID.Value;
     ZEForm.Run (VK_RECH,ID);
     JQuery.Refresh;
     JQuery.Locate ('REC_ID',Variant(ID),[]);
     Zahlungseingang1.Enabled         :=(JQuery.RecordCount>0)and
                                        (JQueryStadium.Value<80);
     ZEBtn.Enabled                    :=Zahlungseingang1.Enabled;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.FormActivate(Sender: TObject);
var ID : Integer; LastSDate : Integer;
begin
     if First then
     begin
          LastID :=-1;

//          JourGrid.RowColor1    :=DM1.C2Color;
//          JourPosGrid.RowColor1 :=DM1.C2Color;
//          JourGrid.EditColor    :=DM1.EditColor;
//          JourPosGrid.EditColor :=DM1.EditColor;

          dm1.GridLoadLayout (tDBGrid(JourGrid),'JOURNAL_KOPF_VKRE',102);
          dm1.GridLoadLayout (tDBGrid(JourPosGrid),'JOURNAL_POS_VKRE',101);

          ID :=DM1.ReadIntegerU ('Journale\VK-RE','RANGE',-1);
          if (ID>-1) and (LastRange<>ID) then
          begin
               LastRange :=ID;
               DatumAW.KindRange :=tKindRange(LastRange);
          end;

          LastSDate :=DM1.ReadIntegerU ('Journale\VK-RE','START-DATE',-1);
          if (LastSDate<>-1)and(LastSDate<>DatumAW.StartDate) then DatumAW.StartDate :=LastSDate;

          Filter :=DM1.ReadIntegerU ('Journale\VK-RE','FILTER',3);

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
procedure TJournalVKREForm.ArtPanResize(Sender: TObject);
begin
     DatumAW.Left :=ArtPan.Width - DatumAW.Width-4;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.Aktualisieren1Click(Sender: TObject);
begin
     JQuery.Refresh;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.UpdateReView;
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
procedure TJournalVKREForm.SetSort (Index : Integer);
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
procedure TJournalVKREForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung : String;
begin
     SuchZeit   :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
     Datensatz  :=Inttostr(JQuery.RecNo)+' von '+inttostr (JQuery.RecordCount);
     Sortierung :='Sortierung : '+SortName;

     if assigned (OnUpdateStatusBar)
      then OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.UpdateQuery;
var OldTime : DWord;
begin
     Application.ProcessMessages;
     try
        OldTime :=GetTickCount;
        Screen.Cursor :=crSQLWait;
        JQuery.Close;
        JQuery.SQL.Text :=
          'SELECT '+
          'REC_ID,ADDR_ID,VRENUM,RDATUM,LDATUM,ADATUM,ATRNUM,VLSNUM,'+
          'NSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,MSUMME,BSUMME,STADIUM,'+
          'KUN_NUM,SOLL_STAGE,SOLL_NTAGE,KUN_ANREDE,KUN_NAME1,KUN_NAME2,'+
          'KUN_NAME3,PROJEKT,ORGNUM,GEGENKONTO,'+
          'WAEHRUNG,MWST_1,MWST_2,MWST_3,LDATUM AS LDATUM_ORG,ADATUM,ATRNUM,'+
          'VLSNUM,KM_STAND,IST_SKONTO,IST_BETRAG,IST_ZAHLDAT AS '+
          'IST_ZAHLDAT_ORG,MAHNKOSTEN,SOLL_SKONTO,MAHNSTUFE,ERST_NAME,INFO,'+
          'SHOP_ORDERID, SHOP_STATUS, SHOP_ID, SHOP_CHANGE_FLAG, PRINT_FLAG '+
          'FROM JOURNAL '+
          'WHERE RDATUM >=:VON AND RDATUM<=:BIS '+
          'AND QUELLE_SUB <> 2 AND QUELLE='+inttostr (VK_RECH);

        case Filter of
         1:   begin
                 JQuery.SQL.Add ('AND STADIUM>=80 and STADIUM<100');
                 FilterLab.Caption :=' gefiltert (nur bezahlte Rechnungen)';
                 nurbezahlteRechnungen1.checked :=True;
              end;
         2:   begin
                 JQuery.SQL.Add ('AND (STADIUM<80 OR STADIUM=110)');
                 FilterLab.Caption :=' gefiltert (nur offene Rechnungen)';
                 nurunbezahlteRechnungen1.checked :=True;
              end;
         else begin
                 FilterLab.Caption :='';
                 alleRechnungen1.checked :=True;
              end;
        end;

        JQuery.SQL.Add ('ORDER BY '+sortfield);
        JQuery.ParamByName ('VON').AsDate :=VonDatum;
        JQuery.ParamByName ('BIS').AsDate :=BisDatum;
        JQuery.Open;
     finally
       Screen.Cursor :=crDefault;
       QueryTime :=gettickcount-oldtime;
       if SumPan.Visible then
       begin
          SumQuery.ParamByName ('VDAT').AsDateTime  :=VonDatum;
          SumQuery.ParamByName ('BDAT').AsDateTime  :=BisDatum;
          SumQuery.ParamByName ('QUELLE').AsInteger :=VK_RECH;
          SumQuery.Open;
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TJournalVKREForm.JourGridTitleBtnClick(Sender: TObject;
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
procedure TJournalVKREForm.FindDialog1Find(Sender: TObject);
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

