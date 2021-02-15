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
Modul        : CAO_KUNDE
Stand        : 18.01.2004
Version      : 1.2 RC3
Beschreibung : Dialog Adressstammdaten

History :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
20.01.2003 - durch klicken auf das Beschriftungsfeld "Name1"
             kann man einen Outlook-Kontakt anlegen
           - durch klicken auf das Beschriftungsfeld "Geburtsdatum"
             kann man einen Outlook-Termin anlegen
           - durch klicken auf das Beschriftungsfeld "eMail"
             wird der Default-eMail-Clint für eine neue Mail geöffnet
           - durch klicken auf das Beschriftungsfeld "Internet"
             wird der Default-browser mit der Internetseite geöffnet
           - RX-Komponenten durch JEDI-VCL-Komponenten ersetzt
26.04.2003 - im Menü Extras neuen Menüpunkt "Kundennummer zuweisen"
             hinzugefügt
09.05.2003 - Bug bei der Auswahl aus dem PLZ-Stamm gefixt
             Daten wurden nicht übernommen
12.05.2003 - beim erstellen eines Kunden wird jetzt der Ort+Vorwahl aus der
             PLZ-Datenbank automatisch übernommen, wenn es zu dieser PLZ nur
             einen Ort gibt.
26.05.2003 - Historie um Angebote, Lieferscheine und EK-Bestellungen erweitert
31.05.2003 - neue Felder für MWST-Frei, Brutto-Berechnen und UmsatzSteuer-ID
             hinzugefügt
14.06.2003 - Bug (Kundennummer, Debi- und Kreditorennummer) waren in der
             Listenansicht editierbar, jetzt Readonly !
15.06.2003 - Ansprechpartner um Anrede, Straße, Land, PLZ, ort und Geburtdatum
             erweitert
             Outlook-Funktionalität für Ansprechpartner-Geburtstagstermin
             Mail-Funktion für Ansprechpartner-Email
16.06.2003 - Das Tabsheet KFZ wird jetzt versteckt wenn die KFZ-Funktion in der
             SQL-Registery (MAIN->USE_KFZ=0) agbeschaltet ist
24.06.2003 - Code für Adressen-Import eingefügt
05.07.2003 - Länge von Kontonumer und BLZ kann jetzt in der Registery
             eingestellt werden
02.08.2003 - Kundennummer (1) kann jetzt bearbeitet werden
14.08.2003 - KL Auswahl für Bankleitzahlen hinzugefügt
18.08.2003 - neues Feld Kontoinhaber zum Adressstamm hinzugefügt
20.08.2003 - Multiple Lieferanschriften eingebaut, neuen Dialog zur Berabeitung
             eine Lieferanschrift kann als "Default" gesetzt werden
06.09.2003 - Eingestelltes Suchfeld wird jetzt gespeichert und wieder
             hergestellt
           - Sortierung wird gespeichert und wieder hergestellt
           - Vertreterprovision hinzugefügt
20.09.2003 - Merkmal-Anzeige eingebaut
24.10.2003 - Tabsheet für Dateiverknüpfungen eingebaut / nur PRO-Version
25.10.2003 - neues Menü Erstellt, damit aus dem Adressstamm jetzt auch neue
             Vorgänge erzeugt werden können
09.11.2003 - Bug bei Suche ohne Ergebnis mit anschließendem Enter gefixt
22.11.2003 - DLL-Plugin-Schnittstelle implementiert
02.12.2003 - die Kundennummer wird jetzt mit Hilfe des Nummernformates erzeugt
18.01.2004 - TAPI-Aufrufe bei Ansprechpartner/Telefon hinzugefügt

Todo :

$Id: CAO_KUNDE.pas,v 1.63 2004/05/23 14:24:20 jan Exp $

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Kunde;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, ClipBrd, cao_var_const, Buttons, Grids, DBCtrls, StdCtrls, Menus,
  CheckLst, DBExtCtrls, DBGrids, DividerBevel, rxdbcomb, RxDBGrid, ZDataset,
  ZSqlUpdate, ZAbstractRODataset, JvFunctions, VolDBEdit;

