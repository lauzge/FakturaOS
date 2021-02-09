{
-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_ShopTrans;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, Buttons, Spin, Menus, DBGrids, rxmemds, RxDBGrid, IdHTTP,
  ZDataset, ZAbstractRODataset, cao_var_const, ActiveX, MSXML2_TLB;

type tShopTyp = (stOSC, stXTC);

type

  { TShopTransForm }

  TShopTransForm = class(TForm)
    ArtRefreshBtn: TBitBtn;
    AlleBestImportBtn: TBitBtn;
    ArtTabARTIKELTYP: TZRawStringField;
    ArtTabARTNUM: TZRawStringField;
    ArtTabAUFW_KTO: TZIntegerField;
    ArtTabERLOES_KTO: TZIntegerField;
    ArtTabERSTELLT: TZDateField;
    ArtTabERST_NAME: TZRawStringField;
    ArtTabGEWICHT: TZDoubleField;
    ArtTabHERSTELLER_ID: TZIntegerField;
    ArtTabKAS_NAME: TZRawStringField;
    ArtTabKURZNAME: TZRawStringField;
    ArtTabLANGNAME: TZRawCLobField;
    ArtTabMATCHCODE: TZRawStringField;
    ArtTabMENGE_AKT: TZDoubleField;
    ArtTabREC_ID: TZIntegerField;
    ArtTabSHOP_ARTIKEL_ID: TZIntegerField;
    ArtTabSHOP_DATENBLATT: TZRawStringField;
    ArtTabSHOP_ID: TZSmallIntField;
    ArtTabSHOP_IMAGE_LARGE: TZRawStringField;
    ArtTabSHOP_LANGTEXT: TZRawCLobField;
    ArtTabSHOP_PREIS_LISTE: TZDoubleField;
    ArtTabSHOP_VISIBLE: TZIntegerField;
    ArtTabSTEUER_CODE: TZSmallIntField;
    ArtTabVK1: TZDoubleField;
    ArtTabVK1B: TZDoubleField;
    ArtTabVK2: TZDoubleField;
    ArtTabVK2B: TZDoubleField;
    ArtTabVK3: TZDoubleField;
    ArtTabVK3B: TZDoubleField;
    ArtTabVK4: TZDoubleField;
    ArtTabVK4B: TZDoubleField;
    ArtTabVK5: TZDoubleField;
    ArtTabVK5B: TZDoubleField;
    ArtTabWARENGRUPPE: TZIntegerField;
    HerDesTabDATE_LAST_CLICK: TZDateTimeField;
    HerDesTabHERSTELLER_ID: TZIntegerField;
    HerDesTabHERSTELLER_URL: TZRawStringField;
    HerDesTabSHOP_ID: TZShortIntField;
    HerDesTabSPRACHE_ID: TZIntegerField;
    HerDesTabURL_CLICKED: TZIntegerField;
    HerTabCHANGE_FLAG: TZRawStringField;
    HerTabDEL_FLAG: TZRawStringField;
    HerTabHERSTELLER_ID: TZIntegerField;
    HerTabHERSTELLER_IMAGE: TZRawStringField;
    HerTabHERSTELLER_NAME: TZRawStringField;
    HerTabLAST_CHANGE: TZDateTimeField;
    HerTabSHOP_DATE_ADDED: TZDateTimeField;
    HerTabSHOP_DATE_CHANGE: TZDateTimeField;
    HerTabSHOP_ID: TZShortIntField;
    HerTabSYNC_FLAG: TZRawStringField;
    KatTabCHANGE_FLAG: TZRawStringField;
    KatTabDEL_FLAG: TZRawStringField;
    KatTabID: TZIntegerField;
    KatTabIMAGE: TZRawStringField;
    KatTabNAME: TZRawStringField;
    KatTabSHOP_ID: TZShortIntField;
    KatTabSORT_NUM: TZCardinalField;
    KatTabTOP_ID: TZIntegerField;
    KatTabVISIBLE_FLAG: TZRawStringField;
    KunTabABTEILUNG: TZRawStringField;
    KunTabANREDE: TZRawStringField;
    KunTabBANK: TZRawStringField;
    KunTabBLZ: TZRawStringField;
    KunTabBRT_TAGE: TZSmallIntField;
    KunTabBRUTTO_FLAG: TZRawStringField;
    KunTabDEB_NUM: TZIntegerField;
    KunTabEMAIL: TZRawStringField;
    KunTabFAX: TZRawStringField;
    KunTabGRABATT: TZDoubleField;
    KunTabKTO: TZRawStringField;
    KunTabKUNDENGRUPPE: TZIntegerField;
    KunTabKUNNUM1: TZRawStringField;
    KunTabKUN_GEBDATUM: TZDateField;
    KunTabKUN_LIEFART: TZIntegerField;
    KunTabKUN_SEIT: TZDateField;
    KunTabKUN_ZAHLART: TZIntegerField;
    KunTabLAND: TZRawStringField;
    KunTabMATCHCODE: TZRawStringField;
    KunTabMWST_FREI_FLAG: TZRawStringField;
    KunTabNAME1: TZRawStringField;
    KunTabNAME2: TZRawStringField;
    KunTabNAME3: TZRawStringField;
    KunTabNET_SKONTO: TZDoubleField;
    KunTabNET_TAGE: TZSmallIntField;
    KunTabORT: TZRawStringField;
    KunTabPLZ: TZRawStringField;
    KunTabPR_EBENE: TZSmallIntField;
    KunTabREC_ID: TZIntegerField;
    KunTabSHOP_ID: TZSmallIntField;
    KunTabSHOP_KUNDE_ID: TZIntegerField;
    KunTabSTATUS: TZIntegerField;
    KunTabSTRASSE: TZRawStringField;
    KunTabTELE1: TZRawStringField;
    KunTabWAERUNG: TZRawStringField;
    OscArtTabArtikelExists: TBooleanField;
    OscArtTabBild: TStringField;
    OscArtTabCaoArtID: TLongintField;
    OscArtTabHersteller: TLongintField;
    OscArtTabID: TLongintField;
    OscArtTabImportiert: TBooleanField;
    OscArtTabMenge: TFloatField;
    OscArtTabModell: TStringField;
    OscArtTabMwStID: TLongintField;
    OscArtTabPreis: TFloatField;
    OscArtTabStatus: TLongintField;
    OscArtTabTextDE: TStringField;
    OscArt_DS: TDataSource;
    OscHerTabDateAdded: TDateTimeField;
    OscHerTabExists: TBooleanField;
    OscHerTabHERSTELLER_IMAGE: TStringField;
    OscHerTabHERSTELLER_NAME: TStringField;
    OscHerTabHERSTELLER_URL: TStringField;
    OscHerTabID: TLongintField;
    OscHerTabImportiert: TBooleanField;
    OscHerTabLastModified: TDateTimeField;
    OscKatTabDateAdded: TDateTimeField;
    OscKatTabExists: TBooleanField;
    OscKatTabID: TLongintField;
    OscKatTabImageURL: TStringField;
    OscKatTabImportiert: TBooleanField;
    OscKatTabLastModified: TDateTimeField;
    OscKatTabName: TStringField;
    OscKatTabPID: TLongintField;
    OscKatTabSortOrder: TLongintField;
    OscReTabAnzArtikel: TLongintField;
    OscReTabCaoKunID: TLongintField;
    OscReTabDatum: TDateField;
    OscReTabFirma: TStringField;
    OscReTabID: TLongintField;
    OscReTabImportiert: TBooleanField;
    OscReTabKundeExists: TBooleanField;
    OscReTabKun_ID: TLongintField;
    OscReTabKurs: TFloatField;
    OscReTabLand: TStringField;
    OscReTabName: TStringField;
    OscReTabOrt: TStringField;
    OscReTabPLZ: TStringField;
    OscReTabStrasse: TStringField;
    OscReTabWaehrung: TStringField;
    OscRe_DS: TDataSource;
    OscKat_DS: TDataSource;
    OscHer_DS: TDataSource;
    ExecKatBtn: TButton;
    IdHTTP1: TIdHTTP;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    OscReTab: TRxMemoryData;
    OscKatTab: TRxMemoryData;
    OscHerTab: TRxMemoryData;
    PosTabADDR_ID: TZIntegerField;
    PosTabALTTEIL_FLAG: TZRawStringField;
    PosTabALTTEIL_PROZ: TZDoubleField;
    PosTabALTTEIL_STCODE: TZSmallIntField;
    PosTabARTIKELTYP: TZRawStringField;
    PosTabARTIKEL_ID: TZIntegerField;
    PosTabARTNUM: TZRawStringField;
    PosTabATRNUM: TZIntegerField;
    PosTabBARCODE: TZRawStringField;
    PosTabBEZEICHNUNG: TZRawCLobField;
    PosTabBEZ_FEST_FLAG: TZRawStringField;
    PosTabBRUTTO_FLAG: TZRawStringField;
    PosTabBSumme: TCurrencyField;
    PosTabDIMENSION: TZRawStringField;
    PosTabEPREIS: TZDoubleField;
    PosTabE_RGEWINN: TZDoubleField;
    PosTabGEBUCHT: TZRawStringField;
    PosTabGEGENKTO: TZIntegerField;
    PosTabGEWICHT: TZDoubleField;
    PosTabGROESSE: TZRawStringField;
    PosTabJAHR: TLongintField;
    PosTabJOURNAL_ID: TZIntegerField;
    PosTabLAENGE: TZRawStringField;
    PosTabMATCHCODE: TZRawStringField;
    PosTabMENGE: TZDoubleField;
    PosTabME_EINHEIT: TZRawStringField;
    PosTabMSumme: TCurrencyField;
    PosTabMwSt: TStringField;
    PosTabNSumme: TCurrencyField;
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
    ReEdiTabBRUTTO_FLAG: TZRawStringField;
    ReEdiTabBSUMME: TZDoubleField;
    ReEdiTabERSTELLT: TZDateField;
    ReEdiTabERST_NAME: TZRawStringField;
    ReEdiTabFOLGENR: TZIntegerField;
    ReEdiTabGEGENKONTO: TZIntegerField;
    ReEdiTabGLOBRABATT: TZDoubleField;
    ReEdiTabINFO: TZRawCLobField;
    ReEdiTabJAHR: TZDateField;
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
    ReEdiTabLIEFART: TSmallintField;
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
    ReEdiTabMWST_FREI_FLAG: TZRawStringField;
    ReEdiTabNSUMME: TZDoubleField;
    ReEdiTabORGNUM: TZRawStringField;
    ReEdiTabPROJEKT: TZRawStringField;
    ReEdiTabPR_EBENE: TZShortIntField;
    ReEdiTabQUELLE: TZShortIntField;
    ReEdiTabQUELLE_SUB: TZShortIntField;
    ReEdiTabRDATUM: TZDateField;
    ReEdiTabREC_ID: TZIntegerField;
    ReEdiTabSHOP_ID: TZShortIntField;
    ReEdiTabSHOP_ORDERID: TZIntegerField;
    ReEdiTabSHOP_STATUS: TZByteField;
    ReEdiTabSOLL_NTAGE: TZShortIntField;
    ReEdiTabSOLL_RATBETR: TZDoubleField;
    ReEdiTabSOLL_RATEN: TZShortIntField;
    ReEdiTabSOLL_RATINTERVALL: TZIntegerField;
    ReEdiTabSOLL_SKONTO: TZDoubleField;
    ReEdiTabSOLL_STAGE: TZShortIntField;
    ReEdiTabSTADIUM: TZShortIntField;
    ReEdiTabTKOST: TZDoubleField;
    ReEdiTabUSR1: TZRawStringField;
    ReEdiTabUSR2: TZRawStringField;
    ReEdiTabVERTRETER_ID: TZIntegerField;
    ReEdiTabVLSNUM: TZIntegerField;
    ReEdiTabVRENUM: TZIntegerField;
    ReEdiTabWAEHRUNG: TZRawStringField;
    ReEdiTabWARE: TZDoubleField;
    ReEdiTabWERT_NETTO: TZDoubleField;
    ReEdiTabWVORLAGE: TLongintField;
    ReEdiTabWV_DATUM: TDateField;
    ReEdiTabWV_DatumStr: TStringField;
    ReEdiTabZAHLART: TSmallintField;
    ExRxDBGrid1: TRxDBGrid;
    ExRxDBGrid2: TRxDBGrid;
    ShopBestImpBtn: TBitBtn;
    ImportAlleHerstellerBtn: TBitBtn;
    ImportHerstellerBtn: TBitBtn;
    KatImportAlleBtn: TBitBtn;
    ImportKatBtn: TBitBtn;
    JobsRefreshBtn: TButton;
    ShopBestReadBtn: TButton;
    ShopHerReadBtn: TButton;
    ShopKatReadBtn: TButton;
    ImportAlleArtikelBtn: TBitBtn;
    ImportArtikelBtn: TBitBtn;
    Label8: TLabel;
    ShopArtReadBtn: TButton;
    Label1: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label35: TLabel;
    PLog: TListBox;
    KLB1: TListBox;
    KLog: TListBox;
    Hlb1: TListBox;
    HLog: TListBox;
    PedHaendBtn: TSpeedButton;
    KatalogBtn: TSpeedButton;
    BestellungenBtn: TSpeedButton;
    FromOrderNum: TSpinEdit;
    SyncLV: TListView;
    OLog: TListBox;
    Olb1: TListBox;
    Panel1: TPanel;
    Panel16: TPanel;
    Panel15: TPanel;
    Panel14: TPanel;
    Panel13: TPanel;
    Panel12: TPanel;
    Panel11: TPanel;
    Panel10: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PLB1: TListBox;
    MainPanel: TPanel;
    ArtPan: TPanel;
    PC1: TPageControl;
    Panel7: TPanel;
    Panel6: TPanel;
    Panel5: TPanel;
    ExRxDBGridHersteller: TRxDBGrid;
    OscReGrid: TRxDBGrid;
    OscArtTab: TRxMemoryData;
    ArtikelTS: TTabSheet;
    KatTS: TTabSheet;
    HerstellerTS: TTabSheet;
    BestellTS: TTabSheet;
    Splitter1: TSplitter;
    Splitter4: TSplitter;
    Splitter3: TSplitter;
    Splitter2: TSplitter;
    UpdateTS: TTabSheet;
    KatTab: TZQuery;
    HerTab: TZQuery;
    ArtTab: TZQuery;
    HerDesTab: TZQuery;
    ReEdiTab: TZQuery;
    KunTab: TZQuery;
    PosTab: TZQuery;
    KunLiefTab: TZQuery;
    procedure AlleBestImportBtnClick(Sender: TObject);
    procedure ArtRefreshBtnClick(Sender: TObject);
    procedure ExecKatBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImportAlleArtikelBtnClick(Sender: TObject);
    procedure ImportAlleHerstellerBtnClick(Sender: TObject);
    procedure ImportArtikelBtnClick(Sender: TObject);
    procedure ImportHerstellerBtnClick(Sender: TObject);
    procedure ImportKatBtnClick(Sender: TObject);
    procedure JobsRefreshBtnClick(Sender: TObject);
    procedure KatImportAlleBtnClick(Sender: TObject);
    procedure OscArtTabAfterScroll(DataSet: TDataSet);
    procedure OscArt_DSDataChange(Sender: TObject; Field: TField);
    procedure OscHerTabAfterScroll(DataSet: TDataSet);
    procedure OscHer_DSDataChange(Sender: TObject; Field: TField);
    procedure OscKatTabAfterScroll(DataSet: TDataSet);
    procedure OscKat_DSDataChange(Sender: TObject; Field: TField);
    procedure OscReTabAfterScroll(DataSet: TDataSet);
    procedure OscRe_DSDataChange(Sender: TObject; Field: TField);
    procedure PC1Change(Sender: TObject);
    procedure PosTabAfterPost(DataSet: TDataSet);
    procedure PosTabBeforeEdit(DataSet: TDataSet);
    procedure PosTabBeforePost(DataSet: TDataSet);
    procedure PosTabCalcFields(DataSet: TDataSet);
    procedure PosTabNewRecord(DataSet: TDataSet);
    procedure ReEdiTabBeforePost(DataSet: TDataSet);
    procedure ReEdiTabNewRecord(DataSet: TDataSet);
    procedure ShopBestImportBtnClick(Sender: TObject);
    procedure ShopBestReadBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FDocument       : IXMLDOMDocument2;
    ShopRechnungen  : array of tShopRech;
    ShopArtikel     : array of tShopArtikel;
    ShopKatalog     : array of tShopKatalog;
    ShopHersteller  : array of tShopHersteller;

    AKTO, EKTO      : Integer;
    ShopWGR         : Integer;

    LeitWaehrung    : String;
    ShopID          : Integer;
    ShopSprache     : String;
    ShopSprachID    : Integer;
    StatusUpdateSM  : Boolean; // wenn true, wird Benachrichtigungsmail
                              // an den Kunden versendet
    BruttoShop      : Boolean;
    UseShopOrderID  : Boolean;
    ShopUpdateMenge : Boolean;

    DefDebNum       : Integer;

    ProxyPort : Integer;

    ShopUser,
    ShopPW,

    ProxyAuthenticate,
    ProxyPassword,

    ProxyServer,
    ProxyUsername,

    ShopImportURL,
    ShopUpdateURL  : String;


    procedure ShowOrdersXML;
    procedure ShowProductsXML;
    procedure ShowKatalogXML;
    procedure ShowHerstellerXML;

    procedure SetOrdersMemTab;
    procedure SetProductsMemTab;
    procedure SetKatalogMemTab;
    procedure SetHerstellerMemTab;

    procedure LoadXML (var Stream: TMemoryStream; quelle : Integer);
    function  UpdateData (var Error : Integer; var NewID : Integer;
                          var Msg, Action : String; Data, Par : String) : Boolean;

    procedure AddLog (S : String);

    function MapLiefArt (Art : String):Integer;
    function MapZahlArt (Art : String):Integer;

    function UpdateLieferAnschrift (Addr_ID : Integer;
                                    Anrede, Name1, Name2,
                                    Strasse, Land, PLZ,
                                    Ort : String) : Integer;

  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
  end;

var
  ShopTransForm: TShopTransForm;

implementation

{$R *.frm}

uses ZExtra,
     {$IFDEF COMPILER_D7_UP}idUri,{$ENDIF}
     CAO_DM, cao_progress;

function UmlDecode (Source : String):String;

const Q : array[1..7] of String = ('&auml;','&ouml;','&uuml;',
                                   '&Auml;','&Ouml;','&Uuml;',
                                   '&szlig;');
const Z : array[1..7] of String = ('ä','ö','ü','Ä','Ö','Ü','ß');

var S : String; I,J,P : Integer;
begin
     S :=Source;
     for i:=1 to 7 do
     begin
       while (length(S)>0)and(Pos(Q[i],S)>0) do
       begin
         P :=Pos(Q[i],S);
         Delete (S,P,length(Q[i]));
         Insert (Z[i],S,P);
       end;
     end;
     Result :=S;
end;

function UrlEncode(const ASrc: string): string;
var
  i: Integer;
const
  UnsafeChars = ['*', '#', '%', '<', '>', ' ', '[', ']', '?', '&', '+'];
begin
  Result := '';
  for i := 1 to Length(ASrc) do
  begin
    if (ASrc[i] in UnsafeChars) or (not (ord(ASrc[i])in [33..128]))
     then Result := Result + '%' + IntToHex(Ord(ASrc[i]), 2)
     else Result := Result + ASrc[i];
  end;
end;

procedure TShopTransForm.OscArtTabAfterScroll(DataSet: TDataSet);
begin
     if OscArtTab.ControlsDisabled then exit;

     ImportArtikelBtn.Enabled :=(OscArtTab.RecordCount>0)and
                                (OscArtTabImportiert.AsBoolean=False)and
                                (OscArtTabArtikelExists.AsBoolean=False);

     ImportAlleArtikelBtn.Enabled :=(OscArtTab.RecordCount>0);

     ArtRefreshBtn.Enabled :=(OscArtTab.RecordCount>0)and
                             (
                              (OscArtTabImportiert.AsBoolean=True)or
                              (OscArtTabArtikelExists.AsBoolean=True)
                             );
end;

procedure TShopTransForm.OscArt_DSDataChange(Sender: TObject; Field: TField);
begin
    OscArtTabAfterScroll(nil);
end;

procedure TShopTransForm.FormCreate(Sender: TObject);
begin
    CoInitialize (nil);
    FDocument         := nil;
    ShopID            :=1; // im Moment nur 1 Shop !!!

    ShopSprachID      :=2; // Deutsch
    ShopSprache       :='DE';
    StatusUpdateSM    :=False;


    OnUpdateStatusBar :=nil;

    PC1.ActivePage :=PC1.Pages[0];
end;

procedure TShopTransForm.FormDeactivate(Sender: TObject);
var i,j : Integer;
begin
     //Dynamische Arrays freigeben

     if length(ShopRechnungen)>0 then
      for i:=0 to length(ShopRechnungen)-1 do
      begin
        SetLength(ShopRechnungen[i].Summen,0);
        if length(ShopRechnungen[i].Pos)>0 then
         for j :=0 to length(ShopRechnungen[i].Pos)-1 do
          setlength(ShopRechnungen[i].Pos[j].Opt,0);
        SetLength(ShopRechnungen[i].Pos,0);
      end;
     setlength(ShopRechnungen,0);

     if length(ShopArtikel)>0 then
      for i:=0 to length(ShopArtikel)-1 do
      begin
        if Length(ShopArtikel[i].Txt)>0 then
         for j:=0 to Length(ShopArtikel[i].Txt)-1 do
          ShopArtikel[i].Txt[j].Text :='';
        SetLength(ShopArtikel[i].Txt,0);
      end;
     setlength(ShopArtikel,0);

     if length(ShopKatalog)>0 then
     for i:=0 to length(ShopKatalog)-1 do
     begin
        SetLength(ShopKatalog[i].ProdList,0);
        SetLength(ShopKatalog[i].Descr,0);
     end;
     setlength(ShopKatalog,0);

     OscArtTab.Close;
     OscReTab.Close;
     OscKatTab.Close;
end;

procedure TShopTransForm.FormDestroy(Sender: TObject);
begin
    FDocument := nil; // Delphi gibt Objekt frei !
    CoUninitialize;
end;

procedure TShopTransForm.ImportAlleArtikelBtnClick(Sender: TObject);
begin
     if (not OscArtTab.Active)or(OscArtTab.RecordCount=0) then exit;

     ShopArtReadBtn.Enabled :=False;
     ImportAlleArtikelBtn.Enabled :=False;
     try
       OscArtTab.First;
       while not OscArtTab.Eof do
       begin
            if ImportArtikelBtn.Enabled then ImportArtikelBtnClick (Sender)
                                        else OscArtTab.Next;
       end;
     finally
       ShopArtReadBtn.Enabled :=True;
       ImportAlleArtikelBtn.Enabled :=True;
     end;
end;

procedure TShopTransForm.ImportAlleHerstellerBtnClick(Sender: TObject);
begin
     if (not OscHerTab.Active)or(OscHerTab.RecordCount=0) then exit;

     ShopHerReadBtn.Enabled :=False;
     ImportAlleHerstellerBtn.Enabled :=False;
     try
       OscHerTab.First;
       while not OscHerTab.Eof do
       begin
         if ImportHerstellerBtn.Enabled then ImportHerstellerBtnClick (Sender)
                                        else OscHerTab.Next;
       end;
     finally
       ShopHerReadBtn.Enabled :=True;
       ImportAlleHerstellerBtn.Enabled :=True;
     end;
end;

procedure TShopTransForm.ImportArtikelBtnClick(Sender: TObject);
var I, J, P : Integer; M,B : Double;
begin
     I :=OscArtTab.RecNo-1;

     ArtTab.Close;
     ArtTab.ParamByName('ID').AsInteger :=-1;
     ArtTab.Open;

     ArtTab.Append;

     ArtTabARTNUM.AsString          :=ShopArtikel[i].Modell;
     ArtTabMATCHCODE.AsString       :=ShopArtikel[i].Modell;
     //ArtTabSHOP_ART_NAME.AsString   :=ShopArtikel[i].Modell;

     ArtTabWARENGRUPPE.AsInteger    :=ShopWGR;
     ArtTabARTIKELTYP.AsString      :='N';

     if length(ShopArtikel[I].Txt)>0 then
     for J :=0 to Pred(length(ShopArtikel[I].Txt)) do
     begin
        if uppercase(ShopArtikel[I].Txt[J].SprachCode)=ShopSprache then
        begin
           ArtTabLANGNAME.AsString         :=ShopArtikel[I].Txt[J].Name;
           ArtTabKURZNAME.AsString         :=ShopArtikel[I].Txt[J].Name;
           ArtTabKAS_NAME.AsString         :=ShopArtikel[I].Txt[J].Name;
           ArtTabSHOP_DATENBLATT.AsString  :=ShopArtikel[I].Txt[J].URL;

           ArtTabSHOP_LANGTEXT.AsString    :=ShopArtikel[I].Txt[J].Text;
        end;
     end;

     ArtTabGEWICHT.AsFloat           :=ShopArtikel[i].Gewicht;

     //Mwst berechnen
     if (ShopArtikel[i].MwStID>=0)and(ShopArtikel[i].MwStID<=3)
      then M :=DM1.MwStTab[ShopArtikel[i].MwStID]
      else M :=0;

     // Brutto berechnen und runden
     B :=round(ShopArtikel[i].PreisN * (100+M))/100;
     P :=DM1.AnzPreis;


     case DM1.AnzPreis of
          1: ArtTabVK1.AsFloat       :=ShopArtikel[i].PreisN;
          2: ArtTabVK2.AsFloat       :=ShopArtikel[i].PreisN;
          3: ArtTabVK3.AsFloat       :=ShopArtikel[i].PreisN;
          4: ArtTabVK4.AsFloat       :=ShopArtikel[i].PreisN;
        else ArtTabVK5.AsFloat       :=ShopArtikel[i].PreisN;
     end;

     case P of
          1: ArtTabVK1B.AsFloat       :=B;
          2: ArtTabVK2B.AsFloat       :=B;
          3: ArtTabVK3B.AsFloat       :=B;
          4: ArtTabVK4B.AsFloat       :=B;
        else ArtTabVK5B.AsFloat       :=B;
     end;

     ArtTabSTEUER_CODE.AsInteger      :=ShopArtikel[i].MwStID;

     ArtTabSHOP_ID.AsInteger         :=ShopID;
     ArtTabSHOP_ARTIKEL_ID.AsInteger :=ShopArtikel[i].ID;

     ArtTabSHOP_IMAGE_LARGE.AsString :=ShopArtikel[i].Bild;
     ArtTabSHOP_PREIS_LISTE.AsFloat  :=ShopArtikel[i].PreisN;
     ArtTabSHOP_VISIBLE.AsInteger    :=ShopArtikel[i].Status;

     ArtTabERSTELLT.AsDateTime       :=now;
     ArtTabERST_NAME.AsString        :='CAO-Shop-Import';

     ArtTabERLOES_KTO.AsInteger      :=EKTO;
     ArtTabAUFW_KTO.AsInteger        :=AKTO;

     ArtTabMenge_Akt.AsFloat         :=ShopArtikel[i].Menge;
     ArtTabHersteller_Id.AsInteger   :=ShopArtikel[i].Hersteller;

     ArtTab.Post;

     OscArtTab.Edit;
     OscArtTabImportiert.AsBoolean :=True;
     OscArtTabCaoArtID.AsInteger   :=ArtTabRec_ID.AsInteger;
     OscArtTab.Post;

     Arttab.Close;

     OscArtTab.Next;
end;

procedure TShopTransForm.ImportHerstellerBtnClick(Sender: TObject);
var I, J : Integer;
begin
     I :=OscHerTab.RecNo-1;

     if not HerTab.Active then HerTab.Open;

     HerTab.Append;

     If ShopHersteller[i].LastModified < ShopHersteller[i].DateAdded then
        ShopHersteller[i].LastModified := ShopHersteller[i].DateAdded;

     HerTabSHOP_ID.AsInteger           :=ShopID;
     HerTabHERSTELLER_ID.AsInteger     :=OscHerTabID.AsInteger;
     HerTabHERSTELLER_NAME.AsString    :=OscHerTabHERSTELLER_NAME.AsString;
     HerTabHERSTELLER_IMAGE.AsString   :=OscHerTabHERSTELLER_IMAGE.AsString;
     HerTabSYNC_FLAG.AsBoolean         :=False;
     HerTabCHANGE_FLAG.AsBoolean       :=False;
     HerTabDEL_FLAG.AsBoolean          :=False;
     HerTabLAST_CHANGE.asDateTime      :=ShopHersteller[i].LastModified;
     HerTabSHOP_DATE_ADDED.asDateTime  :=ShopHersteller[i].DateAdded;
     HerTabSHOP_DATE_CHANGE.asDateTime :=ShopHersteller[i].LastModified;

     try
       HerTAb.Post;


       if length(ShopHersteller[i].Descr)>0 then
       begin
         for j:=0 to length(ShopHersteller[i].Descr)-1 do
         begin
           HerDesTab.Close;
           HerDesTab.ParamByName ('ID').AsInteger :=OscHerTabID.AsInteger;
           HerDesTab.Open;
           HerDesTab.Append;

     IF ShopHersteller[i].Descr[j].DATE_LAST_CLICK < ShopHersteller[i].DateAdded then
        ShopHersteller[i].Descr[j].DATE_LAST_CLICK := ShopHersteller[i].DateAdded;

           HerDesTabSHOP_ID.AsInteger           :=ShopID;
           HerDesTabHERSTELLER_ID.AsInteger     :=OscHerTabID.AsInteger;
           HerDesTabSPRACHE_ID.AsInteger        :=ShopHersteller[i].Descr[j].SprachID;
           HerDesTabHERSTELLER_URL.AsString     :=ShopHersteller[i].Descr[j].HERSTELLER_URL;
           HerDesTabURL_CLICKED.AsInteger       :=ShopHersteller[i].Descr[j].URL_CLICKED;
           HerDesTabDATE_LAST_CLICK.AsDateTime  :=ShopHersteller[i].Descr[j].DATE_LAST_CLICK;
           { weggefallen !
           HerDesTabSHOP_DATE_ADDED.AsDateTime  :=ShopHersteller[i].DateAdded;
           HerDesTabSHOP_DATE_CHANGE.AsDateTime :=ShopHersteller[i].LastModified;
           HerDesTabSYNC_FLAG.AsBoolean         :=False;
           HerDesTabCHANGE_FLAG.AsBoolean       :=False;
           HerDesTabDEL_FLAG.AsBoolean          :=False;
           }
           try
              HerDesTab.Post;
           except
              HerDesTab.Cancel;
           end;
         end;
       end;

     except
       HerTAb.Cancel;
     end;

     OscHerTab.Edit;
     OscHerTabImportiert.AsBoolean :=True;
     OscHerTab.Post;

     OscHerTab.Next;
end;

procedure TShopTransForm.ImportKatBtnClick(Sender: TObject);
var I, J, SHOP_AID, CAO_AID : Integer;
begin
     I :=OscKatTab.RecNo-1;

     if not KatTab.Active then KatTab.Open;

     KatTab.Append;

     KatTabSHOP_ID.AsInteger      :=ShopID;
     KatTabID.AsInteger           :=OscKatTabID.AsInteger;
     KatTabTOP_ID.AsInteger       :=OscKatTabPID.AsInteger;
     KatTabSort_Num.AsInteger     :=ShopKatalog[i].SortOrder;
     KatTabNAME.AsString          :=OscKatTabName.AsString;
     KatTabIMAGE.AsString         :=OscKatTabImageURL.AsString;
     KatTabVISIBLE_FLAG.AsBoolean :=False;
     KatTabCHANGE_FLAG.AsBoolean  :=False;
     KatTabDEL_FLAG.AsBoolean     :=False;

     KatTAb.Post;

     // ArtikelToKat prüfen und anlegen
     if length(ShopKatalog[i].ProdList)>0 then
     begin
        for J:=0 to Pred(length(ShopKatalog[i].ProdList)) do
        begin
           Shop_AID :=ShopKatalog[i].ProdList[j];

           DM1.UniQuery.Close;
           DM1.UniQuery.Sql.Text :='select REC_ID, SHOP_ID, SHOP_ARTIKEL_ID '+
                                   'from ARTIKEL where SHOP_ID='+
                                   IntToStr(ShopID)+
                                   ' and SHOP_ARTIKEL_ID='+
                                   IntToStr(SHOP_AID);

           DM1.UniQuery.Open;
           if (DM1.UniQuery.RecordCount>0)and
              (DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsInteger=SHOP_AID)
            then CAO_AID :=DM1.UniQuery.FieldByName('REC_ID').AsInteger
            else CAO_AID :=-1;

           DM1.UniQuery.Close;

           if CAO_AID>-1 then
           begin
//             DM1.UniQuery.RequestLive :=True;
             DM1.UniQuery.Sql.Text :='select * from ARTIKEL_TO_KAT where SHOP_ID='+
                                     inttostr(ShopID)+' and ARTIKEL_ID='+
                                     IntToStr(CAO_AID)+' and KAT_ID='+
                                     IntToStr(OscKatTabID.AsInteger);

             DM1.UniQuery.Open;
             if DM1.UniQuery.RecordCount=0 then
             begin
                DM1.UniQuery.Append;
                DM1.UniQuery.FieldByName ('SHOP_ID').AsInteger    :=ShopID;
                DM1.UniQuery.FieldByName ('ARTIKEL_ID').AsInteger :=CAO_AID;
                DM1.UniQuery.FieldByName ('KAT_ID').AsInteger     :=OscKatTabID.AsInteger;
                DM1.UniQuery.FieldByName ('CHANGE_FLAG').AsString :='N';
                DM1.UniQuery.FieldByName ('DEL_FLAG').AsString    :='N';
                DM1.UniQuery.Post;
             end;
           end;
        end;

        DM1.UniQuery.Close;
//        DM1.UniQuery.RequestLive :=False;
     end;

     OscKatTab.Edit;
     OscKatTabImportiert.AsBoolean :=True;
     OscKatTab.Post;
     OscKatTab.Next;
end;

procedure TShopTransForm.JobsRefreshBtnClick(Sender: TObject);
var LVItem : tListItem;
begin
     SyncLV.Items.Clear;

     DM1.UniQuery.Close;
     DM1.UniQuery.Sql.Text :='SELECT HERSTELLER_ID, HERSTELLER_NAME, '+
                             'HERSTELLER_IMAGE, CHANGE_FLAG, DEL_FLAG '+
                             'FROM HERSTELLER WHERE CHANGE_FLAG="Y" '+
                             'and SHOP_ID='+IntToStr(ShopID);
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Hersteller';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString);
        LVItem.SubItems.Add ('-');
        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else LVItem.SubItems.Add ('Update / Neuanlage');
        LVItem.SubItems.Add ('-');
        DM1.UniQuery.Next;
     end;

     DM1.UniQuery.Close;
     DM1.UniQuery.Sql.Text :='SELECT VRENUM, SHOP_ID, SHOP_ORDERID, SHOP_STATUS'+
                             ' FROM JOURNAL WHERE (QUELLE=3 OR QUELLE=13) '+
                             'and SHOP_CHANGE_FLAG="Y" and SHOP_ID='+
                             IntToStr(ShopID);
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Bestellung';
        LVItem.SubItems.Add ('EDI-'+DM1.UniQuery.FieldByName('VRENUM').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_ORDERID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_STATUS').AsString);
        LVItem.SubItems.Add ('Status-Update');
        LVItem.SubItems.Add ('-');
        DM1.UniQuery.Next;
     end;
     DM1.UniQuery.Close;

     DM1.UniQuery.Sql.Text :='SELECT REC_ID, SHOP_ID, SHOP_ARTIKEL_ID, '+
                             'SHOP_CHANGE_FLAG, SHOP_DEL_FLAG FROM ARTIKEL WHERE '+
                             '(SHOP_CHANGE_FLAG=1 or SHOP_DEL_FLAG="Y") and SHOP_ID='+
                             IntToStr(ShopID);
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Artikel';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('REC_ID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString);
        LVItem.SubItems.Add ('-');
        if DM1.UniQuery.FieldByName('SHOP_DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else
        if DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsInteger<=0
         then LVItem.SubItems.Add ('Neuanlage')
         else LVItem.SubItems.Add ('Update');
        LVItem.SubItems.Add ('-');
        DM1.UniQuery.Next;
     end;
     DM1.UniQuery.Close;

     DM1.UniQuery.Sql.Text :='SELECT SHOP_ID, ID, CHANGE_FLAG, DEL_FLAG FROM ARTIKEL_KAT '+
                             'WHERE (CHANGE_FLAG="Y" or DEL_FLAG="Y") and SHOP_ID='+
                             IntToStr(ShopID);
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Katalog';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('ID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('ID').AsString);
        LVItem.SubItems.Add ('-');
        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else LVItem.SubItems.Add ('Update / Neuanlage');
        LVItem.SubItems.Add ('-');
        DM1.UniQuery.Next;
     end;

     DM1.UniQuery.Close;

     DM1.UniQuery.Sql.Text :='SELECT ATK.*, A.SHOP_ARTIKEL_ID FROM ARTIKEL_TO_KAT ATK, ARTIKEL A'+
                             ' WHERE (ATK.CHANGE_FLAG="Y" or ATK.DEL_FLAG="Y")'+
                             ' and ATK.SHOP_ID='+IntToStr(ShopID)+
                             ' and A.SHOP_ID='+IntToStr(ShopID)+
                             ' and A.REC_ID=ATK.ARTIKEL_ID';
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Kat.Artikelzuordnung';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('KAT_ID').AsString);
        LVItem.SubItems.Add ('-');

        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else LVItem.SubItems.Add ('Update / Neuanlage');
        LVItem.SubItems.Add ('-');
        DM1.UniQuery.Next;
     end;
end;

procedure TShopTransForm.KatImportAlleBtnClick(Sender: TObject);
begin
     if (not OscKatTab.Active)or(OscKatTab.RecordCount=0) then exit;

     KatImportAlleBtn.Enabled :=False;
     ShopKatReadBtn.Enabled :=False;
     try
       OscKatTab.First;
       while not OscKatTab.Eof do
       begin
            if ImportKatBtn.Enabled then ImportKatBtnClick (Sender)
                                    else OscKatTab.Next;
       end;
     finally
       KatImportAlleBtn.Enabled :=True;
       ShopKatReadBtn.Enabled :=True;
     end;
end;

procedure TShopTransForm.FormActivate(Sender: TObject);
begin
    LeitWaehrung :=DM1.LeitWaehrung;
    if LeitWaehrung='€' then LeitWaehrung :='EUR';


    ShopUser          :=DM1.ReadString  ('SHOP','SHOPTRANS_USER','');
    ShopPW            :=DM1.ReadString  ('SHOP','SHOPTRANS_SECRET','');
    ShopImportURL     :=DM1.ReadString  ('SHOP','IMPORT_URL','');
    ShopUpdateURL     :=DM1.ReadString  ('SHOP','UPDATE_URL','');

    ProxyAuthenticate :=DM1.ReadString  ('SHOP','PROXY_AUTH','');
    ProxyPassword     :=DM1.ReadString  ('SHOP','PROXY_PASS','');
    ProxyPort         :=DM1.ReadInteger ('SHOP','PROXY_PORT',0);
    ProxyServer       :=DM1.ReadString  ('SHOP','PROXY_SERV','');
    ProxyUsername     :=DM1.ReadString  ('SHOP','PROXY_USER','');

    StatusUpdateSM    :=DM1.ReadBoolean ('SHOP','UPDATEORDERSTATUS_SENDMAIL',False);

    ShopWGr           :=DM1.ReadInteger ('SHOP','DEFAULT_WGR',1);
    BruttoShop        :=DM1.ReadBoolean ('SHOP','BRUTTO_SHOP',False);

    UseShopOrderID    :=DM1.ReadBoolean ('SHOP','USE_SHOP_ORDERID',False);

    DefDebNum         :=DM1.ReadInteger ('SHOP','DEFAULT_DEBNUM',0);

    ShopUpdateMenge   :=DM1.ReadBoolean ('SHOP','UPDATE_MENGE',False);

    DM1.GetWGRDefaultKonten (ShopWGR, EKTO, AKTO);
end;

procedure TShopTransForm.ArtRefreshBtnClick(Sender: TObject);
var I, J, P : Integer; B,M : Double;
begin
     I :=OscArtTab.RecNo-1;

     ArtTab.Close;
     ArtTab.ParamByName('ID').AsInteger :=OscArtTabCaoArtID.AsInteger;
     ArtTab.Open;

     if not ArtTab.RecordCount=1 then exit;

     ArtTab.Edit;

     ArtTabARTNUM.AsString          :=ShopArtikel[i].Modell;
     ArtTabMATCHCODE.AsString       :=ShopArtikel[i].Modell;
     //ArtTabSHOP_ART_NAME.AsString   :=ShopArtikel[i].Modell;

     ArtTabWARENGRUPPE.AsInteger    :=ShopWGR;
     ArtTabARTIKELTYP.AsString      :='N';

     if length(ShopArtikel[I].Txt)>0 then
     for J :=0 to Pred(length(ShopArtikel[I].Txt)) do
     begin
        if uppercase(ShopArtikel[I].Txt[J].SprachCode)=ShopSprache then
        begin
           ArtTabLANGNAME.AsString         :=ShopArtikel[I].Txt[J].Name;
           ArtTabKURZNAME.AsString         :=ShopArtikel[I].Txt[J].Name;
           ArtTabKAS_NAME.AsString         :=ShopArtikel[I].Txt[J].Name;
           ArtTabSHOP_DATENBLATT.AsString  :=ShopArtikel[I].Txt[J].URL;

           ArtTabSHOP_LANGTEXT.AsString    :=ShopArtikel[I].Txt[J].Text;
        end;
     end;

     ArtTabGEWICHT.AsFloat           :=ShopArtikel[i].Gewicht;

     //Mwst berechnen
     if (ShopArtikel[i].MwStID>=0)and(ShopArtikel[i].MwStID<=3)
      then M :=DM1.MwStTab[ShopArtikel[i].MwStID]
      else M :=0;

     // Brutto berechnen und runden
     B :=round(ShopArtikel[i].PreisN * (100+M))/100;

     P :=DM1.AnzPreis;

     case DM1.AnzPreis of
          1: ArtTabVK1.AsFloat       :=ShopArtikel[i].PreisN;
          2: ArtTabVK2.AsFloat       :=ShopArtikel[i].PreisN;
          3: ArtTabVK3.AsFloat       :=ShopArtikel[i].PreisN;
          4: ArtTabVK4.AsFloat       :=ShopArtikel[i].PreisN;
        else ArtTabVK5.AsFloat       :=ShopArtikel[i].PreisN;
     end;

     case P of
          1: ArtTabVK1B.AsFloat      :=B;
          2: ArtTabVK2B.AsFloat      :=B;
          3: ArtTabVK3B.AsFloat      :=B;
          4: ArtTabVK4B.AsFloat      :=B;
        else ArtTabVK5B.AsFloat      :=B;
     end;

     ArtTabSHOP_ID.AsInteger         :=ShopID;
     ArtTabSHOP_ARTIKEL_ID.AsInteger :=ShopArtikel[i].ID;

     ArtTabSHOP_IMAGE_LARGE.AsString :=ShopArtikel[i].Bild;
     ArtTabSHOP_PREIS_LISTE.AsFloat  :=ShopArtikel[i].PreisN;
     ArtTabSHOP_VISIBLE.AsInteger    :=ShopArtikel[i].Status;

     ArtTabERSTELLT.AsDateTime       :=now;
     ArtTabERST_NAME.AsString        :='CAO-Shop-Import';

     ArtTabERLOES_KTO.AsInteger      :=EKTO;
     ArtTabAUFW_KTO.AsInteger        :=AKTO;

     ArtTabMenge_Akt.AsFloat         :=ShopArtikel[i].Menge;
     ArtTabHersteller_Id.AsInteger   :=ShopArtikel[i].Hersteller;

     ArtTab.Post;

     OscArtTab.Edit;
     OscArtTabImportiert.AsBoolean :=True;
     OscArtTabCaoArtID.AsInteger   :=ArtTabRec_ID.AsInteger;
     OscArtTab.Post;

     Arttab.Close;

     OscArtTab.Next;
end;

procedure TShopTransForm.ExecKatBtnClick(Sender: TObject);
var LVItem : tListItem; data, action, msg : string; err, tid, NewID : integer;
begin
     if length(ShopUpdateURL)=0 then
     begin
        MessageDlg ('Die URL für das Shopupdate ist leer !'+#13#10+
                    'Siehe Datei->Einstellungen (Shop)',mterror,[mbok],0);
        exit;
     end;

     JobsRefreshBtn.Enabled :=False;
     ExecKatBtn.Enabled :=False;
     Screen.Cursor :=crHourGlass;
     SyncLV.Items.Clear;

     DM1.UniQuery.Close;
//     DM1.UniQuery.RequestLive :=True;

     DM1.UniQuery.Sql.Text :='SELECT HERSTELLER_ID, HERSTELLER_NAME, '+
                             'HERSTELLER_IMAGE, SHOP_DATE_ADDED, '+
                             'SHOP_DATE_CHANGE, CHANGE_FLAG, DEL_FLAG '+
                             'FROM HERSTELLER WHERE CHANGE_FLAG="Y" '+
                             'and SHOP_ID='+IntToStr(ShopID);

     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Hersteller';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString);
        LVItem.SubItems.Add ('-');
        LVItem.SubItems.Add ('-');
        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else
        { if DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsInteger<=0
         then LVItem.SubItems.Add ('Neuanlage')
         else} LVItem.SubItems.Add ('Update');

        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y' then
        begin
           action :='action=manufacturers_erase';
           action :=action+'&mID='+DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString;
           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);

           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery2.close;
              DM1.UniQuery2.Sql.Text :='UPDATE ARTIKEL SET HERSTELLER_ID="-1" '+
                                       'WHERE SHOP_ID='+IntToStr(ShopID)+' and '+
                                       'HERSTELLER_ID='+
                                       DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString;
              DM1.UniQuery2.ExecSql;
              DM1.UniQuery2.close;
              DM1.UniQuery2.Sql.Text :='DELETE FROM HERSTELLER '+
                                       'WHERE SHOP_ID='+IntToStr(ShopID)+' and '+
                                       'HERSTELLER_ID='+
                                       DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString;
              DM1.UniQuery2.ExecSql;
           end;

        end
           else
        begin

           action :='action=manufacturers_update';

           action :=action+'&mID='+DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString;

           action :=action+'&manufacturers_name='+UrlEncode(DM1.UniQuery.FieldByName('HERSTELLER_NAME').AsString);
           action :=action+'&manufacturers_image='+UrlEncode(DM1.UniQuery.FieldByName('HERSTELLER_IMAGE').AsString);

           DM1.UniQuery2.close;
           DM1.UniQuery2.SQL.Text :='select * from HERSTELLER_INFO where HERSTELLER_ID='+
                                    DM1.UniQuery.FieldByName('HERSTELLER_ID').AsString+
                                    ' and SHOP_ID='+IntToStr(ShopID);
           DM1.UniQuery2.Open;
           while not DM1.UniQuery2.Eof do
           begin
              action :=action+'&manufacturers_url['+
                       IntToStr(DM1.UniQuery2.FieldByName('SPRACHE_ID').AsInteger)+']='+
                       UrlEncode
                         (DM1.UniQuery2.FieldByName('HERSTELLER_URL').AsString);

              DM1.UniQuery2.Next;
           end;
           DM1.UniQuery2.Close;

           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);

           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery.Edit;
              DM1.UniQuery.FieldByName('CHANGE_FLAG').AsString :='N';
              DM1.UniQuery.Post;
           end;

        end;



        Application.ProcessMessages;
        DM1.UniQuery.Next;
     end;

     //-------------------------------------------------------------------------

     DM1.UniQuery.Close;
