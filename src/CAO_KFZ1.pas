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
Modul        : CAO_KFZ1
Stand        : 09.11.2003
Version      : 1.1.3.27
Beschreibung : Fahrzeugstamm

History :

06.05.2003 - zum GNU-Source hinzugefügt
15.09.2003 - 2 neue Felder (nä. Sicherheitsprüfung, nä. Tachoprüfung) hinzugef.
09.11.2003 - Bug bei Suche ohne Ergebnis mit anschließendem Enter gefixt
13.12.2003 - Umrechnung KW/PS eingebaut
26.02.2004 - Schl.-Nr. zu 2 und 3 in die Liste eingebaut

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_KFZ1;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, DBCtrls, Menus, Buttons, Messages, DBGrids, rxdbdateedit,
  ZDataset, ZAbstractRODataset, cao_var_const, VolDBEdit;

type

  { TKFZForm }

  TKFZForm = class(TForm)
    CaoGroupBox5: TGroupBox;
    AlgGB: TGroupBox;
    baujahr: TDBEdit;
    kmstand: TDBEdit;
    Label3: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    Label25: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label26: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bearbeiten1: TMenuItem;
    Ansicht1: TMenuItem;
    Lschen1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Match1: TMenuItem;
    Allgemein1: TMenuItem;
    Info1: TMenuItem;
    Historie1: TMenuItem;
    Liste1: TMenuItem;
    UebernahmeBtn: TToolButton;
    ToolButton6: TToolButton;
    Treffer1: TMenuItem;
    alle1: TMenuItem;
    N5001: TMenuItem;
    N2001: TMenuItem;
    N1001: TMenuItem;
    N501: TMenuItem;
    N101: TMenuItem;
    N4: TMenuItem;
    Aktualisieren1: TMenuItem;
    N3: TMenuItem;
    PLZOrt1: TMenuItem;
    Name11: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N2: TMenuItem;
    Suchen1: TMenuItem;
    N1: TMenuItem;
    Neu1: TMenuItem;
    Sortierung1: TMenuItem;
    Reifen: TDBEdit;
    ReifenGr: TDBEdit;
    Gruppe: TVolgaDBEdit;
    Zulassungsdatum: TRxDBDateEdit;
    NextTUVEdi: TRxDBDateEdit;
    NextAUEdi: TRxDBDateEdit;
    NextSP: TRxDBDateEdit;
    NextTP: TRxDBDateEdit;
    LeBesuchEdi: TRxDBDateEdit;
    scl_nr: TDBEdit;
    kfzbr_nr: TDBEdit;
    zschl_nr: TDBEdit;
    schl2Edi: TDBEdit;
    schl3Edi: TDBEdit;
    KundeEdit: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    polster: TDBEdit;
    farbe: TDBEdit;
    kw: TDBEdit;
    ps: TDBEdit;
    Hubraum: TDBEdit;
    DBEdit2: TDBEdit;
    AddrNotiz: TDBMemo;
    Typ: TDBEdit;
    ausfuehr: TDBEdit;
    motor: TDBEdit;
    MotorNr: TDBEdit;
    getriebe: TDBEdit;
    fgstnum: TDBEdit;
    kennz: TDBEdit;
    JournalGrid: TDBGrid;
    JourPosGrid: TDBGrid;
    JahrCB: TComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    JourTabADDR_ID: TZIntegerField;
    JourTabBSUMME: TZDoubleField;
    JourTabCalcEKVK: TStringField;
    JourTabCalcStadium: TStringField;
    JourTabIST_BETRAG: TZDoubleField;
    JourTabKFZ_ID: TZIntegerField;
    JourTabKM_STAND: TZIntegerField;
    JourTabKUN_NAME1: TZRawStringField;
    JourTabMSUMME: TZDoubleField;
    JourTabMWST_0: TZDoubleField;
    JourTabMWST_1: TZDoubleField;
    JourTabMWST_2: TZDoubleField;
    JourTabMWST_3: TZDoubleField;
    JourTabNSUMME: TZDoubleField;
    JourTabORGNUM: TZRawStringField;
    JourTabPROJEKT: TZRawStringField;
    JourTabQUELLE: TZShortIntField;
    JourTabRDATUM: TZDateField;
    JourTabREC_ID: TZIntegerField;
    JourTabSTADIUM: TZShortIntField;
    JourTabVRENUM: TZIntegerField;
    JourTabWAEHRUNG: TZRawStringField;
    JPosTabADDR_ID: TZIntegerField;
    JPosTabARTIKEL_ID: TZIntegerField;
    JPosTabARTNUM: TZRawStringField;
    JPosTabBARCODE: TZRawStringField;
    JPosTabBEZEICHNUNG: TZRawCLobField;
    JPosTabEPREIS: TZDoubleField;
    JPosTabJOURNAL_ID: TZIntegerField;
    JPosTabMATCHCODE: TZRawStringField;
    JPosTabMENGE: TZDoubleField;
    JPosTabQUELLE: TZShortIntField;
    JPosTabRABATT: TZDoubleField;
    JPosTabSTEUER_CODE: TZShortIntField;
    JPosTabSTEUER_PROZ: TFloatField;
    JPosTabVRENUM: TZIntegerField;
    KFZTabADDR_ID: TZIntegerField;
    KFZTabART_ID: TZIntegerField;
    KFZTabAUSFUER: TZRawStringField;
    KFZTabEK_PREIS: TZDoubleField;
    KFZTabFABRIKAT_ID: TZIntegerField;
    KFZTabFARBE: TZRawStringField;
    KFZTabFGST_NUM: TZRawStringField;
    KFZTabGETRIEBE: TZRawStringField;
    KFZTabGRUPPE: TZIntegerField;
    KFZTabHERSTELLUNG: TZDateField;
    KFZTabHUBRAUM: TZIntegerField;
    KFZTabINFO: TZRawCLobField;
    KFZTabKAUFDATUM: TZDateField;
    KFZTabKFZBRI_NR: TZRawStringField;
    KFZTabKFZ_GRUPPE: TZShortIntField;
    KFZTabKFZ_ID: TZIntegerField;
    KFZTabKM_STAND: TZIntegerField;
    KFZTabKRAFTSTOFF_ID: TZIntegerField;
    KFZTabKW: TZIntegerField;
    KFZTabLE_BESUCH: TZDateField;
    KFZTabMOTOR: TZRawStringField;
    KFZTabMOTOR_NR: TZRawStringField;
    KFZTabMWST_PROZ: TZDoubleField;
    KFZTabNAE_AU: TZDateField;
    KFZTabNAE_SP: TZDateField;
    KFZTabNAE_TP: TZDateField;
    KFZTabNAE_TUEV: TZDateField;
    KFZTabPOLSTER: TZRawStringField;
    KFZTabPOL_KENNZ: TZRawStringField;
    KFZTabPS: TZIntegerField;
    KFZTabREIFEN: TZRawStringField;
    KFZTabREIF_GR: TZRawStringField;
    KFZTabRUESTK: TZDoubleField;
    KFZTabSCHLUES_NR: TZRawStringField;
    KFZTabSCHL_ZU_2: TZRawStringField;
    KFZTabSCHL_ZU_3: TZRawStringField;
    KFZTabTYP: TZRawStringField;
    KFZTabTYP_ID: TZIntegerField;
    KFZTabUMSATZ_GAR: TZDoubleField;
    KFZTabUMSATZ_GES: TZDoubleField;
    KFZTabVK_NETTO: TZDoubleField;
    KFZTabWKST_INFO: TZRawCLobField;
    KFZTabZSCHL_NR: TZRawStringField;
    KFZTabZULASSUNG: TZDateField;
    KFZ_GRD: TDBGrid;
    GroupBox1: TGroupBox;
    BewDatGb: TGroupBox;
    CaoGroupBox1: TGroupBox;
    CaoGroupBox3: TGroupBox;
    CaoGroupBox2: TGroupBox;
    CaoGroupBox6: TGroupBox;
    Label18: TLabel;
    Label20: TLabel;
    Label60: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    Panel8: TPanel;
    ReifenGB: TGroupBox;
    SchluesselGB: TGroupBox;
    HistArtikelSB: TStatusBar;
    HistSumBar: TStatusBar;
    OPOSViewBtn: TSpeedButton;
    ArtikelViewBtn: TSpeedButton;
    RxSplitter1: TSplitter;
    SuchGB: TGroupBox;
    ListeTabBtn: TSpeedButton;
    HistTabBtn: TSpeedButton;
    InfoTabBtn: TSpeedButton;
    AlgTabBtn: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Suchbeg: TEdit;
    Label31: TLabel;
    SuchFeldCB: TComboBox;
    JPosTabDS: TDataSource;
    JourTabDS: TDataSource;
    KFZ_DS: TDataSource;
    KunDS: TDataSource;
    DBNavigator2: TDBNavigator;
    KFZPanel: TPanel;
    KFZPan: TPanel;
    Label52: TLabel;
    Label10: TLabel;
    KFZ_PC: TPageControl;
    MainMenu1: TMainMenu;
    SB1: TStatusBar;
    KFZToolBar: TToolBar;
    Allg_TS: TTabSheet;
    Notiz_TS: TTabSheet;
    Hist_TS: TTabSheet;
    List_TS: TTabSheet;
    KunTab: TZQuery;
    KFZTab: TZQuery;
    JourTab: TZQuery;
    JPosTab: TZQuery;
    SumQuery: TZQuery;
    SearchTimer: TTimer;
    ToolBar99: TToolBar;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure AlgTabBtnClick(Sender: TObject);
    procedure AlgTabBtnMouseEnter(Sender: TObject);
    procedure AlgTabBtnMouseLeave(Sender: TObject);
    procedure alle1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JourTabAfterOpen(DataSet: TDataSet);
    procedure JourTabCalcFields(DataSet: TDataSet);
    procedure JPosTabCalcFields(DataSet: TDataSet);
    procedure KFZ_GRDTitleClick(Column: TColumn);
    procedure KundeEditButtonClick(Sender: TObject);
    procedure kwChange(Sender: TObject);
    procedure LeBesuchEdiEnter(Sender: TObject);
    procedure LeBesuchEdiExit(Sender: TObject);
    procedure kennzKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure kennzKeyPress(Sender: TObject; var Key: char);
    procedure KFZTabAfterScroll(DataSet: TDataSet);
    procedure KFZTabBeforeDelete(DataSet: TDataSet);
    procedure KFZ_DSDataChange(Sender: TObject; Field: TField);
    procedure KFZ_PCChange(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure LiefNummer1Click(Sender: TObject);
    procedure psChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure SuchbegKeyPress(Sender: TObject; var Key: char);
    procedure Suchen1Click(Sender: TObject);
    procedure SuchbegChange(Sender: TObject);
    procedure UebernahmeBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    jour_mwst_tab : array[0..3] of double;
    searchtime  : Integer;
    Limit       : Integer;
    sortname    : string;
    SortField   : String;
    SuchBegr    : String;
    aktsort     : Integer;
    QueryTime   : DWord;
    LastID      : Integer;
    InChange    : Boolean;

    procedure SetSort (Sort : Integer);
    procedure UpdateQuery;
    procedure UpdateStatus;
    procedure Update_JournalArtikel (JOUR_ID : Integer);
    procedure UpdateHistory;

    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
               message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    First      : Boolean;
    Uebern     : Boolean;

    OnUpdateStatusBar : TOnUpdateStatusBar;
  end;

var
  KFZForm: TKFZForm;

implementation

{$R *.frm}

uses CAO_MAIN, CAO_DM, CAO_Kunde, cao_dbgrid_layout, CAO_Tool1,
  cao_progress;

procedure TKFZForm.FormCreate(Sender: TObject);
var i:integer; ja,mo,ta : word;
begin
  OnUpdateStatusBar :=nil;
  Uebern  :=False;
  Scaled  :=TRUE;
  First   :=True;
  SetSort (2);
  Limit   :=50;
  LastID  :=-1;
  InChange :=False;
  KFZToolBar.Images :=MainForm.ImageList1;
  SuchBeg.Height :=21;

  JahrCB.Items.Clear;
  JahrCB.Items.Add ('alles');
  decodedate (now,ja,mo,ta);
  for i:=1993 to ja do JahrCB.Items.Add(inttostr(i));
  JahrCB.Itemindex :=Ja - 1993 +1; // aktuelles Jahr

  SuchFeldCB.ItemIndex :=0;

  ListeTabBtn.Align      :=alRight;
  HistTabBtn.Align       :=alRight;
  InfoTabBtn.Align       :=alRight;
  AlgTabBtn.Align        :=alRight;

  ListeTabBtn.Font.Color :=clwhite;
  HistTabBtn.Font.Color  :=clwhite;
  InfoTabBtn.Font.Color  :=clwhite;
  AlgTabBtn.Font.Color   :=clwhite;

  AlgTabBtn.Font.Style   :=[fsBold];

  if kfz_pc.PageCount >0 then
   for i:=0 to kfz_pc.PageCount-1 do
    kfz_pc.Pages[i].TabVisible :=False;
end;

procedure TKFZForm.FormDeactivate(Sender: TObject);
begin
  if (not (KFZPanel.Parent is tForm)) and
     (KFZPanel.Parent.Parent is tForm) and
     (assigned(tForm(KFZPanel.Parent.Parent).ActiveControl))
   then tDBEdit(tForm(KFZPanel.Parent.Parent).ActiveControl).Color :=clWindow;

  if Uebern then exit;

  KunTab.Close;
  KFZTab.Close;
  JourTab.Close;
  JPosTab.Close;
end;

procedure TKFZForm.FormShow(Sender: TObject);
begin
//  MainForm.XPMenu1.InitComponent (Self);
end;

procedure TKFZForm.JourTabAfterOpen(DataSet: TDataSet);
var w : string;
begin
  Update_JournalArtikel (JourTab.FieldByName ('REC_ID').AsInteger);

  jour_mwst_tab[0] :=JourTabMwst_0.Value;
  jour_mwst_tab[1] :=JourTabMwst_1.Value;
  jour_mwst_tab[2] :=JourTabMwst_2.Value;
  jour_mwst_tab[3] :=JourTabMwst_3.Value;

  w :=JourTabWAEHRUNG.Value;
  JPosTabEPREIS.DisplayFormat :=',###,##0.00 "'+w+'";-,###,##0.00 "'+w+'"; ';
end;

procedure TKFZForm.JourTabCalcFields(DataSet: TDataSet);
var Quelle : String;
begin
  JourTabCalcStadium.Value :=GetRechStatus (JourTabStadium.AsInteger,JourTabquelle.Value);

  case JourTabquelle.Value of
          1 : Quelle:='Angebot';
          3 : Quelle:='Verkauf';
          5 : Quelle:='Einkauf';

       else  Quelle:='??? ['+inttostr(JourTabQuelle.Value)+']';
  end;

  JourTabCalcEKVK.Value    :=Quelle;
end;

procedure TKFZForm.JPosTabCalcFields(DataSet: TDataSet);
begin
  if (JPosTabSteuer_Code.Value>=0) and
     (JPosTabSteuer_Code.Value<=3)
   then JPosTabSteuer_Proz.Value :=Jour_MwSt_Tab[JPosTabSteuer_Code.Value]
   else JPosTabSteuer_Proz.Value :=0;
end;

procedure TKFZForm.KFZ_GRDTitleClick(Column: TColumn);
begin
  case Column.Index of
{kennz}   0:SetSort (1);
{fgst}    1:SetSort (2);
  end;
end;

procedure TKFZForm.KundeEditButtonClick(Sender: TObject);
var AdressForm: TAdressForm;
begin
  AdressForm :=TAdressForm.Create (self);
  try
     AdressForm.BorderStyle :=bsSizeable;
     AdressForm.Height :=555;
     AdressForm.Width :=660;
     AdressForm.UebernahmeBtn.Visible :=True;
     AdressForm.uebernehmen1.Visible :=True;
     AdressForm.Button1.Cancel :=True;
     AdressForm.Invalidate;
     AdressForm.ShowModal;
     if AdressForm.Uebern then
     begin // Adresse in Rechnung überbnehmen
        if not (KFZTab.State in [dsEdit,dsInsert]) then KFZTab.Edit;
        KFZTabADDR_ID.Value :=AdressForm.KSQueryRec_ID.Value;
     end;
  finally
     AdressForm.Free;
     //AdressForm :=nil;
  end;
end;

procedure TKFZForm.kwChange(Sender: TObject);
begin
  if InChange then exit;
  InChange :=True;
  try
     if length(kw.text)>0
       then KFZTabPS.AsInteger :=Round(StrToInt (kw.text)*1.35962)
       else KFZTabPS.AsInteger :=0;
  finally
    InChange :=False;
  end;
end;

procedure TKFZForm.LeBesuchEdiEnter(Sender: TObject);
begin
  tDBEdit(sender).Color :=DM1.EditColor;  //  $009FFF9F;
end;

procedure TKFZForm.LeBesuchEdiExit(Sender: TObject);
begin
  tDBEdit(sender).Color :=clWindow;
end;

procedure TKFZForm.kennzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift=[]) and (key=33) then // PGUP
  begin
       KFZTab.Prior;
       key :=0;
  end else
  if (Shift=[]) and (key=34) then // PGDOWN
  begin
       KFZTab.Next;
       key :=0;
  end;
