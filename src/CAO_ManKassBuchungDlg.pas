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
Modul        : CAO_MANKASSBUCHUNGDLG
Stand        : 09.05.2003
Version      : 1.0.0.53
Beschreibung : Dialog manuelle Kassenbuchung

History :

- 09.05.2003 Unit zum GNU-Source hinzugefügt

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_ManKassBuchungDlg;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, DBCtrls,
  StdCtrls, EuroDMEdit, rxdbdateedit;

type

  { TManKasBuchForm }

  TManKasBuchForm = class(TForm)
    AbortBtn: TBitBtn;
    BuchenBtn: TBitBtn;
    BuDatum: TRxDBDateEdit;
    ArtBuchCB: TComboBox;
    DataSource1: TDataSource;
    BelNumEdi: TDBEdit;
    Betrag: TEuroDMEdit;
    GKonto: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure ArtBuchCBChange(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure GKontoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure ShowDlg;
  end;

//var
//  ManKasBuchForm: TManKasBuchForm;

implementation

{$R *.frm}

uses CAO_DM, CAO_MAIN, CAO_VAR_CONST, ZCompatibility;

procedure TManKasBuchForm.FormCreate(Sender: TObject);
begin
     if Screen.PixelsPerInch <> 96 then
     begin
       Self.ScaleBy (96, Screen.PixelsPerInch);
       Refresh;
     end;
end;

procedure TManKasBuchForm.ArtBuchCBChange(Sender: TObject);
begin
     case ArtBuchCB.ItemIndex of
          0: begin // Privatentnahme
                DM1.KasBuchGKONTO.Value :=-1;
                DM1.KasBuchBTXT.AsString :='Privatentnahme BAR';
             end;
          1: begin // Privateinlage
                DM1.KasBuchGKONTO.Value :=-1;
                DM1.KasBuchBTXT.AsString :='Privateinlage BAR';
             end;
          2: begin // Kasse->Bank
                DM1.KasBuchGKONTO.Value :=Kasse1;
                DM1.KasBuchBTXT.AsString :='Transfer Kasse -> Bank';
             end;
          3: begin // Bank->Kasse
                DM1.KasBuchGKONTO.Value :=Kasse1;
                DM1.KasBuchBTXT.AsString :='Transfer Bank -> Kasse';
             end;
     end;
end;

procedure TManKasBuchForm.BuchenBtnClick(Sender: TObject);
var Ja,Mo,Ta : Word;
begin
     decodedate (DM1.KasBuchBDATUM.AsDateTime, Ja, Mo, Ta);
     DM1.KasBuchJAHR.Value :=ja;
     DM1.KasBuchJOURNAL_ID.Value :=-1;
     DM1.KasBuchSKONTO.Value :=0;
     DM1.KasBuchQUELLE.Value :=99;

     if (ArtBuchCB.ItemIndex in [0,2])and(DM1.KasBuchZU_ABGANG.Value>0)
      then DM1.KasBuchZU_ABGANG.Value :=DM1.KasBuchZU_ABGANG.Value * -1;

     if (ArtBuchCB.ItemIndex in [1,3])and(DM1.KasBuchZU_ABGANG.Value<0)
      then DM1.KasBuchZU_ABGANG.Value :=DM1.KasBuchZU_ABGANG.Value * -1;


     DM1.KasBuch.Post;
     Close;
end;

procedure TManKasBuchForm.GKontoChange(Sender: TObject);
begin
     BuchenBtn.Enabled :=(ArtBuchCB.ItemIndex>-1)and
                         (DM1.KasBuchGKONTO.Value<>0)and
                         (DM1.KasBuchBTXT.AsString<>'')and
                         (DM1.KasBuchZU_ABGANG.Value<>0);
end;

//------------------------------------------------------------------------------
procedure TManKasBuchForm.ShowDlg;
begin
     if DM1.LeitWaehrung='€' then Betrag.SaveWaehrung :=Euro
                                  else Betrag.SaveWaehrung :=DM;

     Betrag.ViewWaehrung :=Betrag.SaveWaehrung;

     Datasource1.DataSet :=DM1.KasBuch;
     if not dm1.kasbuch.active then dm1.kasbuch.open;
     DM1.KasBuch.Append;
     DM1.KasBuchBDATUM.Value :=TZDate(now);
     ShowModal;
     if DM1.KasBuch.State in [dsEdit, dsInsert] then DM1.KasBuch.Cancel;
     Datasource1.DataSet :=nil;
end;
//------------------------------------------------------------------------------

end.

