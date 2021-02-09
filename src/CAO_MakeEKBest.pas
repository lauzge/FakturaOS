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
Modul        : CAO_MAKEEKBEST
Stand        : 09.11.2003
Version      : 1.1.3.27
Beschreibung : EK-Bestellung erstellen

History :

06.05.2003 - zum GNU-Source hinzugefügt
18.05.2003 - Anpassungen an neue DB
31.05.2003 - neuen Code zur Aktualisierung des Artikelfeldes MENGE_EKBEST_EDI
             hinzugefügt
           - der Bestellvorschlag für den akt. Lieferanten wird jetzt korrekt
             angezeigt, dabei werden auch die gerade erfassten Artikel korret
             mit einbezogen
30.07.2003 - Bug #22 beseitigt
16.08.2003 - Bugfix bei Zahlungsart Vorkasse
25.10.2003 - Funktion SetAdresse zum Setzen der Lieferantenadresse eingebaut
09.11.2003 - Bug beim editieren von Texten beseitigt

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_MakeEKBest;

{$IFDEF FPC}{$mode delphi}{$ENDIF}
{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, Buttons, DBCtrls, Menus, DBGrids, rxdbdateedit, RxDBGrid,
  ZDataset, ZAbstractRODataset, cao_var_const, CAO_ARTIKEL1, CAO_Kunde, Types;

type

  { TMakeEKBestForm }

  TMakeEKBestForm = class(TForm)
    ArtikelTabALTTEIL_FLAG: TBooleanField;
    ArtikelTabARTIKELTYP: TZRawStringField;
    ArtikelTabARTNUM: TZRawStringField;
    ArtikelTabAUFW_KTO: TZIntegerField;
    ArtikelTabBARCODE: TZRawStringField;
    ArtikelTabDIMENSION: TZRawStringField;
    ArtikelTabEK_PREIS: TZDoubleField;
    ArtikelTabERLOES_KTO: TZIntegerField;
    ArtikelTabERSATZ_ARTNUM: TZRawStringField;
    ArtikelTabGEWICHT: TZDoubleField;
    ArtikelTabGROESSE: TZRawStringField;
    ArtikelTabKAS_NAME: TZRawStringField;
    ArtikelTabKURZNAME: TZRawStringField;
    ArtikelTabLAENGE: TZRawStringField;
    ArtikelTabLANGNAME: TZRawCLobField;
    ArtikelTabMATCHCODE: TZRawStringField;
    ArtikelTabMENGE_AKT: TZDoubleField;
    ArtikelTabME_EINHEIT: TZRawStringField;
    ArtikelTabNO_BEZEDIT_FLAG: TBooleanField;
    ArtikelTabNO_EK_FLAG: TBooleanField;
    ArtikelTabNO_PROVISION_FLAG: TBooleanField;
    ArtikelTabNO_RABATT_FLAG: TBooleanField;
    ArtikelTabNO_VK_FLAG: TBooleanField;
    ArtikelTabPR_EINHEIT: TZDoubleField;
    ArtikelTabRABGRP_ID: TZRawStringField;
    ArtikelTabREC_ID: TZIntegerField;
    ArtikelTabSN_FLAG: TBooleanField;
    ArtikelTabSTEUER_CODE: TZSmallIntField;
    ArtikelTabVK1: TZDoubleField;
    ArtikelTabVK2: TZDoubleField;
    ArtikelTabVK3: TZDoubleField;
    ArtikelTabVK4: TZDoubleField;
    ArtikelTabVK5: TZDoubleField;
    ArtikelTabVPE: TZIntegerField;
    ArtikelTabWARENGRUPPE: TZIntegerField;
    BestOnlyVK_CB: TCheckBox;
    BVorDS: TDataSource;
    BVorTabARTNUM: TZRawStringField;
    BVorTabKURZNAME: TZRawStringField;
    BVorTabLIEF_BESTNUM: TZRawStringField;
    BVorTabMATCHCODE: TZRawStringField;
    BVorTabMENGE_AKT: TZDoubleField;
    BVorTabMENGE_BESTELLT: TZDoubleField;
    BVorTabMENGE_BVOR: TZDoubleField;
    BVorTabMENGE_DIV: TZDoubleField;
    BVorTabMENGE_EKBEST_EDI: TZDoubleField;
    BVorTabMENGE_MIN: TZDoubleField;
    BVorTabREC_ID: TZIntegerField;
    BVorTabVK_MENGE: TZDoubleField;
    CaoGroupBox3: TGroupBox;
    KuNrEdit: TDBEdit;
    DBNavigator2: TDBNavigator;
    KopfNav2: TDBNavigator;
    Bearbeiten1: TMenuItem;
    Ansicht1: TMenuItem;
    Auswahl1: TMenuItem;
    Allgemein1: TMenuItem;
    Fertigstellen1: TMenuItem;
    Aktualisieren1: TMenuItem;
    Adressezuweisen1: TMenuItem;
    ArtikelHinzufgen1: TMenuItem;
    freienArtikelhinzufgen1: TMenuItem;
    Kopieren1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N6: TMenuItem;
    KuNrEditBtn: TSpeedButton;
    Suchen1: TMenuItem;
    N5: TMenuItem;
    SpeichernundBuchen1: TMenuItem;
    N1: TMenuItem;
    Positionlschen1: TMenuItem;
    Storno1: TMenuItem;
    N2: TMenuItem;
    Texthinzufgen1: TMenuItem;
    N3: TMenuItem;
    neuenBelegerstellen1: TMenuItem;
    N4: TMenuItem;
    Positionen1: TMenuItem;
    Sortierung1: TMenuItem;
    ProblemLab: TLabel;
    LiefanschrGB: TGroupBox;
    DBEdit1: TDBEdit;
    BestVorGB: TGroupBox;
    BestPosGB: TGroupBox;
    CaoGroupBox4: TGroupBox;
    OffBestGrid: TDBGrid;
    Panel36: TPanel;
    ErrGBPan: TPanel;
    RechInfoMemo: TDBMemo;
    GlobRabatt: TDBEdit;
    InfoGB: TGroupBox;
    LIE_Datum: TRxDBDateEdit;
    LiefAnschriftDelBtn: TSpeedButton;
    blGlyphLeft: TSpeedButton;
    InfoGBPan: TPanel;
    OffBestSplitter: TSplitter;
    PosGrid: TRxDBGrid;
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
    ToolButton17: TToolButton;
    ToolButton12: TToolButton;
    ToolButton2: TToolButton;
    UpBtn: TToolButton;
    ToolButton3: TToolButton;
    ToolButton9: TToolButton;
    ToolButton4: TToolButton;
    WaehrungCB: TDBLookupComboBox;
    ZahlartDB: TDBLookupComboBox;
    Ref_Num: TDBEdit;
    Zahlart: TDBEdit;
    waehrung: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Projekt: TDBEdit;
    DBText1: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText21: TDBText;
    DBText22: TDBText;
    DBText20: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText2: TDBText;
    DBText24: TDBText;
    DBText10: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    DBText3: TDBText;
    DBText11: TDBText;
    DBText23: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText4: TDBText;
    DBText9: TDBText;
    DBText8: TDBText;
    CaoGroupBox1: TGroupBox;
    CaoGroupBox2: TGroupBox;
    Label23: TLabel;
    Label32: TLabel;
    Label27: TLabel;
    Label38: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    L_Anrede: TEdit;
    L_LAND: TEdit;
    L_Name1: TEdit;
    L_Name2: TEdit;
    L_Name3: TEdit;
    l_ort2: TEdit;
    L_Ort: TEdit;
    l_plz2: TEdit;
    l_land2: TEdit;
    L_PLZ: TEdit;
    l_strasse2: TEdit;
    l_name3_2: TEdit;
    l_name2_2: TEdit;
    l_name1_2: TEdit;
    l_anrede2: TEdit;
    KundatGB: TGroupBox;
    KundatGB4: TGroupBox;
    KundatGB5: TGroupBox;
    KundatGBPan: TPanel;
    KundatGBPan1: TPanel;
    KundatGBPan2: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label49: TLabel;
    Label48: TLabel;
    Label46: TLabel;
    Label26: TLabel;
    Label45: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label33: TLabel;
    Label30: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label42: TLabel;
    Label41: TLabel;
    Label40: TLabel;
    Label5: TLabel;
    Label53: TLabel;
    Label22: TLabel;
    Label31: TLabel;
    Label47: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label55: TLabel;
    L_Strasse: TEdit;
    Panel12: TPanel;
    Panel1: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel24: TPanel;
    Panel23: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel29: TPanel;
    Panel3: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    GBPanel: TPanel;
    SumPan: TPanel;
    bsumpan: TPanel;
    msumpan: TPanel;
    nsumpan: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    Panel13: TPanel;
    Panel25: TPanel;
    Panel22: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    ReEdiListGrid: TDBGrid;
    MainMenu1: TMainMenu;
    AddBestVorschlagPopup: TPopupMenu;
    ArtikelPopupMenu: TPopupMenu;
    ausgewArtikelhinzufgen1: TMenuItem;
    freierArtikel1: TMenuItem;
    PosTabADDR_ID: TZIntegerField;
    PosTabALTTEIL_FLAG: TBooleanField;
    PosTabALTTEIL_PROZ: TZDoubleField;
    PosTabALTTEIL_STCODE: TZSmallIntField;
    PosTabARTIKELTYP: TZRawStringField;
    PosTabARTIKEL_ID: TZIntegerField;
    PosTabARTNUM: TZRawStringField;
    PosTabATRNUM: TZIntegerField;
    PosTabBARCODE: TZRawStringField;
    PosTabBEZEICHNUNG: TZRawCLobField;
    PosTabBEZ_FEST_FLAG: TBooleanField;
    PosTabBRUTTO_FLAG: TBooleanField;
    PosTabBSumme: TCurrencyField;
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
    PosTabQUELLE: TZShortIntField;
    PosTabQUELLE_SUB: TZShortIntField;
    PosTabRABATT: TZDoubleField;
    PosTabREC_ID: TZIntegerField;
    PosTabSN_FLAG: TBooleanField;
    PosTabSTEUER_CODE: TZSmallIntField;
    PosTabVLSNUM: TZIntegerField;
    PosTabVPE: TZUInt64Field;
    PosTabVRENUM: TZIntegerField;
    ReEdiTabADATUM: TZDateField;
    ReEdiTabADDR_ID: TZIntegerField;
    ReEdiTabATMSUMME: TZDoubleField;
    ReEdiTabATRNUM: TZIntegerField;
    ReEdiTabATSUMME: TZDoubleField;
    ReEdiTabBEST_CODE: TZSmallIntField;
    ReEdiTabBEST_NAME: TZRawStringField;
    ReEdiTabBRUTTO_FLAG: TBooleanField;
    ReEdiTabBSUMME: TZDoubleField;
    ReEdiTabERSTELLT: TZDateField;
    ReEdiTabERST_NAME: TZRawStringField;
    ReEdiTabFOLGENR: TZIntegerField;
    ReEdiTabGEGENKONTO: TZIntegerField;
    ReEdiTabGLOBRABATT: TZDoubleField;
    ReEdiTabINFO: TZRawCLobField;
    ReEdiTabKFZ_ID: TZIntegerField;
    ReEdiTabKM_STAND: TZIntegerField;
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
    ReEdiTabLDATUM: TZDateField;
    ReEdiTabLIEFART: TZSmallIntField;
    ReEdiTabLIEF_ADDR_ID: TZIntegerField;
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
    ReEdiTabMWST_FREI_FLAG: TBooleanField;
    ReEdiTabNSUMME: TZDoubleField;
    ReEdiTabORGNUM: TZRawStringField;
    ReEdiTabPROJEKT: TZRawStringField;
    ReEdiTabPR_EBENE: TZSmallIntField;
    ReEdiTabQUELLE: TZSmallIntField;
    ReEdiTabQUELLE_SUB: TZShortIntField;
    ReEdiTabRDATUM: TZDateField;
    ReEdiTabREC_ID: TZIntegerField;
    ReEdiTabSOLL_NTAGE: TZSmallIntField;
    ReEdiTabSOLL_RATBETR: TZDoubleField;
    ReEdiTabSOLL_RATEN: TZSmallIntField;
    ReEdiTabSOLL_RATINTERVALL: TZIntegerField;
    ReEdiTabSOLL_SKONTO: TZDoubleField;
    ReEdiTabSOLL_STAGE: TZSmallIntField;
    ReEdiTabSTADIUM: TZSmallIntField;
    ReEdiTabTERMIN: TZDateField;
    ReEdiTabTKOST: TZDoubleField;
    ReEdiTabUSR1: TZRawStringField;
    ReEdiTabUSR2: TZRawStringField;
    ReEdiTabVERTRETER_ID: TZIntegerField;
    ReEdiTabVLSNUM: TZIntegerField;
    ReEdiTabVRENUM: TZIntegerField;
    ReEdiTabWAEHRUNG: TZRawStringField;
    ReEdiTabWARE: TZDoubleField;
    ReEdiTabWERT_NETTO: TZDoubleField;
    ReEdiTabWV_DatumStr: TStringField;
    ReEdiTabZAHLART: TZSmallIntField;
    ReEdiTabZahlart_Str: TStringField;
    StringField1: TStringField;
    Text1: TMenuItem;
    PosDS: TDataSource;
    ReEdiDS: TDataSource;
    DBNavigator1: TDBNavigator;
    Label35: TLabel;
    ButtonPan: TPanel;
    PC1: TPageControl;
    EdiListTS: TTabSheet;
    AdressTS: TTabSheet;
    PosTS: TTabSheet;
    Fertig: TTabSheet;
    AuswahlBtn: TSpeedButton;
    AllgemeinBtn: TSpeedButton;
    PositionenBtn: TSpeedButton;
    FertigBtn: TSpeedButton;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolBar5: TToolBar;
    NewBelBtn: TToolButton;
    BelDelBtn: TToolButton;
    ReEdiBtn: TToolButton;
    TopPan: TPanel;
    RePanel: TPanel;
    KunTab: TZQuery;
    ArtikelTab: TZQuery;
    PosTab: TZQuery;
    ReEdiTab: TZQuery;
    BVorTab: TZQuery;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ausgewArtikelhinzufgen1Click(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure BVorTabAfterOpen(DataSet: TDataSet);
    procedure BVorTabBeforeOpen(DataSet: TDataSet);
    procedure Del1BtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure GotoAllgBtnClick(Sender: TObject);
    procedure GotoAuswahlBtnClick(Sender: TObject);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure BestOnlyVK_CBClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure GotoFertigBtnClick(Sender: TObject);
    procedure GotoPosBtnClick(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure KuNrEditButtonClick(Sender: TObject);
    procedure KuNrEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure KuNrEditKeyPress(Sender: TObject; var Key: char);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure LiefAnschriftAuswahlBtnClick(Sender: TObject);
    procedure LiefAnschriftDelBtnClick(Sender: TObject);
    procedure NeuArtBtnClick(Sender: TObject);
    procedure NeuFrArtBtnClick(Sender: TObject);
    procedure NeuKomBtnClick(Sender: TObject);
    procedure New1BtnClick(Sender: TObject);
    procedure OffBestGridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure OffBestGridDblClick(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure PC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure PosGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure PosGridKeyPress(Sender: TObject; var Key: char);
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
    procedure PosGridShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure RechInfoMemoEnter(Sender: TObject);
    procedure RechInfoMemoExit(Sender: TObject);
    procedure ReEdiBtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ReEdiDSDataChange(Sender: TObject; Field: TField);
    procedure ReEdiTabAfterPost(DataSet: TDataSet);
    procedure ReEdiTabAfterScroll(DataSet: TDataSet);
    procedure ReEdiTabBeforeClose(DataSet: TDataSet);
    procedure ReEdiTabBeforeDelete(DataSet: TDataSet);
    procedure ReEdiTabBeforePost(DataSet: TDataSet);
    procedure ReEdiTabCalcFields(DataSet: TDataSet);
    procedure ReEdiTabOnNewRecord(DataSet: TDataSet);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure UpBtnClick(Sender: TObject);
  private
    { Private-Deklarationen}
    //Loading      : Boolean;
    AppendOK     : Boolean;
    QueryTime    : DWord;
    LastTS     : tTabSheet;
    LastEdiID  : Integer;
    LastPosID  : Integer;
    //InDataChange : Boolean;

    procedure OnAddArtikel (ID : Integer; Menge : Double;
                            AlternativArtnum : String='');
    procedure UpdateLayout;
    procedure UpdateLieferAdresse (ID : Integer);
    procedure UpdateStatus;
    procedure FindDialog1Find(Sender: TObject);
  public
    { Public-Deklarationen}
    First     : Boolean;
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure SetAdresse (ID : Integer);
  end;

var
  MakeEKBestForm: TMakeEKBestForm;

implementation

{$R *.frm}

uses CAO_DM, CAO_MAIN, cao_dbgrid_layout,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     ZExtra, cao_tool1;

//------------------------------------------------------------------------------
procedure TMakeEKBestForm.FormCreate(Sender: TObject);
begin
     Scaled :=True;
     //ScaleBy (Screen.Width,800);
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

     OnUpdateStatusBar     :=nil;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.FormActivate(Sender: TObject);
var Dummy : Boolean;
begin
     QueryTime :=GetTickCount;
     if first then
     begin
       first :=False;

       PC1.ActivePage :=EdiListTS;

       dm1.GridLoadLayout (tDBGrid(ReEdiListGrid),'EDI_LISTE_EKBE',100);
       dm1.GridLoadLayout (tDBGrid(PosGrid),'EDI_POS_EKBE');
       dm1.GridLoadLayout (tDBGrid(OffBestGrid),'BVORSCHLAG_EKBE');
       PosGrid.DefaultRowHeight  :=DM1.ReadIntegerU ('','EKBEST_EDI_POS_ZH',PosGrid.DefaultRowHeight);
//       PosGrid.LinesPerRow       :=DM1.ReadIntegerU ('','EKBEST_EDI_POS_ZZ',PosGrid.LinesPerRow);

       PosTabMATCH_ARTNUM.DisplayLabel  :='Suchbegriff'+#13#10+'Artikelnummer';

//       PosGrid.RowColor1       :=DM1.C2Color;
//       ReEdiListGrid.RowColor1 :=DM1.C2Color;
//       OffBestGrid.RowColor1   :=DM1.C2Color;

//       PosGrid.EditColor :=DM1.EditColor;

       //Loading :=False;

       ReEdiTabNSUMME.DisplayFormat :=',###,##0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabMSUMME.DisplayFormat :=',###,##0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabBSUMME.DisplayFormat :=',###,##0.00 "'+DM1.LeitWaehrung+' "';

     end;


     ReEdiTab.Close;
     ReEdiTab.ParamByName ('QUELLE').Value :=EK_BEST_EDI;
     ReEdiTab.Open;
     PosTab.Open;

     ReEdiTabAfterScroll (nil);

     ButtonPan.Visible       :=ReEdiTab.RecordCount>0;
     ReEdiBtn.Enabled        :=ReEdiTab.RecordCount>0;
     BelDelBtn.Enabled       :=ReEdiTab.RecordCount>0;
     Del1Btn.Enabled         :=ReEdiTab.RecordCount>0;
     Allgemein1.Enabled      :=ReEdiTab.RecordCount>0;
     Positionen1.Enabled     :=ReEdiTab.RecordCount>0;
     Fertigstellen1.Enabled  :=ReEdiTab.RecordCount>0;

     PC1.ActivePage :=PC1.Pages[0];
     PC1Change(Sender);

     if LastEdiID<>-1 then
     begin
       ReEdiTab.Locate ('REC_ID',LastEdiID,[]);
       ReEdiTabAfterScroll(nil);
     end;

     PC1Changing(Sender,Dummy);
     if assigned(LastTS) then PC1.ActivePage :=LastTS;
     PC1Change(Sender);

     if (PC1.ActivePage=EdiListTS)and(ReEdiListGrid.Visible)
      then try ReEdiListGrid.SetFocus; except end;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.BestOnlyVK_CBClick(Sender: TObject);
begin
     BVorTab.Close;
     BVorTab.Open;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
     if (sender is tSpeedButton)and
        (tSpeedButton(Sender).Enabled) then
     begin
       tSpeedButton(Sender).Transparent :=False;
       tSpeedButton(Sender).Font.Color :=clBlack;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.GotoAuswahlBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=EdiListTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.GotoAllgBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=AdressTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.Del1BtnClick(Sender: TObject);
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
procedure TMakeEKBestForm.BuchenBtnClick(Sender: TObject);
var num : integer;
begin
     num :=DM1.Buche_EKBest(ReEdiTabREC_ID.Value);
     {$IFDEF REPORTBUILDER}
     if num>=0
      then PrintRechForm.ShowBelegDlg (EK_BEST,ReEdiTabREC_ID.AsInteger,False);
     {$ENDIF}

     LastTS    :=EdiListTS;
     LastEdiID :=-1;
     FormActivate(Sender);
     MainForm.FormActivate (Self);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.BVorTabAfterOpen(DataSet: TDataSet);
begin
     if BVorTab.RecordCount>0
      then BestVorGB.height  :=130
      else BestVorGB.height  :=20;
     OffBestSplitter.Enabled :=BVorTab.RecordCount>0;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.BVorTabBeforeOpen(DataSet: TDataSet);
begin
     BVorTab.Sql.Clear;

     BVorTab.Sql.Add('select A.REC_ID, A.KURZNAME, A.MATCHCODE, A.ARTNUM,');
     BVorTab.Sql.Add('AP.BESTNUM as LIEF_BESTNUM,');
     BVorTab.Sql.Add('A.MENGE_VKRE_EDI as VK_MENGE, A.MENGE_AKT,');
     BVorTab.Sql.Add('A.MENGE_VKRE_EDI - A.MENGE_AKT - A.MENGE_BESTELLT -');
     BVorTab.Sql.Add('A.MENGE_EKBEST_EDI + A.MENGE_MIN as MENGE_DIV,');
     BVorTab.Sql.Add('A.MENGE_BESTELLT, A.MENGE_EKBEST_EDI, A.MENGE_BVOR,');
     BVorTab.Sql.Add('A.MENGE_MIN from ARTIKEL A, ARTIKEL_PREIS AP');
     BVorTab.Sql.Add('where A.ARTIKELTYP="N" and  AP.ADRESS_ID=:AID');
     BVorTab.Sql.Add('and AP.ARTIKEL_ID=A.REC_ID');
     BVorTab.Sql.Add('and A.MENGE_AKT + A.MENGE_BESTELLT < ');
     BVorTab.Sql.Add('A.MENGE_VKRE_EDI + A.MENGE_MIN');

     if BVorTab.ParamByName ('AID').AsInteger<>ReEdiTabAddr_ID.AsInteger
      then BVorTab.ParamByName ('AID').AsInteger :=ReEdiTabAddr_ID.AsInteger;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.ausgewArtikelhinzufgen1Click(Sender: TObject);
var I : Integer;
begin
     if OffBestGrid.SelectedIndex>0 then     // von Volker geändert
     begin
        for i :=0 to OffBestGrid.SelectedRows.Count-1 do
        begin
          if OffBestGrid.Datasource.Dataset.BookmarkValid
           (pointer(OffBestGrid.SelectedRows.Items[i])) then
          begin
            OffBestGrid.Datasource.Dataset.GotoBookmark
             (pointer(OffBestGrid.SelectedRows.Items[i]));
            if (BVorTabMENGE_DIV.AsFloat>0) then
            begin
               OnAddArtikel (BVorTabREC_ID.AsInteger,
                             BVorTabMENGE_DIV.AsFloat);
            end;
          end;
        end;
        OffBestGrid.SelectedRows.Clear;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.Aktualisieren1Click(Sender: TObject);
begin
     if PC1.ActivePage=EdiListTS then
     begin
        ReEdiTab.Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.DelBtnClick(Sender: TObject);
begin
     PC1Change(Sender);
     PosTab.Delete;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
     if (sender is tSpeedButton) then
     begin
       tSpeedButton(Sender).Transparent :=True;
       tSpeedButton(Sender).Font.Color :=clWhite;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.FormDeactivate(Sender: TObject);
begin
     LastTS :=PC1.ActivePage;

     PC1Change(Sender);
     if assigned(MainForm.ArtForm) then MainForm.ArtForm.FormDeactivate (Sender);

     LastEdiID :=ReEdiTabRec_ID.AsInteger;
     KunTab.Close;
     ArtikelTab.Close;
     BVorTab.Close;
     PosTab.Close;
     ReEdiTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.GotoFertigBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=Fertig;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.GotoPosBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=PosTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.Kopieren1Click(Sender: TObject);
begin
     DM1.CopyRechnung (ReEdiTabREC_ID.Value, EK_BEST_EDI);
     ReEdiTab.Refresh;
     ReEdiTab.Last;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.KuNrEditButtonClick(Sender: TObject);
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
         ShowModal;
         if Uebern then
         begin // Adreese in Rechnung überbnehmen
             SetAdresse (KSQueryRec_ID.Value);
             Uebern :=False;
             FormDeactivate (Sender);

             BVorTab.Close;
             BestOnlyVK_CB.Checked :=False;
             BestOnlyVK_CBClick(sender);
         end;
     end; // with
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.KuNrEditKeyDown(Sender: TObject; var Key: Word;
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
procedure TMakeEKBestForm.KuNrEditKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
          key :=#0;
          if uppercase(tControl(Sender).Name)='RECHINFOMEMO' then KuNrEdit.SetFocus
          else SendMessage (MainForm.Handle,WM_NEXTDLGCTL,0,0);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(ReEdiListGrid),'EDI_LISTE_EKBE',100);
     dm1.GridSaveLayout (tDBGrid(PosGrid),'EDI_POS_EKBE');
     dm1.GridSaveLayout (tDBGrid(OffBestGrid),'BVORSCHLAG_EKBE');
     DM1.WriteIntegerU ('','EKBEST_EDI_POS_ZH',PosGrid.DefaultRowHeight);
//     DM1.WriteIntegerU ('','EKBEST_EDI_POS_ZZ',PosGrid.LinesPerRow);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.LiefAnschriftAuswahlBtnClick(Sender: TObject);
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
         ShowModal;
         if Uebern then
         begin // Adresse in Rechnung überbnehmen
             if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;


             //Auftragsnummer wird als ADDR_ID mißhandelt ....
             ReEdiTabLief_Addr_ID.Value           :=KSQueryRec_ID.Value;

             ReEdiTab.Post;

             Uebern :=False;
             FormDeactivate (Sender);

             UpdateLieferAdresse (REEdiTabLief_Addr_ID.Value);
         end;
     end; // with
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.LiefAnschriftDelBtnClick(Sender: TObject);
begin
     if (ReEdiTab.RecordCount>0) then
     begin
       if not(ReEdiTab.State in [dsEdit, dsInsert]) then ReEdiTab.Edit;
       ReEdiTabLIEF_ADDR_ID.AsInteger :=-1;
       ReEdiTab.Post;
       UpdateLieferAdresse (REEdiTabLief_Addr_ID.Value);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.NeuArtBtnClick(Sender: TObject);
begin
     PC1Change(Sender);
     PosMatchButtonClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.NeuFrArtBtnClick(Sender: TObject);
var i : integer;
begin
     PC1Change(Sender);

     AppendOK :=True;
     try
        //Loading :=True;

        PosTab.Append;

        PosTabArtikelTyp.Value      :='F';
        PosTabArtikel_ID.Value      :=-99;
        //PosTabArtNum.Value          :='fr. Artikel';
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
        PosTabGEGENKTO.Value        :=DM1.ReadInteger ('MAIN\KONTEN','DEF_AUFANDKTO',3400);
        PosTabBEZ_FEST_Flag.Value   :=False;
        PosTabSteuer_Code.Value     :=DM1.DefMwStCD;
        PosTabAltteil_Flag.Value    :=False;
        PosTabALTTEIL_PROZ.Value    :=0.1;
        PosTabALTTEIL_STCODE.Value  :=DM1.DefMwStCD;
        UpdateLayout;

        PosTab.Post;
     except
        PosTab.Cancel;
     end;
     //Loading :=False;
     AppendOK :=False;

     PosGrid.SetFocus;

//     for i:=0 to PosGrid.Columns.Count-1 do
//      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.Col :=i+1;   // von Volker geändert
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.NeuKomBtnClick(Sender: TObject);
var i : integer;
begin
     PC1Change(Sender);

     AppendOK :=True;
     try
        //Loading :=True;

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
     end;
     //Loading :=False;
     AppendOK :=False;

     PosGrid.SetFocus;

//     for i:=0 to PosGrid.Columns.Count-1 do
//      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.Col :=i+1;  // von Volker geändert
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.New1BtnClick(Sender: TObject);
begin
     ReEdiTab.Append;
     LastEdiID :=ReEdiTabRec_ID.Value;
     LastTS :=AdressTS;
     FormActivate(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.OffBestGridContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
     Handled :=OffBestGrid.SelectedIndex=0;  // von Volker geändert
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.OffBestGridDblClick(Sender: TObject);
begin
     if (BVorTab.RecordCount>0)and(BVorTabMENGE_DIV.AsFloat>0) then
     begin
        OnAddArtikel (BVorTabREC_ID.AsInteger,
                      BVorTabMENGE_DIV.AsFloat,
                      BVorTabLief_bestnum.AsString);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PC1Change(Sender: TObject);
var Prob : Boolean;
    S    : String;
    Dummy : Boolean;
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

     Positionlschen1.Enabled :=(PosTab.RecordCount>0)and
                               (PC1.ActivePage=PosTS);

     Storno1.Enabled :=(ReEdiTab.RecordCount>0)and
                       ( (PC1.ActivePage=AdressTS) or
                         (PC1.ActivePage=EdiListTS)
                       );

     SichtbareSpalten1.Enabled :=PC1.ActivePage=EdiListTS;

     Kopieren1.Enabled         :=(PC1.ActivePage=EdiListTS)and
                                 (ReEdiTab.RecordCount>0);

     Adressezuweisen1.Enabled :=PC1.ActivePage=AdressTS;

     Artikelhinzufgen1.Enabled :=PC1.ActivePage=PosTS;
     freienArtikelhinzufgen1.Enabled :=Artikelhinzufgen1.Enabled;
     Texthinzufgen1.Enabled          :=Artikelhinzufgen1.Enabled;

     Aktualisieren1.Enabled    :=(PC1.ActivePage=EdiListTS) or
                                 (PC1.ActivePage=PosTS);

     AuswahlBtn.Font.Style    :=[];
     AllgemeinBtn.Font.Style  :=[];
     PositionenBtn.Font.Style :=[];
     FertigBtn.Font.Style     :=[];

     SpeichernundBuchen1.Enabled :=False;
     Suchen1.Enabled :=(PC1.ActivePage=EdiListTS);

     Prob :=False;
     S    :='';
     if PC1.ActivePage=Fertig then
     begin
          FertigBtn.Font.Style :=[fsBold];
          Fertigstellen1.Checked :=True;

          if ReEdiTabAddr_ID.Value<0 then
          begin
               S :=S+'Kein Lieferant zugewiesen'+#13#10;
               Prob :=True;
          end;
          if ReEdiTabZAHLART.Value<0 then
          begin
               S :=S+'Keine Zahlungsart zugewiesen'+#13#10;
               Prob :=True;
          end;
          if (ReEdiTabNSumme.Value=0)or(PosTab.RecordCount=0) then
          begin
               S :=S+'Beleg hat einen Betrag von 0,00 bzw. keine Positionen'+#13#10;
               Prob :=True;
          end;
          if ReEdiTabLDatum.AsDateTime<Int(Now) then
          begin
               S :=S+'Lieferdatum liegt in der Vergangenheit'+#13#10;
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
          BuchenBtn.Enabled           :=not Prob;
          SpeichernundBuchen1.Enabled :=not Prob;
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
          AllgemeinBtn.Font.Style :=[fsBold];
          Allgemein1.Checked :=True;
     end
        else
     if PC1.ActivePage=PosTS then
     begin
          PositionenBtn.Font.Style :=[fsBold];
          Positionen1.Checked :=True;
          if BVorTab.ParamByName ('AID').AsInteger<>ReEdiTabAddr_ID.AsInteger then
          begin
             {
             BVorTab.Close;
             BVorTab.ParamByName ('AID').AsInteger :=ReEdiTabAddr_ID.AsInteger;
             BVorTab.Open;
             }
             BestOnlyVK_CB.Checked :=False;
             BestOnlyVK_CBClick(Sender);
          end
          else if not BVorTab.Active then BVorTab.Open;
     end;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PC1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
     QueryTime :=GetTickCount;
     if PosTab.ParamByName ('ID').Value<>ReEdiTabREC_ID.Value then
     begin
       //Loading :=True;
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
       //Loading :=False;

       UpdateLieferAdresse (REEdiTabLief_Addr_ID.Value);
     end;

     QueryTime :=GetTickCount - QueryTime;
     UpdateStatus;

     if ReEdiTab.State in [dsEdit, dsInsert] then ReEdiTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_INSERT then
     begin
          key :=0;
          PosMatchButtonClick(Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosGridKeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (PosTab.State in [dsEdit,dsInsert]) then PosTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosMatchButtonClick(Sender: TObject);
begin
    if not assigned(MainForm.ArtForm) then
    begin
         MainForm.ArtForm :=tArtikelForm.Create (Self);
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
procedure TMakeEKBestForm.PosTabAfterDelete(DataSet: TDataSet);
var bm : tBookmark;
    p  : Integer;
begin
     if PosTab.ControlsDisabled then exit; // Beleg wird gelöscht,
                                     // jetzt abbrechen da die Positionen somit
                                     // auch nicht aktualisiert werden müssen

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
procedure TMakeEKBestForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     PosTab.Close;
     ReEdiTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosTabAfterPost(DataSet: TDataSet);
var ID : Integer;
    N, n0, n1, n2, n3, M ,m0 ,m1 ,m2 ,m3 ,B, Ware, Lohn, TKst : Double;
begin
     if PosTab.ControlsDisabled then exit;

     {MessageDlg ('Old '+Floattostr(PosTabMenge.OldValue)+#13#10+
                 'New '+FloatToStr(PosTabMenge.Value),mtinformation,[mbok],0);}

     // MENGE_EKBEST_EDI im Artikel aktualisieren
     DM1.UpdateArtikelEdiMenge (EK_BEST_EDI,
                                PosTabArtikel_ID.AsInteger,
                                0);

     ID :=PosTabRec_ID.Value;
     PosTab.DisableControls;
     N :=0; N0 :=0; N1 :=0; N2 :=0; N3 :=0;
     M :=0; M0 :=0; M1 :=0; M2 :=0; M3 :=0;
     B :=0;
     try
        PosTab.First;
        while not PosTab.Eof do
        begin
             N :=N+PosTabNSumme.Value;

             case PosTabSteuer_code.Value of
                    0:N0 :=N0 + PosTabNSumme.Value;
                    1:N1 :=N1 + PosTabNSumme.Value;
                    2:N2 :=N2 + PosTabNSumme.Value;
                    3:N3 :=N3 + PosTabNSumme.Value;
             end;

             PosTab.Next;
        end;

        M0 :=CAO_Round (N0 * ReEdiTabMwSt_0.AsFloat) / 100;
        M1 :=CAO_Round (N1 * ReEdiTabMwSt_1.AsFloat) / 100;
        M2 :=CAO_Round (N2 * ReEdiTabMwSt_2.AsFloat) / 100;
        M3 :=CAO_Round (N3 * ReEdiTabMwSt_3.AsFloat) / 100;

        if  ReEdiTabMWST_FREI_Flag.AsBoolean=False then
        begin
          M :=M0+M1+M2+M3;
          B :=N+M;
        end
           else
        begin
           M:=0;
           B :=N;
        end;

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
           (ReEdiTabWare.Value        <> Ware)or
           (ReEdiTabLohn.Value        <> Lohn)or
           (ReEdiTabTKost.Value       <> TKst)then
        begin
           try
              if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;
              ReEdiTabNSumme.Value :=N;
              ReEdiTabMSumme.Value :=M;
              ReEdiTabBSumme.Value :=B;

              ReEdiTabMSumme_0.Value :=M0;
              ReEdiTabMSumme_1.Value :=M1;
              ReEdiTabMSumme_2.Value :=M2;
              ReEdiTabMSumme_3.Value :=M3;

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
     if BVorTab.Active then BVorTab.Refresh;

     DelBtn.Enabled :=PosTab.RecordCount>0;
     Positionlschen1.Enabled :=PosTab.RecordCount>0;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosTabAfterScroll(DataSet: TDataSet);
begin
     PosTabMenge.ReadOnly :=PosTabArtikelTyp.AsString='T';
     PosTabEPreis.ReadOnly :=PosTabArtikelTyp.AsString='T';

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

     if PosTab.ControlsDisabled then exit;
     UpdateLayout;

     UpdateStatus;
     DelBtn.Enabled :=PosTab.RecordCount>0;
     Positionlschen1.Enabled :=PosTab.RecordCount>0;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosTabBeforeDelete(DataSet: TDataSet);
begin
     // MENGE_EKBEST_EDI im Artikel aktualisieren
     DM1.UpdateArtikelEdiMenge (EK_BEST_EDI,
                                PosTabArtikel_ID.AsInteger,
                                PosTabMenge.AsFloat);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosTabBeforeEdit(DataSet: TDataSet);
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
procedure TMakeEKBestForm.PosTabBeforeInsert(DataSet: TDataSet);
begin
     if not AppendOK then
     begin
        MessageBeep(0);
        Abort;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosTabBeforePost(DataSet: TDataSet);
begin
     if PosTabArtikel_ID.Value=0 then
     begin
          try
             Abort;
          finally
             PosTab.Cancel;
          end;
          MessageBeep (0);
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
procedure TMakeEKBestForm.PosTabCalcFields(DataSet: TDataSet);
var Summe   : Double;
    Steuer  : Double;
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

     PosTabNSumme.Value :=CAO_round(Summe*100)/100;  // Auf ganze Pfennige Runden
     PosTabMSumme.Value :=CAO_round(Summe * (Steuer / 100) *100)/100; // Auf ganze Pfennige Runden
     PosTabBSumme.Value :=PosTabNSumme.Value+PosTabMSumme.Value;

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
       PosTabMATCH_ARTNUM.Value :='freier Artikel';
     end
     else PosTabMATCH_ARTNUM.Value :='';
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.PosTabNewRecord(DataSet: TDataSet);
begin
     PosTabJournal_ID.Value  :=ReEdiTabRec_ID.Value;
     PosTabQuelle.Value      :=ReEdiTabQuelle.Value;
     PosTabQuelle_Sub.Value  :=ReEdiTabQuelle_Sub.Value;
     PosTabAddr_ID.Value     :=ReEdiTabAddr_ID.Value;
     PosTabVRENUM.Value      :=ReEdiTabVRENUM.Value;
     PosTabRabatt.Value      :=ReEdiTabGlobRabatt.Value;
     PosTabPosition.Value    :=PosTab.RecordCount+1;
     PosTabE_RGewinn.Value   :=0;
     PosTabBrutto_Flag.Value :=ReEdiTabBRUTTO_FLAG.Value;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.RechInfoMemoEnter(Sender: TObject);
begin
     tDBEdit(sender).Color :=DM1.EditColor;//$009FFF9F;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.RechInfoMemoExit(Sender: TObject);
begin
     tDBEdit(sender).Color :=clWindow;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.ReEdiBtnClick(Sender: TObject);
begin
     DBGrid1DblClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.DBGrid1DblClick(Sender: TObject);
var Dummy : Boolean;
begin
     if ReEdiTab.RecordCount = 0 then exit;

     PC1Changing (Sender,Dummy);

     if ReEdiTabAddr_ID.Value<0 then PC1.ActivePage :=AdressTS
                                else PC1.ActivePage :=PosTS;

     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.ReEdiDSDataChange(Sender: TObject;
  Field: TField);
begin
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.ReEdiTabAfterScroll(DataSet: TDataSet);
begin
     ReEdiTabAfterPost (nil);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.ReEdiTabBeforeClose(DataSet: TDataSet);
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
procedure TMakeEKBestForm.ReEdiTabBeforeDelete(DataSet: TDataSet);
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
procedure TMakeEKBestForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
     if ReEdiTabVRENUM.Value<1
     then ReEdiTabVRENUM.Value :=DM1.IncNummer (EK_BEST_EDI);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.ReEdiTabCalcFields(DataSet: TDataSet);
begin
     if ReEdiTabTermin.AsDateTime > 100
      then ReEdiTabWV_DatumStr.Value :=FormatDateTime ('dd.mm.yyyy',ReEdiTabTermin.AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.ReEdiTabOnNewRecord(DataSet: TDataSet);
var Dummy    : Boolean;
begin
     ReEdiTabQuelle.Value       :=EK_BEST_EDI;
     ReEdiTabQUELLE_SUB.Value   :=0;
     ReEdiTabVLSNUM.Value       :=-1;
     ReEdiTabATRNUM.Value       :=-1;
     ReEdiTabGegenKonto.Value   :=-1;
     ReEdiTabADDR_ID.Value      :=-1;
     ReEdiTabLief_Addr_ID.Value :=-1;
     ReEdiTabRDatum.AsDateTime  :=Trunc (Now);
     ReEdiTabLDatum.AsDateTime  :=Trunc (Now)+14;
     ReEdiTabADatum.AsDateTime  :=0;
     ReEdiTabPR_Ebene.Value     :=5;
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
     ReEdiTabPR_Ebene.Value     :=0; //EK
     ReEdiTabFolgeNr.Value      :=-1;
     ReEdiTabKM_Stand.Value     :=-1;
     ReEdiTabKFZ_ID.Value       :=-1;
     ReEdiTabVertreter_ID.Value :=-1;
     ReEdiTabGlobRabatt.Value   :=0;
     ReEdiTabTermin.AsDateTime  :=0;
     ReEdiTabLiefart.Value      :=-1;
     ReEdiTabZahlArt.Value      :=-1;

     ReEdiTabErstellt.AsDateTime:=now;
     ReEdiTabERST_NAME.Value    :=DM1.View_User;

     ReEdiTabMWST_0.Value       :=DM1.MWSTTab[0];
     ReEdiTabMWST_1.Value       :=DM1.MWSTTab[1];
     ReEdiTabMWST_2.Value       :=DM1.MWSTTab[2];
     ReEdiTabMWST_3.Value       :=DM1.MWSTTab[3];

     if (PosTab.State = dsEdit) or (PosTab.State = dsInsert) then
     begin
       try
         PosTab.Post;
       except
         PosTab.Cancel;
       end;
     end;

     PC1.ActivePage :=AdressTS;

     PC1Changing (Self,Dummy);
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.SichtbareSpalten1Click(Sender: TObject);
begin
     if PC1.ActivePage = EdiListTS
      then VisibleSpaltenForm.UpdateTable (tDBGrid(ReEdiListGrid));
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.Suchen1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.UpBtnClick(Sender: TObject);
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
procedure TMakeEKBestForm.DownBtnClick(Sender: TObject);
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
procedure TMakeEKBestForm.OnAddArtikel (ID : Integer; Menge : Double;
                                        AlternativArtnum : String='');
var EK : Double;
begin
     //wir vom Artikelstamm aufgerufen
     ArtikelTab.Close;
     ArtikelTab.ParamByName ('ID').Value :=ID;
     ArtikelTab.Open;
     if (ArtikelTab.RecordCount=1) and
        (ArtikelTabNo_EK_Flag.Value=False) then
     begin
          AppendOK :=True;
          try
            //Loading :=True;

            PosTab.Append;

            PosTabJournal_ID.Value      :=ReEdiTabREC_ID.Value;
            PosTabQuelle.Value          :=ReEdiTabQuelle.Value;
            PosTabQuelle_Sub.Value      :=ReEdiTabQuelle_Sub.Value;
            PosTabAddr_ID.Value         :=ReEdiTabADDR_ID.Value;
            PosTabVRENUM.Value          :=ReEdiTabVRENUM.Value;
            PosTabVLSNUM.Value          :=-1;
            PosTabATRNum.Value          :=-1;

            PosTabArtikel_ID.Value      :=ArtikelTabREC_ID.Value;
            PosTabArtikelTyp.Value      :=ArtikelTabArtikelTyp.Value;

            PosTabArtNum.Value          :=ArtikelTabArtnum.Value;

            if length(AlternativArtnum)>0
             then PosTabArtNum.Value :=AlternativArtnum;

            PosTabMatchCode.Value       :=ArtikelTabMatchCode.Value;
            PosTabBarCode.Value         :=ArtikelTabBarCode.Value;

            PosTabBezeichnung.AsString  :=ArtikelTabLangName.AsString;
            PosTabLaenge.Value          :=ArtikelTabLaenge.Value;
            PosTabGroesse.Value         :=ArtikelTabGroesse.Value;
            PosTabDimension.Value       :=ArtikelTabDimension.Value;
            PosTabGewicht.Value         :=ArtikelTabGewicht.Value;
            PosTabME_Einheit.Value      :=ArtikelTabME_Einheit.Value;
            PosTabPR_Einheit.Value      :=ArtikelTabPR_Einheit.Value;
            PosTabSN_Flag.AsBoolean     :=ArtikelTabSN_Flag.AsBoolean;
            PosTabVPE.Value             :=ArtikelTabVPE.AsInteger;

            PosTabMenge.Value           :=CAO_round(Menge*100)/100;

            if (ArtikelTabRABGRP_ID.AsString<>'-')and
               (length(ArtikelTabRABGRP_ID.AsString)>0) then
            begin
                 // Ist ein Artikel mit Rabattgruppe !!!

                 case DM1.AnzPreis of
                     1: EK :=ArtikelTabVK1.Value;
                     2: EK :=ArtikelTabVK2.Value;
                     3: EK :=ArtikelTabVK3.Value;
                     4: EK :=ArtikelTabVK4.Value;
                   else EK :=ArtikelTabVK5.Value;
                 end;

                 DM1.CalcRabGrpPreis (ArtikelTabRABGRP_ID.AsString,0{EK},EK);
                 PosTabEPreis.Value :=EK;

            end
            else PosTabEPreis.Value     :=ArtikelTabEK_Preis.Value;


            PosTabRabatt.Value          :=ReEdiTabGlobRabatt.Value;
            PosTabSteuer_Code.Value     :=ArtikelTabSteuer_Code.Value;
            PosTabAltteil_Flag.Value    :=ArtikelTabAltTeil_Flag.Value;
            PosTabALTTEIL_PROZ.Value    :=0.1; // 10%
            PosTabALTTEIL_STCODE.Value  :=ArtikelTabSteuer_Code.Value;
            PosTabBEZ_FEST_Flag.Value   :=ArtikelTabNO_BEZEDIT_Flag.Value;

            PosTabGEGENKTO.Value        :=ArtikelTabAufw_Kto.Value;

            // Artikelnummer und Preis des Lieferanten holen wenn verfügbar
            DM1.Uniquery.Close;
            DM1.UniQuery.Sql.Text :=
              'select * from ARTIKEL_PREIS where PREIS_TYP=5 and '+
              'ARTIKEL_ID='+Inttostr(PosTabArtikel_ID.AsInteger)+
              ' and ADRESS_ID='+IntToStr(ReEdiTabAddr_ID.AsInteger);
            DM1.Uniquery.Open;
            if DM1.UniQuery.RecordCount>0 then
            begin
               EK :=DM1.UniQuery.FieldByName('PREIS').AsFloat;
               if EK <> 0 then PosTabEPreis.AsFloat :=EK;

               if length(DM1.UniQuery.FieldByName('BESTNUM').AsString)>0
                then PosTabArtnum.AsString :=DM1.UniQuery.FieldByName('BESTNUM').AsString;
            end;
            DM1.UniQuery.Close;



            PosTab.Post;
          except
            PosTab.Cancel;
          end;
          //Loading :=False;
          AppendOK :=False;

     end else
     if (ArtikelTab.RecordCount=1) and
        (ArtikelTabNo_EK_Flag.Value=True) then
     begin
        MessageBeep(0);
        MessageDlg ('Dieser Artikel hat eine Einkaufssperre'+#13#10+
                    'und kann deshalb nicht verwendet werden !',mterror,[mbok],0);

     end else
     begin
          // Hier Fehler, Artikel nicht gefunden !!!
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.UpdateLayout;
begin
     UpBtn.Enabled :=PosTab.RecNo>1;
     DownBtn.Enabled :=PosTab.RecNo<PosTab.RecordCount;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.UpdateLieferAdresse (ID : Integer);
begin
     DM1.KunTab.Close;
     DM1.KunTab.ParamByName ('ID').AsInteger :=ID;
     DM1.KunTab.Open;
     if (DM1.KunTab.RecordCount=1) then
     begin
        // Rechnungsanschrift des Kunden übernehmen
        L_Anrede.Text  :=DM1.KunTabAnrede.Value;
        L_Name1.Text   :=DM1.KunTabName1.Value;
        L_Name2.Text   :=DM1.KunTabName2.Value;
        L_Name3.Text   :=DM1.KunTabName3.Value;
        L_Strasse.Text :=DM1.KunTabStrasse.Value;
        L_Land.Text    :=DM1.KunTabLand.Value;
        L_PLZ.Text     :=DM1.KunTabPLZ.Value;
        L_Ort.Text     :=DM1.KunTabOrt.Value;
     end
        else
     begin
        // Adresse leer
        L_Anrede.Text  :='';
        L_Name1.Text   :='';
        L_Name2.Text   :='';
        L_Name3.Text   :='';
        L_Strasse.Text :='';
        L_Land.Text    :='';
        L_PLZ.Text     :='';
        L_Ort.Text     :='';
     end;

     L_Anrede2.Text  :=l_anrede.text;
     l_name1_2.Text  :=l_name1.text;
     l_name2_2.Text  :=l_name2.text;
     l_name3_2.Text  :=l_name3.text;
     l_strasse2.Text :=l_strasse.text;
     l_ort2.Text     :=l_ort.text;
     l_plz2.Text     :=l_plz.text;
     l_land2.Text    :=l_land.text;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert : String;
begin
     if assigned(OnUpdateStatusBar) then
     begin
       SuchZeit  :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
       Datensatz :='Beleg '+inttostr (ReEdiTab.RecNo)+
                   ' von '+inttostr (ReEdiTab.RecordCount);
       Erstellt  :='le.Änderung:'+
                   formatdatetime ('dd.mm.yyyy',ReEdiTabRDATUM.AsDateTime);

       if (ReEdiTab.RecordCount>0)and
          (not ReEdiTabTermin.IsNull)and
          (ReEdiTabTermin.AsDateTime>0)
        then Geaendert :='Termin : '+
                         FormatDateTime ('dd.mm.yyy',ReEdiTabTermin.AsDateTime)
        else Geaendert :='';

       if (PosTab.Active)and (PC1.ActivePage=PosTS)
        then Sortierung :='Position : '+inttostr (PosTab.RecNo)+
                          ' von '+inttostr (PosTab.RecordCount)
        else Sortierung :='-';

       OnUpdateStatusBar (SuchZeit,DatenSatz,Sortierung,Erstellt,Geaendert);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.FindDialog1Find(Sender: TObject);
var f,t : string;
    i : integer;
    Found : Boolean;
begin
     i :=ReEdiListGrid.Columns.Count;  // von Volker geändert
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
procedure TMakeEKBestForm.ReEdiTabAfterPost(DataSet: TDataSet);
begin
     BelDelBtn.Enabled :=ReEdiTab.RecordCount>0;
     Del1Btn.Enabled :=ReEdiTab.RecordCount>0;

     if (PC1.ActivePage=AdressTS)
      then UpdateLieferAdresse (REEdiTabLief_Addr_ID.Value);

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKBestForm.SetAdresse (ID : Integer);
begin
     DM1.ReKunTab.Close;
     DM1.ReKunTab.ParamByName('ID').AsInteger :=ID;
     DM1.ReKunTab.Open;

     if DM1.ReKunTab.RecordCount=1 then
     begin
         if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

         ReEdiTabADDR_ID.Value           :=DM1.ReKunTab.FieldByName('Rec_ID').AsInteger;
         ReEdiTabPR_EBENE.Value          :=0; //EK-Preis !!!

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

         ReEdiTabGEGENKONTO.Value        :=DM1.ReKunTab.FieldByName('KRD_NUM').AsInteger;
         ReEdiTabLiefart.Value           :=DM1.ReKunTab.FieldByName('LIEF_Liefart').AsInteger;
         ReEdiTabZahlart.Value           :=DM1.ReKunTab.FieldByName('LIEF_Zahlart').AsInteger;
         ReEdiTabKUN_NUM.Value           :=DM1.ReKunTab.FieldByName('Kunnum2').AsString;
         ReEdiTabWAEHRUNG.Value          :=DM1.ReKunTab.FieldByName('Waerung').AsString;

         ReEdiTabVERTRETER_ID.Value      :=DM1.ReKunTab.FieldByName('VERTRETER_ID').AsInteger;
         ReEdiTabGLOBRABATT.Value        :=DM1.ReKunTab.FieldByName('GRabatt').AsFloat;

         ReEdiTabMWST_FREI_FLAG.Value    :=DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean;
         ReEdiTabBRUTTO_FLAG.Value       :=False; // Kein Brutto im Einkauf

         ReEdiTab.Post;

         // in EK-Rechnungspositionen neue Adress_ID setzen
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
procedure TMakeEKBestForm.PosGridShowEditor(Sender: TObject; Field: TField;
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

end.

