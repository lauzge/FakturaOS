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
Modul        : CAO_REGEDIT
Stand        : 07.02.2004
Version      : 1.2 RC3A
Beschreibung : Dialog für SQL-Registery-Editor

History :

- 13.01.2003 Version 1.0.0.48 released Jan Pokrandt
- 09.05.2003 Unit zum GNU-Source hinzugefügt
- 07.02.2004 Tab-Reihenfolge verbessert

-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_RegEdit;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}


{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  DBCtrls, DBGrids, StdCtrls, Buttons, FZDB, rxdbcomb, ZDataset,
  ZAbstractRODataset;

type

  { TRegEdiForm }

  TRegEdiForm = class(TForm)
    DataSource1: TDataSource;
    FormSaveBtn: TSpeedButton;
    RootQueryMAINKEY: TZRawStringField;
    KeyEdit: TDBEdit;
    TypAWCB: TRxDBComboBox;
    ValQueryMAINKEY: TZRawStringField;
    ValQueryNAME: TZRawStringField;
    ValQueryTyp_Str: TStringField;
    ValQueryValue_Str: TStringField;
    ValQueryVAL_BIN: TZBlobField;
    ValQueryVAL_BLOB: TZRawCLobField;
    ValQueryVAL_CHAR: TZRawStringField;
    ValQueryVAL_DATE: TZDateTimeField;
    ValQueryVAL_DOUBLE: TZDoubleField;
    ValQueryVAL_INT: TZIntegerField;
    ValQueryVAL_TYP: TZSmallIntField;
    WertEdi: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    EdiPanel: TPanel;
    NaviPanel: TPanel;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    TV: TTreeView;
    ValQuery: TZQuery;
    RootQuery: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormSaveBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure TypAWCBChange(Sender: TObject);
    procedure ValQueryAfterScroll(DataSet: TDataSet);
    procedure ValQueryBeforePost(DataSet: TDataSet);
    procedure ValQueryCalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    MainSqlKey : String;
    MainKey    : String;
  public
    { Public-Deklarationen }
  end;

var
  RegEdiForm: TRegEdiForm;

implementation

{$R *.frm}

uses CAO_DM;

{ TRegEdiForm }

procedure TRegEdiForm.FormCreate(Sender: TObject);
begin
  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

procedure TRegEdiForm.FormSaveBtnClick(Sender: TObject);
var F : TextFile;
begin
  if SaveDialog1.Execute then
  begin
     AssignFile (F,SaveDialog1.Filename);
     if Fileexists (SaveDialog1.Filename) then
     begin
       if Fileexists (SaveDialog1.Filename+'.BAK')
        then DeleteFile (SaveDialog1.Filename+'.BAK');
       RenameFile (SaveDialog1.Filename,SaveDialog1.Filename+'.BAK');
     end;

     Rewrite (F); CloseFile (F);
     Append (F);
     try
        Write (F, 'Insert into REGISTERY (MAINKEY, NAME, VAL_BLOB, VAL_TYP) Values ('+
                   ''''+ValQuery.SQL.ExtractName (MainKey)+''','+
                   ''''+ValQuery.SQL.ExtractName (ValQueryNAME.AsString)+''','+
                   ''''+ValQuery.SQL.ExtractName (ValQueryVAL_BLOB.AsString)+''',8)');

     finally
        CloseFile (F);
     end;
  end;
end;

procedure TRegEdiForm.FormShow(Sender: TObject);
var Key, K : String;
    //Item : tTreeNode;
    LastItem,N : tTreeNode;
    I : Integer;
begin
  SaveDialog1.InitialDir :=ExtractFileDir (Paramstr(0));
  FormSaveBtn.Visible :=False;
  //DBGrid1.RowColor1 :=DM1.C2Color;
  //DBGrid1.EditColor :=DM1.EditColor;

  tv.items.clear;
  RootQuery.Open;
  while not RootQuery.eof do
  begin
       Key :=RootQueryMAINKEY.Value;
       LastItem :=Nil;
       repeat
          k :=key;
          delete (key,1,pos('\',key));
          k :=copy (k,1,pos('\',k)-1);

          if not assigned(LastItem) then
          begin
            for i:=0 to tv.items.Count-1 do
            begin
              if uppercase(tv.Items[i].Text)=uppercase(k) then
              begin
                LastItem :=tv.Items[i];
                Break;
              end;
            end;
          end
             else
          begin
            for i:=0 to LastItem.Count-1 do
            begin
              if uppercase(LastItem[i].Text)=uppercase(k) then
              begin
                LastItem :=LastItem[i];
                Break;
              end;
            end;
          end;
       until pos('\',key)=0;
       if not assigned(lastitem) then n :=tv.items.add(LastItem,Key)
                                 else n :=tv.items.AddChild (LastItem,Key);
       n.ImageIndex :=0;
       n.SelectedIndex :=1;
       RootQuery.Next;
  end;
  RootQuery.Close;
end;

procedure TRegEdiForm.TVChange(Sender: TObject; Node: TTreeNode);
var Item: TTreeNode;
begin
  Item :=Node;
  MainSqlKey :='';
  repeat
      if length(MainSqlKey)=0 then MainSqlKey :=Item.Text
                              else MainSqlKey :=Item.Text+'\\'+MainSqlKey;
      if assigned(Item.Parent) then Item :=Item.Parent
                               else Item :=nil;
  until not assigned(item);

  MainKey :=MainSqlKey;
  while pos ('\\',MainKey)>0 do delete (MainKey,pos('\\',MainKey),1);
  StatusBar1.SimpleText :=MainKey;

  ValQuery.Close;
  ValQuery.Sql.Clear;
  ValQuery.Sql.Add('select * from REGISTERY');
  ValQuery.Sql.Add('where MAINKEY='''+MainSqlKey+'''');
  ValQuery.Sql.Add('order by MAINKEY, NAME');
  ValQuery.Open;
end;

procedure TRegEdiForm.TypAWCBChange(Sender: TObject);
var NS : String; N : Integer;
begin
  NS :=TypAWCB.Values[TypAWCB.ItemIndex];
  N :=StrToInt(NS);
  case N of
       1   : WertEdi.DataField :='VAL_CHAR';
       2   : WertEdi.DataField :='VAL_DATE';
       3   : WertEdi.DataField :='VAL_INT';
       4   : WertEdi.DataField :='VAL_DOUBLE';
       5,7 : WertEdi.DataField :='VAL_BLOB';
       6   : WertEdi.DataField :='VAL_BIN';
  end;
  WertEdi.Enabled     :=N<5; // Binary nich bearbeitbar !
  FormSaveBtn.Visible :=N=7;
end;

procedure TRegEdiForm.ValQueryAfterScroll(DataSet: TDataSet);
begin
  case ValQueryVAL_TYP.Value of
       1   : WertEdi.DataField :='VAL_CHAR';
       2   : WertEdi.DataField :='VAL_DATE';
       3   : WertEdi.DataField :='VAL_INT';
       4   : WertEdi.DataField :='VAL_DOUBLE';
       5,7 : WertEdi.DataField :='VAL_BLOB';
       6   : WertEdi.DataField :='VAL_BIN';
  end;
  WertEdi.Enabled :=ValQueryVAL_TYP.Value<5; // Binary nich bearbeitbar !
  FormSaveBtn.Visible :=ValQueryVAL_TYP.Value=7;
end;

procedure TRegEdiForm.ValQueryBeforePost(DataSet: TDataSet);
begin
  ValQueryMAINKEY.Value :=MainKey;
end;

procedure TRegEdiForm.ValQueryCalcFields(DataSet: TDataSet);
var s : string;
begin
  case ValQueryVAL_TYP.Value of
       1 : s :=ValQueryVAL_Char.asString;
       2 : s :=formatdatetime ('dddd, dd.mm.yyyy hh:mm:ss "Uhr"',ValQueryVAL_Date.asDateTime);
       3 : s :=ValQueryVAL_Int.asString;
       4 : s :=ValQueryVAL_Double.asString;
       5,7 : s :=ValQueryVAL_Blob.asString;
       6 : s :=ValQueryVAL_Bin.asString;
  end;

  ValQueryValue_Str.Value :=s;

  case ValQueryVAL_TYP.Value of
       1 : s :='Char';
       2 : s :='DateTime';
       3 : s :='Integer';
       4 : s :='Double';
       5 : s :='Blob';
       6 : s :='Binär';
       7 : s :='Formular';
  end;

  ValQueryTyp_Str.Value :=s;
end;

end.