end;

procedure TKFZForm.kennzKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
  begin
       key :=#0;
       if uppercase(tControl(Sender).Name)='LEBESUCHEDI' then kennz.SetFocus
       else
         if KFZPanel.Parent is tForm
           then SendMessage (KFZPanel.Parent.Handle,WM_NEXTDLGCTL,0,0)
           else SendMessage (KFZPanel.Parent.Parent.Handle,WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TKFZForm.KFZTabAfterScroll(DataSet: TDataSet);
begin
  if LastID=KFZTabKFZ_ID.Value then exit;

  UpdateStatus;
  LastID :=KFZTabKFZ_ID.Value;

  if KFZ_PC.ActivePage=Hist_TS then
  begin
    Screen.Cursor :=crSQLWait;
    try
       UpdateHistory;
    finally
       Screen.Cursor :=crDefault;
    end;
  end;
  ProgressForm.Stop;
end;

procedure TKFZForm.KFZTabBeforeDelete(DataSet: TDataSet);
begin
  if messagedlg ('Wollen Sie dieses Fahrzeug wirklich löschen ?',
                 mtconfirmation,[mbyes,mbno],0)<>mryes then Abort;
end;

procedure TKFZForm.KFZ_DSDataChange(Sender: TObject; Field: TField);
begin
  if KFZTabKFZ_ID.Value <> LastID then KFZTabAfterScroll (nil);
end;

procedure TKFZForm.KFZ_PCChange(Sender: TObject);
begin
  SichtbareSpalten1.Enabled :=KFZ_PC.ActivePage=List_TS;

  ListeTabBtn.Font.Style :=[];
  HistTabBtn.Font.Style  :=[];
  InfoTabBtn.Font.Style  :=[];
  AlgTabBtn.Font.Style   :=[];

  case KFZ_PC.ActivePageIndex of
       0: begin AlgTabBtn.Font.Style   :=[fsBold]; Allgemein1.Checked :=True; end;
       1: begin InfoTabBtn.Font.Style  :=[fsBold]; Info1.Checked :=True;      end;
       2: begin HistTabBtn.Font.Style  :=[fsBold]; Historie1.Checked :=True;  end;
       3: begin ListeTabBtn.Font.Style :=[fsBold]; Liste1.Checked :=True;     end;
  end;

  if KFZ_PC.ActivePage=Hist_TS then
  begin
       Screen.Cursor :=crSqlWait;
       try
          UpdateHistory;
       finally
          Screen.Cursor :=crDefault;
       end;
  end else
  begin
       if JPosTab.Active then JPosTab.Close;
       if JourTab.Active then JourTab.Close;
  end;
end;

procedure TKFZForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(KFZ_GRD),'KFZ_LISTE',102);
  dm1.GridLoadLayout (tDBGrid(JournalGrid),'KFZ_HISTORY_KOPF',101);
  dm1.GridLoadLayout (tDBGrid(JourPosGrid),'KFZ_HISTORY_POS',101);
