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
Modul        : CAO_INFO
Stand        : 04.05.2004
Version      : 1.2.5.3
Beschreibung : Infosystem / Notizen

History :

03.07.2003 - Unit erstellt

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Info;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, DBGrids, DBCtrls, DBExtCtrls, Menus, DBRichMemo,
  ZDataset, ZAbstractRODataset, cao_var_const, Grids;

type

  { TInfoForm }

  TInfoForm = class(TForm)
    DBRichMemo1: TDBRichMemo;
    InfoTabDATUM: TZDateField;
    InfoTabERLED: TZSmallIntField;
    InfoTabERST_VON: TZRawStringField;
    InfoTabKURZTEXT: TZRawStringField;
    InfoTabLFD_NR: TZIntegerField;
    InfoTabMEMO: TMemoField;
    InfoTabQUELLE: TZShortIntField;
    InfoTabWIEDERVORLAGE: TZSmallIntField;
    InfoTabWV_DATUM: TZDateField;
    WVCB: TDBCheckBox;
    WVDate: TDBDateEdit;
    DBNavigator1: TDBNavigator;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Ansicht1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Datum1: TMenuItem;
    Info1: TMenuItem;
    Erstellt1: TMenuItem;
    Aktualisieren1: TMenuItem;
    N3: TMenuItem;
    nurUnerledigt1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N2: TMenuItem;
    Storno1: TMenuItem;
    N1: TMenuItem;
    neuenBelegerstellen1: TMenuItem;
    Sortierung1: TMenuItem;
    Suchbeg: TEdit;
    InfoDS: TDataSource;
    InfoGrid: TDBGrid;
    Image1: TImage;
    InfoPanel: TPanel;
    CenterPan: TPanel;
    InfoTabCALC_WV: TBooleanField;
    KurzInfoEdi: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    MainLabelMid: TLabel;
    MainLabMid: TLabel;
    MainLabLeft: TLabel;
    Label2: TLabel;
    MainPanRight: TPanel;
    MsgPan: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    ToolButton1: TToolButton;
    ErledBtn: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    PrintBtn: TToolButton;
    TopStatusPan: TPanel;
    ToolBar1: TToolBar;
    InfoTab: TZQuery;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ErledBtnClick(Sender: TObject);
    procedure Erstellt1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure InfoDSDataChange(Sender: TObject; Field: TField);
    procedure InfoGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure InfoTabAfterInsert(DataSet: TDataSet);
    procedure InfoTabAfterPost(DataSet: TDataSet);
    procedure InfoTabAfterScroll(DataSet: TDataSet);
    procedure InfoTabCalcFields(DataSet: TDataSet);
    procedure InfoTabNewRecord(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure neuenBelegerstellen1Click(Sender: TObject);
    procedure nurUnerledigt1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Storno1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    ViewAll   : Boolean;
    First     : Boolean;
    SortField : String;
    SortName  : String;
    Limit     : Integer;

    procedure UpdateQuery;

procedure UpdateSum;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure PruefeWiedervorlage;
  end;

var
  InfoForm: TInfoForm;

implementation

{$R *.frm}

uses
  CAO_DM, CAO_MAIN, cao_dbgrid_layout, ZCompatibility;

//------------------------------------------------------------------------------
procedure TInfoForm.PruefeWiedervorlage;
var Anz : Integer;
    Txt : String;

    uniquery : tZQuery;


begin
     // Wenn user bereits im Modul ist, dann nicht prüfen
     if MainForm.ActiveModul=1060 then exit;

     uniquery :=tZQuery.Create(Self);
     try
       uniquery.Connection :=dm1.db1;
       uniquery.sql.text :='select count(*) as ANZ from INFO '+
                           'where ERLED=0 and '+
                           'WIEDERVORLAGE=1 and WV_DATUM <=NOW()';
       uniquery.Open;
       if (uniquery.RecordCount>0) and
          (UniQuery.FieldByName ('ANZ').AsInteger>0) then
       begin
         ANZ :=UniQuery.FieldByName ('ANZ').AsInteger;
         if Anz=1
           then txt :='Eine Notiz sollte Ihnen heute wieder vorgelegt werden.'+
                      #13#10+
                      'Möchen Sie jetzt zu den Notizen wechseln ?'
           else txt :=Inttostr(Anz)+
                      ' Notizen sollten Ihnen heute wieder vorgelegt werden.'+
                      #13#10+
                      'Möchen Sie jetzt zu den Notizen wechseln ?';
         if MessageDlg (Txt,mtConfirmation,[mbYes,mbNo],0)=mryes then
         begin
            MainForm.JumpTo (MOD_NOTIZ,0,0,False);
         end;
       end;
       UniQuery.Close;
     finally
       uniquery.free;
     end;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.FormCreate(Sender: TObject);
begin
  OnUpdateStatusBar :=nil;
  First             :=True;
  ViewAll           :=True;
  SortField         :='DATUM';
  SortName          :='Datum';
  Limit             :=High(Integer);
end;
//------------------------------------------------------------------------------
procedure TInfoForm.FormDeactivate(Sender: TObject);
begin
     if (InfoTab.State in [dsEdit,dsInsert]) then
     begin
        if MessageDlg ('Die aktuelle Notiz wurde verändert,'+#13#10+
                       'wollen Sie die Änderung speichern ?',
                       mtconfirmation,[mbYes, mbNo],0) = mryes
         then InfoTab.Post
         else InfoTab.Cancel;
     end;
     InfoTab.Close;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.InfoDSDataChange(Sender: TObject; Field: TField);
var Datensatz, Sortierung, Erstellt, Geaendert : String;
begin
     if InfoTab.RecordCount=0 then Datensatz :='keine'
     else if InfoTab.RecordCount=Limit
            then Datensatz :=inttostr (InfoTab.RecNo)+
                             ' von >='+
                             inttostr (InfoTab.RecordCount)
     else Datensatz :=inttostr (InfoTab.RecNo)+
                      ' von '+
                      inttostr (InfoTab.RecordCount);

     Sortierung :='Sortierung : '+sortname;

     Erstellt :='';
     Geaendert :='';

     if assigned (OnUpdateStatusBar)
      then OnUpdateStatusBar ('-',Datensatz,Sortierung,Erstellt,Geaendert);
end;
//------------------------------------------------------------------------------
procedure TInfoForm.InfoGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     if InfoTabERLED.asinteger=1 then
     begin
        canvas.font.style :=[fsStrikeOut];
        canvas.font.color :=clgray;
     end
        else
     if (InfoTabWIEDERVORLAGE.AsInteger=1)and(InfoTabWV_DATUM.AsDateTime<=Now) then
     begin
        canvas.font.style :=[fsBold];
        canvas.font.color :=clRed;
     end;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabAfterInsert(DataSet: TDataSet);
begin
  KurzInfoEdi.Setfocus;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabAfterPost(DataSet: TDataSet);
begin
  UpdateSum;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabAfterScroll(DataSet: TDataSet);
begin
     if InfoTabErled.AsInteger=1 then
     begin
        ErledBtn.ImageIndex :=22;
        ErledBtn.Caption    :='Unerledigt';
        WVCB.Enabled        :=False;
        WVDate.Enabled      :=False;
     end
        else
     begin
        ErledBtn.ImageIndex :=12;
        ErledBtn.Caption    :='Erledigt';
        WVCB.Enabled        :=True;
        WVDate.Enabled      :=True;
     end;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabCalcFields(DataSet: TDataSet);
begin
  InfoTabCalc_WV.AsBoolean :=InfoTabWIEDERVORLAGE.AsInteger=1;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabNewRecord(DataSet: TDataSet);
begin
  InfoTabWIEDERVORLAGE.AsInteger :=0;
  InfoTabERLED.AsInteger         :=0;
  InfoTabQuelle.Value            :=99;
  InfoTabDatum.Value             :=TZDate(now);
  InfoTabErst_VON.AsString       :=DM1.View_User;

  KurzInfoEdi.SetFocus;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(InfoGrid),'INFO_LIST',102);
