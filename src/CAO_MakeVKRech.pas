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
Modul        : CAO_MAKEVKRECH
Stand        : 16.05.2004
Version      : 1.2.5.4
Beschreibung : Dialog Rechnungserstellung / Bearbeitung

History :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
17.03.2003 - Rechnungen mit Betrag 0,00 jetzt möglich
11.05.2003 - Tabellen und Code zur Auswahl von Seriennummern hinzugefügt
18.05.2003 - Anpassungen an neue DB
23.05.2003 - Brutto-Preisberechnung implementiert
26.05.2003 - Verwendung von VK-Rabattgruppen implementiert
31.05.2003 - neuen Code zur Aktualisierung des Artikelfeldes MENGE_VKRE_EDI
             hinzugefügt
26.06.2003 - im Menü Spezial gibt es einen neuen Menüpunkt zur Umrechnung
             Brutto<-->Netto
29.06.2003 - Update Orderstatus für Shop eingebaut
30.07.2003 - Bug #22 beseitigt
16.08.2003 - Bugfix bei Zahlungsart Vorkasse
25.08.2003 - Auswahl der Lieferadresse eingebaut
27.08.2003 - Provisionsberechnung eingebaut
06.09.2003 - Lieferanschrift kann jetzt auch gelöscht werden
           - Tabelle JOURNALPOS Feld E_ROHGEWINN wird jetzt berechnet
             (VK-Einzelpreis - EK-Preis) bei Menge = 1 !!!
             Es muß also noch mit der Menge multipliziert werden und ggf. die
             Vertreterprovision abgezogen werden !
18.10.2003 - Bruto-Summen-Rundung eingebaut
21.10.2003 - Kundenpreise werden jetzt berücksichtigt
23.10.2003 - ShortCuts im Menü angepaßt
02.11.2003 - Gewicht und Rohgewinn zum Journal hinzugefügt, beides wird jetzt
             auch summiert
           - EK-Preis und CALC-Faktor in die POS-Tab hinzugefügt
           - Dieses Formular wird jetzt für Angebot + Rechnung verwendet
09.11.2003 - Bug nach Fertigstellen der Rechnung
             (Liste wurde nicht aktualisiert) gefixt
           - Bug beim editieren von Texten beseitigt
14.11.2003 - beim Hinzufügen von "freien Artikeln" wird jetzt die
             "Default-MwSt" verwendet
22.12.2003 - Shop-Status wird jetzt in der Liste mit angezeigt
24.12.2003 - die Kundennummer kann jetzt auch alphanumerisch eingegeben werden
07.01.2004 - Suchdialog eingebaut auf Seite Allgemein
18.01.2004 - Aufruf für den Export der Lieferdaten an Paketdienste hinzugefügt
             nur in der SP-Edition
19.02.2004 - Bug in der Berechnung des Rohgewinnes beseitigt

TODO :
 - Provision aus dem Kundenstamm muß noch einbezogen werden
 - Staffelpreise müssen noch berücksichtigt werden
 - Prüfung der Bankverbindung bei Lastschrift/nur Rechnung

}

unit CAO_MakeVKRech;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, ComCtrls, DBGrids, DBCtrls, Menus, Grids, rxdbdateedit,
  RxDBGrid, rxspin, rxcurredit, rxdbcomb, FZCommon, cyEditFloat, VolDBEdit,
  ZDataset, ZAbstractRODataset, cao_var_const, CAO_ARTIKEL1, CAO_Kunde;

