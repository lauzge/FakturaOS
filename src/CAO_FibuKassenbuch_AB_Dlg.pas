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
Modul        : CAO_FIBUKASSENBUCH_AB_DLG
Stand        : 01.09.2003
Version      : 1.1.2.9
Beschreibung : Kassenbuch / Dialog zum erfassen des Anfangsbestandes

History :

22.01.2003 - Version 1.0.0.49 released Jan Pokrandt
06.05.2003 - Version zum GNU-Source hinzugefügt
01.09.2003 - BUG #31 beseitigt

}

unit CAO_FibuKassenbuch_AB_Dlg;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  rxcurredit, ZDataset, ZAbstractRODataset;

type

  { TKasBuchAB }

  TKasBuchAB = class(TForm)
    AbortBtn: TBitBtn;
    BuchenBtn: TBitBtn;
    BuchText: TEdit;
    StartValEdit: TCurrencyEdit;
    KasseTab: TZQuery;
    KasseTabBDATUM: TZDateField;
    KasseTabBELEGNUM: TZRawStringField;
    KasseTabBTXT: TZRawCLobField;
    KasseTabGKONTO: TZIntegerField;
    KasseTabJAHR: TZIntegerField;
    KasseTabJOURNAL_ID: TZIntegerField;
    KasseTabQUELLE: TZIntegerField;
    KasseTabSKONTO: TZDoubleField;
    KasseTabZU_ABGANG: TZDoubleField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BuchenBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    LastSaldo : Double;
    LastJahr  : Integer;
  end;

var
  KasBuchAB: TKasBuchAB;

implementation

{$R *.frm}

uses CAO_DM;

{ TKasBuchAB }

procedure TKasBuchAB.FormShow(Sender: TObject);
begin
  Label3.Caption :='31.12.'+Inttostr(LastJahr);
  Label6.Caption :='01.01.'+Inttostr(LastJahr+1);
  Label4.Caption :=FormatFloat (',#0.00',LastSaldo);

  Label7.Caption :=DM1.LeitWaehrung;
  Label8.Caption :=DM1.LeitWaehrung;

  BuchText.Text :='Anfangsbestand '+Inttostr(LastJahr+1);

  StartValEdit.Value :=LastSaldo;
end;

procedure TKasBuchAB.BuchenBtnClick(Sender: TObject);
begin
  KasseTab.Open;
  try
    KasseTab.Append;
    KasseTabJAHR.AsInteger        :=LastJahr+1;
    KasseTabBDATUM.AsDateTime     :=EncodeDate (LastJahr+1,1,1);
    KasseTabBELEGNUM.AsString     :='-';
    KasseTabQUELLE.AsInteger      :=0;
    KasseTabJOURNAL_ID.AsInteger  :=-1;
    KasseTabGKONTO.AsInteger      :=-1; //????
    KasseTabSKONTO.AsFloat        :=0;
    KasseTabZU_ABGANG.AsFloat     :=StartValEdit.Value;
    KasseTabBTXT.AsString         :=BuchText.Text;

    KasseTab.Post;
  except
    KasseTab.Cancel;
  end;
  KasseTab.Close;
  Close;
end;

end.

