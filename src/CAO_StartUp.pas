{

CAO-Faktura für Windows Version 1.0
Copyright (C) 2002 Jan Pokrandt / Jan@JP-SOFT.de

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
{******************************************************************************}
{ Mein Dank gilt Thomas Görtler alias Hubdule, er hat das Bild für den Start   }
{ erstellt und auch das Eichhörnchen gefunden ...                              }
{ Das Bild unterliegt also seinem Copyright                                    }
{ Thomas erreicht Ihr unter http://www.colorarts.de, hubdule@colorarts.de      }
{******************************************************************************}
{
-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_StartUp;

{$IFDEF FPC} {$MODE DELPHI} {$H+} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TStartBox }

  TStartBox = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    PBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modal : Boolean;
  end;

var
  SScreen : TStartBox; // Splash-Screen für Programmstart !!

implementation

{$R *.frm}

{ TStartBox }

procedure TStartBox.FormCreate(Sender: TObject);
var JPG : tJPegImage;
begin
  Modal :=False;
  try
    if fileexists (ExtractFilePath(ParamStr(0))+'cao_logo.jpg') then
    begin
       Image1.Visible :=False;
       JPG :=tJPegImage.Create;
       try
          Jpg.LoadFromFile (ExtractFilePath(ParamStr(0))+'cao_logo.jpg');
          Image1.Picture.Assign (JPG);
//          Image1.State :=stDefault;
       finally
          JPG.Free;
       end;
       Image1.Visible :=True;
    end;
  except end;
end;

procedure TStartBox.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if Modal then Close;
end;

procedure TStartBox.Image1Click(Sender: TObject);
begin
  if Modal then Close;
end;

end.

