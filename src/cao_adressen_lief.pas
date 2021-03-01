{01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert}

unit cao_adressen_lief;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls,
  DBCtrls, DBGrids, ExtCtrls, StdCtrls, VolDBEdit, ZDataset,
  ZAbstractRODataset;

type

  { TAdressenLiefForm }

  TAdressenLiefForm = class(TForm)
    AddrGrid: TDBGrid;
    lplz: TDBComboBox;
    lort: TDBComboBox;
    lname1: TDBEdit;
    lname2: TDBEdit;
    lname3: TDBEdit;
    labteilung: TDBEdit;
    lstrasse: TDBEdit;
    lland: TDBEdit;
    DBNavigator1: TDBNavigator;
    KunLiefDS: TDataSource;
    KunLiefTab: TZQuery;
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
    Label1: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    LiefAnsrGB: TPanel;
    PC1: TPageControl;
    ListeTS: TTabSheet;
    DetailsTS: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    DetailBtn: TToolButton;
    UebernehmenBtn: TToolButton;
    ToolButton3: TToolButton;
    lanrede: TVolgaDBEdit;
    procedure AddrGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KunLiefTabAfterInsert(DataSet: TDataSet);
    procedure KunLiefTabAfterOpen(DataSet: TDataSet);
    procedure KunLiefTabBeforeDelete(DataSet: TDataSet);
    procedure KunLiefTabBeforePost(DataSet: TDataSet);
    procedure lanredeEnter(Sender: TObject);
    procedure lanredeExit(Sender: TObject);
    procedure lanredeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure lanredeKeyPress(Sender: TObject; var Key: char);
    procedure lplzButtonClick(Sender: TObject);
    procedure UebernehmenBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    AddrID : Integer;
  public
    { Public-Deklarationen }
    procedure Edit (NewAdressID : Integer);
    function Get (NewAdressID : Integer; var LiefAddrID : Integer): Boolean;
  end;

var
  AdressenLiefForm: TAdressenLiefForm;

implementation

{$R *.frm}

uses cao_dm, cao_main, cao_kunde, CAO_PLZ;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.FormCreate(Sender: TObject);
var I : Integer;
begin
     for i:=0 to PC1.PageCount-1 do PC1.Pages[i].TabVisible :=False;
     Height :=Height - 20;
     PC1.ActivePage :=PC1.Pages[0];

     if Screen.PixelsPerInch <> 96 then
     begin
       Self.ScaleBy (96, Screen.PixelsPerInch);
       Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.AddrGridDblClick(Sender: TObject);
begin
     if (PC1.ActivePage <> DetailsTS)and(KunLiefTab.RecordCount>0) then
     begin
       PC1.ActivePage :=DetailsTS;
       DetailBtn.Caption :='Liste';
       DetailBtn.ImageIndex :=5;
     end
       else
     begin
       DetailBtn.Caption :='Details';
       DetailBtn.ImageIndex :=48;
       PC1.ActivePage :=ListeTS;
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabAfterInsert(DataSet: TDataSet);
begin
     PC1.ActivePage :=DetailsTS;
     DetailBtn.Caption :='Liste';
     DetailBtn.ImageIndex :=5;
     if PC1.ActivePage=DetailsTS then lanrede.setfocus;
     KunLiefTabLAND.AsString :=DM1.LandK2;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabAfterOpen(DataSet: TDataSet);
begin
     UebernehmenBtn.Enabled :=KunLiefTab.RecordCount>0;
     DetailBtn.Enabled      :=KunLiefTab.RecordCount>0;
     if (KunLiefTab.RecordCount=0)and
        (not (KunLiefTab.State in [dsEdit, dsInsert]))
      then PC1.ActivePage :=PC1.Pages[0];
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabBeforeDelete(DataSet: TDataSet);
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
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabBeforePost(DataSet: TDataSet);
begin
     if length(KunLiefTabNAME1.AsString)=0 then
     begin
        MessageDlg ('Das Feld Name1 muß einen Wert haben !',mterror,[mbok],0);
        Abort; exit;
     end;
     if length(KunLiefTabNAME1.AsString)=0 then
     begin
        MessageDlg ('Das Feld Name1 muß einen Wert haben !',mterror,[mbok],0);
        Abort; exit;
     end;
     if length(KunLiefTabStrasse.AsString)=0 then
     begin
        MessageDlg ('Das Feld Straße muß einen Wert haben !',mterror,[mbok],0);
        Abort; exit;
     end;
     if length(KunLiefTabLand.AsString)=0 then
     begin
        MessageDlg ('Das Feld Land muß einen Wert haben !',mterror,[mbok],0);
        Abort; exit;
     end;
     if length(KunLiefTabPLZ.AsString)=0 then
     begin
        MessageDlg ('Das Feld PLZ muß einen Wert haben !',mterror,[mbok],0);
        Abort; exit;
     end;
     if length(KunLiefTabOrt.AsString)=0 then
     begin
        MessageDlg ('Das Feld Ort muß einen Wert haben !',mterror,[mbok],0);
        Abort; exit;
     end;

     KunLiefTabADDR_ID.AsInteger :=AddrID;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeEnter(Sender: TObject);