type

  { TMakeVKReForm }

  TMakeVKReForm = class(TForm)
    AllgemeinBtn: TSpeedButton;
    ArtPreisTabADRESS_ID: TZIntegerField;
    ArtPreisTabARTIKEL_ID: TZIntegerField;
    ArtPreisTabBESTNUM: TZRawStringField;
    ArtPreisTabGEAEND: TZDateTimeField;
    ArtPreisTabGEAEND_NAME: TZRawStringField;
    ArtPreisTabINFO: TZRawCLobField;
    ArtPreisTabLieferantStr: TStringField;
    ArtPreisTabMENGE2: TZUInt64Field;
    ArtPreisTabMENGE3: TZCardinalField;
    ArtPreisTabMENGE4: TZUInt64Field;
    ArtPreisTabMENGE5: TZCardinalField;
    ArtPreisTabPREIS: TZDoubleField;
    ArtPreisTabPREIS2: TZDoubleField;
    ArtPreisTabPREIS3: TZDoubleField;
    ArtPreisTabPREIS4: TZDoubleField;
    ArtPreisTabPREIS5: TZDoubleField;
    ArtPreisTabPREIS_TYP: TZByteField;
    AuswahlBtn: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBText10: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText31: TDBText;
    DBText41: TDBText;
    DetailVPE: TDBEdit;
    DetailGewichtEdi: TDBEdit;
    DetailBarcode: TDBEdit;
    DetailMatch: TDBEdit;
    DetailArtnum: TDBEdit;
    DetailText: TDBMemo;
    DetailEPreisR: TCurrencyEdit;
    DetailRGW: TCurrencyEdit;
    CurrencyField1: TCurrencyField;
    best_num: TDBEdit;
    DetailFaktor: TcyEditFloat;
    DetailRGW_NR: TDBEdit;
    DetailGPreisB: TDBEdit;
    DetailMenge: TDBEdit;
    DetailMEEinheit: TDBEdit;
    DetailGPreis: TDBEdit;
    DetailRabatt: TDBEdit;
    DetailEPreis: TDBEdit;
    DetailEKPreis: TDBEdit;
    DBEdit6: TDBEdit;
    ArtLiefPreisGrid: TDBGrid;
    DetailEKPreisLab: TLabel;
    DetailFaktorLab: TLabel;
    DetailEPreisLab: TLabel;
    DetailRabattLab: TLabel;
    DetailEPreisRLab: TLabel;
    DetailMengeLab: TLabel;
    DetailMEEinheitLab: TLabel;
    DetailGPreisLab: TLabel;
    DetailGPreisBLab: TLabel;
    DetailAufpreisLab: TLabel;
    DetailRohertragLab: TLabel;
    DetailArtNumLab: TLabel;
    DetailMatchLab: TLabel;
    DetailBarcodeLab: TLabel;
    DetailGewichtLab: TLabel;
    DetailVPELab: TLabel;
    DetailArtikelTyp: TLabel;
    CaoGroupBox7: TGroupBox;
    CaoGroupBox2: TGroupBox;
    CaoGroupBox1: TGroupBox;
    CaoGroupBox5: TGroupBox;
    CaoGroupBox6: TGroupBox;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Ansicht1: TMenuItem;
    Adressezuweisen1: TMenuItem;
    Artikelhinzufgen1: TMenuItem;
    freienArtikelhinzufgen1: TMenuItem;
    Kopieren1: TMenuItem;
    EKBestellungerstellen1: TMenuItem;
    Lieferscheinerstellen1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Auswahl1: TMenuItem;
    Allgemein1: TMenuItem;
    Fertigstellen1: TMenuItem;
    Aktualisieren1: TMenuItem;
    AtrisImport1: TMenuItem;
    freierArtikel1: TMenuItem;
    Text1: TMenuItem;
    NeuArtBtn1: TToolButton;
    UmschaltungBruttoNetto1: TMenuItem;
    N7: TMenuItem;
    PossortierennachArtikelnummer1: TMenuItem;
    N6: TMenuItem;
    PosDetails1: TMenuItem;
    Positionen1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N5: TMenuItem;
    Suchen1: TMenuItem;
    N4: TMenuItem;
    Speichernundbuchen1: TMenuItem;
    Teillieferung1: TMenuItem;
    N3: TMenuItem;
    Positionlschen1: TMenuItem;
    Storno1: TMenuItem;
    N2: TMenuItem;
    Texthinzufgen1: TMenuItem;
    N1: TMenuItem;
    neuenBelegerstellen1: TMenuItem;
    Spezial1: TMenuItem;
    Sortierung1: TMenuItem;
    RohgewLab2: TPanel;
    Panel62: TPanel;
    Panel29: TPanel;
    Panel28: TPanel;
    Panel27: TPanel;
    ProblemLab: TLabel;
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
    Label39: TLabel;
    Label40: TLabel;
    Label78: TLabel;
    Label84: TLabel;
    Label79: TLabel;
    FertigSumPan: TPanel;
    FertigKundDatPan: TPanel;
    Kundendaten: TPanel;
    Panel999: TPanel;
    Panel3: TPanel;
    DBDateEdit1: TRxDBDateEdit;
    StadiumCB: TRxDBComboBox;
    SchnellMatchcode: TEdit;
    Label92: TLabel;
    SchnellBarcode: TEdit;
    Label91: TLabel;
    SchnellArtnum: TEdit;
    Label90: TLabel;
    Label94: TLabel;
    LiefGrid: TDBGrid;
    AddMengeEdi: TRxSpinEdit;
    StListGrid: TDBGrid;
    HistGrid: TDBGrid;
    DBLookupComboBox5: TDBLookupComboBox;
    CaoGroupBox8: TGroupBox;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBText11: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText23: TDBText;
    CaoGroupBox10: TGroupBox;
    Memo1: TMemo;
    SchnellerfassungGB: TGroupBox;
    PreisPC: TPageControl;
    Panel60: TPanel;
    Panel57: TPanel;
    Panel59: TPanel;
    Panel58: TPanel;
    Panel55: TPanel;
    PosDetailInfoPan: TPanel;
    Panel42: TPanel;
    Panel41: TPanel;
    PosDetailSumPan: TPanel;
    PosDetailCalcGB: TGroupBox;
    JvArrowButton1: TFZDropDownButton;
    KunDatGB2: TGroupBox;
    InfoRGW: TDBText;
    InfoEK: TDBText;
    DBText29: TDBText;
    KFZ_KMSTAND: TDBEdit;
    KFZFGSTNR: TDBEdit;
    KFZ_SCHL_ZU_3: TDBEdit;
    KFZ_SCHL_ZU_2: TDBEdit;
    KFZPolKZ: TDBEdit;
    BottomSpacePan: TPanel;
    InfoPanOut: TPanel;
    InfoEKLab: TLabel;
    InfoRGWLab: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label61: TLabel;
    Panelqqq: TPanel;
    Panelzzz: TPanel;
    PosDetailKundatPan: TPanel;
    Panel25: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel6: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panelyyy: TPanel;
    ArtikelPopupMenu: TPopupMenu;
    PosInfoPan: TPanel;
    Panel39: TPanel;
    Panel38: TPanel;
    PosSumPan: TPanel;
    PosKunDatPan: TPanel;
    PosGrid: TRxDBGrid;
    ShopStatusLab: TLabel;
    Label60: TLabel;
    Label62: TLabel;
    Label66: TLabel;
    Label65: TLabel;
    Label64: TLabel;
    RechInfoMemo: TDBMemo;
    L_Ort: TEdit;
    L_PLZ: TEdit;
    L_LAND: TEdit;
    L_Strasse: TEdit;
    L_Name3: TEdit;
    L_Name2: TEdit;
    L_Name1: TEdit;
    L_Anrede: TEdit;
    Label1: TLabel;
    Label16: TLabel;
    Label69: TLabel;
    Label68: TLabel;
    Label67: TLabel;
    Label42: TLabel;
    KFZNavZurueckBtn: TSpeedButton;
    KFZNavVorBtn: TSpeedButton;
    KFZUebernehmenBtn: TSpeedButton;
    KFZAddrErase: TSpeedButton;
    KFZAddrAssign: TSpeedButton;
    KFZAuswahlBtn: TSpeedButton;
    LiefAnschriftDelBtn: TSpeedButton;
    LiefAnschriftAuswahlBtn: TSpeedButton;
    PreisAlgTS: TTabSheet;
    PreisVKHisTS: TTabSheet;
    LiefPreisTS: TTabSheet;
    PreisEKHisTS: TTabSheet;
    EKBestTS: TTabSheet;
    PreisGrid: TStringGrid;
    TabSheet6: TTabSheet;
    StueckListTS: TTabSheet;
    LiefTS: TTabSheet;
    ToolBar1: TToolBar;
    ToolBar4: TToolBar;
    GotoAllgBtn: TToolButton;
    EditSNBtn1: TToolButton;
    PosDelBtn1: TToolButton;
    DownBtn1: TToolButton;
    GotoFertigBtn: TToolButton;
    PosDetailZurueckBtn: TToolButton;
    EditSNBtn2: TToolButton;
    PosDelBtn2: TToolButton;
    DownBtn2: TToolButton;
    PosDetailWeiterBtn: TToolButton;
    ToolBar5: TToolBar;
    LieferscheinBuchenBtn: TToolButton;
    TeillieferungBtn: TToolButton;
    BuchenBtn: TToolButton;
    ToolButton1: TToolButton;
    PrintPrevBtn: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton17: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    UpBtn2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton2: TToolButton;
    UpBtn1: TToolButton;
    ToolButton3: TToolButton;
    WaehrungCB: TDBLookupComboBox;
    ZahlartDB: TDBLookupComboBox;
    VertreterCB: TDBLookupComboBox;
    VersandCB: TDBLookupComboBox;
    GlobRabatt: TDBEdit;
    SK_Netto_Tage: TDBEdit;
    SK_Skonto_Proz: TDBEdit;
    SK_Skonto_Tage: TDBEdit;
    PR_EbeneCB: TVolgaDBEdit;
    waehrung: TDBEdit;
    Zahlart: TDBEdit;
    Vertreter: TDBEdit;
    Versand: TDBEdit;
    Label29: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label30: TLabel;
    Label6: TLabel;
    Label38: TLabel;
    Label27: TLabel;
    Label15: TLabel;
    Label26: TLabel;
    projekt: TDBEdit;
    usr1: TDBEdit;
    usr2: TDBEdit;
    DBText1: TDBText;
    DBText4: TDBText;
    DBText7: TDBText;
    DBText6: TDBText;
    DBText5: TDBText;
    KopfNav2: TDBNavigator;
    FertigBtn: TSpeedButton;
    ButtonPan: TPanel;
    BestellGB: TGroupBox;
    CaoGroupBox3: TGroupBox;
    KFZGB: TGroupBox;
    KundatGB: TGroupBox;
    KuNrEdit: TDBComboBox;
    Label23: TLabel;
    Label24: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label63: TLabel;
    Label47: TLabel;
    Label53: TLabel;
    Panel11: TPanel;
    Panel10: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel2: TPanel;
    Panelxxx: TPanel;
    RohgewLab1: TLabel;
    Label83: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    Label55: TLabel;
    Label14: TLabel;
    best_datum: TRxDBDateEdit;
    DBDateEdit2: TRxDBDateEdit;
    SumPan: TPanel;
    Panel18: TPanel;
    Panel17: TPanel;
    ShopStatusGB: TGroupBox;
    InfoGB: TGroupBox;
    LiefanschrGB: TGroupBox;
    Panel53: TPanel;
    TexteGB: TGroupBox;
    HisTabARTIKEL_ID: TZIntegerField;
    HisTabBRUTTO_FLAG: TZRawStringField;
    HisTabEPREIS: TZDoubleField;
    HisTabEPREIS_STR: TStringField;
    HisTabGPREIS_STR: TStringField;
    HisTabKUN_NAME1: TZRawStringField;
    HisTabLDATUM: TZDateField;
    HisTabMENGE: TZDoubleField;
    HisTabMWST_0: TZDoubleField;
    HisTabMWST_1: TZDoubleField;
    HisTabMWST_2: TZDoubleField;
    HisTabMWST_3: TZDoubleField;
    HisTabQUELLE: TZSmallIntField;
    HisTabRABATT: TZDoubleField;
    HisTabRDATUM: TZDateField;
    HisTabSTEUER_CODE: TZSmallIntField;
    HisTabSTEUER_PROZ: TFloatField;
    HisTabVLSNUM: TZIntegerField;
    HisTabVRENUM: TZIntegerField;
    HisTabWAEHRUNG: TZRawStringField;
    LiefTabARTNUM: TZRawStringField;
    LiefTabBEZEICHNUNG: TZRawCLobField;
    LiefTabKUN_NAME1: TZRawStringField;
    LiefTabLDATUM: TZDateField;
    LiefTabLIEFART: TZShortIntField;
    LiefTabMENGE: TZDoubleField;
    LiefTabVLSNUM: TZIntegerField;
    AlgPan2: TPanel;
    AlgPan3: TPanel;
    AlgSumPan: TPanel;
    ReAllgBottomPan: TPanel;
    PosDetailBtn: TSpeedButton;
    PositionenBtn: TSpeedButton;
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
    PosTabBSUMME: TCurrencyField;
    PosTabCALC_FAKTOR: TZDoubleField;
    PosTabCALC_LAGERMENGE: TFloatField;
    PosTabCALC_LAGERMENGE_STR: TStringField;
    PosTabCALC_RGEWINN: TFloatField;
    PosTabCALC_STEUERPORZ: TFloatField;
    PosTabDIMENSION: TZRawStringField;
    PosTabEK_PREIS: TZDoubleField;
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
    PosTabMENGE_GELIEFERT: TFloatField;
    PosTabME_EINHEIT: TZRawStringField;
    PosTabMSumme: TCurrencyField;
    PosTabMWST: TStringField;
    PosTabNO_RABATT_FLAG: TBooleanField;
    PosTabNSUMME: TCurrencyField;
    PosTabPOSITION: TZIntegerField;
    PosTabPROVIS_PROZ: TZDoubleField;
    PosTabPROVIS_WERT: TZDoubleField;
    PosTabPR_EINHEIT: TZDoubleField;
    PosTabQUELLE: TZShortIntField;
    PosTabQUELLE_SUB: TZShortIntField;
    PosTabRABATT: TZDoubleField;
    PosTabREC_ID: TZIntegerField;
    PosTabSN_FLAG: TZRawStringField;
    PosTabSTEUER_CODE: TZSmallIntField;
    PosTabVLSNUM: TZIntegerField;
    PosTabVPE: TZUInt64Field;
    PosTabVRENUM: TZIntegerField;
    ReEdiTabADATUM: TZDateField;
    ReEdiTabADDR_ID: TZIntegerField;
    ReEdiTabATMSUMME: TZDoubleField;
    ReEdiTabATRNUM: TZIntegerField;
    ReEdiTabATSUMME: TZDoubleField;
    ReEdiTabBEST_CODE: TZShortIntField;
    ReEdiTabBEST_DATUM: TZDateField;
    ReEdiTabBEST_NAME: TZRawStringField;
    ReEdiTabBRUTTO_FLAG: TBooleanField;
    ReEdiTabBSUMME: TZDoubleField;
    ReEdiTabCALC_SHOPSTATUS: TStringField;
    ReEdiTabERSTELLT: TZDateField;
    ReEdiTabERST_NAME: TZRawStringField;
    ReEdiTabFOLGENR: TZIntegerField;
    ReEdiTabGEGENKONTO: TZIntegerField;
    ReEdiTabGEWICHT: TZDoubleField;
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
    ReEdiTabPROVIS_WERT: TZDoubleField;
    ReEdiTabPR_EBENE: TZSmallIntField;
    ReEdiTabQUELLE: TZSmallIntField;
    ReEdiTabQUELLE_SUB: TZShortIntField;
    ReEdiTabRDATUM: TZDateField;
    ReEdiTabREC_ID: TZIntegerField;
    ReEdiTabROHGEWINN: TZDoubleField;
    ReEdiTabSHOP_CHANGE_FLAG: TZRawStringField;
    ReEdiTabSHOP_ID: TZShortIntField;
    ReEdiTabSHOP_ORDERID: TZIntegerField;
    ReEdiTabSHOP_STATUS: TZWordField;
    ReEdiTabSOLL_NTAGE: TZSmallIntField;
    ReEdiTabSOLL_RATBETR: TZDoubleField;
    ReEdiTabSOLL_RATEN: TZSmallIntField;
    ReEdiTabSOLL_RATINTERVALL: TZIntegerField;
    ReEdiTabSOLL_SKONTO: TZDoubleField;
    ReEdiTabSOLL_STAGE: TZSmallIntField;
    ReEdiTabSTADIUM: TZSmallIntField;
    ReEdiTabSTADIUM_STR: TStringField;
    ReEdiTabWV_DATUM: TZDateField;
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
    ReKFZTabADDR_ID: TZIntegerField;
    ReKFZTabFGST_NUM: TZRawStringField;
    ReKFZTabKFZ_ID: TZIntegerField;
    ReKFZTabKM_STAND: TZIntegerField;
    ReKFZTabLE_BESUCH: TZDateField;
    ReKFZTabNAE_AU: TZDateField;
    ReKFZTabNAE_TUEV: TZDateField;
    ReKFZTabPOL_KENNZ: TZRawStringField;
    ReKFZTabSCHL_ZU_2: TZRawStringField;
    ReKFZTabSCHL_ZU_3: TZRawStringField;
    ReKFZTabZULASSUNG: TZDateField;
    SNDS: TDataSource;
    ReEdiDS: TDataSource;
    ReKFZDS: TDataSource;
    PosDS: TDataSource;
    ArtPreisDS: TDataSource;
    LiefDS: TDataSource;
    HisDS: TDataSource;
    SNTabARTIKEL_ID: TZIntegerField;
    SNTabLIEF_NUM: TZIntegerField;
    SNTabLS_JOURNALPOS_ID: TZIntegerField;
    SNTabLS_JOURNAL_ID: TZIntegerField;
    SNTabSERNUMMER: TZRawStringField;
    SNTabVERK_NUM: TZIntegerField;
    SNTabVK_JOURNALPOS_ID: TZIntegerField;
    SNTabVK_JOURNAL_ID: TZIntegerField;
    STListDS: TDataSource;
    ReEdiListGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    PC1: TPageControl;
    ReEdiTopLab: TLabel;
    EdiListTS: TTabSheet;
    AdressTS: TTabSheet;
    PosTS: TTabSheet;
    PosDetailTS: TTabSheet;
    Fertig: TTabSheet;
    LiefTabLIEFART_STR: TStringField;
    STListTabARTNUM: TZRawStringField;
    STListTabART_ID: TZIntegerField;
    STListTabBARCODE: TZRawStringField;
    STListTabEK_PREIS: TZDoubleField;
    STListTabERSTELLT: TZDateField;
    STListTabERST_NAME: TZRawStringField;
    STListTabGEAEND: TZDateField;
    STListTabGEAEND_NAME: TZRawStringField;
    STListTabKURZNAME: TZRawStringField;
    STListTabMATCHCODE: TZRawStringField;
    STListTabMENGE: TZDoubleField;
    STListTabMENGE_AKT: TZDoubleField;
    STListTabREC_ID: TZIntegerField;
    ReEdiTabZAHLART_STR: TStringField;
    ReEdiTabLIEFART_STR: TStringField;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    NewBelBtn: TToolButton;
    BelDelBtn: TToolButton;
    ReEdiBtn: TToolButton;
    GotoAuswahlBtn: TToolButton;
    New1Btn: TToolButton;
    Del1Btn: TToolButton;
    GotoPosBtn: TToolButton;
    ToolButton9: TToolButton;
    ToolButton4: TToolButton;
    TopPan: TPanel;
    RePanel: TPanel;
    ArtPreisTab: TZQuery;
    HisTab: TZQuery;
    LiefTab: TZQuery;
    PosTab: TZQuery;
    ReEdiTab: TZQuery;
    ReKFZTab: TZQuery;
    SNTab: TZQuery;
    STListTab: TZQuery;
    best_name: TVolgaDBEdit;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure AlgPan3Resize(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure DetailArtnumEnter(Sender: TObject);
    procedure DetailArtnumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailArtnumKeyPress(Sender: TObject; var Key: char);
    procedure DownBtn1Click(Sender: TObject);
    procedure EditSNBtn1Click(Sender: TObject);
    procedure EKBestellungerstellen1Click(Sender: TObject);
    procedure KFZAddrAssignClick(Sender: TObject);
    procedure KFZAddrEraseClick(Sender: TObject);
    procedure KFZIDCBButtonClick(Sender: TObject);
    procedure KFZNavVorBtnClick(Sender: TObject);
    procedure KFZNavZurueckBtnClick(Sender: TObject);
    procedure KFZUebernehmenBtnClick(Sender: TObject);
    procedure KuNrEditEnter(Sender: TObject);
    procedure KuNrEditExit(Sender: TObject);
    procedure KuNrEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure KuNrEditKeyPress(Sender: TObject; var Key: char);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure LiefAnschriftAuswahlBtnClick(Sender: TObject);
    procedure LiefAnschriftDelBtnClick(Sender: TObject);
    procedure LieferscheinBuchenBtnClick(Sender: TObject);
    procedure PosDelBtn1Click(Sender: TObject);
    procedure PosGridKeyPress(Sender: TObject; var Key: char);
    procedure PosGridShowEditor(Sender: TObject; Field: TField;
          var AllowEdit: Boolean);
    procedure PosMatchButtonClick(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure NeuArtBtnClick(Sender: TObject);
    procedure ArtPreisTabCalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Del1BtnClick(Sender: TObject);
    procedure GotoAllgBtnClick(Sender: TObject);
    procedure GotoAuswahlBtnClick(Sender: TObject);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure DetailArtnumExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure GotoFertigBtnClick(Sender: TObject);
    procedure HisTabCalcFields(DataSet: TDataSet);
    procedure KuNrEditButtonClick(Sender: TObject);
    procedure NeuFrArtBtnClick(Sender: TObject);
    procedure NeuKomBtnClick(Sender: TObject);
    procedure New1BtnClick(Sender: TObject);
    procedure NewBelBtnClick(Sender: TObject);
    procedure PreisPCChange(Sender: TObject);
    procedure PreisPCResize(Sender: TObject);
    procedure PrintPrevBtnClick(Sender: TObject);
    procedure ReEdiListGridApplyCellAttribute(Sender: TObject;
      Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure PC1Change(Sender: TObject);
    procedure PC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure GotoPosBtnClick(Sender: TObject);
    procedure PosDetailBtnClick(Sender: TObject);
    procedure PosDSDataChange(Sender: TObject; Field: TField);
    procedure PosTabAfterDelete(DataSet: TDataSet);
    procedure PosTabAfterPost(DataSet: TDataSet);
    procedure PosTabAfterScroll(DataSet: TDataSet);
    procedure PosTabBeforeDelete(DataSet: TDataSet);
    procedure PosTabBeforeEdit(DataSet: TDataSet);
    procedure PosTabBeforeInsert(DataSet: TDataSet);
    procedure PosTabBeforePost(DataSet: TDataSet);
    procedure PosTabCalcFields(DataSet: TDataSet);
    procedure PosTabNewRecord(DataSet: TDataSet);
    procedure ReEdiDSDataChange(Sender: TObject; Field: TField);
    procedure ReEdiListGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ReEdiTabAfterPost(DataSet: TDataSet);
    procedure ReEdiTabAfterScroll(DataSet: TDataSet);
    procedure ReEdiTabBeforeClose(DataSet: TDataSet);
    procedure ReEdiTabBeforeDelete(DataSet: TDataSet);
    procedure ReEdiTabBeforeEdit(DataSet: TDataSet);
    procedure ReEdiTabBeforePost(DataSet: TDataSet);
    procedure ReEdiTabCalcFields(DataSet: TDataSet);
    procedure ReEdiTabNewRecord(DataSet: TDataSet);
    procedure ReKFZTabAfterScroll(DataSet: TDataSet);
    procedure SchnellArtnumExit(Sender: TObject);
    procedure SchnellArtnumKeyPress(Sender: TObject; var Key: char);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure TeillieferungBtnClick(Sender: TObject);
    procedure PosGridApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; State: TGridDrawState);
    procedure UpBtn1Click(Sender: TObject);
  private
    { Private-Deklarationen}

    BelegArt      : Integer; // AGB, RE oder Lieferschein
    BelegArtStr   : String;
    BelegName     : String;

    Loading       : Boolean;
    AppendOK      : Boolean;
    LastF9        : Boolean;
    QueryTime     : DWord;

    LastTS        : tTabSheet;
    LastEdiID     : Integer;
    LastKunNum    : String;

    InDetailCalc  : Boolean;
    //InDataChange : Boolean;

    UseKurztext   : Boolean;
    OldShopStatus : Integer;

    procedure OnAddArtikel (ID : Integer; Menge : Double;
                            AlternativArtnum : String ='');
    procedure UpdateLayout;
    procedure UpdateStatus;

    procedure UpdateLieferanschrift;
    procedure UpdateArtikelDetails;
    procedure FindDialog1Find(Sender: TObject);
    procedure UpdateAnsprechpartner;
  public
    { Public-Deklarationen}
    First        : Boolean;

    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure F9Change (Ein : Boolean);
    procedure SetAdresse (ID : Integer);
    procedure SetBelegArt (NewBelegArt : Integer);
  end;

var
  MakeVKReForm: TMakeVKReForm; // Rechnung
  MakeAGBForm:  TMakeVKReForm; // Angebot

implementation

{$R *.frm}

uses CAO_DM, CAO_MAIN, cao_dbgrid_layout, Variants,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     {$IFDEF PRO}cao_liefexport_dlg,{$ENDIF}
     cao_teillieferdlg, CAO_KFZ1, cao_sn_auswahl, cao_adressen_lief, cao_tool1;

const
  ArtInfoSqlS =
   'select '+
   'A.REC_ID,A.EK_PREIS,'+
   'A.VK1,A.VK2,A.VK3,A.VK4,A.VK5,A.VK1B,A.VK2B,A.VK3B,A.VK4B,A.VK5B, '+
   'AP.PREIS,AP.MENGE2,AP.PREIS2,AP.MENGE3,AP.PREIS3,AP.MENGE4,AP.PREIS4, '+
   'AP.MENGE5,AP.PREIS5,A.MENGE_AKT,A.MENGE_BESTELLT, '+
   'A.RABGRP_ID,A.MENGE_VKRE_EDI as MENGE_RESERVIERT, '+
   'A.ALTTEIL_FLAG,A.NO_RABATT_FLAG,A.NO_PROVISION_FLAG,A.NO_BEZEDIT_FLAG,'+
   'A.NO_VK_FLAG,A.SN_FLAG,A.PROVIS_PROZ,A.STEUER_CODE,A.ERLOES_KTO,A.AUFW_KTO,'+
   'A.ARTNUM,A.ERSATZ_ARTNUM,A.MATCHCODE,A.WARENGRUPPE,A.BARCODE,A.ARTIKELTYP,'+
   'A.KAS_NAME,A.ME_EINHEIT,A.PR_EINHEIT,A.VPE,'+
   'A.LAENGE,A.GROESSE,A.DIMENSION,A.GEWICHT,A.INFO,KURZNAME,LANGNAME, '+
   'AP.PREIS_TYP,AP.ADRESS_ID,AP.BESTNUM ';
  ArtInfoSQLW1 =
   ',0.00 as MENGE_LIEF, 0.00 as MENGE_SOLL, A.REC_ID as JID '+
   'from ARTIKEL A '+
   'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID=A.REC_ID '+
   'where A.REC_ID=:AID '+
   'group by A.REC_ID, AP.PREIS_TYP, AP.ADRESS_ID';
  ArtInfoSQLW2 =
   ',SUM(JP2.MENGE) as MENGE_LIEF, JP1.MENGE as MENGE_SOLL, JP1.REC_ID as JID '+
   'from JOURNALPOS JP1,ARTIKEL A '+
   'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID=A.REC_ID '+
   'left outer join JOURNALPOS JP2 on JP2.QUELLE_SRC=JP1.REC_ID and JP2.QUELLE=2 '+
   'where (JP1.JOURNAL_ID=:JID) and (JP1.QUELLE=:QUELLE) and '+
   '(JP1.ARTIKEL_ID=A.REC_ID) '+
   'group by A.REC_ID, AP.PREIS_TYP, AP.ADRESS_ID, JP1.REC_ID';

//------------------------------------------------------------------------------
procedure TMakeVKReForm.F9Change (Ein : Boolean);
begin
     LastF9 :=Ein;
     InfoPanOut.Visible         :=LastF9;
     DetailEKPreisLab.Visible   :=LastF9;
     DetailFaktorLab.Visible    :=LastF9;
     DetailRohertragLab.Visible :=LastF9;
     DetailAufpreisLab.Visible  :=LastF9;
     DetailEKPreis.Visible      :=LastF9;
     DetailFaktor.Visible       :=LastF9;
     DetailRGW.Visible          :=LastF9;
     DetailRGW_NR.Visible       :=LastF9;

     DBText10.Visible         :=LastF9;
     RohgewLab1.Visible         :=LastF9;

     DetailEPreis.Left       :=185 - Ord(not Ein) * 174;
     DetailEPreisLab.Left    :=186 - Ord(not Ein) * 174;
     DetailRabattLab.Left    :=278 - Ord(not Ein) * 174;
     DetailRabatt.Left       :=277 - Ord(not Ein) * 174;
     DetailEPreisRLab.Left   :=344 - Ord(not Ein) * 174;
     DetailEPreisR.Left      :=343 - Ord(not Ein) * 174;
     DetailMengeLab.Left     :=435 - Ord(not Ein) * 174;
     DetailMenge.Left        :=436 - Ord(not Ein) * 174;
     DetailMEEinheitLab.Left :=486 - Ord(not Ein) * 174;
     DetailMEEinheit.Left    :=485 - Ord(not Ein) * 174;
     DetailGPreisLab.Left    :=540 - Ord(not Ein) * 174;
     DetailGPreis.Left       :=539 - Ord(not Ein) * 174;
     DetailGPreisBLab.Left   :=630 - Ord(not Ein) * 174;
     DetailGPreisB.Left      :=630 - Ord(not Ein) * 174;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.SetAdresse (ID : Integer);
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

         ReEdiTabLIEF_ADDR_ID.AsInteger  :=DM1.ReKunTab.FieldByName('DEFAULT_LIEFANSCHRIFT_ID').AsInteger;

         ReEdiTab.Post;

         LastKunNum                      :=ReEdiTabKUN_NUM.AsString;

         if (DM1.Use_KFZ) then
         begin
            if  ReKFZTab.Active then ReKFZTab.Close;
            ReKFZTab.ParamByName ('KID').asInteger :=ReEdiTabKFZ_ID.Value;
            ReKFZTab.ParamByName ('AID').asInteger :=ReEdiTabADDR_ID.Value;
            ReKFZTab.Open;

            ReKFZTab.Locate ('KFZ_ID',ReEdiTabKFZ_ID.Value,[]);
         end;

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

         if ReEdiTabLIEF_ADDR_ID.AsInteger>0 then UpdateLieferanschrift;

     end;

     DM1.ReKunTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.SetBelegArt (NewBelegArt : Integer);
var i : integer; found : boolean;
begin
     BelegArt :=NewBelegArt;
     case BelegArt of
        VK_RECH_EDI : begin
                        BelegArtStr :='RE_EDI';
                        BelegName   :='Rechnung';

                      end;
        VK_AGB_EDI  : begin
                        BelegArtStr :='AGB_EDI';
                        BelegName   :='Angebot';
                        //div. Buttons abschalten
                        LieferscheinBuchenBtn.Visible :=False;

                        ToolButton8.Visible :=False;
                        TeillieferungBtn.Visible :=False;
                        Teillieferung1.Visible :=False;
                        Lieferscheinerstellen1.Visible :=False;

                        ToolButton6.Visible :=False;
                        BuchenBtn.Caption :='Speichern';
                        Speichernundbuchen1.Caption :='Speichern';

                        try LiefTS.TabVisible :=False; except end;

                        EditSNBtn1.Visible :=False;
                        EditSNBtn2.Visible :=False;

                        if PosGrid.Columns.Count>0 then
                        begin
                          repeat
                            found :=false;
                            for i:=0 to PosGrid.Columns.Count-1 do
                            begin
                               if (uppercase(PosGrid.Columns[i].FieldName)='MENGE_GELIEFERT') or
                                  (uppercase(PosGrid.Columns[i].FieldName)='VLSNUM') then
                               begin
                                  PosGrid.Columns[i].Free;
                                  Found :=True;
                                  break;
                               end;
                            end;
                          until found=False;
                        end;
                      end;
     end; // case
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabAfterPost(DataSet: TDataSet);
var ID : Integer;
    N, n0, n1, n2, n3,
    M, m0, m1, m2, m3,
    B, b0, b1, b2, b3,
    P, Lohn, Ware, TKst, Gewicht, RGW : Double;
    T : Char;
begin
     if PosTab.ControlsDisabled then exit;

     DM1.UpdateArtikelEdiMenge (BelegArt,PosTabArtikel_ID.AsInteger,0);

     ID :=PosTabRec_ID.Value;
     PosTab.DisableControls;
     N :=0; N0 :=0; N1 :=0; N2 :=0; N3 :=0;
     M :=0; M0 :=0; M1 :=0; M2 :=0; M3 :=0;
     B :=0; B0 :=0; B1 :=0; B2 :=0; B3 :=0;
     P :=0; Gewicht :=0; RGW :=0; Lohn :=0; Ware :=0; TKst :=0;
     try
        PosTab.First;
        while not PosTab.Eof do
        begin
           N :=N+PosTabNSumme.Value;
           B :=B+PosTabBSumme.Value;
           P :=P+PosTabPROVIS_WERT.Value;

           RGW     :=RGW+(PosTabE_RGEWINN.AsFloat*PosTabMenge.AsFloat);

           Gewicht :=Gewicht+(PosTabGewicht.AsFloat*PosTabMenge.AsFloat);

           case PosTabSteuer_code.Value of
             0:begin N0 :=N0 + PosTabNSumme.Value; B0 :=B0 + PosTabBSumme.Value;{M0 :=M0+PosTabMSumme.Value;} end;
             1:begin N1 :=N1 + PosTabNSumme.Value; B1 :=B1 + PosTabBSumme.Value;{M1 :=M1+PosTabMSumme.Value;} end;
             2:begin N2 :=N2 + PosTabNSumme.Value; B2 :=B2 + PosTabBSumme.Value;{M2 :=M2+PosTabMSumme.Value;} end;
             3:begin N3 :=N3 + PosTabNSumme.Value; B3 :=B3 + PosTabBSumme.Value;{M3 :=M3+PosTabMSumme.Value;} end;
           end;

           // Lohn, Ware, Transportkosten
           if length (PosTabArtikelTyp.AsString)=1
            then T :=PosTabArtikelTyp.AsString[1]
            else T :='?';

           case t of
               'N','S','V','F' : Ware :=Ware + PosTabNSumme.Value;
               'L'             : Lohn :=Lohn + PosTabNSumme.Value;
               'K'             : TKst :=TKst + PosTabNSumme.Value;
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

        // Brutto-Wert-Rundung
        if DM1.BR_SUM_RUND_WERT>1
          then B :=CAO_Round (B*100 / DM1.BR_SUM_RUND_WERT)* DM1.BR_SUM_RUND_WERT /100;

        RGW :=cao_round(rgw*100)/100;
        Gewicht :=cao_round(gewicht*1000)/1000;
        P :=cao_round(p*100)/100;

        if (ReEdiTabNSumme.Value      <> N)or
           (ReEdiTabMSumme.Value      <> M)or
           (ReEdiTabBSumme.Value      <> B)or
           (ReEdiTabPROVIS_WERT.Value <> P)or
           (ReEdiTabWare.Value        <> Ware)or
           (ReEdiTabLohn.Value        <> Lohn)or
           (ReEdiTabTKost.Value       <> TKst)or
           (ReEdiTabROHGEWINN.Value   <> RGW)or
           (ReEdiTabGewicht.Value     <> Gewicht)then
        begin
           try
              if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

              ReEdiTabNSumme.Value      :=N;
              ReEdiTabMSumme_0.Value    :=M0;
              ReEdiTabMSumme_1.Value    :=M1;
              ReEdiTabMSumme_2.Value    :=M2;
              ReEdiTabMSumme_3.Value    :=M3;
              ReEdiTabMSumme.Value      :=M;
              ReEdiTabBSumme.Value      :=B;
              ReEdiTabPROVIS_WERT.Value :=P;
              ReEdiTabRDATUM.AsDateTime :=now;
              ReEdiTabWare.Value        :=Ware;
              ReEdiTabLohn.Value        :=Lohn;
              ReEdiTabTKost.Value       :=TKst;
              ReEdiTabROHGEWINN.Value   :=RGW;
              ReEdiTabGewicht.Value     :=Gewicht;

              ReEdiTab.Post;
           except
              ReEdiTab.Cancel;
           end;
        end;
        PosTab.EnableControls;
     end;

     PosDelBtn1.Enabled :=PosTab.RecordCount>0;
     PosDelBtn2.Enabled :=PosTab.RecordCount>0;

     Positionlschen1.Enabled :=PosTab.RecordCount>0;

     EditSNBtn1.Enabled :=(PosTab.RecordCount>0)and(PosTabSN_Flag.AsBoolean=True);
     EditSNBtn2.Enabled :=EditSNBtn1.Enabled;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabAfterDelete(DataSet: TDataSet);
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
procedure TMakeVKReForm.DetailArtnumExit(Sender: TObject);
var me1, me2 : double;
begin
     if (Sender=nil)or(tWinControl(Sender).Name='DetailMenge') then
     begin
        if PosTabVPE.AsInteger<>0
         then me1 :=int(PosTabMenge.AsFloat / PosTabVPE.AsInteger)
         else me1 :=0;

        if PosTabVPE.AsInteger<>0
         then me2 :=PosTabMenge.AsFloat / PosTabVPE.AsInteger
         else me2 :=0;

        if (PosTabVPE.AsInteger>0)and(me1 <> me2) then
        begin
           MessageDlg ('Die Menge muß gleich oder ein vielfaches '+
                       'der Verpackungseinheit sein !',mterror,[mbok],0);

           PosTabMenge.AsFloat :=(me1+1)*PosTabVPE.AsInteger;
        end;
     end;
     if assigned(Sender) then tDBEdit(sender).Color :=clWindow;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.AlgPan3Resize(Sender: TObject);
begin
     if LiefanschrGB.Visible then
     begin
        LiefAnschriftAuswahlBtn.Left :=LiefanschrGB.Width -
                                       LiefAnschriftAuswahlBtn.Width - 9;

        LiefAnschriftDelBtn.Left     :=LiefAnschriftAuswahlBtn.Left -
                                       LiefAnschriftDelBtn.Width - 4;

        L_Anrede.Width :=LiefanschrGB.Width -
                         LiefAnschriftAuswahlBtn.Width -
                         LiefAnschriftDelBtn.Width - 5 - 9 - 5 - L_Anrede.Left;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.Aktualisieren1Click(Sender: TObject);
begin
     if PC1.ActivePage=EdiListTS then
     begin
        ReEdiTab.Refresh;
     end
        else
     if (PC1.ActivePage=PosTS)or(PC1.ActivePage=PosDetailTS) then
     begin
        DM1.ArtInfoTab.Refresh;
        PosTab.Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.BuchenBtnClick(Sender: TObject);
var num : integer;
begin
     case BelegArt of
          VK_RECH_EDI : num :=dm1.Buche_Rechnung (ReEdiTabREC_ID.Value);
          VK_AGB_EDI  : num :=dm1.Buche_Angebot  (ReEdiTabREC_ID.Value);
     end;
     {$IFDEF REPORTBUILDER}
     if num>=0 then PrintRechForm.ShowBelegDlg (BelegArt-10,ReEdiTabREC_ID.Value,False);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Beleges'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}

     LastTS    :=EdiListTS;
     LastEdiID :=-1;
     ReEdiTab.Close;
     FormActivate(Sender);
     MainForm.FormActivate (Self);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailArtnumEnter(Sender: TObject);
begin
     tDBEdit(sender).Color :=DM1.EditColor;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailArtnumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Shift=[]) and (key=33) then // PGUP
     begin
          PosTab.Prior;
          key :=0;
     end else
     if (Shift=[]) and (key=34) then // PGDOWN
     begin
          PosTab.Next;
          key :=0;
     end else
     if (Shift=[]) and (key=VK_UP) and
        (uppercase(tControl(Sender).Name)<>'DETAILTEXT') then
     begin
          AddMengeEdi.Value :=AddMengeEdi.Value +1;
          key :=0;
     end else
     if (Shift=[]) and (key=VK_DOWN) and
        (uppercase(tControl(Sender).Name)<>'DETAILTEXT') then
     begin
          if AddMengeEdi.Value>=1
           then AddMengeEdi.Value :=AddMengeEdi.Value -1
           else MessageBeep(0);
          key :=0;
     end else

     if (key=9)and
        (uppercase(tControl(Sender).Name)='DETAILTEXT')and
        (Shift=[ssShift]) then
     begin
          key :=0;
          DetailVPE.setfocus;
     end else
     if (key=9)and
        (uppercase(tControl(Sender).Name)='DETAILTEXT')and
        (Shift=[ssCtrl]) then
     begin
          DetailText.SelText :=#9;
          key :=0;
     end else
     if (key=9)and
        (uppercase(tControl(Sender).Name)='DETAILTEXT')and
        (Shift=[]) then
     begin
          SendMessage (RePanel.Parent.Parent.Handle,WM_NEXTDLGCTL,0,0);
          key :=0;
     end;

end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailArtnumKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13 then
     begin
          key :=#0;
          SendMessage (RePanel.Parent.Parent.Handle,WM_NEXTDLGCTL,0,0);
     end else
     if Key=#9 then Key :=#0;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.DownBtn1Click(Sender: TObject);
var CurrPos,Pos : Integer;
begin
    PC1Change(Sender);
    PosTab.DisableControls;
    DownBtn1.Enabled :=False;
    DownBtn2.Enabled :=False;
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
     DownBtn1.Enabled :=True;
     DownBtn2.Enabled :=True;
    end;
    PosTabAfterScroll(nil);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.EditSNBtn1Click(Sender: TObject);
begin
     SNTab.Close;
     SNTab.Sql.Clear;
     SNTab.Sql.Add ('SELECT * FROM ARTIKEL_SERNUM');
     SNTab.Sql.Add ('WHERE ARTIKEL_ID='+Inttostr(PosTabArtikel_ID.AsInteger));
     SNTab.Sql.Add ('AND VK_JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger));
     SNTab.Sql.Add ('AND VK_JOURNALPOS_ID='+Inttostr(PosTabRec_ID.AsInteger));
     SNTab.Open;
     SNAuswahlForm.AuswahlSN (PosTabMenge.AsInteger,
                              PosTabArtikel_ID.AsInteger,
                              SNTab,
                              ReEdiTabRec_ID.AsInteger,
                              PosTabRec_ID.AsInteger,
                              SNDS);
     SNTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.EKBestellungerstellen1Click(Sender: TObject);
begin
     DM1.CopyRechnung (ReEdiTabREC_ID.Value, EK_BEST_EDI);
     ReEdiTab.Refresh;
     ReEdiTab.Last;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZAddrAssignClick(Sender: TObject);
begin
     ReKFZTab.Edit;
     ReKFZTabAddr_ID.Value :=ReEdiTabAddr_ID.Value;
     ReKFZTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZAddrEraseClick(Sender: TObject);
begin
     if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

     ReEdiTabKFZ_ID.Value       :=-1;
     ReEdiTabKM_Stand.Value     :=-1;

     ReEdiTab.Post;
     ReKFZTabAfterScroll(nil);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZIDCBButtonClick(Sender: TObject);
begin
     if not assigned(MainForm.KFZForm2) then
     begin
        MainForm.KFZForm2 :=TKFZForm.Create (Self{MainForm});
        with MainForm.KFZForm2 do
        begin
             BorderStyle :=bsSizeable;
             Height      :=500;
             Width       :=620;
             Left        :=MainForm.Left+160;
             Top         :=MainForm.Top+10;
             //Formactivate(Sender);
             UebernahmeBtn.Visible :=True;
             Invalidate;
        end;
     end;
     with MainForm.KFZForm2 do
     begin
         ShowModal;
         if Uebern then
         begin // KFZ in Rechnung überbnehmen
             if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

             ReEdiTabKFZ_ID.Value       :=KFZTabKFZ_ID.Value;
             ReEdiTabKM_Stand.Value     :=KFZTabKM_STAND.VAlue;

             ReEdiTab.Post;

             Uebern :=False;
             FormDeactivate (Sender);

             if (DM1.Use_KFZ) then
             begin
                if  ReKFZTab.Active then ReKFZTab.Close;
                ReKFZTab.ParamByName ('KID').asInteger :=ReEdiTabKFZ_ID.Value;
                ReKFZTab.ParamByName ('AID').asInteger :=ReEdiTabADDR_ID.Value;
                ReKFZTab.Open;

                ReKFZTab.Locate ('KFZ_ID',ReEdiTabKFZ_ID.Value,[]);
             end;
         end;
     end; // with
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZNavVorBtnClick(Sender: TObject);
begin
     if ReKFZTab.Active then ReKFZTab.Next;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZNavZurueckBtnClick(Sender: TObject);
begin
     if ReKFZTab.Active then ReKFZTab.Prior;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZUebernehmenBtnClick(Sender: TObject);
begin
     if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;

     ReEdiTabKFZ_ID.Value       :=ReKFZTabKFZ_ID.Value;
     ReEdiTabKM_Stand.Value     :=ReKFZTabKM_STAND.VAlue;

     ReEdiTab.Post;
     ReKFZTabAfterScroll(nil);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditEnter(Sender: TObject);
begin
//     tDBEdit(sender).Color :=DM1.EditColor;//$009FFF9F;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditExit(Sender: TObject);
begin
     if (not ReEdiTabKUN_NUM.IsNull)and
        (tEdit(Sender).Name='KuNrEdit')and
        (LastKunNum<>ReEdiTabKUN_NUM.AsString) then
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
procedure TMakeVKReForm.KuNrEditKeyDown(Sender: TObject; var Key: Word;
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
procedure TMakeVKReForm.KuNrEditKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
        key :=#0;
        try
          if uppercase(tControl(Sender).Name)='RECHINFOMEMO'
          then KuNrEdit.SetFocus
          else SendMessage (MainForm.Handle,WM_NEXTDLGCTL,0,0);
        except end;
     end else
     if tEdit(Sender).Name = 'KuNrEdit' then
     begin
        {
        if not (key in ['0'..'9']) then
        begin
           Key :=#0;
           MessageBeep(0);
        end;
        }
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(ReEdiListGrid),BelegArtStr+'_LISTE',103);
     dm1.GridSaveLayout (tDBGrid(PosGrid),BelegArtStr+'_POS',101);
     DM1.WriteIntegerU ('',BelegArtStr+'_POS_ZH',PosGrid.DefaultRowHeight);
//     DM1.WriteIntegerU ('',BelegArtStr+'_POS_ZZ',PosGrid.LinesPerRow);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.LiefAnschriftAuswahlBtnClick(Sender: TObject);
var ID : Integer;
begin
     if (ReEdiTab.RecordCount>0) then
     begin
       if ReEdiTabADDR_ID.AsInteger<1 then
       begin
          MessageDlg ('Bitte erst Kunden zuweisen !',mterror,[mbok],0);
          KuNrEdit.SetFocus;
          exit;
       end;

       if AdressenLiefForm.Get (ReEdiTabADDR_ID.AsInteger, ID) then
       begin
         if not(ReEdiTab.State in [dsEdit, dsInsert]) then ReEdiTab.Edit;
         ReEdiTabLIEF_ADDR_ID.AsInteger :=ID;
         ReEdiTab.Post;

         UpdateLieferanschrift;
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.LiefAnschriftDelBtnClick(Sender: TObject);
begin
     if (ReEdiTab.RecordCount>0)and(ReEdiTabADDR_ID.AsInteger>1) then
     begin
       if not(ReEdiTab.State in [dsEdit, dsInsert]) then ReEdiTab.Edit;
       ReEdiTabLIEF_ADDR_ID.AsInteger :=-1;
       ReEdiTab.Post;
       UpdateLieferanschrift;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.LieferscheinBuchenBtnClick(Sender: TObject);
var ls_num  : integer;
    CurrPos : Integer;
    {$IFDEF PRO}LiefExportDlg: TLiefExportDlg;{$ENDIF}
    LieferscheinID : Integer;
begin
     if ReEdiTabLiefart.AsInteger<0 then
     begin
        MessageDlg ('Bitte erst eine Versandart auswählen !',mterror,[mbok],0);
        PC1.ActivePage :=AdressTS;
        PC1Change(Sender);
        try Versand.SetFocus; except end;
        exit;
     end;


     LieferscheinID :=-1;

     // nur in der Rechnungsbearbeitung ausführen !!!
     if BelegArt <> VK_RECH_EDI then Exit;

     // 1. Kopie der EDI-Rechnung erstellen
     // und in Lieferschein umwandeln
     ls_num :=dm1.buche_lieferschein (ReEdiTabRec_ID.Value, False, LieferscheinID);


     // 2. In allen Positionen der EDI-Rechnung die Lieferscheinnummer eintragen
     if ls_num>-1 then
     begin

      //LS-Nummer in die Positionen eintragen
      PosTab.DisableControls;
      try
       CurrPos :=PosTab.RecNo;


       PosTab.First;
       while not PosTab.Eof do
       begin
            PosTab.Edit;
            PosTabVLSNum.Value :=ls_num;
            PosTab.Post;
            PosTab.Next;
       end;
       PosTab.Locate ('POSITION',variant (CurrPos),[]);
      finally
       PosTab.EnableControls;
       UpBtn1.Enabled :=True;
       UpBtn2.Enabled :=True;
      end;

      if not (ReEdiTab.State in [dsEdit, dsInsert]) then ReEdiTab.Edit;
      try
         ReEdiTabVLSNum.Value :=ls_num;
         ReEdiTabLDatum.AsDateTime :=Now;
         ReEdiTab.Post;
      except
         ReEdiTab.Cancel;
      end;
     end;

     {$IFDEF PRO}
     try
        LiefExportDlg:=TLiefExportDlg.Create(Self);
        try
           LiefExportDlg.MakeExport (ReEdiTabLiefArt.AsInteger, LieferscheinID);
        finally
           LiefExportDlg.Free;
        end;
     except end;
     {$ENDIF}


     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowBelegDlg (VK_LIEF,LieferscheinID,False);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Lieferscheines'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);

     {$ENDIF}
     LieferscheinBuchenBtn.Enabled :=False;
     TeillieferungBtn.Enabled :=False;
     Teillieferung1.Enabled :=False;
     Lieferscheinerstellen1.Enabled :=False;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosDelBtn1Click(Sender: TObject);
begin
     PC1Change(Sender);
     PosTab.Delete;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosGridKeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (PosTab.State in [dsEdit,dsInsert]) then PosTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosGridShowEditor(Sender: TObject; Field: TField;
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

     if (
          (uppercase(PosTabARTIKELTYP.Value)='T') or
          (uppercase(PosTabARTIKELTYP.Value)='K') or
          (uppercase(PosTabARTIKELTYP.Value)='L')
        ) and
        (Field.FieldName='GEWICHT') then AllowEdit :=False;

     if (Uppercase(Field.FieldName)='POSITION')or
        (Uppercase(Field.FieldName)='ARTIKELTYP')or
        (Uppercase(Field.FieldName)='MATCH_ARTNUM') then AllowEdit :=False;

     if (PosTabNO_RABATT_FLAG.AsBoolean)and
        (Uppercase(Field.FieldName)='RABATT') then AllowEdit :=False;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.Kopieren1Click(Sender: TObject);
begin
     DM1.CopyRechnung (ReEdiTabREC_ID.Value, BelegArt);
     ReEdiTab.Refresh;
     ReEdiTab.Last;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.NeuArtBtnClick(Sender: TObject);
begin
     PC1Change(Sender);
     PosMatchButtonClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ArtPreisTabCalcFields(DataSet: TDataSet);
var S : String;
begin
     S :='???';
     DM1.GetLieferant (ArtPreisTabADRESS_ID.AsInteger, S);
     ArtPreisTabLieferantStr.AsString :=S;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.DBGrid1DblClick(Sender: TObject);
var Dummy : Boolean;
begin
     if ReEdiTab.RecordCount = 0 then exit;

     PC1Changing (Sender,Dummy);

     if ReEdiTabAddr_ID.Value<0 then PC1.ActivePage :=AdressTS
                                else PC1.ActivePage :=PosTS;

     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.Del1BtnClick(Sender: TObject);
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
procedure TMakeVKReForm.GotoAllgBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=AdressTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.GotoAuswahlBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=EdiListTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
     if (sender is tSpeedButton)and
        (tSpeedButton(Sender).Enabled) then
     begin
       tSpeedButton(Sender).Transparent :=False;
       tSpeedButton(Sender).Font.Color :=clBlack;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
     if (sender is tSpeedButton) then
     begin
       tSpeedButton(Sender).Transparent :=True;
       tSpeedButton(Sender).Font.Color :=clWhite;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormActivate(Sender: TObject);
var I        : Integer;
    Dummy    : Boolean;
    MyLastTS : tTabSheet;
begin
     MyLastTS :=LastTS;
     QueryTime :=GetTickCount64;
     if First then
     begin
       First :=False;

       PC1.ActivePage :=EdiListTS;

       PR_EbeneCB.ComboProps.ComboItems.Clear;
       PR_EbeneCB.ComboProps.ComboValues.Clear;

       For i:=1 to DM1.AnzPreis do
       begin
          PR_EbeneCB.ComboProps.ComboItems.Add ('VK'+Inttostr(i));
          PR_EbeneCB.ComboProps.ComboValues.Add (Inttostr(i));
       end;
       PR_EbeneCB.CreateDropDownList;


       if DM1.Use_KFZ then
       begin
          KFZGB.Align :=alClient;
          KFZGB.Visible :=True;
       end
          else
       begin
          KFZGB.Align :=alNone;
          KFZGB.Visible :=False;
       end;

       AlgPan3Resize(Sender);

       dm1.GridLoadLayout (tDBGrid(ReEdiListGrid),BelegArtStr+'_LISTE',103);
       dm1.GridLoadLayout (tDBGrid(PosGrid),BelegArtStr+'_POS',101);

       PosGrid.DefaultRowHeight  :=DM1.ReadIntegerU ('',BelegArtStr+'_POS_ZH',PosGrid.DefaultRowHeight);
//       PosGrid.LinesPerRow       :=DM1.ReadIntegerU ('',BelegArtStr+'_POS_ZZ',PosGrid.LinesPerRow);


       PosTabMATCH_ARTNUM.DisplayLabel  :='Suchbegriff'+#13#10+'Artikelnummer';

//       PosGrid.RowColor1          :=DM1.C2Color;
//       ReEdiListGrid.RowColor1    :=DM1.C2Color;
//       ArtLiefPreisGrid.RowColor1 :=DM1.C2Color;
//       HistGrid.RowColor1         :=DM1.C2Color;
//       PosGrid.EditColor          :=DM1.EditColor;
//       StListGrid.RowColor1       :=DM1.C2Color;
//       LiefGrid.RowColor1         :=DM1.C2Color;

//       PC1.HintColor :=Application.HintColor;

       Loading :=False;

       ReEdiTabNSUMME.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabMSUMME.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+' "';
       ReEdiTabBSUMME.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+' "';

       PosTabCalc_RGewinn.DisplayFormat :=',#0.00 "'+DM1.LeitWaehrung+' "';
       PosTabEPREIS.DisplayFormat       :=',#0.00 "'+DM1.LeitWaehrung+' "';
       PosTabNSUMME.DisplayFormat       :=',#0.00 "'+DM1.LeitWaehrung+' "';
       PosTabMSUMME.DisplayFormat       :=',#0.00 "'+DM1.LeitWaehrung+' "';
       PosTabBSUMME.DisplayFormat       :=',#0.00 "'+DM1.LeitWaehrung+' "';

       PosTabE_RGEWINN.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+' "';
       PosTabEK_Preis.DisplayFormat      :=',#0.00 "'+DM1.LeitWaehrung+' "';


       UseKurztext :=DM1.ReadBoolean ('MAIN\BELEGE','KURZTEXT_VERWENDEN',UseKurztext);

     end;

     DM1.ArtInfoTab.Close;
     DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2;

     PosTab.ParamByName ('ID').Value :=-1;
     if not ReEdiTab.Active then
     begin
          ReEdiTab.Close;
          ReEdiTab.ParamByName ('QUELLE').Value :=BelegArt;
          ReEdiTab.Open;
          PosTab.Open;
     end;

     //ReEdiTabAfterScroll (nil);

     ButtonPan.Visible      :=ReEdiTab.RecordCount>0;
     ReEdiBtn.Enabled       :=ReEdiTab.RecordCount>0;
     BelDelBtn.Enabled      :=ReEdiTab.RecordCount>0;
     Del1Btn.Enabled        :=ReEdiTab.RecordCount>0;
     Allgemein1.Enabled     :=ReEdiTab.RecordCount>0;
     Positionen1.Enabled    :=ReEdiTab.RecordCount>0;
     PosDetails1.Enabled    :=ReEdiTab.RecordCount>0;
     Fertigstellen1.Enabled :=ReEdiTab.RecordCount>0;

     if DM1.VertreterTab.Active then DM1.VertreterTab.Close;
     DM1.VertreterTab.Open;

     PC1.ActivePage :=PC1.Pages[0];
     PC1Change(Sender);

     if LastEdiID<>-1 then
     begin
       ReEdiTab.Locate ('REC_ID',LastEdiID,[]);
       ReEdiTabAfterScroll(nil);
     end;

     PC1Changing(Sender,Dummy);
     if assigned(MyLastTS) then PC1.ActivePage :=MyLastTS;
     PC1Change(Sender);

     if (PC1.ActivePage=EdiListTS)and(ReEdiListGrid.Visible)
      then try ReEdiListGrid.SetFocus; except end;

     UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     PosTab.Close;
     ReEdiTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormCreate(Sender: TObject);
var I : Integer;
begin
     SetBelegArt (VK_RECH_EDI);

     for i:=0 to PC1.PageCount-1 do PC1.Pages[i].TabVisible :=False;
     PreisPC.ActivePage :=PreisPC.Pages[0];

     ToolButton8.Visible :=BelegArt=VK_RECH_EDI;
     TeillieferungBtn.Visible :=BelegArt=VK_RECH_EDI;

     OnUpdateStatusBar :=nil;
     First             :=True;
     AppendOK          :=False;
     LastTS            :=nil;
     LastEdiID         :=-1;
     InDetailCalc      :=False;
     UseKurztext       :=False; // Default = Langtext

     PreisGrid.Cells[0,0] :='';
     PreisGrid.Cells[0,1] :='Preis';
     PreisGrid.Cells[0,2] :='Kundenpreis';
     PreisGrid.Cells[0,3] :='Aktionspreis';

     PreisGrid.Cells[1,0] :='Normalpreis';
     PreisGrid.Cells[2,0] :='Staffelpreis 2';
     PreisGrid.Cells[3,0] :='Staffelpreis 3';
     PreisGrid.Cells[4,0] :='Staffelpreis 4';
     PreisGrid.Cells[5,0] :='Staffelpreis 5';
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormDeactivate(Sender: TObject);
begin
     LastTS :=PC1.ActivePage;

     PC1Change(Sender);
     if assigned(MainForm.ArtForm) then MainForm.ArtForm.FormDeactivate (Sender);

     LastEdiID :=ReEdiTabRec_ID.AsInteger;
     ReEdiTab.Close;
     PosTab.Close;
     DM1.ReKunTab.Close;
     DM1.ArtInfoTab.Close;
     ReKFZTab.Close;
     SNTab.Close;
     ArtPreisTab.Close;
     STListTab.Close;
     LiefTab.Close;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.GotoFertigBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=Fertig;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.HisTabCalcFields(DataSet: TDataSet);
var sum, m : double; w : string;
begin
     w :=HisTabWaehrung.Value;

     Sum :=HisTabMENGE.Value * HisTabEPreis.Value;
     sum :=trunc((sum - (sum / 100 * HisTabRabatt.Value)) *100) / 100;

     case HisTabSTEUER_CODE.AsInteger of
       0 :  M :=HisTabMWST_0.AsFloat;
       1 :  M :=HisTabMWST_1.AsFloat;
       2 :  M :=HisTabMWST_2.AsFloat;
       3 :  M :=HisTabMWST_3.AsFloat;
       else M :=0;
     end;

     HisTabEPreis_Str.Value :=FormatFloat (',###,##0.00 "'+w+'"',HisTabEPreis.Value);
     HisTabGPreis_Str.Value :=FormatFloat (',###,##0.00 "'+w+'"',sum);

     HisTabSTEUER_PROZ.AsFloat :=M;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditButtonClick(Sender: TObject);
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
             //Formactivate(Sender);
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
     end; // with
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.NeuFrArtBtnClick(Sender: TObject);
var i : integer;
begin
     PC1Change(Sender);

     AppendOK :=True;
     try
        Loading :=True;

        PosTab.Append;

        PosTabArtikelTyp.Value :='F';
        PosTabArtikel_ID.Value :=-99;
        //PosTabArtNum.Value     :='fr. Artikel';
        PosTabMatchCode.Value  :=PosTabArtNum.Value;

        PosTabBarCode.Value    :='';

        PosTabLaenge.Value          :='';
        PosTabGroesse.Value         :='';
        PosTabDimension.Value       :='';
        PosTabGewicht.Value         :=0;
        PosTabME_Einheit.Value      :='Stück';
        PosTabPR_Einheit.Value      :=1;
        PosTabMenge.Value           :=1;
        PosTabEPreis.Value          :=0;
        PosTabRabatt.Value          :=0;
        PosTabVPE.Value             :=0;

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
     end;
     Loading :=False;
     AppendOK :=False;

     try PosGrid.SetFocus; except end;

     for i:=0 to PosGrid.Columns.Count-1 do
      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.FixedCols :=i+1;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.NeuKomBtnClick(Sender: TObject);
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
     end;
     Loading :=False;
     AppendOK :=False;

     try PosGrid.SetFocus; except end;

     for i:=0 to PosGrid.Columns.Count-1 do
      if (PosGrid.Columns[i].FieldName)='BEZEICHNUNG' then PosGrid.FixedCols :=i+1;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.New1BtnClick(Sender: TObject);
begin
     ReEdiTab.DisableControls;
     try
        ReEdiTab.Append;
        //ReEdiTab.Post;
        LastEdiID :=ReEdiTabRec_ID.Value;
        LastTS :=AdressTS;
     finally
        ReEdiTab.EnableControls;
     end;
     FormActivate(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.NewBelBtnClick(Sender: TObject);
begin
     ReEdiTab.DisableControls;
     try
        ReEdiTab.Append;
        //ReEdiTab.Post;
        LastEdiID :=ReEdiTabRec_ID.Value;
        LastTS :=AdressTS;
     finally
        ReEdiTab.EnableControls;
     end;
     FormActivate(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PreisPCChange(Sender: TObject);
begin
     UpdateArtikelDetails;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PreisPCResize(Sender: TObject);
var I,J : Integer;
begin
     PreisGrid.Width :=PreisAlgTS.Width - PreisGrid.Left*2;
     I := (PreisGrid.Width - 7 ) div 6;
     for j :=0 to PreisGrid.ColCount-1 do PreisGrid.ColWidths[j] :=i;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PrintPrevBtnClick(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowBelegDlg (BelegArt,ReEdiTabREC_ID.AsInteger,True);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Beleges'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PC1Change(Sender: TObject);
var CurrPos     : Integer;
    LSDruck     : Boolean;
    LSTeilDruck : Boolean;
    Prob        : Boolean;
    S, S1       : String;
    Dummy       : Boolean;
    I           : Integer;

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


     PosDelBtn1.Enabled :=(PosTab.RecordCount>0)and
                          ((PC1.ActivePage=PosTS)or(PC1.ActivePage=PosDetailTS));
     PosDelBtn2.Enabled :=PosDelBtn1.Enabled;
     Positionlschen1.Enabled :=PosDelBtn1.Enabled;

     Storno1.Enabled :=(ReEdiTab.RecordCount>0)and
                       ( (PC1.ActivePage=AdressTS) or
                         (PC1.ActivePage=EdiListTS)
                       );

     SichtbareSpalten1.Enabled :=(PC1.ActivePage=EdiListTS) or
                                 (PC1.ActivePage=PosTS);

     Aktualisieren1.Enabled    :=(PC1.ActivePage=EdiListTS) or
                                 (PC1.ActivePage=PosTS) or
                                 (PC1.ActivePage=PosDetailTS);

     Kopieren1.Enabled         :=(PC1.ActivePage=EdiListTS)and
                                 (ReEdiTab.RecordCount>0);

     EKBestellungerstellen1.Enabled :=Kopieren1.Enabled;

     Artikelhinzufgen1.Enabled :=(PC1.ActivePage=PosTS)or(PC1.ActivePage=PosDetailTS);
     freienArtikelhinzufgen1.Enabled :=Artikelhinzufgen1.Enabled;
     Texthinzufgen1.Enabled          :=Artikelhinzufgen1.Enabled;
     Speichernundbuchen1.Enabled     :=False;
     Teillieferung1.Enabled          :=False;
     Lieferscheinerstellen1.Enabled  :=False;

     Suchen1.Enabled :=(PC1.ActivePage=EdiListTS);


     AuswahlBtn.Font.Style    :=[];
     AllgemeinBtn.Font.Style  :=[];
     PositionenBtn.Font.Style :=[];
     FertigBtn.Font.Style     :=[];
     PosDetailBtn.Font.Style  :=[];


     if PC1.ActivePage=Fertig then
     begin
        SumPan.Parent    :=FertigsumPan;
        KunDatGB2.Parent :=FertigKundDatPan;


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

        if BelegArt=VK_RECH_EDI then
        begin
          // Seriennummern (Anzahl zu Pos.-Menge) prüfen
          dm1.UniQuery.close;
          dm1.uniquery.sql.clear;
          dm1.uniquery.sql.add('select JP.REC_ID, JP.QUELLE, JP.JOURNAL_ID, JP.ARTIKEL_ID, JP.POSITION, JP.MENGE ,');
          dm1.uniquery.sql.add('COUNT(SN.SNUM_ID)as ANZ_SN from JOURNALPOS as JP');
          dm1.uniquery.sql.add('left outer join ARTIKEL_SERNUM as SN on JP.ARTIKEL_ID=SN.ARTIKEL_ID and JP.REC_ID=SN.VK_JOURNALPOS_ID');
          dm1.uniquery.sql.add('where JP.JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger)+' and JP.SN_FLAG="Y" and JP.MENGE>"0"');
          dm1.uniquery.sql.add('group by JP.REC_ID having MENGE<>ANZ_SN');

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
              S :=S+'Bei der Artikelposition '+S1+
                    ' stimmt die Anz. der Seriennummern nicht mit'+
                    ' der Artikelmenge überein'+#13#10;
          end
            else
          if dm1.uniquery.RecordCount>1 then
          begin
            S :=S+'Bei den Artikelpositionen '+S1+
                  ' stimmt die Anz. der Seriennummern nicht mit'+
                  ' der Artikelmenge überein'+#13#10;
          end;

          dm1.uniquery.close;
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
        StadiumCB.Enabled           :=not Prob;
        Speichernundbuchen1.Enabled :=not Prob;

        if BelegArt=VK_RECH_EDI then
        begin
          // Prüfen, ob Lieferschein bereits gedruckt !
          LSDruck :=False;
          LSTeilDruck :=False;
          PosTab.DisableControls;
          try
             CurrPos :=PosTab.RecNo;

             PosTab.First;
             while not PosTab.Eof do
             begin
                if PosTabVLSNum.Value<0 then LSDruck :=True;
                if PosTabMENGE_GELIEFERT.Value < PosTabMenge.Value
                  then LSTeilDruck :=True;
                PosTab.Next;
             end;
             PosTab.Locate ('POSITION',variant (CurrPos),[]);
          finally
             PosTab.EnableControls;
             LieferscheinBuchenBtn.Enabled  :=LSDruck     and not Prob;
             TeillieferungBtn.Enabled       :=LSTeilDruck and not Prob;
             Lieferscheinerstellen1.Enabled :=LSDruck     and not Prob;
             Teillieferung1.Enabled         :=LSTeilDruck and not Prob;
          end;
        end;
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
          SumPan.Parent :=AlgSumPan;

          AllgemeinBtn.Font.Style :=[fsBold];
          Allgemein1.Checked :=True;

          ReEdiTabAfterPost (nil);
     end
        else
     if PC1.ActivePage=PosTS then
     begin
          SumPan.Parent :=PosSumPan;
          KunDatGB2.Parent :=PosKunDatPan;

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
          end;
          PosGrid.Invalidate;

          SchnellerfassungGB.Parent :=BottomSpacePan;
          BottomSpacePan.Height :=SchnellerfassungGB.Height+3;
     end
        else
     if PC1.ActivePage=PosDetailTS then
     begin
          SumPan.Parent :=PosDetailSumPan;
          KunDatGB2.Parent :=PosDetailKunDatPan;

          PosDetailBtn.Font.Style :=[fsBold];
          PosDetails1.Checked :=True;

          SchnellerfassungGB.Parent :=PosDetailInfoPan;
     end;

     UmschaltungBruttoNetto1.Enabled        :=(PC1.ActivePage=PosTS)or
                                              (PC1.ActivePage=PosDetailTS);
     PossortierennachArtikelnummer1.Enabled :=(PC1.ActivePage=PosTS)or
                                              (PC1.ActivePage=PosDetailTS);

     AtrisImport1.Enabled :=(DM1.AtrisEnable)and
                            (
                             (PC1.ActivePage=PosTS)or
                             (PC1.ActivePage=PosDetailTS)
                            );

     UpdateStatus;

     LastTS :=PC1.ActivePage;
end;

procedure TMakeVKReForm.PC1Changing(Sender: TObject; var AllowChange: Boolean);
begin
     QueryTime :=GetTickCount64;
     if PosTab.ParamByName ('ID').Value<>ReEdiTabREC_ID.Value then
     begin
       if DM1.ArtInfoTab.Active then DM1.ArtInfoTab.Close;
       DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
       DM1.ArtInfoTab.ParamByName ('QUELLE').AsInteger :=BelegArt;
       //DM1.ArtInfoTab.ParamByName ('AID').AsInteger :=-1;
       try   // von Volker zur Fehlersuche eingefügt
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
       except
       end;
       ReEdiTabAfterPost (nil);
       PosTab.Refresh;

       UpdateLieferanschrift;
       UpdateAnsprechpartner;
     end;

     QueryTime :=GetTickCount64 - QueryTime;
     UpdateStatus;

     if ReEdiTab.State in [dsEdit, dsInsert] then ReEdiTab.Post;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.GotoPosBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=PosTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosDetailBtnClick(Sender: TObject);
begin
     PC1.ActivePage :=PosDetailTS;
     PC1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosDSDataChange(Sender: TObject; Field: TField);
begin
     {
     if (not Loading) and
        (not InDataChange) and
        (not InDetailCalc) and
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
procedure TMakeVKReForm.PosTabAfterScroll(DataSet: TDataSet);
var T : Char;
begin
     PosTabMenge.ReadOnly :=PosTabArtikelTyp.AsString='T';

//     if (assigned(POsGrid..DBMemo))and
//        (PosGrid.DBMemo.Visible) and
//        (PosGrid.DBMemo.Focused)  then
//     begin
//        PosGrid.OnDBExit(Self);
        {
        with PosGrid.DBMemo do
        begin
          Visible := False;
          DataSource := nil;
          DataField := '';
        end;
        }
//     end;

     PosTabRabatt.ReadOnly :=PosTabNO_RABATT_FLAG.Value;
     PosTabEPreis.ReadOnly :=PosTabArtikelTyp.AsString='T';
     PosTabBezeichnung.ReadOnly :=PosTabBEZ_FEST_FLAG.AsBoolean;

     if PosTab.ControlsDisabled then exit;

     UpdateLayout;
     UpdateStatus;

     PosDelBtn1.Enabled :=(PosTab.RecordCount>0)and
                          ((PC1.ActivePage=PosTS)or(PC1.ActivePage=PosDetailTS));
     PosDelBtn2.Enabled :=(PosTab.RecordCount>0)and
                          ((PC1.ActivePage=PosTS)or(PC1.ActivePage=PosDetailTS));

     Positionlschen1.Enabled :=(PosTab.RecordCount>0)and
                               ((PC1.ActivePage=PosTS)or(PC1.ActivePage=PosDetailTS));

     EditSNBtn1.Enabled :=(PosTab.RecordCount>0)and
                          (PosTabSN_Flag.AsBoolean=True)and
                          (PosTabMenge.AsFloat>=1);
     EditSNBtn2.Enabled :=EditSNBtn1.Enabled;

     if length (PosTabArtikelTyp.AsString)>0
      then T :=PosTabArtikelTyp.AsString[1]
      else T :=#0;

     case T of
          'N' : DetailArtikelTyp.Caption :='normaler Artikel';
          'S' : DetailArtikelTyp.Caption :='Artikel m. Stückliste';
          'L' : DetailArtikelTyp.Caption :='Lohn';
          'K' : DetailArtikelTyp.Caption :='Transportkosten';
          'T' : DetailArtikelTyp.Caption :='Text';
          'F' : DetailArtikelTyp.Caption :='freier Artikel';
     end;

     DetailArtNumLab.Enabled  :=T<>'T';
     DetailMatchLab.Enabled   :=T<>'T';
     DetailBarcodeLab.Enabled :=T<>'T';
     DetailGewichtLab.Enabled :=T<>'T';
     DetailVPELab.Enabled     :=T<>'T';
     DetailArtnum.Enabled     :=T<>'T';
     DetailMatch.Enabled      :=T<>'T';
     DetailBarcode.Enabled    :=T<>'T';
     DetailGewichtEdi.Enabled :=T<>'T';
     DetailVPE.Enabled        :=T<>'T';
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabBeforeDelete(DataSet: TDataSet);
begin
     if PosTabSN_Flag.AsBoolean then
     begin
       // Seriennummern Verweis löschen ....
       dm1.UniQuery.close;
       dm1.UniQuery.sql.text :='UPDATE ARTIKEL_SERNUM SET VK_JOURNALPOS_ID=-1,'+
                               'VK_JOURNAL_ID=-1 where VK_JOURNALPOS_ID='+
                               IntToStr(PosTabRec_ID.AsInteger)+
                               ' and VK_JOURNAL_ID='+
                               IntToStr(ReEdiTabRec_ID.AsInteger);
       dm1.UniQuery.ExecSql;
       dm1.UniQuery.close;
     end;

     //Lieferschein-Verweise löschen
     dm1.UniQuery.sql.text :='UPDATE JOURNALPOS SET QUELLE_SRC=-1 '+
                               'where QUELLE_SRC='+
                               IntToStr(PosTabRec_ID.AsInteger);
     dm1.UniQuery.ExecSql;
     dm1.UniQuery.close;

     // Reservierte Menge im Artikel aktualisieren
     DM1.UpdateArtikelEdiMenge (BelegArt,
                                PosTabArtikel_ID.AsInteger,
                                PosTabMenge.AsFloat);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabBeforeEdit(DataSet: TDataSet);
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
procedure TMakeVKReForm.PosTabBeforeInsert(DataSet: TDataSet);
begin
     if not AppendOK then
     begin
        MessageBeep(0);
        Abort;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabBeforePost(DataSet: TDataSet);
var PR : Double;
begin
     DetailArtnumExit(nil);
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
          PosTabSteuer_Code.Value :=0;
          PosTabGewicht.Value     :=0;
     end
        else
     begin
        if PosTabMenge.Value=0 then
        begin
           PosTabE_RGEWINN.Value :=0;
        end
           else
        begin
           PR :=PosTabEPreis.Value;
           PR :=cao_round((PR - (PR * PosTabRabatt.Value /100))*100) / 100;
           PosTabE_RGewinn.Value :=cao_round ((PR - PosTabEK_Preis.AsFloat)*100)/100;
        end;
     end;

     if PosTabMenge.Value <> PosTabMenge.OldValue then
     begin
          PosTabVLSNum.Value :=-1;
     end;

     // Provision berechnen
     if PosTabPROVIS_PROZ.AsFloat <> 0 then
     begin
        PosTabPROVIS_WERT.AsFloat :=CAO_round (PosTabNSumme.AsFloat / 100 *
                                           PosTabPROVIS_PROZ.AsFloat * 100) / 100;
     end else PosTabPROVIS_WERT.AsFloat :=0;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabCalcFields(DataSet: TDataSet);
var Summe   : Double;
    Steuer  : Double;
    //PR      : Double;
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
        PosTabMSumme.Value :=CAO_round(Summe * Steuer)/100; // Auf ganze Pfennige Runden
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

     if (PosTabArtikelTyp.Value='N')or
        (PosTabArtikelTyp.Value='L')or
        (PosTabArtikelTyp.Value='K')or
        (PosTabArtikelTyp.Value='S') then
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
            (DM1.ArtInfoTab.Locate ('REC_ID;JID',VarArrayof ([PosTabArtikel_ID.Value,PosTabRec_ID.AsInteger]),[])) then
         begin
              if (PosTabArtikelTyp.AsString='N')or
                 (PosTabArtikelTyp.AsString='S') then
              begin
                S :='Lager : '+FormatFloat (',#0.00',DM1.ArtInfoTabMenge_AKT.Value);
                if DM1.ArtInfoTabMENGE_BESTELLT.Value>0
                 then S :=S+' Bestellt : '+FormatFloat (',#0.00',DM1.ArtInfoTabMENGE_BESTELLT.AsFloat);

                S :=S+' Benötigt : '+FormatFloat (',#0.00',DM1.ArtInfoTabMENGE_RESERVIERT.AsFloat);
              end
              else S:='';

              PosTabCalc_Lagermenge_Str.Value :=S;
              PosTabCalc_Lagermenge.Value :=DM1.ArtInfoTabMenge_AKT.Value;
              PosTabCalc_RGewinn.Value :=PosTabNSumme.Value -
                                         PosTabEK_Preis.Value * PosTabMenge.Value;

              PosTabMenge_Geliefert.AsFloat :=DM1.ArtInfoTabMENGE_LIEF.AsFloat;
         end;
     end
        else
     if PosTabArtikelTyp.AsString='F' then
     begin
        if PosTabEK_Preis.AsFloat <>0
         then PosTabCalc_RGewinn.Value :=PosTabNSumme.Value -
                                         PosTabEK_Preis.Value * PosTabMenge.Value
         else PosTabCalc_RGewinn.Value :=0;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabNewRecord(DataSet: TDataSet);
begin
     PosTabJournal_ID.Value  :=ReEdiTabRec_ID.Value;
     PosTabQuelle.Value      :=ReEdiTabQuelle.Value;
     PosTabQuelle_Sub.Value  :=ReEdiTabQuelle_Sub.Value;
     //PosTabJahr.Value        :=ReEdiTabJahr.Value;
     PosTabAddr_ID.Value     :=ReEdiTabAddr_ID.Value;
     PosTabVRENUM.Value      :=ReEdiTabVRENUM.Value;
     PosTabRabatt.Value      :=ReEdiTabGlobRabatt.Value;
     PosTabPosition.Value    :=PosTab.RecordCount+1;
     PosTabE_RGewinn.Value   :=0;
     PosTabBrutto_Flag.Value :=ReEdiTabBRUTTO_FLAG.Value;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiDSDataChange(Sender: TObject; Field: TField);
begin
  UpdateStatus;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiListGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Num : Integer;
begin
     with sender as tdbgrid do
     begin
       if (column.fieldname='STADIUM') then
       begin
         canvas.fillrect (rect);
         Case column.field.asinteger of
           10  :num :=4; // violett, bitte Prüfen
           20  :num :=2; // Freigegeben, grün
           30  :num :=0; // cyan Stapeldruck
           else num :=3; // gelb, in Bearbeitung
         end;
         mainform.imagelist1.Draw (Canvas,rect.left,rect.top,num,true);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiListGridApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
    if (ReEdiTabWV_Datum.AsDateTime>0) and (ReEdiTabWV_Datum.AsDateTime<Int(Now)+7)
      then begin Canvas.Font.Color :=clRed; Canvas.Font.Style :=[fsBold] end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabAfterPost(DataSet: TDataSet);
begin
     BelDelBtn.Enabled :=ReEdiTab.RecordCount>0;
     Del1Btn.Enabled :=ReEdiTab.RecordCount>0;


     // KFZ's aktualisieren
     if (PC1.ActivePage<>EdiListTS) and
        (DM1.Use_KFZ) and
        ((ReKFZTab.ParamByName ('AID').asInteger<>ReEdiTabADDR_ID.AsInteger)or
         (ReKFZTab.Active=False)) then
     begin
         if  ReKFZTab.Active then ReKFZTab.Close;
         ReKFZTab.ParamByName ('KID').asInteger :=ReEdiTabKFZ_ID.AsInteger;
         ReKFZTab.ParamByName ('AID').asInteger :=ReEdiTabADDR_ID.AsInteger;
         ReKFZTab.Open;
         ReKFZTab.Locate ('KFZ_ID',ReEdiTabKFZ_ID.AsInteger,[]);
     end;

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
procedure TMakeVKReForm.ReEdiTabAfterScroll(DataSet: TDataSet);
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
procedure TMakeVKReForm.ReEdiTabBeforeClose(DataSet: TDataSet);
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
procedure TMakeVKReForm.ReEdiTabBeforeDelete(DataSet: TDataSet);
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
procedure TMakeVKReForm.ReEdiTabBeforeEdit(DataSet: TDataSet);
begin
     OldShopStatus :=ReEdiTabSHOP_STATUS.AsInteger;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
     if ReEdiTabVRENUM.Value<1
     then ReEdiTabVRENUM.Value :=DM1.IncNummer (BelegArt);

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
           if (length(DM1.ReKunTab.FieldByName('KUNNUM1').AsString)=0) or
              (length(DM1.ReKunTab.FieldByName('DEB_NUM').AsString)=0) then
           begin
             // neue Kundennummer vergeben !
             DM1.ReKunTab.Edit;
             try
                if length(DM1.ReKunTab.FieldByName('KUNNUM1').AsString)=0
                 then DM1.ReKunTab.FieldByName('KUNNUM1').AsString :=DM1.IncNummerStr (KUNNUM_KEY);

                if length(DM1.ReKunTab.FieldByName('DEB_NUM').AsString)=0
                 then DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger :=DM1.IncNummer (DEB_NUM_KEY);


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

     if OldShopStatus<>ReEdiTabSHOP_STATUS.Value
      then ReEdiTabSHOP_CHANGE_FLAG.AsBoolean :=True;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabCalcFields(DataSet: TDataSet);
begin
     if ReEdiTabWV_Datum.AsDateTime > 100
      then ReEdiTabWV_DatumStr.Value :=
             FormatDateTime ('dd.mm.yyyy',ReEdiTabWV_Datum.AsDateTime);

     case ReEdiTabStadium.AsInteger of
          10 : ReEdiTabSTADIUM_STR.AsString :='bitte prüfen';
          20 : ReEdiTabSTADIUM_STR.AsString :='Freigegeben';
          30 : ReEdiTabSTADIUM_STR.AsString :='Stapeldruck';
         else  ReEdiTabSTADIUM_STR.AsString :='in Bearbeitung';
     end;

     if (ReEdiTabShop_ID.AsInteger>0) then
     begin
       if DM1.ShopOrderStatusTab.Locate ('ORDERSTATUS_ID',
                                         ReEdiTabShop_Status.AsInteger,[])
        then ReEdiTabCalc_Shopstatus.AsString :=DM1.ShopOrderStatusTabLANGBEZ.AsString;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabNewRecord(DataSet: TDataSet);
begin
     //ReEdiTabJahr.Value       :=0;
     ReEdiTabQuelle.Value     :=BelegArt;
     ReEdiTabQUELLE_SUB.Value :=0;
     ReEdiTabVLSNUM.Value     :=-1;
     ReEdiTabATRNUM.Value     :=-1;
     ReEdiTabGegenKonto.Value :=-1;
     ReEdiTabADDR_ID.Value    :=-1;
     ReEdiTabRDatum.AsDateTime:=Trunc (Now);
     ReEdiTabLDatum.AsDateTime:=0;
     ReEdiTabADatum.AsDateTime:=0;
     ReEdiTabPR_Ebene.Value   :=DM1.AnzPreis;
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
     ReEdiTabFolgeNr.Value    :=-1;
     ReEdiTabKM_Stand.Value   :=-1;
     ReEdiTabKFZ_ID.Value     :=-1;
     ReEdiTabVertreter_ID.Value :=-1;
     ReEdiTabGlobRabatt.Value :=0;
     ReEdiTabWV_Datum.AsDateTime:=0;
     ReEdiTabLiefart.Value    :=-1;
     ReEdiTabZahlArt.Value    :=-1;
     ReEdiTabLIEF_ADDR_ID.AsInteger  :=-1;

     ReEdiTabErstellt.AsDateTime:=now;
     ReEdiTabERST_NAME.Value :=dm1.View_User;

     ReEdiTabMWST_0.Value     :=DM1.MWSTTab[0];
     ReEdiTabMWST_1.Value     :=DM1.MWSTTab[1];
     ReEdiTabMWST_2.Value     :=DM1.MWSTTab[2];
     ReEdiTabMWST_3.Value     :=DM1.MWSTTab[3];

     LastKunNum               :='';

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
procedure TMakeVKReForm.ReKFZTabAfterScroll(DataSet: TDataSet);
begin
     KFZUebernehmenBtn.Enabled :=(ReKFZTab.RecordCount>0)and
                                 (ReEdiTabKFZ_ID.Value<>ReKFZTabKFZ_ID.Value);
     KFZAddrAssign.Enabled :=(ReKFZTab.RecordCount>0)and
                             (ReEdiTabAddr_ID.Value <> ReKFZTabAddr_ID.Value);

     KFZAddrErase.Enabled :=ReEdiTabKFZ_ID.Value>-1;

     KFZNavZurueckBtn.Enabled :=(ReKFZTab.RecordCount>1)and(not ReKFZTab.Bof);
     KFZNavVorBtn.Enabled     :=(ReKFZTab.RecordCount>1)and(not ReKFZTab.Eof);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.SchnellArtnumExit(Sender: TObject);
begin
     SchnellArtnum.Text    :='';
     SchnellBarcode.Text   :='';
     SchnellMatchcode.Text :='';
     DetailArtnumExit (Sender);
end;
//------------------------------------------------------------------------------
// Schnellerfassung
//------------------------------------------------------------------------------
procedure TMakeVKReForm.SchnellArtnumKeyPress(Sender: TObject; var Key: Char);
var Data, SFeld : String; ID : Integer; M : Double;
begin
     if Key='*' then
     begin
       try
          if Sender is TEdit then
          begin
            M :=StrToFloat (tEdit(Sender).Text);
            tEdit(Sender).Text :='';
            AddMengeEdi.Value :=M;
          end;
       except end;
       key :=#0;
       exit;
     end;

     if key=#13 then
     begin
        if (Sender is TEdit) then
        begin
          ID :=tEdit(Sender).Tag * -1;
          Key :=#0;
          if tEdit(Sender).Text='' then ID :=-1;
        end
        else ID :=0;

        case ID of
          1: begin SFeld :='MATCHCODE'; Data :=SchnellMatchcode.Text end;
          2: begin SFeld :='ARTNUM';    Data :=SchnellArtnum.Text    end;
          3: begin SFeld :='BARCODE';   Data :=SchnellBarcode.Text   end;
          else ID :=0;
        end; // case


       if ID in [1,2,3] then
       begin
         dm1.uniquery.close;
//         dm1.uniquery.sql.text :='select REC_ID from ARTIKEL where '+
//                                 SFeld+'="'+dm1.uniquery.DataSource.StringToSql(Data)+'"';
         dm1.uniquery.sql.text :='select REC_ID from ARTIKEL where '+
                                 SFeld+'="'+Data+'"';
         dm1.UniQuery.open;
         if dm1.UniQuery.RecordCount=1 then
         begin
            OnAddartikel (DM1.Uniquery.FieldByName('REC_ID').AsInteger,
                          AddMengeEdi.Value);

            SchnellArtnumExit(Sender);
         end
         else
         if (dm1.UniQuery.RecordCount>1)or
            (dm1.UniQuery.RecordCount=0) then
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
                 MainForm.ArtForm.Invalidate;
            end;

            MainForm.ArtForm.F9Change (MainForm.F9);
            MainForm.ArtForm.OnAddArtikel :=OnAddArtikel;
            MainForm.ArtForm.AddMengeEdi.Value :=AddMengeEdi.Value;

            MainForm.ArtForm.SuchFeldCB.ItemIndex :=ID;
            MainForm.ArtForm.SuchBeg.Text :=Data;
            MainForm.ArtForm.SearchTimerTimer(Sender);
            MainForm.ArtForm.SearchTimer.Enabled :=False;
            MainForm.ArtForm.ShowModal;
         end;
         dm1.UniQuery.close;

         SchnellArtnumExit(Sender);
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.SichtbareSpalten1Click(Sender: TObject);
begin
     if PC1.ActivePage = EdiListTS
      then VisibleSpaltenForm.UpdateTable (tDBGrid(ReEdiListGrid))
      else
     if PC1.ActivePage= PosTS
      then VisibleSpaltenForm.UpdateTable (tDBGrid(PosGrid));
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.Suchen1Click(Sender: TObject);
begin
     MainForm.FindDialog1.OnFind :=FindDialog1Find;
     MainForm.FindDialog1.Execute;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.TeillieferungBtnClick(Sender: TObject);
begin
     if ReEdiTabLiefart.AsInteger<0 then
     begin
        MessageDlg ('Bitte erst eine Versandart auswählen !',mterror,[mbok],0);
        PC1.ActivePage :=AdressTS;
        PC1Change(Sender);
        try Versand.SetFocus; except end;
        exit;
     end;

     TeilLieferForm.ShowDlg (ReEdiTabRec_ID.AsInteger);
     DM1.ArtInfoTab.Refresh;
     PosTab.Refresh;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateAnsprechpartner;
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
procedure TMakeVKReForm.UpdateLieferanschrift;
begin
     with DM1.UniQuery do
     begin
        SQL.Text :='select * from ADRESSEN_LIEF where REC_ID='+
                   IntToStr(ReEdiTabLIEF_ADDR_ID.AsInteger);
        Open;
        if RecordCount>0 then
        begin
           L_Anrede.Text  :=FieldByName ('ANREDE').AsString;
           L_NAME1.Text   :=FieldByName ('NAME1').AsString;
           L_NAME2.Text   :=FieldByName ('NAME2').AsString;
           L_NAME3.Text   :=FieldByName ('NAME3').AsString;
           L_Strasse.Text :=FieldByName ('STRASSE').AsString;
           L_LAND.Text    :=FieldByName ('LAND').AsString;
           L_PLZ.Text     :=FieldByName ('PLZ').AsString;
           L_Ort.Text     :=FieldByName ('ORT').AsString;
        end
           else
        begin
           L_Anrede.Text  :='';
           L_NAME1.Text   :='';
           L_NAME2.Text   :='';
           L_NAME3.Text   :='';
           L_Strasse.Text :='';
           L_LAND.Text    :='';
           L_PLZ.Text     :='';
           L_Ort.Text     :='';
        end;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateLayout;
begin
     UpBtn1.Enabled :=PosTab.RecNo>1;
     UpBtn2.Enabled :=PosTab.RecNo>1;
     DownBtn1.Enabled :=PosTab.RecNo<PosTab.RecordCount;
     DownBtn2.Enabled :=PosTab.RecNo<PosTab.RecordCount;

     InfoEKLab.Visible  :=(PosTab.RecordCount>0)and(PosTabArtikelTyp.AsString<>'T');
     InfoEK.Visible     :=(PosTab.RecordCount>0)and(PosTabArtikelTyp.AsString<>'T');
     InfoRGWLab.Visible :=(PosTab.RecordCount>0)and(PosTabArtikelTyp.AsString<>'T');
     InfoRGW.Visible    :=(PosTab.RecordCount>0)and(PosTabArtikelTyp.AsString<>'T');
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateStatus;
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
          (not ReEdiTabWV_DATUM.IsNull)and
          (ReEdiTabWV_DATUM.AsDateTime>0)
        then Geaendert :='Termin : '+
                         FormatDateTime ('dd.mm.yyy',ReEdiTabWV_Datum.AsDateTime)
        else Geaendert :='';

       if (PosTab.Active)and ((PC1.ActivePage=PosTS)or(PC1.ActivePage=PosDetailTS))
        then Sortierung :='Position : '+inttostr (PosTab.RecNo)+
                          ' von '+inttostr (PosTab.RecordCount)
        else Sortierung :='-';

       OnUpdateStatusBar (SuchZeit,DatenSatz,Sortierung,Erstellt,Geaendert);
     end;


     if ReEdiTabBrutto_Flag.AsBoolean
      then ReEdiTopLab.Caption :='  '+BelegName+' bearbeiten ... (BRUTTO)'
      else ReEdiTopLab.Caption :='  '+BelegName+' bearbeiten ...';

     if (ReEdiTab.RecordCount>0)and
        (ReEdiTabSHOP_ID.AsInteger>0)and
        (ReEdiTabSHOP_ORDERID.AsInteger>0)and
        (BelegArt=VK_RECH_EDI) then
     begin
        // Shop-Box anzeigen, KFZ aus
        if KFZGB.Visible then KFZGB.Visible :=False;
        ShopStatusGB.Align :=alClient;
        ShopStatusGB.Visible :=True;
        Panel53.Visible :=True;
     end
        else
     begin
        // Shop-Box aus
        ShopStatusGB.Align :=alNone;
        ShopStatusGB.Visible :=False;
        // KFZ an wenn aktiviert
        if DM1.Use_KFZ then KFZGB.Visible :=True;
        Panel53.Visible :=DM1.Use_KFZ;
     end;

     UpdateArtikelDetails;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateArtikelDetails;
var P : Double;
begin
     if (PC1.ActivePage <> PosDetailTS)or
        (INDetailCalc) or
        (PosTab.Active=False)or
        (DM1.ArtInfoTab.Active=False)or
        (PosTab.ControlsDisabled) then exit;

     if PreisPC.ActivePage=PreisAlgTS then
     begin
       PreisGrid.Cells[0,1] :='Preis (VK'+IntToStr(ReEdiTabPR_Ebene.Value)+')';

       // Default-Preise
       P :=0;
       DM1.GetArtikelPreis (PosTabArtikel_ID.AsInteger,
                            -99 {Kunde},
                            ReEdiTabPR_Ebene.Value,
                            ReEdiTabBRUTTO_FLAG.AsBoolean,
                            1{Menge},
                            P);


       if (DM1.ArtInfoTab.RecordCount>0)and
          (
           (DM1.ArtInfoTab.Locate ('REC_ID, PREIS_TYP, ADRESS_ID',
                                   VarArrayOf([PosTabArtikel_ID.AsInteger,3,-99]),[])
           )
            or
           (DM1.ArtInfoTab.Locate ('REC_ID',PosTabArtikel_ID.AsInteger,[])
           )
          )  then
       begin
         PreisGrid.Cells[1,1] :=FormatFloat (',#0.00',P);

         if (DM1.ArtInfoTabAdress_ID.AsInteger=-99)and
            (DM1.ArtInfoTabPreis_Typ.AsInteger=3) then
         begin
           if DM1.ArtInfoTabMENGE2.AsInteger>1
            then PreisGrid.Cells[2,1] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE2.AsInteger)+' / '+
                                        FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS2.AsFloat) / 100)
            else PreisGrid.Cells[2,1] :='-';

           if DM1.ArtInfoTabMENGE3.AsInteger>1
            then PreisGrid.Cells[3,1] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE3.AsInteger)+' / '+
                                        FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS3.AsFloat) / 100)
            else PreisGrid.Cells[3,1] :='-';

           if DM1.ArtInfoTabMENGE4.AsInteger>1
            then PreisGrid.Cells[4,1] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE4.AsInteger)+' / '+
                                        FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS4.AsFloat) / 100)
            else PreisGrid.Cells[4,1] :='-';

           if DM1.ArtInfoTabMENGE5.AsInteger>1
            then PreisGrid.Cells[5,1] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE5.AsInteger)+' / '+
                                        FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS5.AsFloat) / 100)
            else PreisGrid.Cells[5,1] :='-';
         end
            else
         begin
            PreisGrid.Cells[2,1] :='-';
            PreisGrid.Cells[3,1] :='-';
            PreisGrid.Cells[4,1] :='-';
            PreisGrid.Cells[5,1] :='-';
         end;
       end
          else
       begin
         PreisGrid.Cells[1,1] :='-';
         PreisGrid.Cells[2,1] :='-';
         PreisGrid.Cells[3,1] :='-';
         PreisGrid.Cells[4,1] :='-';
         PreisGrid.Cells[5,1] :='-';
       end;

       // Kunden-Preise
       if (DM1.ArtInfoTab.RecordCount>0)and
          (DM1.ArtInfoTab.Locate ('REC_ID, PREIS_TYP, ADRESS_ID',
                                  VarArrayOf([PosTabArtikel_ID.AsInteger,
                                              3,ReEdiTabAddr_ID.AsInteger]
                                            ),[])) then
       begin
         P :=DM1.ArtInfoTab.FieldByName('PREIS').AsFloat;
         if ReEdiTabBRUTTO_FLAG.AsBoolean then P :=CAO_round(P* (100+PosTabCALC_STEUERPORZ.AsFloat))/100;

         PreisGrid.Cells[1,2] :=FormatFloat (',#0.00',P);

         if DM1.ArtInfoTabMENGE2.AsInteger>1
          then PreisGrid.Cells[2,2] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE2.AsInteger)+' / '+
                                      FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS2.AsFloat) / 100)
          else PreisGrid.Cells[2,2] :='-';

         if DM1.ArtInfoTabMENGE3.AsInteger>1
          then PreisGrid.Cells[3,2] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE3.AsInteger)+' / '+
                                      FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS3.AsFloat) / 100)
          else PreisGrid.Cells[3,2] :='-';

         if DM1.ArtInfoTabMENGE4.AsInteger>1
          then PreisGrid.Cells[4,2] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE4.AsInteger)+' / '+
                                      FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS4.AsFloat) / 100)
          else PreisGrid.Cells[4,2] :='-';

         if DM1.ArtInfoTabMENGE5.AsInteger>1
          then PreisGrid.Cells[5,2] :='ab '+FormatFloat (',#0',DM1.ArtInfoTabMENGE5.AsInteger)+' / '+
                                      FormatFloat (',#0.00',CAO_round(P * 100 - P* DM1.ArtInfoTabPREIS5.AsFloat) / 100)
          else PreisGrid.Cells[5,2] :='-';

       end
          else
       begin
          PreisGrid.Cells[1,2] :='-';
          PreisGrid.Cells[2,2] :='-';
          PreisGrid.Cells[3,2] :='-';
          PreisGrid.Cells[4,2] :='-';
          PreisGrid.Cells[5,2] :='-';
       end;
     end;

     try StueckListTS.TabVisible :=PosTabArtikelTyp.AsString='S'; except end;

     if PreisPC.ActivePage=PreisVKHisTS then
     begin
        if (HisTab.ParamByName ('AID').AsInteger<>PosTabArtikel_ID.AsInteger)or
           (HisTab.ParamByName ('QID').AsInteger<>VK_RECH)or
           (not HisTab.Active)then
        begin
           HisTab.Close;
           HisTab.ParamByName ('AID').AsInteger := PosTabArtikel_ID.AsInteger;
           HisTab.ParamByName ('QID').AsInteger := VK_RECH;
           HisTab.Open;
        end;
        HistGrid.Parent :=PreisVKHisTS;
     end
        else
     if PreisPC.ActivePage=PreisEKHisTS then
     begin
        if (HisTab.ParamByName ('AID').AsInteger<>PosTabArtikel_ID.AsInteger)or
           (HisTab.ParamByName ('QID').AsInteger<>EK_RECH)or
           (not HisTab.Active)then
        begin
           HisTab.Close;
           HisTab.ParamByName ('AID').AsInteger := PosTabArtikel_ID.AsInteger;
           HisTab.ParamByName ('QID').AsInteger := EK_RECH;
           HisTab.Open;
        end;
        HistGrid.Parent :=PreisEKHisTS;
     end
        else
     if PreisPC.ActivePage=EKBestTS then
     begin
        if (HisTab.ParamByName ('AID').AsInteger<>PosTabArtikel_ID.AsInteger)or
           (HisTab.ParamByName ('QID').AsInteger<>EK_BEST)or
           (not HisTab.Active)then
        begin
           HisTab.Close;
           HisTab.ParamByName ('AID').AsInteger := PosTabArtikel_ID.AsInteger;
           HisTab.ParamByName ('QID').AsInteger := EK_BEST;
           HisTab.Open;
        end;
        HistGrid.Parent :=EKBestTS;
     end else HisTab.Close;

     If PreisPC.ActivePage=LiefPreisTS then
     begin
         if (not ArtPreisTab.Active)or
            (ArtPreisTab.ParamByName ('ID').AsInteger <> PosTabArtikel_ID.AsInteger) then
         begin
            ArtPreisTab.Close;
            ArtPreisTab.ParamByName ('ID').AsInteger := PosTabArtikel_ID.AsInteger;
            ArtPreisTab.Open;
         end;
     end else ArtPreisTab.Close;

     if PreisPC.ActivePage=StueckListTS then
     begin
         if (not STListTab.Active)or
            (STListTab.ParamByName ('ID').AsInteger <> PosTabArtikel_ID.AsInteger) then
         begin
            STListTab.Close;
            STListTab.ParamByName ('ID').AsInteger := PosTabArtikel_ID.AsInteger;
            STListTab.Open;
         end;
     end else StListTab.Close;


     if PreisPC.ActivePage=LiefTS then
     begin
         if (not LiefTab.Active)or
            (LiefTab.ParamByName ('SRC_ID').AsInteger <> PosTabRec_ID.AsInteger) then
         begin
            LiefTab.Close;
            LiefTab.ParamByName ('SRC_ID').AsInteger := PosTabRec_ID.AsInteger;
            LiefTab.Open;
         end;
     end else LiefTab.Close;


     InDetailCalc :=True;
     try
       DetailRGW.Value :=PosTabEPreis.Value - PosTabEK_Preis.AsFloat;

       if PosTabEK_Preis.AsFloat<>0
         then DetailFaktor.Value :=CAO_round(PosTabEPreis.Value /
                                         PosTabEK_Preis.AsFloat * 100000)
                                   /100000 // auf 5 Nachk.-Stellen begrenzen

         else DetailFaktor.Value :=0;

       // Einzelpreis nach Rabatt
       P :=PosTabEPreis.Value;
       P :=cao_round((P - (P * PosTabRabatt.Value /100))*100) / 100;
       DetailEPreisR.Value :=P;

       // Rohgewinn nach Rabatt
       PosTabE_RGewinn.Value :=cao_round((P - PosTabEK_Preis.AsFloat)*100)/100;

     finally
       InDetailCalc :=False;
     end;

     DetailFaktor.Enabled  :=PosTabEK_Preis.AsFloat <> 0;
     DetailRGW_NR.Enabled  :=PosTabRabatt.Value <> 100;
     DetailEPreisR.Enabled :=PosTabRabatt.Value <> 100;
     PosDetailCalcGB.Enabled :=PosTabArtikelTyp.AsString <> 'T';
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosMatchButtonClick(Sender: TObject);
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
procedure TMakeVKReForm.OnAddArtikel (ID : Integer; Menge : Double;
                                      AlternativArtnum : String = '');