type

  { TAdressForm }

  TAdressForm = class(TForm)
    AddrHirDockBtn: TSpeedButton;
    AddrPanel: TPanel;
    ADDR_PC: TPageControl;
    AddrHirViewBtn: TSpeedButton;
    Button1: TButton;
    CaoGroupBox3: TGroupBox;
    AnschriftGB: TGroupBox;
    abteilung: TDBEdit;
    BriefanredeGB: TGroupBox;
    BlZEdi: TDBComboBox;
    AspAlgGB: TGroupBox;
    AspKommGB: TGroupBox;
    APFunktion: TDBEdit;
    APPLZ: TDBComboBox;
    APOrt: TDBComboBox;
    APVorname: TDBEdit;
    APName: TDBEdit;
    APDS: TDataSource;
    APStrasse: TDBEdit;
    APLand: TDBEdit;
    APInfo: TDBMemo;
    APTelefon: TDBComboBox;
    APTelPriv: TDBComboBox;
    APMobilfunk: TDBComboBox;
    APemail: TDBComboBox;
    APEmail2: TDBComboBox;
    APTelefax: TDBEdit;
    CaoGroupBox9: TGroupBox;
    ASPGrid: TDBGrid;
    BRUTTO_CB: TDBCheckBox;
    APGebDatum: TDBDateEdit;
    MWST_FREI_CB: TDBCheckBox;
    KunSuchGrid: TDBGrid;
    JournalGrid: TDBGrid;
    JPosTabDS: TDataSource;
    JourTabADDR_ID: TZIntegerField;
    JourTabBSUMME: TZDoubleField;
    JourTabCalcEKVK: TStringField;
    JourTabCalcStadium: TStringField;
    JourTabDS: TDataSource;
    JourPosGrid: TDBGrid;
    JahrCB: TComboBox;
    HistorySelCB: TComboBox;
    DateiTopPanel: TPanel;
    CaoGroupBox11: TGroupBox;
    JourTabIST_BETRAG: TZDoubleField;
    JourTabKFZ_ID: TZIntegerField;
    JourTabKM_STAND: TZIntegerField;
    JourTabKUN_NAME1: TZRawStringField;
    JourTabLDATUM: TZDateField;
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
    JourTabVLSNUM: TZIntegerField;
    JourTabVRENUM: TZIntegerField;
    JourTabWAEHRUNG: TZRawStringField;
    JPosTabADDR_ID: TZIntegerField;
    JPosTabARTIKELTYP: TZRawStringField;
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
    Label60: TLabel;
    Label4: TLabel;
    LinkPanel: TPanel;
    HistTopPanel: TPanel;
    JumpMen1: TMenuItem;
    Belegbearbeiten1: TMenuItem;
    Anrede: TVolgaDBEdit;
    BAnrede: TVolgaDBEdit;
    APAnrede: TVolgaDBEdit;
    PR_EbeneCB: TVolgaDBEdit;
    zumJournal1: TMenuItem;
    Rechnungdrucken1: TMenuItem;
    N10: TMenuItem;
    MerkmalTabFLAG: TZIntegerField;
    MerkmalTabMERKMAL_ID: TZIntegerField;
    MerkmalTabNAME: TZRawStringField;
    Panel2: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    JumpMenu: TPopupMenu;
    IstLieferCB: TCheckBox;
    KFZTabADDR_ID: TZIntegerField;
    KFZTabFGST_NUM: TZRawStringField;
    KFZTabGRUPPE: TZIntegerField;
    KFZTabHERSTELLUNG: TZDateField;
    KFZTabHUBRAUM: TZIntegerField;
    KFZTabKAUFDATUM: TZDateField;
    KFZTabKFZ_ID: TZIntegerField;
    KFZTabKM_STAND: TZIntegerField;
    KFZTabKW: TZIntegerField;
    KFZTabLE_BESUCH: TZDateField;
    KFZTabNAE_AU: TZDateField;
    KFZTabNAE_TUEV: TZDateField;
    KFZTabPOL_KENNZ: TZRawStringField;
    KFZTabPS: TZIntegerField;
    KFZTabTYP: TZRawStringField;
    KFZTabTYP_ID: TZIntegerField;
    KFZTabZULASSUNG: TZDateField;
    KFZ_DS: TDataSource;
    KFZGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    CaoGroupBox5: TGroupBox;
    KunLiefDS: TDataSource;
    KunLiefAddrGrid: TDBGrid;
    KontoInhEdi: TDBEdit;
    KontoEdi: TDBEdit;
    BankNameEdi: TDBEdit;
    iban: TDBEdit;
    KunLiefTabABTEILUNG: TZRawStringField;
    KunLiefTabADDR_ID: TZIntegerField;
    KunLiefTabANREDE: TZRawStringField;
    KunLiefTabINFO: TZRawCLobField;
    KunLiefTabLAND: TZRawStringField;
    KunLiefTabNAME1: TZRawStringField;
    KunLiefTabNAME2: TZRawStringField;
    KunLiefTabNAME3: TZRawStringField;
    KunLiefTabORT: TZRawStringField;
    KunLiefTabPLZ: TZRawStringField;
    KunLiefTabREC_ID: TZIntegerField;
    KunLiefTabSTRASSE: TZRawStringField;
    ASPTelPrivLab: TLabel;
    ASPFaxLab: TLabel;
    ASPMobilLab: TLabel;
    ASPEmailLab: TLabel;
    ASPEmail2Lab: TLabel;
    ASPGebDatumLab: TLabel;
    ASPTelefonLab: TLabel;
    Label46: TLabel;
    Label62: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label48: TLabel;
    Label61: TLabel;
    Label23: TLabel;
    Panel12: TPanel;
    Panel10: TPanel;
    KFZTopPanel: TPanel;
    ArtikelViewBtn: TSpeedButton;
    JumpMenuBtn: TSpeedButton;
    HistSumBar: TStatusBar;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    HistArtikelSB: TStatusBar;
    StatusBar2: TStatusBar;
    swift: TDBEdit;
    Bevel1: TDividerBevel;
    Label74: TLabel;
    Label75: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    Label78: TLabel;
    Label73: TLabel;
    SpracheCB: TDBLookupComboBox;
    SearchTimer: TTimer;
    ToolBar1: TToolBar;
    KunLiefEdiBtn: TToolButton;
    ToolBar99: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    KunLiefStdBtn: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    KunLiefDelBtn: TToolButton;
    ToolButton7: TToolButton;
    VertreterCB: TDBLookupComboBox;
    WaehrungCB: TDBLookupComboBox;
    VertrProzEdi: TDBEdit;
    waehrung: TDBEdit;
    klimit: TDBEdit;
    globrabatt: TDBEdit;
    UST_ID_EDI: TDBEdit;
    SpracheEdi: TDBEdit;
    VertreterEdi: TDBEdit;
    IstKundeCB: TCheckBox;
    KundeExpCB: TCheckBox;
    debnum: TDBEdit;
    KVersand: TDBEdit;
    KZahlart: TDBEdit;
    KVersandCB: TDBLookupComboBox;
    KZahlartCB: TDBLookupComboBox;
    Label33: TLabel;
    Label28: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label1: TLabel;
    Label65: TLabel;
    Label32: TLabel;
    Label38: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    LVersandCB: TDBLookupComboBox;
    LZahlartCB: TDBLookupComboBox;
    LVersand: TDBEdit;
    LZahlart: TDBEdit;
    krdnum: TDBEdit;
    LieferExpCB: TCheckBox;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit3: TDBEdit;
    AddrTopGB: TGroupBox;
    CaoGroupBox10: TGroupBox;
    BankGB: TGroupBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    KundeGB: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Label56: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label55: TLabel;
    KunLiefTab: TZQuery;
    APTab: TZQuery;
    KFZTab: TZQuery;
    JourTab: TZQuery;
    JPosTab: TZQuery;
    SumQuery: TZQuery;
    MerkmalTab: TZQuery;
    ZuweisGB: TGroupBox;
    LieferantGB: TGroupBox;
    KunVersandArtCB: TDBLookupComboBox;
    KunVersandArtCBxx: TDBLookupComboBox;
    KunVersand: TDBEdit;
    KunZahlart: TDBEdit;
    Label36: TLabel;
    ZBNettoTage: TDBEdit;
    ZBSktoProz: TDBEdit;
    ZBSktoTage: TDBEdit;
    Label54: TLabel;
    Label66: TLabel;
    Label10: TLabel;
    Label72: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label41: TLabel;
    ShopPW: TDBEdit;
    ShopPwLab: TLabel;
    ShopDelCB: TCheckBox;
    ShopKundeCB: TCheckBox;
    DatumGB: TGroupBox;
    Bevel2: TDividerBevel;
    GebDat: TDBDateEdit;
    GroupBox1: TGroupBox;
    KunSeit: TDBDateEdit;
    Label30: TLabel;
    GebdatToOutlookLabel: TLabel;
    tele1: TDBComboBox;
    tele2: TDBComboBox;
    funk: TDBComboBox;
    email: TDBComboBox;
    email2: TDBComboBox;
    internet: TDBComboBox;
    fax: TDBEdit;
    divers1: TDBEdit;
    KommunikationGB: TGroupBox;
    InfoMemo: TDBMemo;
    InfoGB: TGroupBox;
    Telefon2Lab: TLabel;
    TelefaxLab: TLabel;
    MobilfunkLab: TLabel;
    EmailLab: TLabel;
    EMail2Lab: TLabel;
    InternetLab: TLabel;
    DiversesLab: TLabel;
    TelefonLab: TLabel;
    Ort: TDBComboBox;
    Postfach: TDBComboBox;
    PF_PLZ: TDBComboBox;
    PLZ: TDBComboBox;
    Land: TDBEdit;
    PF_Land: TDBEdit;
    strasse: TDBEdit;
    name3: TDBEdit;
    name2: TDBEdit;
    name1: TDBEdit;
    KunMerkmalLB: TCheckListBox;
    gruppe: TDBEdit;
    KS_DS: TDataSource;
    KunGR1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label43: TLabel;
    Label71: TLabel;
    Label16: TLabel;
    MerkmalLab: TLabel;
    Label3: TLabel;
    AddAdressToOutlookLabel: TLabel;
    ZuweisungenGB: TGroupBox;
    match: TDBEdit;
    KunNum1Edit: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    SuchbegrGB: TGroupBox;
    KSQueryABTEILUNG: TZRawStringField;
    KSQueryANREDE: TZRawStringField;
    KSQueryBANK: TZRawStringField;
    KSQueryBLZ: TZRawStringField;
    KSQueryBRIEFANREDE: TZRawStringField;
    KSQueryBRT_TAGE: TZShortIntField;
    KSQueryBRUTTO_FLAG: TZRawStringField;
    KSQueryDEB_NUM: TZIntegerField;
    KSQueryDEFAULT_LIEFANSCHRIFT_ID: TZIntegerField;
    KSQueryDIVERSES: TZRawStringField;
    KSQueryEMAIL: TZRawStringField;
    KSQueryEMAIL2: TZRawStringField;
    KSQueryERSTELLT: TZDateField;
    KSQueryERST_NAME: TZRawStringField;
    KSQueryFAX: TZRawStringField;
    KSQueryFUNK: TZRawStringField;
    KSQueryGEAEND: TZDateField;
    KSQueryGEAEND_NAME: TZRawStringField;
    KSQueryGRABATT: TZDoubleField;
    KSQueryGRUPPE: TZRawStringField;
    KSQueryIBAN: TZRawStringField;
    KSQueryINFO: TZRawCLobField;
    KSQueryINTERNET: TZRawStringField;
    KSQueryKRD_NUM: TZIntegerField;
    KSQueryKTO: TZRawStringField;
    KSQueryKTO_INHABER: TZRawStringField;
    KSQueryKUNDENGRUPPE: TZIntegerField;
    KSQueryKUNNUM1: TZRawStringField;
    KSQueryKUNNUM2: TZRawStringField;
    KSQueryKUN_GEBDATUM: TZDateField;
    KSQueryKUN_KRDLIMIT: TZDoubleField;
    KSQueryKUN_LIEFART: TZIntegerField;
    KSQueryKUN_SEIT: TZDateField;
    KSQueryKUN_ZAHLART: TZIntegerField;
    KSQueryLAND: TZRawStringField;
    KSQueryLIEF_LIEFART: TZIntegerField;
    KSQueryLIEF_ZAHLART: TZIntegerField;
    KSQueryMATCHCODE: TZRawStringField;
    KSQueryMWST_FREI_FLAG: TZRawStringField;
    KSQueryNAME1: TZRawStringField;
    KSQueryNAME2: TZRawStringField;
    KSQueryNAME3: TZRawStringField;
    KSQueryNET_SKONTO: TZDoubleField;
    KSQueryNET_TAGE: TZShortIntField;
    KSQueryORT: TZRawStringField;
    KSQueryPF_PLZ: TZRawStringField;
    KSQueryPLZ: TZRawStringField;
    KSQueryPOSTFACH: TZRawStringField;
    KSQueryPROVIS_PROZ: TZDoubleField;
    KSQueryPR_EBENE: TZShortIntField;
    KSQueryREC_ID: TZIntegerField;
    KSQuerySHOP_CHANGE_FLAG: TZByteField;
    KSQuerySHOP_DEL_FLAG: TZRawStringField;
    KSQuerySHOP_ID: TZShortIntField;
    KSQuerySHOP_KUNDE_ID: TZIntegerField;
    KSQuerySHOP_PASSWORD: TZRawStringField;
    KSQuerySPRACH_ID: TZIntegerField;
    KSQuerySTATUS: TZIntegerField;
    KSQuerySTRASSE: TZRawStringField;
    KSQuerySWIFT: TZRawStringField;
    KSQueryTELE1: TZRawStringField;
    KSQueryTELE2: TZRawStringField;
    KSQueryUST_NUM: TZRawStringField;
    KSQueryVERTRETER_ID: TZCardinalField;
    KSQueryWAERUNG: TZRawStringField;
    ListeBtn: TSpeedButton;
    HistBtn: TSpeedButton;
    LinkBtn: TSpeedButton;
    KFZBtn: TSpeedButton;
    ASPBtn: TSpeedButton;
    ErwBtn: TSpeedButton;
    AllgBtn: TSpeedButton;
    ErwTopPanel: TPanel;
    MainMenu1: TMainMenu;
    Adresse1: TMenuItem;
    Loeschen1: TMenuItem;
    Angebot1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Match1: TMenuItem;
    Kundennummer1: TMenuItem;
    LiefNummer1: TMenuItem;
    Allgemein1: TMenuItem;
    Ansprechpartner1: TMenuItem;
    Fahrzeuge1: TMenuItem;
    Dateien1: TMenuItem;
    Historie1: TMenuItem;
    Liste1: TMenuItem;
    alle1: TMenuItem;
    Aktualisieren1: TMenuItem;
    Adressenzusammenfassen1: TMenuItem;
    Kundennummerzuweisen1: TMenuItem;
    ImportUpdate1: TMenuItem;
    Export1: TMenuItem;
    ErweiterteSuche1: TMenuItem;
    AdresseinZwischenablage1: TMenuItem;
    CSV1: TMenuItem;
    N9: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    N5001: TMenuItem;
    N2001: TMenuItem;
    N1001: TMenuItem;
    N501: TMenuItem;
    N101: TMenuItem;
    N5: TMenuItem;
    Treffer1: TMenuItem;
    N4: TMenuItem;
    KSQuery: TZQuery;
    AddrUpdSQL: TZUpdateSQL;
    Zuweisungen1: TMenuItem;
    PLZOrt1: TMenuItem;
    Name11: TMenuItem;
    uebernehmen1: TMenuItem;
    N3: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N2: TMenuItem;
    Suchen1: TMenuItem;
    N8: TMenuItem;
    Rechnung1: TMenuItem;
    EKBestellung1: TMenuItem;
    EKRechnung1: TMenuItem;
    Vorgangneu1: TMenuItem;
    N1: TMenuItem;
    Neu1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    Extras1: TMenuItem;
    Panel4: TPanel;
    ASPTopPanel: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    SuchFeldCB: TComboBox;
    DBNavigator3: TDBNavigator;
    SuchBeg: TEdit;
    KunGRPan: TPanel;
    Label29: TLabel;
    Label35: TLabel;
    Panel1: TPanel;
    KunAlgRightPan: TPanel;
    KunAlgLeftPan: TPanel;
    Panel3: TPanel;
    SB1: TStatusBar;
    KunToolbar: TToolBar;
    Splitter2: TSplitter;
    Allg_TS: TTabSheet;
    KunTV: TTreeView;
    Zuweis_TS: TTabSheet;
    ASP_TS: TTabSheet;
    KFZ_TS: TTabSheet;
    Link_TS: TTabSheet;
    Hist_TS: TTabSheet;
    Such_TS: TTabSheet;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    UebernahmeBtn: TToolButton;
    procedure AddrHirDockBtnClick(Sender: TObject);
    procedure AddrHirViewBtnClick(Sender: TObject);
    procedure AddrPanelResize(Sender: TObject);
    procedure ADDR_PCChange(Sender: TObject);
    procedure AdresseinZwischenablage1Click(Sender: TObject);
    procedure Adressenzusammenfassen1Click(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure alle1Click(Sender: TObject);
    procedure AllgBtnMouseEnter(Sender: TObject);
    procedure AllgBtnMouseLeave(Sender: TObject);
    procedure AsPEMailLab2Click(Sender: TObject);
    procedure AsPEMailLabClick(Sender: TObject);
    procedure APPLZButtonClick(Sender: TObject);
    procedure APTabBeforeDelete(DataSet: TDataSet);
    procedure APTabBeforeEdit(DataSet: TDataSet);
    procedure APTabBeforePost(DataSet: TDataSet);
    procedure APTabNewRecord(DataSet: TDataSet);
    procedure Belegbearbeiten1Click(Sender: TObject);
    procedure HistorySelCBChange(Sender: TObject);
    procedure JahrCBClick(Sender: TObject);
    procedure BlZEdiExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CSV1Click(Sender: TObject);
    procedure Email1BtnClick(Sender: TObject);
    procedure Email2BtnClick(Sender: TObject);
    procedure ErweiterteSuche1Click(Sender: TObject);
    procedure ImportUpdate1Click(Sender: TObject);
    procedure InternetBtnClick(Sender: TObject);
    procedure JourTabAfterOpen(DataSet: TDataSet);
    procedure JourTabCalcFields(DataSet: TDataSet);
    procedure JourTabDSDataChange(Sender: TObject; Field: TField);
    procedure JPosTabCalcFields(DataSet: TDataSet);
    procedure JumpMenuPopup(Sender: TObject);
    procedure JumpToNewVorgang(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KSQueryAfterPost(DataSet: TDataSet);
    procedure KSQueryAfterScroll(DataSet: TDataSet);
    procedure KSQueryBeforeDelete(DataSet: TDataSet);
    procedure KSQueryBeforeInsert(DataSet: TDataSet);
    procedure AddrTabBeforePost(DataSet: TDataSet);
    procedure KSQueryNewRecord(DataSet: TDataSet);
    procedure KSQueryUpdateRecord(DataSet: TDataSet; UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure KS_DSDataChange(Sender: TObject; Field: TField);
    procedure Kundennummerzuweisen1Click(Sender: TObject);
    procedure KunLiefDelBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure KunLiefStdBtnClick(Sender: TObject);
    procedure KunLiefTabAfterScroll(DataSet: TDataSet);
    procedure KunLiefAddrGridApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; State: TGridDrawState);
    procedure KunMerkmalLBClickCheck(Sender: TObject);
    procedure KunSuchGridDblClick(Sender: TObject);
    procedure KunSuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure KunTVChange(Sender: TObject; Node: TTreeNode);
    procedure KunTVExit(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure ListeBtnClick(Sender: TObject);
    procedure Loeschen1Click(Sender: TObject);
    procedure matchEnter(Sender: TObject);
    procedure matchExit(Sender: TObject);
    procedure matchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure matchKeyPress(Sender: TObject; var Key: char);
    procedure Neu1Click(Sender: TObject);
    procedure PLZButtonClick(Sender: TObject);
    procedure Rechnungdrucken1Click(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure ShopKundeCBClick(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Sort1Click(Sender: TObject);
    procedure SuchBegChange(Sender: TObject);
    procedure SuchBegKeyPress(Sender: TObject; var Key: char);
    procedure Suchen1Click(Sender: TObject);
    procedure tele1ButtonClick(Sender: TObject);
    procedure UebernahmeBtnClick(Sender: TObject);
    procedure zumJournal1Click(Sender: TObject);
  private
    { Private-Deklarationen}
    jour_mwst_tab : array[0..3] of double;
    searchtime : Integer;

    querytime  : Integer;
    Limit      : Integer;
    JourLastID : Integer;
    JPJ_LastID : Integer;

    sortname   : string;
    sortfield  : String;
    SuchBegr   : String;
    SuchFeldID : Integer;

    //KGR        : Integer; // aktuelle Kundengruppe
    aktsort    : integer;

    InUpdate   : Boolean;

    Kunden_SQL : String;
    KunGR      : Integer;

    KunGrDok   : Boolean;

    LastID     : Integer;

    KNUM1_EDI  : Boolean;

    procedure SetSort (Sort : Integer);
    procedure UpdateQuery (ExtSearchSQL : String='');
    procedure UpdateHistory;
    procedure Update_JournalArtikel (JOUR_ID : Integer);
    procedure UpdateStatus;
    procedure UpdateMekrmale (ID : Integer);
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
               message WM_GETMINMAXINFO;
    procedure UpdateDateien;
  public
    { Public-Deklarationen}
    first      : boolean;
    Uebern     : Boolean;

    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure SearchKunnum (SearchNum : String; Modal : Boolean);
  end;

var
  AdressForm: TAdressForm;

implementation

{$R *.frm}

uses
  CAO_MAIN, CAO_Tool1, CAO_PLZ, CAO_DM, CAO_Logging, CAO_Link, cao_progress,
  cao_plugin_def, cao_plugin_func, cao_dbgrid_layout, CAO_BLZ, CAO_Pim,
  cao_adressen_lief;

//----------------------------DLL-STUFF-----------------------------------------
var SuchDLL          : tHandle;
    CaoPluginExecCmd : TCaoPluginExecCmd;
    CaoPluginInit    : tCaoPluginInit;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
{ TAdressForm }
//------------------------------------------------------------------------------
procedure TAdressForm.FormActivate(Sender: TObject);
var i, id, l    : integer;
    root_tn,
    tn,
    merkmal_tn  : ttreenode;
    DLLName     : String;
    FuncPTR     : tFarProc;
begin
  id :=LastID;
  if first then
  begin
      First :=false;

      // NEU Erweiterte SuchDLL laden
      DLLName :=DM1.ReadString ('MAIN\ADRESSEN','SUCH_DLL','');

      if assigned(LogForm) then
        logform.addlog ('ADRESSEN: DLL '+DLLName);
      if (not FileExists(DLLName))and(assigned(LogForm)) then
        logform.addlog ('ADRESSEN: DLL nicht gefunden');

      if (length(DLLName)>0) and
         (FileExists(DLLName)) and
         (SuchDLL=0) then
      begin
         FuncPtr :=nil;
         try
            SuchDLL :=LoadLibrary(PChar(DLLName));
            if SuchDLL <> 0 then
            begin
               FuncPtr :=GetProcAddress(SuchDLL, 'CaoPluginExecCmd');
               if assigned (FuncPtr) then @CaoPluginExecCmd :=FuncPTR;

               FuncPtr :=GetProcAddress(SuchDLL, 'CaoPluginInit');
              if assigned (FuncPtr) then
              begin
                 // Init aufrufen und CallBackFunktionen der DLL mitteilen

                 @CaoPluginInit :=FuncPTR;
                 CaoPluginInit (PChar(DM1.AktMandant), GetCaoRegistryFunc);
              end;

              if assigned(LogForm) then
                 logform.addlog ('ADRESSEN: DLL geladen');
           end
              else
           begin
              @CaoPluginExecCmd :=nil;
              @CaoPluginInit :=nil;
              if assigned(LogForm) then
                 logform.addlog ('ADRESSEN: DLL Fehler beim laden');
           end;
         except
           @CaoPluginExecCmd :=nil;
           @CaoPluginInit :=nil;
           if assigned(LogForm) then
              logform.addlog ('ADRESSEN: DLL Exception beim laden');
         end;
      end;
      if (not Assigned (CaoPluginExecCmd))and (assigned(LogForm))
       then logform.addlog ('ADRESSEN: DLL Funktion nicht gefunden');

      ErweiterteSuche1.Visible :=assigned(CaoPluginExecCmd);
      // ENDE NEU DLL

      ID :=-1;
      LastID :=-1;
      JourLastID :=-1;

      Fahrzeuge1.Enabled         :=DM1.Use_KFZ;
      KFZBtn.Visible             :=DM1.Use_KFZ;
//      ASPGrid.RowColor1          :=DM1.C2Color;
//      KFZGrid.RowColor1          :=DM1.C2Color;
//      JournalGrid.RowColor1      :=DM1.C2Color;
//      JourPosGrid.RowColor1      :=DM1.C2Color;
//      KunSuchGrid.RowColor1      :=DM1.C2Color;
//      KunLiefAddrGrid.RowColor1  :=DM1.C2Color;


//      ASPGrid.EditColor          :=DM1.EditColor;
//      KFZGrid.EditColor          :=DM1.EditColor;
//      JournalGrid.EditColor      :=DM1.EditColor;
//      JourPosGrid.EditColor      :=DM1.EditColor;
//      KunSuchGrid.EditColor      :=DM1.EditColor;
//      KunLiefAddrGrid.EditColor  :=DM1.EditColor;


//      Addr_PC.HintColor :=Application.HintColor;

      PR_EbeneCB.ComboProps.ComboItems.Clear;
      PR_EbeneCB.ComboProps.ComboValues.Clear;
      For i:=1 to DM1.AnzPreis do
      begin
         PR_EbeneCB.ComboProps.ComboItems.Add ('VK'+Inttostr(i));
         PR_EbeneCB.ComboProps.ComboValues.Add (Inttostr(i));
      end;
      PR_EbeneCB.DropDownRows :=DM1.AnzPreis;
      PR_EbeneCB.DialogStyle :=vdsCombo;

      SB1.SimplePanel :=True;
      SB1.SimpleText :='Lade Benutzereinstellungen ...';

      KunGrDok         :=False;
      KunGRPan.Visible :=False;
      Splitter2.Visible :=False;


      Addr_PC.Align    :=alNone;
      AddrPanelResize(Sender);

      // Kundengruppenauswahl füllen
      try
        KunTV.Items.BeginUpdate;
        KunTV.Items.Clear;
        if DM1.KgrTab.Active then DM1.KgrTab.Close;
        DM1.KgrTab.Open;
        DM1.KgrTab.DisableControls;
        DM1.KgrTab.First;

        tn :=ttreenode.Create (KunTV.Items);
        tn.Data :=Pointer (DM1.KgrTabGR.Value);
        root_tn :=KunTV.Items.Add (tn,DM1.KgrTabLANGBEZ.AsString);

        Kunden_SQL :=DM1.KgrTabSQL_STATEMENT.AsString;
        DM1.KgrTab.Next;

        try
         while not DM1.KgrTab.EOF do
         begin
           tn :=KunTV.Items.AddChild (root_tn, DM1.KgrTabLANGBEZ.AsString);
           tn.Data :=Pointer(DM1.KgrTabGR.AsInteger);
           DM1.KgrTab.Next;
         end;

         root_tn.Selected :=True;
         root_tn.Expand (True);
        finally
         DM1.KgrTab.EnableControls;
        end;

        // Merkmal-Nodes erzeugen

        DM1.UniQuery.Close;
        DM1.UniQuery.SQL.Text :='SELECT * FROM ADRESSEN_MERK '+
                                'ORDER BY NAME ASC';
        DM1.UniQuery.Open;
        if DM1.UniQuery.RecordCount>0 then
        begin
          KunMerkmalLB.Items.Clear;
          tn :=ttreenode.Create (KunTV.Items);
          tn.Data :=Pointer (-1);
          merkmal_tn :=KunTV.Items.Add (tn,'Merkmale');


          while not DM1.UniQuery.Eof do
          begin
             tn :=KunTV.Items.AddChild (merkmal_tn, DM1.UniQuery.FieldByName('NAME').AsString);
             tn.Data :=Pointer(DM1.UniQuery.FieldByName('MERKMAL_ID').AsInteger);

             KunMerkmalLB.Items.AddObject (tn.Text,Pointer(DM1.UniQuery.FieldByName('MERKMAL_ID').AsInteger));
             DM1.UniQuery.Next;
          end;


          ZuweisungenGB.Height :=136;
          MerkmalLab.Visible   :=True;
          KunMerkmalLB.Visible :=True;
        end
           else
        begin
          ZuweisungenGB.Height :=68;
          MerkmalLab.Visible   :=False;
          KunMerkmalLB.Visible :=False;
        end;
        DM1.UniQuery.Close;



        KunTV.Items.EndUpdate;
      except
      end;
      // Ende Warengruppen Tree-View

      dm1.GridLoadLayout (tDBGrid(ASPGrid),'ADRESSEN_ASP');
      dm1.GridLoadLayout (tDBGrid(KFZGrid),'ADRESSEN_KFZ',101);
      dm1.GridLoadLayout (tDBGrid(JournalGrid),'ADRESSEN_HISTORY_KOPF');
      dm1.GridLoadLayout (tDBGrid(JourPosGrid),'ADRESSEN_HISTORY_POS');
      dm1.GridLoadLayout (tDBGrid(KunSuchGrid),'ADRESSEN_LISTE',101);

      KunGRPan.Width :=DM1.ReadIntegerU ('','ADRESSEN_HIR_WIDTH',KunGRPan.Width);

      if DM1.ReadBooleanU ('','ADRESSEN_HIR_DOK',True) then
       begin
         AddrHirViewBtnClick(nil);
         AddrHirDockBtnClick(nil);
       end;



      Limit :=DM1.ReadIntegerU ('','ADRESSEN_TREFFER',50);
      case Limit of
                10 : N101.Checked :=True;
                50 : N501.Checked :=True;
               100 : N1001.Checked :=True;
               200 : N2001.Checked :=True;
               500 : N5001.Checked :=True;
         999999999 : alle1.Checked :=True;
      end;

      // letztes Tabsheet wiederherstellen
      i :=DM1.ReadIntegerU ('','ADRESSEN_TABSHEET',-1);

      if (i>=0)and(i<ADDR_PC.PageCount)
       then ADDR_PC.ActivePage :=ADDR_PC.Pages[i]
       else ADDR_PC.ActivePage :=Allg_TS;


      SortField :=DM1.ReadStringU  ('','ADRESSEN_SORTFELD','MATCHCODE');
      SortName  :=DM1.ReadStringU  ('','ADRESSEN_SORTNAME','MATCH');

      try
       for i:=0 to KunSuchGrid.Columns.Count-1 do
       begin
         // Laufzeitfehler!?!?!
         if KunSuchGrid.Columns[i].Title.Caption=SortName //.Field.DisplayLabel = SortName
         then KunSuchGrid.Columns[i].Title.Font.Style :=[fsBold]
           else KunSuchGrid.Columns[i].Title.Font.Style :=[];
       end;
      except
        // zur Fehlersuche und Sollte nie ausgeführt werden
        on E: Exception do
        begin
          MessageDlg('Fehler: '+E.Message,mterror,[mbok],0);
        end;
      end;

      if SuchFeldID>-1
       then SuchFeldCB.ItemIndex :=SuchFeldID
       else SuchFeldCB.ItemIndex :=DM1.ReadIntegerU ('','ADRESSEN_SUCHBEGRIFF',0);

      Addr_PCChange (Self);

      SB1.SimplePanel :=False;
      SB1.SimpleText :='';
      SB1.Invalidate;


      L :=DM1.ReadInteger ('MAIN\ADRESSEN','BLZ_LEN',-1);
      if L=-1 then
      begin L :=8; DM1.WriteInteger ('MAIN\ADRESSEN','BLZ_LEN',8); end;
      KSQueryBLZ.Size :=L;


      L :=DM1.ReadInteger ('MAIN\ADRESSEN','KTO_LEN',-1);
      if L=-1 then
      begin L :=10; DM1.WriteInteger ('MAIN\ADRESSEN','KTO_LEN',10); end;
      KSQueryKTO.Size :=L;

      KNUM1_EDI :=DM1.ReadBoolean ('MAIN\ADRESSEN','KUNNUM1_EDI',False);
      KunNum1Edit.ReadOnly :=not KNUM1_EDI;
      KunNum1Edit.Enabled  :=KNUM1_EDI;
  end;

  if DM1.VertreterTab.Active then DM1.VertreterTab.Close;
  DM1.VertreterTab.Open;



  KunTV.Color        :=DM1.C2Color;
  if not(KSQuery.State in [dsEdit, dsInsert]) then UpdateQuery;

  if ID>0 then KSQuery.Locate ('REC_ID',ID,[]);

  if Visible then
  begin
    try
      case Addr_PC.ActivePage.Tag of
         1: match.setfocus;
         2: LVersand.SetFocus;
         3: APFunktion.SetFocus;
         4: KFZGrid.SetFocus;
         //5:
         6: JournalGrid.SetFocus;
         7: KunSuchGrid.SetFocus;
      end;
    except end;
  end;
  try
     if (uebernehmen1.Visible)and(SuchBeg.CanFocus)and(KSquery.RecordCount>0)
      then SuchBeg.SetFocus;
  except end;


  Uebern :=False;
  if not (KSquery.State in [dsInsert]) then Addr_PCChange(Sender);

  AddrPanelResize(Sender);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AddrPanelResize(Sender: TObject);
begin
  if Addr_PC.Align = alNone then
  begin
       Addr_PC.Left :=0;
       Addr_PC.Top :=Panel3.Height;
       Addr_PC.width :=AddrPanel.ClientWidth;

       if SB1.Visible
        then Addr_PC.Height :=AddrPanel.ClientHeight -
                              Panel3.Height -
                              KunToolbar.Height -
                              sb1.height
        else Addr_PC.Height :=AddrPanel.ClientHeight -
                              Panel3.Height -
                              KunToolbar.Height;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.ADDR_PCChange(Sender: TObject);
begin
     try
       if (KS_DS.State=dsEdit)or(KS_DS.State=dsInsert)
        then KSQuery.Post;
     except end;

     if Addr_PC.ActivePage=Hist_TS then
     begin
        AddrTopGB.Parent :=HistTopPanel;

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

     if Addr_PC.ActivePage=KFZ_TS then
     begin
        AddrTopGB.Parent :=KFZTopPanel;

        Screen.Cursor :=crSqlWait;
        try
           KFZTab.Close;
           KFZTab.ParamByName ('ID').AsInteger :=KSQueryREC_ID.Value;
           KFZTab.Open;
        finally
           Screen.Cursor :=crDefault;
        end;
     end else if KFZTab.Active then
     begin
        KFZTab.Close;
     end;

     if Addr_PC.ActivePage=ASP_TS then
     begin
        AddrTopGB.Parent :=ASPTopPanel;

        Screen.Cursor :=crSqlWait;
        try
           APTab.Close;
           APTab.ParamByName ('ID').AsInteger :=KSQueryREC_ID.Value;
           APTab.Open;
        finally
           Screen.Cursor :=crDefault;
        end;
     end else if APTab.Active then
     begin
        if APTab.State in [dsEdit,dsInsert] then APTab.Post;
        APTab.Close;
     end;

     if Addr_PC.ActivePage=Zuweis_TS then
     begin
        AddrTopGB.Parent :=ErwTopPanel;

        Screen.Cursor :=crSqlWait;
        try
           KunLiefTab.Close;
           KunLiefTab.ParamByName ('ADDR_ID').AsInteger :=KSQueryREC_ID.Value;
           KunLiefTab.Open;
        finally
           Screen.Cursor :=crDefault;
        end;
     end else if APTab.Active then
     begin
       if KunLiefTab.State in [dsEdit,dsInsert] then KunLiefTab.Post;
       KunLiefTab.Close;
     end;

     if Addr_PC.ActivePage=Allg_TS then
       if KSQuery.Active then (KSQueryRec_ID.Value);

     if Addr_PC.ActivePage=Link_TS then
     begin
        AddrTopGB.Parent :=DateiTopPanel;
        UpdateDateien;
     end;

     SichtbareSpalten1.Enabled :=Addr_PC.ActivePage=Such_TS;
     if KSQuery.Active then // von Volker hinzugefügt
       VorgangNeu1.Enabled :=(KSQuery.RecordCount>0)and(KSQuery.State<>dsInsert);


     AllgBtn.Font.Style  :=[];
     ErwBtn.Font.Style   :=[];
     KFZBtn.Font.Style   :=[];
     HistBtn.Font.Style  :=[];
     ListeBtn.Font.Style :=[];
     LinkBtn.Font.Style  :=[];
     AspBtn.Font.Style   :=[];

     case Addr_PC.ActivePageIndex of
     0: begin AllgBtn.Font.Style  :=[fsBold];Allgemein1.Checked :=True;      end;
     1: begin ErwBtn.Font.Style   :=[fsBold];Zuweisungen1.Checked :=True;    end;
     2: begin AspBtn.Font.Style   :=[fsBold];Ansprechpartner1.Checked :=True;end;
     3: begin KFZBtn.Font.Style   :=[fsBold];Fahrzeuge1.Checked :=True;      end;
     4: begin LinkBtn.Font.Style  :=[fsBold];Dateien1.Checked :=True;        end;
     5: begin HistBtn.Font.Style  :=[fsBold];Historie1.Checked :=True;       end;
     6: begin ListeBtn.Font.Style :=[fsBold];Liste1.Checked :=True;          end;
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AdresseinZwischenablage1Click(Sender: TObject);
begin
  Clipboard.AsText :=
    KSQueryANREDE.AsString+#13#10+
    KSQueryName1.AsString+#13#10+
    KSQueryName2.AsString+#13#10+
    KSQueryName3.AsString+#13#10+
    KSQueryAbteilung.AsString+#13#10+
    KSQueryStrasse.AsString+#13#10+
    KSQueryPlz.AsString+' '+KSQueryOrt.AsString+#13#10+#13#10+
    'Tel.: '+{KSQueryVWahl.AsString+}KSQueryTele1.AsString+#13#10+
    'FAX : '+{KSQueryVWahl.AsString+}KSQueryFAX.AsString;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Adressenzusammenfassen1Click(Sender: TObject);
begin
  if (KSQuery.State in [dsEdit, dsInsert]) then KSQuery.Post;
  try
   if KSQuery.RecordCount>0 then
   begin
      if MessageDlg ('Mit dieser Funktion können Sie 2 Adressen zusammenfassen.'+#13#10+
                     'Dabei werden die Ansprechpartner der 2. Adresse der aktuellen hinzugefügt.'+#13#10+
                     'Alle Querverweise der zugefügten Adresse werden auf die aktuelle Adresse'+#13#10+
                     'abgeändert und dann die zugefügte Adresse gelöscht.'+#13#10+#13#10+
                     'Wollen Sie den Vorgang fortsetzen ?',mtconfirmation,mbyesnocancel,0)=mryes then
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
         MainForm.AddrForm.ShowModal;
         if MainForm.AddrForm.Uebern then
         begin // Adreese überbnehmen
            if MainForm.AddrForm.KSQueryRec_ID.Value<>KSQueryRec_ID.Value then
            begin
               if MessageDlg ('Adressen wirklich zusammenfassen ????',
                              mtconfirmation,mbyesnocancel,0)=mryes then
               begin
                  dm1.Transact1.AutoCommit :=False;

                  dm1.UniQuery.Close;
                  dm1.UniQuery.Sql.Clear;
                  dm1.UniQuery.Sql.Add ('UPDATE APARTNER SET ADDR_ID='+
                                        IntToStr(KSQueryRec_ID.Value)+
                                        ' WHERE ADDR_ID='+
                                        IntToStr(MainForm.AddrForm.KSQueryRec_ID.Value));
                  dm1.UniQuery.ExecSql;
                  dm1.UniQuery.Close;


                  if MainForm.AddrForm.KSQueryKRD_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_BUCHUNGEN SET GEG_KTO='+
                                          IntToStr(KSQueryKRD_NUM.Value)+
                                          ' WHERE GEG_KTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryKRD_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  if MainForm.AddrForm.KSQueryDEB_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_BUCHUNGEN SET GEG_KTO='+
                                          IntToStr(KSQueryDEB_NUM.Value)+
                                          ' WHERE GEG_KTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryDEB_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  if MainForm.AddrForm.KSQueryKRD_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_JOURNAL SET SKTO='+
                                          IntToStr(KSQueryKRD_NUM.Value)+
                                          ' WHERE SKTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryKRD_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  if MainForm.AddrForm.KSQueryDEB_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_JOURNAL SET SKTO='+
                                          IntToStr(KSQueryDEB_NUM.Value)+
                                          ' WHERE SKTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryDEB_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  if MainForm.AddrForm.KSQueryKRD_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_JOURNAL SET HKTO='+
                                          IntToStr(KSQueryKRD_NUM.Value)+
                                          ' WHERE HKTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryKRD_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  if MainForm.AddrForm.KSQueryDEB_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_JOURNAL SET HKTO='+
                                          IntToStr(KSQueryDEB_NUM.Value)+
                                          ' WHERE HKTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryDEB_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;


                  if MainForm.AddrForm.KSQueryKRD_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_KASSE SET GKONTO='+
                                          IntToStr(KSQueryKRD_NUM.Value)+
                                          ' WHERE GKONTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryKRD_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  if MainForm.AddrForm.KSQueryDEB_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE FIBU_KASSE SET GKONTO='+
                                          IntToStr(KSQueryDEB_NUM.Value)+
                                          ' WHERE GKONTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryDEB_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  dm1.UniQuery.Sql.Clear;
                  dm1.UniQuery.Sql.Add ('UPDATE JOURNAL SET ADDR_ID='+
                                        IntToStr(KSQueryRec_ID.Value)+
                                        ' WHERE ADDR_ID='+
                                        IntToStr(MainForm.AddrForm.KSQueryRec_ID.Value));
                  dm1.UniQuery.ExecSql;
                  dm1.UniQuery.Close;

                  if MainForm.AddrForm.KSQueryKRD_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE JOURNAL SET GEGENKONTO='+
                                          IntToStr(KSQueryKRD_NUM.Value)+
                                          ' WHERE GEGENKONTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryKRD_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  if MainForm.AddrForm.KSQueryDEB_NUM.Value>0 then
                  begin
                    dm1.UniQuery.Sql.Clear;
                    dm1.UniQuery.Sql.Add ('UPDATE JOURNAL SET GEGENKONTO='+
                                          IntToStr(KSQueryDEB_NUM.Value)+
                                          ' WHERE GEGENKONTO='+
                                          IntToStr(MainForm.AddrForm.KSQueryDEB_NUM.Value));
                    dm1.UniQuery.ExecSql;
                    dm1.UniQuery.Close;
                  end;

                  dm1.UniQuery.Sql.Clear;
                  dm1.UniQuery.Sql.Add ('UPDATE JOURNALPOS SET ADDR_ID='+
                                        IntToStr(KSQueryRec_ID.Value)+
                                        ' WHERE ADDR_ID='+
                                        IntToStr(MainForm.AddrForm.KSQueryRec_ID.Value));
                  dm1.UniQuery.ExecSql;
                  dm1.UniQuery.Close;

                  dm1.UniQuery.Sql.Clear;
                  dm1.UniQuery.Sql.Add ('UPDATE KFZ SET ADDR_ID='+
                                        IntToStr(KSQueryRec_ID.Value)+
                                        ' WHERE ADDR_ID='+
                                        IntToStr(MainForm.AddrForm.KSQueryRec_ID.Value));
                  dm1.UniQuery.ExecSql;
                  dm1.UniQuery.Close;

                  dm1.UniQuery.Sql.Clear;
                  dm1.UniQuery.Sql.Add ('UPDATE ADRESSEN_LIEF SET ADDR_ID='+
                                        IntToStr(KSQueryRec_ID.Value)+
                                        ' WHERE ADDR_ID='+
                                        IntToStr(MainForm.AddrForm.KSQueryRec_ID.Value));
                  dm1.UniQuery.ExecSql;
                  dm1.UniQuery.Close;


                  if not (KSQuery.State in [dsEdit, dsInsert]) then KSQuery.Edit;

                  if (MainForm.AddrForm.KSQueryDEB_NUM.Value>0) and (KSQueryDEB_NUM.Value<=0)
                   then KSQueryDEB_NUM.Value :=MainForm.AddrForm.KSQueryDEB_NUM.Value;

                  if (MainForm.AddrForm.KSQueryKRD_NUM.Value>0) and (KSQueryKRD_NUM.Value<=0)
                   then KSQueryKRD_Num.Value :=MainForm.AddrForm.KSQueryKRD_NUM.Value;

                  if (length(MainForm.AddrForm.KSQueryKUNNUM1.AsString)>0) and (length(KSQueryKUNNUM1.AsString)=0)
                   then KSQueryKUNNUM1.Value :=MainForm.AddrForm.KSQueryKUNNUM1.Value;

                  if (length(MainForm.AddrForm.KSQueryKUNNUM2.Value)>0) and (length(KSQueryKUNNUM2.Value)=0)
                   then KSQueryKUNNUM2.Value :=MainForm.AddrForm.KSQueryKUNNUM2.Value;

                  KSQueryStatus.Value :=KSQueryStatus.Value or MainForm.AddrForm.KSQueryStatus.Value;

                  KSQuery.Post;

                  dm1.UniQuery.Sql.Clear;
                  dm1.UniQuery.Sql.Add ('DELETE FROM ADRESSEN where REC_ID='+
                                        IntToStr(MainForm.AddrForm.KSQueryRec_ID.Value));
                  dm1.UniQuery.ExecSql;
                  dm1.UniQuery.Close;


                  dm1.Transact1.Commit;

                  MessageDlg ('Zusammenfassen erfolgreich abgeschlossen !',
                              mtinformation,[mbok],0);

                  FormActivate(Sender);
               end;
            end
               else
            begin
              MessageDlg ('Sie können keine Adresse sich selbst zuweisen.'+#13#10+
                          'Beide Adressen müssen unterschiedlich sein !',
                          mterror,[mbok],0);
            end;
         end;
      end;
   end;
  finally
   dm1.Transact1.AutoCommit :=True;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Aktualisieren1Click(Sender: TObject);
begin
   KSQuery.Refresh;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.alle1Click(Sender: TObject);
begin
  Limit :=tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked :=True;
  DM1.WriteIntegerU ('','ADRESSEN_TREFFER',Limit);
  UpdateQuery;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AllgBtnMouseEnter(Sender: TObject);
begin
  if (sender is tSpeedButton)and
     (tSpeedButton(Sender).Enabled) then
  begin
    tSpeedButton(Sender).Transparent :=False;
    tSpeedButton(Sender).Font.Color :=clBlack;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AllgBtnMouseLeave(Sender: TObject);
begin
  if (sender is tSpeedButton) then
  begin
    tSpeedButton(Sender).Transparent :=True;
    tSpeedButton(Sender).Font.Color :=clWhite;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AsPEMailLabClick(Sender: TObject);
var adr : string;
begin
     adr :=apemail.text;
     if adr<>'' then
     begin
        if pos ('MAILTO:',Uppercase(adr))=0 then adr :='mailto:'+adr;
        OpenObject(Adr);
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AsPEMailLab2Click(Sender: TObject);
var adr : string;
begin
     adr :=apemail2.text;
     if adr<>'' then
     begin
        if pos ('MAILTO:',Uppercase(adr))=0 then adr :='mailto:'+adr;
        OpenObject(Adr);
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.APTabBeforeDelete(DataSet: TDataSet);
begin
  IF MessageDlg ('Wollen Sie diesen Ansprechpartner wirklich löschen ?',
                 mtconfirmation,[mbyes,mbno],0)<>mryes then
  begin
    Abort;
    exit;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.APTabBeforeEdit(DataSet: TDataSet);
begin
  // Bearbeitung von Ansprechpartnern verweigern, wenn keine Adresse ausge-
  // wählt
  if KSQuery.RecordCount<1 then Abort;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.APTabBeforePost(DataSet: TDataSet);
begin
  APTab['ADDR_ID'] :=KSQueryRec_ID.AsInteger;
  if (APTab['NAME']=Null) then
  begin
       APName.SetFocus;
       Abort;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.APTabNewRecord(DataSet: TDataSet);
begin
  APTab.FieldByName ('LAND').AsString :=DM1.LandK2;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Belegbearbeiten1Click(Sender: TObject);
begin
  MainForm.JumpTo (JourTabQuelle.Value,
                   JourTabREC_ID.Value,
                   0, False);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.HistorySelCBChange(Sender: TObject);
begin
  UpdateHistory;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.JahrCBClick(Sender: TObject);
begin
  UpdateHistory;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.BlZEdiExit(Sender: TObject);
var sblz,sbank : string;
begin
  tDBEdit(sender).Color :=clWindow;
  SBLZ  := KSQueryBLZ.Value;
  SBank := KSQueryBank.Value;
  if BLZForm.GetDataIfUniqueBLZ (SBLZ,SBank) then
  begin
     KSQueryBLZ.Value   := SBLZ;
     KSQueryBank.Value  := SBank;
  end;
end;
 //------------------------------------------------------------------------------
procedure TAdressForm.Button1Click(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.CSV1Click(Sender: TObject);
begin
  SaveDialog1.InitialDir :=DM1.ExportDir;
  SaveDialog1.DefaultExt :='csv';
  SaveDialog1.Title      :='Adressen exportieren';
  SaveDialog1.Filter     :='CSV-Dateien|*.csv';
  if SaveDialog1.Execute
   then DM1.ExportDatasetToFile(SaveDialog1.FileName,KSQuery,ListSeparator,False);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Email1BtnClick(Sender: TObject);
var adr : string;
begin
  adr :=email.text;
  if adr<>'' then
  begin
     if pos ('MAILTO:',Uppercase(adr))=0 then adr :='mailto:'+adr;
     OpenObject(Adr);
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Email2BtnClick(Sender: TObject);
var adr : string;
begin
  adr :=email2.text;
  if adr<>'' then
  begin
     if pos ('MAILTO:',Uppercase(adr))=0 then adr :='mailto:'+adr;
     OpenObject(Adr);
  end;

end;
//------------------------------------------------------------------------------
procedure TAdressForm.ErweiterteSuche1Click(Sender: TObject);
var P : PChar; S : String;
begin
  // Plugin aufrufen
  // Rückgabe True wenn erfolgreich
  // in P wird dann der SQL-Suchstring zurückgegeben
  if (Assigned(CaoPluginExecCmd))and
     (CaoPluginExecCmd(ADRESS_PLUGIN,ADRESS_SUCHE_CMD,0{Rechte},P)) then
  begin
     s :=P;
     UpdateQuery (s);
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.ImportUpdate1Click(Sender: TObject);
begin
//  Application.CreateForm(TKundenImportForm,KundenImportForm);
  try
     MainForm.ZMonitor1.Active:=false; // Monitor aus !
//     KundenImportForm.ShowModal;
  finally
//     KundenImportForm.Free;
//     MainForm.ZMonitor1.Active:=true;
  end;
  if KSQuery.Active then KSQuery.Refresh;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.InternetBtnClick(Sender: TObject);
begin
  if internet.text<>'' then OpenObject(internet.text);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.JourTabAfterOpen(DataSet: TDataSet);
var w : string;
begin
  JourLastID :=JourTabRec_ID.Value;

  Update_JournalArtikel (JourTab.FieldByName ('REC_ID').AsInteger);

  jour_mwst_tab[0] :=JourTabMwst_0.Value;
  jour_mwst_tab[1] :=JourTabMwst_1.Value;
  jour_mwst_tab[2] :=JourTabMwst_2.Value;
  jour_mwst_tab[3] :=JourTabMwst_3.Value;

  w :=JourTabWAEHRUNG.Value;
  JPosTabEPREIS.DisplayFormat :=',###,##0.00 "'+w+'";-,###,##0.00 "'+w+'"; ';
end;
//------------------------------------------------------------------------------
procedure TAdressForm.JourTabCalcFields(DataSet: TDataSet);
var Quelle : String;
begin
  case JourTabquelle.Value of
     VK_AGB : begin
                Quelle:='Angebot';
                JourTabCalcStadium.Value :='-';
              end;
    VK_LIEF : begin
                Quelle:='Lieferschein';
                JourTabCalcStadium.Value :=GetLiefStatus (JourTabStadium.AsInteger,True)
              end;
    VK_RECH : begin
                Quelle:='Verkauf';
                JourTabCalcStadium.Value :=GetRechStatus (JourTabStadium.AsInteger,JourTabquelle.Value);
              end;
    VK_RECH_EDI : begin
                Quelle:='Verkauf';
                JourTabCalcStadium.Value :='unfertig';
              end;
    EK_RECH : begin
                Quelle:='Einkauf';
                JourTabCalcStadium.Value :=GetRechStatus (JourTabStadium.AsInteger,JourTabquelle.Value);
              end;
    EK_BEST : begin
                Quelle:='EK-Best.';
                JourTabCalcStadium.Value :=GetEKBestStatus (JourTabStadium.AsInteger);
              end;
    EK_BEST_EDI : begin
                Quelle:='EK-Best.';
                JourTabCalcStadium.Value :='unfertig';
              end;

       else  Quelle:='??? ['+inttostr(JourTabQuelle.Value)+']';
  end;

  JourTabCalcEKVK.Value    :=Quelle;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.JourTabDSDataChange(Sender: TObject; Field: TField);
begin
  if JourTabRec_ID.Value <> JourLastID then JourTabAfterOpen (nil);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.JPosTabCalcFields(DataSet: TDataSet);
begin
  if (JPosTabSteuer_Code.Value>=0) and
     (JPosTabSteuer_Code.Value<=3)
   then JPosTabSteuer_Proz.Value :=Jour_MwSt_Tab[JPosTabSteuer_Code.Value]
   else JPosTabSteuer_Proz.Value :=0;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.JumpMenuPopup(Sender: TObject);
begin
  Rechnungdrucken1.enabled :=
    (not UebernahmeBtn.Visible)and
    (JourTab.RecordCount>0)and
    (JourTabQUELLE.Value in [VK_RECH, VK_AGB, EK_BEST]);

  Belegbearbeiten1.Enabled :=
    (not UebernahmeBtn.Visible)and
    (JourTab.RecordCount>0)and
    (JourTabQUELLE.Value in [VK_RECH_EDI, VK_AGB_EDI,
                             EK_BEST_EDI, EK_RECH_EDI]);

  zumJournal1.Enabled :=
    (not UebernahmeBtn.Visible)and
    (JourTab.RecordCount>0)and
    (JourTabQUELLE.Value in [VK_RECH, VK_AGB, EK_BEST, EK_RECH]);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.JumpToNewVorgang(Sender: TObject);
begin
  if not (Sender is TMenuItem) then exit;
  MainForm.JumpTo (tMenuItem(Sender).Tag+10,
                   KSQueryREC_ID.Value,
                   0,
                   True);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AddrHirViewBtnClick(Sender: TObject);
begin
  if not KunGRPan.Visible then
  begin
     KunGrPan.Visible :=True;
     Splitter2.Visible :=False;
     try if assigned(Sender) then KunTV.SetFocus; except end;
  end
     else
  begin
     KunGRPan.Hide;
     Splitter2.Visible :=False;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AddrHirDockBtnClick(Sender: TObject);
begin
  if not KunGrDok then
  begin
       KunGrDok :=True;
       Splitter2.Enabled :=False;
       Splitter2.Visible :=True;
       Splitter2.Enabled :=True;
       Splitter2.Left :=KunGrPan.Width+1;
       Addr_PC.Align :=Alclient;
  end
     else
  begin
       KungrDok :=False;
       KunGrPan.Hide;
       Splitter2.Visible :=False;
       Addr_PC.Align :=alNone;
       AddrPanelResize(Sender);
  end;
  DM1.WriteBooleanU ('','ADRESSEN_HIR_DOK',KunGrDok);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.FormCreate(Sender: TObject);
var I : Integer;
    JA, MO, TA : Word;
begin
  SuchDLL           :=0;

  InUpdate          :=False;
  OnUpdateStatusBar :=nil;

  KunToolBar.Images :=MainForm.ImageList1;
  SuchBeg.Height    :=21;
  //Scaled            :=TRUE;
  LastID            :=-1;
  JourLastID        :=-1;
  JPJ_LastID        :=-1;
  Limit             :=50;
  Uebern            :=False;
  First             :=True;
  Kunden_SQL        :='';
  SuchFeldID        :=-1;
  KunGr             :=0;
  KNUM1_EDI         :=False;

  SetSOrt (1);
  JahrCB.Items.Clear;
  JahrCB.Items.Add ('alles');
  decodedate (now,ja,mo,ta);
  for i:=1993 to ja do JahrCB.Items.Add(inttostr(i));
  JahrCB.Itemindex :=Ja - 1993 +1; // aktuelles Jahr

  HistorySelCB.ItemIndex :=0; // alles
  SuchFeldCB.ItemIndex   :=0;
  AddrHirDockBtn.Align   :=alRight;
  AddrHirViewBtn.Align   :=alLeft;
  ListeBtn.Align         :=alRight;
  HistBtn.Align          :=alRight;
  KFZBtn.Align           :=alRight;
  ASPBtn.Align           :=alRight;
  ErwBtn.Align           :=alRight;
  AllgBtn.Align          :=alRight;
  LinkBtn.Align          :=alRight;
  AllgBtn.Font.Color     :=clwhite;
  ErwBtn.Font.Color      :=clwhite;
  ASPBtn.Font.Color      :=clwhite;
  KFZBtn.Font.Color      :=clwhite;
  HistBtn.Font.Color     :=clwhite;
  ListeBtn.Font.Color    :=clwhite;
  LinkBtn.Font.Color     :=clwhite;
  AllgBtn.Font.Style     :=[fsBold];
  try
     Addr_PC.ActivePage :=Addr_PC.Pages[0];
  except
  end;

  //Help-ID's
  AddrPanel.HelpContext       := 3200;
  Allg_TS.HelpContext         := 3200;
  Zuweis_TS.HelpContext       := 3250;
  ASP_TS.HelpContext          := 3300;
  KFZ_TS.HelpContext          := 3350;
  Hist_TS.HelpContext         := 3400;
  Such_TS.HelpContext         := 3450;
  Link_TS.HelpContext         := 3500;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.FormDeactivate(Sender: TObject);
begin
  if KSQuery.State in [dsEdit,dsInsert] then
  begin
     if MessageDlg ('Die aktuelle Adresse wurde verändert,'+#13#10+
                    'wollen Sie die Änderung speichern ?',mtconfirmation,[mbYes, mbNo],0) = mryes
       then KSQuery.Post
       else KSQuery.Cancel;
  end;

  DM1.WriteIntegerU ('','ADRESSEN_TABSHEET',ADDR_PC.ActivePageIndex);
  DM1.WriteStringU  ('','ADRESSEN_SORTFELD',SortField);
  DM1.WriteStringU  ('','ADRESSEN_SORTNAME',SortName);
  DM1.WriteIntegerU ('','ADRESSEN_SUCHBEGRIFF',SuchFeldCB.ItemIndex);

  if (not (AddrPanel.Parent is tForm)) and
     (AddrPanel.Parent.Parent is tForm) and
     (assigned(tForm(AddrPanel.Parent.Parent).ActiveControl))
   then tDBEdit(tForm(AddrPanel.Parent.Parent).ActiveControl).Color :=clWindow;

  if Uebern then exit;

  if KSQuery.Active    then KSQuery.Close;
  if APTab.Active      then APTab.Close;
  if JPosTab.Active    then JPosTab.Close;
  if JourTab.Active    then JourTab.Close;
  if KFZTab.Active     then KFZTab.Close;
  if KunLiefTab.Active then KunLiefTab.Close;

  if LinkForm.MainPanel.Parent = LinkPanel then
  begin
     LinkForm.MainPanel.Parent :=Twincontrol(LinkForm.MainPanel.Owner);
     LinkForm.FormDeactivate (Sender);
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.FormShow(Sender: TObject);
begin
//  MainForm.XPMenu1.InitComponent (Self);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KSQueryAfterPost(DataSet: TDataSet);
begin
  ProgressForm.Stop;

  InUpdate :=True;
  try
    ShopKundeCB.Checked :=KSQueryShop_ID.AsInteger>0;
    ShopKundeCB.Enabled :=KSQueryShop_ID.AsInteger<1;
    ShopPW.Enabled      :=KSQueryShop_ID.AsInteger>0;
    ShopPwLab.Enabled   :=KSQueryShop_ID.AsInteger>0;
    ShopDelCB.Enabled   :=KSQueryShop_ID.AsInteger>0;
  finally
    InUpdate :=False;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KSQueryAfterScroll(DataSet: TDataSet);
begin
  if (KSQuery.RecordCount=0) and
     (Addr_PC.Enabled) and
     (not (KSquery.State in [dsInsert]))
   then Addr_PC.Enabled :=False
   else
  if (KSQuery.RecordCount>0) and
     (not Addr_PC.Enabled)
   then Addr_PC.Enabled:=True;


  InUpdate :=True;
  try
    ShopKundeCB.Checked :=KSQueryShop_ID.AsInteger>0;
    ShopKundeCB.Enabled :=KSQueryShop_ID.AsInteger<1;
    ShopPW.Enabled      :=KSQueryShop_ID.AsInteger>0;
    ShopPwLab.Enabled   :=KSQueryShop_ID.AsInteger>0;
    ShopDelCB.Enabled   :=KSQueryShop_ID.AsInteger>0;
  finally
    InUpdate :=False;
  end;


  if LastID=KSQueryRec_ID.Value then exit;

  Kundennummerzuweisen1.Enabled :=(KSQuery.RecordCount>0)and
                                  (Length(KSQueryKUNNUM1.AsString)=0);

  VorgangNeu1.Enabled :=(KSQuery.RecordCount>0)and(KSQuery.State<>dsInsert);

  // Binärkodiertes Flag
  IstKundeCB.Checked  :=KSQueryStatus.Value and  1 =  1;
  KundeExpCB.Checked  :=KSQueryStatus.Value and  2 =  2;
  IstLieferCB.Checked :=KSQueryStatus.Value and 16 = 16;
  LieferExpCB.Checked :=KSQueryStatus.Value and 32 = 32;

  if Addr_PC.ActivePage=Hist_TS then
  begin
    Screen.Cursor :=crSQLWait;
    try
       UpdateHistory;
    finally
       Screen.Cursor :=crDefault;
    end;
  end;

  if Addr_PC.ActivePage=KFZ_TS then
  begin
    Screen.Cursor :=crSQLWait;
    try
       KFZTab.Close;
       KFZTab.ParamByName ('ID').AsInteger :=KSQueryREC_ID.Value;
       KFZTab.Open;
    finally
       Screen.Cursor :=crDefault;
    end;
  end;

  if Addr_PC.ActivePage=ASP_TS then
  begin
    Screen.Cursor :=crSQLWait;
    try
       APTab.Close;
       APTab.ParamByName ('ID').AsInteger :=KSQueryREC_ID.Value;
       APTab.Open;
    finally
       Screen.Cursor :=crDefault;
    end;
  end;

  if Addr_PC.ActivePage=Zuweis_TS then
  begin
    Screen.Cursor :=crSQLWait;
    try
       KunLiefTab.Close;
       KunLiefTab.ParamByName ('ADDR_ID').AsInteger :=KSQueryREC_ID.Value;
       KunLiefTab.Open;
    finally
       Screen.Cursor :=crDefault;
    end;
  end;

  if Addr_PC.ActivePage=Allg_TS then
  begin
       UpdateMekrmale (KSQueryRec_ID.Value);
  end;

  if Addr_PC.ActivePage = Link_TS then UpdateDateien;

  LastID :=KSQueryRec_ID.Value;

  UpdateStatus;
  ProgressForm.Stop;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KSQueryBeforeDelete(DataSet: TDataSet);
begin
  if (KSQuerySHOP_ID.AsInteger>0) then
  begin
       MessageDlg ('Shopkunden können nicht gelöscht werden.'+#13#10+
                   'Entfernen Sie zunächst den Kunden aus dem '+
                   'Shop und'+#13#10+'führen Sie anschließend einen '+
                   '"Shoptransfer" durch !',mterror,[mbok],0);
       Abort;
       exit;
  end;

  IF MessageDlg ('Wollen Sie diese Adresse wirklich löschen ?',
                 mtconfirmation,[mbyes,mbno],0)<>mryes then
  begin
    Abort;
    exit;
  end;

  // 1. im Journal ADDR_ID löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    sql.add ('update JOURNAL');
    sql.add ('set ADDR_ID="-1", LIEF_ADDR_ID="-1"');
    sql.Add ('Where ADDR_ID='+IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 2. Ansprechpartner löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    sql.add ('delete from APARTNER');
    sql.Add ('Where ADDR_ID='+IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 3. bei Kundenfahrzeugen die ADDR_ID löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    sql.add ('update KFZ');
    sql.add ('set ADDR_ID="-1"');
    sql.Add ('Where ADDR_ID='+IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 4. Lieferadressen löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    sql.add ('delete from ADRESSEN_LIEF');
    sql.Add ('Where ADDR_ID='+IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 5. Merkmale löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    sql.add ('delete from ADRESSEN_TO_MERK');
    sql.Add ('Where ADDR_ID='+IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KSQueryBeforeInsert(DataSet: TDataSet);
begin
  try
     if not Addr_PC.Enabled then Addr_PC.Enabled :=True;

     ADDR_PC.ActivePage :=Allg_TS;
     ADDR_PCChange (Self);
     Match.SetFocus;
  except end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.AddrTabBeforePost(DataSet: TDataSet);
begin
  if Dataset.State=dsInsert then
  begin
    KSQueryERSTELLT.AsDateTime  :=now;
    KSQueryERST_NAME.Value :=dm1.view_user;
  end;
  KSQueryGEAEND.AsDateTime      :=now;
  KSQueryGEAEND_NAME.Value :=dm1.view_User;

  if KSQueryPR_Ebene.Value=0 then KSQueryPR_Ebene.Value :=DM1.AnzPreis;
  if KSQueryWAERUNG.Value='' then KSQueryWAERUNG.Value :=dm1.Leitwaehrung;
  if KSQueryKundengruppe.Value=0 then
  begin
       If KunGR=0 then
       begin
            MessageDlg ('Bitte erst Kundengruppe zuweisen !',mterror,[mbok],0);
            Abort;
            try KunGR1.SetFocus; except end;
            Exit;
       end;
       KSQueryKundengruppe.Value :=KunGR;
  end;

  if (KSQueryName1.Value='')and(KSQueryName2.Value<>'') then
  begin
       KSQueryName1.Value :=KSQueryName2.Value;
       KSQueryName2.Value :='';
  end;

  if (KSQueryName2.Value='')and(KSQueryName3.Value<>'') then
  begin
       KSQueryName2.Value :=KSQueryName3.Value;
       KSQueryName3.Value :='';
  end;

  if (KSQueryName1.Value='')and(KSQueryName2.Value<>'') then
  begin
       KSQueryName1.Value :=KSQueryName2.Value;
       KSQueryName2.Value :='';
  end;

  if KSQuerySHOP_ID.AsInteger>0 then
  begin
     KSQuerySHOP_Change_Flag.Value :=1;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KSQueryNewRecord(DataSet: TDataSet);
begin
  KSQueryLand.Value :=DM1.LandK2;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KSQueryUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var I : Integer; First : Boolean; SQL : TStrings;
begin
  if UpdateKind in [ukModify,ukInsert] then
  begin
    // UpdateSQL bestücken
    First :=True;

    AddrUpdSQL.ModifySql.Clear;
    AddrUpdSQL.InsertSql.Clear;

    if UpdateKind =ukModify then
    begin
       SQL :=AddrUpdSQL.ModifySql;
       SQL.Add ('UPDATE ADRESSEN SET');
    end
     else
    begin
       SQL :=AddrUpdSQL.InsertSql;
       SQL.Add ('INSERT INTO ADRESSEN SET');
    end;

    for i:=0 to DataSet.FieldCount-1 do
    begin
       if (DataSet.Fields[i].CanModify) and
          (not DataSet.Fields[i].Calculated) and
          ((DataSet.Fields[i].CurValue<>DataSet.Fields[i].OldValue) or
          ((DataSet.Fields[i].IsBlob)and(tBlobField(DataSet.Fields[i]).Modified))or
          ((UpdateKind=ukInsert)and(DataSet.Fields[i].FieldName<>'REC_ID'))
          ) then
       begin
         if First then First :=False else SQL.Add (', ');

         SQL.Add (DataSet.Fields[i].FieldName+' =:'+
                  DataSet.Fields[i].FieldName);
       end;
    end;
    if UpdateKind =ukModify then SQL.Add ('where REC_ID=:REC_ID');

    if First then
    begin
       Sql.Clear;
       UpdateAction :=uaAbort;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KS_DSDataChange(Sender: TObject; Field: TField);
begin
  if KSQueryRec_ID.Value <> LastID then KSQueryAfterScroll (nil);
  VorgangNeu1.Enabled :=(KSQuery.RecordCount>0)and(KSQuery.State<>dsInsert);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Kundennummerzuweisen1Click(Sender: TObject);
begin
  if KSQuery.RecordCount>0 then
  begin
     if length(KSQueryKUNNUM1.AsString)=0 then
     begin
       if not (KSQuery.State in [dsInsert, dsedit]) then KSQuery.Edit;
       try
          KSQueryKUNNUM1.AsString :=DM1.IncNummerStr (KUNNUM_KEY);
          try
             KSQueryDEB_NUM.AsInteger :=DM1.IncNummer (DEB_NUM_KEY);//StrToInt(KSQueryKUNNUM1.AsString)+DEBI_KTOBASIS;
          except end;

          KSQuery.Post;

          Kundennummerzuweisen1.Enabled :=False;

       except
          KSQuery.Cancel;
       end;
     end;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunLiefDelBtnClick(Sender: TObject);
begin
  if MessageDlg ('Wollen Sie diese Lieferanschrift wirklich löschen ?',
                  mtconfirmation, [mbyes,mbno],0)=mryes then
  begin
     // 1. im Journal LIEF_ADDR_ID löschen
     with dm1.UniQuery do
     begin
        sql.clear;
        sql.add ('update JOURNAL');
        sql.add ('set LIEF_ADDR_ID="-1"');
        sql.Add ('Where LIEF_ADDR_ID='+IntToStr(KunLiefTabRec_ID.Value));
        sql.Add ('and QUELLE != 6 and QUELLE != 16');
        execsql;
     end;
     KunLiefTab.Delete;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.BitBtn1Click(Sender: TObject);
begin
  if (KSQuery.RecordCount>0)and(KSqueryRec_ID.AsInteger>0)
   then AdressenLiefForm.Edit (KSqueryRec_ID.AsInteger);

  KunLiefTab.Refresh;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunLiefStdBtnClick(Sender: TObject);
begin
  if not (KSQuery.State in [dsEdit,dsInsert]) then KSQuery.Edit;
  KSQueryDEFAULT_LIEFANSCHRIFT_ID.AsInteger :=KunLiefTabREC_ID.AsInteger;
  KSQuery.Post;
  KunLiefTab.Refresh;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunLiefTabAfterScroll(DataSet: TDataSet);
begin
  KunLiefDelBtn.Enabled :=(KSQuery.RecordCount>0)and
                          (KSqueryRec_ID.AsInteger>0)and
                          (KunLiefTab.RecordCount>0);
  KunLiefStdBtn.Enabled :=(KunLiefDelBtn.Enabled) and
                          (KunLiefTabREC_ID.AsInteger<>
                           KSQueryDEFAULT_LIEFANSCHRIFT_ID.AsInteger);
  ProgressForm.Stop;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunMerkmalLBClickCheck(Sender: TObject);
begin
  if KsQueryRec_ID.AsInteger<1 then exit;

  if KunMerkmalLB.Itemindex>-1 then
  begin
     if KunMerkmalLB.Checked[KunMerkmalLB.ItemIndex] then
     begin
       DM1.Uniquery.Close;
       DM1.UniQuery.Sql.Text :='INSERT INTO ADRESSEN_TO_MERK '+
                               'SET MERKMAL_ID='+Inttostr(Integer(KunMerkmalLB.Items.Objects[KunMerkmalLB.ItemIndex]))+
                               ', ADDR_ID='+IntToStr(KsQueryRec_ID.AsInteger);
       DM1.UniQuery.ExecSql;
     end
        else
     begin
       DM1.Uniquery.Close;
       DM1.UniQuery.Sql.Text :='DELETE FROM ADRESSEN_TO_MERK '+
                               'WHERE MERKMAL_ID='+Inttostr(Integer(KunMerkmalLB.Items.Objects[KunMerkmalLB.ItemIndex]))+
                               ' AND ADDR_ID='+IntToStr(KsQueryRec_ID.AsInteger);
       DM1.UniQuery.ExecSql;
     end;
     Progressform.Stop;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunSuchGridDblClick(Sender: TObject);
begin
  ADDR_PC.ActivePage :=Allg_TS;
  ADDR_PCChange(Sender);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunSuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var I : Integer;
begin
  if SortField <>Field.FieldName then
   begin
      SortName  :=Field.DisplayLabel;
      SortField :=Field.FieldName;
      UpdateQuery;
   end
      else
   begin
      SortField :=SortField + ' DESC';
      SortName  :=Field.DisplayLabel;
      UpdateQuery;
   end;

   for i:=0 to KunSuchGrid.Columns.Count-1 do
   begin
     if KunSuchGrid.Columns[i].Field.DisplayLabel = SortName
      then KunSuchGrid.Columns[i].Title.Font.Style :=[fsBold]
      else KunSuchGrid.Columns[i].Title.Font.Style :=[];
   end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunTVChange(Sender: TObject; Node: TTreeNode);
var Last : String;
begin
  if (assigned(Node.Parent))and(Node.Parent.Text='Merkmale') then
  begin
    Last :=Kunden_SQL;
    Kunden_SQL :='inner join ADRESSEN_TO_MERK ATM on ATM.MERKMAL_ID = '+
                 IntToStr(Integer(Node.Data))+
                 ' and ADRESSEN.REC_ID = ATM.ADDR_ID';
    if Last <> Kunden_SQL then UpdateQuery;
  end
     else
  begin
    Last :=Kunden_SQL;
    KunGr :=Integer(Node.Data);
    if not DM1.KgrTab.Active then DM1.KgrTab.Open;
    if DM1.KgrTab.Locate ('GR',variant (KunGr),[])
     then Kunden_SQL :=DM1.KgrTabSQL_STATEMENT.AsString
     else Kunden_SQL :='';
    if Last <> Kunden_SQL then UpdateQuery;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunTVExit(Sender: TObject);
begin
  if not KunGrDok then begin KunGrPan.Hide; Splitter2.Visible :=False; end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Layoutspeichern1Click(Sender: TObject);
begin
  DM1.GridSaveLayout (tDBGrid(ASPGrid),'ADRESSEN_ASP');
  DM1.GridSaveLayout (tDBGrid(KFZGrid),'ADRESSEN_KFZ',101);
  DM1.GridSaveLayout (tDBGrid(JournalGrid),'ADRESSEN_HISTORY_KOPF');
  DM1.GridSaveLayout (tDBGrid(JourPosGrid),'ADRESSEN_HISTORY_POS');
  DM1.GridSaveLayout (tDBGrid(KunSuchGrid),'ADRESSEN_LISTE',101);
  DM1.WriteIntegerU ('','ADRESSEN_HIR_WIDTH',KunGRPan.Width);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.ListeBtnClick(Sender: TObject);
var LastPage : tTabsheet;
begin
  LastPage :=Addr_PC.ActivePage;
  if KSQuery.State in [dsInsert] then
  begin
    //MessageDlg ('Bitte erst den Datensatz speichern !',mtinformation,[mbok],0);
    KSQuery.Post;
    if KSQuery.State in [dsEdit, dsInsert] then exit;
  end;

  if (Sender is tMenuItem)
   then Addr_PC.ActivePage :=Addr_PC.Pages[tMenuitem(sender).Tag-1]
   else Addr_PC.ActivePage :=Addr_PC.Pages[tSpeedButton(sender).Tag-1];

  Addr_PCChange (Sender);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Loeschen1Click(Sender: TObject);
begin
  KSQuery.Delete;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.matchEnter(Sender: TObject);
begin
  tDBEdit(sender).Color :=DM1.EditColor; // $009FFF9F;

  if Uppercase (tWinControl(Sender).Name)='SHOPPW'
   then Shoppw.PasswordChar :=#0;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.matchExit(Sender: TObject);
var SLand, SOrt, SPlz, SVWahl : string;
begin
  tDBEdit(sender).Color :=clWindow;
  if (Sender is tDBComboBox)and(tDBComboBox(Sender).Name='PLZ') and
     (
      (KSQuery.State in [dsInsert])or
      ((KSQuery.State in [dsEdit])and(length(KSQueryORT.AsString)=0))
     ) then
  begin
     SLand  :=Land.Text;
     SPLZ   :=PLZ.Text;
     SOrt   :=Ort.Text;
     SVWahl :='';//VWAHL.Text;

     if PLZForm.GetDataIfUniquePLZ (SLAND,SPLZ,SORT,SVWAHL) then
     begin
        KSQueryLand.Value  :=SLand;
        KSQueryPLZ.Value   :=SPLZ;
        KSQueryOrt.Value   :=SORT;

        if length(KSQueryTELE1.AsString)=0 then KSQueryTELE1.AsString :=SVWahl;
        //if length(KSQueryTELE2.AsString)=0 then KSQueryTELE2.AsString :=SVWahl;
        if length(KSQueryFAX.AsString)  =0 then KSQueryFAX.AsString :=SVWahl;
        //KSQueryVWAHL.Value :=SVWAHL;
     end;
  end
     else

  if (Sender is tDBComboBox)and(tDBComboBox(Sender).Name='APPLZ')and
     (APTab.State in [dsInsert]) then
  begin
     SLAND  :=APLand.Text;
     SPLZ   :=APPLZ.Text;
     SORT   :=APOrt.Text;
     SVWAHL :='';

     if PLZForm.GetDataIfUniquePLZ (SLAND,SPLZ,SORT,SVWAHL) then
     begin
        APTab.FieldByName('Land').AsString :=SLand;
        APTab.FieldByName('PLZ').AsString  :=SPLZ;
        APTab.FieldByName('ORT').AsString  :=SORT;
     end;
  end;
  if Uppercase (tWinControl(Sender).Name)='SHOPPW'
   then Shoppw.PasswordChar :='*';
end;
//------------------------------------------------------------------------------
procedure TAdressForm.matchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift=[]) and (key=33) then // PGUP
  begin
       KSQuery.Prior;
       key :=0;
  end else
  if (Shift=[]) and (key=34) then // PGDOWN
  begin
       KSQuery.Next;
       key :=0;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.matchKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
  begin
       key :=#0;
       if uppercase(tControl(Sender).Name)='KUNZAHLARTCB' then Match.SetFocus else
       if uppercase(tControl(Sender).Name)='HATLIEFANSRCB' then LVersand.SetFocus else
       if uppercase(tControl(Sender).Name)='APINFO' then APTelefon.SetFocus else
       if uppercase(tControl(Sender).Name)='APGEBDATUM' then APFunktion.SetFocus
       else if AddrPanel.Parent is tForm
              then SendMessage (AddrPanel.Parent.Handle,WM_NEXTDLGCTL,0,0)
              else SendMessage (AddrPanel.Parent.Parent.Handle,WM_NEXTDLGCTL,0,0)
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Neu1Click(Sender: TObject);
begin
  KSQuery.Append;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.PLZButtonClick(Sender: TObject);
var sland,splz,sort,svwahl : string;
begin
  if not KSQuery.Active then exit;
  SLAND  :=Land.Text;//KSQueryLand.Value;
  SPLZ   :=PLZ.Text;//KSQueryPLZ.Value;
  SORT   :=Ort.Text;//KSQueryOrt.Value;
  //SVWAHL :=VWahl.Text;//KSQueryVWAHL.Value;
  if PLZForm.Get(tControl(Sender).Tag,SLAND,SPLZ,SORT,SVWAHL) then
  begin
    if not (KSQuery.State in [dsEdit,dsInsert]) then KSQuery.Edit;

    KSQueryLand.Value  :=SLand;
    KSQueryPLZ.Value   :=SPLZ;
    KSQueryOrt.Value   :=SORT;

    if length(KSQueryTELE1.AsString)=0 then KSQueryTELE1.AsString :=SVWahl;
    if length(KSQueryTELE2.AsString)=0 then KSQueryTELE2.AsString :=SVWahl;
    if length(KSQueryFAX.AsString)  =0 then KSQueryFAX.AsString :=SVWahl;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Rechnungdrucken1Click(Sender: TObject);
begin
  {$IFDEF REPORTBUILDER}
  PrintRechForm.ShowBelegDlg (JourTabQuelle.Value,JourTabRec_ID.AsInteger,False);
  {$ELSE}
  MessageDlg ('Der Code zum drucken der Rechnung'+#13#10+
              'ist in die GNU-Version noch nicht implementiert !',
              mterror,[mbok],0);
  {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TAdressForm.APPLZButtonClick(Sender: TObject);
var sland,splz,sort,svwahl : string;
begin
  if not APTab.Active then exit;
  SLAND  :=APTab.FieldByName('LAND').AsString;
  SPLZ   :=APTab.FieldByName('PLZ').AsString;
  SORT   :=APTab.FieldByName('ORT').AsString;
  SVWAHL :='';
  if PLZForm.Get(tControl(Sender).Tag,SLAND,SPLZ,SORT,SVWAHL) then
  begin
    if not (APTab.State in [dsEdit,dsInsert]) then APTab.Edit;

    APTab.FieldByName('LAND').AsString  :=SLand;
    APTab.FieldByName('PLZ').AsString   :=SPLZ;
    APTab.FieldByName('ORT').AsString  :=SORT;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.SearchTimerTimer(Sender: TObject);
begin
  if SuchBeg.Text = '%' then exit;
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
//------------------------------------------------------------------------------
procedure TAdressForm.ShopKundeCBClick(Sender: TObject);
begin
  if (not ShopKundeCB.Focused)or(InUpdate) then exit;

  if not (KSQuery.State in [dsEdit,dsInsert]) then KSQuery.Edit;

  if ShopKundeCB.Checked
   then KSQueryShop_ID.AsInteger :=1
   else KSQueryShop_ID.AsInteger :=-1;

  ShopPW.Enabled    :=KSQueryShop_ID.AsInteger>0;
  ShopPwLab.Enabled :=KSQueryShop_ID.AsInteger>0;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(KunSuchGrid));
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Sort1Click(Sender: TObject);
begin
  if (tmenuitem (sender).tag>0)and(tmenuitem (sender).tag<6) then
  begin
    tmenuitem (sender).checked :=not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.SuchBegChange(Sender: TObject);
begin
  searchtime :=15;
  searchtimer.enabled :=true;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.SuchBegKeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then
  begin
     Key :=#0;
     try
        if Addr_PC.ActivePage=Allg_TS then Match.SetFocus else
        if Addr_PC.ActivePage=Such_TS then KunSuchGrid.SetFocus;
     except end;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Suchen1Click(Sender: TObject);
begin
  try
     SuchBeg.SetFocus;
  except end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.tele1ButtonClick(Sender: TObject);
var TNum : String;
    lResult     : longint;
    PhoneNumber : array [0..255] of char;
    Called      : array [0..255] of char;
    Comment     : array [0..255] of char;
    App         : array [0..255] of char;
begin
  if Sender is tDBComboBox then
  begin
    TNum :=tDBComboBox(Sender).Text;
    if length(TNum)=0 then exit;
    StrPCopy(PhoneNumber,TNum);
    StrPCopy(Called,'');
    StrPCopy(Comment,'');
    StrPCopy(App,Application.Title);
    lResult:=tapiRequestMakeCall (PhoneNumber, App, Called, Comment);
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.UebernahmeBtnClick(Sender: TObject);
begin
  if not uebernehmen1.Visible then exit;
  if KSQuery.State in [dsEdit,dsInsert] then KSQuery.Post;
  Uebern :=True;
  Close;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.zumJournal1Click(Sender: TObject);
var JA, Mo, TA : Word;
begin
  DecodeDate (JourTabRDatum.AsDateTime,Ja,Mo,Ta);
  MainForm.JumpTo (JourTabQuelle.Value,
                   JourTabREC_ID.Value,
                   Ja,//JourTabJahr.AsInteger,
                   False);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.SetSort (Sort : Integer);
var I : Integer;
begin
     if sort<0 then sort :=aktsort;
     if sort=aktsort then exit;
     case sort of
{mach}     1:begin sortname :='Suchbegriff'; SortField :='MATCHCODE';     end;
{name}     2:begin sortname :='Name1';        SortField :='NAME1,NAME2';   end;
{plz}      3:begin sortname :='Plz/Ort';     SortField :='PLZ,ORT,NAME1'; end;
{KNUM1}    4:begin sortname :='Kundennr.';   SortField :='KUNNUM1';       end;
{KNUM2}    5:begin sortname :='Lief.-Nr.';   SortField :='KUNNUM2';       end;
     end;

     AktSort :=Sort;
     if first then exit;

     UpdateQuery;
     UpdateStatus;

     for i:=0 to KunSuchGrid.Columns.Count-1 do
     begin
       if KunSuchGrid.Columns[i].Title.Caption = SortName
        then KunSuchGrid.Columns[i].Title.Font.Style :=[fsBold]
        else KunSuchGrid.Columns[i].Title.Font.Style :=[];
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.UpdateQuery (ExtSearchSQL : String='');
var LastTime : DWord;
begin
     LastTime :=GetTickCount64;
     KSQuery.Close;
     KSQuery.SQL.Clear;

     KSQuery.SQL.Add ('select ADRESSEN.* ');
     KSQuery.SQL.Add ('FROM ADRESSEN');

     if (SuchBegr <> '')and(SuchFeldCB.ItemIndex=7)
      then KSQuery.SQL.Add (', APARTNER');

     if (Pos('INNER JOIN',uppercase(Kunden_SQL))>0)or
        (Pos('WHERE',uppercase(Kunden_SQL))>0)
      then KSQuery.SQL.Add (Kunden_SQL);

     if (SuchBegr <> '') or
        (ExtSearchSQL <> '') or
        ((Kunden_SQL <> '')and
         (Pos('INNER JOIN',uppercase(Kunden_SQL))=0)
        ) then
     begin
        if Pos('WHERE',UpperCase(Kunden_SQL))=0
         then KSQuery.SQL.Add ('WHERE')
         else
           if (SuchBegr <> '')or(ExtSearchSQL <> '')
            then KSQuery.SQL.Add ('AND ');
     end;

     if length (ExtSearchSQL)>0 then
     begin
       KSQuery.SQL.Add ('('+ExtSearchSQL+') ');
       SuchBegr :='';
       if (Kunden_SQL <> '')and
          (Pos('INNER JOIN',uppercase(Kunden_SQL))=0)and
          (Pos('WHERE',uppercase(Kunden_SQL))=0)
        then KSQuery.SQL.Add ('and ');
     end;

     if SuchBegr <> '' then
     begin
        case SuchFeldCB.ItemIndex of
            1:   begin // Match
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['MATCHCODE'],SuchBegr)+')');
                 end;
            2:   begin // Info
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['INFO'],SuchBegr)+')');
                 end;
            3:   begin // Kundennr.
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['KUNNUM1','KUNNUM2'],SuchBegr)+')');
                 end;
            4:   begin // Ort
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['ORT'],SuchBegr)+')');
                 end;
            5:   begin // Straße
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['STRASSE'],SuchBegr)+')');
                 end;
            6:   begin // Selektion.
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['GRUPPE'],SuchBegr)+')');
                 end;
            7:   begin // Ansprechpartner
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['APARTNER.NAME','APARTNER.VORNAME'],SuchBegr)+')');
                   KSQuery.SQL.Add ('and ADRESSEN.REC_ID = APARTNER.ADDR_ID');
                 end;
            else begin
                   KSQuery.SQL.Add ('('+DM1.GetSearchSQL (['ANREDE','NAME1','NAME2','NAME3','ABTEILUNG'],SuchBegr)+')');
                 end;
        end;
        if (Kunden_SQL <> '') and
           (Pos('INNER JOIN',Uppercase(Kunden_SQL))=0) and
           (Pos('WHERE',Uppercase(Kunden_SQL))=0)
         then KSQuery.SQL.Add (' and ');
     end;
     if (Kunden_SQL <> '')  and
        (Pos('INNER JOIN',Uppercase(Kunden_SQL))=0) and
        (Pos('WHERE',Uppercase(Kunden_SQL))=0)
      then KSQuery.SQL.Add (Kunden_SQL);

     KSQuery.SQL.Add ('ORDER BY '+SortField);
     KSQuery.SQL.Add ('LIMIT 0,'+Inttostr(Limit));
     Screen.Cursor :=crSQLWait;
     try
        KSQuery.Open;
     finally
        Screen.Cursor :=crDefault;
     end;

     querytime :=GetTickCount64-LastTime;
     UpdateStatus;

     if (KSQuery.RecordCount=0) and
        (Addr_PC.Enabled)
      then Addr_PC.Enabled :=False
      else
     if (KSQuery.RecordCount>0) and
        (not Addr_PC.Enabled)
      then Addr_PC.Enabled:=True;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.UpdateHistory;
