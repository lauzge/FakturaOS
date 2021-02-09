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
Modul        : CAO_SHOPSETUP
Stand        : 22.07.2003
Version      : 1.1.1.11
Beschreibung : allgemeiner Shop-Setup-Dialog

History :

22.07.2003 - Unit erstellt
25.07.2003 - Shop-Warengruppe hinzugefügt
27.07.2003 - Einstellung f. Bruttoshop hinzugefügt
14.10.2003 - KL Einstellung für SHOP_VK hinzugefügt
19.02.2004 - JP Auswahl der Shopsoftware hinzugefügt (osCommerce und xtCommerce)


-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_ShopSetup;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  DBCtrls, Buttons, StdCtrls, Spin, DBGrids, DividerBevel, ZDataset,
  ZAbstractRODataset;

type

  { TShopSetupForm }

  TShopSetupForm = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ZahlartGrid: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    LiefartGrid: TDBGrid;
    DBLookupComboBox2: TDBLookupComboBox;
    ShopOrderstatusGrid: TDBGrid;
    DefDebNum: TSpinEdit;
    Bevel1: TDividerBevel;
    Label47: TLabel;
    Label46: TLabel;
    ShopImportURLEdit: TEdit;
    ShopUpdateURLEdi: TEdit;
    ShopUserEdit: TEdit;
    ShopPWEdit: TEdit;
    ProxyServer: TEdit;
    ProxyUser: TEdit;
    ProxyPass: TEdit;
    Label1: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    ProxyPort: TSpinEdit;
    UseShopCB: TCheckBox;
    BruttoCB: TCheckBox;
    UseOrderIDCB: TCheckBox;
    UseCusomerIDCB: TCheckBox;
    UpdateMengeCB: TCheckBox;
    ImportMengeCB: TCheckBox;
    StatusUpdateSM_CB: TCheckBox;
    ChangeOrderstatusCB: TCheckBox;
    SWCB: TComboBox;
    ShopPreis: TComboBox;
    NewOrderStatusLB: TComboBox;
    ShopWgr: TComboBox;
    IntegerField1: TZIntegerField;
    Label5: TLabel;
    Label2: TLabel;
    DefDebNumLab: TLabel;
    Label4: TLabel;
    ShopLiefArtMainKey: TZRawStringField;
    ShopLiefArtStringField3: TStringField;
    StringField2: TZRawStringField;
    ShopZahlArtDS: TDataSource;
    ShopLiefArtDS: TDataSource;
    Nav1: TDBNavigator;
    NavPan: TPanel;
    PC1: TPageControl;
    AllgTS: TTabSheet;
    ShopSaveBtn: TSpeedButton;
    ShopZahlArtID: TZIntegerField;
    ShopZahlArtMAINKEY: TZRawStringField;
    ShopZahlArtSHOP_CLASS: TZRawStringField;
    ShopZahlArtZahlartStr: TStringField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    UrlTS: TTabSheet;
    ShopZahlArt: TZQuery;
    ShopLiefArt: TZQuery;
    procedure ChangeOrderstatusCBClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure ShopLiefArtBeforePost(DataSet: TDataSet);
    procedure ShopSaveBtnClick(Sender: TObject);
    procedure ShopZahlArtBeforePost(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    First : Boolean;
  public
    { Public-Deklarationen }
  end;

var
  ShopSetupForm: TShopSetupForm;

implementation

{$R *.frm}

uses
  CAO_DM, CAO_MAIN;

{ TShopSetupForm }

procedure TShopSetupForm.FormCreate(Sender: TObject);
begin
  First :=True;
  Nav1.DataSource     :=nil;
  ShopOrderstatusGrid.DataSource :=nil;

  ShopSaveBtn.Left    :=3;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

procedure TShopSetupForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Nav1.DataSource     :=nil;
  ShopOrderstatusGrid.DataSource :=nil;

  ShopZahlArt.Close;
  ShopLiefArt.Close;
end;

procedure TShopSetupForm.ChangeOrderstatusCBClick(Sender: TObject);
begin
  label4.enabled :=ChangeOrderstatusCB.Checked;
  NewOrderStatusLB.Enabled :=ChangeOrderStatusCB.Checked;
end;

procedure TShopSetupForm.FormShow(Sender: TObject);
begin
//  ZahlartGrid.RowColor1          :=DM1.C2Color;
//  LiefartGrid.RowColor1          :=DM1.C2Color;
//  ShopOrderstatusGrid.RowColor1  :=DM1.C2Color;
//  ZahlartGrid.EditColor          :=DM1.EditColor;
//  LiefartGrid.EditColor          :=DM1.EditColor;
//  ShopOrderstatusGrid.EditColor  :=DM1.EditColor;
  ShopOrderstatusGrid.DataSource :=DM1.ShopOSDS;
  DM1.ShopOrderStatusTab.Open;

  PC1.ActivePage :=AllgTS;
  PC1Change(Sender);
end;

procedure TShopSetupForm.PC1Change(Sender: TObject);
var W : Integer;
begin
  Case PC1.ActivePage.Tag of
       3: begin
             Nav1.DataSource :=DM1.ShopOSDS;
          end;
       4: begin
             if not ShopLiefArt.Active then ShopLiefArt.Open;
             if not DM1.LiefartTab.Active then dm1.LiefartTab.open;
             Nav1.DataSource :=ShopLiefArtDS;
          end;
       5: begin
             if not ShopZahlArt.Active then ShopZahlArt.Open;
             if not DM1.ZahlartTab.Active then dm1.ZahlartTab.open;
             Nav1.DataSource :=ShopZahlArtDS;
          end;
  end;

  ShopSaveBtn.Visible :=PC1.ActivePage.Tag in [1,2];

  Nav1.Visible        :=PC1.ActivePage.Tag in [3,4,5];

  Nav1.VisibleButtons :=[nbFirst,nbPrior,nbNext,nbLast,nbEdit,
                         nbPost,nbCancel,nbRefresh, nbInsert];


  if PC1.ActivePage.Tag=1 then
  begin
     if not DM1.ShopOrderStatusTab.Active then DM1.ShopOrderStatusTab.Open;

     NewOrderStatusLB.Items.Clear;
     DM1.ShopOrderStatusTab.First;
     while not DM1.ShopOrderStatusTab.Eof do
     begin
        NewOrderStatusLB.Items.Add (DM1.ShopOrderStatusTabLANGBEZ.AsString);
        DM1.ShopOrderStatusTab.Next;
     end;

     ChangeOrderstatusCB.Checked :=DM1.ReadBoolean ('SHOP','UPDATEORDERSTATUS',False);
     W :=DM1.ReadInteger ('SHOP','DEFAULT_ORDERSTATUS',0);

     if DM1.ShopOrderStatusTab.Locate ('ORDERSTATUS_ID',W,[]) then
     NewOrderStatusLB.ItemIndex  :=NewOrderStatusLB.Items.IndexOf (DM1.ShopOrderStatusTabLANGBEZ.AsString);
     ChangeOrderstatusCBClick(self);

     UseShopCB.Checked         :=DM1.ReadBoolean ('SHOP','USE_SHOP',False);
     SWCB.ItemIndex            :=DM1.ReadInteger ('SHOP','TYP',0);

     StatusUpdateSM_CB.Checked :=DM1.ReadBoolean ('SHOP','UPDATEORDERSTATUS_SENDMAIL',False);
     BruttoCB.Checked          :=DM1.ReadBoolean ('SHOP','BRUTTO_SHOP',False);

     UseOrderIDCB.Checked      :=DM1.ReadBoolean ('SHOP','USE_SHOP_ORDERID',False);
     UseCusomerIDCB.Checked    :=DM1.ReadBoolean ('SHOP','USE_SHOP_CUSTOMERID',False);
     UpdateMengeCB.Checked     :=DM1.ReadBoolean ('SHOP','UPDATE_MENGE',False);

     ImportMengeCB.Checked     :=DM1.ReadBoolean ('SHOP','IMPORT_MENGE',True);

     DefDebNum.Value           :=DM1.ReadInteger ('SHOP','DEFAULT_DEBNUM',0);
     ShopPreis.ItemIndex       :=DM1.ReadInteger ('SHOP','SHOP_VK',0);

     Nav1.VisibleButtons :=[nbFirst,nbPrior,nbNext,nbLast,nbEdit,nbPost,nbCancel,nbRefresh,nbInsert,nbDelete];

     W :=DM1.ReadInteger ('SHOP','DEFAULT_WGR',0);
     ShopWgr.Items.Clear;
     if not DM1.WgrTab.Active then DM1.WgrTab.Open;
     DM1.WgrTab.First;
     While not DM1.WgrTab.Eof do
     begin
          if DM1.WgrTabID.AsInteger>0
           then ShopWgr.Items.Add (DM1.WgrTabName.AsString);

          if DM1.WgrTabID.AsInteger = W
           then ShopWgr.ItemIndex :=ShopWgr.Items.Count-1;

          DM1.WgrTab.Next;
     end;
  end;

  if PC1.ActivePage.Tag=2 then
  begin
    ShopUserEdit.Text      :=DM1.ReadString  ('SHOP','SHOPTRANS_USER','');
    ShopPWEdit.Text        :=DM1.ReadString  ('SHOP','SHOPTRANS_SECRET','');
    ShopImportURLEdit.Text :=DM1.ReadString  ('SHOP','IMPORT_URL','');
    ShopUpdateURLEdi.Text  :=DM1.ReadString  ('SHOP','UPDATE_URL','');

    ProxyPort.Value        :=DM1.ReadInteger ('SHOP','PROXY_PORT',0);
    ProxyServer.Text       :=DM1.ReadString  ('SHOP','PROXY_SERV','');
    ProxyUser.Text         :=DM1.ReadString  ('SHOP','PROXY_USER','');
    ProxyPass.Text         :=DM1.ReadString  ('SHOP','PROXY_PASS','');
  end;

  if Nav1.Visible and ShopSavebtn.Visible then ShopSaveBtn.Left :=Nav1.Left+Nav1.Width+3
  else ShopSaveBtn.Left :=Nav1.Left;
end;

procedure TShopSetupForm.ShopLiefArtBeforePost(DataSet: TDataSet);
begin
  ShopLiefArtMainKey.AsString :='SHOP\LIEFART_MAP';
end;

procedure TShopSetupForm.ShopSaveBtnClick(Sender: TObject);
var W, P : String;
begin
  if PC1.ActivePage.Tag=1 then
  begin
    DM1.WriteBoolean ('SHOP','USE_SHOP',UseShopCB.Checked);
    DM1.WriteInteger ('SHOP','TYP',SWCB.ItemIndex);

    DM1.WriteBoolean ('SHOP','UPDATEORDERSTATUS_SENDMAIL',StatusUpdateSM_CB.Checked);
    DM1.WriteBoolean ('SHOP','BRUTTO_SHOP',BruttoCB.Checked);

    DM1.WriteBoolean ('SHOP','USE_SHOP_ORDERID',UseOrderIDCB.Checked);
    DM1.WriteBoolean ('SHOP','USE_SHOP_CUSTOMERID',UseCusomerIDCB.Checked);
    DM1.WriteBoolean ('SHOP','UPDATE_MENGE',UpdateMengeCB.Checked);
    DM1.WriteInteger ('SHOP','DEFAULT_DEBNUM',Trunc(DefDebNum.Value));

    DM1.WriteBoolean ('SHOP','IMPORT_MENGE',ImportMengeCB.Checked);

    DM1.WriteInteger ('SHOP','SHOP_VK',SHOPPREIS.ItemIndex);

    W :='';
    if ShopWGR.ItemIndex>-1 then W :=ShopWgr.Items[ShopWGR.ItemIndex];

    if not DM1.WgrTab.Active then DM1.WgrTab.Open;
    DM1.WgrTab.First;
    While not DM1.WgrTab.Eof do
    begin
       if DM1.WgrTabNAME.AsString = W
        then DM1.WriteInteger ('SHOP','DEFAULT_WGR',DM1.WgrTabID.AsInteger);
       DM1.WgrTab.Next;
    end;

    DM1.WriteBoolean ('SHOP','UPDATEORDERSTATUS',ChangeOrderstatusCB.Checked);


    W :=NewOrderStatusLB.Items[NewOrderStatusLB.ItemIndex];
    if (length(W)>0)and(DM1.ShopOrderStatusTab.Locate ('LANGBEZ',W,[]))
     then DM1.WriteInteger ('SHOP',
                            'DEFAULT_ORDERSTATUS',
                            DM1.ShopOrderStatusTabORDERSTATUS_ID.AsInteger);
  end
     else
  if PC1.ActivePage.Tag=2 then // URL / PROXY
  begin
    DM1.WriteString  ('SHOP','SHOPTRANS_USER',ShopUserEdit.Text);
    DM1.WriteString  ('SHOP','SHOPTRANS_SECRET',ShopPWEdit.Text);
    DM1.WriteString  ('SHOP','IMPORT_URL',ShopImportURLEdit.Text);
    DM1.WriteString  ('SHOP','UPDATE_URL',ShopUpdateURLEdi.Text);

    DM1.WriteInteger ('SHOP','PROXY_PORT',Trunc(ProxyPort.Value));
    DM1.WriteString  ('SHOP','PROXY_SERV',ProxyServer.Text);
    DM1.WriteString  ('SHOP','PROXY_USER',ProxyUser.Text);
    DM1.WriteString  ('SHOP','PROXY_PASS',ProxyPass.Text);
  end;
end;

procedure TShopSetupForm.ShopZahlArtBeforePost(DataSet: TDataSet);
begin
  ShopZahlArtMAINKEY.AsString :='SHOP\ZAHLART_MAP';
end;

end.

