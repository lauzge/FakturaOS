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
Modul        : CAO_PIM
Stand        : 01.11.2003
Version      : 1.1.3.24
Beschreibung : Terminplanung, Aufgaben, Kontakte

History :

16.08.2003 - JP Unit erstellt
01.11.2003 - JP diverse Menüeinträge erweitert


TODO:

-

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Pim;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  cao_var_const, VpBase, VpBaseDS, VpDayView, VpMonthView, VpTaskList,
  VpAlarmDlg, VpDlg, VpData, VpSR, VpCaoDS, VpCaoEvntEditDlg, VpZeosDs;

type

  { TPimForm }

  TPimForm = class(TForm)
    MainPanel: TPanel;
    PanelCalSplit1: TPanel;
    Splitter2: TSplitter;
    CAO_DS: TVpCaoDataStore;
    VpCaoEventEditDialog1: TVpCaoEventEditDialog;
    VpDayView1: TVpDayView;
    Splitter1: TSplitter;
    PanelCalSplit2: TPanel;
    VpMonthView1: TVpMonthView;
    VpTaskList1: TVpTaskList;
    VpControlLink1: TVpControlLink;
    VpNotificationDialog1: TVpNotificationDialog;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Ansicht1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    AuflsungTagesansicht1: TMenuItem;
    N15min1: TMenuItem;
    N30min1: TMenuItem;
    N60min1: TMenuItem;
    VpZeosDatastore1: TVpZeosDatastore;
    Wochenendeanzeigen1: TMenuItem;
    AnzahlTage1: TMenuItem;
    N1Tag1: TMenuItem;
    N2Tage1: TMenuItem;
    N3Tage1: TMenuItem;
    N4Tage1: TMenuItem;
    N5Tage1: TMenuItem;
    N6Tage1: TMenuItem;
    N7Tage1: TMenuItem;
    Sortierung1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CAO_DSLoadResources(Resource: TVpResource);
    procedure CAO_DSPostResources(Resource: TVpResource);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure VpDayView1OwnerEditEvent(Sender: TObject; Event: TVpEvent;
      Resource: TVpResource; var AllowIt: Boolean);
    procedure TagViewAnzahlTageClick(Sender: TObject);
    procedure TagViewAufloesungClick(Sender: TObject);
    procedure Wochenendeanzeigen1Click(Sender: TObject);
    procedure VpTaskList1OwnerEditTask(Sender: TObject; Task: TVpTask;
      Resource: TVpResource; var AllowIt: Boolean);
  private
    { Private-Deklarationen }
    LastDBName : String;
  public
    { Public-Deklarationen }
    TaskDlgHelpContext : Integer;

    First : Boolean;
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure Init;
    procedure AddGeburtstag (D : tDateTime;
                             Name : String;
                             Modul, AddrID, AspID : Integer);
  end;

var
  PimForm: TPimForm;

implementation

{$R *.frm}

uses
  CAO_DM, VpCaoTaskEditDlg;

procedure TPimForm.FormCreate(Sender: TObject);
begin
     OnUpdateStatusBar      :=nil;
     First                  :=True;
     LastDBName             :='';
end;

procedure TPimForm.Init;
var UID : Integer;
begin
     // Tabellen öffnen, damit das Termin-Popup angezeigt werden kann

     UID :=DM1.ReadInteger ('MAIN\PIM','GLOB_USERID',-1);
     if UID<0 then UID :=DM1.UserID;


     LastDBName        :=DM1.DB1.Database;
     CAO_DS.Connected  :=False;
     CAO_DS.Connection :=DM1.DB1;
     CAO_DS.Connected  :=True;
     CAO_DS.ResourceID :=UID;
end;

procedure TPimForm.AddGeburtstag (D : tDateTime;
                                  Name : String;
                                  Modul, AddrID, AspID : Integer);
var Event : TVpEvent;
begin
     Event :=CAO_DS.Resource.Schedule.AddEvent (0,Int(D), Int(D)+0.9999999);

     Event.AllDayEvent    :=False;                   // Ganztägig
     Event.Category       :=8;                       // ist Geburtstag
     Event.Description    :=Name;
     Event.RepeatCode     :=rtYearlyByDate;
     Event.RepeatRangeEnd :=EncodeDate (2099,12,31);

     // Alarm 5 Tage zuvor
     Event.AlarmSet         :=True;
     Event.AlarmAdvanceType :=atDays; // Tage
     Event.AlarmAdvance     :=5;

     Event.UserField6 :=IntToStr(Modul);             // Modul
     Event.UserField7 :=IntToStr(0);                 // Submodul
     Event.UserField8 :=IntToStr(AddrID);            // RecID Modul
     Event.UserField9 :=IntToStr(AspID);             // RecID Submodul

     CAO_DS.PostEvents; //Speichern
     VpCaoEventEditDialog1.TimeFormat:=tf24Hour;
     VpCaoEventEditDialog1.Execute (Event);
end;

procedure TPimForm.FormDeactivate(Sender: TObject);
begin
  //
end;