var VJahr, BJahr : Integer;
    OPSUM,BEZSUM : Double;
    Quelle       : Integer;
    VS, BS, I    : Integer;

begin
   screen.cursor :=crsqlwait;

   JourPosGrid.Visible :=ArtikelViewBtn.Down;
   Splitter1.Visible :=ArtikelViewBtn.Down;
   if ArtikelViewBtn.Down then Splitter1.Top :=JourPosGrid.Top-1;
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

    case HistorySelCB.ItemIndex of
         0: begin Quelle := 0; VS := 0; BS :=110; end; // Alles
         1: begin Quelle := VK_RECH; VS :=20; BS := 99; end; // Rechnungen
         2: begin Quelle := VK_RECH; VS :=20; BS := 79; end; // off. Rechnungen
         3: begin Quelle := VK_RECH_EDI; VS :=0;  BS :=  0; vjahr :=0; bjahr :=0; end; // EDI-Rechnungen
         4: begin Quelle := VK_LIEF; VS :=0;  BS :=100; end; // Lieferscheine
         5: begin Quelle := VK_AGB;  VS :=0;  BS :=100; end; // Angebote
         6: begin Quelle := EK_RECH; VS :=20; BS := 99; end; // Einkäufe
         7: begin Quelle := EK_RECH; VS :=20; BS := 79; end; // off. Einkäufe
         8: begin Quelle := EK_BEST; VS :=20; BS :=100; end; // EK-Bestellungen
         9: begin Quelle := EK_BEST; VS :=20; BS := 79; end; // off. EK-Bestellungen
        10: begin Quelle := EK_BEST_EDI; VS :=0;  BS :=  0; vjahr :=0; bjahr :=0; end; // EDI-EK-Bestellungen
    end; //case

    if Quelle>11 then JourTabVRENUM.DisplayFormat :='"EDI-"0'
                 else JourTabVRENUM.DisplayFormat :='';

    if JournalGrid.Columns.Count>0 then
    begin
      For i:=0 to JournalGrid.Columns.Count-1 do
      begin
        if (Quelle=VK_LIEF)and
           (uppercase(JournalGrid.Columns[i].FieldName)='RDATUM')
         then JournalGrid.Columns[i].FieldName:='LDATUM'
         else
        if (HistorySelCB.ItemIndex<>4)and
           (uppercase(JournalGrid.Columns[i].FieldName)='LDATUM')
         then JournalGrid.Columns[i].FieldName:='RDATUM';

        if (QUELLE=VK_LIEF)and
           (uppercase(JournalGrid.Columns[i].FieldName)='VRENUM')
         then JournalGrid.Columns[i].FieldName:='VLSNUM'
         else
        if (HistorySelCB.ItemIndex<>4)and
           (uppercase(JournalGrid.Columns[i].FieldName)='VLSNUM')
         then JournalGrid.Columns[i].FieldName:='VRENUM';
      end;
    end;

    JourTab.Sql.Clear;
    JourTab.Sql.Add ('select REC_ID,QUELLE,VRENUM,VLSNUM,RDATUM,LDATUM,KUN_NAME1,');
    JourTab.Sql.Add ('ADDR_ID,KFZ_ID,KM_STAND,NSUMME,MSUMME,BSUMME,');
    JourTab.Sql.Add ('IST_BETRAG,STADIUM,PROJEKT,ORGNUM,WAEHRUNG,');
    JourTab.Sql.Add ('MWST_0,MWST_1,MWST_2,MWST_3');
    JourTab.Sql.Add ('from JOURNAL');

    JourTab.Sql.Add ('where ADDR_ID=' +inttostr(KSQueryRec_ID.Value));

    if Quelle<10 then
    begin
       if Quelle=VK_LIEF then
       begin
          JourTab.Sql.Add (' and YEAR(LDATUM) BETWEEN '+inttostr(vjahr)+
                           ' and '+inttostr(bjahr));
       end
          else
       begin
          JourTab.Sql.Add (' and YEAR(RDATUM) BETWEEN '+inttostr(vjahr)+
                           ' and '+inttostr(bjahr));
       end;
    end;
    if HistorySelCB.ItemIndex=0
     then JourTab.Sql.Add (' and QUELLE in (1,3,5)')
     else JourTab.Sql.Add (' and QUELLE='+IntToStr(Quelle));

    if Quelle<10
     then JourTab.Sql.Add ('and STADIUM BETWEEN '+Inttostr(VS)+
                           ' and '+Inttostr(BS));

    if not JourTab.Active then JourTab.Open;

    if SumQuery.Active then SumQuery.Close;

    if HistorySelCB.ItemIndex>0 then
    begin
      SumQuery.Sql.Clear;
      SumQuery.Sql.Add ('select STADIUM,SUM(NSUMME) AS NSUM,SUM(MSUMME) AS MSUM,'+
                        'SUM(BSUMME) AS BSUM, WAEHRUNG');
      SumQuery.Sql.Add ('from JOURNAL');
      SumQuery.Sql.Add ('where ADDR_ID = ' +inttostr (KSQueryRec_ID.Value));
      SumQuery.Sql.Add ('and YEAR(RDATUM) BETWEEN '+inttostr (vjahr)+
                        ' and '+inttostr (bjahr));
      //SumQuery.Sql.Add ('and (QUELLE=3 or QUELLE=5)');
      SumQuery.Sql.Add (' and QUELLE='+IntToStr(Quelle));
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

      //if opos then
      if (VS=20) and (BS=79) and (quelle in [VK_RECH,EK_RECH]) then
      begin
           HistArtikelSB.Panels[0].Text :='Summe d. off. Posten : ';
           HistArtikelSB.Panels[1].Text :=FormatFloat (',##0.00',OPSUM)+' '+dm1.Leitwaehrung;
           HistArtikelSB.Panels[2].Text :='alle Preise BRUTTO !!!';
           HistArtikelSB.Visible :=true;
           if JourPosGrid.Visible
            then HistArtikelSB.Top :=JourPosGrid.Top + JourPosGrid.Height + 1;
      end else
      if (quelle in [VK_RECH,EK_RECH]) then
      begin
           HistSumBar.Panels[1].Text :=FormatFloat (',##0.00',OPSUM)       +' '+dm1.Leitwaehrung;
           HistSumBar.Panels[3].Text :=FormatFloat (',##0.00',BEZSUM)      +' '+dm1.Leitwaehrung;
           HistSumBar.Panels[5].Text :=FormatFloat (',##0.00',OPSUM+BEZSUM)+' '+dm1.Leitwaehrung;
           HistSumBar.Panels[6].Text :='alle Preise BRUTTO !!!';
           HistSumBar.Visible :=True;

           if JourPosGrid.Visible
            then HistSumBar.Top :=JourPosGrid.Top + JourPosGrid.Height + 1;
      end
         else
      begin
           HistSumBar.Visible    :=False;
           HistArtikelSB.Visible :=False;
      end;
    end
       else
    begin
         HistSumBar.Visible    :=False;
         HistArtikelSB.Visible :=False;
    end;

    Update_JournalArtikel (JourTab.FieldByName ('REC_ID').AsInteger);

    //if DM1.JPosTab.Active then DM1.JPosTab.Close;
    //if DM1.JourTab.Active then DM1.JourTab.Close;

   finally
    screen.cursor :=crdefault;
   end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.Update_JournalArtikel (JOUR_ID : Integer);
