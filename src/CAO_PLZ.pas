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
Modul        : CAO_PLZ
Stand        : 09.11.2003
Version      : 1.1.3.27
Beschreibung : Dialog PLZ

History :

- 09.05.2003 - Unit zum GNU-Source hinzugefügt
- 15.06.2003 - Umwandlung in Grußbuchstaben bei der Suche entfernt, dadurch
               großer Geschwindigkeitsgewinn
- 09.11.2003 - Default-Vorgabe für Land bei neuen Datensetzen erstellt

-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_PLZ;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Messages, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ComCtrls, cao_var_const, DBGrids, DBCtrls, Buttons, StdCtrls, ZDataset,
  ZAbstractRODataset;

type

  { TPLZForm }

  TPLZForm = class(TForm)
    DBNavigator1: TDBNavigator;
    Suchbegr: TEdit;
    Label25: TLabel;
    PLZGrid: TDBGrid;
    PLZQueryBUNDESLAND: TZRawStringField;
    PLZQueryLAND: TZRawStringField;
    PLZQueryNAME: TZRawStringField;
    PLZQueryPLZ: TZRawStringField;
    PLZQueryVORWAHL: TZRawStringField;
    PLZ_DS: TDataSource;
    PLZPanel: TPanel;
    PLZQuery: TZQuery;
    SB: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    UebernBtn: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure PLZGridCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure PLZGridDblClick(Sender: TObject);
    procedure PLZGridTitleBtnClick(Column: TColumn; ACol: Integer;
      Field: TField);
    procedure PLZQueryNewRecord(DataSet: TDataSet);
    procedure PLZ_DSDataChange(Sender: TObject; Field: TField);
    procedure SuchbegrChange(Sender: TObject);
  private
    { Private-Deklarationen }
    SortField,
    SearchField,
    SortName   : String;
    InClose    : Boolean;
    exitcode   : Byte;
    QueryTime  : Integer;

    ResPLZ     : String;
    ResOrt     : String;
    ResVorwahl : String;

    SearchData : String;

    procedure UpdateQuery (SuchStr : String);
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
               message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    Land       : string;

    OnUpdateStatusBar : TOnUpdateStatusBar;

    function Get (Index:Integer;var Land,PLZ,Ort,Vorwahl : string):boolean;
    function GetDataIfUniquePLZ (var Land,PLZ,Ort,Vorwahl : string):Boolean;
  end;

var
  PLZForm: TPLZForm;

implementation

{$R *.frm}

uses CAO_MAIN, CAO_DM;

//------------------------------------------------------------------------------
procedure TPLZForm.FormCreate(Sender: TObject);
begin
  OnUpdateStatusBar :=nil;
  //Scaled :=True;
  SearchData :='';
  //ScaleBy (Screen.Width,800);

  SortName    :='Plz';
  SortField   :='PLZ';
  SearchField :='PLZ';

  Land        :='DE';

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TPLZForm.FormDeactivate(Sender: TObject);
begin
  UebernBtn.Visible :=False;
  InClose :=True;
  SuchBegr.Text :='';
  InClose :=False;
  PLZQuery.Close;
  SearchData :='';
end;
//------------------------------------------------------------------------------
procedure TPLZForm.FormActivate(Sender: TObject);
var I : Integer;
begin
     SB.Visible :=not assigned (OnUpdateStatusBar);
     if SB.Visible then SB.Top :=Height;

//     PLZGrid.RowColor1 :=DM1.C2Color;
//     PLZGrid.EditColor :=DM1.EditColor;
     InClose :=False;

     UpdateQuery (SearchData);
     SearchData :='';
     for i:=0 to PLZGrid.Columns.Count-1 do
      if uppercase(PLZGrid.Columns[i].FieldName)=uppercase(SearchField)
       then PLZGrid.Columns[i].Title.Font.Style :=[fsBold]
       else PLZGrid.Columns[i].Title.Font.Style :=[];
end;
//------------------------------------------------------------------------------
procedure TPLZForm.PLZGridCheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
var S : String;
begin
     S :=Uppercase (Field.FieldName);
     Enabled :=(S='PLZ')or(S='NAME')or(S='VORWAHL');
end;
//------------------------------------------------------------------------------
procedure TPLZForm.PLZGridDblClick(Sender: TObject);
begin
  exitcode :=1;
  ResPLZ     :=PLZQueryPLZ.AsString;
  ResOrt     :=PLZQueryName.AsString;
  ResVorwahl :=PLZQueryVorwahl.AsString;
  Close;
end;
//------------------------------------------------------------------------------
procedure TPLZForm.PLZGridTitleBtnClick(Column: TColumn; ACol: Integer;
  Field: TField);
