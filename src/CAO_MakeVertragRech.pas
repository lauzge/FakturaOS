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
Modul        : CAO_MAKEVERTRAGRECH
Stand        : 14.03.2004
Version      : 1.2.4.6
Beschreibung : Dialog Wiederkehrende Rechnungen / Verträge / Bearbeitung

History :

06.07.2003 - Final Version
15.07.2003 - Schreibfehler in Tabellenfeldern beseitigt
16.08.2003 - Bugfix bei Zahlungsart Vorkasse
10.10.2003 - JvDBSpinEdit für Intervall entfernt, da diese den Wert in der DB
             nicht ändert, Komponente ist fehlerhaft !!!
09.11.2003 - Bug beim editieren von Texten beseitigt
10.01.2004 - Brutto-Flag wurde beim erstellen der Rechnungen nicht
             berücksichtigt, Bug ist gefixt
09.02.2004 - Vertrag deaktivieren (Button-Menüeintrag) eingebaut
14.03.2004 - Auswahl des Kundens über Kundennummer integriert
           - Auswahl des Ansprechpartners über Drop-Down-Liste implementiert
19.03.2004 - Zeitraum um "Wöchentlich" erweitert
09.04.2004 - Bug #101 gefixt

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_MakeVertragRech;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ComCtrls, StdCtrls, Buttons, DBGrids, DBCtrls, LSControls, rxdbdateedit,
  RxDBGrid, rxdbcomb, ZDataset, ZAbstractRODataset, CAO_ARTIKEL1, CAO_Kunde,
  cao_var_const, VolDBEdit, Grids;