end;

procedure TKFZForm.LiefNummer1Click(Sender: TObject);
begin
  if (tmenuitem (sender).tag>0)and(tmenuitem (sender).tag<6) then
  begin
    tmenuitem (sender).checked :=not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;

procedure TKFZForm.psChange(Sender: TObject);
begin
  if InChange then exit;
  InChange :=True;
  try
     if length(ps.text)>0
       then KFZTabKW.AsInteger :=Round(StrToInt (ps.text)*0.735499)
       else KFZTabKW.AsInteger :=0;
  finally
    InChange :=False;
  end;
end;

procedure TKFZForm.SearchTimerTimer(Sender: TObject);
begin
  if searchtime > 0 then dec (searchtime) else
  begin
      searchtimer.enabled :=false;
      SuchBegr :=Suchbeg.Text;

      // führende Leerzeichen entfernen
      while (length(Suchbegr)>0)and(Suchbegr[1]=' ')
       do delete (Suchbegr,1,1);
      // Leerzeichen am ende Entfernen
      while (length(Suchbegr)>0)and(Suchbegr[length(Suchbegr)]=' ')
       do delete (Suchbegr,length(SuchBegr),1);

      UpdateQuery;
  end;
end;

procedure TKFZForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(KFZ_GRD));
end;

procedure TKFZForm.SuchbegKeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then
  begin
     Key :=#0;
     try
        if KFZ_PC.ActivePage=Allg_TS  then kennz.SetFocus     else
        if KFZ_PC.ActivePage=Notiz_TS then AddrNotiz.SetFocus else
        if KFZ_PC.ActivePage=Hist_TS  then JournalGrid.SetFocus  else
        if KFZ_PC.ActivePage=List_TS  then KFZ_GRD.SetFocus;
     except end;
  end;
