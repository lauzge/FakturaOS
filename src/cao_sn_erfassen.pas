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
Stand        : 09.05.2003
Version      : 1.0.0.53
Beschreibung : Dialog Seriennummern erfassen (für Einkauf)

History :

- 09.05.2003 Unit erstellt

-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_sn_erfassen;

{$IFDEF FPC}{$mode delphi}{$ENDIF}
{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, DB, Buttons, StdCtrls, DBGrids;

type

  { TSNErfassenForm }

  TSNErfassenForm = class(TForm)
    ArtBez: TLabel;
    ArtMatch: TLabel;
    ArtNr: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    SNGrid: TDBGrid;
    Panel3: TPanel;
    SNAdd: TEdit;
    SNAddBtn: TButton;
    SNDelBtn: TBitBtn;
    CloseBtn: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    SB1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure SNAddBtnClick(Sender: TObject);
    procedure SNAddChange(Sender: TObject);
    procedure SNAddKeyPress(Sender: TObject; var Key: char);
    procedure SNDelBtnClick(Sender: TObject);
    procedure ZMySqlQuery1AfterDelete(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    Anzahl : Integer;
    InAdd  : Boolean;

    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
               message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    function ErfasseSN ( NewAnzahl : Integer) : Boolean;
    // Liefert True, wenn die gewünschte Anzahl erfasst wurde und der Dialog
    // geschlossen wird
  end;

var
  SNErfassenForm: TSNErfassenForm;

implementation

{$R *.frm}

uses CAO_MakeEKRech, CAO_DM;

{ TSNErfassenForm }

//------------------------------------------------------------------------------
procedure TSNErfassenForm.FormCreate(Sender: TObject);
begin
     if Screen.PixelsPerInch <> 96 then
     begin
       Self.ScaleBy (96, Screen.PixelsPerInch);
       Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TSNErfassenForm.Panel1Resize(Sender: TObject);
begin
     CloseBtn.Left :=Panel1.Width - 5 - CloseBtn.Width;
     ArtBez.Width  :=Panel3.Width - 5 - ArtBez.Left;
end;
//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNAddBtnClick(Sender: TObject);
begin
     InAdd :=True;
     MakeEKReForm.SNTab.Append;
     try
       MakeEKReForm.SNTabSERNUMMER.AsString :=SNAdd.Text;
       MakeEKReForm.SNTab.Post;

       SNAdd.Text :='';

     except
       MakeEKReForm.SNTab.Cancel;
     end;
     InAdd :=False;
     SNAddChange(Sender);
end;
//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNAddChange(Sender: TObject);
var OK : Boolean;
begin
     OK :=(Length (SNAdd.Text)>0)and
          (not MakeEKReForm.SNTab.Locate ('SERNUMMER',SNAdd.Text,[loCaseInsensitive]));


     SNAddBtn.Enabled :=(OK)and(MakeEKReForm.SNTab.RecordCount<Anzahl);

     if not ok then
     begin
       if SNAdd.Text<>'' then
       begin
         SNAdd.Color :=clRed;
         SB1.Panels[1].Text :='SN bereits vorhanden !!!';
       end
         else
       begin
         SNAdd.Color :=clWindow;
         SB1.Panels[1].Text :='Bitte SN eingeben ...';
       end;
     end
       else
     begin
       SNAdd.Color :=clWindow;
       SB1.Panels[1].Text :='Seriennummer ok'
     end;

     if MakeEKReForm.SNTab.RecordCount=Anzahl
      then CloseBtn.Kind :=bkOK else CloseBtn.Kind :=bkAbort;

     SNAdd.Enabled    :=MakeEKReForm.SNTab.RecordCount<>Anzahl;
     SNDelBtn.Enabled :=MakeEKReForm.SNTab.RecordCount>0;

     SB1.Panels[0].Text :=Inttostr(Anzahl)+' benötigt, '+
                          Inttostr(MakeEKReForm.SNTab.RecordCount)+' erfasst';

     if MakeEKReForm.SNTab.RecordCount=Anzahl then
     begin
        SB1.Panels[0].Text :='alle Seriennummern erfasst !';
        SB1.Panels[1].Text :='';
     end;
end;
//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNAddKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(SNAddBtn.Enabled) then
     begin
       Key :=#0;
       SNAddBtnClick (Sender);
     end;

end;
//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNDelBtnClick(Sender: TObject);
begin
     MakeEKReForm.SNTab.Delete;
end;
//------------------------------------------------------------------------------
procedure TSNErfassenForm.FormActivate(Sender: TObject);
begin
     SNAddBtn.Enabled :=False;

     if MakeEKReForm.SNTab.RecordCount=Anzahl
      then CloseBtn.Kind :=bkOK else CloseBtn.Kind :=bkAbort;

     SNAdd.Enabled    :=MakeEKReForm.SNTab.RecordCount<>Anzahl;
     SNDelBtn.Enabled :=MakeEKReForm.SNTab.RecordCount>0;

     if MakeEKReForm.SNTab.RecordCount<Anzahl
      then SB1.Panels[1].Text :='Bitte SN eingeben ...'
      else SB1.Panels[1].Text :='';

     SB1.Panels[0].Text :=Inttostr(Anzahl)+' benötigt, '+
                          Inttostr(MakeEKReForm.SNTab.RecordCount)+' erfasst';

     if MakeEKReForm.SNTab.RecordCount=Anzahl
      then SB1.Panels[0].Text :='alle Seriennummern erfasst !';

     SNAdd.Text :='';
end;
//------------------------------------------------------------------------------
procedure tSNErfassenForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x:= 442;
    ptMaxTrackSize.x:= screen.width;
    ptMinTrackSize.y:= 254;
    ptMaxTrackSize.y:= screen.height;
  end;
end;
//------------------------------------------------------------------------------
function tSNErfassenForm.ErfasseSN (NewAnzahl : Integer) : Boolean;
begin
//     SNGrid.RowColor1 :=DM1.C2Color;
     InAdd  :=False;
     Anzahl :=NewAnzahl;

     ArtNr.Caption :=MakeEKReForm.PosTabARTNUM.AsString;
     ArtMatch.Caption :=MakeEKReForm.PosTabMATCHCODE.AsString;
     ArtBez.Caption :=MakeEKReForm.PosTabBEZEICHNUNG.AsString;

     MakeEKReForm.SNTab.AfterPost   :=ZMySqlQuery1AfterDelete;
     MakeEKReForm.SNTab.AfterDelete :=ZMySqlQuery1AfterDelete;

     ShowModal;

     MakeEKReForm.SNTab.AfterPost   :=nil;
     MakeEKReForm.SNTab.AfterDelete :=nil;


     Result :=MakeEKReForm.SNTab.RecordCount=Anzahl;

end;
//------------------------------------------------------------------------------
procedure TSNErfassenForm.ZMySqlQuery1AfterDelete(DataSet: TDataSet);
begin
     if (not (MakeEKReForm.SNTab.State in [dsEdit, dsInsert]))and
        (not InAdd)
      then SNAddChange(Self);
end;
//------------------------------------------------------------------------------

end.