type

  { TMakeVertragReForm }

  TMakeVertragReForm = class(TForm)
    ArtikelPopupMenu: TPopupMenu;
    best_num: TDBEdit;
    CaoGroupBox8: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBNavigator3: TDBNavigator;
    DBText29: TDBText;
    CaoGroupBox2: TGroupBox;
    CaoGroupBox1: TGroupBox;
    CaoGroupBox5: TGroupBox;
    CaoGroupBox6: TGroupBox;
    InfoEK: TDBText;
    InfoRGW: TDBText;
    DBText23: TDBText;
    DBText11: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    KunDatGB2: TGroupBox;
    KopfNav2: TDBNavigator;
    BottomSpacePan: TPanel;
    InfoPanOut: TPanel;
    Label10: TLabel;
    Label51: TLabel;
    Label50: TLabel;
    Label49: TLabel;
    Label48: TLabel;
    Label46: TLabel;
    Label45: TLabel;
    Label44: TLabel;
    Label43: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label40: TLabel;
    AlgSumPanel: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    PosTabALTTEIL_FLAG: TBooleanField;
    PosTabBEZ_FEST_FLAG: TBooleanField;
    PosTabBRUTTO_FLAG: TBooleanField;
    PosTabCALC_STEUERPORZ: TFloatField;
    ProblemLab: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label61: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel25: TPanel;
    Panel13: TPanel;
    Panel12: TPanel;
    Panel26: TPanel;
    FertigTopKunPan: TPanel;
    Panel3: TPanel;
    FertigSumPan: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    ProblemPanel: TPanel;
    Panel7: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    PosPan: TPanel;
    PosTopKunPan: TPanel;
    PosInfoPan: TPanel;
    Panel38: TPanel;
    PosSumPan: TPanel;
    RechInfoMemo: TDBMemo;
    DBText17: TDBText;
    DBText16: TDBText;
    DBText15: TDBText;
    JvDBSpinEdit1: TDBEdit;
    GlobRabatt: TDBEdit;
    Label14: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    Label55: TLabel;
    Label29: TLabel;
    Panel29: TPanel;
    Panel28: TPanel;
    Panel27: TPanel;
    JvDBDateEdit1: TRxDBDateEdit;
    JvDBDateEdit2: TRxDBDateEdit;
    JvDBDateEdit3: TRxDBDateEdit;
    PosGrid: TRxDBGrid;
    ReEdiTabAKTIV_FLAG: TBooleanField;
    ReEdiTabBRUTTO_FLAG: TBooleanField;
    ReEdiTabMWST_FREI_FLAG: TBooleanField;
    ReEdiTabPRINT_FLAG: TBooleanField;
    PR_EbeneCB: TRxDBComboBox;
    RxDBDateEdit1: TRxDBDateEdit;
    SK_Netto_Tage: TDBEdit;
    SK_Skonto_Proz: TDBEdit;
    SK_Skonto_Tage: TDBEdit;
    GotoAuswahlBtn: TToolButton;
    New1Btn: TToolButton;
    Del1Btn: TToolButton;
    GotoPosBtn: TToolButton;
    GotoAllgBtn: TToolButton;
    NeuArtBtn1: TToolButton;
    DelBtn: TToolButton;
    DownBtn: TToolButton;
    GotoFertigBtn: TToolButton;
    BuchenBtn: TToolButton;
    DeaktivierenBtn: TToolButton;
    ToolButton17: TToolButton;
    ToolButton12: TToolButton;
    ToolButton2: TToolButton;
    UpBtn: TToolButton;
    ToolButton3: TToolButton;
    ToolButton9: TToolButton;
    ToolButton4: TToolButton;
    VolgaDBEdit1: TVolgaDBEdit;
    WaehrungCB: TDBLookupComboBox;
    ZahlartDB: TDBLookupComboBox;
    VertreterCB: TDBLookupComboBox;
    VersandCB: TDBLookupComboBox;
    waehrung: TDBEdit;
    Zahlart: TDBEdit;
    Vertreter: TDBEdit;
    Versand: TDBEdit;
    usr2: TDBEdit;
    usr1: TDBEdit;
    projekt: TDBEdit;
    DBText1: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText4: TDBText;
    KuNrEdit: TDBEdit;
    DBNavigator1: TDBNavigator;
    SumPan: TPanel;
    BestellGB: TGroupBox;
    CaoGroupBox3: TGroupBox;
    InfoGB: TGroupBox;
    KFZGB: TGroupBox;
    Label1: TLabel;
    Label16: TLabel;
    Label62: TLabel;
    Label60: TLabel;
    Label42: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label30: TLabel;
    Label6: TLabel;
    Label38: TLabel;
    Label27: TLabel;
    Label15: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    Label28: TLabel;
    Label21: TLabel;
    Label31: TLabel;
    Label53: TLabel;
    Label22: TLabel;
    Label47: TLabel;
    KuNrEditBtn: TSpeedButton;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel10: TPanel;
    Panel9: TPanel;
    Panel2: TPanel;
    best_datum: TRxDBDateEdit;
    TexteGB: TGroupBox;
    KundatGB: TGroupBox;
    KunDatPan: TPanel;
    AlgPan2: TPanel;
    AlgPan3: TPanel;
    ReAllgBottomPan: TPanel;
    ReEdiDS: TDataSource;
    PosDS: TDataSource;
    ReEdiListGrid: TDBGrid;
    freierArtikel1: TMenuItem;
    ButtonPan: TPanel;
    ReEdiTopLab: TLabel;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Ansicht1: TMenuItem;
    Adressezuweisen1: TMenuItem;
    Artikelhinzufgen1: TMenuItem;
    freienArtikelhinzufgen1: TMenuItem;
    Kopieren1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Auswahl1: TMenuItem;
    Allgemein1: TMenuItem;
    Fertigstellen1: TMenuItem;
    Aktualisieren1: TMenuItem;
    MakeBelege: TMenuItem;
    PC1: TPageControl;
    FertigBtn: TSpeedButton;
    PositionenBtn: TSpeedButton;
    AllgemeinBtn: TSpeedButton;
    AuswahlBtn: TSpeedButton;
    EdiListTS: TTabSheet;
    AdressTS: TTabSheet;
    PosTS: TTabSheet;
    Fertig: TTabSheet;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolBar5: TToolBar;
    NewBelBtn: TToolButton;
    BelDelBtn: TToolButton;
    ReEdiBtn: TToolButton;
    TopPan: TPanel;
    RePanel: TPanel;
    PosTabADDR_ID: TZIntegerField;
    PosTabALTTEIL_PROZ: TZDoubleField;
    PosTabALTTEIL_STCODE: TZSmallIntField;
    PosTabARTIKELTYP: TZRawStringField;
    PosTabARTIKEL_ID: TZIntegerField;
    PosTabARTNUM: TZRawStringField;
    PosTabBARCODE: TZRawStringField;
    PosTabBEZEICHNUNG: TZRawCLobField;
    PosTabBSumme: TCurrencyField;
    PosTabCALC_EK: TFloatField;
    PosTabCALC_LAGERMENGE: TFloatField;
    PosTabCALC_LAGERMENGE_STR: TStringField;
    PosTabCALC_RGEWINN: TFloatField;
    PosTabDIMENSION: TZRawStringField;
    PosTabEPREIS: TZDoubleField;
    PosTabE_RGEWINN: TZDoubleField;
    PosTabGEGENKTO: TZIntegerField;
    PosTabGEWICHT: TZDoubleField;
    PosTabGROESSE: TZRawStringField;
    PosTabJOURNAL_ID: TZIntegerField;
    PosTabLAENGE: TZRawStringField;
    PosTabMATCHCODE: TZRawStringField;
    PosTabMATCH_ARTNUM: TStringField;
    PosTabMENGE: TZDoubleField;
    PosTabME_EINHEIT: TZRawStringField;
    PosTabMSumme: TCurrencyField;
    PosTabMwSt: TStringField;
    PosTabNSumme: TCurrencyField;
    PosTabPOSITION: TZIntegerField;
    PosTabPR_EINHEIT: TZDoubleField;
    PosTabRABATT: TZDoubleField;
    PosTabREC_ID: TZIntegerField;
    PosTabSTEUER_CODE: TZShortIntField;
    PosTabVVTNUM: TZIntegerField;
    ReEdiTabADDR_ID: TZIntegerField;
    ReEdiTabATMSUMME: TZDoubleField;
    ReEdiTabATSUMME: TZDoubleField;
    ReEdiTabBEST_CODE: TZSmallIntField;
    ReEdiTabBEST_DATUM: TZDateField;
    ReEdiTabBEST_NAME: TZRawStringField;
    ReEdiTabBSUMME: TZDoubleField;
    ReEdiTabCALC_DATUM_NEXT: TStringField;
    ReEdiTabDATUM_ENDE: TZDateField;
    ReEdiTabDATUM_NEXT: TZDateField;
    ReEdiTabDATUM_START: TZDateField;
    ReEdiTabERSTELLT: TZDateField;
    ReEdiTabERST_NAME: TZRawStringField;
    ReEdiTabGEGENKONTO: TZIntegerField;
    ReEdiTabGLOBRABATT: TZDoubleField;
    ReEdiTabINFO: TZRawCLobField;
    ReEdiTabINTERVALL: TZRawStringField;
    ReEdiTabINTERVALL_NUM: TZWordField;
    ReEdiTabKOST_NETTO: TZDoubleField;
    ReEdiTabKUN_ABTEILUNG: TZRawStringField;
    ReEdiTabKUN_ANREDE: TZRawStringField;
    ReEdiTabKUN_LAND: TZRawStringField;
    ReEdiTabKUN_NAME1: TZRawStringField;
    ReEdiTabKUN_NAME2: TZRawStringField;
    ReEdiTabKUN_NAME3: TZRawStringField;
    ReEdiTabKUN_NUM: TZRawStringField;
    ReEdiTabKUN_ORT: TZRawStringField;
    ReEdiTabKUN_PLZ: TZRawStringField;
    ReEdiTabKUN_STRASSE: TZRawStringField;
    ReEdiTabLIEFART: TZSmallIntField;
    ReEdiTabLOHN: TZDoubleField;
    ReEdiTabMSUMME: TZDoubleField;
    ReEdiTabMSUMME_0: TZDoubleField;
    ReEdiTabMSUMME_1: TZDoubleField;
    ReEdiTabMSUMME_2: TZDoubleField;
    ReEdiTabMSUMME_3: TZDoubleField;
    ReEdiTabMWST_0: TZDoubleField;
    ReEdiTabMWST_1: TZDoubleField;
    ReEdiTabMWST_2: TZDoubleField;
    ReEdiTabMWST_3: TZDoubleField;
    ReEdiTabNSUMME: TZDoubleField;
    ReEdiTabORGNUM: TZRawStringField;
    ReEdiTabPROJEKT: TZRawStringField;
    ReEdiTabPR_EBENE: TZSmallIntField;
    ReEdiTabREC_ID: TZIntegerField;
    ReEdiTabSOLL_NTAGE: TZSmallIntField;
    ReEdiTabSOLL_RATBETR: TZDoubleField;
    ReEdiTabSOLL_RATEN: TZSmallIntField;
    ReEdiTabSOLL_RATINTERVALL: TZIntegerField;
    ReEdiTabSOLL_SKONTO: TZDoubleField;
    ReEdiTabSOLL_STAGE: TZSmallIntField;
    ReEdiTabSTADIUM: TZSmallIntField;
    ReEdiTabTKOST: TZDoubleField;
    ReEdiTabUSR1: TZRawStringField;
    ReEdiTabUSR2: TZRawStringField;
    ReEdiTabVERTRETER_ID: TZIntegerField;
    ReEdiTabVVTNUM: TZIntegerField;
    ReEdiTabWAEHRUNG: TZRawStringField;
    ReEdiTabWARE: TZDoubleField;
    ReEdiTabWERT_NETTO: TZDoubleField;
    ReEdiTabZAHLART: TZSmallIntField;
    UmschaltungBruttoNetto1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    Positionen1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Suchen1: TMenuItem;
    N6: TMenuItem;
    Vertragdeaktivieren1: TMenuItem;
    Speichernundaktivieren1: TMenuItem;
    N1: TMenuItem;
    Positionlschen1: TMenuItem;
    Storno1: TMenuItem;
    N4: TMenuItem;
    Texthinzufgen1: TMenuItem;
    N3: TMenuItem;
    neuenBelegerstellen1: TMenuItem;
    Spezial1: TMenuItem;
    Sortierung1: TMenuItem;
    Text1: TMenuItem;
    PosTab: TZQuery;
    ReEdiTab: TZQuery;
    best_name: TVolgaDBEdit;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DeaktivierenBtnClick(Sender: TObject);
    procedure Del1BtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure GotoAllgBtnClick(Sender: TObject);
    procedure GotoAuswahlBtnClick(Sender: TObject);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure GotoFertigBtnClick(Sender: TObject);
    procedure GotoPosBtnClick(Sender: TObject);
    procedure KuNrEditButtonClick(Sender: TObject);
    procedure KuNrEditEnter(Sender: TObject);
    procedure KuNrEditExit(Sender: TObject);
    procedure KuNrEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure KuNrEditKeyPress(Sender: TObject; var Key: char);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure MakeBelegeClick(Sender: TObject);
    procedure NeuArtBtnClick(Sender: TObject);
    procedure NeuFrArtBtnClick(Sender: TObject);
    procedure NeuKomBtnClick(Sender: TObject);
    procedure New1BtnClick(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure PC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure PosDSDataChange(Sender: TObject; Field: TField);
    procedure PosGridApplyCellAttribute(Sender: TObject;
      Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure PosGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure PosGridKeyPress(Sender: TObject; var Key: char);
    procedure PosGridShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure PosMatchButtonClick(Sender: TObject);
    procedure PosTabAfterDelete(DataSet: TDataSet);
    procedure PosTabAfterPost(DataSet: TDataSet);
    procedure PosTabAfterScroll(DataSet: TDataSet);
    procedure PosTabBeforeDelete(DataSet: TDataSet);
    procedure PosTabBeforeEdit(DataSet: TDataSet);
    procedure PosTabBeforeInsert(DataSet: TDataSet);
    procedure PosTabBeforePost(DataSet: TDataSet);
    procedure PosTabCalcFields(DataSet: TDataSet);
    procedure PosTabNewRecord(DataSet: TDataSet);
    procedure ReEdiBtnClick(Sender: TObject);
    procedure ReEdiDSDataChange(Sender: TObject; Field: TField);
    procedure ReEdiTabAfterEdit(DataSet: TDataSet);
    procedure ReEdiTabAfterPost(DataSet: TDataSet);
    procedure ReEdiTabAfterScroll(DataSet: TDataSet);
    procedure ReEdiTabBeforeClose(DataSet: TDataSet);
    procedure ReEdiTabBeforeDelete(DataSet: TDataSet);
    procedure ReEdiTabBeforePost(DataSet: TDataSet);
    procedure ReEdiTabCalcFields(DataSet: TDataSet);
    procedure ReEdiTabOnNewRecord(DataSet: TDataSet);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure UmschaltungBruttoNetto1Click(Sender: TObject);
    procedure UpBtnClick(Sender: TObject);
  private
    { Private-Deklarationen}
    Loading      : Boolean;
    AppendOK     : Boolean;
    LastF9       : Boolean;
    QueryTime    : DWord;
    //UseKFZ       : Boolean;

    LastTS       : tTabSheet;
    LastEdiID    : Integer;
    LastPosID    : Integer;
    LastKunNum   : String;

    //InDataChange : Boolean;
    procedure OnAddArtikel (ID : Integer; Menge : Double;
                            AlternativArtnum : String ='');
    procedure UpdateLayout;
    procedure UpdateStatus;
    function  MakeRechnung (SRC_ID:Integer): Integer;  // Liefert Rec-ID zurück
    procedure FindDialog1Find(Sender: TObject);
    procedure SetAdresse (ID : Integer);
    procedure UpdateAnsprechpartner;
  public
    { Public-Deklarationen}
    First        : Boolean;

    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure F9Change (Ein : Boolean);
    procedure PruefeVertraege;
  end;

var
  MakeVertragReForm: TMakeVertragReForm;

implementation

{$R *.frm}

uses CAO_DM, CAO_MAIN, cao_dbgrid_layout, cao_tool1
     {$IFDEF REPORTBUILDER},CAO_PrintRech{$ENDIF}, JvJCLUtils;

const
  ArtInfoSqlS =
   'select '+
   'A.REC_ID,A.EK_PREIS,A.VK1,A.VK2,A.VK3,A.VK4,A.VK5,A.VK1B,A.VK2B,A.VK3B,'+
   'A.VK4B,A.VK5B,AP.PREIS,AP.MENGE2,AP.PREIS2,AP.MENGE3,AP.PREIS3,AP.MENGE4,'+
   'AP.PREIS4,AP.MENGE5,AP.PREIS5,A.MENGE_AKT,A.MENGE_BESTELLT,A.RABGRP_ID,'+
   'A.MENGE_VKRE_EDI as MENGE_RESERVIERT,A.ALTTEIL_FLAG,A.NO_RABATT_FLAG,'+
   'A.NO_PROVISION_FLAG,A.NO_BEZEDIT_FLAG,A.NO_VK_FLAG,A.SN_FLAG,'+
   'A.PROVIS_PROZ,A.STEUER_CODE,A.ERLOES_KTO,A.AUFW_KTO,A.ARTNUM,'+
   'A.ERSATZ_ARTNUM,A.MATCHCODE,A.WARENGRUPPE,A.BARCODE,A.ARTIKELTYP,'+
   'A.KAS_NAME,A.ME_EINHEIT,A.PR_EINHEIT,A.LAENGE,A.GROESSE,A.DIMENSION,'+
   'A.GEWICHT,A.KURZNAME,A.LANGNAME,AP.PREIS_TYP,AP.ADRESS_ID,A.VPE,AP.BESTNUM';
  ArtInfoSQLW1 =
   ',0.00 as MENGE_LIEF, 0.00 as MENGE_SOLL, A.REC_ID as JID '+
   'from ARTIKEL A '+
   'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID=A.REC_ID '+
   'where A.REC_ID=:AID ';
  ArtInfoSQLW2 =
   ',0.00 as MENGE_LIEF, 0.00 as MENGE_SOLL, JP1.REC_ID as JID '+
   'from VERTRAGPOS JP1,ARTIKEL A '+
   'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID=A.REC_ID '+
   'where (JP1.JOURNAL_ID=:JID) and (JP1.ARTIKEL_ID=A.REC_ID) ';
  ArtInfoSQLO =
   'group by A.REC_ID';


//------------------------------------------------------------------------------
procedure TMakeVertragReForm.OnAddArtikel (ID : Integer; Menge : Double;
                                           AlternativArtnum : String ='');
var PR : Double;
begin
     //wird vom Artikelstamm aufgerufen
     DM1.ArtInfoTab.Close;
     DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW1+ArtInfoSqlO;
     DM1.ArtInfoTab.ParamByName ('AID').AsInteger :=ID;
     DM1.ArtInfoTab.Open;

     if (DM1.ArtInfoTab.Locate ('REC_ID',ID,[])) and
        (DM1.ArtInfoTabRec_ID.AsInteger=ID) and
        (DM1.ArtInfoTabNo_VK_Flag.Value=False) then
     begin
          AppendOK :=True;
          try
            Loading :=True;

            PosTab.Append;

            PosTabJournal_ID.Value      :=ReEdiTabREC_ID.Value;
            PosTabAddr_ID.Value         :=ReEdiTabADDR_ID.Value;
            PosTabVVTNUM.Value          :=ReEdiTabVVTNUM.Value;

            PosTabArtikel_ID.Value      :=DM1.ArtInfoTabREC_ID.Value;
            PosTabArtikelTyp.Value      :=DM1.ArtInfoTabArtikelTyp.Value;

            PosTabArtNum.Value          :=DM1.ArtInfoTabArtnum.Value;
            PosTabMatchCode.Value       :=DM1.ArtInfoTabMatchCode.Value;
            PosTabBarCode.Value         :=DM1.ArtInfoTabBarCode.Value;

            PosTabBezeichnung.AsString  :=DM1.ArtInfoTabLangName.AsString;
            PosTabLaenge.Value          :=DM1.ArtInfoTabLaenge.Value;
            PosTabGroesse.Value         :=DM1.ArtInfoTabGroesse.Value;
            PosTabDimension.Value       :=DM1.ArtInfoTabDimension.Value;
            PosTabGewicht.Value         :=DM1.ArtInfoTabGewicht.Value;
            PosTabME_Einheit.Value      :=DM1.ArtInfoTabME_Einheit.Value;
            PosTabPR_Einheit.Value      :=DM1.ArtInfoTabPR_Einheit.Value;

            PosTabRabatt.Value          :=ReEdiTabGlobRabatt.Value;
            PosTabSteuer_Code.Value     :=DM1.ArtInfoTabSteuer_Code.Value;
            PosTabAltteil_Flag.Value    :=DM1.ArtInfoTabAltTeil_Flag.Value;
            PosTabALTTEIL_PROZ.Value    :=0.1; // 10%
            PosTabALTTEIL_STCODE.Value  :=DM1.ArtInfoTabSteuer_Code.Value;
            PosTabBEZ_FEST_Flag.Value   :=DM1.ArtInfoTabNO_BEZEDIT_Flag.Value;
            PosTabGEGENKTO.Value        :=DM1.ArtInfoTabErloes_Kto.Value;

            {
            if not DM1.ArtInfoTabNO_PROVISION_FLAG.AsBoolean then
            begin
               if DM1.ArtInfoTabPROVIS_PROZ.AsFloat <> 0
                then PosTabPROVIS_PROZ.AsFloat :=DM1.ArtInfoTabPROVIS_PROZ.AsFloat
                else PosTabPROVIS_PROZ.AsFloat :=DM1.GetVertreterProv (ReEdiTabVERTRETER_ID.AsInteger);
            end;
            }

            PosTabMenge.Value           :=CAO_round(Menge*100)/100;

            if DM1.GetArtikelPreis (DM1.ArtInfoTabREC_ID.AsInteger,
                                    ReEdiTabADDR_ID.AsInteger,
                                    ReEdiTabPR_Ebene.Value,
                                    ReEdiTabBRUTTO_FLAG.AsBoolean,
                                    PosTabMenge.AsFloat,
                                    PR)

             then PosTabEPreis.Value :=PR;

            PosTab.Post;
          except
            PosTab.Cancel;
          end;
          Loading :=False;
          AppendOK :=False;

          DM1.ArtInfoTab.Close;
          DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2+ArtInfoSqlO;
          DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
          DM1.ArtInfoTab.Open;

          PosTab.Refresh;
     end else
     if (DM1.ArtInfoTabRec_ID.AsInteger=ID) and
        (DM1.ArtInfoTabNo_VK_Flag.Value=True) then
     begin
        MessageBeep(0);
        MessageDlg ('Dieser Artikel hat eine Verkaufssperre'+#13#10+
                    'und kann deshalb nicht verwendet werden !',mterror,[mbok],0);

        DM1.ArtInfoTab.Close;
        DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2+ArtInfoSqlO;
        DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
        DM1.ArtInfoTab.Open;
     end else
     begin
        // Hier Fehler, Artikel nicht gefunden !!!
        DM1.ArtInfoTab.Close;
        DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2+ArtInfoSqlO;
        DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
        DM1.ArtInfoTab.Open;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabAfterPost(DataSet: TDataSet);
var ID : Integer;
    N, n0, n1, n2, n3,
    M, m0, m1, m2, m3,
    B, b0, b1, b2, b3,
    P, Lohn, Ware, TKst : Double;
begin
     if PosTab.ControlsDisabled then exit;

     DM1.UpdateArtikelEdiMenge (VK_RECH_EDI,PosTabArtikel_ID.AsInteger,0);

     ID :=PosTabRec_ID.Value;
     PosTab.DisableControls;
     N :=0; N0 :=0; N1 :=0; N2 :=0; N3 :=0;
     M :=0; M0 :=0; M1 :=0; M2 :=0; M3 :=0;
     B :=0; B0 :=0; B1 :=0; B2 :=0; B3 :=0;
     P :=0;
     try
        PosTab.First;
        while not PosTab.Eof do
        begin
           N :=N+PosTabNSumme.Value;
           B :=B+PosTabBSumme.Value;
           //P :=P+PosTabPROVIS_WERT.Value;

           case PosTabSteuer_code.Value of
             0:begin N0 :=N0 + PosTabNSumme.Value; B0 :=B0 + PosTabBSumme.Value;{M0 :=M0+PosTabMSumme.Value;} end;
             1:begin N1 :=N1 + PosTabNSumme.Value; B1 :=B1 + PosTabBSumme.Value;{M1 :=M1+PosTabMSumme.Value;} end;
             2:begin N2 :=N2 + PosTabNSumme.Value; B2 :=B2 + PosTabBSumme.Value;{M2 :=M2+PosTabMSumme.Value;} end;
             3:begin N3 :=N3 + PosTabNSumme.Value; B3 :=B3 + PosTabBSumme.Value;{M3 :=M3+PosTabMSumme.Value;} end;
           end;
           PosTab.Next;
        end;

        if not ReEdiTabMWST_FREI_Flag.AsBoolean then
        begin
          if ReEdiTabBrutto_Flag.ASBoolean then
          begin
               //Bruttofakturierung
               M1 :=CAO_round(B1 / (100+ReEdiTabMwSt_1.AsFloat)*ReEdiTabMwSt_1.AsFloat*100)/100;
               M2 :=CAO_round(B2 / (100+ReEdiTabMwSt_2.AsFloat)*ReEdiTabMwSt_2.AsFloat*100)/100;
               M3 :=CAO_round(B3 / (100+ReEdiTabMwSt_3.AsFloat)*ReEdiTabMwSt_3.AsFloat*100)/100;

               M :=M0+M1+M2+M3;
               N :=B-M;
          end
             else
          begin
               // Nettofakturierung
               M1 :=CAO_round(N1*ReEdiTabMwSt_1.AsFloat)/100;
               M2 :=CAO_round(N2*ReEdiTabMwSt_2.AsFloat)/100;
               M3 :=CAO_round(N3*ReEdiTabMwSt_3.AsFloat)/100;

               M :=M0+M1+M2+M3;
               B :=N+M;
          end;
        end
           else
        begin  // MwSt-Frei ...
          M:=0;
          B :=N;
        end;

        PosTab.Refresh;

        PosTab.Locate ('REC_ID',variant(ID),[]);
     finally

        dm1.uniquery.close;
        dm1.uniquery.sql.text :='select ARTIKELTYP, SUM(EPREIS * MENGE) AS GSUM'+
                                ' from JOURNALPOS where JOURNAL_ID='+
                                Inttostr(ReEdiTabRec_ID.AsInteger)+
                                ' group by ARTIKELTYP';
        dm1.uniquery.open;

        Lohn :=0;
        Ware :=0;
        TKst :=0;

        if dm1.uniquery.locate ('ARTIKELTYP','N',[]) then Ware :=Ware + dm1.uniquery.fieldbyname ('GSUM').AsFloat;
        if dm1.uniquery.locate ('ARTIKELTYP','S',[]) then Ware :=Ware + dm1.uniquery.fieldbyname ('GSUM').AsFloat;
        if dm1.uniquery.locate ('ARTIKELTYP','V',[]) then Ware :=Ware + dm1.uniquery.fieldbyname ('GSUM').AsFloat;
        if dm1.uniquery.locate ('ARTIKELTYP','F',[]) then Ware :=Ware + dm1.uniquery.fieldbyname ('GSUM').AsFloat;
        if dm1.uniquery.locate ('ARTIKELTYP','L',[]) then Lohn :=Lohn + dm1.uniquery.fieldbyname ('GSUM').AsFloat;
        if dm1.uniquery.locate ('ARTIKELTYP','K',[]) then TKst :=TKst + dm1.uniquery.fieldbyname ('GSUM').AsFloat;

        dm1.uniquery.close;

        if (ReEdiTabNSumme.Value      <> N)or
           (ReEdiTabMSumme.Value      <> M)or
           (ReEdiTabBSumme.Value      <> B)or
           //(ReEdiTabPROVIS_WERT.Value <> P)or
           (ReEdiTabWare.Value        <> Ware)or
           (ReEdiTabLohn.Value        <> Lohn)or
           (ReEdiTabTKost.Value       <> TKst)then
        begin
           try
              if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;
              ReEdiTabNSumme.Value :=N;
              ReEdiTabMSumme.Value :=M;

              // Brutto-Wert-Rundung
              if DM1.BR_SUM_RUND_WERT>1
               then B :=CAO_Round (B*100 / DM1.BR_SUM_RUND_WERT)* DM1.BR_SUM_RUND_WERT /100;

              ReEdiTabBSumme.Value :=B;

              ReEdiTabMSumme_0.Value :=M0;
              ReEdiTabMSumme_1.Value :=M1;
              ReEdiTabMSumme_2.Value :=M2;
              ReEdiTabMSumme_3.Value :=M3;

              //ReEdiTabPROVIS_WERT.Value :=P;

              //ReEdiTabRDATUM.Value :=now;

              ReEdiTabWare.Value  :=Ware;
              ReEdiTabLohn.Value  :=Lohn;
              ReEdiTabTKost.Value :=TKst;

              ReEdiTab.Post;
           except
              ReEdiTab.Cancel;
           end;
        end;
        PosTab.EnableControls;
     end;

     DelBtn.Enabled :=PosTab.RecordCount>0;
     Positionlschen1.Enabled :=PosTab.RecordCount>0;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabAfterDelete(DataSet: TDataSet);
var bm : tBookmark;
    p  : Integer;
begin
     if PosTab.ControlsDisabled then exit; // Beleg wird gelöscht,
                                     // jetzt abbrechen da die Positionen somit
                                     // auch nicht aktualisiert werden müssen

     // Positionsnummer aktualisieren
     PosTab.DisableControls;
     BM :=PosTab.GetBookmark;
     p :=0;
     postab.first;
     while not postab.eof do
     begin
          inc(p);
          postab.edit;
          postabposition.asinteger :=p;
          postab.post;
          postab.next;
     end;
     PosTab.GotoBookmark (BM);
     PosTab.FreeBookmark (BM);
     PosTab.EnableControls;

     // Kopf aktualisieren
     PosTabAfterPost (nil);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FormCreate(Sender: TObject);
begin
     Scaled :=True;
     //ScaleBy (Screen.Width,800);
     OnUpdateStatusBar      :=nil;
     First :=True;
     EdiListTS.TabVisible  :=False;
     AdressTS.TabVisible   :=False;
     PosTS.TabVisible      :=False;
     Fertig.TabVisible     :=False;
     AppendOK              :=False;
     //InDataChange          :=False;
     LastTS                :=nil;
     LastEdiID             :=-1;
     LastPosID             :=-1;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FormDeactivate(Sender: TObject);
begin
     LastTS :=PC1.ActivePage;

     PC1Change(Sender);
     if assigned(MainForm.ArtForm) then MainForm.ArtForm.FormDeactivate (Sender);

     LastEdiID :=ReEdiTabRec_ID.AsInteger;
     ReEdiTab.Close;
     PosTab.Close;
     DM1.ReKunTab.Close;
     DM1.ArtInfoTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.GotoFertigBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=Fertig;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.GotoPosBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=PosTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditButtonClick(Sender: TObject);
begin
     if not assigned(MainForm.AddrForm) then
     begin
        MainForm.AddrForm :=TAdressForm.Create (Self{MainForm});
        with MainForm.AddrForm do
        begin
             BorderStyle :=bsSizeable;
             Height      :=500;
             Width       :=620;
             Left        :=MainForm.Left+160;
             Top         :=MainForm.Top+10;
             UebernahmeBtn.Visible :=True;
             uebernehmen1.Visible :=True;
             Button1.Cancel :=True;
             Invalidate;
        end;
     end;
     with MainForm.AddrForm do
     begin
         SearchKunnum (KuNrEdit.Text,True);
         //ShowModal;
         if Uebern then
         begin // Adresse in Rechnung überbnehmen
             SetAdresse (KSQueryRec_ID.AsInteger);
             Uebern :=False;
             FormDeactivate (Sender);
         end
            else
         begin  // Übern. abgebrochen
            ReEdiTabKUN_NUM.AsString :=LastKunNum;
         end;

         {
         ShowModal;
         if Uebern then
         begin // Adresse in Rechnung überbnehmen
             if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

             ReEdiTabADDR_ID.Value           :=KSQueryRec_ID.Value;

             if (KSQueryPR_EBENE.Value>0)and
                (KSQueryPR_EBENE.Value<=DM1.AnzPreis)
              then  ReEdiTabPR_EBENE.Value          :=KSQueryPR_EBENE.Value;

             ReEdiTabSOLL_STAGE.Value        :=KSQueryNET_Tage.Value;
             ReEdiTabSOLL_SKONTO.Value       :=KSQueryNet_Skonto.Value;
             ReEdiTabSOLL_NTAGE.Value        :=KSQueryBRT_Tage.Value;
             ReEdiTabSOLL_RATEN.Value        :=1;
             ReEdiTabSOLL_RATBETR.Value      :=0;
             ReEdiTabSOLL_RATINTERVALL.Value :=1;
             ReEdiTabKUN_ANREDE.Value        :=KSQueryAnrede.Value;
             ReEdiTabKUN_NAME1.Value         :=KSQueryName1.Value;
             ReEdiTabKUN_NAME2.Value         :=KSQueryName2.Value;
             ReEdiTabKUN_NAME3.Value         :=KSQueryName3.Value;
             ReEdiTabKUN_ABTEILUNG.Value     :=KSQueryAbteilung.Value;
             ReEdiTabKUN_STRASSE.Value       :=KSQueryStrasse.Value;
             ReEdiTabKUN_LAND.Value          :=KSQueryLand.Value;
             ReEdiTabKUN_PLZ.Value           :=KSQueryPLZ.Value;
             ReEdiTabKUN_ORT.Value           :=KSQueryOrt.Value;

             ReEdiTabGEGENKONTO.Value        :=KSQueryDEB_NUM.Value;
             ReEdiTabLiefart.Value           :=KSQueryKun_Liefart.Value;
             ReEdiTabZahlart.Value           :=KSQueryKun_Zahlart.Value;
             ReEdiTabKUN_NUM.Value           :=KSQueryKunnum1.AsString;
             ReEdiTabWAEHRUNG.Value          :=KSQueryWaerung.Value;

             ReEdiTabVERTRETER_ID.Value      :=-1;
             ReEdiTabGLOBRABATT.Value        :=KSQueryGRabatt.Value;

             ReEdiTabMWST_FREI_FLAG.Value    :=KSQueryMWST_FREI_Flag.Value;
             ReEdiTabBRUTTO_FLAG.Value       :=KSQueryBrutto_FLAG.Value;

             ReEdiTab.Post;

             Uebern :=False;
             FormDeactivate (Sender);

             // in Rechnungspositionen neue Adress_ID setzen
             DM1.UniQuery.Close;
             DM1.UniQuery.Sql.Clear;
             DM1.UniQuery.Sql.Add ('UPDATE JOURNALPOS SET ADDR_ID = '+
                                   Inttostr(ReEdiTabADDR_ID.AsInteger));
             DM1.UniQuery.Sql.Add ('WHERE JOURNAL_ID='+
                                   Inttostr(ReEdiTabRec_ID.AsInteger));
             DM1.UniQuery.ExecSql;
             DM1.UniQuery.Close;

             PosTabAfterPost(nil);

             if PosTab.Active then PosTab.Refresh;

         end;  }

     end; // with
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditEnter(Sender: TObject);
begin
     tDBEdit(sender).Color :=DM1.EditColor;//$009FFF9F;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditExit(Sender: TObject);
begin
     if (not ReEdiTabKUN_NUM.IsNull)and
        (tEdit(Sender).Name='KuNrEdit')and
        (LastKunNum<>ReEdiTabKUN_NUM.AsString)and
        (not ReEdiTab.ControlsDisabled) then
     begin
        dm1.uniquery.close;
        dm1.uniquery.sql.text :='select REC_ID, KUNNUM1 from ADRESSEN'+
                                ' where KUNNUM1="'+ReEdiTabKUN_NUM.AsString+'"';
        dm1.uniquery.open;

        if dm1.uniquery.recordcount=1 then
        begin
           SetAdresse (DM1.Uniquery.FieldByName('Rec_ID').AsInteger);
           tDBEdit(sender).Color :=clWindow;
        end
           else
        begin
           try KuNrEdit.SetFocus; except end;
           KuNrEditButtonClick (Sender);
        end;

        dm1.uniquery.close;

        if LastKunNum<>ReEdiTabKUN_NUM.AsString then KuNrEditExit(Sender);

     end else tDBEdit(sender).Color :=clWindow;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Shift=[]) and (key=33) then // PGUP
     begin
          ReEdiTab.Prior;
          key :=0;
     end else
     if (Shift=[]) and (key=34) then // PGDOWN
     begin
          ReEdiTab.Next;
          key :=0;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
          key :=#0;
          if uppercase(tControl(Sender).Name)='RECHINFOMEMO' then KuNrEdit.SetFocus
          else SendMessage (MainForm.Handle,WM_NEXTDLGCTL,0,0);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(ReEdiListGrid),'VE_EDI_LISTE',100);
     dm1.GridSaveLayout (tDBGrid(PosGrid),'VE_EDI_POS');
     DM1.WriteIntegerU ('','VE_EDI_POS_ZH',PosGrid.DefaultRowHeight);
