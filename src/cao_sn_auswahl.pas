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
Modul        : CAO_SN_ERFASSEN
Stand        : 11.05.2003
Version      : 1.0.0.53
Beschreibung : Dialog Seriennummern auswahl (für Verkauf)

History :

- 11.05.2003 Unit erstellt

-------------------------------------------------------------------------------------
18.02.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_sn_auswahl;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, DBGrids, Buttons, BGRASpeedButton, ZDataset, ZAbstractRODataset;

type

  { TSNAuswahlForm }

  TSNAuswahlForm = class(TForm)
    ArtNr: TLabel;
    ArtMatch: TLabel;
    ArtBez: TLabel;
    CloseBtn: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    MidPanel: TPanel;
    SNPosGrid: TDBGrid;
    SNLagerGrid: TDBGrid;
    Label3: TLabel;
    Label2: TLabel;
    SNLagerDS: TDataSource;
    GridPanel: TPanel;
    SchnellErfassPanel: TPanel;
    SB1: TStatusBar;
    SNLagerTabLS_JOURNALPOS_ID: TZIntegerField;
    SNLagerTabLS_JOURNAL_ID: TZIntegerField;
    SNLagerTabSERNUMMER: TZRawStringField;
    SNLagerTabVK_JOURNALPOS_ID: TZIntegerField;
    SNLagerTabVK_JOURNAL_ID: TZIntegerField;
    RBtn: TSpeedButton;
    RABtn: TSpeedButton;
    LBtn: TSpeedButton;
    LABtn: TSpeedButton;
    TopPanel: TPanel;
    SNLagerTab: TZQuery;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LABtnClick(Sender: TObject);
    procedure SNLagerGridDblClick(Sender: TObject);
    procedure SNLagerGridKeyPress(Sender: TObject; var Key: char);
    procedure SNLagerTabAfterOpen(DataSet: TDataSet);
    procedure SNPosGridDblClick(Sender: TObject);
  private
    { Private-Deklarationen }
    Anzahl : Integer;
    ArtID  : Integer;
    InAdd  : Boolean;
    PosID  : Integer;
    KopfID : Integer;

    SNTab  : TZQuery;

    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
               message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    function AuswahlSN (NewAnzahl,NewArtikelID : Integer;
                        NewSNTab : TZQuery;
                        NewKopfID, NewPosID : Integer;
                        SNDataSet : tDataSource) : Boolean;
    // Liefert True, wenn die gewünschte Anzahl erfasst wurde und der Dialog
    // geschlossen wird
  end;

var
  SNAuswahlForm: TSNAuswahlForm;

implementation

{$R *.frm}

uses cao_dm;//, cao_makevkrech;

{ TSNAuswahlForm }

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.FormCreate(Sender: TObject);
begin
     if Screen.PixelsPerInch <> 96 then
     begin
       Self.ScaleBy (96, Screen.PixelsPerInch);
       Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.LABtnClick(Sender: TObject);