end;
//------------------------------------------------------------------------------
procedure TInfoForm.neuenBelegerstellen1Click(Sender: TObject);
begin
  InfoTab.Append;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.nurUnerledigt1Click(Sender: TObject);
begin
  nurUnerledigt1.Checked :=not nurUnerledigt1.Checked;
  ViewAll :=not nurUnerledigt1.Checked;
  UpdateQuery;
  DM1.WriteBooleanU ('INFO','VIEW_ALL',ViewAll);
  if ViewAll
   then MainLabMid.Caption :=''
   else MainLabMid.Caption :='(nur unerledigte Notizen)';
end;
//------------------------------------------------------------------------------
procedure TInfoForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(InfoGrid));
end;
//------------------------------------------------------------------------------
procedure TInfoForm.Storno1Click(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie diese Notiz wirklich löschen ?',
                    mtConfirmation,mbyesnocancel,0)=mryes then InfoTab.Delete;

end;
//------------------------------------------------------------------------------
procedure TInfoForm.FormActivate(Sender: TObject);
begin
     if First then
     begin
          First :=False;
//          InfoGrid.RowColor1 :=DM1.C2Color;
//          InfoGrid.EditColor :=DM1.EditColor;

          dm1.GridLoadLayout (tDBGrid(InfoGrid),'INFO_LIST',102);
          SortField :=DM1.ReadStringU ('INFO','SORT','DATUM');
          ViewAll   :=DM1.ReadBooleanU ('INFO','VIEW_ALL',True);

          if ViewAll
           then MainLabMid.Caption :=''
           else MainLabMid.Caption :='(nur unerledigte Notizen)';

          if SortField ='KURZTEXT' then
          begin
               Info1.Checked :=True;
               SortName :='Kurztext';
          end else
          if SortField ='ERST_VON' then
          begin
               Erstellt1.Checked :=True;
               SortName :='Erstellt von';
          end else
          begin
               Datum1.Checked :=True;
               SortName :='Datum';
          end;

          nurUnerledigt1.Checked :=not ViewAll;

     end;
     UpdateQuery;
     InfoGrid.SetFocus;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.Erstellt1Click(Sender: TObject);