end;

procedure TKFZForm.Suchen1Click(Sender: TObject);
begin
  try
     Suchbeg.SetFocus;
  except end;
end;

procedure TKFZForm.SuchbegChange(Sender: TObject);
begin
  searchtime :=15;
  searchtimer.enabled :=true;
end;

procedure TKFZForm.UebernahmeBtnClick(Sender: TObject);
begin
  if KFZTab.State in [dsEdit,dsInsert] then KFZTab.Post;
  Uebern :=True;
  Close;
end;

procedure TKFZForm.FormActivate(Sender: TObject);
var ID : Integer;
begin
  ID :=LastID;
  if First then
  begin
      LastID :=-1;
      ID :=-1;
      KFZ_PC.ActivePage   :=KFZ_PC.Pages[0];
      KFZ_PCChange (Sender);

//      KFZ_GRD.RowColor1      :=DM1.C2Color;
//      JournalGrid.RowColor1  :=DM1.C2Color;
//      JourPosGrid.RowColor1  :=DM1.C2Color;

//      KFZ_GRD.EditColor      :=DM1.EditColor;
//      JournalGrid.EditColor  :=DM1.EditColor;
//      JourPosGrid.EditColor  :=DM1.EditColor;

//      KFZ_PC.HintColor :=Application.HintColor;

      First :=False;
      SB1.SimplePanel :=True;
      SB1.SimpleText :='Lade Benutzereinstellungen ...';

      Limit :=DM1.ReadIntegerU ('','KFZ_TREFFER',50);
      case Limit of
               10 : N101.Checked :=True;
               50 : N501.Checked :=True;
              100 : N1001.Checked :=True;
              200 : N2001.Checked :=True;
              500 : N5001.Checked :=True;
        999999999 : alle1.Checked :=True;
      end;

      dm1.GridLoadLayout (tDBGrid(KFZ_GRD),'KFZ_LISTE',102);
      dm1.GridLoadLayout (tDBGrid(JournalGrid),'KFZ_HISTORY_KOPF',101);
      dm1.GridLoadLayout (tDBGrid(JourPosGrid),'KFZ_HISTORY_POS',101);
      SetSort (aktsort);

      SB1.SimplePanel :=False;
      SB1.SimpleText :='';
      SB1.Invalidate;

  end;
  Uebern :=False;

  UpdateQuery;

  if ID>0 then KFZTab.Locate ('KFZ_ID',ID,[]);

  try
    case KFZ_PC.ActivePage.Tag of
         1: kennz.setfocus;
         2: AddrNotiz.setfocus;
         3: JournalGrid.SetFocus;
         4: KFZ_GRD.SetFocus;
    end;
  except end;

  KFZ_PCChange(Sender);