var PR : Double;
begin
     //wird vom Artikelstamm aufgerufen
     DM1.ArtInfoTab.Close;
     DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW1;
     DM1.ArtInfoTab.ParamByName ('AID').AsInteger :=ID;
     DM1.ArtInfoTab.Open;

     if (
         // Entweder Kundenpreis
         (DM1.ArtInfoTab.Locate ('REC_ID;PREIS_TYP;ADRESS_ID',
                                 VarArrayOF([ID,3,ReEdiTabAddr_ID.AsInteger]),
                                 []))or
         (DM1.ArtInfoTab.Locate ('REC_ID',
                                 ID,
                                 []))
        ) and
        (DM1.ArtInfoTabRec_ID.AsInteger=ID) and
        (DM1.ArtInfoTabNo_VK_Flag.Value=False) then
     begin
          AppendOK :=True;

          //PosTabRABATT.ReadOnly :=False;

          try
            Loading :=True;
            PosTab.Append;

            PosTabJournal_ID.Value      :=ReEdiTabREC_ID.Value;
            PosTabQuelle.Value          :=ReEdiTabQuelle.Value;
            PosTabQuelle_Sub.Value      :=ReEdiTabQuelle_Sub.Value;
            //PosTabJahr.Value            :=ReEdiTabJahr.Value;
            PosTabAddr_ID.Value         :=ReEdiTabADDR_ID.Value;
            PosTabVRENUM.Value          :=ReEdiTabVRENUM.Value;
            PosTabVLSNUM.Value          :=-1;
            PosTabATRNum.Value          :=-1;

            PosTabArtikel_ID.Value      :=DM1.ArtInfoTabREC_ID.Value;
            PosTabArtikelTyp.Value      :=DM1.ArtInfoTabArtikelTyp.Value;

            PosTabArtNum.Value          :=DM1.ArtInfoTabArtnum.Value;

            PosTabMatchCode.Value       :=DM1.ArtInfoTabMatchCode.Value;
            PosTabBarCode.Value         :=DM1.ArtInfoTabBarCode.Value;

            if UseKurztext
             then PosTabBezeichnung.AsString  :=DM1.ArtInfoTabKURZNAME.AsString
             else PosTabBezeichnung.AsString  :=DM1.ArtInfoTabLangName.AsString;

            PosTabLaenge.Value          :=DM1.ArtInfoTabLaenge.Value;
            PosTabGroesse.Value         :=DM1.ArtInfoTabGroesse.Value;
            PosTabDimension.Value       :=DM1.ArtInfoTabDimension.Value;
            PosTabGewicht.Value         :=DM1.ArtInfoTabGewicht.Value;
            PosTabME_Einheit.Value      :=DM1.ArtInfoTabME_Einheit.Value;
            PosTabPR_Einheit.Value      :=DM1.ArtInfoTabPR_Einheit.Value;
            PosTabSN_Flag.AsBoolean     :=DM1.ArtInfoTabSN_Flag.AsBoolean;

            PosTabNO_RABATT_FLAG.Value  :=DM1.ArtInfoTabNO_RABATT_FLAG.Value;
            if PosTabNO_RABATT_FLAG.Value=False
             then PosTabRabatt.Value    :=ReEdiTabGlobRabatt.Value
             else PosTabRabatt.Value    :=0;

            PosTabSteuer_Code.Value     :=DM1.ArtInfoTabSteuer_Code.Value;
            PosTabAltteil_Flag.Value    :=DM1.ArtInfoTabAltTeil_Flag.Value;
            PosTabALTTEIL_PROZ.Value    :=0.1; // 10%
            PosTabALTTEIL_STCODE.Value  :=DM1.ArtInfoTabSteuer_Code.Value;
            PosTabBEZ_FEST_Flag.Value   :=DM1.ArtInfoTabNO_BEZEDIT_Flag.Value;

            PosTabGEGENKTO.Value        :=DM1.ArtInfoTabErloes_Kto.Value;
            PosTabVPE.Value             :=DM1.ArtInfoTabVPE.AsInteger;




            if not DM1.ArtInfoTabNO_PROVISION_FLAG.AsBoolean then
            begin
               if DM1.ArtInfoTabPROVIS_PROZ.AsFloat <> 0
                then PosTabPROVIS_PROZ.AsFloat :=DM1.ArtInfoTabPROVIS_PROZ.AsFloat
                else PosTabPROVIS_PROZ.AsFloat :=DM1.GetVertreterProv (ReEdiTabVERTRETER_ID.AsInteger);
            end;

            // wenn Kundenpreis, dann Artikelnummer übernehmen wenn gesetzt
            if (length(DM1.ArtInfoTabBestnum.AsString)>0)and
               (DM1.ArtInfoTabADRESS_ID.AsInteger=ReEdiTabAddr_ID.AsInteger) then
            begin
               PosTabArtnum.AsString :=DM1.ArtInfoTabBESTNUM.AsString;
            end;

            PosTabMenge.Value           :=CAO_round(Menge*100)/100;


            if DM1.GetArtikelPreis (DM1.ArtInfoTabREC_ID.AsInteger,
                                    ReEdiTabADDR_ID.AsInteger,
                                    ReEdiTabPR_Ebene.Value,
                                    ReEdiTabBRUTTO_FLAG.AsBoolean,
                                    PosTabMenge.AsFloat,
                                    PR)

             then PosTabEPreis.Value :=PR;
            // EK laden
            if DM1.GetArtikelPreis (DM1.ArtInfoTabREC_ID.AsInteger,
                                    -1,
                                    0{EK},
                                    False,
                                    PosTabMenge.AsFloat,
                                    PR)
            then PosTabEK_Preis.Value :=PR;

            PR :=PosTabEPreis.Value;
            PR :=cao_round((PR - (PR * PosTabRabatt.Value /100))*100) / 100;
            PosTabE_RGewinn.Value :=cao_round ((PR - PosTabEK_Preis.AsFloat)*100)/100;

            PosTab.Post;
          except
            PosTab.Cancel;
          end;
          Loading :=False;
          AppendOK :=False;

          //PosTabRabatt.ReadOnly :=PosTabNO_RABATT_FLAG.Value;

          DM1.ArtInfoTab.Close;
          DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2;
          DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
          DM1.ArtInfoTab.ParamByName ('QUELLE').AsInteger :=BelegArt;
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
        DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2;
        DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
        DM1.ArtInfoTab.ParamByName ('QUELLE').AsInteger :=BelegArt;
        DM1.ArtInfoTab.Open;
     end else
     begin
        // Hier Fehler, Artikel nicht gefunden !!!
        DM1.ArtInfoTab.Close;
        DM1.ArtInfoTab.SQL.Text :=ArtInfoSqlS+ArtInfoSqlW2;
        DM1.ArtInfoTab.ParamByName ('JID').AsInteger :=ReEdiTabREC_ID.Value;
        DM1.ArtInfoTab.ParamByName ('QUELLE').AsInteger :=BelegArt;
        DM1.ArtInfoTab.Open;
     end;
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosGridApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
     if (assigned(Field))and(uppercase(field.FieldName)='MENGE')and
        (PosTabArtikelTyp.AsString='N') then
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
           (PosTabEK_Preis.Value<>0) and
           (PosTabNSumme.Value / PosTabMenge.Value < PosTabEK_Preis.Value)
          then Canvas.Font.Color :=clRed;
     end;


     if (PosTabArtikelTyp.AsString='T')and
        (

         (field.FieldName='MENGE')or
         (field.FieldName='ME_EINHEIT')or
         (field.FieldName='EPREIS')or
         (field.FieldName='RABATT')or
         (field.FieldName='NSUMME')or
         (field.FieldName='BSUMME')or
         (field.FieldName='STEUER_CODE')or
         (field.FieldName='MWST')or
         (field.FieldName='MENGE_GELIEFERT')or
         (field.FieldName='GEWICHT')
        ) then
     begin
       if (gdSelected in State)
         then Canvas.Font.Color :=clNavy //PosGrid.HighlightColor
         else Canvas.Font.Color :=Canvas.Brush.Color;

     end;


end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpBtn1Click(Sender: TObject);
var CurrPos,Pos : Integer;
begin
    PC1Change(Sender);
    UpBtn1.Enabled :=False;
    UpBtn2.Enabled :=False;
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
     UpBtn1.Enabled :=True;
     UpBtn2.Enabled :=True;
    end;
    PosTabAfterScroll(nil);
end;
//------------------------------------------------------------------------------
procedure TMakeVKReForm.FindDialog1Find(Sender: TObject);
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

end.

