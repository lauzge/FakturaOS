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
Modul        : CAO_HERSTELLER
Stand        : 09.02.2004
Version      : 1.2 RC3A
Beschreibung : Hersteller erstellen, bearbeiten

History :

16.08.2003 - JP Unit erstellt
09.02.2004 - Dialog überarbeitet, da nicht gespeichert wurde wenn das Name-Feld
             nicht verlassen wurde


TODO:

- Hersteller löschen

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Hersteller;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Messages, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, DBGrids, DBCtrls, Buttons, rxdbcomb, ZDataset, ZAbstractRODataset;

type

  { THerstellerForm }

  THerstellerForm = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    CaoGroupBox7: TGroupBox;
    HerstInfoUrlEdi: TDBEdit;
    DBNavigator1: TDBNavigator;
    AddBtn: TSpeedButton;
    DBText1: TDBText;
    DBText2: TDBText;
    Label76: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label77: TLabel;
    Label1: TLabel;
    SaveBtn: TSpeedButton;
    AbortBtn: TSpeedButton;
    ProdImageUploadBtn: TSpeedButton;
    SprachLB: TRxDBComboBox;
    ShopDelCB: TDBCheckBox;
    HerstNameEdi: TDBEdit;
    DBEdit4: TDBEdit;
    HerstellerGrid: TDBGrid;
    HerstellerTabADDR_ID: TZIntegerField;
    HerstellerTabCHANGE_FLAG: TZRawStringField;
    HerstellerTabDEL_FLAG: TZRawStringField;
    HerstellerTabHERSTELLER_ID: TZIntegerField;
    HerstellerTabHERSTELLER_IMAGE: TZRawStringField;
    HerstellerTabHERSTELLER_NAME: TZRawStringField;
    HerstellerTabLAST_CHANGE: TZDateTimeField;
    HerstellerTabSHOP_DATE_ADDED: TZDateTimeField;
    HerstellerTabSHOP_DATE_CHANGE: TZDateTimeField;
    HerstellerTabSHOP_ID: TZShortIntField;
    HerstInfoTabDATE_LAST_CLICK: TZDateTimeField;
    HerstInfoTabHERSTELLER_ID: TZIntegerField;
    HerstInfoTabHERSTELLER_URL: TZRawStringField;
    HerstInfoTabSHOP_ID: TZShortIntField;
    HerstInfoTabSPRACHE_ID: TZIntegerField;
    HerstInfoTabURL_CLICKED: TZIntegerField;
    ListeGB: TGroupBox;
    HerstellerDS: TDataSource;
    HerstInfoDS: TDataSource;
    MainPanel: TPanel;
    HerstellerTab: TZQuery;
    HerstInfoTab: TZQuery;
    procedure AddBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure HerstellerDSDataChange(Sender: TObject; Field: TField);
    procedure HerstellerDSStateChange(Sender: TObject);
    procedure HerstellerTabAfterScroll(DataSet: TDataSet);
    procedure HerstellerTabBeforeDelete(DataSet: TDataSet);
    procedure HerstellerTabBeforePost(DataSet: TDataSet);
    procedure HerstInfoTabAfterPost(DataSet: TDataSet);
    procedure HerstInfoTabBeforePost(DataSet: TDataSet);
    procedure ProdImageUploadBtnClick(Sender: TObject);
    procedure SprachLBChange(Sender: TObject);
  private
    { Private-Deklarationen }
    ShopID   : Integer;
    SprachID : Integer;
  public
    { Public-Deklarationen }
    procedure ShowDialog (NewShopID : Integer);
  end;

//var
//  HerstellerForm: THerstellerForm;

implementation

{$R *.frm}

uses cao_dm, CAO_ShopImageUpload, cao_progress;

{ THerstellerForm }

//------------------------------------------------------------------------------
procedure THerstellerForm.FormCreate(Sender: TObject);
begin
  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerDSDataChange(Sender: TObject; Field: TField
  );
begin
  SaveBtn.Enabled :=
     ((HerstInfoTab.Active)and(HerstInfoTab.State in [dsEdit, dsInsert]))or
     ((HerstellerTab.Active)and(HerstellerTab.State in [dsEdit, dsInsert]));

  AbortBtn.Enabled :=SaveBtn.Enabled;
  AddBtn.Enabled :=not SaveBtn.Enabled;

  HerstInfoUrlEdi.Enabled :=(HerstInfoTab.Active) and
                            (HerstellerTab.State <> dsInsert);
end;
//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerDSStateChange(Sender: TObject);
begin
  HerstellerDSDataChange(Sender,nil);