end;

procedure TKFZForm.AlgTabBtnClick(Sender: TObject);
begin
  if sender is tSpeedButton then  KFZ_PC.ActivePage :=KFZ_PC.Pages[tSpeedButton(sender).Tag-1]
  else if sender is tMenuItem then KFZ_PC.ActivePage :=KFZ_PC.Pages[tMenuItem(sender).Tag-1];
  KFZ_PCChange (Sender);
end;

procedure TKFZForm.AlgTabBtnMouseEnter(Sender: TObject);
begin
  if (sender is tSpeedButton)and
     (tSpeedButton(Sender).Enabled) then
  begin
    tSpeedButton(Sender).Transparent :=False;
    tSpeedButton(Sender).Font.Color :=clBlack;
  end;
end;

procedure TKFZForm.AlgTabBtnMouseLeave(Sender: TObject);
begin
  if (sender is tSpeedButton) then
  begin

    tSpeedButton(Sender).Transparent :=True;
    tSpeedButton(Sender).Font.Color :=clWhite;
  end;
end;

procedure TKFZForm.Aktualisieren1Click(Sender: TObject);
begin
  KFZTab.Refresh;
end;

procedure TKFZForm.alle1Click(Sender: TObject);
begin
  Limit :=tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked :=True;
  DM1.WriteIntegerU ('','KFZ_TREFFER',Limit);
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.SetSort (Sort : Integer);
begin
     if sort = aktsort then exit;
     if sort<0 then sort :=aktsort;
     case sort of
          1:begin sortfield :='POL_KENNZ';   sortname :='Kennzeichen'; end;
          2:begin sortfield :='FGST_NUM';    sortname :='FGST-Nr.';    end;
          3:begin sortfield :='ADDR_ID';     sortname :='Kundennummer';end;
     end;
     UpdateStatus;
     AktSort :=Sort;

     if not first then UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TKFZForm.UpdateQuery;