//     DM1.WriteIntegerU ('','VE_EDI_POS_ZZ',PosGrid.LinesPerRow);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.MakeBelegeClick(Sender: TObject);
var ANZ : Integer; MO, JO, J, T, I : Word; Z : String; N : tDateTime;
begin
     Screen.Cursor :=crSqlWait;
     try
       ANZ :=0;

       ReEdiTab.DisableControls;
       PosTab.DisableControls;

       DM1.UniQuery2.Close;
       DM1.UniQuery2.Sql.Text :='SELECT REC_ID, DATUM_NEXT, INTERVALL, '+
                                'INTERVALL_NUM from VERTRAG where '+
                                'DATUM_NEXT <= NOW() and AKTIV_FLAG="Y" '+
                                'and DATUM_NEXT<DATUM_ENDE';
//       DM1.UniQuery2.RequestLive :=True;
       DM1.UniQuery2.Open;
       while not DM1.UniQuery2.eof do
       begin
          MakeRechnung (DM1.UniQuery2.FieldByName('REC_ID').AsInteger);


          DecodeDate (DM1.UniQuery2.FieldByName ('DATUM_NEXT').AsDateTime, JO, MO, T);
          Z :=DM1.UniQuery2.FieldByName ('INTERVALL').AsString;
          I :=DM1.UniQuery2.FieldByName ('INTERVALL_NUM').AsInteger;



          if Z[1] in ['Q','H','J','M'] then
          begin
            case Z[1] of
               'Q' : I :=I* 3; // Quartal
               'H' : I :=I* 6; // Halbjahr
               'J' : I :=I*12; // Jahr
            end;

            For J :=1 to I do
            begin
               inc(MO); if MO > 12 then
               begin
                  MO :=1; inc (JO);
               end;
            end;

            // Diese beiden Funktionen sind in der Unit JvJCLUtils ausgeklammert weil sie undokumentiert sind
            if T>DaysPerMonth(Jo,Mo) then t :=DaysPerMonth(Jo,Mo);

            N :=EncodeDate (Jo, Mo, T);
          end
             else
          if Z[1]='W' then
          begin
            N :=DM1.UniQuery2.FieldByName ('DATUM_NEXT').AsDateTime+
                7 {1.Woche} * I;
          end;



          DM1.UniQuery2.Edit;
          DM1.UniQuery2.FieldByName ('DATUM_NEXT').AsDateTime :=N;
          DM1.UniQuery2.Post;

          inc(ANZ);
          DM1.UniQuery2.Next;
       end;
       DM1.UniQuery2.Close;