//     DM1.UniQuery.RequestLive :=True;

     DM1.UniQuery.Sql.Text :='SELECT REC_ID, SHOP_ID, SHOP_ARTIKEL_ID, '+
                             'SHOP_LANGTEXT, SHOP_IMAGE_BIG, ARTNUM, '+
                             'SHOP_PREIS_LISTE, GEWICHT, STEUER_CODE, '+
                             'SHOP_VISIBLE, KURZNAME, SHOP_CHANGE_FLAG, '+
                             'SHOP_DEL_FLAG, MENGE_AKT FROM ARTIKEL WHERE '+
                             '(SHOP_CHANGE_FLAG=1 or SHOP_DEL_FLAG="Y") '+
                             'and SHOP_ID='+IntToStr(ShopID);
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Artikel';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('REC_ID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString);
        LVItem.SubItems.Add ('-');
        if DM1.UniQuery.FieldByName('SHOP_DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else
        if DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsInteger<=0
         then LVItem.SubItems.Add ('Neuanlage')
         else LVItem.SubItems.Add ('Update');

        if DM1.UniQuery.FieldByName('SHOP_DEL_FLAG').AsString='Y' then
        begin
           action :='action=products_erase';
           action :=action+'&prodid='+DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString;
           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);

           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery2.close;
              DM1.UniQuery2.Sql.Text :='UPDATE ARTIKEL SET SHOP_ID="-1", '+
                                       'SHOP_DEL_FLAG="N", SHOP_CHANGE_FLAG="0" '+
                                       'WHERE REC_ID='+
                                       DM1.UniQuery.FieldByName('REC_ID').AsString;
              DM1.UniQuery2.ExecSql;
           end;

        end
           else
        begin
           action :='action=products_update';

           if DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsInteger>0
            then action :=action+'&pID='+DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString;

           action :=action+'&products_model='+UrlEncode(DM1.UniQuery.FieldByName('ARTNUM').AsString);
           action :=action+'&products_image='+UrlEncode(DM1.UniQuery.FieldByName('SHOP_IMAGE_BIG').AsString);
           action :=action+'&products_price='+UrlEncode(FloatToStrEx(DM1.UniQuery.FieldByName('SHOP_PREIS_LISTE').AsFloat));
           action :=action+'&products_weight='+UrlEncode(FloatToStrEx(DM1.UniQuery.FieldByName('GEWICHT').AsFloat));
           action :=action+'&products_tax_class_id='+UrlEncode(DM1.UniQuery.FieldByName('STEUER_CODE').AsString);
           action :=action+'&products_status='+UrlEncode(DM1.UniQuery.FieldByName('SHOP_VISIBLE').AsString);

           if ShopUpdateMenge then
           action :=action+'products_quantity'+UrlEncode(FloatToStrEx(DM1.UniQuery.FieldByName('MENGE_AKT').AsFloat));

           action :=action+'&products_description['+IntToStr(ShopSprachID)+']='+UrlEncode(DM1.UniQuery.FieldByName('SHOP_LANGTEXT').AsString);
           action :=action+'&products_name['+IntToStr(ShopSprachID)+']='+UrlEncode(DM1.UniQuery.FieldByName('KURZNAME').AsString);

           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);

           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery.Edit;
              if NewID>0 then DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsInteger :=NewID;
              DM1.UniQuery.FieldByName('SHOP_CHANGE_FLAG').AsString :='0';
              DM1.UniQuery.Post;
           end;
        end;

        Application.ProcessMessages;
        DM1.UniQuery.Next;
     end;

     DM1.UniQuery.Close;

     //-------------------------------------------------------------------------

     DM1.UniQuery.Close;
