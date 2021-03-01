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
Modul        : CAO_FIBUKASSENBUCH
Stand        : 05.06.2003
Version      : 1.0.0.53
Beschreibung : Kassenbuch

History :

22.01.2003 - Version 1.0.0.49 released Jan Pokrandt
06.05.2003 - Version zum GNU-Source hinzugefügt
24.09.2003 - Bug#42 beseitigt, Spalte ist jetzt readonly :-)

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_FibuKassenbuch;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Menus, DBGrids, ComCtrls, StdCtrls, DBCtrls, VolPeriod, ZDataset, ZAbstractRODataset;

type

  { TKassenBuchForm }

  TKassenBuchForm = class(TForm)
    DBNavigator1: TDBNavigator;
    KasBuchGrid: TDBGrid;
    KasBuchDS: TDataSource;
    EndSaldoTabDATUM: TZDateField;
    EndSaldoTabSALDO: TZDoubleField;
    FindDialog1: TFindDialog;
    KasBuchBDATUM: TZDateField;
    KasBuchBELEGNUM: TZRawStringField;
    KasBuchBTXT: TZRawCLobField;
    KasBuchGKONTO: TZIntegerField;
    KasBuchJAHR: TZIntegerField;
    KasBuchJOURNAL_ID: TZIntegerField;
    KasBuchQUELLE: TZIntegerField;
    KasBuchQuelleStr: TStringField;
    KasBuchREC_ID: TZIntegerField;
    KasBuchSKONTO: TZDoubleField;
    KasBuchZU_ABGANG: TZDoubleField;
    Label1: TLabel;
    EndDatum: TLabel;
    EndSaldo: TLabel;
    Label3: TLabel;
    StartDatum: TLabel;
    StartSaldo: TLabel;
    DatumAW: TVolgaPeriod;
    WaehrungLab2: TLabel;
    Panel2: TPanel;
    WaehrungLab1: TLabel;
    Label35: TLabel;
    MainMenu1: TMainMenu;
    MainPanel: TPanel;
    Bearbeiten1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Anfangsbestand1: TMenuItem;
    ManuelleBuchung1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Kassenbuchdrucken1: TMenuItem;
    Aktualisieren1: TMenuItem;
    Panel1: TPanel;
    SumPan: TPanel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    StornoBtn: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ManBuchBtn: TToolButton;
    ToolButton5: TToolButton;
    PrintJournalBtn: TToolButton;
    TopPan: TPanel;
    Preis1: TMenuItem;
    Stadium1: TMenuItem;
    Name1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N3: TMenuItem;
    StartSaldoTabDATUM: TZDateField;
    StartSaldoTabSALDO: TZDoubleField;
    Storno1: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    Suchen1: TMenuItem;
    Sortierung1: TMenuItem;
    EndSaldoTab: TZQuery;
    KasBuch: TZQuery;
    StartSaldoTab: TZQuery;
    ToolBar1: TToolBar;
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Anfangsbestand1Click(Sender: TObject);
    procedure DatumAWChange(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure KasBuchAfterOpen(DataSet: TDataSet);
    procedure KasBuchCalcFields(DataSet: TDataSet);
    procedure KasBuchGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Kassenbuchdrucken1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure ManuelleBuchung1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Storno1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure TopPanResize(Sender: TObject);
  private
    { Private-Deklarationen }
    First                 : Boolean;
    KasBuchStartDatum     : tDateTime;
    KasBuchEndDatum       : tDateTime;
    KasBuchLeBuchungDatum : tDateTime;
    KasBuchStartSaldo     : Double;
    KasBuchEndSaldo       : Double;
    KasBuchZeitraum       : String;

    LastID                : Integer;
    LastRange             : Integer;
    LastSDate             : Integer;
    LastBDatum            : Integer;
    LastJahr              : Integer;

  public
    { Public-Deklarationen }
  end;

var
  KassenBuchForm: TKassenBuchForm;

implementation

{$R *.frm}

uses cao_dm, CAO_ManKassBuchungDlg, cao_dbgrid_layout,
     {$IFDEF REPORTBUILDER}CAO_PrintRech,{$ENDIF}
     Variants,CAO_FibuKassenbuch_AB_Dlg;

{ TKassenBuchForm }

procedure TKassenBuchForm.FormCreate(Sender: TObject);
begin
     First             :=True;
     DatumAW.KindRange :=ksMonth;
     DatumAW.StartDate :=now;
     LastRange         :=ord(ksMonth);
     LastID            :=-1;
     LastSDate         :=-1;
     LastBDatum        :=0;
end;

procedure TKassenBuchForm.FormDeactivate(Sender: TObject);
begin
     LastID     :=KasBuchRec_ID.Value;
     LastBDatum :=Round(Int(KasBuchBDATUM.AsDateTime));
     LastJahr   :=KasBuchJahr.AsInteger;

     KasBuch.Close;
end;

procedure TKassenBuchForm.KasBuchAfterOpen(DataSet: TDataSet);
var d : tDateTime;
begin
     StartSaldoTab.Close;
     StartSaldoTab.ParamByName ('JAHR').Value :=DatumAW.Year;
     StartSaldoTab.ParamByName ('VDAT').Value :=DatumAW.StartDate;
     StartSaldoTab.Open;

     EndSaldoTab.Close;
     EndSaldoTab.ParamByName ('JAHR').Value :=DatumAW.Year;
     EndSaldoTab.ParamByName ('BDAT').Value :=DatumAW.EndDate;
     EndSaldoTab.Open;

     KasBuchZeitraum :=DatumAW.Text;

     D :=StartSaldoTabDatum.AsDateTime;
     if D<DatumAW.StartDate then D :=DatumAW.StartDate;
     StartDatum.Caption :=FormatDateTime ('dd.mm.yyyy',D);
     KasBuchStartDatum  :=D;
     StartSaldo.Caption :=FormatFloat (',###,##0.00;-,###,##0.00',StartSaldoTabSaldo.Value);
     KasBuchStartSaldo  :=StartSaldoTabSaldo.AsFloat;
     StartSaldoTab.Close;

     D :=EndSaldoTabDatum.AsDateTime;
     if D<DatumAW.StartDate then D :=DatumAW.Enddate;
     if D>Now then d :=Now;
     EndDatum.Caption :=FormatDateTime ('dd.mm.yyyy',D);
     KasBuchEndDatum  :=DatumAW.Enddate;
     KasBuchLeBuchungDatum :=D;
     EndSaldo.Caption :=FormatFloat (',###,##0.00;-,###,##0.00',EndSaldoTabSaldo.Value);
     KasBuchEndSaldo  :=EndSaldoTabSaldo.AsFloat;
     EndSaldoTab.Close;
end;

procedure TKassenBuchForm.KasBuchCalcFields(DataSet: TDataSet);
begin
     Case KasBuchQuelle.Value of
           0 : KasBuchQuelleStr.Value :='Anfangsbestand';
           3 : KasBuchQuelleStr.Value :='Verkauf';
          13 : KasBuchQuelleStr.Value :='VK-Kasse';
           5 : KasBuchQuelleStr.Value :='Einkauf';
          99 : KasBuchQuelleStr.Value :='man. Buchung';
         else KasBuchQuelleStr.Value :='???';
     end;
end;

procedure TKassenBuchForm.KasBuchGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=vk_f5 then
     begin
          key :=0;
          Aktualisieren1Click(Sender);
     end;
end;

procedure TKassenBuchForm.Kassenbuchdrucken1Click(Sender: TObject);
begin
     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowKasBuchDlg (KasBuchStartDatum,
                                   KasBuchEndDatum,
                                   KasBuchLeBuchungDatum,
                                   KasBuchStartSaldo,
                                   KasBuchEndSaldo,
                                   KasBuchZeitraum);
     {$ENDIF}
end;

procedure TKassenBuchForm.Layoutspeichern1Click(Sender: TObject);
begin
     dm1.GridSaveLayout (tDBGrid(KasBuchGrid),'KASSENBUCH');
end;

procedure TKassenBuchForm.ManuelleBuchung1Click(Sender: TObject);
var ManKasBuchForm : TManKasBuchForm;
begin
     ManKasBuchForm :=TManKasBuchForm.Create(Self);
     try
        ManKasBuchForm.ShowDlg;
     finally
        ManKasBuchForm.Free;
     end;
     Aktualisieren1Click(Sender);
end;

procedure TKassenBuchForm.SichtbareSpalten1Click(Sender: TObject);
begin
     VisibleSpaltenForm.UpdateTable (tDBGrid(KasBuchGrid));
end;

procedure TKassenBuchForm.Storno1Click(Sender: TObject);
begin
     if MessageDlg ('Wollen Sie die Kassenbuchung wirklich löschen ?',
                    mtconfirmation,[mbyes, mbno],0)=mryes then
     begin
        KasBuch.Delete;
        Aktualisieren1Click(Sender);
     end;
end;

procedure TKassenBuchForm.Suchen1Click(Sender: TObject);
begin
     FindDialog1.Execute;
end;

procedure TKassenBuchForm.TopPanResize(Sender: TObject);
begin
     DatumAW.Left :=TopPan.Width - DatumAW.Width-4;
end;

procedure TKassenBuchForm.FormActivate(Sender: TObject);
var ID : Integer; HasAB : Boolean; Ja, Mo, Ta : Word;
begin
     if First then
     begin
        LastID :=-1;

//        KasBuchGrid.RowColor1 :=DM1.C2Color;
//        KasBuchGrid.EditColor :=DM1.EditColor;

        dm1.GridLoadLayout (tDBGrid(KasBuchGrid),'KASSENBUCH');

        WaehrungLab1.Caption :=DM1.LeitWaehrung;
        WaehrungLab2.Caption :=DM1.LeitWaehrung;

        KasBuchZU_ABGANG.DisplayFormat :=',###,##0.00" '+DM1.LeitWaehrung+' ";'+
                                         '-,###,##0.00" '+DM1.LeitWaehrung+' "';

        ID :=DM1.ReadIntegerU ('JOURNALE\KASSENBUCH','RANGE',-1);
        if (ID>-1) and (LastRange<>ID) then
        begin
           LastRange :=ID;
           DatumAW.KindRange :=tKindRange(LastRange);
        end;

        LastSDate :=DM1.ReadIntegerU ('JOURNALE\KASSENBUCH','START-DATE',-1);
        if (LastSDate<>-1)and(LastSDate<>DatumAW.StartDate)
         then DatumAW.StartDate :=LastSDate;

        DatumAWChange(Sender);
        First :=False;


        HasAB :=False;
        // Prüfen ob ein Anfangsbestand für dieses Jahr vorhanden ist
        DM1.Uniquery.Close;
        DM1.Uniquery.Sql.Text :='select count(*) as ANZAHL from FIBU_KASSE '+
                                'where JAHR = '+Inttostr(DatumAW.Year)+
                                ' and QUELLE=0';
        DM1.Uniquery.Open;
        if (DM1.UniQuery.RecordCount=1)and
           (DM1.Uniquery.FieldByName('ANZAHL').AsInteger>0)
          then HasAB :=True;
        DM1.Uniquery.Close;

        DecodeDate (Now, Ja, Mo, Ta);
        Anfangsbestand1.Enabled :=(not HasAB)and(DatumAW.Year<=JA);
     end;

     ID :=LastID;
     KasBuch.Open;
     if ID>0 then KasBuch.Locate ('REC_ID;JAHR;BDATUM',
                                  VarArrayOf([LastID,LastJahr,LastBDatum]),[]);
     KasBuchGrid.SetFocus;
end;

procedure TKassenBuchForm.FindDialog1Find(Sender: TObject);
var f,t : string;
    i : integer;
    Found : Boolean;
begin
     i :=KasBuchGrid.Columns.Count;
     i :=KasBuchGrid.FixedCols;
     f :=KasBuchGrid.Columns[i-1].FieldName;
     t :=FindDialog1.FindText;
     Found :=False;
     if frDown in FindDialog1.Options then KasBuch.Next
                                      else KasBuch.Prior;
     repeat
           if frMatchCase in FindDialog1.Options then
           begin
                // Groß- und Kleinschreibung beachten
                Found :=Pos (t,KasBuch.FieldByName(f).AsString)>0;
           end
              else
           begin
                // Groß- und Kleinschreibung nicht beachten
                Found :=Pos (uppercase(t),uppercase(KasBuch.FieldByName(f).AsString))>0;
           end;

           if not Found then
           begin
             if frDown in FindDialog1.Options then KasBuch.Next
                                              else KasBuch.Prior;
           end;
     until (KasBuch.Eof)or(KasBuch.Bof)or(Found);
end;

procedure TKassenBuchForm.DatumAWChange(Sender: TObject);
var HasAB : Boolean; Ja, Mo, Ta : Word;
begin
     KasBuch.Close;
     KasBuch.ParamByName ('JAHR').Value :=DatumAW.Year;
     KasBuch.ParamByName ('VDAT').Value :=DatumAW.StartDate;
     KasBuch.ParamByName ('BDAT').Value :=DatumAW.EndDate;

     if not First then
     begin
       KasBuch.Open;

       HasAB :=False;
       // Prüfen ob ein Anfangsbestand für dieses Jahr vorhanden ist
       DM1.Uniquery.Close;
       DM1.Uniquery.Sql.Text :='select count(*) as ANZAHL from FIBU_KASSE '+
                               'where JAHR = '+Inttostr(DatumAW.Year)+
                               ' and QUELLE=0';
       DM1.Uniquery.Open;
       if (DM1.UniQuery.RecordCount=1)and
          (DM1.Uniquery.FieldByName('ANZAHL').AsInteger>0)
         then HasAB :=True;
       DM1.Uniquery.Close;

       DecodeDate (Now, Ja, Mo, Ta);
       Anfangsbestand1.Enabled :=(not HasAB)and(DatumAW.Year<=JA);

       if ord(DatumAW.KindRange)<>LastRange then
       begin
         DM1.WriteStringU  ('JOURNALE','Default','Benutzer-Journaleinstellungen');
         DM1.WriteIntegerU ('JOURNALE\KASSENBUCH','RANGE',
                              Ord(DatumAW.KindRange));
       end;
       DM1.WriteIntegerU ('JOURNALE\KASSENBUCH','START-DATE',Trunc(DatumAW.StartDate));
     end;
end;

procedure TKassenBuchForm.Anfangsbestand1Click(Sender: TObject);
var LastSaldo : Double;
    KasBuchAB : TKasBuchAB;
begin
     DM1.Uniquery.Close;
     DM1.Uniquery.Sql.Text :='select sum(ZU_ABGANG) as SALDO, max(BDATUM) as DATUM '+
                             'from FIBU_KASSE '+
                             'where JAHR='+Inttostr(DatumAW.Year-1)+' and BDATUM <= :BDAT';
     DM1.Uniquery.ParamByName ('BDAT').AsDateTime :=EncodeDate (DatumAW.Year-1,12,31);
     DM1.Uniquery.Open;

     if (DM1.Uniquery.RecordCount=1)
      then LastSaldo :=DM1.Uniquery.FieldByName ('SALDO').AsFloat
      else LastSaldo :=0;

     DM1.Uniquery.Close;

     KasBuchAB :=TKasBuchAB.Create (Self);
     try
       KasBuchAB.LastSaldo :=LastSaldo;
       KasBuchAB.LastJahr  :=DatumAW.Year-1;
       KasBuchAB.ShowModal;
     finally
       KasBuchAB.Free;
     end;
     DatumAWChange(Sender);
end;

procedure TKassenBuchForm.Aktualisieren1Click(Sender: TObject);
begin
     KasBuch.Refresh;
     KasBuchAfterOpen(nil);
end;

end.