//       DM1.UniQuery2.RequestLive :=False;
     finally
        ReEdiTab.EnableControls;
        PosTab.EnableControls;
        ReEdiTab.Sql.Text :='select * FROM VERTRAG order by VVTNUM';
        ReEdiTab.Open;
        Screen.Cursor :=crDefault;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.NeuArtBtnClick(Sender: TObject);
begin
     PC1Change(Sender);
     PosMatchButtonClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.NeuFrArtBtnClick(Sender: TObject);
var i : integer;
begin
     PC1Change(Sender);

     AppendOK :=True;
     try
        Loading :=True;

        PosTab.Append;

        PosTabArtikelTyp.Value      :='F';
        PosTabArtikel_ID.Value      :=-99;
        //PosTabArtNum.Value     :='fr. Artikel';
        PosTabMatchCode.Value       :=PosTabArtNum.Value;
        PosTabBarCode.Value         :='';
        PosTabLaenge.Value          :='';
        PosTabGroesse.Value         :='';
        PosTabDimension.Value       :='';
        PosTabGewicht.Value         :=0;
        PosTabME_Einheit.Value      :='Stück';
        PosTabPR_Einheit.Value      :=1;
        PosTabMenge.Value           :=1;
        PosTabEPreis.Value          :=0;
        PosTabRabatt.Value          :=0;
        PosTabGEGENKTO.Value        :=DM1.ReadInteger ('MAIN\KONTEN','DEF_ERLOESKTO',8400);
        PosTabBEZ_FEST_Flag.Value   :=False;
        PosTabSteuer_Code.Value     :=DM1.DefMwStCD;
        PosTabAltteil_Flag.Value    :=False;
        PosTabALTTEIL_PROZ.Value    :=0.1;
        PosTabALTTEIL_STCODE.Value  :=DM1.DefMwStCD;
        UpdateLayout;

        PosTab.Post;
     except
        PosTab.Cancel;
        AppendOK :=False;
     end;
     Loading :=False;

     PosGrid.SetFocus;

     for i:=0 to PosGrid.Columns.Count-1 do
      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.FixedCols :=i+1;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.NeuKomBtnClick(Sender: TObject);
var i : integer;
begin
     PC1Change(Sender);

     AppendOK :=True;
     try
        Loading :=True;

        PosTab.Append;

        PosTabArtikelTyp.Value :='T';
        PosTabArtikel_ID.Value :=-99;
        //PosTabArtNum.Value     :='fr. Text';
        PosTabMatchCode.Value  :=PosTabArtNum.Value;


        PosTabBarCode.Value    :='';

        PosTabLaenge.Value          :='';
        PosTabGroesse.Value         :='';
        PosTabDimension.Value       :='';
        PosTabGewicht.Value         :=0;
        PosTabME_Einheit.Value      :='';
        PosTabPR_Einheit.Value      :=1;
        PosTabMenge.Value           :=0;
        PosTabEPreis.Value          :=0;
        PosTabRabatt.Value          :=0;
        PosTabGEGENKTO.Value        :=-1;
        PosTabBEZ_FEST_Flag.Value   :=False;
        PosTabSteuer_Code.Value     :=0;
        PosTabAltteil_Flag.Value    :=False;
        PosTabALTTEIL_PROZ.Value    :=0;
        PosTabALTTEIL_STCODE.Value  :=0;

        UpdateLayout;

        PosTab.Post;
     except
        PosTab.Cancel;
        AppendOK :=False;
     end;
     Loading :=False;

     PosGrid.SetFocus;

     for i:=0 to PosGrid.Columns.Count-1 do
      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.FixedCols :=i+1;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.New1BtnClick(Sender: TObject);
