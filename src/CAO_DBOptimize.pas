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
Modul        : CAO_DBOPTIMIZE
Stand        : 13.07.2003
Version      : 1.1.1.6
Beschreibung : Dialog zum Prüfen, Optimieren und Reparieren der MySQL-Datenbank


History :

13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
13.07.2003 - Bug in Tabellenauflistung (SQL) entfernt

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_DBOptimize;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  ComCtrls, Buttons, ZDataset, ZAbstractRODataset;

type

  { TDBForm }

  TDBForm = class(TForm)
    StatusDS: TDataSource;
    PruefBtn: TBitBtn;
    OptBtn: TBitBtn;
    RepBtn: TBitBtn;
    SrvStatusGrid: TDBGrid;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Status: TZQuery;
    StatusMsg_text: TZRawCLobField;
    StatusMsg_type: TZRawStringField;
    StatusOp: TZRawStringField;
    StatusTable: TZRawStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OptBtnClick(Sender: TObject);
    procedure PruefBtnClick(Sender: TObject);
    procedure RepBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    SQL : String; // Namen der Tabellen in der DB
  public
    { Public-Deklarationen }
  end;

//var
//  DBForm: TDBForm;

implementation

{$R *.frm}

uses
  CAO_DM;

//------------------------------------------------------------------------------
{ TDBForm }

procedure TDBForm.FormCreate(Sender: TObject);
begin
  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TDBForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Status.Active then Status.Close;
end;
//------------------------------------------------------------------------------
procedure TDBForm.FormShow(Sender: TObject);
var FN : string;
begin
  FN :='TABLES_IN_'+DM1.DB1.DataBase;
  DM1.UniQuery.Close;
  DM1.UniQuery.Sql.Clear;
  DM1.UniQuery.Sql.Add ('SHOW TABLES');
  DM1.UniQuery.Open;
  SQL :='';
  while not DM1.UniQuery.Eof do
  begin
       if Length (SQL)>0 then SQL :=SQL+', ';
       SQL :=SQL+DM1.UniQuery.FieldByName(FN).AsString;
       DM1.UniQuery.Next;
  end;
  DM1.UniQuery.Close;


  PruefBtnClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TDBForm.OptBtnClick(Sender: TObject);
begin
  Status.Close;
  Status.Sql.Clear;
  Status.Sql.Add ('FLUSH TABLES');
  Status.ExecSql;

  Status.Close;
  Status.Sql.Clear;
  Status.Sql.Add ('OPTIMIZE TABLE');
  Status.Sql.Add (SQL);
  Status.Open;
end;
//------------------------------------------------------------------------------
procedure TDBForm.PruefBtnClick(Sender: TObject);
begin
  Status.Close;
  Status.Sql.Clear;
  Status.Sql.Add ('CHECK TABLE');
  Status.Sql.Add (SQL);
  Status.Open;
end;
//------------------------------------------------------------------------------
procedure TDBForm.RepBtnClick(Sender: TObject);
begin
  Status.Close;
  Status.Sql.Clear;
  Status.Sql.Add ('FLUSH TABLES');
  Status.ExecSql;

  Status.Close;
  Status.Sql.Clear;
  Status.Sql.Add ('REPAIR TABLE');
  Status.Sql.Add (SQL);
  Status.Open;
end;
//------------------------------------------------------------------------------
end.