//     DM1.UniQuery.RequestLive :=True;

     DM1.UniQuery.Sql.Text :='SELECT * FROM ARTIKEL_KAT '+
                             'WHERE (CHANGE_FLAG="Y" or DEL_FLAG="Y") '+
                             'and SHOP_ID='+IntToStr(ShopID);
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Katalog';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('ID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('ID').AsString);
        LVItem.SubItems.Add ('-');
        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else LVItem.SubItems.Add ('Update / Neuanlage');

        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y' then
        begin
           action :='action=categories_erase';
           action :=action+'&catid='+DM1.UniQuery.FieldByName('ID').AsString;
           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);

           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery2.close;
              DM1.UniQuery2.Sql.Text :='DELETE FROM ARTIKEL_KAT '+
                                       'WHERE ID='+
                                       DM1.UniQuery.FieldByName('ID').AsString+
                                       ' and SHOP_ID='+IntToStr(ShopID);
              DM1.UniQuery2.ExecSql;
           end;

        end
           else
        begin
           action :='action=categories_update';

           tid :=DM1.UniQuery.FieldByName('TOP_ID').AsInteger;
           if tid<0 then tid :=0;

           action :=action+'&catid='+DM1.UniQuery.FieldByName('ID').AsString;
           action :=action+'&parentid='+IntToStr(tid);
           action :=action+'&sort='+IntToStr(DM1.UniQuery.FieldByName('SORT_NUM').AsInteger);
           action :=action+'&name='+UrlEncode(DM1.UniQuery.FieldByName('NAME').AsString);
           action :=action+'&image='+UrlEncode(DM1.UniQuery.FieldByName('IMAGE').AsString);

           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);

           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery.Edit;
              DM1.UniQuery.FieldByName('CHANGE_FLAG').AsString :='N';
              DM1.UniQuery.Post;
           end;
        end;

        Application.ProcessMessages;
        DM1.UniQuery.Next;
     end;

     DM1.UniQuery.Close;

     //-------------------------------------------------------------------------

//     DM1.UniQuery.RequestLive :=True;

     DM1.UniQuery.Sql.Text :='SELECT ATK.*, A.SHOP_ARTIKEL_ID FROM '+
                             'ARTIKEL_TO_KAT ATK, ARTIKEL A'+
                             ' WHERE (ATK.CHANGE_FLAG="Y" or ATK.DEL_FLAG="Y")'+
                             ' and ATK.SHOP_ID='+IntToStr(ShopID)+
                             ' and A.SHOP_ID='+IntToStr(ShopID)+
                             ' and A.REC_ID=ATK.ARTIKEL_ID';
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin
        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Kat.Artikelzuordnung';
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('KAT_ID').AsString);
        LVItem.SubItems.Add ('-');
        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y'
         then LVItem.SubItems.Add ('Löschen')
         else LVItem.SubItems.Add ('Update / Neuanlage');

        if DM1.UniQuery.FieldByName('DEL_FLAG').AsString='Y' then
        begin
           action :='action=prod2cat_erase';
           action :=action+'&catid='+DM1.UniQuery.FieldByName('KAT_ID').AsString;
           action :=action+'&prodid='+DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString;
           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);

           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery2.close;
              DM1.UniQuery2.Sql.Text :='DELETE FROM ARTIKEL_TO_KAT '+
                                       'WHERE KAT_ID='+
                                       DM1.UniQuery.FieldByName('KAT_ID').AsString+
                                       ' and ARTIKEL_ID='+
                                       DM1.UniQuery.FieldByName('ARTIKEL_ID').AsString+
                                       ' and SHOP_ID='+IntToStr(ShopID);
              DM1.UniQuery2.ExecSql;
           end;

        end
           else
        begin
           action :='action=prod2cat_update';

           action :=action+'&catid='+DM1.UniQuery.FieldByName('KAT_ID').AsString;
           action :=action+'&prodid='+DM1.UniQuery.FieldByName('SHOP_ARTIKEL_ID').AsString;

           Data :=action;
           action :='';
           err :=0;
           msg :='';

           UpdateData (err, NewID, msg, action, '', data);



           LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

           if err=0 then
           begin
              DM1.UniQuery.Edit;
              DM1.UniQuery.FieldByName('CHANGE_FLAG').AsString :='N';
              DM1.UniQuery.Post;
           end;
        end;

        Application.ProcessMessages;
        DM1.UniQuery.Next;
     end;

     //-------------------------------------------------------------------------
     // Update Orderstaus
     //-------------------------------------------------------------------------