begin
     tDBEdit(sender).Color :=DM1.EditColor;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeExit(Sender: TObject);
var SLand, SOrt, SPlz, SVWahl : string;
begin
     tDBEdit(sender).Color :=clWindow;
     if (Sender is TDBComboBox)and
        (uppercase(TDBComboBox(Sender).Name)='LPLZ') and
        (KunLiefTab.State in [dsInsert]) then
     begin
        SLand  :=LLand.Text;
        SPLZ   :=LPLZ.Text;
        SOrt   :=LOrt.Text;
        SVWahl :='';

        if PLZForm.GetDataIfUniquePLZ (SLAND,SPLZ,SORT,SVWAHL) then
        begin
           KunLiefTabLand.Value  :=SLand;
           KunLiefTabPLZ.Value   :=SPLZ;
           KunLiefTabOrt.Value   :=SORT;
        end;
     end
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Shift=[]) and (key=33) then // PGUP
     begin
          KunLiefTab.Prior;
          key :=0;
     end else
     if (Shift=[]) and (key=34) then // PGDOWN
     begin
          KunLiefTab.Next;
          key :=0;
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13 then
     begin
          key :=#0;
          if uppercase(tControl(Sender).Name)='LORT'
           then LAnrede.SetFocus
           else SendMessage (Self.Handle,WM_NEXTDLGCTL,0,0);
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lplzButtonClick(Sender: TObject);
var sland,splz,sort,svwahl : string;
begin
     if not KunLiefTab.Active then exit;
     SLAND  :=LLand.Text;
     SPLZ   :=LPLZ.Text;
     SORT   :=LOrt.Text;
     SVWAHL :='';
     if PLZForm.Get(tControl(Sender).Tag,SLAND,SPLZ,SORT,SVWAHL) then
     begin
       if not (KunLiefTab.State in [dsEdit,dsInsert]) then KunLiefTab.Edit;

       KunLiefTabLand.Value  :=SLand;
       KunLiefTabPLZ.Value   :=SPLZ;
       KunLiefTabOrt.Value   :=SORT;
     end;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.UebernehmenBtnClick(Sender: TObject);
begin
     ModalResult :=mrOK;
     //Close;
end;
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.Edit (NewAdressID : Integer);
begin
//     AddrGrid.RowColor1 :=DM1.C2Color;
//     AddrGrid.EditColor :=DM1.EditColor;
//     PC1.HintColor :=Application.HintColor;
     AddrID :=NewAdressID;
     KunLiefTab.Close;
     KunLiefTab.ParamByName('ADDR_ID').AsInteger :=AddrID;
     KunLiefTab.Open;
     PC1.ActivePage :=PC1.Pages[0];
     UebernehmenBtn.Visible :=False;
     DetailBtn.Caption :='Details';
     DetailBtn.ImageIndex :=48;
     PC1.ActivePage :=ListeTS;
     ShowModal;
     KunLiefTab.Close;
end;
//------------------------------------------------------------------------------
function TAdressenLiefForm.Get (NewAdressID : Integer; var LiefAddrID : Integer): Boolean;
var Res : Integer;
begin
     Result :=False;
//     AddrGrid.RowColor1 :=DM1.C2Color;
//     AddrGrid.EditColor :=DM1.EditColor;
//     PC1.HintColor :=Application.HintColor;
     AddrID :=NewAdressID;
     KunLiefTab.Close;
     KunLiefTab.ParamByName('ADDR_ID').AsInteger :=AddrID;
     KunLiefTab.Open;
     PC1.ActivePage :=PC1.Pages[0];
     UebernehmenBtn.Visible :=True;
     DetailBtn.Caption :='Details';
     DetailBtn.ImageIndex :=48;
     PC1.ActivePage :=ListeTS;
     Res :=ShowModal;
     if Res=mrOK then
     begin
        LiefAddrID :=KunLiefTabREC_ID.AsInteger;
        Result :=True;
     end;
     KunLiefTab.Close;
end;
//------------------------------------------------------------------------------

end.