var i:Integer;
begin
     for i:=0 to PLZGrid.Columns.Count-1 do
      if PLZGrid.Columns[i].FieldName=Field.FieldName
       then PLZGrid.Columns[i].Title.Font.Style :=[fsBold]
       else PLZGrid.Columns[i].Title.Font.Style :=[];

     if uppercase(SearchField) <> uppercase(Field.FieldName) then
     begin
          SearchField :=uppercase(Field.FieldName);

          SortField :='LAND, '+Searchfield;

          SortName  :=Field.DisplayLabel;
          UpdateQuery ('');
     end;
end;
//------------------------------------------------------------------------------
procedure TPLZForm.PLZQueryNewRecord(DataSet: TDataSet);
begin
  PLZQueryLAND.AsString :=DM1.LandK2;
end;

procedure TPLZForm.PLZ_DSDataChange(Sender: TObject; Field: TField);
var SuchZeit, Datensatz : String;
begin
     if SB.Visible then
     begin
       SB.Panels[1].Text :=inttostr(PLZQuery.RecNo)+' : '+
                           inttostr(PLZQuery.RecordCount);
     end
        else
     begin
        Datensatz  :=inttostr(PLZQuery.RecNo)+' : '+
                     inttostr(PLZQuery.RecordCount);

        SuchZeit :=FormatFloat ('0.00',(querytime)/1000)+' Sek.';

        if assigned (OnUpdateStatusBar)
         then OnUpdateStatusBar (Suchzeit,
                                 Datensatz,'Sortierung : '+SortName,'','');
     end;
end;
//------------------------------------------------------------------------------
procedure TPLZForm.SuchbegrChange(Sender: TObject);
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
     UpdateQuery (copy(S,1,4));
     PLZQuery.Locate (SearchField,V,[loCaseInsensitive,loPartialKey]);
end;
//------------------------------------------------------------------------------
procedure TPLZForm.UpdateQuery (SuchStr : String);
var LastTime : DWord;
begin
    LastTime :=GetTickCount;

    Screen.Cursor :=crSQLWait;
    try
     PLZQuery.Close;
     PLZQuery.SQL.Clear;
     PLZQuery.SQL.Add ('SELECT LAND, PLZ, NAME, VORWAHL, BUNDESLAND');
     PLZQuery.SQL.Add ('FROM PLZ WHERE LAND="'+Land+'"');
     if length(SuchStr)>0
      then PLZQuery.SQL.Add (' and '+searchfield+' LIKE "'+SuchStr+'%"');

     PLZQuery.SQL.Add ('ORDER BY '+sortfield+' LIMIT 0,100');
     PLZQuery.Open;
    finally
     Screen.Cursor :=crDefault;
    end;
    QueryTime :=GetTickCount-LastTime;
end;
//------------------------------------------------------------------------------
procedure TPLZForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
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
function TPLZForm.Get (Index:Integer;var Land,PLZ,Ort,Vorwahl : string):Boolean;
var V : Variant; NewSortField, NewSearchField : String;
begin
    exitcode :=0;
    //PLZQuery.Refresh;
    //PLZGrid.Invalidate;

    ResPLZ     :='';
    ResOrt     :='';
    ResVorwahl :='';

    Self.Land :=Land;

    Result :=False;
    case index of
      0:begin SortName :='Plz';     NewSortField :='LAND,PLZ,NAME'; NewSearchField :='PLZ'; v :=copy (PLZ,1,5);     end;
      2:begin SortName :='Ort';     NewSortField :='LAND,NAME';     NewSearchField :='NAME'; v :=copy (Ort,1,5);     end;
      3:begin SortName :='Vorwahl'; NewSortField :='LAND,VORWAHL';  NewSearchField :='VORWAHL'; v :=copy (Vorwahl,1,5); end;
    end;

    SearchData :=V;
    SortField :=NewSortField;
    SearchField :=NewSearchField;
    UebernBtn.Visible :=True;

    ShowModal;
    if exitcode=1 then
    begin
         result  :=true;
         PLZ     :=ResPLZ;
         Ort     :=ResOrt;
         Vorwahl :=ResVorwahl;
    end;
    PLZQuery.Close;
end;
//------------------------------------------------------------------------------
function TPLZForm.GetDataIfUniquePLZ (var Land,PLZ,Ort,Vorwahl : string):Boolean;
begin
     Result :=False;
     if (length(Land)=0)or(length(PLZ)=0) then exit;

     PLZQuery.Close;
     PLZQuery.SQL.Clear;
     PLZQuery.SQL.Add ('SELECT LAND, PLZ, NAME, VORWAHL, BUNDESLAND');
     PLZQuery.SQL.Add ('FROM PLZ WHERE LAND="'+Land+'"');
     PLZQuery.SQL.Add (' and PLZ="'+PLZ+'"');
     PLZQuery.SQL.Add ('LIMIT 0,2');
     PLZQuery.Open;
     if PLZQuery.RecordCount=1 then
     begin
         Ort     :=PLZQueryNAME.AsString;
         Vorwahl :=PLZQueryVORWAHL.AsString;
         Result  :=True;
     end;
     PLZQuery.Close;
end;
//------------------------------------------------------------------------------

end.