//     DM1.UniQuery.RequestLive :=True;

     DM1.UniQuery.Close;
     DM1.UniQuery.Sql.Text :='SELECT VRENUM, SHOP_ID, SHOP_ORDERID, SHOP_STATUS'+
                             ',SHOP_CHANGE_FLAG FROM JOURNAL WHERE '+
                             '(QUELLE=3 OR QUELLE=13) '+
                             'and SHOP_CHANGE_FLAG="Y" and SHOP_ID='+
                             IntToStr(ShopID);
     DM1.UniQuery.Open;
     while not DM1.UniQuery.Eof do
     begin

        LVItem :=SyncLV.Items.Add;
        LVItem.Caption :='Bestellung';
        LVItem.SubItems.Add ('EDI-'+DM1.UniQuery.FieldByName('VRENUM').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_ORDERID').AsString);
        LVItem.SubItems.Add (DM1.UniQuery.FieldByName('SHOP_STATUS').AsString);
        LVItem.SubItems.Add ('Status-Update');

        action :='action=order_update';

        action :=action+'&order_id='+DM1.UniQuery.FieldByName('SHOP_ORDERID').AsString;
        action :=action+'&status='+DM1.UniQuery.FieldByName('SHOP_STATUS').AsString;

        if StatusUpdateSM
         then action :=action+'&notify=on'   // Kunden benachrichtigen
         else action :=action+'&notify=off'; // Kunden nicht benachrichtigen

        action :=action+'&cao_language=german'; // Sprache deutsch

        Data :=action;
        action :='';
        err :=0;
        msg :='';

        UpdateData (err, NewID, msg, action, '', data);



        LVItem.SubItems.Add (inttostr(err)+'-'+msg+' '+action);

        if err in [0,1] then // im Erfolgsfall oder bei "No Status Change"
        begin
           DM1.UniQuery.Edit;
           DM1.UniQuery.FieldByName('SHOP_CHANGE_FLAG').AsString :='N';
           DM1.UniQuery.Post;
        end;

        DM1.UniQuery.Next;
     end;
     DM1.UniQuery.Close;




     //-------------------------------------------------------------------------


     DM1.UniQuery.Close;
//     DM1.UniQuery.RequestLive :=False;
     ExecKatBtn.Enabled :=True;
     JobsRefreshBtn.Enabled :=True;
     Screen.Cursor :=crDefault;
end;

procedure TShopTransForm.AlleBestImportBtnClick(Sender: TObject);
begin
     if (not OscReTab.Active)or(OscReTab.RecordCount=0) then exit;

     ShopBestReadBtn.Enabled :=False;
     AlleBestImportBtn.Enabled :=False;
     Panel4.Enabled :=False;
     try
       OscReTab.First;
       while not OscReTab.Eof do
       begin
         if FromOrderNum.Value<OscReTabID.Value
          then FromOrderNum.Value:=OscReTabID.Value;

         if ShopBestImpBtn.Enabled then ShopBestImportBtnClick (Sender)
                                   else OscReTab.Next;
       end;
     finally
       ShopBestReadBtn.Enabled :=True;
       AlleBestImportBtn.Enabled :=True;
       Panel4.Enabled :=True;
     end;
end;

procedure TShopTransForm.OscHerTabAfterScroll(DataSet: TDataSet);
begin
     if OscHerTab.ControlsDisabled then exit;

     ImportHerstellerBtn.Enabled :=(OscHerTab.RecordCount>0)and
                                   (OscHerTabImportiert.AsBoolean=False)and
                                   (OscHerTabExists.AsBoolean=False);

     ImportAlleHerstellerBtn.Enabled :=(OscHerTab.RecordCount>0)
end;

procedure TShopTransForm.OscHer_DSDataChange(Sender: TObject; Field: TField);
begin
    OscArtTabAfterScroll(nil);
end;

procedure TShopTransForm.OscKatTabAfterScroll(DataSet: TDataSet);
begin
     if OscKatTab.ControlsDisabled then exit;

     ImportKatBtn.Enabled :=(OscKatTab.RecordCount>0)and
                            (OscKatTabImportiert.AsBoolean=False)and
                            (OscKatTabExists.AsBoolean=False);

     KatImportAlleBtn.Enabled :=(OscKatTab.RecordCount>0)
end;

procedure TShopTransForm.OscKat_DSDataChange(Sender: TObject; Field: TField);
begin
    OscKatTabAfterScroll(nil);
end;

procedure TShopTransForm.OscReTabAfterScroll(DataSet: TDataSet);
begin
     if OscReTab.ControlsDisabled then exit;

     ShopBestImpBtn.Enabled :=(OscReTab.RecordCount>0)and
                              (OscReTabImportiert.AsBoolean=False);

     AlleBestImportBtn.Enabled :=OscReTab.RecordCount>0;
end;

procedure TShopTransForm.OscRe_DSDataChange(Sender: TObject; Field: TField);
begin
    OscReTabAfterScroll(nil);
end;

procedure TShopTransForm.PC1Change(Sender: TObject);
begin
     if PC1.ActivePage=UpdateTS then JobsRefreshBtnClick(Sender);
end;

procedure TShopTransForm.PosTabAfterPost(DataSet: TDataSet);
var ID : Integer;
    N, n0, n1, n2, n3, M, m0, m1, m2, m3, B : Double;
begin
     //if PosTab.ControlsDisabled then exit;

     DM1.UpdateArtikelEdiMenge (VK_RECH_EDI,PosTabArtikel_ID.AsInteger,0);

     ID :=PosTabRec_ID.Value;
     PosTab.DisableControls;
     N :=0; N0 :=0; N1 :=0; N2 :=0; N3 :=0;
     M :=0; M0 :=0; M1 :=0; M2 :=0; M3 :=0;
     B :=0;
     try
        PosTab.First;
        while not PosTab.Eof do
        begin
           // Netto-Rechnung
           N :=N+PosTabNSumme.Value;

           case PosTabSteuer_code.Value of
             0:begin N0 :=N0 + PosTabNSumme.Value; M0 :=M0+PosTabMSumme.Value; end;
             1:begin N1 :=N1 + PosTabNSumme.Value; M1 :=M1+PosTabMSumme.Value; end;
             2:begin N2 :=N2 + PosTabNSumme.Value; M2 :=M2+PosTabMSumme.Value; end;
             3:begin N3 :=N3 + PosTabNSumme.Value; M3 :=M3+PosTabMSumme.Value; end;
           end;
           PosTab.Next;
        end;

        if not ReEdiTabMWST_FREI_Flag.AsBoolean then
        begin
          M :=M0+M1+M2+M3;
          B :=N+M;
        end
           else
        begin  // MwSt-Frei ...
          M:=0;
          B :=N;
        end;

        //ArtInfoTab.Refresh;
        PosTab.Refresh;

        PosTab.Locate ('REC_ID',variant(ID),[]);
     finally
        if (ReEdiTabNSumme.Value <> N)or
           (ReEdiTabMSumme.Value <> M)or
           (ReEdiTabBSumme.Value <> B)then
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

              ReEdiTabRDATUM.AsDateTime:=now;

              ReEdiTab.Post;
           except
              ReEdiTab.Cancel;
           end;
        end;
        PosTab.EnableControls;
     end;
end;

procedure TShopTransForm.PosTabBeforeEdit(DataSet: TDataSet);
begin
    try
       ReEdiTab.Edit;
       // Wenn hier ein fehler auftritt, dann ist evtl. der
       // Datenssatz durch anderen Anwender gesperrt !!!
    except
       Abort;
    end;
end;

procedure TShopTransForm.PosTabBeforePost(DataSet: TDataSet);
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
     if (PosTabArtikelTyp.Value='T') or
        (PosTabArtikelTyp.Value='K') then
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
     if PosTabMenge.Value <> PosTabMenge.OldValue then
     begin
          PosTabVLSNum.Value :=-1;
     end;
end;

procedure TShopTransForm.PosTabCalcFields(DataSet: TDataSet);
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

     if not ReEdiTabBrutto_Flag.AsBoolean then
     begin
        PosTabNSumme.Value :=round(Summe*100)/100;  // Auf ganze Pfennige Runden
        PosTabMSumme.Value :=round(Summe * (Steuer / 100) *100)/100; // Auf ganze Pfennige Runden
        PosTabBSumme.Value :=PosTabNSumme.Value+PosTabMSumme.Value;
     end
        else
     begin
        PosTabBSumme.Value :=round(Summe*100)/100;  // Auf ganze Pfennige Runden
        PosTabMSumme.Value :=round(Summe / (100 + Steuer) * Steuer * 100)/100; // Auf ganze Pfennige Runden
        PosTabNSumme.Value :=PosTabBSumme.Value-PosTabMSumme.Value;
     end;
     {
     PosTabNSumme.Value :=round(Summe*100)/100;  // Auf ganze Pfennige Runden
     PosTabMSumme.Value :=round(Summe * (Steuer / 100) *100)/100; // Auf ganze Pfennige Runden
     PosTabBSumme.Value :=PosTabNSumme.Value+PosTabMSumme.Value;
     }
     if Steuer <> 0 then PosTabMwst.Value :=FormatFloat ('0.0"%"',Steuer)
                    else PosTabMwst.Value :='-';
end;

procedure TShopTransForm.PosTabNewRecord(DataSet: TDataSet);
begin
    PosTabJournal_ID.Value :=ReEdiTabRec_ID.Value;
    PosTabQuelle.Value     :=ReEdiTabQuelle.Value;
    PosTabQuelle_Sub.Value :=ReEdiTabQuelle_Sub.Value;
    PosTabJahr.AsDateTime  :=ReEdiTabJahr.AsDateTime;
    PosTabAddr_ID.Value    :=ReEdiTabAddr_ID.Value;
    PosTabVRENUM.Value     :=ReEdiTabVRENUM.Value;
    PosTABVLSNUM.Value     :=-1;
    PosTabATRNum.Value     :=-1;
    PosTabGEBUCHT.AsBoolean:=False;
    PosTabRabatt.Value     :=ReEdiTabGlobRabatt.Value;
    PosTabPosition.Value   :=PosTab.RecordCount+1;
    PosTabE_RGewinn.Value  :=0;
end;

procedure TShopTransForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
     if ReEdiTabVRENUM.Value<1
      then ReEdiTabVRENUM.Value :=DM1.IncNummer (VK_RECH_EDI);

     if (ReEdiTabADDR_ID.Value>=0)and
        (
         (ReEdiTabKUN_NUM.AsString='') or
         (ReEdiTabKUN_NUM.AsString='0')
        ) then
     begin
        KunTab.Close;
        KunTab.ParamByName('ID').AsInteger :=ReEdiTabADDR_ID.Value;
        KunTab.Open;
        if KunTab.RecordCount=1 then
        begin
           if KunTab.FieldByName('KUNNUM1').AsString='' then
           begin
             KunTab.Edit;
             try
                KunTab.FieldByName('KUNNUM1').AsString :=IntToStr(DM1.IncNummer (99));


                if KunTab.FieldByName('DEB_NUM').AsInteger<1
                  then KunTab.FieldByName('DEB_NUM').AsInteger :=
                         DM1.IncNummer (DEB_NUM_KEY);
                         //KunTab.FieldByName('KUNNUM1').AsInteger+DEBI_KTOBASIS;
                KunTab.Post;
             except
                KunTab.Cancel;
             end;
           end;
        end;

        ReEdiTabKUN_NUM.Value :=KunTab.FieldByName('KUNNUM1').AsString;
        ReEdiTabGegenkonto.Value :=KunTab.FieldByName('DEB_NUM').AsInteger;

        KunTab.Close;
     end;
end;

//------------------------------------------------------------------------------
// Routinen zur Erstellung der Rechnungen für CAO
// ist eigentlich genau wie in MakeVKRech.pas ...
//------------------------------------------------------------------------------
procedure TShopTransForm.ReEdiTabNewRecord(DataSet: TDataSet);
begin
     ReEdiTabJahr.AsInteger   :=0;
     ReEdiTabQuelle.Value     :=VK_RECH_EDI;
     ReEdiTabQUELLE_SUB.Value :=0;
     ReEdiTabVLSNUM.Value     :=-1;
     ReEdiTabATRNUM.Value     :=-1;
     ReEdiTabGegenKonto.Value :=-1;
     ReEdiTabADDR_ID.Value    :=-1;
     ReEdiTabRDatum.AsInteger :=Trunc (Now);
     ReEdiTabLDatum.AsInteger :=0;
     ReEdiTabADatum.AsInteger :=0;
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
     ReEdiTabPR_Ebene.Value   :=DM1.AnzPreis;
     ReEdiTabFolgeNr.Value    :=-1;
     ReEdiTabKM_Stand.Value   :=-1;
     ReEdiTabKFZ_ID.Value     :=-1;
     ReEdiTabVertreter_ID.Value :=-1;
     ReEdiTabGlobRabatt.Value :=0;
     ReEdiTabWVorlage.Value   :=0;
     ReEdiTabWV_Datum.Value   :=0;
     ReEdiTabLiefart.Value    :=1;
     ReEdiTabZahlArt.Value    :=2;

     ReEdiTabErstellt.AsDateTime:=now;
     ReEdiTabERST_NAME.Value  :=dm1.User;

     ReEdiTabMWST_0.Value     :=DM1.MWSTTab[0];
     ReEdiTabMWST_1.Value     :=DM1.MWSTTab[1];
     ReEdiTabMWST_2.Value     :=DM1.MWSTTab[2];
     ReEdiTabMWST_3.Value     :=DM1.MWSTTab[3];

     if (PosTab.State in [dsEdit,dsInsert]) then
     begin
       try
         PosTab.Post;
       except
         PosTab.Cancel;
       end;
     end;
end;

procedure TShopTransForm.ShopBestImportBtnClick(Sender: TObject);
var I,J,K,LID : Integer; N, A, N1, N2 : String; P : Double;
begin
     I :=OscReTab.RecNo-1;
     LID :=-1; // keine abweichende Lieferanschrift

     // ggf. Kunden anlegen
     if not OscReTabKundeExists.AsBoolean then
     begin
        KunTab.Close;
        KunTab.ParamByName ('ID').AsInteger :=-1;
        KunTab.Open;
        KunTab.Append;
        try
           KunTabKundengruppe.AsInteger :=1;

           KunTabBRUTTO_FLAG.AsBoolean :=BruttoShop;
           //KunTabHAT_LIEFANSR.AsInteger :=0;

           if length (ShopRechnungen[i].R_Firma)>0 then
           begin
              KunTabAnrede.AsString :='Firma';
              KunTabName1.AsString :=ShopRechnungen[i].R_Firma;
              KunTabName2.AsString :=ShopRechnungen[i].R_Name;
           end
           else KunTabName1.AsString :=ShopRechnungen[i].R_Name;

           KunTabStrasse.AsString    :=ShopRechnungen[i].R_Strasse;
           KunTabPlz.AsString        :=ShopRechnungen[i].R_PLZ;
           KunTabOrt.AsString        :=ShopRechnungen[i].R_ORT;

           KunTabTele1.AsString      :=ShopRechnungen[i].Tele;
           KunTabEMail.AsString      :=ShopRechnungen[i].Mail;


           if DefDebNum > 0 then
           begin
             KunTabDEB_NUM.AsInteger :=DefDebNum;
             KunTabSTATUS.AsInteger  :=3; // Ist-Kunde (1) + Kunde exportiert (2)
           end;

           if (uppercase (ShopRechnungen[i].R_Land)='GERMANY') or
              (uppercase (ShopRechnungen[i].R_Land)='DEUTSCHLAND')
            then KunTabLand.AsString :='D'
            else KunTabLand.AsString :=ShopRechnungen[i].R_Land;


           KunTabSHOP_ID.AsInteger    :=ShopID;
           KunTabSHOP_KUNDE_ID.AsInteger :=ShopRechnungen[i].Kun_ID;

           if uppercase(ShopRechnungen[i].Waehrung)='EUR'
            then KunTabWaerung.AsString :='€'
            else KunTabWaerung.AsString :=ShopRechnungen[i].Waehrung;

           if ShopRechnungen[i].BANK_NAME <> ''
            then KunTabBank.AsString :=ShopRechnungen[i].BANK_NAME;

           if ShopRechnungen[i].BANK_BLZ <> ''
            then KunTabBlz.AsString :=ShopRechnungen[i].BANK_BLZ;

           if ShopRechnungen[i].BANK_KTO <> ''
            then KunTabKto.AsString :=ShopRechnungen[i].BANK_KTO;

           // Liefer- und Zahlart

           if length(ShopRechnungen[i].PaymentClass)>0
             then KunTabKun_Zahlart.Value :=MapZahlArt (UpperCase(ShopRechnungen[i].PaymentClass))
             else KunTabKun_Zahlart.Value :=-1;

           if length(ShopRechnungen[i].ShippingClass)>0
             then KunTabKun_Liefart.Value :=MapLiefArt (UpperCase(ShopRechnungen[i].ShippingClass))
             else KunTabKun_Liefart.Value :=-1;

           // Kunde seit und Geburtsdatum setzen
           KunTabKUN_SEIT.AsDateTime :=ShopRechnungen[i].Datum;

           if ShopRechnungen[i].Kun_GebDatum > 0
            then KunTabKUN_GEBDATUM.AsDateTime :=ShopRechnungen[i].Kun_GebDatum;

           KunTab.Post;

           // Abweichende Lieferanschrift ?
           if (ShopRechnungen[i].R_Firma   <> ShopRechnungen[i].L_Firma)or
              (ShopRechnungen[i].R_Name    <> ShopRechnungen[i].L_Name)or
              (ShopRechnungen[i].R_Ort     <> ShopRechnungen[i].L_Ort)or
              (ShopRechnungen[i].R_PLZ     <> ShopRechnungen[i].L_PLZ)or
              (ShopRechnungen[i].R_Strasse <> ShopRechnungen[i].L_Strasse) then
           begin

              A :=''; N1 :=''; N2 :='';

              if length (ShopRechnungen[i].L_Firma)>0 then
              begin
                 A  :='Firma';
                 N1 :=ShopRechnungen[i].L_Firma;
                 N2 :=ShopRechnungen[i].L_Name;
              end
              else N1 :=ShopRechnungen[i].L_Name;

              //KunTabL_Strasse.AsString    :=ShopRechnungen[i].L_Strasse;
              //KunTabL_Plz.AsString        :=ShopRechnungen[i].L_PLZ;
              //KunTabL_Ort.AsString        :=ShopRechnungen[i].L_ORT;

              LID :=UpdateLieferAnschrift (KunTabRec_ID.AsInteger, A, N1, N2,
                                           ShopRechnungen[i].L_Strasse,
                                           ShopRechnungen[i].L_Land,
                                           ShopRechnungen[i].L_PLZ,
                                           ShopRechnungen[i].L_Ort);

           end;


           // Tabelle aktualisieren, evt. gibt es vom gleichen Kunden
           // mehrere Bestellungen, dan muß bei allen aktualisiert werden !
           OscReTab.DisableControls;
           try
              OscReTab.First;
              while not OscReTab.Eof do
              begin
                 if OscReTabKun_ID.AsInteger=ShopRechnungen[i].Kun_ID then
                 begin
                    OscReTab.Edit;
                    OscReTabCaoKunID.AsInteger :=KunTabRec_ID.AsInteger;
                    OscReTabKundeExists.AsBoolean :=True;
                    OscReTab.Post;
                 end;
                 OscReTab.Next;
              end;
           finally
              OscReTab.RecNo :=I+1;
              OscReTab.EnableControls;
           end;
        except
           KunTab.Cancel;
           KunTab.Close;
           exit;
        end;

        KunTab.Close;

     end
        else
     begin
        // Kunde exisiert bereits
        KunTab.Close;
        KunTab.ParamByName ('ID').AsInteger :=OscReTabCaoKunID.AsInteger;
        KunTab.Open;

        if KunTab.RecordCount=1 then
        begin
           if (length(ShopRechnungen[i].R_Firma)>0) then
           begin
              if (ShopRechnungen[i].R_Firma   <> KunTabName1.AsString)or
                 (ShopRechnungen[i].R_Name    <> KunTabName2.AsString)or
                 (ShopRechnungen[i].R_Strasse <>  KunTabStrasse.AsString)or
                 (ShopRechnungen[i].R_PLZ     <>  KunTabPlz.AsString)or
                 (ShopRechnungen[i].R_ORT     <>  KunTabOrt.AsString)or
                 (ShopRechnungen[i].Tele      <>  KunTabTele1.AsString)or
                 (ShopRechnungen[i].Mail      <>  KunTabEMail.AsString) then
              begin
                 KunTab.Edit;

                 KunTabName1.AsString      :=ShopRechnungen[i].R_Name;
                 KunTabName2.AsString      :='';
                 KunTabStrasse.AsString    :=ShopRechnungen[i].R_Strasse;
                 KunTabPlz.AsString        :=ShopRechnungen[i].R_PLZ;
                 KunTabOrt.AsString        :=ShopRechnungen[i].R_ORT;
                 KunTabTele1.AsString      :=ShopRechnungen[i].Tele;
                 KunTabEMail.AsString      :=ShopRechnungen[i].Mail;

                 KunTab.Post;
              end;
           end
              else
           begin
              if (ShopRechnungen[i].R_Name    <> KunTabName1.AsString)or
                 (ShopRechnungen[i].R_Strasse <>  KunTabStrasse.AsString)or
                 (ShopRechnungen[i].R_PLZ     <>  KunTabPlz.AsString)or
                 (ShopRechnungen[i].R_ORT     <>  KunTabOrt.AsString)or
                 (ShopRechnungen[i].Tele      <>  KunTabTele1.AsString)or
                 (ShopRechnungen[i].Mail      <>  KunTabEMail.AsString) then
              begin
                 KunTab.Edit;

                 KunTabAnrede.AsString :='Firma';
                 KunTabName1.AsString      :=ShopRechnungen[i].R_Firma;
                 KunTabName2.AsString      :=ShopRechnungen[i].R_Name;
                 KunTabStrasse.AsString    :=ShopRechnungen[i].R_Strasse;
                 KunTabPlz.AsString        :=ShopRechnungen[i].R_PLZ;
                 KunTabOrt.AsString        :=ShopRechnungen[i].R_ORT;
                 KunTabTele1.AsString      :=ShopRechnungen[i].Tele;
                 KunTabEMail.AsString      :=ShopRechnungen[i].Mail;

                 KunTab.Post;
              end;
           end;

           // Lieferanschrift prüfen
           {if (length(ShopRechnungen[i].L_Firma)>0) then
           begin
              if (ShopRechnungen[i].L_Firma   <> KunTabL_Name1.AsString) or
                 (ShopRechnungen[i].L_Name    <> KunTabL_Name2.AsString) or
                 (ShopRechnungen[i].L_Strasse <> KunTabL_Strasse.AsString) or
                 (ShopRechnungen[i].L_PLZ     <> KunTabL_Plz.AsString) or
                 (ShopRechnungen[i].L_ORT     <> KunTabL_Ort.AsString) then
              begin
                 KunTab.Edit;

                 KunTabL_Anrede.AsString   :='Firma';
                 KunTabL_Name1.AsString    :=ShopRechnungen[i].L_Name;
                 KunTabL_Name2.AsString    :='';
                 KunTabL_Strasse.AsString  :=ShopRechnungen[i].L_Strasse;
                 KunTabL_Plz.AsString      :=ShopRechnungen[i].L_PLZ;
                 KunTabL_Ort.AsString      :=ShopRechnungen[i].L_ORT;

                 KunTab.Post;
              end;
           end
              else
           begin
              if (ShopRechnungen[i].L_Firma   <> KunTabL_Name1.AsString) or
                 (ShopRechnungen[i].L_Name    <> KunTabL_Name2.AsString) or
                 (ShopRechnungen[i].L_Strasse <> KunTabL_Strasse.AsString) or
                 (ShopRechnungen[i].L_PLZ     <> KunTabL_Plz.AsString) or
                 (ShopRechnungen[i].L_ORT     <> KunTabL_Ort.AsString) then
              begin
                 KunTab.Edit;

                 KunTabL_Anrede.AsString   :='';
                 KunTabL_Name1.AsString    :=ShopRechnungen[i].L_Firma;
                 KunTabL_Name2.AsString    :=ShopRechnungen[i].L_Name;
                 KunTabL_Strasse.AsString  :=ShopRechnungen[i].L_Strasse;
                 KunTabL_Plz.AsString      :=ShopRechnungen[i].L_PLZ;
                 KunTabL_Ort.AsString      :=ShopRechnungen[i].L_ORT;

                 KunTab.Post;
              end;
           end; }
           // Abweichende Lieferanschrift ?
           if (ShopRechnungen[i].R_Firma   <> ShopRechnungen[i].L_Firma)or
              (ShopRechnungen[i].R_Name    <> ShopRechnungen[i].L_Name)or
              (ShopRechnungen[i].R_Ort     <> ShopRechnungen[i].L_Ort)or
              (ShopRechnungen[i].R_PLZ     <> ShopRechnungen[i].L_PLZ)or
              (ShopRechnungen[i].R_Strasse <> ShopRechnungen[i].L_Strasse) then
           begin

              A :=''; N1 :=''; N2 :='';

              if length (ShopRechnungen[i].L_Firma)>0 then
              begin
                 A  :='Firma';
                 N1 :=ShopRechnungen[i].L_Firma;
                 N2 :=ShopRechnungen[i].L_Name;
              end
              else N1 :=ShopRechnungen[i].L_Name;

              //KunTabL_Strasse.AsString    :=ShopRechnungen[i].L_Strasse;
              //KunTabL_Plz.AsString        :=ShopRechnungen[i].L_PLZ;
              //KunTabL_Ort.AsString        :=ShopRechnungen[i].L_ORT;

              LID :=UpdateLieferAnschrift (KunTabRec_ID.AsInteger, A, N1, N2,
                                           ShopRechnungen[i].L_Strasse,
                                           ShopRechnungen[i].L_Land,
                                           ShopRechnungen[i].L_PLZ,
                                           ShopRechnungen[i].L_Ort);

           end;


           // Liefer- unf Zahlart prüfen
           if (
               (length(ShopRechnungen[i].PaymentClass)>0) and
               (KunTabKun_Zahlart.Value<>MapZahlArt (UpperCase(ShopRechnungen[i].PaymentClass)))
              )
               or
              (
               (length(ShopRechnungen[i].ShippingClass)>0) and
               (KunTabKun_Liefart.Value<>MapLiefArt (UpperCase(ShopRechnungen[i].ShippingClass)))
              ) then
           begin
              KunTab.Edit;

              KunTabKun_Zahlart.Value :=MapZahlArt (UpperCase(ShopRechnungen[i].PaymentClass));
              KunTabKun_Liefart.Value :=MapLiefArt (UpperCase(ShopRechnungen[i].ShippingClass));

              KunTab.Post;
           end;
        end;



     end;

     // Rechnung anlegen

     // Kopf anlegen
     ReEdiTab.Close;
     ReEdiTab.ParamByName('QUELLE').AsInteger :=VK_RECH_EDI;
     ReEdiTab.Open;
     ReEdiTab.Append;
     try
        ReEdiTabADDR_ID.Value          :=OscReTabCaoKunID.AsInteger;
        ReEdiTabPROJEKT.AsString       :='Shop-Bestellung';
        ReEdiTabBEST_NAME.AsString     :=OscReTabName.AsString;
        ReEdiTabOrgnum.Value           :=OscReTabID.AsString;
        ReEdiTabBEST_DATUM.AsDateTime  :=OscReTabDatum.AsDateTime;
        ReEdiTabBRUTTO_FLAG.AsBoolean  :=BruttoShop;
        ReEdiTabLIEF_ADDR_ID.AsInteger :=LID;

        if length(ShopRechnungen[i].PaymentClass)>0
         then ReEdiTabZahlArt.Value :=MapZahlArt (UpperCase(ShopRechnungen[i].PaymentClass))
         else ReEdiTabZahlArt.Value :=-1;

        if length(ShopRechnungen[i].ShippingClass)>0
         then ReEdiTabLiefArt.Value :=MapLiefArt (UpperCase(ShopRechnungen[i].ShippingClass))
         else ReEdiTabLiefArt.Value :=-1;

        KunTab.Close;
        KunTab.ParamByName('ID').AsInteger :=OscReTabCaoKunID.AsInteger;
        KunTab.Open;
        if (KunTab.RecordCount=1)and
           (KunTabRec_ID.AsInteger=OscReTabCaoKunID.AsInteger) then
        begin
           ReEdiTabPR_EBENE.Value          :=DM1.AnzPreis;

           ReEdiTabSOLL_STAGE.Value        :=KunTabNET_Tage.Value;
           ReEdiTabSOLL_SKONTO.Value       :=KunTabNet_Skonto.Value;
           ReEdiTabSOLL_NTAGE.Value        :=KunTabBRT_Tage.Value;
           ReEdiTabSOLL_RATEN.Value        :=1;
           ReEdiTabSOLL_RATBETR.Value      :=0;
           ReEdiTabSOLL_RATINTERVALL.Value :=1;

           if length (ShopRechnungen[i].R_Firma)>0 then
           begin
              ReEdiTabKUN_ANREDE.AsString  :='Firma';
              ReEdiTabKUN_NAME1.AsString   :=ShopRechnungen[i].R_Firma;
              ReEdiTabKUN_NAME2.AsString   :=ShopRechnungen[i].R_Name;
           end
           else ReEdiTabKUN_NAME1.AsString :=ShopRechnungen[i].R_Name;

           ReEdiTabKUN_STRASSE.Value       :=ShopRechnungen[i].R_Strasse;
           ReEdiTabKUN_PLZ.Value           :=ShopRechnungen[i].R_PLZ;
           ReEdiTabKUN_ORT.Value           :=ShopRechnungen[i].R_Ort;

           if (uppercase (ShopRechnungen[i].R_Land)='GERMANY') or
              (uppercase (ShopRechnungen[i].R_Land)='DEUTSCHLAND')
            then ReEdiTabKUN_LAND.AsString :='D'
            else ReEdiTabKUN_LAND.AsString :=ShopRechnungen[i].R_Land;

           ReEdiTabGEGENKONTO.Value        :=KunTabDEB_NUM.Value;
           //ReEdiTabLiefart.Value           :=KunTabKun_Liefart.Value;
           //ReEdiTabZahlart.Value           :=KunTabKun_Zahlart.Value;
           ReEdiTabKUN_NUM.Value           :=KunTabKunnum1.AsString;
           ReEdiTabWAEHRUNG.Value          :=KunTabWaerung.Value;

           ReEdiTabVERTRETER_ID.Value      :=0;
           ReEdiTabGLOBRABATT.Value        :=KunTabGRabatt.Value;
           //--------------
        end;
        KunTab.Close;

        ReEdiTabSHOP_ID.AsInteger          :=ShopID;
        ReEdiTabSHOP_ORDERID.AsInteger     :=ShopRechnungen[i].Rech_ID;
        ReEdiTabSHOP_STATUS.AsInteger      :=ShopRechnungen[i].Status;

        ReEdiTabINFO.AsString              :=ShopRechnungen[i].UserKomment;


        if UseShopOrderID
         then ReEdiTabVRENUM.AsInteger :=ShopRechnungen[i].Rech_ID;

        ReEdiTab.Post;

        PosTab.Close;
        PosTab.ParamByName('ID').AsInteger :=ReEdiTabRec_ID.AsInteger;
        PosTab.Open;

        // Positionen importieren
        for j:=0 to Pred(length(ShopRechnungen[i].Pos)) do
        begin
           // Prüfen, ob artikel existiert ...
           // wenn ja, dann keinen freien Artikel
           dm1.UniQuery.close;
           dm1.UniQuery.Sql.Text :='select REC_ID, SHOP_ID,LANGNAME, '+
                                   'NO_PROVISION_FLAG, NO_VK_FLAG, SN_FLAG, '+
                                   'BARCODE, MATCHCODE, LAENGE, GROESSE, '+
                                   'DIMENSION, GEWICHT, ME_EINHEIT, '+
                                   'PR_EINHEIT, ARTIKELTYP from ARTIKEL '+
                                   ' where SHOP_ID='+IntToStr(ShopID)+
                                   ' and SHOP_ARTIKEL_ID='+
                                   InttoStr(ShopRechnungen[i].Pos[j].SArtID);
           dm1.UniQuery.Open;
           if (dm1.UniQuery.RecordCount>0)and
              (length(ShopRechnungen[i].Pos[j].Opt)=0) then
           begin
             PosTab.Append;               // normaler Artikel und keine Optionen
             try
                PosTabArtikelTyp.AsString   :=dm1.UniQuery.FieldByName('ARTIKELTYP').AsString;
                PosTabARTIKEL_ID.AsInteger  :=dm1.UniQuery.FieldByName('REC_ID').AsInteger;

                PosTabARTNUM.AsString       :=ShopRechnungen[i].Pos[j].Modell;
                PosTabMATCHCODE.AsString    :=dm1.UniQuery.FieldByName('MATCHCODE').AsString;
                PosTabBARCODE.AsString      :=dm1.UniQuery.FieldByName('BARCODE').AsString;
                PosTabLAENGE.AsString       :=dm1.UniQuery.FieldByName('LAENGE').AsString;
                PosTabGROESSE.AsString      :=dm1.UniQuery.FieldByName('GROESSE').AsString;
                PosTabDIMENSION.AsString    :=dm1.UniQuery.FieldByName('DIMENSION').AsString;
                PosTabGEWICHT.AsFloat       :=dm1.UniQuery.FieldByName('GEWICHT').AsFloat;
                PosTabME_EINHEIT.AsString   :=dm1.UniQuery.FieldByName('ME_EINHEIT').AsString;
                PosTabPR_EINHEIT.AsString   :=dm1.UniQuery.FieldByName('PR_EINHEIT').AsString;
                PosTabSN_FLAG.AsBoolean     :=dm1.UniQuery.FieldByName('SN_FLAG').AsString='Y';

                //PosTabBEZEICHNUNG.AsString  :=ShopRechnungen[i].Pos[j].Name;
                PosTabBEZEICHNUNG.AsString  :=dm1.UniQuery.FieldByName('LANGNAME').AsString;

                PosTabME_EINHEIT.AsString   :=ShopRechnungen[i].Pos[j].ME;
                PosTabPR_EINHEIT.AsInteger  :=1;

                PosTabMENGE.AsFloat         :=ShopRechnungen[i].Pos[j].Menge;

                PosTabBRUTTO_FLAG.AsBoolean :=BruttoShop;
                if BruttoShop then
                begin
                   P :=ShopRechnungen[i].Pos[j].Preis;
                   P :=round(P * (100 + ShopRechnungen[i].Pos[j].MwSt)); // jetzt ganze Chents ...
                   P :=P / 100;
                   PosTabEPREIS.AsFloat :=P;
                end
                   else
                begin
                   PosTabEPREIS.AsFloat :=ShopRechnungen[i].Pos[j].Preis;
                end;

                PosTabSTEUER_CODE.AsInteger :=ShopRechnungen[i].Pos[j].MwStID;


                PosTab.Post;
             except
                PosTab.Cancel;
             end;
           end
              else
           begin            // Freier Artikel oder Normaler Artikel mit Optionen
             PosTab.Append;
             try
                PosTabArtikelTyp.AsString   :='F';
                PosTabARTIKEL_ID.AsInteger  :=-99;

                PosTabARTNUM.AsString       :=ShopRechnungen[i].Pos[j].Modell;


                N :=ShopRechnungen[i].Pos[j].Name;


                if length(ShopRechnungen[i].Pos[j].Opt)>0 then
                // Mit Optionen
                begin
                   for k :=0 to pred(length(ShopRechnungen[i].Pos[j].Opt)) do
                   begin
                     N :=N + #13 + ShopRechnungen[i].Pos[j].Opt[k].Name+': '+
                         ShopRechnungen[i].Pos[j].Opt[k].Value;
                   end;
                end;

                PosTabBEZEICHNUNG.AsString  :=N;

                PosTabME_EINHEIT.AsString   :=ShopRechnungen[i].Pos[j].ME;
                PosTabPR_EINHEIT.AsInteger  :=1;

                PosTabMENGE.AsFloat       :=ShopRechnungen[i].Pos[j].Menge;

                PosTabBRUTTO_FLAG.AsBoolean :=BruttoShop;
                if BruttoShop then
                begin
                   P :=ShopRechnungen[i].Pos[j].Preis;
                   P :=round(P * (100 + ShopRechnungen[i].Pos[j].MwSt)); // jetzt ganze Chents ...
                   P :=P / 100;
                   PosTabEPREIS.AsFloat :=P;
                end
                   else
                begin
                   PosTabEPREIS.AsFloat :=ShopRechnungen[i].Pos[j].Preis;
                end;

                PosTabSTEUER_CODE.AsInteger :=ShopRechnungen[i].Pos[j].MwStID;

                PosTab.Post;
             except
                PosTab.Cancel;
             end;
           end;
           dm1.UniQuery.Close;
        end;

        // Versandkosten
        {
        if ShopRechnungen[i].Versandkosten<>0 then
        begin
           PosTab.Append;
           try
              PosTabArtikelTyp.AsString   :='F'; // freier Artikel
              PosTabARTIKEL_ID.AsInteger  :=-99;

              PosTabARTNUM.AsString       :='VERSANDK.';

              PosTabBEZEICHNUNG.AsString  :='Versandkosten';

              PosTabME_EINHEIT.AsString   :='';
              PosTabPR_EINHEIT.AsInteger  :=1;

              PosTabMENGE.AsInteger       :=1;
              PosTabEPREIS.AsFloat        :=ShopRechnungen[i].Versandkosten;

              PosTabSTEUER_CODE.AsInteger :=0; // MwSt-Frei !!!

              PosTab.Post;
           except
              PosTab.Cancel;
           end;
        end;  }
        PosTab.Close;
     except
        ReEdiTab.Cancel;
        ReEdiTab.Close;
        Exit;
     end;

     OscReTab.Edit;
     OscReTabImportiert.AsBoolean :=True;
     OscReTab.Post;

     OscReTab.Next;
end;

procedure TShopTransForm.ShopBestReadBtnClick(Sender: TObject);
var MyStream : tMemoryStream; quelle : Integer; error : boolean;
begin
     if length(ShopImportURL)=0 then
     begin
        MessageDlg ('Die URL für den Shopimport ist leer !'+#13#10+
                    'Siehe Datei->Einstellungen (Shop)',mterror,[mbok],0);
        exit;
     end;

     ShopArtReadBtn.Enabled :=False;
     ImportArtikelBtn.Enabled :=False;
     ImportAlleArtikelBtn.Enabled :=False;
     ArtRefreshBtn.Enabled :=False;

     ShopKatReadBtn.Enabled :=False;
     ImportKatBtn.Enabled :=False;
     KatImportAlleBtn.Enabled :=False;

     ShopBestReadBtn.Enabled :=False;
     ShopBestImpBtn.Enabled :=False;
     AlleBestImportBtn.Enabled :=False;

     ShopHerReadBtn.Enabled :=False;
     ImportHerstellerBtn.Enabled :=False;
     ImportAlleHerstellerBtn.Enabled :=False;

     try
       quelle :=-1; error :=false;
       if sender is tButton then
        case tButton(Sender).Tag of
             1 : quelle := 1; // Artikel;
             2 : quelle := 2; // Bestellungen;
             3 : quelle := 3; // Katalog
             4 : quelle := 4; // Hersteller
        end;

       if quelle < 0 then exit;

       Screen.Cursor :=crHourGlass;

       MyStream :=tMemoryStream.Create;
       try
          IdHTTP1.Request.Username          :=ShopUser;
          IdHTTP1.Request.Password          :=ShopPW;

          {.$IFDEF COMPILER_D7_UP}
          if (length(ShopUser)>0)and(length(ShopPW)>0) then
          begin
             IdHTTP1.Request.BasicAuthentication :=True;
             IdHTTP1.HttpOptions :=[hoInProcessAuth];
          end;
          IdHTTP1.ProxyParams.BasicAuthentication :=length(ProxyServer)>0;
          IdHTTP1.ProxyParams.ProxyPassword       :=ProxyPassword;
          IdHTTP1.ProxyParams.ProxyPort           :=ProxyPort;
          IdHTTP1.ProxyParams.ProxyServer         :=ProxyServer;
          IdHTTP1.ProxyParams.ProxyUsername       :=ProxyUsername;
          {.$ELSE}
          {
          IdHTTP1.Request.ProxyAuthenticate :=ProxyAuthenticate;
          IdHTTP1.Request.ProxyPassword     :=ProxyPassword;
          IdHTTP1.Request.ProxyPort         :=ProxyPort;
          IdHTTP1.Request.ProxyServer       :=ProxyServer;
          IdHTTP1.Request.ProxyUsername     :=ProxyUsername;
          }
          {.$ENDIF}
          case Quelle of
           1: begin
                 try
                    IdHTTP1.Get (ShopImportURL+'?action=products_export',MyStream);
                 except
                   on e: exception do
                     begin
                       MessageDlg ('Übertragungsfehler :'+#13#10+
                                    e.message, mterror,[mbok],0);
                       error :=true;
                     end;
                 end;
                 ProgressForm.Init ('Artikel einlesen');
              end;
           2: begin
                 try
                    if FromOrderNum.Value>0
                     then IdHTTP1.Get (ShopImportURL+'?action=orders_export&order_from='+IntToStr(round(FromOrderNum.Value)),MyStream)
                     else IdHTTP1.Get (ShopImportURL+'?action=orders_export',MyStream);
                 except
                   on e: exception do
                     begin
                       MessageDlg ('Übertragungsfehler :'+#13#10+
                                    e.message, mterror,[mbok],0);
                       error :=true;
                     end;
                 end;
                 ProgressForm.Init ('Bestellungen einlesen');
              end;
           3: begin
                 try
                    IdHTTP1.Get (ShopImportURL+'?action=categories_export',MyStream);
                 except
                   on e: exception do
                     begin
                       MessageDlg ('Übertragungsfehler :'+#13#10+
                                    e.message, mterror,[mbok],0);
                       error :=true;
                     end;
                 end;
                 ProgressForm.Init ('Katalog einlesen');
              end;
           4: begin
                 try
                    IdHTTP1.Get (ShopImportURL+'?action=manufacturers_export',MyStream);
                 except
                   on e: exception do
                     begin
                       MessageDlg ('Übertragungsfehler :'+#13#10+
                                    e.message, mterror,[mbok],0);
                       error :=true;
                     end;
                 end;
                 ProgressForm.Init ('Hersteller einlesen');
              end;
          end; //case

          Screen.Cursor :=crSqlWait;

          if not error then
          begin
            try
               LoadXML (MyStream, Quelle);
            except end;
          end;
       finally
          MyStream.Free;
       end;
       Screen.Cursor :=crDefault;
     finally

     end;
     if OscReTab.Active  then OscReTabAfterScroll  (nil);
     if OscArtTab.Active then OscArtTabAfterScroll (nil);
     if OscKatTab.Active then OscKatTabAfterScroll (nil);
     if OscHerTab.Active then OscHerTabAfterScroll (nil);

     ShopArtReadBtn.Enabled :=True;
     ShopKatReadBtn.Enabled :=True;
     ShopBestReadBtn.Enabled :=True;
     ShopHerReadBtn.Enabled :=True;

     ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TShopTransForm.ShowOrdersXML;
var ORDER_INFO,
    ORDER_HEADER,
    BILLING_ADDRESS,
    DELIVERY_ADDRESS,
    PAYMENT,
    SHIPPING,
    ORDER_PRODUCTS,
    PRODUCT,
    OPTIONEN,
    ORDER_TOTAL,
    TOTAL         : IXMLDOMNodeList;
    N             : IXMLDOMNode;
    I, J, K       : Integer;
    SRI, SPI, SOI : Integer;
    //gv_text, S    : String;
    //gv_preis      : Double;
    //V             : Char;
    tot_text      : String;
    tot_preis     : Double;
    tot_tax       : Double;
    //tot_taxid     : Integer;


begin
    OLB1.Items.Clear;
    OLog.Items.Clear;

    if length(ShopRechnungen)>0 then
    for i:=0 to length(ShopRechnungen)-1 do
    begin
       SetLength(ShopRechnungen[i].Summen,0);
       if length(ShopRechnungen[i].Pos)>0 then
         for j :=0 to length(ShopRechnungen[i].Pos)-1 do
          setlength(ShopRechnungen[i].Pos[j].Opt,0);
       SetLength(ShopRechnungen[i].Pos,0);
    end;

    SetLength (ShopRechnungen,0);

    ORDER_INFO :=FDocument.documentElement.selectNodes('ORDER_INFO');
    for I := 0 to Pred(ORDER_INFO.length) do
    begin
        SRI :=length(ShopRechnungen);
        setLength (ShopRechnungen,SRI+1); // Array um 1 vergrößern

        setLength (ShopRechnungen[SRI].Summen,0);
        setLength (ShopRechnungen[SRI].Pos,0);


        ORDER_HEADER :=ORDER_INFO.Item[I].SelectNodes('ORDER_HEADER');

        // nodes mit inhalt heranholen
        N := ORDER_HEADER.Item[0].SelectSingleNode('ORDER_ID');
        if Assigned(N) then
        begin
           OLB1.Items.Add ('Bestellung Nr.:'+N.text);
           try
              ShopRechnungen[SRI].Rech_ID :=StrToInt(N.Text);
           except
              ShopRechnungen[SRI].Rech_ID :=-1;
              OLOG.Items.Add ('Fehler beim parsen ORDER_ID');



              break; // diese Bestellung überspringen !
           end;
        end
           else
        begin
           ShopRechnungen[SRI].Rech_ID :=-1;
           break; // diese Bestellung überspringen !
        end;

        OLOG.Items.Add ('Lese Bestellung OrderID:'+Inttostr (ShopRechnungen[SRI].Rech_ID));

        N := ORDER_HEADER.Item[0].SelectSingleNode('ORDER_DATE');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9+'Datum:'+N.text);
           try
             ShopRechnungen[SRI].Datum :=SqlDateToDateTimeEx(N.Text);
           except
             ShopRechnungen[SRI].Datum :=0;
             OLOG.Items.Add ('- Fehler beim parsen ORDER_DATE');
           end;
        end
        else ShopRechnungen[SRI].Datum :=0;

        N := ORDER_HEADER.Item[0].SelectSingleNode('ORDER_STATUS');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9+'Order-Status:'+N.text);
           try
              ShopRechnungen[SRI].Status :=StrToInt(N.Text);
           except
              ShopRechnungen[SRI].Status :=-1;
              OLOG.Items.Add ('- Fehler beim parsen ORDER_STATUS');
           end;
        end
        else ShopRechnungen[SRI].Status :=-1;


        N := ORDER_HEADER.Item[0].SelectSingleNode('CUSTOMER_ID');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9+'Kunden ID:'+N.text);
           try
              ShopRechnungen[SRI].Kun_ID :=StrToInt(N.Text);
           except
              ShopRechnungen[SRI].Kun_ID :=-1;
              OLOG.Items.Add ('- Fehler beim parsen CUSTOMER_ID');
           end;
        end
        else ShopRechnungen[SRI].Kun_ID :=-1;

        N := ORDER_HEADER.Item[0].SelectSingleNode('ORDER_CURRENCY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9+'Währung:'+N.text);
           ShopRechnungen[SRI].Waehrung :=N.Text;
        end
        else ShopRechnungen[SRI].Waehrung :='';

        N := ORDER_HEADER.Item[0].SelectSingleNode('ORDER_CURRENCY_VALUE');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9+'Kurs:'+N.text);
           try
              ShopRechnungen[SRI].Kurs :=StrToFloatDefEx(N.Text,0);
           except
              ShopRechnungen[SRI].Kurs :=0;
              OLOG.Items.Add ('- Fehler beim parsen ORDER_CURRENCY_VALUE');
           end;
        end
        else ShopRechnungen[SRI].Kurs :=0;




        //----------------------------------------------------------------------
        // Rechnungsanschrift
        //----------------------------------------------------------------------

        OLB1.Items.Add ('');

        BILLING_ADDRESS :=ORDER_INFO.Item[I].SelectNodes('BILLING_ADDRESS');

        OLB1.Items.Add (#9+'Rechungsadresse:');

        // nodes mit inhalt heranholen

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('BIRTHDAY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Geburtsdatum:'+N.text);
           try
             ShopRechnungen[SRI].Kun_Gebdatum :=SqlDateToDateTimeEx(N.Text);
           except
             ShopRechnungen[SRI].Kun_Gebdatum :=0;
             OLOG.Items.Add ('- Fehler beim parsen BIRTHDAY');
           end;
        end
        else ShopRechnungen[SRI].Kun_Gebdatum :=0;

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('TELEPHONE');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Telefon:'+N.text);
           ShopRechnungen[SRI].Tele :=N.Text;
        end
        else ShopRechnungen[SRI].Tele :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('EMAIL');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'EMail:'+N.text);
           ShopRechnungen[SRI].Mail :=N.Text;
        end
        else ShopRechnungen[SRI].Mail :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('COMPANY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Firma:'+N.text);
           ShopRechnungen[SRI].R_Firma :=N.Text;
        end
        else ShopRechnungen[SRI].R_Firma :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('NAME');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Name:'+N.text);
           ShopRechnungen[SRI].R_Name :=N.Text;
        end
        else ShopRechnungen[SRI].R_Name :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('STREET');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Straße:'+N.text);
           ShopRechnungen[SRI].R_Strasse :=N.Text;
        end
        else ShopRechnungen[SRI].R_Strasse :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('ZIP');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'PLZ:'+N.text);
           ShopRechnungen[SRI].R_PLZ :=N.Text;
        end
        else ShopRechnungen[SRI].R_PLZ :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('CITY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Ort:'+N.text);
           ShopRechnungen[SRI].R_Ort :=N.Text;
        end
        else ShopRechnungen[SRI].R_Ort :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('STATE');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Bundesland:'+N.text);
           ShopRechnungen[SRI].R_BLand :=N.Text;
        end
        else ShopRechnungen[SRI].R_BLand :='';

        N := BILLING_ADDRESS.Item[0].SelectSingleNode('COUNTRY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Land:'+N.text);
           ShopRechnungen[SRI].R_Land :=N.Text;
        end
        else ShopRechnungen[SRI].R_Land :='';

        //----------------------------------------------------------------------
        // Lieferanschrift
        //----------------------------------------------------------------------

        OLB1.Items.Add ('');

        DELIVERY_ADDRESS :=ORDER_INFO.Item[I].SelectNodes('DELIVERY_ADDRESS');

        OLB1.Items.Add (#9+'Lieferadresse:');

        // nodes mit inhalt heranholen
        N := DELIVERY_ADDRESS.Item[0].SelectSingleNode('COMPANY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Firma:'+N.text);
           ShopRechnungen[SRI].L_Firma :=N.Text;
        end
        else ShopRechnungen[SRI].L_Firma :='';

        N := DELIVERY_ADDRESS.Item[0].SelectSingleNode('NAME');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Name:'+N.text);
           ShopRechnungen[SRI].L_Name :=N.Text;
        end
        else ShopRechnungen[SRI].L_Name :='';

        N := DELIVERY_ADDRESS.Item[0].SelectSingleNode('STREET');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Straße:'+N.text);
           ShopRechnungen[SRI].L_Strasse :=N.Text;
        end
        else ShopRechnungen[SRI].L_Strasse :='';

        N := DELIVERY_ADDRESS.Item[0].SelectSingleNode('ZIP');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'PLZ:'+N.text);
           ShopRechnungen[SRI].L_PLZ :=N.Text;
        end
        else ShopRechnungen[SRI].L_PLZ :='';

        N := DELIVERY_ADDRESS.Item[0].SelectSingleNode('CITY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Ort:'+N.text);
           ShopRechnungen[SRI].L_Ort :=N.Text;
        end
        else ShopRechnungen[SRI].L_Ort :='';

        N := DELIVERY_ADDRESS.Item[0].SelectSingleNode('STATE');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Bundesland:'+N.text);
           ShopRechnungen[SRI].L_BLand :=N.Text;
        end
        else ShopRechnungen[SRI].L_BLand :='';

        N := DELIVERY_ADDRESS.Item[0].SelectSingleNode('COUNTRY');
        if Assigned(N) then
        begin
           OLB1.Items.Add (#9#9+'Land:'+N.text);
           ShopRechnungen[SRI].L_Land :=N.Text;
        end
        else ShopRechnungen[SRI].L_Land :='';

        OLB1.Items.Add ('');
        OLB1.Items.Add (#9+'Positionen:');
        OLB1.Items.Add ('');


        //----------------------------------------------------------------------
        // Lieferart
        //----------------------------------------------------------------------
        OLB1.Items.Add ('');


        ShopRechnungen[SRI].ShippingMethod :='';
        ShopRechnungen[SRI].ShippingClass  :='';

        SHIPPING :=ORDER_INFO.Item[I].SelectNodes('SHIPPING');
        if (assigned(SHIPPING))and
           (Shipping.length>0) then
        begin
           N := SHIPPING.Item[0].SelectSingleNode('SHIPPING_METHOD');
           if Assigned(N) then ShopRechnungen[SRI].ShippingMethod :=N.Text;

           N := SHIPPING.Item[0].SelectSingleNode('SHIPPING_CLASS');
           if Assigned(N) then  ShopRechnungen[SRI].ShippingClass :=N.Text;
        end;


        //----------------------------------------------------------------------
        // Zahlart
        //----------------------------------------------------------------------

        ShopRechnungen[SRI].PaymentMethod  :='';
        ShopRechnungen[SRI].PaymentClass   :='';


        PAYMENT :=ORDER_INFO.Item[I].SelectNodes('PAYMENT');
        if (assigned(PAYMENT))and
           (PAYMENT.length>0) then
        begin
           N := PAYMENT.Item[0].SelectSingleNode('PAYMENT_METHOD');
           if Assigned(N) then ShopRechnungen[SRI].PaymentMethod :=N.Text;

           N := PAYMENT.Item[0].SelectSingleNode('PAYMENT_CLASS');
           if Assigned(N) then  ShopRechnungen[SRI].PaymentClass :=N.Text;


           N := PAYMENT.Item[0].SelectSingleNode('PAYMENT_BANKTRANS_STATUS');
           if Assigned(N) then
           begin
             try
                ShopRechnungen[SRI].Bank_Status :=StrToInt (N.Text);
             except
                ShopRechnungen[SRI].Bank_Status :=-1;
             end;
           end else ShopRechnungen[SRI].Bank_Status :=-1;

           N := PAYMENT.Item[0].SelectSingleNode('PAYMENT_BANKTRANS_BNAME');
           if Assigned(N) then  ShopRechnungen[SRI].BANK_NAME :=N.Text;

           N := PAYMENT.Item[0].SelectSingleNode('PAYMENT_BANKTRANS_BLZ');
           if Assigned(N) then  ShopRechnungen[SRI].BANK_BLZ :=N.Text;

           N := PAYMENT.Item[0].SelectSingleNode('PAYMENT_BANKTRANS_NUMBER');
           if Assigned(N) then  ShopRechnungen[SRI].BANK_KTO :=N.Text;

           N := PAYMENT.Item[0].SelectSingleNode('PAYMENT_BANKTRANS_OWNER');
           if Assigned(N) then  ShopRechnungen[SRI].BANK_INH :=N.Text;
        end;



        //----------------------------------------------------------------------
        // POSITIONEN
        //----------------------------------------------------------------------

        ORDER_PRODUCTS :=ORDER_INFO.Item[I].SelectNodes('ORDER_PRODUCTS');
        PRODUCT :=ORDER_PRODUCTS.Item[0].SelectNodes('PRODUCT');

        for J := 0 to Pred(PRODUCT.length) do
        begin
           SPI :=length(ShopRechnungen[SRI].Pos);
           setLength (ShopRechnungen[SRI].Pos,SPI+1); // Array um 1 vergrößern

           ShopRechnungen[SRI].Pos[SPI].ME :='Stück';

           OLB1.Items.Add (#9#9+'Position: '+Inttostr(J+1));

           N := PRODUCT.Item[J].SelectSingleNode('PRODUCTS_QUANTITY');
           if Assigned(N) then
           begin
              OLB1.Items.Add (#9#9#9+'Menge:'+N.text);
              try
                 ShopRechnungen[SRI].Pos[SPI].Menge :=StrToInt (N.Text);
              except
                 OLOG.Items.Add ('- Fehler beim parsen PRODUCTS_QUANTITY');
                 ShopRechnungen[SRI].Pos[SPI].Menge :=0;
              end;
           end
           else ShopRechnungen[SRI].Pos[SPI].Menge :=0;

           N := PRODUCT.Item[J].SelectSingleNode('PRODUCTS_MODEL');
           if Assigned(N) then
           begin
              OLB1.Items.Add (#9#9#9+'Modell:'+N.text);
              ShopRechnungen[SRI].Pos[SPI].Modell :=N.Text;
           end
           else ShopRechnungen[SRI].Pos[SPI].Modell :='';

           N := PRODUCT.Item[J].SelectSingleNode('PRODUCTS_NAME');
           if Assigned(N) then
           begin
              OLB1.Items.Add (#9#9#9+'Bezeichnung:'+N.text);
              ShopRechnungen[SRI].Pos[SPI].Name :=N.Text;
           end
           else ShopRechnungen[SRI].Pos[SPI].Name :='';

           N := PRODUCT.Item[J].SelectSingleNode('PRODUCTS_PRICE');
           if Assigned(N) then
           begin
              OLB1.Items.Add (#9#9#9+'Preis:'+N.text);
              try
                 ShopRechnungen[SRI].Pos[SPI].Preis :=StrToFloatDefEx(N.Text,0);
              except
                 ShopRechnungen[SRI].Pos[SPI].Preis :=0;
                 OLOG.Items.Add ('- Fehler beim parsen PRODUCTS_PRICE');
              end;
           end
           else ShopRechnungen[SRI].Pos[SPI].Preis :=0;

           N := PRODUCT.Item[J].SelectSingleNode('PRODUCTS_ID');
           if Assigned(N) then
           begin
              OLB1.Items.Add (#9#9#9+'Artikel-ID:'+N.text);
              try
                 ShopRechnungen[SRI].Pos[SPI].SArtID :=StrToInt(N.Text);
              except
                 ShopRechnungen[SRI].Pos[SPI].SArtID :=-1;
                 OLOG.Items.Add ('- Fehler beim parsen PRODUCTS_ID');
              end;
           end
           else ShopRechnungen[SRI].Pos[SPI].SArtID :=-1;

           N := PRODUCT.Item[J].SelectSingleNode('PRODUCTS_TAX');
           if Assigned(N) then
           begin
              OLB1.Items.Add (#9#9#9+'MwSt:'+N.text);
              try
                 ShopRechnungen[SRI].Pos[SPI].MwSt :=StrToFloatDefEx(N.Text,0);
              except
                 ShopRechnungen[SRI].Pos[SPI].MwSt :=0;
                 OLOG.Items.Add ('- Fehler beim parsen PRODUCTS_TAX');
              end;
           end
           else ShopRechnungen[SRI].Pos[SPI].MwSt :=0;

           // MwSt-Check

           ShopRechnungen[SRI].Pos[SPI].MwStID :=-1;

           for k :=0 to pred(length(dm1.mwsttab)) do
            if ShopRechnungen[SRI].Pos[SPI].MwSt=dm1.MwStTab[k]
             then begin ShopRechnungen[SRI].Pos[SPI].MwStID :=K; break; end;

           if (ShopRechnungen[SRI].Pos[SPI].MwStID<0)or
              (ShopRechnungen[SRI].Pos[SPI].MwStID>pred(length(dm1.mwsttab)))
            then OLOG.Items.Add ('-ungültige MwSt in Position '+inttostr(SPI+1));

           if J<Pred(PRODUCT.length) then OLB1.Items.Add ('');

           //-------------------------------------------------------------------
           // Optionen
           //-------------------------------------------------------------------
           OPTIONEN :=PRODUCT.Item[J].SelectNodes('OPTION');
           if (assigned(OPTIONEN)) and ((OPTIONEN.Length)>0) then
           begin
              for k:=0 to Pred(OPTIONEN.length) do
              begin
                SOI :=length(ShopRechnungen[SRI].Pos[SPI].Opt);
                setLength(ShopRechnungen[SRI].Pos[SPI].Opt, SOI+1);

                N :=OPTIONEN.Item[K].SelectSingleNode('PRODUCTS_OPTIONS');
                if Assigned(N) then
                begin
                   ShopRechnungen[SRI].Pos[SPI].Opt[SOI].Name :=N.Text;
                end
                else ShopRechnungen[SRI].Pos[SPI].Opt[SOI].Name :='';

                N :=OPTIONEN.Item[K].SelectSingleNode('PRODUCTS_OPTIONS_VALUES');
                if Assigned(N) then
                begin
                   ShopRechnungen[SRI].Pos[SPI].Opt[SOI].Value :=N.Text;
                end
                else ShopRechnungen[SRI].Pos[SPI].Opt[SOI].Value :='';

                // Preis ist bereits in den Produktpreis eingerechnet !!!!
                {
                N :=OPTIONEN.Item[K].SelectSingleNode('PRODUCTS_OPTIONS_PRICE');
                if Assigned(N) then
                begin
                   try
                      S :=N.Text;

                      if (length(S)>0)and
                         ((S[1]='+')or(S[1]='-')) then
                      begin
                        V :=S[1];
                        Delete (S,1,1);
                      end;
                      ShopRechnungen[SRI].Pos[SPI].Opt[SOI].AufPreis :=StrToFloatDefEx(S,0);
                      if V='-' then ShopRechnungen[SRI].Pos[SPI].Opt[SOI].AufPreis :=ShopRechnungen[SRI].Pos[SPI].Opt[SOI].AufPreis * -1;
                   except
                      ShopRechnungen[SRI].Pos[SPI].Opt[SOI].AufPreis :=0;
                      OLOG.Items.Add ('- Fehler beim parsen PRODUCTS_OPTIONS_PRICE');
                   end;
                end
                else ShopRechnungen[SRI].Pos[SPI].Opt[SOI].Aufpreis :=0; }


                if //(ShopRechnungen[SRI].Pos[SPI].Opt[SOI].Aufpreis=0) and
                   (ShopRechnungen[SRI].Pos[SPI].Opt[SOI].Value='') then
                // Option löschen
                begin
                     SetLength (ShopRechnungen[SRI].Pos[SPI].Opt,SOI);
                end;

              end;
              Application.ProcessMessages;
              ProgressForm.Update;
           end;
           Application.ProcessMessages;
           ProgressForm.Update;
        end;

        //----------------------------------------------------------------------
        // Versandkosten ermitteln
        //----------------------------------------------------------------------
        ORDER_TOTAL :=ORDER_INFO.Item[I].SelectNodes('ORDER_TOTAL');

        TOTAL :=ORDER_TOTAL.Item[0].SelectNodes('TOTAL');

        //ShopRechnungen[SRI].Versandkosten :=0;

        for J := 0 to Pred(TOTAL.length) do
        begin
           N := TOTAL.Item[J].SelectSingleNode('TOTAL_CLASS');
           if Assigned(N) then
           begin
              // Versandkosten
              {
              if Uppercase(N.Text)='OT_SHIPPING' then
              begin
                N := TOTAL.Item[J].SelectSingleNode('TOTAL_VALUE');
                if Assigned(N) then
                begin
                  OLB1.Items.Add ('');
                  OLB1.Items.Add (#9+'Versandkosten:'+N.text);
                  try
                     ShopRechnungen[SRI].Versandkosten :=StrToFloatDefEx(N.Text,0);
                  except
                     OLOG.Items.Add ('- Fehler beim parsen VERSANDKOSTEN');
                     ShopRechnungen[SRI].Versandkosten :=0;
                  end;
                end;
              end
                 else
              // Gutschein
              if Uppercase(N.Text)='OT_GV' then
              begin
                N := TOTAL.Item[J].SelectSingleNode('TOTAL_VALUE');
                if Assigned(N) then
                begin
                  gv_preis :=StrToFloatDefEx(N.Text,0);

                  N := TOTAL.Item[J].SelectSingleNode('TOTAL_TITLE');
                  if Assigned(N) then gv_text :=N.Text else N.Text :='???';


                  OLB1.Items.Add ('');
                  OLB1.Items.Add (#9+'Gutschein:'+FormatFloat (',#0.00',gv_preis));

                  SPI :=length(ShopRechnungen[SRI].Pos);
                  setLength (ShopRechnungen[SRI].Pos,SPI+1); // Array um 1 vergrößern

                  ShopRechnungen[SRI].Pos[SPI].Menge :=1;
                  ShopRechnungen[SRI].Pos[SPI].Name  :=gv_text;
                  ShopRechnungen[SRI].Pos[SPI].Modell :='';
                  ShopRechnungen[SRI].Pos[SPI].MwSt   :=0;
                  ShopRechnungen[SRI].Pos[SPI].MwStID :=0;
                  ShopRechnungen[SRI].Pos[SPI].Preis  :=gv_preis * -1;
                  ShopRechnungen[SRI].Pos[SPI].SArtID :=-1;

                end;
              end
                 else  }
              // alles weitere ausser Zwischensumme, MwSt und Endsumme
              // als normale Positionen anlegen
              if (Uppercase(N.Text)<>'OT_TAX') and
                 (Uppercase(N.Text)<>'OT_TOTAL') and
                 (Uppercase(N.Text)<>'OT_SUBTOTAL') then
              begin
                 N := TOTAL.Item[J].SelectSingleNode('TOTAL_VALUE');
                if Assigned(N) then
                begin
                  tot_preis :=StrToFloatDefEx(N.Text,0);

                  N := TOTAL.Item[J].SelectSingleNode('TOTAL_TITLE');
                  if Assigned(N) then tot_text :=N.Text else N.Text :='???';

                  OLB1.Items.Add ('');
                  OLB1.Items.Add (#9+tot_text+FormatFloat (',#0.00',tot_preis));

                  N := TOTAL.Item[J].SelectSingleNode('TOTAL_PREFIX');
                  if (Assigned(N))and(N.Text='-') then tot_preis :=tot_preis * -1;

                  N := TOTAL.Item[J].SelectSingleNode('TOTAL_TAX');
                  if Assigned(N)
                   then tot_tax :=StrToFloatDefEx(N.Text,0)
                   else tot_tax :=0;

                  SPI :=length(ShopRechnungen[SRI].Pos);
                  setLength (ShopRechnungen[SRI].Pos,SPI+1); // Array um 1 vergrößern

                  ShopRechnungen[SRI].Pos[SPI].Menge :=1;
                  ShopRechnungen[SRI].Pos[SPI].ME    :='';
                  ShopRechnungen[SRI].Pos[SPI].Name  :=tot_text;
                  ShopRechnungen[SRI].Pos[SPI].Modell :='';
                  ShopRechnungen[SRI].Pos[SPI].MwSt   :=tot_tax;

                  if tot_tax>0
                   then tot_preis :=tot_preis / (1+(tot_tax/100));

                  ShopRechnungen[SRI].Pos[SPI].Preis  :=tot_preis;
                  ShopRechnungen[SRI].Pos[SPI].SArtID :=-1;


                  ShopRechnungen[SRI].Pos[SPI].MwStID :=-1;

                  for k :=0 to pred(length(dm1.mwsttab)) do
                   if ShopRechnungen[SRI].Pos[SPI].MwSt=dm1.MwStTab[k]
                    then begin ShopRechnungen[SRI].Pos[SPI].MwStID :=K; break; end;

                  if (ShopRechnungen[SRI].Pos[SPI].MwStID<0)or
                     (ShopRechnungen[SRI].Pos[SPI].MwStID>pred(length(dm1.mwsttab)))
                   then OLOG.Items.Add ('-ungültige MwSt in Position '+inttostr(SPI+1));
                end;
              end;
           end;
        end;

        // User-Kommentar einlesen
        N :=ORDER_INFO.Item[I].selectSingleNode ('ORDER_COMMENTS');
        if Assigned(N)
         then ShopRechnungen[SRI].UserKomment :=N.text
         else ShopRechnungen[SRI].UserKomment :='';



        //----------------------------------------------------------------------
        // Prüfungen ...
        //----------------------------------------------------------------------

        if Uppercase(ShopRechnungen[SRI].Waehrung)<>Leitwaehrung then
        begin
           OLOG.Items.Add ('-Währung stimmt nicht mit Leitwährung überein, '+
                          'Bestellung wird übersprungen !');

           SetLength(ShopRechnungen[SRI].Summen,0);
           SetLength(ShopRechnungen[SRI].Pos,0);

           SetLength(ShopRechnungen,SRI);
        end;

        OLB1.Items.Add('');

        Application.ProcessMessages;
        ProgressForm.Update;
    end;

    SetOrdersMemTab;
end;
//------------------------------------------------------------------------------
procedure TShopTransForm.ShowProductsXML;
var PRODUCT_INFO,
    PRODUCT_DATA,
    PRODUCT_DESCRIPTION    : IXMLDOMNodeList;
    ATTRIB                 : IXMLDOMNamedNodeMap;
    N                      : IXMLDOMNode;
    I, J                   : Integer;
    SAI, STI               : Integer; // SAI=ShopArtikelIndex STI=ShopTextIndex

begin
    PLB1.Items.Clear;
    PLog.Items.Clear;

    if length(ShopArtikel)>0 then
    for i:=0 to length(ShopArtikel)-1 do
    begin
       SetLength(ShopArtikel[i].Txt,0);
    end;
    setlength(ShopArtikel,0);

    if not assigned(FDocument.documentElement) then exit;

    PRODUCT_INFO :=FDocument.documentElement.selectNodes('PRODUCT_INFO');
    for I := 0 to Pred(PRODUCT_INFO.length) do
    begin
       PRODUCT_DATA :=PRODUCT_INFO.Item[I].SelectNodes('PRODUCT_DATA');

       if assigned(PRODUCT_DATA) then
       begin
         N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_ID');
         if Assigned(N) then
         begin
            SAI :=length(ShopArtikel);
            setLength (ShopArtikel,SAI+1); // Array um 1 vergrößern
            setLength (ShopArtikel[SAI].Txt,0);

            if i < 100 then PLB1.Items.Add ('Artikel-ID:'+N.text);
            try
               ShopArtikel[SAI].ID :=StrToInt(N.Text);
               //PLOG.Items.Add ('Lese Artikel ID:'+N.Text);
            except
               PLOG.Items.Add ('- Fehler beim parsen PRODUCT_ID ('+N.Text+')');
               ShopArtikel[SAI].ID :=-1;
            end;


            N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_QUANTITY');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'Menge:'+N.text);
               try
                  ShopArtikel[SAI].Menge :=StrToInt(N.Text);
               except
                  PLOG.Items.Add ('- Fehler beim parsen PRODUCT_QUANTITY');
                  ShopArtikel[SAI].Menge :=0;
               end;
            end
            else ShopArtikel[SAI].Menge :=0;

            N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_MODEL');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'Modell:'+N.text);
               ShopArtikel[SAI].Modell :=N.Text;
            end
            else ShopArtikel[SAI].Modell :='';

            N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_IMAGE');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'Bild:'+N.text);
               ShopArtikel[SAI].Bild :=N.Text;
            end
            else ShopArtikel[SAI].Bild :='';

            N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_PRICE');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'Preis:'+N.text);
               try
                  ShopArtikel[SAI].PreisN :=StrToFloatDefEx(N.Text,0);
               except
                  PLOG.Items.Add ('- Fehler beim parsen PRODUCT_PRICE');
                  ShopArtikel[SAI].PreisN :=0;
               end;
            end
            else ShopArtikel[SAI].PreisN :=0;

            N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_WEIGHT');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'Gewicht:'+N.text);
               try
                  ShopArtikel[SAI].Gewicht :=StrToFloatDefEx(N.Text,0);
               except
                  PLOG.Items.Add ('- Fehler beim parsen PRODUCT_WEIGHT');
                  ShopArtikel[SAI].Gewicht :=0;
               end;
            end
            else ShopArtikel[SAI].Gewicht :=0;

            N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_STATUS');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'Status:'+N.text);
               try
                  ShopArtikel[SAI].Status :=StrToInt(N.Text);
               except
                  PLOG.Items.Add ('- Fehler beim parsen PRODUCT_STATUS');
                  ShopArtikel[SAI].Status :=0;
               end;
            end
            else ShopArtikel[SAI].Status :=0;

            N := PRODUCT_DATA.Item[0].SelectSingleNode('PRODUCT_TAX_CLASS_ID');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'MwSt-Klasse:'+N.text);
               try
                  ShopArtikel[SAI].MwStID :=StrToInt(N.Text);
               except
                  PLOG.Items.Add ('- Fehler beim parsen PRODUCT_TAX_CLASS_ID');
                  ShopArtikel[SAI].MwStID :=0;
               end;
            end
            else ShopArtikel[SAI].MwStID :=0;

            N := PRODUCT_DATA.Item[0].SelectSingleNode('MANUFACTURERS_ID');
            if Assigned(N) then
            begin
               if i < 100 then PLB1.Items.Add (#9+'Hersteller:'+N.text);
               try
                 if N.Text=''
                 then ShopArtikel[SAI].Hersteller :=-1
                 else ShopArtikel[SAI].Hersteller :=StrToInt(N.Text);
               except
                  PLOG.Items.Add ('- Fehler beim parsen MANUFACTURERS_ID');
                  ShopArtikel[SAI].Hersteller :=0;
               end;
            end
            else ShopArtikel[SAI].Hersteller :=0;

            if i < 100 then PLB1.Items.Add ('');

            PRODUCT_DESCRIPTION :=PRODUCT_DATA.item[0].selectNodes('PRODUCT_DESCRIPTION');

            if assigned(PRODUCT_DESCRIPTION) then
             for J :=0 to Pred(PRODUCT_DESCRIPTION.Length) do
            begin
               ATTRIB :=PRODUCT_DESCRIPTION.item[J].attributes;

               if assigned (ATTRIB) then
               begin

                 STI :=length(ShopArtikel[SAI].Txt);
                 SetLength(ShopArtikel[SAI].Txt,STI+1);


                 N :=ATTRIB.getNamedItem ('ID');
                 if Assigned(N) then
                 begin
                    if i < 100 then PLB1.Items.Add (#9#9+'Sprach-ID:'+N.text);
                    try
                       ShopArtikel[SAI].Txt[STI].SprachID :=StrToInt(N.Text);
                    except
                       ShopArtikel[SAI].Txt[STI].SprachID :=-1;
                    end;
                 end
                 else ShopArtikel[SAI].Txt[STI].SprachID :=-1;

                 N :=ATTRIB.getNamedItem ('CODE');
                 if Assigned(N) then
                 begin
                    if i < 100 then PLB1.Items.Add (#9#9+'Sprachcode:'+N.text);
                    ShopArtikel[SAI].Txt[STI].SprachCode :=N.Text;
                 end;

                 N :=ATTRIB.getNamedItem ('NAME');
                 if Assigned(N) then
                 begin
                    if i < 100 then PLB1.Items.Add (#9#9+'Sprach-Name:'+N.text);
                    ShopArtikel[SAI].Txt[STI].SprachName :=N.Text;
                 end;

                 // Produkt-Name
                 N := PRODUCT_DESCRIPTION.Item[J].SelectSingleNode('NAME');
                 if Assigned(N) then
                 begin
                    if i < 100 then PLB1.Items.Add (#9#9+'Name:'+N.text);
                    ShopArtikel[SAI].Txt[STI].Name :=N.Text;
                 end;

                 // Produkt-URL
                 N := PRODUCT_DESCRIPTION.Item[J].SelectSingleNode('URL');
                 if Assigned(N) then
                 begin
                    if i < 100 then PLB1.Items.Add (#9#9+'URL:'+N.text);
                    ShopArtikel[SAI].Txt[STI].URL :=N.Text;
                 end;

                 // Product-.Beschreibung
                 N := PRODUCT_DESCRIPTION.Item[J].SelectSingleNode('DESCRIPTION');
                 if Assigned(N) then
                 begin
                    if i < 100 then PLB1.Items.Add (#9#9+'Text:'+copy (N.text,1,250));
                    ShopArtikel[SAI].Txt[STI].Text :=N.Text;//copy (N.Text,1,33000);
                 end;

               end;
               if (j<Pred(PRODUCT_DESCRIPTION.Length))and(I<100)
                then PLB1.Items.Add ('');
            end;
         end; // Ende hat ArtikelID
         if (i< Pred(PRODUCT_INFO.length))and(i<100) then PLB1.Items.Add ('');
       end; // assigned(PRODUCT_DATA)
       Application.ProcessMessages;
       ProgressForm.Update;
    end; // end for
    SetProductsMemTab;
end;
//------------------------------------------------------------------------------
procedure TShopTransForm.ShowKatalogXML;

var CATEGORIES_DATA,
    CATEGORIES_DESCRIPTION,
    PRODUCTS                : IXMLDOMNodeList;
    ATTRIB                  : IXMLDOMNamedNodeMap;
    N                       : IXMLDOMNode;
    I, J                    : Integer;
    SKI, SDI, SAI, AID      : Integer; // SAI=ShopKatalogIndex STI=ShopDescriptionIndex

begin
    KLB1.Items.Clear;
    KLog.Items.Clear;

    if length(ShopKatalog)>0 then
    for i:=0 to length(ShopKatalog)-1 do
    begin
       SetLength(ShopKatalog[i].ProdList,0);
       SetLength(ShopKatalog[i].Descr,0);
    end;
    setlength(ShopKatalog,0);

    CATEGORIES_DATA :=FDocument.documentElement.selectNodes('CATEGORIES_DATA');
    for I := 0 to Pred(CATEGORIES_DATA.length) do
    begin
       N := CATEGORIES_DATA.Item[I].SelectSingleNode('ID');
       if Assigned(N) then
       begin
          SKI :=length(ShopKatalog);
          setLength (ShopKatalog,SKI+1); // Array um 1 vergrößern
          setLength (ShopKatalog[SKI].Descr,0);
          setLength (ShopKatalog[SKI].ProdList,0);

          KLB1.Items.Add ('Kategorie-ID:'+N.text);
          try
             ShopKatalog[SKI].ID :=StrToInt(N.Text);
             KLOG.Items.Add ('Lese Kategorie ID:'+N.Text);
          except
             KLOG.Items.Add ('- Fehler beim parsen ID');
             ShopKatalog[SKI].ID :=-1;
          end;

          N := CATEGORIES_DATA.Item[I].SelectSingleNode('PARENT_ID');
          if Assigned(N) then
          begin
             KLB1.Items.Add (#9+'Parent-ID:'+N.text);
             try
                ShopKatalog[SKI].ParentID :=StrToInt (N.Text);
             except
                ShopKatalog[SKI].ParentID :=-1;
                KLOG.Items.Add ('- Fehler beim parsen PARENT_ID');
             end;
          end else ShopKatalog[SKI].ParentID :=-1;

          N := CATEGORIES_DATA.Item[I].SelectSingleNode('SORT_ORDER');
          if Assigned(N) then
          begin
             KLB1.Items.Add (#9+'Sort-Order:'+N.text);
             try
                ShopKatalog[SKI].SortOrder :=StrToInt (N.Text);
             except
                ShopKatalog[SKI].SortOrder :=-1;
                KLOG.Items.Add ('- Fehler beim parsen SORT_ORDER');
             end;
          end else ShopKatalog[SKI].SortOrder :=-1;

          N := CATEGORIES_DATA.Item[I].SelectSingleNode('IMAGE_URL');
          if Assigned(N) then
          begin
             KLB1.Items.Add (#9+'Bild-URL:'+N.text);
             ShopKatalog[SKI].ImageURL :=N.Text;
          end else ShopKatalog[SKI].ImageURL :='';


          N := CATEGORIES_DATA.Item[I].SelectSingleNode('DATE_ADDED');
          if Assigned(N) then
          begin
             KLB1.Items.Add (#9+'Erstell-Datum:'+N.text);
             try
               ShopKatalog[SKI].DateAdded :=SqlDateToDateTimeEx(N.Text);
             except
               ShopKatalog[SKI].DateAdded :=0;
               KLOG.Items.Add ('- Fehler beim parsen DATE_ADDED');
             end;
          end
          else ShopKatalog[SKI].DateAdded :=0;

          N := CATEGORIES_DATA.Item[I].SelectSingleNode('LAST_MODIFIED');
          if Assigned(N) then
          begin
             KLB1.Items.Add (#9+'le. Änderung:'+N.text);
             try
               ShopKatalog[SKI].LastModified :=SqlDateToDateTimeEx(N.Text);
             except
               ShopKatalog[SKI].LastModified :=0;
               KLOG.Items.Add ('- Fehler beim parsen LAST_MODIFIED');
             end;
          end
          else ShopKatalog[SKI].LastModified :=0;

          //--------------------------------------------------------------------

          KLB1.Items.Add ('');

          CATEGORIES_DESCRIPTION :=CATEGORIES_DATA.item[I].selectNodes('CATEGORIES_DESCRIPTION');

          if assigned(CATEGORIES_DESCRIPTION) then
           for J :=0 to Pred(CATEGORIES_DESCRIPTION.Length) do
          begin
             ATTRIB :=CATEGORIES_DESCRIPTION.item[J].attributes;

             if assigned (ATTRIB) then
             begin

               SDI :=length(ShopKatalog[SKI].Descr);
               SetLength(ShopKatalog[SKI].Descr,SDI+1);


               N :=ATTRIB.getNamedItem ('ID');
               if Assigned(N) then
               begin
                  KLB1.Items.Add (#9#9+'Sprach-ID:'+N.text);
                  try
                     ShopKatalog[SKI].Descr[SDI].SprachID :=StrToInt(N.Text);
                  except
                     ShopKatalog[SKI].Descr[SDI].SprachID :=-1;
                  end;
               end
               else ShopKatalog[SKI].Descr[SDI].SprachID :=-1;

               N :=ATTRIB.getNamedItem ('CODE');
               if Assigned(N) then
               begin
                  KLB1.Items.Add (#9#9+'Sprachcode:'+N.text);
                  ShopKatalog[SKI].Descr[SDI].SprachCode :=N.Text;
               end;

               N :=ATTRIB.getNamedItem ('NAME');
               if Assigned(N) then
               begin
                  KLB1.Items.Add (#9#9+'Sprach-Name:'+N.text);
                  ShopKatalog[SKI].Descr[SDI].SprachName :=N.Text;
               end;

               // Kategorie-Name
               N := CATEGORIES_DESCRIPTION.Item[J].SelectSingleNode('NAME');
               if Assigned(N) then
               begin
                  KLB1.Items.Add (#9#9+'Name:'+N.text);
                  ShopKatalog[SKI].Descr[SDI].Name :=N.Text;
               end;
             end;
             if j<Pred(CATEGORIES_DESCRIPTION.Length) then KLB1.Items.Add ('');
          end;

          //--------------------------------------------------------------------

          PRODUCTS :=CATEGORIES_DATA.item[I].selectNodes('PRODUCTS');

          if assigned(PRODUCTS) then
          begin
            KLB1.Items.Add ('');

            for J :=0 to Pred(PRODUCTS.Length) do
            begin
               ATTRIB :=PRODUCTS.item[J].attributes;
               if assigned (ATTRIB) then
               begin
                 N :=ATTRIB.getNamedItem ('ID');
                 if Assigned(N) then
                 begin
                    KLB1.Items.Add (#9#9+'Artikel-ID:'+N.text);
                    try
                       AID :=StrToInt(N.Text);

                       SAI :=length(ShopKatalog[SKI].ProdList);
                       SetLength(ShopKatalog[SKI].ProdList,SAI+1);

                       ShopKatalog[SKI].ProdList[SAI] :=AID;
                    except
                       KLOG.Items.Add ('- Fehler beim parsen PRODUCTS_ID');
                    end;
                 end;
               end;
               Application.ProcessMessages;
               ProgressForm.Update;
            end;
            Application.ProcessMessages;
          end;

       end; //assign
       KLB1.Items.Add('');
       Application.ProcessMessages;
    end; //for
    if length(ShopKatalog)>0 then SetKatalogMemTab;
end;
//------------------------------------------------------------------------------
procedure TShopTransForm.ShowHerstellerXML;
var MANUFACTURERS_DATA        : IXMLDOMNodeList;
    MANUFACTURERS_DESCRIPTION : IXMLDOMNodeList;
    ATTRIB                    : IXMLDOMNamedNodeMap;
    N                         : IXMLDOMNode;
    I, J                      : Integer;
    SHI, HDI                  : Integer; // SAI=ShopHerstellerIndex STI=ShopTextIndex

begin
    HLB1.Items.Clear;
    HLog.Items.Clear;

    if length(ShopHersteller)>0 then
    for i:=0 to length(ShopHersteller)-1 do
    begin
       SetLength(ShopHersteller[i].Descr,0);
    end;
    setlength(ShopHersteller,0);

    MANUFACTURERS_DATA :=FDocument.documentElement.selectNodes('MANUFACTURERS_DATA');
    for I := 0 to Pred(MANUFACTURERS_DATA.length) do
    begin
       N := MANUFACTURERS_DATA.Item[I].SelectSingleNode('ID');
       if Assigned(N) then
       begin
          SHI :=length(ShopHersteller);
          setLength (ShopHersteller,SHI+1); // Array um 1 vergrößern
          setLength (ShopHersteller[SHI].Descr,0);
          //setLength (ShopHersteller[SHI].ProdList,0);

          HLB1.Items.Add ('Hersteller-ID:'+N.text);
          try
             ShopHersteller[SHI].ID :=StrToInt(N.Text);
             HLOG.Items.Add ('Lese Kategorie ID:'+N.Text);
          except
             HLOG.Items.Add ('- Fehler beim parsen ID');
             ShopHersteller[SHI].ID :=-1;
          end;

          N := MANUFACTURERS_DATA.Item[I].SelectSingleNode('NAME');
          if Assigned(N) then
          begin
             HLB1.Items.Add (#9+'Name:'+N.text);
             try
                ShopHersteller[SHI].Hersteller_Name :=N.Text;
             except
                ShopHersteller[SHI].Hersteller_Name :='';
                HLOG.Items.Add ('- Fehler beim parsen Name');
             end;
          end else ShopHersteller[SHI].Hersteller_Name :='';

          N := MANUFACTURERS_DATA.Item[I].SelectSingleNode('IMAGE');
          if Assigned(N) then
          begin
             HLB1.Items.Add (#9+'HERSTELLER_IMAGE:'+N.text);
             try
                ShopHersteller[SHI].HERSTELLER_IMAGE :=N.Text;
             except
                ShopHersteller[SHI].HERSTELLER_IMAGE :='';
                HLOG.Items.Add ('- Fehler beim parsen HERSTELLER_IMAGE');
             end;
          end else ShopHersteller[SHI].HERSTELLER_IMAGE :='';

          N := MANUFACTURERS_DATA.Item[I].SelectSingleNode('DATE_ADDED');
          if Assigned(N) then
          begin
             HLB1.Items.Add (#9+'Erstell-Datum:'+N.text);
             try
                ShopHersteller[SHI].DateAdded :=SqlDateToDateTimeEx(N.Text);
             except
                ShopHersteller[SHI].DateAdded :=0;
                HLOG.Items.Add ('- Fehler beim parsen DATE_ADDED');
             end;
          end
          else ShopHersteller[SHI].DateAdded :=0;

          N := MANUFACTURERS_DATA.Item[I].SelectSingleNode('LAST_MODIFIED');
          if Assigned(N) then
          begin
             HLB1.Items.Add (#9+'le. Änderung:'+N.text);
             try
               begin
               ShopHersteller[SHI].LastModified :=SqlDateToDateTimeEx(N.Text);
               end;
             except
                ShopHersteller[SHI].LastModified :=0;
                HLOG.Items.Add ('- Fehler beim parsen LAST_MODIFIED');
             end;
          end
          else ShopHersteller[SHI].LastModified :=0;

          //--------------------------------------------------------------------

          HLB1.Items.Add ('');

          MANUFACTURERS_DESCRIPTION :=MANUFACTURERS_DATA.item[I].selectNodes('MANUFACTURERS_DESCRIPTION');

          if assigned(MANUFACTURERS_DESCRIPTION) then
           for J :=0 to Pred(MANUFACTURERS_DESCRIPTION.Length) do
          begin
             ATTRIB :=MANUFACTURERS_DESCRIPTION.item[J].attributes;

             if assigned (ATTRIB) then
             begin

               HDI :=length(ShopHersteller[SHI].Descr);
               SetLength(ShopHersteller[SHI].Descr,HDI+1);

               N :=ATTRIB.getNamedItem ('ID');
               if Assigned(N) then
               begin
                  HLB1.Items.Add (#9#9+'Sprach-ID:'+N.text);
                  try
                     ShopHersteller[SHI].Descr[HDI].SprachID :=StrToInt(N.Text);
                  except
                     ShopHersteller[SHI].Descr[HDI].SprachID :=-1;
                  end;
               end
               else ShopHersteller[SHI].Descr[HDI].SprachID :=-1;

               N :=ATTRIB.getNamedItem ('CODE');
               if Assigned(N) then
               begin
                  HLB1.Items.Add (#9#9+'Sprachcode:'+N.text);
                  ShopHersteller[SHI].Descr[HDI].SprachCode :=N.Text;
               end;

               N :=ATTRIB.getNamedItem ('NAME');
               if Assigned(N) then
               begin
                  HLB1.Items.Add (#9#9+'Sprach-Name:'+N.text);
                  ShopHersteller[SHI].Descr[HDI].SprachName :=N.Text;
               end;

               N := MANUFACTURERS_DESCRIPTION.Item[J].SelectSingleNode('URL');
               if Assigned(N) then
               begin
                  HLB1.Items.Add (#9#9+'URL:'+N.text);
                  ShopHersteller[SHI].Descr[HDI].HERSTELLER_URL :=N.Text;
               end;
               N := MANUFACTURERS_DESCRIPTION.Item[J].SelectSingleNode('URL_CLICK');
               if Assigned(N) then
               begin
                  HLB1.Items.Add (#9#9+'URL-Click:'+N.text);
                  ShopHersteller[SHI].Descr[HDI].URL_CLICKED :=StrToInt(N.Text);
               end;
               N := MANUFACTURERS_DESCRIPTION.Item[J].SelectSingleNode('DATE_LAST_CLICK');
               if Assigned(N) then
               begin
                  HLB1.Items.Add (#9#9+'URL-LastClick:'+N.text);
                  ShopHersteller[SHI].Descr[HDI].DATE_LAST_CLICK :=SqlDateToDateTimeEx(N.Text);
               end;
             end;
          end;
          HLB1.Items.Add ('');
       end;
    end; // end for
    SetHerstellerMemTab;
end;
//------------------------------------------------------------------------------
procedure TShopTransForm.SetOrdersMemTab;
var SRI : Integer;
begin
     if length(ShopRechnungen)=0 then exit;

     OscReTab.DisableControls;
     OscReGrid.Enabled :=False;
     try
       if OscReTab.Active then OscReTab.Close; // alte Daten verwerfen
       OscReTab.Open;

       for SRI :=0 to Pred(length(ShopRechnungen)) do
       begin
          ProgressForm.Update;

          OscReTab.Append;

          OscReTabID.AsInteger      :=ShopRechnungen[SRI].Rech_ID;
          OscReTabKun_ID.AsInteger  :=ShopRechnungen[SRI].Kun_ID;
          OscReTabDatum.AsDateTime  :=ShopRechnungen[SRI].Datum;
          OscReTabWaehrung.AsString :=ShopRechnungen[SRI].Waehrung;
          OscReTabKurs.AsFloat      :=ShopRechnungen[SRI].Kurs;
          OscReTabFirma.AsString    :=ShopRechnungen[SRI].R_Firma;
          OscReTabName.AsString     :=ShopRechnungen[SRI].R_Name;
          OscReTabStrasse.AsString  :=ShopRechnungen[SRI].R_Strasse;
          OscReTabPLZ.AsString      :=ShopRechnungen[SRI].R_PLZ;
          OscReTabOrt.AsString      :=ShopRechnungen[SRI].R_Ort;
          OscReTabLand.AsString     :=ShopRechnungen[SRI].R_Land;

          OscReTabAnzArtikel.AsInteger :=length(ShopRechnungen[SRI].Pos);

          // Prüfen, ob bereits importiert
          dm1.UniQuery.close;
          dm1.UniQuery.Sql.Text :='select SHOP_ORDERID from JOURNAL where '+
                                  'SHOP_ID='+IntToStr(ShopID)+' and SHOP_ORDERID='+
                                  InttoStr(ShopRechnungen[SRI].Rech_ID);
          dm1.UniQuery.Open;
          OscReTabImportiert.AsBoolean :=dm1.UniQuery.RecordCount>0;
          dm1.UniQuery.Close;

          // Prüfen ob Kunde bereits existiert
          dm1.UniQuery.close;
          dm1.UniQuery.Sql.Text :='select REC_ID, SHOP_KUNDE_ID from ADRESSEN where '+
                                  'SHOP_ID='+IntToStr(ShopID)+' and SHOP_KUNDE_ID='+
                                  InttoStr(ShopRechnungen[SRI].Kun_ID);
          dm1.UniQuery.Open;
          OscReTabKundeExists.AsBoolean :=dm1.UniQuery.RecordCount>0;
          if dm1.UniQuery.RecordCount>0
           then OscReTabCaoKunID.AsInteger :=dm1.UniQuery.FieldByName ('REC_ID').AsInteger
           else OscReTabCaoKunID.AsInteger :=-1;
          dm1.UniQuery.Close;

          OscReTab.Post;

          // Selbstlernen der Shop-Class
          MapZahlArt (ShopRechnungen[SRI].PaymentClass);
          MapLiefArt (ShopRechnungen[SRI].ShippingClass);
       end;
     finally
       OscReTab.EnableControls;
       OscReGrid.Enabled :=True;
     end;
end;
//------------------------------------------------------------------------------
procedure TShopTransForm.SetProductsMemTab;
var SAI, STI : Integer;
begin
     Label8.Caption :='L1';
     if length(ShopArtikel)=0 then exit;
     Label8.Caption :='L2';
     OscArtTab.DisableControls;
     ExRxDBGrid1.Enabled :=False;

     try
       if OscArtTab.Active then OscArtTab.Close; // alte Daten verwerfen
       OscArtTab.Open;

       DM1.UniQuery.Close;
       DM1.UniQuery.Sql.Text :='SELECT REC_ID, SHOP_ARTIKEL_ID from ARTIKEL '+
                               'WHERE SHOP_ID='+IntToStr(ShopID);
       DM1.UniQuery.Open;

       for SAI :=0 to Pred(length(ShopArtikel)) do
       begin
          ProgressForm.Update;

          OscArtTab.Append;

          OscArtTabID.AsInteger     :=ShopArtikel[SAI].ID;
          OscArtTabMenge.AsFloat    :=ShopArtikel[SAI].Menge;
          OscArtTabStatus.AsInteger :=ShopArtikel[SAI].Status;
          OscArtTabMwStID.AsInteger :=ShopArtikel[SAI].MwStID;
          OscArtTabPreis.AsFloat    :=ShopArtikel[SAI].PreisN;


          OscArtTabModell.AsString  :=ShopArtikel[SAI].Modell;
          OscArtTabBild.AsString    :=ShopArtikel[SAI].Bild;

          if length(ShopArtikel[SAI].Txt)>0 then
           for STI :=0 to Pred(length(ShopArtikel[SAI].Txt)) do
          begin
             if Uppercase(ShopArtikel[SAI].Txt[STI].SprachCode)=ShopSprache then
             begin
                // max. 50 Zeichen kopieren ...
                OscArtTabTextDE.AsString :=copy (ShopArtikel[SAI].Txt[STI].Text,1,50);
             end;
          end;

          // Prüfen ob Artikel bereits existiert
          {
          dm1.UniQuery.close;
          dm1.UniQuery.Sql.Text :='select REC_ID, SHOP_ARTIKEL_ID from ARTIKEL where '+
                                  'SHOP_ID='+IntToStr(ShopID)+' and SHOP_ARTIKEL_ID='+
                                  InttoStr(ShopArtikel[SAI].ID);
          dm1.UniQuery.Open;
          OscArtTabArtikelExists.AsBoolean :=dm1.UniQuery.RecordCount>0;
          if dm1.UniQuery.RecordCount>0
           then OscArtTabCaoArtID.AsInteger :=dm1.UniQuery.FieldByName ('REC_ID').AsInteger
           else OscArtTabCaoArtID.AsInteger :=-1;
          dm1.UniQuery.Close;
          }
          if (DM1.UniQuery.Locate ('SHOP_ARTIKEL_ID',ShopArtikel[SAI].ID,[])) and
             (DM1.UniQuery.FieldByName ('SHOP_ARTIKEL_ID').AsInteger=ShopArtikel[SAI].ID) then
          begin
             OscArtTabArtikelExists.AsBoolean :=True;
             OscArtTabCaoArtID.AsInteger :=
               dm1.UniQuery.FieldByName ('REC_ID').AsInteger;
          end
             else
          begin
             OscArtTabArtikelExists.AsBoolean :=False;
             OscArtTabCaoArtID.AsInteger :=-1;
          end;



          OscArtTab.Post;
       end;
     finally
       DM1.UniQuery.Close;

       OscArtTab.EnableControls;
       ExRxDBGrid1.Enabled :=True;
       if OscArtTab.RecordCount > 0 then OscArtTabAfterScroll(nil);
     end;
end;
//------------------------------------------------------------------------------
procedure TShopTransForm.SetKatalogMemTab;
var SKI, SDI : Integer;
begin
     if length(ShopKatalog)=0 then exit;

     OscKatTab.DisableControls;
     ExRxDBGrid2.Enabled :=False;

     try
       KatTab.Close;
       KatTab.ParamByName('SHOP_ID').AsInteger :=ShopID;
       KatTab.Open;

       if OscKatTab.Active then OscKatTab.Close; // alte Daten verwerfen
       OscKatTab.Open;

       for SKI :=0 to Pred(length(ShopKatalog)) do
       begin
          ProgressForm.Update;

          OscKatTab.Append;
          OscKatTabID.AsInteger            :=ShopKatalog[SKI].ID;
          OscKatTabPID.AsInteger           :=ShopKatalog[SKI].ParentID;
          OscKatTabImportiert.AsBoolean    :=False;
          OscKatTabSortOrder.AsInteger     :=ShopKatalog[SKI].SortOrder;
          OscKatTabDateAdded.AsDateTime    :=ShopKatalog[SKI].DateAdded;
          OscKatTabLastModified.AsDateTime :=ShopKatalog[SKI].LastModified;
          OscKatTabImageURL.AsString       :=ShopKatalog[SKI].ImageUrl;

          if length(ShopKatalog[SKI].Descr)>0 then
           for SDI :=0 to Pred(length(ShopKatalog[SKI].Descr)) do
          begin
             if uppercase(ShopKatalog[SKI].Descr[SDI].SprachCode)=ShopSprache
              then OscKatTabName.AsString :=ShopKatalog[SKI].Descr[SDI].Name;
          end;

          if (KatTab.RecordCount>0)and
             (KatTab.Locate('ID',ShopKatalog[SKI].ID,[]))and
             (KatTabID.AsInteger=ShopKatalog[SKI].ID)
            then OscKatTabExists.AsBoolean :=True;

          OscKatTab.Post;
       end;
       KatTab.Close;
     finally
       OscKatTab.EnableControls;
       ExRxDBGrid2.Enabled :=True;
       if OscKatTab.RecordCount > 0 then OscKatTabAfterScroll(nil);
     end;
end;
//------------------------------------------------------------------------------
procedure TShopTransForm.SetHerstellerMemTab;
var SHI, HDI : Integer;
begin
     if length(ShopHersteller)=0 then exit;

     OscHerTab.DisableControls;
     ExRxDBGridHersteller.Enabled :=False;

     try
       if OscHerTab.Active then OscHerTab.Close; // alte Daten verwerfen
       OscHerTab.Open;

       HerTab.Close;
       HerTab.ParamByName('SID').AsInteger :=ShopID;
       HerTab.Open;

       for SHI :=0 to Pred(length(ShopHersteller)) do
       begin
          ProgressForm.Update;

          OscHerTab.Append;
          OscHerTabID.AsInteger              :=ShopHersteller[SHI].ID;
          OscHerTabImportiert.AsBoolean      :=False;
          OscHerTabDateAdded.AsDateTime      :=ShopHersteller[SHI].DateAdded;
          OscHerTabLastModified.AsDateTime   :=ShopHersteller[SHI].LastModified;
          OscHerTabHERSTELLER_NAME.AsString  :=ShopHersteller[SHI].HERSTELLER_NAME;
          OscHerTabHERSTELLER_IMAGE.AsString :=ShopHersteller[SHI].HERSTELLER_IMAGE;

          if length(ShopHersteller[SHI].Descr)>0 then
           for HDI :=0 to Pred(length(ShopHersteller[SHI].Descr)) do
          begin
             if uppercase(ShopHersteller[SHI].Descr[HDI].SprachCode)=ShopSprache
              then OscHerTabHERSTELLER_URL.AsString :=ShopHersteller[SHI].Descr[HDI].HERSTELLER_URL;
          end;

          if (HerTab.RecordCount>0)and
             (HerTab.Locate('HERSTELLER_ID',ShopHersteller[SHI].ID,[]))and
             (HerTabHERSTELLER_ID.AsInteger=ShopHersteller[SHI].ID)
            then OscHerTabExists.AsBoolean :=True;


          {HerTab.Close;
          HerTab.ParamByName('SID').AsInteger :=ShopID;
          HerTab.ParamByName('HID').AsInteger :=ShopHersteller[SHI].ID;
          HerTab.Open;

          if (HerTab.RecordCount=1)and
             (HerTabHERSTELLER_ID.AsInteger=ShopHersteller[SHI].ID) then
          begin
             OscHerTabExists.AsBoolean      :=True;
          end;
          HerTab.Close; }

          OscHerTab.Post;
       end;
       HerTab.Close;
     finally
       OscHerTab.EnableControls;
       ExRxDBGridHersteller.Enabled :=True;
       if OscHerTab.RecordCount > 0 then OscHerTabAfterScroll(nil);
     end;
end;

procedure TShopTransForm.LoadXML(var Stream: TMemoryStream; quelle: Integer);
begin

end;

function TShopTransForm.UpdateData(var Error: Integer; var NewID: Integer;
  var Msg, Action: String; Data, Par: String): Boolean;
var MyStream : tMemoryStream;
    Params   : tStringStream;
    err      : boolean;
    //fn,
    s        : string;
    o        : dword;
    I        : Integer;
    buf      : char;
    //STATUS,
    STAT_DA  : IXMLDOMNodeList;
    N        : IXMLDOMNode;
begin
     Err      :=False;
     NewID    :=-1;
     MyStream :=tMemoryStream.Create;
     Params   :=TStringStream.create('');
     try
        IdHTTP1.Request.Username          :=ShopUser;
        IdHTTP1.Request.Password          :=ShopPW;

        IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';

        Params.WriteString (par); Params.Position :=0;

        AddLog (#13#10+FormatDateTime ('hh:mm:ss',now)+'  CAO->SHOP URL:'+ShopUpdateURL+Data+#13#10+'DATA:'+Par);


        {.$IFDEF COMPILER_D7_UP}
        if (length(ShopUser)>0)and(length(ShopPW)>0) then
        begin
             IdHTTP1.Request.BasicAuthentication :=True;
             IdHTTP1.HttpOptions :=[hoInProcessAuth];
        end;
        IdHTTP1.ProxyParams.BasicAuthentication :=length(ProxyServer)>0;
        IdHTTP1.ProxyParams.ProxyPassword       :=ProxyPassword;
        IdHTTP1.ProxyParams.ProxyPort           :=ProxyPort;
        IdHTTP1.ProxyParams.ProxyServer         :=ProxyServer;
        IdHTTP1.ProxyParams.ProxyUsername       :=ProxyUsername;
        {.$ELSE}
        {
        IdHTTP1.Request.ProxyAuthenticate :=ProxyAuthenticate;
        IdHTTP1.Request.ProxyPassword     :=ProxyPassword;
        IdHTTP1.Request.ProxyPort         :=ProxyPort;
        IdHTTP1.Request.ProxyServer       :=ProxyServer;
        IdHTTP1.Request.ProxyUsername     :=ProxyUsername;
        }
        {.$ENDIF}

        try
           IdHTTP1.Post (ShopUpdateURL+Data,Params,MyStream);
        except
           on e: exception do
           begin
              Msg :='Übertragungsfehler :'+e.message;
              err :=true;
           end;
        end;

        if not err then
        begin
          try
             // XML-Antwort parsen

             // XML COM Interface laden
             try
                FDocument := CoDOMDocument40.Create;
             except
                on e : exception do
                begin
                 ShowMessage('Fehler beim erzeugen des XML-Objektes !'+#13#10+
                             e.message);
                 err :=true;
                 msg :=e.message;
                 error :=-1;
                 AddLog (#13#10+FormatDateTime ('hh:mm:ss',now)+'  SHOP->CAO ERROR:'+e.message);
                 exit;
                end;
             end;

             // Debug, XML speichern
             MyStream.Position :=0;

             MyStream.Position :=0;
             S :='';
             for i:=0 to MyStream.Size-1 do
             begin
               MyStream.Read (buf,1);
               S :=S+Buf;
             end;

             o :=gettickcount64; // akt. zeit merken

             if assigned(FDocument) then
             begin
               FDocument.loadXML (S);
               begin
                  // Fehler überprüfen
                  if FDocument.parseError.errorCode <> 0 then
                  begin
                    ShowMessage('XML Fehler: '#13#10 + FDocument.parseError.reason);
                    msg :='XML Fehler: '+ FDocument.parseError.reason;
                    err :=true;
                    error :=-1;
                    AddLog (#13#10+FormatDateTime ('hh:mm:ss',now)+'  SHOP->CAO ERROR:'+'XML Fehler: '+ FDocument.parseError.reason);

                    AddLog (#13#10+FormatDateTime ('hh:mm:ss',now)+'  SHOP->CAO  INPUT:'+S);
                    exit;
                  end
                   else
                  begin
                    //Loggen
                    AddLog (FormatDateTime ('hh:mm:ss',now)+'  SHOP->CAO'+#13#10+S);
                    // XML auswerten
                    STAT_DA :=FDocument.documentElement.selectNodes('STATUS_DATA');
//                    STAT_DA :=Status.item[0].selectNodes('STATUS_DATA');
                    if (assigned(Stat_da))and(STAT_Da.length>0) then
                    begin
                      N := STAT_DA.Item[0].SelectSingleNode('CODE');
                      if Assigned(N) then
                      begin
                         try
                            Error :=StrToInt(N.Text);
                         except
                            Error :=-1;
                         end;
                      end
                      else Error :=-1;

                      N := STAT_DA.Item[0].SelectSingleNode('MESSAGE');
                      if Assigned(N) then Msg :=N.Text
                                     else Msg :='';

                      N := STAT_DA.Item[0].SelectSingleNode('ACTION');
                      if Assigned(N) then Action :=N.Text
                                     else Action :='';

                      N := STAT_DA.Item[0].SelectSingleNode('MODE');
                      if Assigned(N)
                       then Msg :=Msg+' MODE:'+N.Text;

                      N := STAT_DA.Item[0].SelectSingleNode('PRODUCTS_ID');
                      if Assigned(N) then
                      begin
                         try
                            NewID :=StrToInt(N.Text);
                         except
                            NewID :=-1;
                         end;
                      end;
                    end;
                  end;
               end;
               //else ShowMessage('Fehler beim laden des DOMDocument');
             end;
          except end;
        end;
     finally
        MyStream.Free;
     end;
     if err then error :=-1;
end;

procedure TShopTransForm.AddLog(S: String);
var d : string;
    f : textfile;
    i : integer;
begin
     d :=DM1.LogDir+'cao_shoptrans_'+formatdatetime ('dd_mm_yyyy',now)+'.log';

     // Unix To Dos Konvertieren (NL -> NL,LF)
     if length(s)>0 then
     begin
      i :=0;
      while i<length(s) do
      begin
         inc(i);
         if (i>1) and (s[i]=#10) and (s[i-1]<>#13)
           then begin insert (#13,s,i); inc(i); end;
      end;
     end;

     if not fileexists (d) then fileclose (filecreate (d));
     assignfile (F,D);
     append (f);
     try
        writeln (f,S);
     finally
        closefile (f);
     end;
end;

function TShopTransForm.MapLiefArt(Art: String): Integer;
begin
    Result :=-1;
    if length(Art)=0 then exit;

    dm1.uniquery.close;
    dm1.uniquery.Sql.clear;
    dm1.uniquery.sql.add ('select VAL_INT as ID');
    dm1.uniquery.sql.add ('from REGISTERY');
    dm1.uniquery.sql.add ('where MAINKEY="SHOP\\LIEFART_MAP" and ');
    dm1.uniquery.sql.add ('Upper(NAME) ="'+Art+'"');
    dm1.uniquery.Open;

    if dm1.uniquery.RecordCount=1 then
    begin
      Result :=dm1.uniquery.FieldByName ('ID').AsInteger;
    end
       else
    begin
       dm1.uniquery.close;
       dm1.uniquery.Sql.clear;
       dm1.uniquery.sql.add ('INSERT INTO REGISTERY');
       dm1.uniquery.sql.add ('SET MAINKEY="SHOP\\LIEFART_MAP", ');
       dm1.uniquery.sql.add ('NAME =UPPER("'+Art+'")');
       dm1.uniquery.execsql;
    end;
    dm1.uniquery.close;
end;

function TShopTransForm.MapZahlArt(Art: String): Integer;
begin
    Result :=-1;
    if length(Art)=0 then exit;

    dm1.uniquery.close;
    dm1.uniquery.Sql.clear;
    dm1.uniquery.sql.add ('select VAL_INT as ID');
    dm1.uniquery.sql.add ('from REGISTERY');
    dm1.uniquery.sql.add ('where MAINKEY="SHOP\\ZAHLART_MAP" and ');
    dm1.uniquery.sql.add ('Upper(NAME) ="'+Art+'"');
    dm1.uniquery.Open;

    if dm1.uniquery.RecordCount=1 then
    begin
      Result :=dm1.uniquery.FieldByName ('ID').AsInteger;
    end
       else
    begin
       dm1.uniquery.close;
       dm1.uniquery.Sql.clear;
       dm1.uniquery.sql.add ('INSERT INTO REGISTERY');
       dm1.uniquery.sql.add ('SET MAINKEY="SHOP\\ZAHLART_MAP", ');
       dm1.uniquery.sql.add ('NAME =UPPER("'+Art+'")');
       dm1.uniquery.execsql;
    end;
    dm1.uniquery.close;
end;

function TShopTransForm.UpdateLieferAnschrift(Addr_ID: Integer; Anrede, Name1,
  Name2, Strasse, Land, PLZ, Ort: String): Integer;
begin
    if (uppercase (Land)='GERMANY') or
       (uppercase (Land)='DEUTSCHLAND') then Land :='D';

    KunLiefTab.Close;
    KunLiefTab.ParamByName ('AID').AsInteger    :=Addr_ID;
    KunLiefTab.ParamByName ('NAME1').AsString   :=Name1;
    KunLiefTab.ParamByName ('NAME2').AsString   :=Name2;
    KunLiefTab.ParamByName ('STRASSE').AsString :=Strasse;
    KunLiefTab.ParamByName ('LAND').AsString    :=Land;
    KunLiefTab.ParamByName ('PLZ').AsString     :=PLZ;
    KunLiefTab.ParamByName ('ORT').AsString     :=Ort;
    KunLiefTab.Open;

    if KunLiefTab.RecordCount>0 then
    begin
      Result :=KunLiefTab.FieldByName ('REC_ID').AsInteger;
    end
       else
    if KunLiefTab.RecordCount=0 then
    begin
      KunLiefTab.Append;

      KunLiefTab.FieldByName ('ADDR_ID').AsInteger :=Addr_ID;
      KunLiefTab.FieldByName ('ANREDE').AsString   :=Anrede;
      KunLiefTab.FieldByName ('NAME1').AsString    :=Name1;
      KunLiefTab.FieldByName ('NAME2').AsString    :=Name2;
      KunLiefTab.FieldByName ('STRASSE').AsString  :=Strasse;
      KunLiefTab.FieldByName ('LAND').AsString     :=Land;
      KunLiefTab.FieldByName ('PLZ').AsString      :=PLZ;
      KunLiefTab.FieldByName ('ORT').AsString      :=Ort;

      KunLiefTab.Post;
      Result :=KunLiefTab.FieldByName ('REC_ID').AsInteger;
    end
    else Result :=-1;

    KunLiefTab.Close;
end;

//------------------------------------------------------------------------------

end.