var LastTime : DWord;
begin
     LastTime :=GetTickCount64;

     if kfztab.active then kfztab.close;
     kfztab.sql.clear;
     kfztab.sql.add ('select * from KFZ');

     if SuchBegr <> '' then
     begin
          kfztab.sql.add ('where ');
          case SuchFeldCB.ItemIndex of
            0: begin
                 kfztab.SQL.Add ('('+DM1.GetSearchSQL (['POL_KENNZ'],SuchBegr)+')');
               end;
            1: begin
                 kfztab.SQL.Add ('('+DM1.GetSearchSQL (['FGST_NUM'],SuchBegr)+')');
               end;
          end;
     end;
     kfztab.sql.add ('order by '+SortField);
     kfztab.SQL.Add ('LIMIT 0,'+Inttostr(limit));
     Screen.Cursor :=crSQLWait;
     try
        kuntab.open;
        kfztab.Open;
     finally
        Screen.Cursor :=crDefault;
     end;
     QueryTime :=GetTickCount64-LastTime;
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure tKFZForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert : String;
begin
     Sortierung :='Sortierung : '+sortname;
     SuchZeit   :=FormatFloat ('0.00',(QueryTime)/1000)+' Sek.';
     Erstellt   :='';
     Geaendert  :='';

     try
       if KFZTab.Active then
        if KFZTab.RecordCount=0 then  // LAUFZEITFEHLER!!!!
          Datensatz :='keine'
            else
              if KFZTab.RecordCount=Limit then
                Datensatz :=inttostr (KFZTab.RecNo)+' von >='+inttostr (KFZTab.RecordCount)
                  else Datensatz :=inttostr (KFZTab.RecNo)+' von '+inttostr (KFZTab.RecordCount);

     except
       on E: Exception do
       begin
         MessageDlg('Fehler: '+E.Message,mterror,[mbok],0);
       end;
     end;

     if assigned (OnUpdateStatusBar) then
     begin
         SB1.Visible :=False;
         OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
     end
        else
     begin
         SB1.Visible :=True;

         sb1.panels[0].Text :=SuchZeit;
         sb1.panels[1].Text :=Datensatz;
         SB1.Panels[2].Text :=Sortierung;
         Sb1.Panels[3].Text :=Erstellt;
         Sb1.Panels[4].Text :=Geaendert;
     end;