begin
     ReEdiTab.DisableControls;
     ReEdiTab.Append;
     LastEdiID :=ReEdiTabRec_ID.Value;
     LastTS :=AdressTS;
     FormActivate(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PC1Change(Sender: TObject);
var Prob    : Boolean;
    S       : String;
    Dummy   : Boolean;
    I       : Integer;

begin
//     if (assigned(POsGrid.DBMemo))and
//        (PosGrid.DBMemo.Visible) and
//        (PosGrid.DBMemo.Focused)  then
//     begin
//        with PosGrid.DBMemo do
//        begin
//          Visible := False;
//          DataSource := nil;
//          DataField := '';
//        end;
//     end;


     if ReEdiTab.State in [dsEdit, dsInsert] then ReEdiTab.Post;
     if PosTab.State in [dsEdit, dsInsert] then PosTab.Post;

     if PosTab.ParamByName ('ID').Value <> ReEdiTabRec_ID.Value then
     begin
        PC1Changing (Sender, Dummy);
     end;

     Adressezuweisen1.Enabled :=PC1.ActivePage=AdressTS;

     Positionlschen1.Enabled :=(PosTab.RecordCount>0)and
                               (PC1.ActivePage=PosTS);

     Storno1.Enabled :=(ReEdiTab.RecordCount>0)and
                       ( (PC1.ActivePage=AdressTS) or
                         (PC1.ActivePage=EdiListTS)
                       );

     SichtbareSpalten1.Enabled :=(PC1.ActivePage=EdiListTS) or
                                 (PC1.ActivePage=PosTS);

     Aktualisieren1.Enabled    :=(PC1.ActivePage=EdiListTS) or
                                 (PC1.ActivePage=PosTS);

     Kopieren1.Enabled         :=(PC1.ActivePage=EdiListTS)and
                                 (ReEdiTab.RecordCount>0);

     Artikelhinzufgen1.Enabled :=PC1.ActivePage=PosTS;
     freienArtikelhinzufgen1.Enabled :=Artikelhinzufgen1.Enabled;
     Texthinzufgen1.Enabled          :=Artikelhinzufgen1.Enabled;

     AuswahlBtn.Font.Style    :=[];
     AllgemeinBtn.Font.Style  :=[];
     PositionenBtn.Font.Style :=[];
     FertigBtn.Font.Style     :=[];

     Speichernundaktivieren1.Enabled :=False;

     Vertragdeaktivieren1.Enabled :=(ReEdiTab.RecordCount>0)and
                                    (ReEdiTabAKTIV_FLAG.AsBoolean=True);

     Suchen1.Enabled :=(PC1.ActivePage=EdiListTS);

     if PC1.ActivePage=Fertig then
     begin
        KunDatGB2.Parent :=FertigTopKunPan;
        SumPan.Parent    :=FertigSumPan;

        FertigBtn.Font.Style :=[fsBold];
        Fertigstellen1.Checked :=True;

        Prob :=False;
        S    :='';

        if ReEdiTabAddr_ID.Value<0 then
        begin
             S :=S+'Kein Kunde zugewiesen'+#13#10;
             Prob :=True;
        end;
        if ReEdiTabZAHLART.Value<0 then
        begin
             S :=S+'Keine Zahlungsart zugewiesen'+#13#10;
             Prob :=True;
        end;
        if (PosTab.RecordCount=0) then
        begin
             S :=S+'Beleg hat keine Positionen'+#13#10;
             Prob :=True;
        end;

        if Prob then
        begin
          ProblemLab.Caption :=S+#13#10+'Bitte beheben Sie die oben aufgeführten Probleme !';
          ProblemLab.Font.Color :=clRed;
          MessageBeep(0);
        end
           else
        begin
          ProblemLab.Caption :='keine';
          ProblemLab.Font.Color :=clBlack;

        end;
        BuchenBtn.Enabled               :=(not Prob)and(ReEdiTabAKTIV_FLAG.AsBoolean=False);
        BuchenBtn.Visible               :=(ReEdiTabAKTIV_FLAG.AsBoolean=False);
        Speichernundaktivieren1.Enabled :=(not Prob)and(ReEdiTabAKTIV_FLAG.AsBoolean=False);

        DeaktivierenBtn.Visible         :=(ReEdiTab.RecordCount>0)and
                                          (ReEdiTabAKTIV_FLAG.AsBoolean=True);
     end
        else
     if PC1.ActivePage=EdiListTS then
     begin
        AuswahlBtn.Font.Style :=[fsBold];
        Auswahl1.Checked :=True;
     end
        else
     if PC1.ActivePage=AdressTS then
     begin
        SumPan.Parent    :=SumPan;
        AllgemeinBtn.Font.Style :=[fsBold];
        Allgemein1.Checked :=True;
     end
        else
     if PC1.ActivePage=PosTS then
     begin
        SumPan.Parent    :=PosSumPan;
        KunDatGB2.Parent :=PosTopKunPan;

        PositionenBtn.Font.Style :=[fsBold];
        Positionen1.Checked :=True;

        if PosGrid.Columns.Count>0 then
        begin
           for i:=0 to PosGrid.Columns.Count-1 do
           begin
              if (ReEdiTabBRUTTO_FLAG.AsBoolean)and
                 (uppercase(PosGrid.Columns[i].FieldName)='NSUMME') then
              begin
                 PosGrid.Columns[i].FieldName:='BSUMME';

              end
                else
              if (not ReEdiTabBRUTTO_FLAG.AsBoolean)and
                 (uppercase(PosGrid.Columns[i].FieldName)='BSUMME') then
              begin
                 PosGrid.Columns[i].FieldName:='NSUMME';
              end;

              if (ReEdiTabBRUTTO_FLAG.AsBoolean)and
                  (uppercase(PosGrid.Columns[i].FieldName)='EPREIS') then
               begin
                  PosTabEPREIS.DisplayLabel :='E-Preis'+#13#10+'Brutto';
               end
                  else
               if (not ReEdiTabBRUTTO_FLAG.AsBoolean)and
                  (uppercase(PosGrid.Columns[i].FieldName)='EPREIS') then
               begin
                  PosTabEPREIS.DisplayLabel :='E-Preis';
               end;
           end;
           PosGrid.Invalidate;
        end;
     end;
     UmschaltungBruttoNetto1.Enabled :=PC1.ActivePage=PosTS;
     MakeBelege.Enabled :=PC1.ActivePage=EdiListTS;
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PC1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
     QueryTime :=GetTickCount;
     if PosTab.ParamByName ('ID').Value<>ReEdiTabREC_ID.Value then
     begin
       if DM1.ArtInfoTab.Active then DM1.ArtInfoTab.Close;
       DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
       //DM1.ArtInfoTab.ParamByName ('AID').AsInteger :=-1;
       DM1.ArtInfoTab.Open;

       if PosTab.Active then PosTab.Close;
       PosTab.ParamByName ('ID').Value :=ReEdiTabREC_ID.Value;
       PosTab.Open;
       if (ReEdiTab.RecordCount>0)and
          ((ReEdiTabMWST_0.Value <> DM1.MWSTTab[0])or
           (ReEdiTabMWST_1.Value <> DM1.MWSTTab[1])or
           (ReEdiTabMWST_2.Value <> DM1.MWSTTab[2])or
           (ReEdiTabMWST_3.Value <> DM1.MWSTTab[3])) then
       begin
            ReEdiTab.Edit;
            try
               ReEdiTabMWST_0.Value := DM1.MWSTTab[0];
               ReEdiTabMWST_1.Value := DM1.MWSTTab[1];
               ReEdiTabMWST_2.Value := DM1.MWSTTab[2];
               ReEdiTabMWST_3.Value := DM1.MWSTTab[3];
               ReEdiTab.Post;
            except
               ReEdiTab.Cancel;
            end;
       end;
       ReEdiTabAfterPost (nil);
       PosTab.Refresh;
     end;

     QueryTime :=GetTickCount - QueryTime;
     UpdateStatus;
     //mainform.SB1.Panels[1].Text :=FormatFloat ('0.00',(GetTickCount-LastTime)/1000)+' Sek.';

     if ReEdiTab.State in [dsEdit, dsInsert] then ReEdiTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosDSDataChange(Sender: TObject; Field: TField);
begin
     {
     if (not Loading) and
        (not InDataChange) and
        (PosTab.State in [dsEdit, dsInsert])and
        (assigned(Field))and
        (
          (Field.FieldName='MENGE') or
          (Field.FieldName='EPREIS') or
          (Field.FieldName='RABATT')
        ) then
     begin
        InDataChange :=True;
        try
           PosTab.Post;
        finally
           InDataChange :=False;
        end;
     end;
     }
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosGridApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
     if (assigned(Field))and(uppercase(field.FieldName)='MENGE')and
        ((PosTabArtikelTyp.AsString='N')or(PosTabArtikelTyp.AsString='S')) then
     begin
        if PosTabMenge.Value > PosTabCalc_Lagermenge.Value
         then Canvas.Font.Color :=clRed;
     end else
     if (assigned(Field))and
        (
         (uppercase(field.FieldName)='EPREIS') or
         (uppercase(field.FieldName)='NSUMME')
        ) then
     begin
        if (PosTabMenge.Value<>0) and
           (PosTabCalc_EK.Value<>0) and
           (PosTabNSumme.Value / PosTabMenge.Value < PosTabCalc_EK.Value)
          then Canvas.Font.Color :=clRed;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_INSERT then
     begin
          key :=0;
          PosMatchButtonClick(Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosGridKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key=#13) and (PosTab.State in [dsEdit,dsInsert]) then PosTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosGridShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
     if (uppercase(PosTabARTIKELTYP.Value)='T') and
        (
         (Field.FieldName='MENGE') or
         (Field.FieldName='EPREIS') or
         (Field.FieldName='ME_EINHEIT') or
         (Field.FieldName='RABATT') or
         (Field.FieldName='STEUER_CODE')
        ) then AllowEdit :=False;
     if (Uppercase(Field.FieldName)='POSITION')or
        (Uppercase(Field.FieldName)='ARTIKELTYP')or
        (Uppercase(Field.FieldName)='MATCH_ARTNUM') then AllowEdit :=False;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosMatchButtonClick(Sender: TObject);
begin
    if not assigned(MainForm.ArtForm) then
    begin
         MainForm.ArtForm :=tArtikelForm.Create (Self{Application});
         MainForm.ArtForm.BorderStyle    :=bsSizeable;
         MainForm.ArtForm.Width  :=660;
         MainForm.Artform.Height :=520;
         MainForm.Artform.Left :=MainForm.Left + 90;
         MainForm.Artform.Top  :=MainForm.Top + 10;

         MainForm.Artform.MainMenu1.Images       :=MainForm.ImageList1;
         MainForm.Artform.ArtikelToolBar1.Images :=MainForm.ImageList1;
         MainForm.Artform.Toolbar2.Images        :=MainForm.ImageList1;

         MainForm.ArtForm.OnAddArtikel :=OnAddArtikel;
         MainForm.ArtForm.AddMengeEdi.Value :=1;

         MainForm.ArtForm.Invalidate;
    end;

    MainForm.ArtForm.F9Change (MainForm.F9);
    MainForm.ArtForm.OnAddArtikel :=OnAddArtikel;
    MainForm.ArtForm.ShowModal;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FormActivate(Sender: TObject);
var I : Integer; Dummy : Boolean;
begin
     if First then
     begin
       First :=False;

       PC1.ActivePage :=EdiListTS;

       PR_EbeneCB.Items.Clear;
       PR_EbeneCB.Values.Clear;
       For i:=1 to DM1.AnzPreis do
       begin
          PR_EbeneCB.Items.Add ('VK'+Inttostr(i));
          PR_EbeneCB.Values.Add (Inttostr(i));
       end;

       dm1.GridLoadLayout (tDBGrid(ReEdiListGrid),'VE_EDI_LISTE',100);
       dm1.GridLoadLayout (tDBGrid(PosGrid),'VE_EDI_POS');
       PosGrid.DefaultRowHeight  :=DM1.ReadIntegerU ('','VE_EDI_POS_ZH',PosGrid.DefaultRowHeight);
//       PosGrid.LinesPerRow       :=DM1.ReadIntegerU ('','VE_EDI_POS_ZZ',PosGrid.LinesPerRow);

       PosTabMATCH_ARTNUM.DisplayLabel  :='Suchbegriff'+#13#10+'Artikelnummer';

//       PosGrid.RowColor1       :=DM1.C2Color;
//       ReEdiListGrid.RowColor1 :=DM1.C2Color;
//       PosGrid.EditColor       :=DM1.EditColor;

       Loading :=False;

       QueryTime :=GetTickCount;

       ReEdiTabNSUMME.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabMSUMME.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabBSUMME.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+' "';
       PosTabCalc_RGewinn.DisplayFormat :=',#0.00 "'+DM1.LeitWaehrung+' "';
       PosTabCalc_EK.DisplayFormat      :=',#0.00 "'+DM1.LeitWaehrung+' "';
     end;


     DM1.ArtInfoTab.Close;
     DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2+ArtInfoSqlO;

     PosTab.ParamByName ('ID').Value :=-1;

     ReEdiTab.Close;
     ReEdiTab.Open;
     LastKunNum :=ReEdiTabKUN_NUM.AsString;

     PosTab.Close;
     //PosTab.Open;

     QueryTime :=GetTickCount64-QueryTime;

     ReEdiTabAfterScroll (nil);

     ButtonPan.Visible      :=ReEdiTab.RecordCount>0;
     ReEdiBtn.Enabled       :=ReEdiTab.RecordCount>0;
     BelDelBtn.Enabled      :=ReEdiTab.RecordCount>0;
     Del1Btn.Enabled        :=ReEdiTab.RecordCount>0;
     Allgemein1.Enabled     :=ReEdiTab.RecordCount>0;
     Positionen1.Enabled    :=ReEdiTab.RecordCount>0;
     Fertigstellen1.Enabled :=ReEdiTab.RecordCount>0;


     PC1.ActivePage :=PC1.Pages[0];
     PC1Change(Sender);



     if LastEdiID<>-1 then
     begin
       ReEdiTab.Locate ('REC_ID',LastEdiID,[]);
       //ReEdiTabAfterScroll(nil);
     end;

     PC1Changing(Sender,Dummy);
     if assigned(LastTS) then PC1.ActivePage :=LastTS;

     ReEdiTab.EnableControls;

     PC1Change(Sender);

     if (PC1.ActivePage=EdiListTS)and(ReEdiListGrid.Visible)
      then try ReEdiListGrid.SetFocus; except end;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
     if (sender is tSpeedButton)and
        (tSpeedButton(Sender).Enabled) then
     begin
       tSpeedButton(Sender).Transparent :=False;
       tSpeedButton(Sender).Font.Color :=clBlack;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.GotoAuswahlBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=EdiListTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.GotoAllgBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=AdressTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Del1BtnClick(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie diesen Beleg wirklich löschen ?',
                    mtconfirmation,[mbyes, mbno],0)=mryes then
     begin
        PosTab.DisableControls;
        try
          ReEdiTab.Delete;
        finally
          PosTab.EnableControls;
        end;
        FormActivate(Sender);
     end;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DelBtnClick(Sender: TObject);
begin
     PC1Change(Sender);
     PosTab.Delete;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DownBtnClick(Sender: TObject);
var CurrPos,Pos : Integer;
begin
    PC1Change(Sender);
    PosTab.DisableControls;
    DownBtn.Enabled :=False;
    try
     Pos :=PosTabPosition.Value;
     if PosTab.State in [dsEdit, dsInsert] then PosTab.Post;
     CurrPos :=PosTab.RecNo;
     if CurrPos=PosTab.RecordCount then exit;
     PosTab.Next;
     PosTab.Edit;
     PosTabPosition.Value :=CurrPos;
     PosTab.Post;
     PosTab.Prior;
     PosTab.Edit;
     PosTabPosition.Value := CurrPos+1;
     PosTab.Post;
     PosTab.Refresh;
     PosTab.Locate ('POSITION',variant (Pos+1),[]);
    finally
     PosTab.EnableControls;
     DownBtn.Enabled :=True;
    end;
    PosTabAfterScroll(nil);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DBGrid1DblClick(Sender: TObject);
var Dummy : Boolean;
begin
     if ReEdiTab.RecordCount = 0 then exit;

     PC1Changing (Sender,Dummy);

     if ReEdiTabAddr_ID.Value<0 then PC1.ActivePage :=AdressTS
                                else PC1.ActivePage :=PosTS;

     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DeaktivierenBtnClick(Sender: TObject);
begin
     if ReEdiTab.RecordCount=0 then exit;

     if not (ReEdiTab.State in [dsEdit, dsInsert]) then ReEdiTab.Edit;
     ReEdiTabAKTIV_FLAG.AsBoolean :=False;
     ReEdiTab.Post;

     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.BuchenBtnClick(Sender: TObject);
//var num : integer;
begin
     if not (ReEdiTab.State in [dsEdit, dsInsert]) then ReEdiTab.Edit;
     ReEdiTabAKTIV_FLAG.AsBoolean :=True;
     ReEdiTab.Post;

     LastTS    :=EdiListTS;
     LastEdiID :=-1;
     FormActivate(Sender);
     MainForm.FormActivate (Self);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Aktualisieren1Click(Sender: TObject);
begin
     if PC1.ActivePage=EdiListTS then
     begin
        ReEdiTab.Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
     if (sender is tSpeedButton) then
     begin
       tSpeedButton(Sender).Transparent :=True;
       tSpeedButton(Sender).Font.Color :=clWhite;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     PosTab.Close;
     ReEdiTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabAfterScroll(DataSet: TDataSet);
begin
     PosTabMenge.ReadOnly :=PosTabArtikelTyp.AsString='T';
     PosTabEPreis.ReadOnly :=PosTabArtikelTyp.AsString='T';
     PosTabBezeichnung.ReadOnly :=PosTabBEZ_FEST_FLAG.AsBoolean;

//     if (assigned(POsGrid.DBMemo))and
//        (PosGrid.DBMemo.Visible) and
//        (PosGrid.DBMemo.Focused)  then
//     begin
//        with PosGrid.DBMemo do
//        begin
//          Visible := False;
//          DataSource := nil;
//          DataField := '';
//        end;
//    end;

     if PosTab.ControlsDisabled then exit;
     UpdateLayout;

     UpdateStatus;
     DelBtn.Enabled :=PosTab.RecordCount>0;
     Positionlschen1.Enabled :=PosTab.RecordCount>0;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabBeforeDelete(DataSet: TDataSet);
begin
     // Reservierte Menge im Artikel aktualisieren
     DM1.UpdateArtikelEdiMenge (VK_WKRE_EDI,
                                PosTabArtikel_ID.AsInteger,
                                PosTabMenge.AsFloat);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabBeforeEdit(DataSet: TDataSet);
begin
     try
        ReEdiTab.Edit;
        // Wenn hier ein fehler auftritt, dann ist evtl. der
        // Datenssatz durch anderen Anwender gesperrt !!!
     except
        Abort;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabBeforeInsert(DataSet: TDataSet);
begin
     if not AppendOK then
     begin
        MessageBeep(0);
        Abort;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabBeforePost(DataSet: TDataSet);
begin
     if PosTabArtikel_ID.Value=0 then
     begin
          try
             Abort;
          finally
             PosTab.Cancel;
          end;
     end;
     if (PosTabArtikelTyp.Value='T') then
     begin
          PosTabMenge.Value       :=0;
          PosTabME_EInheit.Value  :='';
          PosTabPR_Einheit.Value  :=0;
          PosTabEPreis.Value      :=0;
          PosTabE_RGewinn.Value   :=0;
          PosTabRabatt.Value      :=0;
          //PosTabSteuer_Proz.Value :=0;
          PosTabSteuer_Code.Value :=0;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabCalcFields(DataSet: TDataSet);
var Summe   : Double;
    Steuer  : Double;
    PR      : Double;
    S       : String;
begin
     Summe :=PosTabEPreis.Value * PosTabMenge.Value;
     if PosTabRabatt.Value <> 0
      then Summe :=Summe - Summe * PosTabRabatt.Value / 100;

     Case PosTabSteuer_Code.Value of
        0: Steuer :=ReEdiTabMwst_0.Value;
        1: Steuer :=ReEdiTabMwst_1.Value;
        2: Steuer :=ReEdiTabMwst_2.Value;
        3: Steuer :=ReEdiTabMwst_3.Value;
        else Steuer :=0;
     end;

     PosTabCALC_STEUERPORZ.AsFloat :=Steuer;

     if not ReEdiTabBrutto_Flag.AsBoolean then
     begin
        PosTabNSumme.Value :=CAO_round(Summe*100)/100;  // Auf ganze Pfennige Runden
        PosTabMSumme.Value :=CAO_round(Summe * (Steuer / 100) *100)/100; // Auf ganze Pfennige Runden
        PosTabBSumme.Value :=PosTabNSumme.Value+PosTabMSumme.Value;
     end
        else
     begin
        PosTabBSumme.Value :=CAO_round(Summe*100)/100;  // Auf ganze Pfennige Runden
        PosTabMSumme.Value :=CAO_round(Summe / (100 + Steuer) * Steuer * 100)/100; // Auf ganze Pfennige Runden
        PosTabNSumme.Value :=PosTabBSumme.Value-PosTabMSumme.Value;
     end;


     if (ReEdiTabMWST_FREI_FLAG.AsBoolean=False)and(Steuer <> 0)
      then PosTabMwst.Value :=FormatFloat ('0.0"%"',Steuer)
      else PosTabMwst.Value :='-';

     if PosTabArtikelTyp.Value='N' then
     begin
       PosTabMATCH_ARTNUM.Value :=PosTabMATCHCODE.AsString+#13#10+
                                  PosTabARTNUM.AsString;
     end else
     if PosTabARTIKELTYP.Value='F' then
     begin
       PosTabMATCH_ARTNUM.Value :='freier Artikel'+#13#10+
                                  PosTabMatchCode.Value+#13#10+
                                  PosTabArtNum.Value;;
     end
     else PosTabMATCH_ARTNUM.Value :='';

     if (PosTabArtikelTyp.Value<>'F')and
        (PosTabArtikelTyp.Value<>'T')and
        (PosTabArtikelTyp.Value<>'')and
        (PosTabArtikel_ID.Value>0)and
        (not Loading)and
        (DM1.ArtInfoTab.Active) then
     begin
         if (DM1.ArtInfoTab.RecordCount>0)and
            (DM1.ArtInfoTab.Locate ('REC_ID',PosTabArtikel_ID.Value,[])) then
         begin
              //ALT PosTabCalc_EK.Value :=ArtInfoTabEK_Preis.Value;
              if DM1.ArtInfoTabRABGRP_ID.AsString<>'-' then
              begin
                case DM1.AnzPreis of
                         1: PR :=DM1.ArtInfoTabVK1.Value;
                         2: PR :=DM1.ArtInfoTabVK2.Value;
                         3: PR :=DM1.ArtInfoTabVK3.Value;
                         4: PR :=DM1.ArtInfoTabVK4.Value;
                       else PR :=DM1.ArtInfoTabVK5.Value;
                end;
                DM1.CalcRabGrpPreis (DM1.ArtInfoTabRABGRP_ID.AsString,0{EK},PR);
                PosTabCalc_EK.Value := PR;

              end else PosTabCalc_EK.Value :=DM1.ArtInfoTabEK_Preis.Value;


              if (PosTabArtikelTyp.AsString='N')or(PosTabArtikelTyp.AsString='S') then
              begin
                S :='Lager : '+FormatFloat (',#0.00',DM1.ArtInfoTabMenge_AKT.Value);
                if DM1.ArtInfoTabMENGE_BESTELLT.Value>0
                 then S :=S+' Bestellt : '+FormatFloat (',#0.00',DM1.ArtInfoTabMENGE_BESTELLT.AsFloat);

                S :=S+' Benötigt : '+FormatFloat (',#0.00',DM1.ArtInfoTabMENGE_RESERVIERT.AsFloat);
              end
              else S:='';



              PosTabCalc_Lagermenge_Str.Value :=S;

              PosTabCalc_Lagermenge.Value :=DM1.ArtInfoTabMenge_AKT.Value;

              PosTabCalc_RGewinn.Value :=PosTabNSumme.Value - PosTabCalc_EK.Value * PosTabMenge.Value;
         end;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabNewRecord(DataSet: TDataSet);
begin
     PosTabJournal_ID.Value  :=ReEdiTabRec_ID.Value;
     PosTabAddr_ID.Value     :=ReEdiTabAddr_ID.Value;
     PosTabVVTNUM.Value      :=ReEdiTabVVTNUM.Value;
     PosTabRabatt.Value      :=ReEdiTabGlobRabatt.Value;
     PosTabPosition.Value    :=PosTab.RecordCount+1;
     PosTabE_RGewinn.Value   :=0;
     PosTabBrutto_Flag.Value :=ReEdiTabBRUTTO_FLAG.Value;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiBtnClick(Sender: TObject);
begin
     DBGrid1DblClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiDSDataChange(Sender: TObject; Field: TField);
begin
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabAfterEdit(DataSet: TDataSet);
begin
     ReEdiTabAKTIV_FLAG.AsBoolean :=False;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabAfterPost(DataSet: TDataSet);
begin
     BelDelBtn.Enabled :=ReEdiTab.RecordCount>0;
     Del1Btn.Enabled :=ReEdiTab.RecordCount>0;

     //Ansprechpartner in Drop-Down-Liste laden
     //nur Ausführen wenn ein Belegwechsel stattgefunden hat
     if (PC1.ActivePage<>EdiListTS) and
        (PosTab.ParamByName ('ID').Value<>ReEdiTabREC_ID.Value ) then
     begin
         UpdateAnsprechpartner;
     end;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabAfterScroll(DataSet: TDataSet);
begin
     ReEdiTabAfterPost (nil);

     try
        if ReEdiTabKUN_NUM.IsNull
         then LastKunNum :=''
         else LastKunNum :=ReEdiTabKUN_NUM.AsString;
     except
        LastKunNum :='';
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabBeforeClose(DataSet: TDataSet);
begin
     if DataSet.State in [dsEdit, dsInsert] then
     begin
         try
           DataSet.Post;
         except
           Dataset.Cancel;
         end;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabBeforeDelete(DataSet: TDataSet);
begin
     // evt. vorhandene Positionen löschen
     if PosTab.Active then PosTab.Close;
     PosTab.ParamByName ('ID').Value :=ReEdiTabREC_ID.Value;
     PosTab.Open;
     while not PosTab.EOF do
     begin
       PosTab.Delete;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
     if ReEdiTabVVTNUM.Value<1
      then ReEdiTabVVTNUM.Value :=DM1.IncNummer (VK_WKRE_EDI);

     if (ReEdiTabADDR_ID.Value>=0)and
        (
         (ReEdiTabKUN_NUM.AsString='') or
         (ReEdiTabKUN_NUM.AsString='0')
        ) then
     begin
        DM1.ReKunTab.Close;
        DM1.ReKunTab.ParamByName('ID').AsInteger :=ReEdiTabADDR_ID.Value;
        DM1.ReKunTab.Open;
        if DM1.ReKunTab.RecordCount=1 then
        begin
           if length(DM1.ReKunTab.FieldByName('KUNNUM1').AsString)=0 then
           begin
             DM1.ReKunTab.Edit;
             try
                DM1.ReKunTab.FieldByName('KUNNUM1').AsString :=DM1.IncNummerStr (KUNNUM_KEY);
                DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger :=DM1.IncNummer (DEB_NUM_KEY);
                    //DM1.ReKunTab.FieldByName('KUNNUM1').AsInteger+DEBI_KTOBASIS;

                // Bitcodiertes Flag für "ist Kunde" setzen
                DM1.ReKunTab.FieldByName('STATUS').AsInteger :=
                    DM1.ReKunTab.FieldByName('STATUS').AsInteger or 1;

                DM1.ReKunTab.Post;
             except
                DM1.ReKunTab.Cancel;
             end;
           end;
        end;

        ReEdiTabKUN_NUM.Value :=DM1.ReKunTab.FieldByName('KUNNUM1').AsString;
        ReEdiTabGegenkonto.Value :=DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger;

        DM1.ReKunTab.Close;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabCalcFields(DataSet: TDataSet);
begin
     if ReEdiTabDATUM_NEXT.AsDateTime < ReEdiTabDATUM_ENDE.AsDateTime
      then ReEdiTabCALC_DATUM_NEXT.AsString :=
            FormatDateTime ('dd.mm.yyyy', ReEdiTabDATUM_NEXT.AsDateTime)
      else ReEdiTabCALC_DATUM_NEXT.AsString :='---';
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabOnNewRecord(DataSet: TDataSet);
var Dummy    : Boolean;
begin
     ReEdiTabGegenKonto.Value   :=-1;
     ReEdiTabADDR_ID.Value      :=-1;
     ReEdiTabPR_Ebene.Value     :=DM1.AnzPreis;
     ReEdiTabKOST_NETTO.Value   :=0;
     ReEdiTabWERT_NETTO.Value   :=0;
     ReEdiTabLOHN.Value         :=0;
     ReEdiTabWARE.Value         :=0;
     ReEdiTabTKOST.Value        :=0;
     ReEdiTabNSUMME.Value       :=0;
     ReEdiTabMSUMME.Value       :=0;
     ReEdiTabBSUMME.Value       :=0;
     ReEdiTabATMSUMME.Value     :=0;
     ReEdiTabWaehrung.Value     :=DM1.LeitWaehrung;
     ReEdiTabVertreter_ID.Value :=-1;
     ReEdiTabGlobRabatt.Value   :=0;
     ReEdiTabLiefart.Value      :=-1;
     ReEdiTabZahlArt.Value      :=-1;

     ReEdiTabErstellt.AsDateTime:=now;
     ReEdiTabERST_NAME.Value    :=DM1.View_User;

     ReEdiTabMWST_0.Value       :=DM1.MWSTTab[0];
     ReEdiTabMWST_1.Value       :=DM1.MWSTTab[1];
     ReEdiTabMWST_2.Value       :=DM1.MWSTTab[2];
     ReEdiTabMWST_3.Value       :=DM1.MWSTTab[3];

     ReEdiTabDATUM_START.AsDateTime:=Now;
     ReEdiTabDATUM_ENDE.AsDateTime :=EncodeDate (2099,12,31);
     ReEdiTabDATUM_NEXT.AsDateTime :=Now+1;
     ReEdiTabAKTIV_FLAG.Value      :=False;
     ReEdiTabPRINT_FLAG.Value      :=False;

     LastKunNum                    :='';

     if (ReEdiTab.State in [dsEdit,dsInsert]) then
     begin
       try
         ReEdiTab.Post;
       except
         ReEdiTab.Cancel;
       end;
     end;

     //PC1.ActivePage :=AdressTS;
     //PC1Changing (Self,Dummy);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.SichtbareSpalten1Click(Sender: TObject);
begin
     if PC1.ActivePage = EdiListTS
      then VisibleSpaltenForm.UpdateTable (tDBGrid(ReEdiListGrid))
      else
     if PC1.ActivePage= PosTS
      then VisibleSpaltenForm.UpdateTable (tDBGrid(PosGrid));
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Suchen1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UmschaltungBruttoNetto1Click(Sender: TObject);
var CurrPos : Integer;
    Brutto  : Boolean;
    MwSt    : Double;
begin
     if PosTab.RecordCount>0 then
     begin
        PC1Change(Sender);
        PosTab.DisableControls;
        try
         if PosTab.State in [dsEdit, dsInsert] then PosTab.Post;


         if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

         Brutto :=not ReEdiTabBRUTTO_FLAG.AsBoolean;
         ReEdiTabBRUTTO_FLAG.AsBoolean :=Brutto;


         CurrPos :=PosTabPosition.Value;

         PosTab.First;
         while not PosTab.Eof do
         begin
           if PosTabSTEUER_CODE.AsInteger>0 then
           begin
             PosTab.Edit;

             PosTabBrutto_Flag.Value :=Brutto;

             case PosTabSTEUER_CODE.AsInteger of
                 1: MwSt :=ReEdiTabMWST_1.AsFloat;
                 2: MwSt :=ReEdiTabMWST_2.AsFloat;
                 3: MwSt :=ReEdiTabMWST_3.AsFloat;
               else MwSt :=ReEdiTabMWST_0.AsFloat;
             end;

             if Brutto
              then PosTabEPREIS.Value :=CAO_round
                                        ( (PosTabEPREIS.Value +
                                          PosTabEPREIS.Value / 100 *
                                          MwSt) * 100
                                        ) / 100
              else PosTabEPREIS.Value :=CAO_round
                                        ( PosTabEPREIS.Value /
                                          (100+MwSt)*100 * 100
                                        ) / 100;
             PosTab.Post;
           end;
           PosTab.Next;
         end;
         PosTab.Refresh;
         PosTab.Locate ('POSITION',variant (CurrPos),[]);
        finally
         PosTab.EnableControls;
         PosTabAfterPost (nil);
        end;
        PosTabAfterScroll(nil);

        if ReEdiTabBrutto_Flag.AsBoolean
         then ReEdiTopLab.Caption :='  Rechnung bearbeiten ... (BRUTTO)'
         else ReEdiTopLab.Caption :='  Rechnung bearbeiten ...';

        PC1Change(Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UpBtnClick(Sender: TObject);
var CurrPos,Pos : Integer;
begin
    PC1Change(Sender);
    UpBtn.Enabled :=False;
    PosTab.DisableControls;
    try
     Pos :=PosTabPosition.Value;
     if PosTab.State in [dsEdit, dsInsert] then PosTab.Post;
     CurrPos :=PosTab.RecNo;
     if CurrPos=1 then exit;
     PosTab.Prior;
     PosTab.Edit;
     PosTabPosition.Value :=CurrPos;
     PosTab.Post;
     PosTab.Next;
     PosTab.Edit;
     PosTabPosition.Value := CurrPos-1;
     PosTab.Post;
     PosTab.Refresh;
     PosTab.Locate ('POSITION',variant (Pos-1),[]);
    finally
     PosTab.EnableControls;
     UpBtn.Enabled :=True;
    end;
    PosTabAfterScroll(nil);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UpdateLayout;
begin
     UpBtn.Enabled :=PosTab.RecNo>1;
     DownBtn.Enabled :=PosTab.RecNo<PosTab.RecordCount;
end;

procedure TMakeVertragReForm.UpdateStatus;
begin

end;

//------------------------------------------------------------------------------
//                            MAKE RECHNUNG                Liefert Rec-ID zurück
//------------------------------------------------------------------------------
function TMakeVertragReForm.MakeRechnung (SRC_ID:Integer): Integer;
var id,i : integer;
    num  : integer;
    Dest : Integer;
    w    : string;

    ZVON, ZBIS : tDateTime;
    ZeitStr    : String;
    Z,S        : String;
    J,M,T      : Word;
    K          : Word;

const PH : String = '%ZEITRAUM%';

begin
     Result :=-1;

     Dest :=VK_RECH_EDI;

     ReEdiTab.Close;
     ReEdiTab.Sql.Text :='select * FROM VERTRAG where REC_ID='+IntToStr(SRC_ID);
     ReEdiTab.Open;
     if ReEdiTab.RecordCount<>1 then
     begin
        ReEdiTab.Close;
        ReEdiTab.Sql.Text :='select * FROM VERTRAG order by VVTNUM';
        exit;
     end;

     // Zeitraum berechnen
     DecodeDate (ReEdiTabDATUM_NEXT.AsDateTime,J,M,T);

     if (ReEdiTabINTERVALL.AsString='M') and
        (ReEdiTabINTERVALL_NUM.AsInteger=1) then
     begin
        ZeitStr :=LongMonthNames[m]+' '+IntToStr(J);
     end
        else
     begin
        Z :=ReEdiTabINTERVALL.AsString;
        I :=ReEdiTabINTERVALL_NUM.AsInteger;

        if Z[1] in ['Q','H','J','M'] then
        begin
          case Z[1] of
               'Q' : I :=I* 3;
               'H' : I :=I* 6;
               'J' : I :=I*12;
          end;

          ZVon :=EncodeDate (J,M,1);

          for K:=1 to I do
          begin
             inc(M); if M > 12 then
             begin
                M :=1; inc (J);
             end;
          end;

          ZBis :=EncodeDate (J,M,1)-1;
        end
           else
        if Z[1]='W' then
        begin
          ZVon :=FirstDayOfWeek (ReEdiTabDATUM_NEXT.AsDateTime);
          ZBis :=LastDayOfWeek  (ReEdiTabDATUM_NEXT.AsDateTime);

        end;
        ZeitStr :=FormatDateTime ('dd.mm.yyyy',ZVon)+' bis '+
                  FormatDateTime ('dd.mm.yyyy',ZBis);

     end;

     NUM :=DM1.IncNummer (Dest);

     DM1.CpyDstKopfTab.Open;
     DM1.CpyDstKopfTab.Append;

     W :=DM1.LeitWaehrung;

     DM1.CpyDstKopfTabQUELLE.Value        :=Dest;
     //DM1.CpyDstKopfTabJAHR.Value          :=0;
     DM1.CpyDstKopfTabQUELLE_SUB.Value    :=0;

     DM1.CpyDstKopfTabATRNUM.Value        :=-1;
     DM1.CpyDstKopfTabLief_Addr_ID.Value  :=-1;

     DM1.CpyDstKopfTabVRENUM.Value        :=num;
     DM1.CpyDstKopfTabVLSNUM.Value        :=-1;
     DM1.CpyDstKopfTabFOLGENR.Value       :=-1;
     DM1.CpyDstKopfTabKM_STAND.Value      :=-1;
     DM1.CpyDstKopfTabADATUM.AsDateTime   :=0;
     DM1.CpyDstKopfTabRDATUM.AsDateTime   :=Now;
     DM1.CpyDstKopfTabLDATUM.AsDateTime   :=0;
     DM1.CpyDstKopfTabTermin.AsDateTime   :=0;
     DM1.CpyDstKopfTabKOST_NETTO.Value    :=DM1.Calcleitwaehrung(ReEdiTabKOST_NETTO.AsFloat,w);
     DM1.CpyDstKopfTabWERT_NETTO.Value    :=DM1.CalcLeitWaehrung(ReEdiTabWERT_NETTO.AsFloat,W);
     DM1.CpyDstKopfTabLOHN.Value          :=DM1.CalcLeitWaehrung(ReEdiTabLOHN.AsFloat,W);
     DM1.CpyDstKopfTabWARE.Value          :=DM1.CalcLeitWaehrung(ReEdiTabWARE.AsFloat,W);
     DM1.CpyDstKopfTabTKOST.Value         :=DM1.CalcLeitWaehrung(ReEdiTabTKOST.AsFloat,W);

     DM1.CpyDstKopfTabADDR_ID.Value       :=ReEdiTabADDR_ID.Value;
     DM1.CpyDstKopfTabKFZ_ID.Value        :=-1;
     DM1.CpyDstKopfTabVERTRETER_ID.Value  :=ReEdiTabVERTRETER_ID.Value;
     DM1.CpyDstKopfTabGLOBRABATT.Value    :=ReEdiTabGLOBRABATT.Value;

     DM1.CpyDstKopfTabPR_EBENE.Value      :=ReEdiTabPR_EBENE.Value;
     DM1.CpyDstKopfTabLIEFART.Value       :=ReEdiTabLIEFART.Value;
     DM1.CpyDstKopfTabZAHLART.Value       :=ReEdiTabZAHLART.Value;

     DM1.CpyDstKopfTabMWST_0.Value        :=ReEdiTabMWST_0.Value;
     DM1.CpyDstKopfTabMWST_1.Value        :=ReEdiTabMWST_1.Value;
     DM1.CpyDstKopfTabMWST_2.Value        :=ReEdiTabMWST_2.Value;
     DM1.CpyDstKopfTabMWST_3.Value        :=ReEdiTabMWST_3.Value;

     DM1.CpyDstKopfTabNSUMME.Value        :=DM1.CalcLeitWaehrung(ReEdiTabNSUMME.AsFloat,W);
     DM1.CpyDstKopfTabMSUMME_0.Value      :=DM1.CalcLeitWaehrung(ReEdiTabMSUMME_0.AsFloat,W);
     DM1.CpyDstKopfTabMSUMME_1.Value      :=DM1.CalcLeitWaehrung(ReEdiTabMSUMME_1.AsFloat,W);
     DM1.CpyDstKopfTabMSUMME_2.Value      :=DM1.CalcLeitWaehrung(ReEdiTabMSUMME_2.AsFloat,W);
     DM1.CpyDstKopfTabMSUMME_3.Value      :=DM1.CalcLeitWaehrung(ReEdiTabMSUMME_3.AsFloat,W);
     DM1.CpyDstKopfTabMSUMME.Value        :=DM1.CalcLeitWaehrung(ReEdiTabMSUMME.AsFloat,W);
     DM1.CpyDstKopfTabBSUMME.Value        :=DM1.CalcLeitWaehrung(ReEdiTabBSUMME.AsFloat,W);
     DM1.CpyDstKopfTabATSUMME.Value       :=DM1.CalcLeitWaehrung(ReEdiTabATSUMME.AsFloat,W);
     DM1.CpyDstKopfTabATMSUMME.Value      :=DM1.CalcLeitWaehrung(ReEdiTabATMSUMME.AsFloat,W);

     DM1.CpyDstKopfTabWAEHRUNG.Value      :=W;
     DM1.CpyDstKopfTabGEGENKONTO.Value    :=ReEdiTabGEGENKONTO.Value;
     DM1.CpyDstKopfTabSOLL_STAGE.Value    :=ReEdiTabSOLL_STAGE.Value;
     DM1.CpyDstKopfTabSOLL_SKONTO.Value   :=ReEdiTabSOLL_SKONTO.Value;
     DM1.CpyDstKopfTabSOLL_NTAGE.Value    :=ReEdiTabSOLL_NTAGE.Value;
     DM1.CpyDstKopfTabSOLL_RATEN.Value    :=ReEdiTabSOLL_RATEN.Value;

     DM1.CpyDstKopfTabSOLL_RATBETR.Value  :=DM1.CalcLeitWaehrung(ReEdiTabSOLL_RATBETR.AsFloat,W);

     DM1.CpyDstKopfTabSOLL_RATINTERVALL.Value :=ReEdiTabSOLL_RATINTERVALL.Value;

     DM1.CpyDstKopfTabIST_ANZAHLUNG.Value     :=0;
     DM1.CpyDstKopfTabIST_ZAHLDAT.AsDateTime  :=0;
     DM1.CpyDstKopfTabMAHNKOSTEN.Value        :=0;
     DM1.CpyDstKopfTabKONTOAUSZUG.Value       :=-1;
     DM1.CpyDstKopfTabBANK_ID.Value           :=-1;
     DM1.CpyDstKopfTabSTADIUM.Value           :=6;
     DM1.CpyDstKopfTabFREIGABE1_Flag.Value    :=False;
     DM1.CpyDstKopfTabERSTELLT.AsDateTime     :=Now;
     DM1.CpyDstKopfTabERST_NAME.Value         :=DM1.View_User;
     DM1.CpyDstKopfTabKUN_NUM.Value           :=ReEdiTabKUN_NUM.Value;
     DM1.CpyDstKopfTabKUN_ANREDE.Value        :=ReEdiTabKUN_ANREDE.Value;
     DM1.CpyDstKopfTabKUN_NAME1.Value         :=ReEdiTabKUN_NAME1.Value;
     DM1.CpyDstKopfTabKUN_NAME2.Value         :=ReEdiTabKUN_NAME2.Value;
     DM1.CpyDstKopfTabKUN_NAME3.Value         :=ReEdiTabKUN_NAME3.Value;
     DM1.CpyDstKopfTabKUN_ABTEILUNG.Value     :=ReEdiTabKUN_ABTEILUNG.Value;
     DM1.CpyDstKopfTabKUN_STRASSE.Value       :=ReEdiTabKUN_STRASSE.Value;
     DM1.CpyDstKopfTabKUN_LAND.Value          :=ReEdiTabKUN_LAND.Value;
     DM1.CpyDstKopfTabKUN_PLZ.Value           :=ReEdiTabKUN_PLZ.Value;
     DM1.CpyDstKopfTabKUN_ORT.Value           :=ReEdiTabKUN_ORT.Value;
     DM1.CpyDstKopfTabUSR1.Value              :=ReEdiTabUSR1.Value;
     DM1.CpyDstKopfTabUSR2.Value              :=ReEdiTabUSR2.Value;
     DM1.CpyDstKopfTabPROJEKT.Value           :=ReEdiTabPROJEKT.Value;
     DM1.CpyDstKopfTabORGNUM.Value            :=ReEdiTabORGNUM.Value;
     DM1.CpyDstKopfTabBEST_NAME.Value         :=ReEdiTabBEST_NAME.Value;
     DM1.CpyDstKopfTabBEST_CODE.Value         :=ReEdiTabBEST_CODE.Value;
     DM1.CpyDstKopfTabINFO.AsString           :=ReEdiTabINFO.AsString;
     DM1.CpyDstKopfTabBEST_DATUM.Value        :=ReEdiTabBEST_DATUM.Value;
     DM1.CpyDstKopfTabUW_NUM.Value            :=-1;
     DM1.CpyDstKopfTabBRUTTO_FLAG.Value       :=ReEdiTabBRUTTO_FLAG.Value;

     DM1.CpyDstKopfTab.Post;

     ID :=DM1.CpyDstKopfTabREC_ID.Value;

     PosTab.Close;
     PosTab.ParamByName ('ID').AsInteger :=ReEdiTabRec_ID.AsInteger;;
     PosTab.Open;

     DM1.CpyDstPosTab.Open;

     while not PosTab.Eof do
     begin
          DM1.CpyDstPosTab.Append;

          for i:=0 to PosTab.Fields.Count-1 do
          begin
           if (uppercase(PosTab.Fields[i].FieldName)<>'REC_ID') and
              (uppercase(PosTab.Fields[i].FieldName)<>'VVTNUM') and
              (PosTab.Fields[i].FieldKind=fkData)
            then  DM1.CpyDstPosTab.FieldByName (PosTab.Fields[i].FieldName).Value :=
                     PosTab.Fields[i].Value;
          end;
          DM1.CpyDstPosTab.FieldByName('VRENUM').Value     :=num;
          DM1.CpyDstPosTab.FieldByName('QUELLE').Value     :=Dest;
          DM1.CpyDstPosTab.FieldByName('QUELLE_SUB').Value :=0;
          DM1.CpyDstPosTab.FieldByName('JOURNAL_ID').Value :=ID;
          DM1.CpyDstPosTab.FieldByName('GEBUCHT').Value    :=False;
          DM1.CpyDstPosTab.FieldByName('EPREIS').Value     :=DM1.CalcLeitwaehrung(PosTab.FieldByName('EPREIS').AsFloat,W);
          DM1.CpyDstPosTab.FieldByName('E_RGEWINN').Value  :=DM1.CalcLeitwaehrung(PosTab.FieldByName('E_RGEWINN').AsFloat,W);


          S :=DM1.CpyDstPosTab.FieldByName('BEZEICHNUNG').AsString;
          if Pos (PH,S)>0 then
          begin
              K :=Pos (PH,S);
              Delete (S,K,length(PH));
              Insert (ZeitStr,S,K);
              DM1.CpyDstPosTab.FieldByName('BEZEICHNUNG').AsString :=S;
          end;

          DM1.CpyDstPosTab.Post;

          // EDI-Mengen aktualisieren
          DM1.UpdateArtikelEdiMenge
            (Dest, DM1.CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger, 0);

          PosTab.Next;
     end;

     PosTab.Close;
     DM1.CpyDstPosTab.Close;
     DM1.CpyDstKopfTab.Close;
     ReEdiTab.Close;

     Result :=ID;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FindDialog1Find(Sender: TObject);
var f,t : string;
    i : integer;
    Found : Boolean;
begin
     i :=ReEdiListGrid.FixedCols;
     f :=ReEdiListGrid.Columns[i-1].FieldName;
     t :=MainForm.FindDialog1.FindText;
     Found :=False;
     if frDown in MainForm.FindDialog1.Options then ReEdiTab.Next
                                               else ReEdiTab.Prior;
     repeat
           if frMatchCase in MainForm.FindDialog1.Options then
           begin
                // Groß- und Kleinschreibung beachten
                Found :=Pos (t,ReEdiTab.FieldByName(f).AsString)>0;
           end
              else
           begin
                // Groß- und Kleinschreibung nicht beachten
                Found :=Pos (uppercase(t),uppercase(ReEdiTab.FieldByName(f).AsString))>0;
           end;

           if not Found then
           begin
             if frDown in MainForm.FindDialog1.Options then ReEdiTab.Next
                                                       else ReEdiTab.Prior;
           end;
     until (ReEdiTab.Eof)or(ReEdiTab.Bof)or(Found);
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.SetAdresse (ID : Integer);
begin
     DM1.ReKunTab.Close;
     DM1.ReKunTab.ParamByName('ID').AsInteger :=ID;
     DM1.ReKunTab.Open;

     if DM1.ReKunTab.RecordCount=1 then
     begin
         if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

         ReEdiTabADDR_ID.Value           :=DM1.ReKunTab.FieldByName('Rec_ID').AsInteger;

         if (DM1.ReKunTab.FieldByName('PR_EBENE').Value>0)and
            (DM1.ReKunTab.FieldByName('PR_EBENE').Value<=DM1.AnzPreis)
          then  ReEdiTabPR_EBENE.Value          :=DM1.ReKunTab.FieldByName('PR_EBENE').Value;

         ReEdiTabSOLL_STAGE.Value        :=DM1.ReKunTab.FieldByName('NET_Tage').AsInteger;
         ReEdiTabSOLL_SKONTO.Value       :=DM1.ReKunTab.FieldByName('Net_Skonto').AsFloat;
         ReEdiTabSOLL_NTAGE.Value        :=DM1.ReKunTab.FieldByName('BRT_Tage').AsInteger;
         ReEdiTabSOLL_RATEN.Value        :=1;
         ReEdiTabSOLL_RATBETR.Value      :=0;
         ReEdiTabSOLL_RATINTERVALL.Value :=1;
         ReEdiTabKUN_ANREDE.Value        :=DM1.ReKunTab.FieldByName('Anrede').AsString;
         ReEdiTabKUN_NAME1.Value         :=DM1.ReKunTab.FieldByName('Name1').AsString;
         ReEdiTabKUN_NAME2.Value         :=DM1.ReKunTab.FieldByName('Name2').AsString;
         ReEdiTabKUN_NAME3.Value         :=DM1.ReKunTab.FieldByName('Name3').AsString;
         ReEdiTabKUN_ABTEILUNG.Value     :=DM1.ReKunTab.FieldByName('Abteilung').AsString;
         ReEdiTabKUN_STRASSE.Value       :=DM1.ReKunTab.FieldByName('Strasse').AsString;
         ReEdiTabKUN_LAND.Value          :=DM1.ReKunTab.FieldByName('Land').AsString;
         ReEdiTabKUN_PLZ.Value           :=DM1.ReKunTab.FieldByName('PLZ').AsString;
         ReEdiTabKUN_ORT.Value           :=DM1.ReKunTab.FieldByName('Ort').AsString;

         ReEdiTabGEGENKONTO.Value        :=DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger;
         ReEdiTabLiefart.Value           :=DM1.ReKunTab.FieldByName('Kun_Liefart').AsInteger;
         ReEdiTabZahlart.Value           :=DM1.ReKunTab.FieldByName('Kun_Zahlart').AsInteger;
         ReEdiTabKUN_NUM.Value           :=DM1.ReKunTab.FieldByName('Kunnum1').AsString;
         ReEdiTabWAEHRUNG.Value          :=DM1.ReKunTab.FieldByName('Waerung').AsString;

         ReEdiTabVERTRETER_ID.Value      :=DM1.ReKunTab.FieldByName('VERTRETER_ID').AsInteger;
         ReEdiTabGLOBRABATT.Value        :=DM1.ReKunTab.FieldByName('GRabatt').AsFloat;

         ReEdiTabMWST_FREI_FLAG.Value    :=DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean;
         ReEdiTabBRUTTO_FLAG.Value       :=DM1.ReKunTab.FieldByName('Brutto_FLAG').AsBoolean;

         ReEdiTab.Post;

         LastKunNum                      :=ReEdiTabKUN_NUM.AsString;

         UpdateAnsprechpartner;

         // in Rechnungspositionen neue Adress_ID setzen
         DM1.UniQuery.Close;
         DM1.UniQuery.Sql.Clear;
         DM1.UniQuery.Sql.Add ('UPDATE JOURNALPOS SET ADDR_ID = '+
                               Inttostr(ReEdiTabADDR_ID.AsInteger));
         DM1.UniQuery.Sql.Add ('WHERE JOURNAL_ID='+
                               Inttostr(ReEdiTabRec_ID.AsInteger));
         DM1.UniQuery.ExecSql;
         DM1.UniQuery.Close;

         PosTabAfterPost(nil);

         if PosTab.Active then PosTab.Refresh;
     end;

     DM1.ReKunTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UpdateAnsprechpartner;
var S,S1,S2,S3 : String;
begin
     best_name.ComboProps.ComboItems.Clear;
     dm1.uniquery.close;
     dm1.uniquery.sql.text :='select ANREDE, NAME, VORNAME '+
                             'from APARTNER WHERE ADDR_ID='+
                             Inttostr(ReEdiTabAddr_ID.AsInteger);
     dm1.uniquery.Open;

     if dm1.uniquery.recordcount>0
      then best_name.DialogStyle :=vdsCombo
      else best_name.DialogStyle :=vdsEdit;

     while not dm1.uniquery.eof do
     begin
        S1 :=dm1.uniquery.fieldbyname ('ANREDE').AsString;
        S2 :=dm1.uniquery.fieldbyname ('VORNAME').AsString;
        S3 :=dm1.uniquery.fieldbyname ('NAME').AsString;

        S :=S1;
        if length(S2)>0 then
        begin
          if length(S)>0 then S :=S+' ';
          S :=S+S2;
        end;
        if length(S3)>0 then
        begin
          if length(S)>0 then S :=S+' ';
          S :=S+S3;
        end;
        best_name.ComboProps.ComboItems.Add (S);
        dm1.uniquery.next;
     end;
     if dm1.uniquery.recordcount>0 then best_name.CreateDropDownList;
     dm1.uniquery.close;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.F9Change (Ein : Boolean);
begin
     LastF9 :=Ein;
     InfoPanOut.Visible :=LastF9;
end;
//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PruefeVertraege;
var Anz : Integer;
    Txt : String;
    uniquery : tZQuery;


begin
     uniquery :=tZQuery.Create(Self);
     try
       uniquery.Connection :=dm1.db1;
       uniquery.sql.text :='select count(*) as ANZ from VERTRAG '+
                           'where AKTIV_FLAG="Y" and DATUM_NEXT <=NOW()';
       uniquery.Open;
       if (uniquery.RecordCount>0) and
          (UniQuery.FieldByName ('ANZ').AsInteger>0) then
       begin
         ANZ :=UniQuery.FieldByName ('ANZ').AsInteger;
         if Anz=1
           then txt :='Eine Vertrag ist zur Berechnung fällig.'+
                      #13#10+
                      'Möchen Sie jetzt zu den Verträgen wechseln ?'
           else txt :=Inttostr(Anz)+
                      ' Verträge sind zur Berechnung fällig.'+
                      #13#10+
                      'Möchen Sie jetzt zu den Verträgen wechseln ?';
         if MessageDlg (Txt,mtConfirmation,[mbYes,mbNo],0)=mryes then
         begin
            MainForm.JumpTo (VK_WKRE_EDI,0,0,False);
         end;
       end;
       UniQuery.Close;
     finally
       UniQuery.Free;
     end;
end;
//------------------------------------------------------------------------------

end.

