{

CAO-Faktura für Windows Version 1.0
Copyright (C) 2004 Jan Pokrandt / Jan@JP-SOFT.de

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
Modul        : CAO_STATISTIC
Stand        : 18.01.2004
Version      : 1.2 RC3
Beschreibung : allgemeines Grundmodul,
               welches alle anderen Module in die Oberfläche einbindet

History :

13.01.2003 - Version 1.2 RC3 released Jan Pokrandt

-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Statistic;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, Buttons, PrintersDlgs, TADbSource, TAGraph, TATools,
  TAMultiSeries, DateTimePicker, ZDataset;

type

  { TStatisticForm }

  TStatisticForm = class(TForm)
    DBChart1: TChart;
    ComboBox1: TComboBox;
    ZVon: TDateTimePicker;
    ZBis: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Series1: TBoxAndWhiskerSeries;
    DbChartSource1: TDbChartSource;
    QueryDS: TDataSource;
    MainPanel: TPanel;
    Panel1: TPanel;
    PrintDialog1: TPrintDialog;
    RefreshBtn: TSpeedButton;
    PrintBtn: TSpeedButton;
    StatusBar1: TStatusBar;
    Query1: TZQuery;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure ZBisChange(Sender: TObject);
    procedure ZVonChange(Sender: TObject);
  private
    { Private-Deklarationen }
    First : Boolean;


  public
    { Public-Deklarationen }
  end;

//var
//  StatisticForm: TStatisticForm;

implementation

{$R *.frm}

uses cao_dm, printers;

{ TStatisticForm }

procedure TStatisticForm.FormCreate(Sender: TObject);
var Ja,Mo,Ta : Word;
begin
     First :=True;
     DecodeDate (Now,Ja,Mo,Ta);
     ZVon.Date :=EncodeDate (Ja,1,1);
     ZBis.Date :=EncodeDate (ja,12,31);
end;

procedure TStatisticForm.FormDeactivate(Sender: TObject);
begin
  Query1.Close;

  DM1.WriteIntegerU('','STATISTIK_START',Round(Int(ZVon.Date)));
  DM1.WriteIntegerU('','STATISTIK_ENDE',Round(Int(ZBis.Date)));
  DM1.WriteIntegerU('','STATISTIK_CHART',ComboBox1.ItemIndex);
end;

procedure TStatisticForm.PrintBtnClick(Sender: TObject);
begin
     if PrintDialog1.Execute then
     begin
//        DBChart1.PrintOrientation (Printer.Orientation);
     end;
end;

procedure TStatisticForm.ZBisChange(Sender: TObject);
begin
     if ZBis.Date<ZVon.Date then ZVon.Date :=ZBis.Date;
     ComboBox1Change(Self);
end;

procedure TStatisticForm.ZVonChange(Sender: TObject);
begin
     if ZVon.Date>ZBis.Date then ZBis.Date :=ZVon.Date;
     ComboBox1Change(Self);
end;

procedure TStatisticForm.FormActivate(Sender: TObject);
begin
  if (First) then
  begin
     ZVon.Date           :=DM1.ReadIntegerU('','STATISTIK_START',Round(Int(ZVon.Date)));
     ZBis.Date           :=DM1.ReadIntegerU('','STATISTIK_ENDE',Round(Int(ZBis.Date)));
     ComboBox1.ItemIndex :=DM1.ReadIntegerU('','STATISTIK_CHART',0);
     First :=False;
  end;
  ComboBox1Change(Self);
  Combobox1.Setfocus;
end;

procedure TStatisticForm.ComboBox1Change(Sender: TObject);
var i : integer;
//    PieSerie : tPieSeries;
//    BarSerie : tBarSeries;
begin
     if First then exit;

     while DBChart1.SeriesCount>0
      do DBChart1.Series[0].Free;

     Query1.Close;

     case ComboBox1.ItemIndex of
        0: begin
             Query1.Sql.Text :=
               ' select'+
               '   A.WARENGRUPPE,'+
               '   W.NAME,'+
               '   ROUND(SUM((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* JP.MENGE),2) as UMSATZ_GES,'+
               '   SUM(JP.MENGE) as MENGE_GES'+
               ' from'+
               '   ARTIKEL A,'+
               '   JOURNAL J,'+
               '   JOURNALPOS JP,'+
               '   WARENGRUPPEN W'+
               ' where'+
               '  J.QUELLE=3 and'+
               '   JP.QUELLE=3 and'+
               '   J.RDATUM>= :ZV and J.RDATUM <=:ZB and'+
               '   J.REC_ID=JP.JOURNAL_ID and'+
               '   A.REC_ID=JP.ARTIKEL_ID and'+
               '   A.WARENGRUPPE=W.ID'+
               ' group by'+
               '  A.WARENGRUPPE'+
               ' Having'+
               '  UMSATZ_GES !=0'+
               ' order by UMSATZ_GES DESC'+
               ' LIMIT 0,100';
             Query1.ParamByName('ZV').AsDateTime :=Int(ZVon.Date);
             Query1.ParamByName('ZB').AsDateTime :=Int(ZBis.Date);
             Query1.Open;

//             PieSerie :=tPieSeries.Create (Self);
//             with PieSerie do
//             begin
//                ParentChart :=DBChart1;
//                Active := False;
//                Marks.ArrowLength := 20;
//                Marks.Style := smsLabelPercent;
//                Marks.Visible := True;
//                DataSource := Query1;
//                SeriesColor := clRed;
//                XLabelsSource := 'NAME';
//                OtherSlice.Style := poBelowPercent;
//                OtherSlice.Text := 'Sonstige';
//                OtherSlice.Value := 2;
//                PieValues.DateTime := False;
//                PieValues.Name := 'Torte';
//                PieValues.Multiplier := 1;
//                PieValues.Order := loNone;
//                PieValues.ValueSource := 'UMSATZ_GES';
//                RotationAngle := 235;
//             end;

//             DBChart1.AddSeries (PieSerie);
//             PieSerie.Active :=True;
             DBChart1.Title.Text.Text :='Umsatz nach Warengruppen';

           end;
        1: begin
             Query1.Sql.Text :=
               'select'+
               '   DATE_FORMAT(RDATUM,"%m.%Y") as D,'+
               '   ROUND(SUM(J.NSUMME),2) as UMSATZ_GES'+
               ' from'+
               '   JOURNAL J'+
               ' where'+
               '   J.QUELLE=3 and'+
               '   J.RDATUM>= :ZV and J.RDATUM <=:ZB'+
               ' group by'+
               '   YEAR(J.RDATUM),'+
               '   MONTH(J.RDATUM)'+
               ' order by'+
               '   YEAR(J.RDATUM),'+
               '   MONTH(J.RDATUM)'+
               ' LIMIT 0,100';
             Query1.ParamByName('ZV').AsDateTime :=Int(ZVon.Date);
             Query1.ParamByName('ZB').AsDateTime :=Int(ZBis.Date);
             Query1.Open;
//             BarSerie :=tBarSeries.Create (Self);
//             with BarSerie do
//             begin
//                ParentChart :=DBChart1;
//                Active := False;
//                Marks.ArrowLength := 20;
//                Marks.Style := smsValue;
//                Marks.Visible := True;
//                DataSource := Query1;
//                PercentFormat := '##0 %';
//                SeriesColor := 56576;
//                ShowInLegend := False;
//                ValueFormat := ',#';
//                VertAxis := aRightAxis;
//                XLabelsSource := 'D';
//                BarBrush.Color := clWhite;
//                BarPen.Visible := False;
//                BarWidthPercent := 65;
//                XValues.DateTime := False;
//                XValues.Name := 'X';
//                XValues.Multiplier := 1;
//                XValues.Order := loAscending;
//                YValues.DateTime := False;
//                YValues.Name := 'Balken';
//                YValues.Multiplier := 1;
//                YValues.Order := loNone;
//                YValues.ValueSource := 'UMSATZ_GES';
//             end;
//             DBChart1.AddSeries (BarSerie);
//             BarSerie.Active :=True;
//             DBChart1.View3DOptions.Orthogonal :=True;
             DBChart1.Title.Text.Text :='Umsatz nach Monaten';
           end;
        2: begin
             Query1.Sql.Text :=
               'select'+
               '   DATE_FORMAT(RDATUM,"%m.%Y") as D,'+
               '   ROUND(SUM(J.NSUMME),2) as UMSATZ_GES'+
               ' from'+
               '   JOURNAL J'+
               ' where'+
               '   J.QUELLE=5 and'+
               '   J.RDATUM>= :ZV and J.RDATUM <=:ZB'+
               ' group by'+
               '   YEAR(J.RDATUM),'+
               '   MONTH(J.RDATUM)'+
               ' order by'+
               '   YEAR(J.RDATUM),'+
               '   MONTH(J.RDATUM)'+
               ' LIMIT 0,100';
             Query1.ParamByName('ZV').AsDateTime :=Int(ZVon.Date);
             Query1.ParamByName('ZB').AsDateTime :=Int(ZBis.Date);
             Query1.Open;
//             BarSerie :=tBarSeries.Create (Self);
//             with BarSerie do
//             begin
//                ParentChart :=DBChart1;
//                Active := False;
//                Marks.ArrowLength := 20;
//                Marks.Style := smsValue;
//                Marks.Visible := True;
//                DataSource := Query1;
//                PercentFormat := '##0 %';
//                SeriesColor := 5592575;
//                ShowInLegend := False;
//                ValueFormat := ',#';
//                VertAxis := aRightAxis;
//                XLabelsSource := 'D';
//                BarBrush.Color := clWhite;
//                BarPen.Visible := False;
//                BarWidthPercent := 65;
//                XValues.DateTime := False;
//                XValues.Name := 'X';
//                XValues.Multiplier := 1;
//                XValues.Order := loAscending;
//                YValues.DateTime := False;
//                YValues.Name := 'Balken';
//                YValues.Multiplier := 1;
//                YValues.Order := loNone;
//                YValues.ValueSource := 'UMSATZ_GES';
//             end;
//             DBChart1.AddSeries (BarSerie);
//             BarSerie.Active :=True;
//             DBChart1.View3DOptions.Orthogonal :=True;
             DBChart1.Title.Text.Text :='Einkauf nach Monaten';
           end;
        3: begin
             Query1.Sql.Text :=
               'select'+
               '   A.NAME1,'+
               '   A.NAME2,'+
               '   ROUND(SUM((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* JP.MENGE),2) as UMSATZ_GES,'+
               '   SUM(JP.MENGE) as MENGE_GES'+
               ' from'+
               '   ADRESSEN A,'+
               '   JOURNAL J,'+
               '   JOURNALPOS JP'+
               ' where'+
               '   J.QUELLE=3 and'+
               '   JP.QUELLE=3 and'+
               '   J.RDATUM>= :ZV and J.RDATUM <=:ZB and'+
               '   J.REC_ID=JP.JOURNAL_ID and'+
               '   A.REC_ID=JP.ADDR_ID'+
               ' group by'+
               '  A.REC_ID'+
               ' order by UMSATZ_GES DESC'+
               ' LIMIT 0,10';
             Query1.ParamByName('ZV').AsDateTime :=Int(ZVon.Date);
             Query1.ParamByName('ZB').AsDateTime :=Int(ZBis.Date);
             Query1.Open;
//             PieSerie :=tPieSeries.Create (Self);
//             with PieSerie do
//             begin
//                ParentChart :=DBChart1;
//                Active := False;
//                Marks.ArrowLength := 8;
//                Marks.Style := smsLabelPercent;
//                Marks.Visible := True;
//                DataSource := Query1;
//                PercentFormat := '##0 %';
//                SeriesColor := clGreen;
//                ValueFormat := '#,##0';
//                XLabelsSource := 'NAME1';
//                OtherSlice.Style := poBelowPercent;
//                OtherSlice.Text := 'Sonstige';
//                OtherSlice.Value := 1;
//                PieValues.DateTime := False;
//                PieValues.Name := 'Torte';
//                PieValues.Multiplier := 1;
//                PieValues.Order := loDescending;
//                PieValues.ValueSource := 'UMSATZ_GES';
//                RotationAngle := 305;
//             end;
//             DBChart1.AddSeries (PieSerie);
//             PieSerie.Active :=True;
             DBChart1.Title.Text.Text :='Kunden / Top 10';
           end;
        4: begin
             Query1.Sql.Text :=
               'select'+
               '   A.ARTNUM,'+
               '   A.MATCHCODE,'+
               '   A.KURZNAME,'+
               '   ROUND(SUM((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* JP.MENGE),2) as UMSATZ_GES,'+
               '   SUM(JP.MENGE) as MENGE_GES'+
               ' from'+
               '  ARTIKEL A,'+
               '   JOURNAL J,'+
               '   JOURNALPOS JP'+
               ' where'+
               '  J.QUELLE=3 and'+
               '   JP.QUELLE=3 and'+
               '   J.RDATUM>= :ZV and J.RDATUM <=:ZB and'+
               '   J.REC_ID=JP.JOURNAL_ID and'+
               '   A.REC_ID=JP.ARTIKEL_ID'+
               ' group by'+
               '  A.REC_ID'+
               ' order by UMSATZ_GES DESC'+
               ' LIMIT 0,10';
             Query1.ParamByName('ZV').AsDateTime :=Int(ZVon.Date);
             Query1.ParamByName('ZB').AsDateTime :=Int(ZBis.Date);
             Query1.Open;
//             PieSerie :=tPieSeries.Create (Self);
//             with PieSerie do
//             begin
//                ParentChart :=DBChart1;
//                Active := False;
//                Marks.ArrowLength := 8;
//                Marks.Style := smsLabelPercent;
//                Marks.Visible := True;
//                DataSource := Query1;
//                PercentFormat := '##0 %';
//                SeriesColor := clGreen;
//                ValueFormat := '#,##0';
//                XLabelsSource := 'KURZNAME';
//                OtherSlice.Style := poBelowPercent;
//                OtherSlice.Text := 'Sonstige';
//                OtherSlice.Value := 1;
//                PieValues.DateTime := False;
//                PieValues.Name := 'Torte';
//                PieValues.Multiplier := 1;
//                PieValues.Order := loDescending;
//                PieValues.ValueSource := 'UMSATZ_GES';
//                RotationAngle := 305;
//             end;
//             DBChart1.AddSeries (PieSerie);
//             PieSerie.Active :=True;
             DBChart1.Title.Text.Text :='Artikel / Top 10';
           end;
     end; //case
//     DBChart1.TopAxis.Title.Caption :='Zeitraum : '+
//                                      FormatDateTime ('dd.mm.yyyy',ZVon.Date)+
//                                      ' bis '+
//                                      FormatDateTime ('dd.mm.yyyy',ZBis.Date);
//     DBChart1.TopAxis.Visible :=True;
end;
//------------------------------------------------------------------------------

end.

