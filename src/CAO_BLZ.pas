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
Modul        : CAO_BLZ
Stand        : 15.08.2003
Version      : 1.1.2.8
Beschreibung : Dialog BLZ

History :

13.08.2003 - KL Unit zum GNU-Source hinzugefügt
05.11.2003 - JP Tabelle und SQL um Feld Land erweitert

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_BLZ;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Messages, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ComCtrls, ToolWin, DBGrids, DBCtrls, StdCtrls, cao_var_const,
  Buttons, ZDataset, ZAbstractRODataset;

type

  { TBLZForm }

  TBLZForm = class(TForm)
    BLZPanel: TPanel;
    BLZQuery: TZQuery;
    BLZQueryBANK_NAME: TZRawStringField;
    BLZQueryBLZ: TZIntegerField;
    BLZQueryLAND: TZRawStringField;
    BLZ_DS: TDataSource;
    BLZGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    Suchbegr: TEdit;
    Label25: TLabel;
    SB: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    UebernBtn: TToolButton;
    procedure BLZGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure BLZGridDblClick(Sender: TObject);
    procedure BLZQueryNewRecord(DataSet: TDataSet);
    procedure BLZ_DSDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BLZGridCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure SuchbegrChange(Sender: TObject);
  private
    { Private-Deklarationen }
    SortField,
    SearchField,
    SortName   : String;
    QueryTime  : DWord;
    InClose    : Boolean;
    exitcode   : Byte;

    ResBLZ     : String;
    ResBank    : String;

    SearchData : String;

    procedure BLZUpdateQuery (SuchStr : String);

    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
               message WM_GETMINMAXINFO;

  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;

    function Get (Index:Integer;var BLZ,BANK_NAME : string):boolean;
    function GetDataIfUniqueBLZ (var BLZ,BANK_NAME : string):Boolean;
  end;

var
  BLZForm: TBLZForm;

implementation

{$R *.frm}

uses CAO_MAIN, CAO_DM;

//------------------------------------------------------------------------------
procedure TBLZForm.FormCreate(Sender: TObject);
begin
  OnUpdateStatusBar :=nil;;

  //Scaled :=True;
  SearchData :='';
  //ScaleBy (Screen.Width,800);

  SortName    :='Blz';
  SortField   :='BLZ';
  SearchField :='BLZ';

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TBLZForm.FormDeactivate(Sender: TObject);
begin
  UebernBtn.Visible :=False;
  InClose :=True;
  SuchBegr.Text :='';
  InClose :=False;
  BLZQuery.Close;
  SearchData :='';
end;
//------------------------------------------------------------------------------
procedure TBLZForm.SuchbegrChange(Sender: TObject);
var v : variant; S : String;
begin
     if InClose then exit;
     S :=SuchBegr.Text;

     // führende Leerzeichen entfernen
     while (length(S)>0)and(S[1]=' ')
      do delete (S,1,1);
     // Leerzeichen am ende Entfernen
     while (length(S)>0)and(S[length(S)]=' ')
      do delete (S,length(S),1);

     v :=S;
     BLZUpdateQuery (copy(S,1,4));
     BLZQuery.Locate (SearchField,V,[loCaseInsensitive,loPartialKey]);
end;
//------------------------------------------------------------------------------
procedure TBLZForm.BLZGridCheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
var S : String;
begin
     S :=Uppercase (Field.FieldName);
     Enabled :=(S='BLZ')or(S='BANK_NAME');
end;
//------------------------------------------------------------------------------
procedure TBLZForm.FormActivate(Sender: TObject);
var I : Integer;
begin
     SB.Visible :=not assigned (OnUpdateStatusBar);
     if SB.Visible then SB.Top :=Height;

//     BLZGrid.RowColor1 :=DM1.C2Color;
//     BLZGrid.EditColor :=DM1.EditColor;

     InClose :=False;

     BLZUpdateQuery (SearchData);
     SearchData :='';
     for i:=0 to BLZGrid.Columns.Count-1 do
      if uppercase(BLZGrid.Columns[i].FieldName)=uppercase(SearchField)
       then BLZGrid.Columns[i].Title.Font.Style :=[fsBold]
       else BLZGrid.Columns[i].Title.Font.Style :=[];
end;
//------------------------------------------------------------------------------
procedure TBLZForm.BLZGridDblClick(Sender: TObject);
begin
  exitcode :=1;
  ResBLZ     :=BLZQueryBLZ.AsString;
  ResBank    :=BLZQueryBANK_Name.AsString;
  Close;
end;
//------------------------------------------------------------------------------
procedure TBLZForm.BLZQueryNewRecord(DataSet: TDataSet);
begin
  BLZQueryLAND.AsString :=DM1.LandK2;