begin
    if ArtikelViewBtn.Down then
    begin
      if Jour_ID = JPJ_LastID then exit; // Wenn ID gleich, dann nicht aktualisieren
      JPJ_LastID :=Jour_ID; // JournalPosJournal_ID merken

      if JPosTab.Active then JPosTab.Close;

      if JOUR_ID < 1 then exit;

      JPosTab.Sql.Clear;
      JPosTab.Sql.Add ('select JOURNAL_ID,QUELLE,ARTIKEL_ID,ADDR_ID,VRENUM,');
      JPosTab.Sql.Add ('BEZEICHNUNG,MATCHCODE,ARTNUM,BARCODE,MENGE,');
      JPosTab.Sql.Add ('EPREIS,RABATT,STEUER_CODE,ARTIKELTYP');
      JPosTab.Sql.Add ('from JOURNALPOS');
      JPosTab.Sql.Add ('where JOURNAL_ID = '+inttostr(JOUR_ID));
      JPosTab.Sql.Add ('order by POSITION, ARTIKELTYP');

      if not JPosTab.Active then JPosTab.Open;
    end

    else if JPosTab.Active then JPosTab.Close;
end;
//------------------------------------------------------------------------------
procedure tAdressForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert : String;
begin
     if KSQuery.RecordCount=0 then Datensatz :='keine'
     else if KSQuery.RecordCount=Limit then Datensatz :=inttostr (KSQuery.RecNo)+' von >='+inttostr (KSQuery.RecordCount)
     else Datensatz :=inttostr (KSQuery.RecNo)+' von '+inttostr (KSQuery.RecordCount);

     Sortierung :='Sortierung : '+sortname;

     if (ksquery.active)and(ksquery.recordcount>0) then
     begin
          Erstellt  :='Erstellt:'+formatdatetime ('dd.mm.yyyy',KSQueryErstellt.AsDateTime);
          if KSQueryGeaend.AsDateTime>1
           then Geaendert :='Geändert:'+
                            formatdatetime ('dd.mm.yyyy',KSQueryGeaend.AsDateTime)
           else Geaendert :='-';
     end
        else
     begin
          Erstellt  :='';
          Geaendert :='';
     end;

     SuchZeit :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';

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
procedure TAdressForm.UpdateMekrmale (ID : Integer);
var i : integer;
begin
     KunMerkmalLB.Enabled :=ID>0;

     if (not MerkmalTab.Active) or (MerkmalTab.ParamByName('ID').AsInteger<>ID) then
     begin
        MerkmalTab.Close;
        MerkmalTab.ParamByName('ID').AsInteger:=ID;
        MerkmalTab.Open;

        KunMerkmalLB.Items.BeginUpdate;
        try
          KunMerkmalLB.Items.Clear;
          while not MerkmalTab.Eof do
          begin
             i:=KunMerkmalLB.Items.AddObject (MerkmalTabNAME.AsString,
                                              Pointer
                                               (MerkmalTabMERKMAL_ID.AsInteger)
                                             );

             KunMerkmalLB.Checked[i] :=MerkmalTabFLAG.AsInteger=1;
             MerkmalTab.Next;
          end;
        finally
          KunMerkmalLB.Items.EndUpdate;
        end;
        {
        if KunMerkmalLB.Items.Count>0 then
        begin


          for i:=0 to KunMerkmalLB.Items.Count-1 do
          begin
            KunMerkmalLB.Checked[i] :=
               MerkmalTab.Locate ('MERKMAL_ID',
                                  Integer(KunMerkmalLB.Items.Objects[i]),[]);
          end;
        end;
        }
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x:= 618;
    ptMaxTrackSize.x:= screen.width;
    ptMinTrackSize.y:= 575;
    ptMaxTrackSize.y:= screen.height;
  end;