begin
  tMenuItem(Sender).Checked :=True;
  case tMenuItem(Sender).Tag of
    2:   begin SortField :='KURZTEXT'; SortName :='Kurztext'; end;
    3:   begin SortField :='ERST_VON'; SortName :='Erstellt von'; end;
    else begin SortField :='DATUM';    SortName :='Datum'; end;
  end;
  UpdateQuery;
  DM1.WriteStringU ('INFO','SORT',SortField);
end;
//------------------------------------------------------------------------------
procedure TInfoForm.Aktualisieren1Click(Sender: TObject);
begin
     if InfoTab.Active then
     begin
        InfoTab.Refresh;
        UpdateSum;
     end;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.ErledBtnClick(Sender: TObject);
begin
     if not (Infotab.State in [dsEdit, dsInsert]) then InfoTab.Edit;
     if InfoTaberled.AsInteger=1 then
     begin
        InfoTaberled.AsInteger         :=0;
     end
        else
     begin
        InfoTaberled.AsInteger :=1;
        InfoTabWIEDERVORLAGE.AsInteger :=0;
     end;

     InfoTab.Post;
     InfoTabAfterScroll (nil);
     UpdateSum;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.UpdateQuery;
begin
     InfoTab.Close;
     InfoTab.Sql.Clear;
     InfoTab.sql.add ('select * from INFO');
     if not ViewAll then InfoTab.sql.add ('where ERLED!=1');
     if length(SortField)>0 then InfoTab.Sql.Add ('order by '+SortField);
     InfoTab.Open;
     UpdateSum;
end;
//------------------------------------------------------------------------------
procedure TInfoForm.UpdateSum;
var SUM : Integer;
begin
  dm1.uniquery.close;
  dm1.uniquery.sql.text :='select count(*) as ANZ from INFO where'+
                          ' WIEDERVORLAGE=1 and WV_DATUM<=CURDATE()';
  dm1.uniquery.open;

  if dm1.uniquery.Recordcount=1
    then SUM :=dm1.uniquery.FieldByName ('ANZ').AsInteger
    else SUM :=0;
  dm1.uniquery.close;

  if SUM=0 then MainLabelMid.Caption :='keine überfällig'
           else MainLabelMid.Caption :=IntToStr(Sum)+' fällig';
end;
//------------------------------------------------------------------------------

end.