begin
     // Seriennummern Verweis löschen ....
     dm1.UniQuery.close;
     dm1.UniQuery.sql.text :='UPDATE ARTIKEL_SERNUM SET '+
                             'VK_JOURNALPOS_ID=-1, '+
                             'VK_JOURNAL_ID=-1, '+
                             'LS_JOURNALPOS_ID=-1, '+
                             'LS_JOURNAL_ID=-1 '+
                             'where VK_JOURNALPOS_ID='+
                             IntToStr(PosID)+
                             ' and VK_JOURNAL_ID='+IntToStr(KopfID);
     dm1.UniQuery.ExecSql;
     dm1.UniQuery.close;

     SNTab.Refresh;
     SNLagerTab.Refresh;
     SNLagerTabAfterOpen(nil);
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNLagerGridDblClick(Sender: TObject);
begin
     if SNTab.RecordCount >=Anzahl then exit;

     SNLagerTab.Edit;
     SNLagerTabVK_JOURNALPOS_ID.AsInteger :=PosID;//MakeVKReForm.PosTabREC_ID.AsInteger;
     SNLagerTabVK_JOURNAL_ID.AsInteger    :=KopfID;//MakeVKReForm.ReEdiTabRec_ID.AsInteger;
     SNLagerTab.Post;
     SNLagerTab.Refresh;

     SNTab.Refresh;
     SNLagerTabAfterOpen(nil);
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNLagerGridKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (Key=#32)or(key=#13) then
     begin
        key :=#0;
        if SNTab.RecordCount=Anzahl
         then close
         else SNLagerGridDblClick(Sender);
     end;
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNLagerTabAfterOpen(DataSet: TDataSet);
begin
     RBtn.Enabled  :=(SNLagerTab.RecordCount>0)and
                     (SNTab.RecordCount<Anzahl);
     RABtn.Enabled :=RBtn.Enabled;
     LBtn.Enabled  :=SNTab.RecordCount>0;
     LABtn.Enabled :=LBtn.Enabled;

     if SNTab.RecordCount=Anzahl
      then SB1.Panels[0].Text :='alle Seriennummern erfasst !'
      else SB1.Panels[0].Text :=Inttostr(Anzahl)+' Seriennummern benötigt, '+
                                Inttostr(SNTab.RecordCount)+' erfasst';

     if SNTab.RecordCount=Anzahl then
     begin
        Edit1.Color :=clWindow;
        //CloseBtn.Enabled :=True;
        CloseBtn.ModalResult :=mrOK;
        CloseBtn.Caption     :='OK';
        CloseBtn.Kind        :=bkOK;
     end
        else
     begin
        //CloseBtn.Enabled :=False;
        CloseBtn.ModalResult :=mrCancel;
        CloseBtn.Caption     :='Abbruch';
        CloseBtn.Kind        :=bkAbort;
     end;
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNPosGridDblClick(Sender: TObject);
begin
     if SNTab.RecordCount=0 then exit;

     SNTab.Edit;

     SNTab.FieldByName('VK_JOURNAL_ID').AsInteger :=-1;
     SNTab.FieldByName('VK_JOURNALPOS_ID').AsInteger :=-1;
     SNTab.FieldByName('LS_JOURNAL_ID').AsInteger :=-1;
     SNTab.FieldByName('LS_JOURNALPOS_ID').AsInteger :=-1;

     SNTab.Post;
     SNLagerTab.Refresh;

     SNTab.Refresh;
     SNLagerTabAfterOpen(nil)
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.FormActivate(Sender: TObject);
begin
     Edit1.SetFocus;
     Edit1Change(Sender);
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.Edit1Change(Sender: TObject);
begin
     if SNLagerTab.Locate ('SERNUMMER',Edit1.Text,[loCaseInsensitive])
      then Edit1.Color :=$00B0FFB0
      else
        if SNTab.RecordCount=Anzahl
         then Edit1.Color :=clWindow
         else Edit1.Color :=$00B0B0FF;
end;
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
        key :=#0;
        if SNTab.RecordCount=Anzahl then close;

        if SNLagerTab.Locate ('SERNUMMER',Edit1.Text,[loCaseInsensitive])
         then SNLagerGridDblClick(Sender);
        Edit1.Text :='';
     end;
end;
//------------------------------------------------------------------------------
procedure tSNAuswahlForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x:= 406;
    ptMaxTrackSize.x:= 500;
    ptMinTrackSize.y:= 298;
    ptMaxTrackSize.y:= 500;
  end;
end;
//------------------------------------------------------------------------------
function tSNAuswahlForm.AuswahlSN (NewAnzahl,NewArtikelID : Integer;
                                   NewSNTab :TZQuery;
                                   NewKopfID, NewPosID : Integer;
                                   SNDataSet : tDataSource) : Boolean;
begin
     SNTab  :=NewSNTab;
     KopfID :=NewKopfID;
     PosID  :=NewPosID;
     SNPosGrid.DataSource :=SNDataSet;

//     SNLagerGrid.RowColor1 :=DM1.C2Color;
//     SNPosGrid.RowColor1   :=DM1.C2Color;

     InAdd  :=False;

     Anzahl :=NewAnzahl;
     ArtID  :=NewArtikelID;


     DM1.Uniquery.Close;
     DM1.Uniquery.Sql.Text :='SELECT ARTNUM,MATCHCODE,BEZEICHNUNG '+
                             'FROM JOURNALPOS WHERE REC_ID='+IntToStr(PosID);
     DM1.Uniquery.Open;
     ArtNr.Caption    :=DM1.Uniquery.FieldByName('ARTNUM').AsString;
     ArtMatch.Caption :=DM1.Uniquery.FieldByName('MATCHCODE').AsString;
     ArtBez.Caption   :=DM1.Uniquery.FieldByName('BEZEICHNUNG').AsString;
     DM1.Uniquery.Close;


     SNLagerTab.Close;
     SNLagerTab.ParamByName ('AID').AsInteger :=ArtID;
     SNLagerTab.Open;

     SNLagerTabAfterOpen(nil);

     Result :=ShowModal=mrOK;

     SNLagerTab.Close;
end;
//------------------------------------------------------------------------------

end.