end;
//------------------------------------------------------------------------------
procedure TAdressForm.UpdateDateien;
begin
     if LinkForm.MainPanel.Parent <> LinkPanel
       then LinkForm.MainPanel.Parent :=LinkPanel;

     LinkForm.SetModul (MOD_ADRESSEN,KSQueryRec_ID.AsInteger, Link_TS);
end;
//------------------------------------------------------------------------------
procedure TAdressForm.KunLiefAddrGridApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
     if (KunLiefTabREC_ID.AsInteger=
         KSQueryDEFAULT_LIEFANSCHRIFT_ID.AsInteger)
      then Canvas.Font.Style :=[fsBold];
end;
//------------------------------------------------------------------------------
procedure TAdressForm.SearchKunnum (SearchNum : String; Modal : Boolean);
var LastSuchFeldID : Integer;
begin
     if length(SearchNum)>0 then
     begin
        LastSuchFeldID :=SuchFeldCB.ItemIndex;
        SuchFeldID :=3;
        SuchFeldCB.ItemIndex :=SuchFeldID; // Suche nach Kundennummer
        SuchBeg.Text :=SearchNum;
        SuchbegChange (Self);
        searchtime :=1;
        searchtimer.enabled :=true;
     end
     else LastSuchFeldID :=-1;
     if Modal then
     begin
        ShowModal;
        if LastSuchFeldID>-1 then
        begin
          SuchBeg.Text :='';
          SuchFeldCB.ItemIndex :=LastSuchFeldID;
          DM1.WriteIntegerU ('','ADRESSEN_SUCHBEGRIFF',LastSuchFeldID);
        end;
     end;
end;
//------------------------------------------------------------------------------

end.