end;
//------------------------------------------------------------------------------
procedure TKFZForm.Update_JournalArtikel (JOUR_ID : Integer);
begin
    if ArtikelViewBtn.Down then
    begin
      if JPosTab.Active then JPosTab.Close;

      JPosTab.Sql.Clear;
      JPosTab.Sql.Add ('select JOURNAL_ID,QUELLE,ARTIKEL_ID,ADDR_ID,VRENUM,');
      JPosTab.Sql.Add ('BEZEICHNUNG,MATCHCODE,ARTNUM,BARCODE,MENGE,');
      JPosTab.Sql.Add ('EPREIS,RABATT,STEUER_CODE from JOURNALPOS');
      JPosTab.Sql.Add ('where JOURNAL_ID = '+inttostr(JOUR_ID));
      JPosTab.Sql.Add ('order by POSITION');

      if not JPosTab.Active then JPosTab.Open;
    end

    else if JPosTab.Active then JPosTab.Close;
end;
//------------------------------------------------------------------------------
procedure TKFZForm.UpdateHistory;
var VJahr  : Integer;
    BJahr  : Integer;
    OPOS   : Boolean;
    OPSUM,BEZSUM : Double;

begin
   screen.cursor :=crsqlwait;

   JourPosGrid.Visible :=ArtikelViewBtn.Down;
   RxSplitter1.Visible :=ArtikelViewBtn.Down;
   if ArtikelViewBtn.Down then RxSplitter1.Top :=JourPosGrid.Top-1;
   try
    HistSumBar.Visible    :=False;
    HistArtikelSB.Visible :=False;

    if JPosTab.Active then JPosTab.Close;
    if JourTab.Active then JourTab.Close;


    if JahrCB.ItemIndex=0
     then begin vjahr :=1900;bjahr :=2300;end
     else begin vjahr :=1992 + JahrCB.ItemIndex;
                bjahr :=1992 + JahrCB.Itemindex;
          end;

    OPOS :=OPOSViewBtn.Down;

    JourTab.Sql.Clear;
    JourTab.Sql.Add ('select KFZ_ID,REC_ID,QUELLE,VRENUM,RDATUM,KUN_NAME1,');
    JourTab.Sql.Add ('ADDR_ID,KFZ_ID,KM_STAND,NSUMME,MSUMME,BSUMME,');
    JourTab.Sql.Add ('IST_BETRAG,STADIUM,PROJEKT,ORGNUM,WAEHRUNG,');
    JourTab.Sql.Add ('MWST_0,MWST_1,MWST_2,MWST_3');
    JourTab.Sql.Add ('from JOURNAL');
    JourTab.Sql.Add ('where KFZ_ID='+inttostr(KFZTabKFZ_ID.Value)+
                     ' and YEAR(VRENUM) BETWEEN '+inttostr(vjahr)+
                     ' and '+inttostr(bjahr));
    JourTab.Sql.Add (' and QUELLE in (3,5)');
    if OPOS  then JourTab.Sql.Add ('and STADIUM BETWEEN 19 and 80');

    if not JourTab.Active then JourTab.Open;

    if SumQuery.Active then SumQuery.Close;
    SumQuery.Sql.Clear;
    SumQuery.Sql.Add ('select STADIUM,SUM(NSUMME) AS NSUM,SUM(MSUMME) AS MSUM,');
    SumQuery.Sql.Add ('SUM(BSUMME) AS BSUM,WAEHRUNG');
    SumQuery.Sql.Add ('from JOURNAL');
    SumQuery.Sql.Add ('where KFZ_ID=' +inttostr (KFZTabKFZ_ID.Value));
    SumQuery.Sql.Add ('and YEAR(VRENUM) BETWEEN '+inttostr (vjahr) +
                      ' and '+inttostr (bjahr));
    SumQuery.Sql.Add ('and QUELLE in (3,5)');
    SumQuery.Sql.Add ('group by STADIUM');

    SumQuery.Open;

    OPSUM  :=0;
    BEZSUM :=0;

    while not SumQuery.eof do
    begin
       case SumQuery.FieldByName ('STADIUM').AsInteger of
            80..99 : if SumQuery.FieldByName('WAEHRUNG').Value<>dm1.LeitWaehrung
                      then BEZSUM :=BEZSUM + DM1.CalcLeitWaehrung(SumQuery.FieldByName('BSUM').AsFloat,SumQuery.FieldByName('WAEHRUNG').Value)
                      else BEZSUM :=BEZSUM + SumQuery.FieldByName('BSUM').AsFloat;
            20..79 : if SumQuery.FieldByName('WAEHRUNG').Value<>dm1.LeitWaehrung
             then OPSUM  :=OPSUM  + SumQuery.FieldByName('BSUM').AsFloat
             else OPSUM  :=OPSUM  + DM1.CalcLeitWaehrung(SumQuery.FieldByName('BSUM').AsFloat,SumQuery.FieldByName('WAEHRUNG').Value);
       end;
       sumquery.next;
    end;
    SumQuery.Close;

    if opos then
    begin
         HistArtikelSB.Panels[0].Text :='Summe d. off. Posten : ';
         HistArtikelSB.Panels[1].Text :=FormatFloat (',##0.00',OPSUM)+' '+dm1.Leitwaehrung;
         HistArtikelSB.Panels[2].Text :='alle Preise BRUTTO !!!';
         HistArtikelSB.Visible :=true;
         if JourPosGrid.Visible
          then HistArtikelSB.Top :=JourPosGrid.Top + JourPosGrid.Height + 1;
    end else
    begin
         HistSumBar.Panels[1].Text :=FormatFloat (',##0.00',OPSUM)       +' '+dm1.Leitwaehrung;
         HistSumBar.Panels[3].Text :=FormatFloat (',##0.00',BEZSUM)      +' '+dm1.Leitwaehrung;
         HistSumBar.Panels[5].Text :=FormatFloat (',##0.00',OPSUM+BEZSUM)+' '+dm1.Leitwaehrung;
         HistSumBar.Panels[6].Text :='alle Preise BRUTTO !!!';
         HistSumBar.Visible :=True;

         if JourPosGrid.Visible
          then HistSumBar.Top :=JourPosGrid.Top + JourPosGrid.Height + 1;
    end;

    Update_JournalArtikel (JourTab.FieldByName ('REC_ID').AsInteger);

    //if DM1.JPosTab.Active then DM1.JPosTab.Close;
    //if DM1.JourTab.Active then DM1.JourTab.Close;

   finally
    screen.cursor :=crdefault;
   end;
end;
//------------------------------------------------------------------------------
procedure TKFZForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x:= 680;
    ptMaxTrackSize.x:= screen.width;
    ptMinTrackSize.y:= 560;
    ptMaxTrackSize.y:= screen.height;
  end;
end;
//------------------------------------------------------------------------------

end.