end;
//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerTabAfterScroll(DataSet: TDataSet);
begin
  if HerstInfoTab.State in [dsEdit, dsInsert] then HerstInfoTab.Post;

  HerstInfoTab.Close;

  if HerstellerTab.State=dsInsert then
  begin
     HerstInfoTab.ParamByName ('HID').AsInteger  :=-1;
     HerstInfoTab.ParamByName ('SPID').AsInteger :=-1;
     HerstInfoTab.ReadOnly :=True;
  end
     else
  begin
     HerstInfoTab.ParamByName ('HID').AsInteger :=HerstellerTabHERSTELLER_ID.AsInteger;
     HerstInfoTab.ParamByName ('SPID').AsInteger :=SprachID;
     HerstInfoTab.ReadOnly :=False;
  end;

  if HerstellerTab.RecordCount>0 then HerstInfoTab.Open;
  ProgressForm.Stop;
end;
//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerTabBeforeDelete(DataSet: TDataSet);
begin
  //

  // Hersteller-Info löschen
  // in allen Shopartikeln den Hersteller löschen
end;
//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerTabBeforePost(DataSet: TDataSet);
begin
  HerstellerTabSHOP_ID.AsInteger      :=ShopID;
  HerstellerTabLAST_CHANGE.AsDateTime :=Now;
  HerstellerTabCHANGE_FLAG.AsBoolean  :=True;
end;
//------------------------------------------------------------------------------
procedure THerstellerForm.HerstInfoTabAfterPost(DataSet: TDataSet);
begin
  ProgressForm.Stop;
end;

procedure THerstellerForm.HerstInfoTabBeforePost(DataSet: TDataSet);
begin
  HerstInfoTabSHOP_ID.AsInteger :=ShopID;
  HerstInfoTabHERSTELLER_ID.AsInteger :=HerstellerTabHERSTELLER_ID.AsInteger;
  HerstInfoTabSPRACHE_ID.AsInteger :=SprachID;
end;

procedure THerstellerForm.ProdImageUploadBtnClick(Sender: TObject);
var Name : String;
begin
     if HerstellerTabHERSTELLER_NAME.AsString='' then
     begin
        MessageDlg ('Bitte erst Herstellernamen eingeben !',mterror,[mbok],0);
        exit;
     end;

     if FileUpload.HerstellerImage (Name) then
     begin
        if not (HerstellerTab.State in [dsEdit, dsInsert]) then HerstellerTab.Edit;
        HerstellerTabHERSTELLER_IMAGE.AsString :=Name;
        HerstellerTab.Post;
     end;
     ProgressForm.Stop;
end;

procedure THerstellerForm.SprachLBChange(Sender: TObject);
begin
  SprachID :=SprachLB.ItemIndex;
  HerstellerTabAfterScroll(nil);
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if HerstInfoTab.State in [dsEdit, dsInsert] then HerstInfoTab.Post;
   if (HerstellerTab.State in [dsEdit, dsInsert]) then
   begin
     if HerstellerTabHERSTELLER_NAME.AsString=''
      then HerstellerTab.Cancel
      else HerstellerTab.Post;
   end;
end;

procedure THerstellerForm.AddBtnClick(Sender: TObject);
begin
  HerstellerTab.Append;
  HerstNameEdi.SetFocus;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.ShowDialog (NewShopID : Integer);
begin
     ShopID :=NewShopID;
     if ShopID<1 then SHOPID :=1;

     SprachID :=DM1.DefSpracheID;

     //Sprachen in Listbox füllen
//     SprachLB.Items.Clear;                //.ComboProps.ComboItems.Clear;
//     SprachLB.Values.Clear;               //.ComboProps.ComboValues.Clear;

//     DM1.SprachTab.First;
//     while not DM1.SprachTab.Eof do
//     begin
//        SprachLB.Items.Add(DM1.SprachTab.FieldByName('NAME').AsString);       //.ComboProps.ComboItems.Add  (DM1.SprachTab.FieldByName ('NAME').AsString);
//        SprachLB.Values.Add(DM1.SprachTab.FieldByName('SPRACH_ID').AsString); //.ComboProps.ComboValues.Add (DM1.SprachTab.FieldByName ('SPRACH_ID').AsString);
//
//        DM1.SprachTab.Next;
//     end;
//     SprachLB.Invalidate;                  //.CreateDropDownList;

//     SprachLB.ItemIndex :=SprachID;

     HerstellerTab.Close;
     HerstellerTab.ParamByName ('SID').AsInteger :=ShopID;
     HerstInfoTab.ParamByName ('SID').AsInteger :=ShopID;
     HerstInfoTab.ParamByName ('SPID').AsInteger :=SprachID;

     HerstellerTab.Open;

//     HerstellerGrid.RowColor1 :=DM1.C2Color;

     ShowModal;

     HerstInfoTab.Close;
     HerstellerTab.Close;
end;
//------------------------------------------------------------------------------

end.

