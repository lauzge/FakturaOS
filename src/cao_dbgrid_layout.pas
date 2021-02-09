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
Modul        : CAO_DBGRID_LAYOUT
Stand        : 12.01.2003
Version      : 1.0.0.48
Beschreibung : Dialog zum modifizieren der sichtbaren Spalten in einem DbGrid

}

{ History :

- 13.01.2003 Version 1.0.0.48 released Jan Pokrandt

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}


unit cao_dbgrid_layout;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  ComCtrls, ExtCtrls, Buttons, DBGrids;

type

  { TVisibleSpaltenForm }

  TVisibleSpaltenForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lv: TListView;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    g : TDBGrid;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
               message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    procedure UpdateTable (var grid : TDBGrid);
  end;

var
  VisibleSpaltenForm: TVisibleSpaltenForm;

implementation

{$R *.frm}

//------------------------------------------------------------------------------
procedure tVisibleSpaltenForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x:= 245;
    ptMaxTrackSize.x:= screen.width;
    ptMinTrackSize.y:= 340;
    ptMaxTrackSize.y:= screen.height;
  end;
end;
//------------------------------------------------------------------------------
procedure tVisibleSpaltenForm.UpdateTable (var grid : TDBGrid);
var i    : integer;
    item : tListItem;
begin
     g :=grid;   // erzeugt Laufzeitfehler!!! ich ferstehaber nicht warum
     lv.items.clear;
     for i:=0 to grid.columns.Count-1 do
     begin
       item :=lv.items.add;
       item.caption :=g.columns.Items[i].Title.Caption;
       item.checked :=g.columns.Items[i].Visible;
       item.imageindex :=i;
     end;
     ShowModal;
end;
//------------------------------------------------------------------------------
{ TVisibleSpaltenForm }

procedure TVisibleSpaltenForm.BitBtn1Click(Sender: TObject);
var i    : integer;
    item : tListItem;
begin
  for i:=0 to lv.items.count-1 do
  begin
    item :=lv.items[i];
    g.Columns.items[i].Visible       :=item.checked;
    g.Columns.items[i].Title.Caption :=item.caption;
  end;
  Close;
end;
//------------------------------------------------------------------------------
procedure TVisibleSpaltenForm.FormCreate(Sender: TObject);
begin
  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;
//------------------------------------------------------------------------------
end.

