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
Modul        : CAO_MAKEEKRECH
Stand        : 09.11.2003
Version      : 1.1.3.27
Beschreibung : Dialog EK-Erstellung / Bearbeitung

History :

09.05.2003 - Unit zum GNU-Source hinzugefügt
18.05.2003 - Anpassungen an neue DB
31.05.2003 - neuen Code zur Aktualisierung des Artikelfeldes MENGE_EKRE_EDI
             hinzugefügt
03.07.2003 - Bug in der Überprüfung der Anzahl der Seriennummern beseitigt
30.07.2003 - Bug #22 beseitigt
16.08.2003 - Bugfix bei Zahlungsart Vorkasse

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_MakeEKRech;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}
{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ComCtrls, Buttons, StdCtrls, DBCtrls, DBGrids, rxdbdateedit, RxDBGrid,
  CAO_ARTIKEL1, CAO_Kunde, ZDataset, ZAbstractRODataset, cao_var_const;

type

  { TMakeEKReForm }

  TMakeEKReForm = class(TForm)
    AlgPan3: TPanel;
    ArtikelPopupMenu: TPopupMenu;
    ArtikelTab: TZQuery;
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
    ArtikelTabNO_RABATT_FLAG: TBooleanField;
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
    ArtikelTabWARENGRUPPE: TZIntegerField;
    CaoGroupBox3: TGroupBox;
    DBEdit9: TDBEdit;
    OffBestGrid: TDBGrid;
    DBText17: TDBText;
    DBText16: TDBText;
    DBText15: TDBText;
    DBText10: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    CaoGroupBox4: TGroupBox;
    ProblemLab: TLabel;
    OffBestGB: TGroupBox;
    CaoGB3Pan: TPanel;
    PosiGB: TGroupBox;
    InfoGB1: TGroupBox;
    Label17: TLabel;
    Label26: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label14: TLabel;
    Label28: TLabel;
    Label16a: TLabel;
    DBEdit6: TDBEdit;
    Label34: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    Label37: TLabel;
    Label30: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label41: TLabel;
    Label33: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Panel1a: TPanel;
    Panel29a: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    OffBestGBPan: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel14: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel15: TPanel;
    OffBestSplitter: TSplitter;
    PosGrid: TRxDBGrid;
    SumPan: TPanel;
    bsumpan: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    RechInfoMemo: TDBMemo;
    DBMemo1: TDBMemo;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    USR2: TDBEdit;
    USR1: TDBEdit;
    Org_num: TDBEdit;
    RE_Datum: TRxDBDateEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit1: TDBEdit;
    WaehrungCB: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    ZahlartDB: TDBLookupComboBox;
    SK_Netto_Tage: TDBEdit;
    SK_Skonto_Proz: TDBEdit;
    SK_Skonto_Tage: TDBEdit;
    waehrung: TDBEdit;
    Zahlart: TDBEdit;
    DBText21: TDBText;
    DBText24: TDBText;
    DBText22: TDBText;
    DBText20: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    KunDatGB3: TGroupBox;
    KundatPan3: TPanel;
    KuNrEdit: TDBEdit;
    DBText11: TDBText;
    DBText4: TDBText;
    DBText7: TDBText;
    DBText12: TDBText;
    DBText1: TDBText;
    DBText6: TDBText;
    DBText5: TDBText;
    DBText9: TDBText;
    DBText8: TDBText;
    DBText3: TDBText;
    DBText2: TDBText;
    KunDatGB2: TGroupBox;
    InfoGB: TGroupBox;
    KunDatGB: TGroupBox;
    KundatPan2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label47: TLabel;
    Label31: TLabel;
    Label13: TLabel;
    Label27: TLabel;
    Label38: TLabel;
    Label15: TLabel;
    Label32: TLabel;
    Label23: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label53: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel24: TPanel;
    Panel23: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel2: TPanel;
    Panel26: TPanel;
    Panel22: TPanel;
    Panel8: TPanel;
    Panel25: TPanel;
    Panel13: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    KuNrEdtBtn: TSpeedButton;
    ZuweisungenGB: TGroupBox;
    KundatPan: TPanel;
    AlgPan2: TPanel;
    Panel7: TPanel;
    CaoGBPan: TPanel;
    ReEdiListGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator3: TDBNavigator;
    KopfNav2: TDBNavigator;
    freierArtikel1: TMenuItem;
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
    Label35: TLabel;
    Layoutspeichern1: TMenuItem;
    ButtonPan: TPanel;
    PC1: TPageControl;
    RePanel: TPanel;
    AuswahlBtn: TSpeedButton;
    AllgemeinBtn: TSpeedButton;
    PositionenBtn: TSpeedButton;
    FertigBtn: TSpeedButton;
    EdiListTS: TTabSheet;
    AdressTS: TTabSheet;
    PosTS: TTabSheet;
    Fertig: TTabSheet;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    NewBelBtn: TToolButton;
    BelDelBtn: TToolButton;
    ReEdiBtn: TToolButton;
    GotoAuswahlBtn: TToolButton;
    New1Btn: TToolButton;
    Del1Btn: TToolButton;
    GotoPosBtn: TToolButton;
    GotoAllgBtn: TToolButton;
    ToolBar5: TToolBar;
    ToolButton1: TToolButton;
    NeuArtBtn1: TToolButton;
    EditSNBtn: TToolButton;
    DelBtn: TToolButton;
    DownBtn: TToolButton;
    ToolButton2: TToolButton;
    GotoFertigBtn: TToolButton;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    BuchenBtn: TToolButton;
    UpBtn: TToolButton;
    ToolButton9: TToolButton;
    ToolButton4: TToolButton;
    TopPan: TPanel;
    SichtbareSpalten1: TMenuItem;
    N6: TMenuItem;
    Suchen1: TMenuItem;
    N1: TMenuItem;
    SpeichernundBuchen1: TMenuItem;
    N5: TMenuItem;
    Positionlschen1: TMenuItem;
    Storno1: TMenuItem;
    N2: TMenuItem;
    Texthinzufgen1: TMenuItem;
    N3: TMenuItem;
    neuenBelegerstellen1: TMenuItem;
    N4: TMenuItem;
    Positionen1: TMenuItem;
    Sortierung1: TMenuItem;
    Text1: TMenuItem;
    ReEdiDS: TDataSource;
    OffBestDS: TDataSource;
    PosDS: TDataSource;
    PosTabADDR_ID: TZIntegerField;
    PosTabALTTEIL_PROZ: TZDoubleField;
    PosTabARTIKELTYP: TZRawStringField;
    PosTabARTIKEL_ID: TZIntegerField;
    PosTabARTNUM: TZRawStringField;
    PosTabBARCODE: TZRawStringField;
    PosTabBEZEICHNUNG: TZRawCLobField;
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
    PosTabQUELLE_SRC: TZIntegerField;
    PosTabQUELLE_SUB: TZShortIntField;
    PosTabRABATT: TZDoubleField;
    PosTabREC_ID: TZIntegerField;
    PosTabSN_FLAG: TBooleanField;
    PosTabSTEUER_CODE: TZSmallIntField;
    PosTabVRENUM: TZIntegerField;
    ReEdiTabADATUM: TZDateField;
    ReEdiTabADDR_ID: TZIntegerField;
    ReEdiTabATMSUMME: TZDoubleField;
    ReEdiTabATRNUM: TZIntegerField;
    ReEdiTabATSUMME: TZDoubleField;
    ReEdiTabBEST_CODE: TZShortIntField;
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
    SNDS: TDataSource;
    KunTabABTEILUNG: TZRawStringField;
    KunTabANREDE: TZRawStringField;
    KunTabBANK: TZRawStringField;
    KunTabBLZ: TZRawStringField;
    KunTabBRIEFANREDE: TZRawStringField;
    KunTabBRT_TAGE: TZShortIntField;
    KunTabBRUTTO_FLAG: TZRawStringField;
    KunTabDEB_NUM: TZIntegerField;
    KunTabDEFAULT_LIEFANSCHRIFT_ID: TZIntegerField;
    KunTabDIVERSES: TZRawStringField;
    KunTabEMAIL: TZRawStringField;
    KunTabEMAIL2: TZRawStringField;
    KunTabENTFERNUNG: TZUInt64Field;
    KunTabERSTELLT: TZDateField;
    KunTabERST_NAME: TZRawStringField;
    KunTabFAX: TZRawStringField;
    KunTabFUNK: TZRawStringField;
    KunTabGEAEND: TZDateField;
    KunTabGEAEND_NAME: TZRawStringField;
    KunTabGRABATT: TZDoubleField;
    KunTabGRUPPE: TZRawStringField;
    KunTabIBAN: TZRawStringField;
    KunTabINFO: TZRawCLobField;
    KunTabINTERNET: TZRawStringField;
    KunTabKRD_NUM: TZIntegerField;
    KunTabKTO: TZRawStringField;
    KunTabKTO_INHABER: TZRawStringField;
    KunTabKUNDENGRUPPE: TZIntegerField;
    KunTabKUNNUM1: TZRawStringField;
    KunTabKUNNUM2: TZRawStringField;
    KunTabKUN_GEBDATUM: TZDateField;
    KunTabKUN_KRDLIMIT: TZDoubleField;
    KunTabKUN_LIEFART: TZIntegerField;
    KunTabKUN_PRLISTE: TZRawStringField;
    KunTabKUN_SEIT: TZDateField;
    KunTabKUN_ZAHLART: TZIntegerField;
    KunTabLAND: TZRawStringField;
    KunTabLIEF_LIEFART: TZIntegerField;
    KunTabLIEF_PRLISTE: TZRawStringField;
    KunTabLIEF_ZAHLART: TZIntegerField;
    KunTabMATCHCODE: TZRawStringField;
    KunTabMWST_FREI_FLAG: TZRawStringField;
    KunTabNAME1: TZRawStringField;
    KunTabNAME2: TZRawStringField;
    KunTabNAME3: TZRawStringField;
    KunTabNET_SKONTO: TZDoubleField;
    KunTabNET_TAGE: TZShortIntField;
    KunTabORT: TZRawStringField;
    KunTabPF_PLZ: TZRawStringField;
    KunTabPLZ: TZRawStringField;
    KunTabPOSTFACH: TZRawStringField;
    KunTabPROVIS_PROZ: TZDoubleField;
    KunTabPR_EBENE: TZShortIntField;
    KunTabREC_ID: TZIntegerField;
    KunTabSHOP_CHANGE_FLAG: TWordField;
    KunTabSHOP_DEL_FLAG: TStringField;
    KunTabSHOP_ID: TSmallintField;
    KunTabSHOP_KUNDE_ID: TLongintField;
    KunTabSHOP_PASSWORD: TStringField;
    KunTabSPRACH_ID: TZIntegerField;
    KunTabSTATUS: TZIntegerField;
    KunTabSTRASSE: TZRawStringField;
    KunTabSWIFT: TZRawStringField;
    KunTabTELE1: TZRawStringField;
    KunTabTELE2: TZRawStringField;
    KunTabUSERFELD_01: TStringField;
    KunTabUSERFELD_02: TStringField;
    KunTabUSERFELD_03: TStringField;
    KunTabUSERFELD_04: TStringField;
    KunTabUSERFELD_05: TStringField;
    KunTabUSERFELD_06: TStringField;
    KunTabUSERFELD_07: TStringField;
    KunTabUSERFELD_08: TStringField;
    KunTabUSERFELD_09: TStringField;
    KunTabUSERFELD_10: TStringField;
    KunTabUST_NUM: TZRawStringField;
    KunTabVERTRETER_ID: TZCardinalField;
    KunTabWAERUNG: TZRawStringField;
    KunTab: TZQuery;
    MainMenu1: TMainMenu;
    OffBestTab: TZQuery;
    OffBestTabARTIKEL_ID: TLongintField;
    OffBestTabARTNUM: TStringField;
    OffBestTabBEZEICHNUNG: TMemoField;
    OffBestTabEPREIS: TFloatField;
    OffBestTabLDATUM: TDateField;
    OffBestTabMATCHCODE: TStringField;
    OffBestTabMENGE_BEST: TFloatField;
    OffBestTabMENGE_EK: TFloatField;
    OffBestTabMENGE_OFFEN: TFloatField;
    OffBestTabPOSREC_ID: TLongintField;
    OffBestTabRABATT: TFloatField;
    OffBestTabRABATT2: TFloatField;
    OffBestTabRABATT3: TFloatField;
    OffBestTabRDATUM: TDateField;
    OffBestTabVRENUM: TLongintField;
    SNTab: TZQuery;
    SNTabARTIKEL_ID: TZIntegerField;
    SNTabEINK_NUM: TZIntegerField;
    SNTabEK_JOURNALPOS_ID: TZIntegerField;
    SNTabEK_JOURNAL_ID: TZIntegerField;
    SNTabSERNUMMER: TZRawStringField;
    PosTab: TZQuery;
    ReEdiTab: TZQuery;
    ReEdiTabZahlart_Str: TStringField;
    ReEdiTabWaehrung_Str: TStringField;
    ZuweisungenGB1: TGroupBox;
    procedure AddTextBtnClick(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Del1BtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure EditSNBtnClick(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure NeuArtBtnClick(Sender: TObject);
    procedure NeuFrArtBtnClick(Sender: TObject);
    procedure OffBestGridDblClick(Sender: TObject);
    procedure PosMatchButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GotoAllgBtnClick(Sender: TObject);
    procedure GotoAuswahlBtnClick(Sender: TObject);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure GotoFertigBtnClick(Sender: TObject);
    procedure GotoPosBtnClick(Sender: TObject);
    procedure KuNrEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure KuNrEditKeyPress(Sender: TObject; var Key: char);
    procedure KuNrEditButtonClick(Sender: TObject);
    procedure New1BtnClick(Sender: TObject);
    procedure OffBestTabAfterOpen(DataSet: TDataSet);
    procedure PC1Change(Sender: TObject);
    procedure PC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure PosDSDataChange(Sender: TObject; Field: TField);
    procedure PosGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure PosGridKeyPress(Sender: TObject; var Key: char);
    procedure PosTabAfterDelete(DataSet: TDataSet);
    procedure PosTabAfterScroll(DataSet: TDataSet);
    procedure PosTabBeforeDelete(DataSet: TDataSet);
    procedure PosTabBeforeEdit(DataSet: TDataSet);
    procedure PosTabBeforeInsert(DataSet: TDataSet);
    procedure PosTabBeforePost(DataSet: TDataSet);
    procedure PosTabCalcFields(DataSet: TDataSet);
    procedure PosTabNewRecord(DataSet: TDataSet);
    procedure RechInfoMemoEnter(Sender: TObject);
    procedure RechInfoMemoExit(Sender: TObject);
    procedure ReEdiDSDataChange(Sender: TObject; Field: TField);
    procedure ReEdiListGridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure PosTabAfterPost(DataSet: TDataSet);
    procedure ReEdiBtnClick(Sender: TObject);
    procedure ReEdiTabAfterPost(DataSet: TDataSet);
    procedure ReEdiTabAfterScroll(DataSet: TDataSet);
    procedure ReEdiTabBeforeClose(DataSet: TDataSet);
    procedure ReEdiTabBeforeDelete(DataSet: TDataSet);
    procedure ReEdiTabBeforePost(DataSet: TDataSet);
    procedure ReEdiTabCalcFields(DataSet: TDataSet);
    procedure ReEdiTabOnNewRecord(DataSet: TDataSet);
    procedure SNTabBeforePost(DataSet: TDataSet);
    procedure Suchen1Click(Sender: TObject);
    procedure UpBtnClick(Sender: TObject);
  private
    { Private-Deklarationen}
    //Loading   : Boolean;
    AppendOK  : Boolean;

    LastTS       : tTabSheet;
    LastEdiID    : Integer;
    LastPosID    : Integer;

    QueryTime    : DWord;
    //InDataChange : Boolean;
    procedure OnAddArtikel (ID : Integer; Menge : Double;
                            AlternativArtnum : String ='');
    procedure UpdateLayout;
    procedure UpdateStatus;
    procedure FindDialog1Find(Sender: TObject);
  public
    { Public-Deklarationen}
    First     : Boolean;
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure SetAdresse (ID : Integer);
  end;

var
  MakeEKReForm: TMakeEKReForm;

implementation

{$R *.frm}

uses CAO_DM, CAO_MAIN, cao_dbgrid_layout,
     CAO_MakeEKRech_FertigDlg, cao_sn_erfassen, cao_tool1;

{ TMakeEKReForm }

//------------------------------------------------------------------------------
procedure TMakeEKReForm.FormCreate(Sender: TObject);
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
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.FormActivate(Sender: TObject);
var Dummy : Boolean;
begin
     QueryTime :=GetTickCount64;
     if first then
     begin
       first :=False;

       PC1.ActivePage :=EdiListTS;

       dm1.GridLoadLayout (tDBGrid(ReEdiListGrid),'EDI_LISTE_EKRE',102);
       dm1.GridLoadLayout (tDBGrid(PosGrid),'EDI_POS_EKRE');

       PosTabMATCH_ARTNUM.DisplayLabel  :='Suchbegriff'+#13#10+'Artikelnummer';

//       PosGrid.RowColor1       :=DM1.C2Color;
//       OffBestGrid.RowColor1   :=DM1.C2Color;
//       ReEdiListGrid.RowColor1 :=DM1.C2Color;

//       OffBestGrid.EditColor   :=DM1.EditColor;
//       PosGrid.EditColor       :=DM1.EditColor;

       //Loading :=False;

       ReEdiTabNSUMME.DisplayFormat :=',###,##0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabMSUMME.DisplayFormat :=',###,##0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabBSUMME.DisplayFormat :=',###,##0.00 "'+DM1.LeitWaehrung+' "';
     end;

     PosTab.ParamByName ('ID').Value :=-1;
     ReEdiTab.Close;
     ReEdiTab.ParamByName ('QUELLE').Value :=EK_RECH_EDI;
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

     if PC1.ActivePage=EdiListTS then try ReEdiListGrid.SetFocus; except end;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
     if (sender is tSpeedButton)and
        (tSpeedButton(Sender).Enabled) then
     begin
       tSpeedButton(Sender).Transparent :=False;
       tSpeedButton(Sender).Font.Color :=clBlack;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.GotoAuswahlBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=EdiListTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.GotoAllgBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=AdressTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.Del1BtnClick(Sender: TObject);
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
procedure TMakeEKReForm.DelBtnClick(Sender: TObject);
begin
     PC1Change(Sender);
     PosTab.Delete;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.DownBtnClick(Sender: TObject);
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
procedure TMakeEKReForm.EditSNBtnClick(Sender: TObject);
begin
     SNTab.Close;
     SNTab.Sql.Clear;
     SNTab.Sql.Add ('SELECT * FROM ARTIKEL_SERNUM');
     SNTab.Sql.Add ('WHERE ARTIKEL_ID='+Inttostr(PosTabArtikel_ID.AsInteger));
     SNTab.Sql.Add ('AND EK_JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger));
     SNTab.Sql.Add ('AND EK_JOURNALPOS_ID='+Inttostr(PosTabRec_ID.AsInteger));
     SNTab.Open;
     SNErfassenForm.ErfasseSN (PosTabMenge.AsInteger);
     SNTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.Kopieren1Click(Sender: TObject);
begin
     DM1.CopyRechnung (ReEdiTabREC_ID.Value, EK_RECH_EDI);
     ReEdiTab.Refresh;
     ReEdiTab.Last;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.NeuArtBtnClick(Sender: TObject);
begin
     PC1Change(Sender);
     PosMatchButtonClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.NeuFrArtBtnClick(Sender: TObject);
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
        //PosTabBEZ_FEST.Value        :=0;
        PosTabSteuer_Code.Value     :=DM1.DefMwStCD;
        //PosTabAltteil.Value         :=0;
        //PosTabALTTEIL_PROZ.Value    :=0.1;
        //PosTabALTTEIL_STCODE.Value  :=DM1.DefMwStCD;
        UpdateLayout;

        PosTab.Post;
     except
        PosTab.Cancel;
     end;
     //Loading :=False;
     AppendOK :=False;

     PosGrid.SetFocus;

     for i:=0 to PosGrid.Columns.Count-1 do
      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.FixedCols :=i+1;  // von Volker geändert
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.OffBestGridDblClick(Sender: TObject);
begin
     OnAddArtikel (OffBestTab.FieldByName('ARTIKEL_ID').AsInteger,
                   OffBestTab.FieldByName('MENGE_OFFEN').AsFloat);

     try
        PosTab.DisableControls;
        if not (PosTab.State in [dsEdit,dsInsert]) then PosTab.Edit;
        PosTabQuelle_Src.AsInteger :=OffBestTab.FieldByName('POSREC_ID').AsInteger;
        PosTab.Post;
     except
        PosTab.Cancel;
     end;
     PosTab.EnableControls;

     // Offene Bestellungen aktualisieren
     OffBestTab.Refresh;
     OffBestTabAfterOpen(nil);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.DBGrid1DblClick(Sender: TObject);
var Dummy : Boolean;
begin
     if ReEdiTab.RecordCount = 0 then exit;

     PC1Changing (Sender,Dummy);

     if ReEdiTabAddr_ID.Value<0 then PC1.ActivePage :=AdressTS
                                else PC1.ActivePage :=PosTS;

     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.BuchenBtnClick(Sender: TObject);
var num : integer;
    MakeVK : Boolean;
begin
     num :=dm1.Buche_Einkauf (ReEdiTabREC_ID.Value);

     EKRechFertigDlg.ExecDialog (Num, MakeVK);

     if MakeVK then DM1.CopyRechnung (ReEdiTabREC_ID.Value, VK_RECH_EDI);

     LastTS    :=EdiListTS;
     LastEdiID :=-1;
     FormActivate(Sender);
     MainForm.FormActivate (Self);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.AddTextBtnClick(Sender: TObject);
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
        //PosTabBEZ_FEST.Value        :=0;
        PosTabSteuer_Code.Value     :=0;
        //PosTabAltteil.Value         :=0;
        //PosTabALTTEIL_PROZ.Value    :=0;
        //PosTabALTTEIL_STCODE.Value  :=0;

        UpdateLayout;

        PosTab.Post;
     except
        PosTab.Cancel;
     end;
     //Loading :=False;
     AppendOK :=False;

     PosGrid.SetFocus;

     for i:=0 to PosGrid.Columns.Count-1 do
      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.FixedCols :=i+1; // von Volker geändert
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     PosTab.Close;
     ReEdiTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
     if (sender is tSpeedButton) then
     begin
       tSpeedButton(Sender).Transparent :=True;
       tSpeedButton(Sender).Font.Color :=clWhite;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.FormDeactivate(Sender: TObject);
begin
     LastTS :=PC1.ActivePage;
     PC1Change(Sender);
     if assigned(MainForm.ArtForm) then MainForm.ArtForm.FormDeactivate (Sender);

     LastEdiID :=ReEdiTabRec_ID.AsInteger;
     ReEdiTab.Close;
     PosTab.Close;
     KunTab.Close;
     OffBestTab.Close;
     ArtikelTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.GotoFertigBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=Fertig;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.GotoPosBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=PosTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.KuNrEditKeyDown(Sender: TObject; var Key: Word;
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
procedure TMakeEKReForm.KuNrEditKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
          key :=#0;
          if uppercase(tControl(Sender).Name)='RECHINFOMEMO' then KuNrEdit.SetFocus
          else SendMessage (MainForm.Handle,WM_NEXTDLGCTL,0,0);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.KuNrEditButtonClick(Sender: TObject);
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
             if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

             SetAdresse (KSQueryRec_ID.AsInteger);
             Uebern :=False;
             FormDeactivate (Sender);
         end;
     end; // with
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.New1BtnClick(Sender: TObject);
begin
     ReEdiTab.Append;
     LastEdiID :=ReEdiTabRec_ID.Value;
     LastTS :=AdressTS;
     FormActivate(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.OffBestTabAfterOpen(DataSet: TDataSet);
begin
     OffBestGB.Visible :=(OffBestTab.Active)and(OffBestTab.RecordCount>0);
     OffBestSplitter.Visible :=OffBestGB.Visible;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PC1Change(Sender: TObject);
var Prob  : Boolean;
    S,S1  : String;
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
          if ReEdiTabOrgnum.Value='' then
          begin
               S :=S+'ER-Nummer (Belegnummer) ist leer'+#13#10;
               Prob :=True;
          end;

          // Seriennummern (Anzahl zu Pos.-Menge) prüfen

          dm1.UniQuery.close;
          dm1.uniquery.sql.clear;
          {
          dm1.uniquery.sql.add('select JP.REC_ID, JP.QUELLE, JP.JOURNAL_ID, JP.ARTIKEL_ID, JP.POSITION, JP.MENGE ,');
          dm1.uniquery.sql.add('COUNT(*) as SN0, SUM(SN.SNUM_ID)as SN1 from JOURNALPOS as JP');
          dm1.uniquery.sql.add('left outer join ARTIKEL_SERNUM as SN on JP.ARTIKEL_ID=SN.ARTIKEL_ID');
          dm1.uniquery.sql.add('and JP.JOURNAL_ID=SN.EK_JOURNAL_ID and SN.EK_JOURNALPOS_ID=JP.REC_ID');
          dm1.uniquery.sql.add('where JP.JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger));
          dm1.uniquery.sql.add('and JP.SN_FLAG="Y" group by JP.REC_ID');
          dm1.uniquery.sql.add('having MENGE<>SN0 or SN1=0');
          }
          dm1.uniquery.sql.add('select JP.REC_ID, JP.QUELLE, JP.JOURNAL_ID, JP.ARTIKEL_ID, JP.POSITION, JP.MENGE ,');
          dm1.uniquery.sql.add('COUNT(SN.SNUM_ID)as ANZ_SN from JOURNALPOS as JP');
          dm1.uniquery.sql.add('left outer join ARTIKEL_SERNUM as SN on JP.ARTIKEL_ID=SN.ARTIKEL_ID');
          dm1.uniquery.sql.add('and JP.JOURNAL_ID=SN.EK_JOURNAL_ID and SN.EK_JOURNALPOS_ID=JP.REC_ID');
          dm1.uniquery.sql.add('where JP.JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger));
          dm1.uniquery.sql.add('and JP.SN_FLAG="Y" group by JP.REC_ID');
          dm1.uniquery.sql.add('having MENGE<>ANZ_SN');

          dm1.uniquery.open;
          if dm1.uniquery.recordcount>0 then
          begin
             S1 :='';
             while not dm1.uniquery.eof do
             begin
                if length(s1)>0 then S1 :=S1+', ';
                S1 :=S1+dm1.uniquery.fieldbyname ('POSITION').AsString;
                dm1.uniquery.next;
             end;
             Prob :=True;
          end;

          if dm1.uniquery.RecordCount=1 then
          begin
            S :=S+'Bei der Artikelposition '+S1+' stimmt die Anz. der Seriennummern nicht mit der Artikelmenge überein'+#13#10;
          end
            else
          if dm1.uniquery.RecordCount>1 then
          begin
            S :=S+'Bei den Artikelpositionen '+S1+' stimmt die Anz. der Seriennummern nicht mit der Artikelmenge überein'+#13#10;
          end;

          dm1.uniquery.close;


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
          //Offene-Best-Tab aktualisieren
          if OffBestTab.ParamByName ('AID').AsInteger<>ReEdiTabAddr_ID.AsInteger then
          begin
            OffBestTab.Close;
            OffBestTab.ParamByName ('AID').AsInteger :=ReEdiTabAddr_ID.AsInteger;
            OffBestTab.Open;
          end
             else
          if not OffBestTab.Active then OffBestTab.Open;
     end;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PC1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
     QueryTime :=GetTickCount64;
     if PosTab.ParamByName ('ID').Value<>ReEdiTabREC_ID.Value then
     begin
       //Loading :=True;

       // Pos Tab aktualisieren
       if PosTab.Active then PosTab.Close;
       PosTab.ParamByName ('ID').AsInteger :=ReEdiTabREC_ID.Value;
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
     end;

     QueryTime :=GetTickCount64-QueryTime;
     UpdateStatus;

     if ReEdiTab.State in [dsEdit, dsInsert] then ReEdiTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosDSDataChange(Sender: TObject; Field: TField);
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
procedure TMakeEKReForm.PosGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_INSERT then
     begin
          key :=0;
          PosMatchButtonClick(Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosGridKeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (PosTab.State in [dsEdit,dsInsert]) then PosTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabAfterDelete(DataSet: TDataSet);
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
procedure TMakeEKReForm.PosTabAfterScroll(DataSet: TDataSet);
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

     EditSNBtn.Enabled :=(PosTab.RecordCount>0)and(PosTabSN_Flag.AsBoolean=True);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabBeforeDelete(DataSet: TDataSet);
begin
     // Seriennummern löschen ....
     dm1.UniQuery.close;
     dm1.UniQuery.sql.text :='DELETE from ARTIKEL_SERNUM where EK_JOURNALPOS_ID='+
                             IntToStr(PosTabRec_ID.AsInteger);
     dm1.UniQuery.ExecSql;
     dm1.UniQuery.close;

     // im Artkikel die MENGE_EKRE_EDI aktualisieren
     DM1.UpdateArtikelEdiMenge (EK_RECH_EDI,
                                PosTabArtikel_ID.AsInteger,
                                PosTabMenge.AsFloat);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabBeforeEdit(DataSet: TDataSet);
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
procedure TMakeEKReForm.PosTabBeforeInsert(DataSet: TDataSet);
begin
     if not AppendOK then
     begin
        MessageBeep(0);
        Abort;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabBeforePost(DataSet: TDataSet);
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
procedure TMakeEKReForm.PosTabCalcFields(DataSet: TDataSet);
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
procedure TMakeEKReForm.PosTabNewRecord(DataSet: TDataSet);
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
procedure TMakeEKReForm.RechInfoMemoEnter(Sender: TObject);
begin
     tDBEdit(sender).Color :=DM1.EditColor;  // $009FFF9F;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.RechInfoMemoExit(Sender: TObject);
begin
     tDBEdit(sender).Color :=clWindow;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiDSDataChange(Sender: TObject; Field: TField);
begin
     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabAfterPost(DataSet: TDataSet);
var ID : Integer;
    N, n0, n1, n2, n3, M ,m0 ,m1 ,m2 ,m3 ,B, Lohn, Ware, TKst : Double;
begin
     if PosTab.ControlsDisabled then exit;

     // im Artkikel die MENGE_EKRE_EDI aktualisieren
     DM1.UpdateArtikelEdiMenge (EK_RECH_EDI, PosTabArtikel_ID.AsInteger,0);

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
     DelBtn.Enabled :=PosTab.RecordCount>0;
     Positionlschen1.Enabled :=PosTab.RecordCount>0;
     EditSNBtn.Enabled :=(PosTab.RecordCount>0)and(PosTabSN_Flag.AsBoolean=True);

     // Offene Bestellungen aktualisieren
     if OffBestTab.Active then
     begin
       OffBestTab.Refresh;
       OffBestTabAfterOpen(nil);
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiBtnClick(Sender: TObject);
begin
     DBGrid1DblClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabAfterPost(DataSet: TDataSet);
begin
     BelDelBtn.Enabled :=ReEdiTab.RecordCount>0;
     Del1Btn.Enabled :=ReEdiTab.RecordCount>0;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabAfterScroll(DataSet: TDataSet);
begin
     ReEdiTabAfterPost (nil);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabBeforeClose(DataSet: TDataSet);
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
procedure TMakeEKReForm.ReEdiTabBeforeDelete(DataSet: TDataSet);
begin
     // evt. vorhandene Positionen löschen
     if PosTab.Active then PosTab.Close;
     PosTab.ParamByName ('ID').Value :=ReEdiTabREC_ID.Value;
     PosTab.Open;
     while not PosTab.EOF do
     begin
       // Positionen löschen
       PosTab.Delete;

       {
       //Seriennummern löschen
       dm1.UniQuery.close;
       dm1.UniQuery.sql.text :='DELETE from ARTIKEL_SERNUM where EK_JOURNAL_ID='+IntToStr(ReEdiTabRec_ID.AsInteger);
       dm1.UniQuery.ExecSql;
       dm1.UniQuery.close; }
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
     if ReEdiTabVRENUM.Value<1
     then ReEdiTabVRENUM.Value :=DM1.IncNummer (EK_RECH_EDI);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabCalcFields(DataSet: TDataSet);
begin
     if ReEdiTabTermin.AsDateTime > 100
      then ReEdiTabWV_DatumStr.Value :=FormatDateTime ('dd.mm.yyyy',ReEdiTabTermin.AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabOnNewRecord(DataSet: TDataSet);
var Dummy    : Boolean;
begin
     ReEdiTabQuelle.Value     :=EK_RECH_EDI;
     ReEdiTabQUELLE_SUB.Value :=0;
     ReEdiTabVLSNUM.Value     :=-1;
     ReEdiTabATRNUM.Value     :=-1;
     ReEdiTabGegenKonto.Value :=-1;
     ReEdiTabADDR_ID.Value    :=-1;
     ReEdiTabRDatum.AsDateTime:=Trunc (Now);
     ReEdiTabLDatum.AsDateTime:=0;
     ReEdiTabADatum.AsDateTime:=0;
     ReEdiTabKOST_NETTO.Value :=0;
     ReEdiTabWERT_NETTO.Value :=0;
     ReEdiTabLOHN.Value       :=0;
     ReEdiTabWARE.Value       :=0;
     ReEdiTabTKOST.Value      :=0;
     ReEdiTabNSUMME.Value     :=0;
     ReEdiTabMSUMME.Value     :=0;
     ReEdiTabBSUMME.Value     :=0;
     ReEdiTabATMSUMME.Value   :=0;
     ReEdiTabWaehrung.Value   :=DM1.LeitWaehrung;
     ReEdiTabPR_Ebene.Value   :=0; //EK
     ReEdiTabFolgeNr.Value    :=-1;
     ReEdiTabKM_Stand.Value   :=-1;
     ReEdiTabKFZ_ID.Value     :=-1;
     ReEdiTabVertreter_ID.Value :=-1;
     ReEdiTabGlobRabatt.Value :=0;
     ReEdiTabTermin.AsDateTime:=0;
     ReEdiTabLiefart.Value    :=-1;
     ReEdiTabZahlArt.Value    :=-1;

     ReEdiTabErstellt.AsDateTime:=now;
     ReEdiTabERST_NAME.Value :=DM1.View_User;

     ReEdiTabMWST_0.Value     :=DM1.MWSTTab[0];
     ReEdiTabMWST_1.Value     :=DM1.MWSTTab[1];
     ReEdiTabMWST_2.Value     :=DM1.MWSTTab[2];
     ReEdiTabMWST_3.Value     :=DM1.MWSTTab[3];

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
procedure TMakeEKReForm.SNTabBeforePost(DataSet: TDataSet);
begin
     if length(SNTabSERNUMMER.AsString)=0 then
     begin
       Abort;
       exit;
     end;

     SNTabARTIKEL_ID.AsInteger       :=PosTabArtikel_ID.AsInteger;
     SNTabEK_JOURNAL_ID.AsInteger    :=ReEdiTabRec_ID.AsInteger;
     SNTabEK_JOURNALPOS_ID.AsInteger :=PosTabRec_ID.AsInteger;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.Suchen1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.UpBtnClick(Sender: TObject);
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
procedure TMakeEKReForm.SetAdresse (ID : Integer);
begin
     DM1.ReKunTab.Close;
     DM1.ReKunTab.ParamByName('ID').AsInteger :=ID;
     DM1.ReKunTab.Open;

     if DM1.ReKunTab.RecordCount=1 then
     begin
         if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

         ReEdiTabADDR_ID.Value           :=DM1.ReKunTab.FieldByName('Rec_ID').AsInteger;
         ReEdiTabPR_EBENE.Value          :=0; //Einkauf !!!

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
procedure TMakeEKReForm.UpdateStatus;
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
procedure TMakeEKReForm.ReEdiListGridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if (assigned(TDBGrid (Sender).DataSource.DataSet)) and
        (odd(TDBGrid (Sender).DataSource.DataSet.RecNo)) and
        (not Highlight) then Background :=DM1.C2Color;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.UpdateLayout;
begin
     UpBtn.Enabled :=PosTab.RecNo>1;
     DownBtn.Enabled :=PosTab.RecNo<PosTab.RecordCount;
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosMatchButtonClick(Sender: TObject);
begin
    if not assigned(MainForm.ArtForm) then
    begin
         MainForm.ArtForm :=tArtikelForm.Create (Self{MainForm});
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
procedure TMakeEKReForm.OnAddArtikel (ID : Integer; Menge : Double;
                                      AlternativArtnum : String ='');
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
             //PosTabVLSNUM.Value          :=-1;
             //PosTabATRNum.Value          :=-1;

             PosTabArtikel_ID.Value      :=ArtikelTabREC_ID.Value;
             PosTabArtikelTyp.Value      :=ArtikelTabArtikelTyp.Value;

             PosTabArtNum.Value          :=ArtikelTabArtnum.Value;
             PosTabMatchCode.Value       :=ArtikelTabMatchCode.Value;
             PosTabBarCode.Value         :=ArtikelTabBarCode.Value;

             PosTabBezeichnung.AsString  :=ArtikelTabKurzName.AsString; //ArtikelTabLangName.AsString;
             PosTabLaenge.Value          :=ArtikelTabLaenge.Value;
             PosTabGroesse.Value         :=ArtikelTabGroesse.Value;
             PosTabDimension.Value       :=ArtikelTabDimension.Value;
             PosTabGewicht.Value         :=ArtikelTabGewicht.Value;
             PosTabME_Einheit.Value      :=ArtikelTabME_Einheit.Value;
             PosTabPR_Einheit.Value      :=ArtikelTabPR_Einheit.Value;

             // NEU
             PosTabSN_Flag.AsBoolean     :=ArtikelTabSN_Flag.AsBoolean;

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

             PosTabGEGENKTO.Value        :=ArtikelTabAufw_Kto.Value;

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
procedure TMakeEKReForm.FindDialog1Find(Sender: TObject);
var f,t : string;
    i : integer;
    Found : Boolean;
begin
     i :=ReEdiListGrid.FixedCols; // von Volker geändert
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

end.