end;
//------------------------------------------------------------------------------
procedure TBLZForm.BLZ_DSDataChange(Sender: TObject; Field: TField);
var SuchZeit, Datensatz : String;
begin
     if SB.Visible then
     begin
       SB.Panels[1].Text :=inttostr(BLZQuery.RecNo)+' : '+
                           inttostr(BLZQuery.RecordCount);
     end
        else
     begin
        Datensatz  :=inttostr(BLZQuery.RecNo)+' : '+
                     inttostr(BLZQuery.RecordCount);

        SuchZeit :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';
        if assigned (OnUpdateStatusBar)
         then OnUpdateStatusBar (Suchzeit,
                                 Datensatz,'Sortierung : '+SortName,'','');
     end;
end;
//------------------------------------------------------------------------------
procedure TBLZForm.BLZUpdateQuery (SuchStr : String);
var LastTime : DWord;
begin
    LastTime :=GetTickCount64;

    Screen.Cursor :=crSQLWait;
    try
     BLZQuery.Close;
     BLZQuery.SQL.Clear;
     BLZQuery.SQL.Add ('SELECT LAND, BLZ, BANK_NAME');
     BLZQuery.SQL.Add ('FROM BLZ');
     if length(SuchStr)>0
      then BLZQuery.SQL.Add (' WHERE '+
                             searchfield+' LIKE "'+SuchStr+'%" and LAND="'+
                             DM1.LandK2+'"')
      else BLZQuery.SQL.Add (' WHERE LAND="'+DM1.LandK2+'"');

     BLZQuery.SQL.Add ('ORDER BY '+sortfield+' LIMIT 0,100');
     BLZQuery.Open;
    finally
     Screen.Cursor :=crDefault;
    end;
    QueryTime :=GetTickCount64-LastTime;
end;
//------------------------------------------------------------------------------
procedure TBLZForm.BLZGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var i:Integer;
begin
     for i:=0 to BLZGrid.Columns.Count-1 do
      if BLZGrid.Columns[i].FieldName=Field.FieldName
       then BLZGrid.Columns[i].Title.Font.Style :=[fsBold]
       else BLZGrid.Columns[i].Title.Font.Style :=[];

     if uppercase(SearchField) <> uppercase(Field.FieldName) then
     begin
          SearchField :=uppercase(Field.FieldName);
          SortField   :=Searchfield;
          SortName    :=Field.DisplayLabel;
          BLZUpdateQuery ('');
     end;
end;
//------------------------------------------------------------------------------
procedure TBLZForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x:= 460;
    ptMaxTrackSize.x:= screen.width;
    ptMinTrackSize.y:= 300;
    ptMaxTrackSize.y:= screen.height;
  end;
end;
//------------------------------------------------------------------------------
function TBLZForm.Get(Index: Integer; var BLZ, BANK_NAME: string): boolean;
var V : Variant; NewSortField, NewSearchField : String;
begin
    exitcode :=0;
    //BLZQuery.Refresh;
    //BLZGrid.Invalidate;

    ResBLZ     :='';
    ResBank     :='';

    Result :=False;
    case index of
      1:begin
             SortName :='Blz';
             NewSortField :='BLZ,BANK_NAME';
             NewSearchField :='BLZ';
             v :=copy (BLZ,1,6);
        end;
      2:begin
             SortName :='Bank';
             NewSortField :='BANK_NAME';
             NewSearchField :='BANK_NAME';
             v :=copy (BANK_NAME,1,5);
        end;
    end;

    SearchData :=V;
    SortField :=NewSortField;
    SearchField :=NewSearchField;
    UebernBtn.Visible :=True;
    ShowModal;
    if exitcode=1 then
    begin
         result    :=true;
         BLZ       :=ResBLZ;
         Bank_Name :=ResBank;
    end;
    BLZQuery.Close;
end;
//------------------------------------------------------------------------------
function TBLZForm.GetDataIfUniqueBLZ(var BLZ, BANK_NAME: string): Boolean;
begin
  Result :=False;
  if length(BLZ)=0 then exit;

  BLZQuery.Close;
  BLZQuery.SQL.Clear;
  BLZQuery.SQL.Add ('SELECT LAND, BLZ, BANK_NAME');
  BLZQuery.SQL.Add ('FROM BLZ');
  BLZQuery.SQL.Add ('where BLZ="'+BLZ+'" and LAND="'+DM1.LandK2+'"');
  BLZQuery.SQL.Add ('LIMIT 0,2');
  BLZQuery.Open;
  if BLZQuery.RecordCount=1 then
  begin
      Bank_Name :=BLZQueryBANK_NAME.AsString;
      Result    :=True;
  end;
  BLZQuery.Close;
end;
//------------------------------------------------------------------------------

end.