procedure TPimForm.Layoutspeichern1Click(Sender: TObject);
begin
     DM1.WriteIntegerU ('','PIM_TAG_BREITE',Splitter1.Left);
     DM1.WriteIntegerU ('','PIM_MON_HOEHE',Splitter2.Top);
end;

procedure TPimForm.TagViewAnzahlTageClick(Sender: TObject);
begin
     if not (Sender is tMenuItem) then exit;

     DM1.WriteIntegerU ('','PIM_TAG_ANZTAGE',tMenuItem(Sender).Tag);
     VpDayView1.NumDays :=tMenuItem(Sender).Tag;
     tMenuItem(Sender).Checked :=True;
end;

procedure TPimForm.TagViewAufloesungClick(Sender: TObject);
begin
     if not (Sender is tMenuItem) then exit;

     DM1.WriteIntegerU ('','PIM_TAG_AUFLOESUNG',tMenuItem(Sender).Tag);
     VpDayView1.Granularity :=TVpGranularity(tMenuItem(Sender).Tag);
     tMenuItem(Sender).Checked :=True;
end;

procedure TPimForm.Wochenendeanzeigen1Click(Sender: TObject);
begin
     Wochenendeanzeigen1.Checked :=not Wochenendeanzeigen1.Checked;
     DM1.WriteBooleanU ('','PIM_TAG_ZEIGEWE',Wochenendeanzeigen1.Checked);
     VpDayView1.IncludeWeekends :=Wochenendeanzeigen1.Checked;
end;

procedure TPimForm.VpDayView1OwnerEditEvent(Sender: TObject;
  Event: TVpEvent; Resource: TVpResource; var AllowIt: Boolean);

begin
     VpCaoEventEditDialog1.DataStore := vpDayView1.DataStore;
     VpCaoEventEditDialog1.TimeFormat:=vpDayView1.TimeFormat;
     AllowIt := VpCaoEventEditDialog1.Execute(Event,vpDayView1.TimeFormat);
end;

procedure TPimForm.FormActivate(Sender: TObject);
var I : Integer;
begin
     if (First)or(LastDBName<>DM1.DB1.Database) then
     begin
        First :=False;

        if LastDBName<>DM1.DB1.Database then Init;

        PanelCalSplit2.Width :=MainPanel.Width -
                               Splitter1.Width -
                               DM1.ReadIntegerU ('','PIM_TAG_BREITE',
                                                 Splitter1.Left);
        VpMonthView1.Height :=DM1.ReadIntegerU ('','PIM_MON_HOEHE',
                                                VpMonthView1.Height);
        I :=DM1.ReadIntegerU ('','PIM_TAG_AUFLOESUNG',3);
        VpDayView1.Granularity :=TVpGranularity(I);
        case I of
            3: N15min1.Checked :=True;
            5: N30min1.Checked :=True;
            6: N60min1.Checked :=True;
        end;

        Wochenendeanzeigen1.Checked :=DM1.ReadBooleanU ('','PIM_TAG_ZEIGEWE',True);
        VpDayView1.IncludeWeekends :=Wochenendeanzeigen1.Checked;

        I :=DM1.ReadIntegerU ('','PIM_TAG_ANZTAGE',1);
        VpDayView1.NumDays :=I;
        case I of
            1: N1Tag1.Checked :=True;
            2: N2Tage1.Checked :=True;
            3: N3Tage1.Checked :=True;
            4: N4Tage1.Checked :=True;
            5: N5Tage1.Checked :=True;
            6: N6Tage1.Checked :=True;
            7: N7Tage1.Checked :=True;
        end;
     end;
     VpDayView1.Setfocus;
end;

procedure TPimForm.CAO_DSLoadResources(Resource: TVpResource);
begin
     Resource.ResourceActive      :=True;
     Resource.Description :=DM1.view_user;
     Resource.ResourceID  :=DM1.UserID;
end;

procedure TPimForm.CAO_DSPostResources(Resource: TVpResource);
begin
     //MessageBeep(0);
end;

procedure TPimForm.VpTaskList1OwnerEditTask(Sender: TObject; Task: TVpTask;
  Resource: TVpResource; var AllowIt: Boolean);

var TaskDlg : TCaoTaskEditForm;

begin
    TaskDlg := TCaoTaskEditForm.Create(nil);
    try
      //TaskDlg.Options := TaskDlg.Options + [doSizeable];
      //TaskDlg.DataStore := Task.DataStore;

      TaskDlg.HelpContext :=TaskDlgHelpContext;

      if Task.Description = ''
       then TaskDlg.Caption := RSUntitled + ' - ' + RSDlgTaskEdit
       else TaskDlg.Caption := Task.Description + ' - ' + RSDlgTaskEdit;

      TaskDlg.Task :=Task;
      TaskDlg.PopulateSelf;
      TaskDlg.ShowModal;
      AllowIt := (TaskDlg.ReturnCode = TVpEditorReturnCode(rtCommit));

      Task.Changed := AllowIt;
      if AllowIt then
      begin
        TaskDlg.DePopulateSelf;
        //DataStore.PostTasks;
        //DataStore.NotifyDependents;
      end;

    finally
      TaskDlg.Free;
    end;
end;

end.

