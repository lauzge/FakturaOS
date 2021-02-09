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
Modul        : CAO_MAKEEKRECH_FERTIGDLG
Stand        : 09.05.2003
Version      : 1.0.0.53
Beschreibung : EK-Erstellung / Fertigmeldungsdialog

History :

- 09.05.2003 Unit zum GNU-Source hinzugefügt

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_MakeEKRech_FertigDlg;

{$IFDEF FPC}{$mode delphi}{$ENDIF}
{$I CAO32.INC}
interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TEKRechFertigDlg }

  TEKRechFertigDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private-Deklarationen }
    VKFlag : Boolean;
  public
    { Public-Deklarationen }
    function ExecDialog (Num : Integer; var MakeVKRech : Boolean) : Boolean;
  end;

var
  EKRechFertigDlg: TEKRechFertigDlg;

implementation

{$R *.frm}

function TEKRechFertigDlg.ExecDialog (Num : Integer; var MakeVKRech : Boolean) : Boolean;
begin
     VKFlag :=False;
     Label1.Caption :='Der Beleg wurde unter der internen'+#13#10+
                      'Nummer :'+Inttostr(num)+' gespeichert.';
     ShowModal;
     MakeVKRech :=VKFlag;
     Result :=True;
end;
//------------------------------------------------------------------------------
procedure TEKRechFertigDlg.BitBtn2Click(Sender: TObject);
begin
     VKFlag :=True;
     Close;
end;
//------------------------------------------------------------------------------
procedure TEKRechFertigDlg.BitBtn1Click(Sender: TObject);
begin
     Close;
end;
//------------------------------------------------------------------------------

end.

