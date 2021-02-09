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
Modul        : CAO_MANDANTAW
Stand        : 16.11.2003
Version      : 1.1.3.30
Beschreibung : Dialog Mandantenauswahl

History :

09.05.2003 - Unit zum GNU-Source hinzugefügt
12.07.2003 - Code zur erstellung eines neuen Mandanten hinzugefügt
             Layout komplett überarbeitet
16.11.2003 - Mandant löschen hinzugefügt

01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_mandantaw;

{$IFDEF FPC} {$MODE DELPHI} {$H+} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Buttons, ZConnection, ZDataset;

type

  { TMandantAWForm }

  TMandantAWForm = class(TForm)
    AktMandantLab: TLabel;
    NextMandantLab: TLabel;
    ServerTestBtn: TBitBtn;
    NewManAbortBtn: TBitBtn;
    SaveBtn: TBitBtn;
    NewMandantNameEdi: TEdit;
    NewServerEdi: TEdit;
    NewDBEdi: TEdit;
    NewUserEdi: TEdit;
    NewPWEdi: TEdit;
    NewPortEdi: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Hinweis: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NeuBtn: TBitBtn;
    MandantDelBtn: TBitBtn;
    UebernehmenBtn: TBitBtn;
    CloseBtn: TBitBtn;
    SrvEdi: TEdit;
    PortEdi: TEdit;
    DBEdi: TEdit;
    UsrEdi: TEdit;
    PasEdi: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MandantLB: TListBox;
    PC1: TPageControl;
    AuswahlTab: TTabSheet;
    NewTab: TTabSheet;
    TestDB: TZConnection;
    TestTab: TZQuery;
    TestTransact: TZTransaction;
    procedure CloseBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MandantCBChange(Sender: TObject);
    procedure MandantDelBtnClick(Sender: TObject);
    procedure NeuBtnClick(Sender: TObject);
    procedure NewDBEdiExit(Sender: TObject);
    procedure NewManAbortBtnClick(Sender: TObject);
    procedure NewMandantNameEdiExit(Sender: TObject);
    procedure NewServerEdiChange(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure ServerTestBtnClick(Sender: TObject);
    procedure UebernehmenBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    ServerOK : Boolean;
  public
    { Public-Deklarationen }
  end;

var
  MandantAWForm: TMandantAWForm;

implementation

{$R *.frm}

uses
  CAO_DM, cao_var_const;

{ TMandantAWForm }

//------------------------------------------------------------------------------
procedure TMandantAWForm.FormCreate(Sender: TObject);
var I : Integer;
begin
     Height :=Height - PC1.TabHeight;

     for i:=0 to PC1.PageCount-1 do PC1.Pages[i].TabVisible :=False;
     PC1.ActivePage :=PC1.Pages[0];

     ServerOK :=False;

     if Screen.PixelsPerInch <> 96 then
     begin
       Self.ScaleBy (96, Screen.PixelsPerInch);
       Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.FormActivate(Sender: TObject);
begin
     {$IFDEF CPU64}
     TestDB.LibraryLocation:='C:\Windows\SysWOW64\libmariadb.dll';
     {$ELSE}
   //  TestDB.LibraryLocation:='C:\Windows\System32\libmariadb.dll';  // funktioniert komischerweise nur unter einer anderen Pfadangabe
     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.FormShow(Sender: TObject);
var i : integer;
begin
     ServerOK :=False;
     PC1.ActivePage :=PC1.Pages[0];
     MandantLB.Items.Clear;

     if length(dm1.mandanttab)=0 then begin NeuBtnClick(Sender); exit; end;

     for i:=0 to length (dm1.mandanttab)-1 do
      MandantLB.Items.Add (dm1.mandanttab[i].Name);


     for i:=0 to MandantLB.Items.Count-1 do
     begin
        if uppercase(MandantLB.Items[i])=uppercase(dm1.AktMandant) then
        begin
          MandantLB.ItemIndex :=I;
          break;
        end;
     end;

     AktMandantLab.Caption :=DM1.AktMandant;

     MandantCBChange(Sender);
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.MandantCBChange(Sender: TObject);
var Mandant : MandantRec;
begin
     MandantDelBtn.Enabled :=(MandantLB.ItemIndex>=0)and
                             (MandantLB.items.count>0);

     if (MandantLB.ItemIndex<0)or
        (MandantLB.ItemIndex>MandantLB.items.count-1) then exit;

     UebernehmenBtn.Enabled :=dm1.AktMandant <> MandantLB.Items[MandantLB.ItemIndex];
     if DM1.GetMandant (MandantLB.Items[MandantLB.ItemIndex],Mandant) then
     begin
        SrvEdi.Text  :=Mandant.Server;
        DBEdi.Text   :=Mandant.DB;
        UsrEdi.Text  :=Mandant.User;
        PasEdi.Text  :=Mandant.Pass;
        PortEdi.Text :=IntToStr(Mandant.Port);
        NextMandantLab.Caption :=Mandant.Name;
     end;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.MandantDelBtnClick(Sender: TObject);
begin
     if dm1.AktMandant = MandantLB.Items[MandantLB.ItemIndex] then
     begin
        MessageDlg ('Der aktuell geladene Mandant kann nicht gelöscht werden.',
                    mterror,[mbok],0);
     end
        else
     begin
        if MessageDlg ('Wollen Sie diesen Mandant wirklih löschen ?'+#13#10+
                       'Aus Sicherheitsgründen wird die Datenbank '+
                       'nicht gelöscht,'+#13#10+
                       'dies müssen Sie per Hand tun.',
                       mterror,[mbYes,mbNo],0)=mryes then
        begin
          DM1.DeleteMandant (MandantLB.Items[MandantLB.ItemIndex]);
          MandantLB.Items.Delete (MandantLB.ItemIndex);
          MandantLB.ItemIndex :=MandantLB.Items.IndexOf(DM1.AktMandant);
          MandantCBChange (Sender);
        end;
     end;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.NeuBtnClick(Sender: TObject);
begin
     PC1.ActivePage         :=NewTab;
     ServerOK               :=False;
     NewPortEdi.Text        :='3306';
     NewServerEdi.Text      :='';
     NewDBEdi.Text          :='';
     NewUserEdi.Text        :='';
     NewPWEdi.Text          :='';
     NewMandantNameEdi.Text :='';
     SaveBtn.Enabled        :=False;
     Hinweis.Caption        :='';
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.NewDBEdiExit(Sender: TObject);
var I : Integer; Error : Boolean;
begin
     Error :=False;
     if length(NewDBEdi.Text)>0 then
     begin
       for i:=1 to length(NewDBEdi.Text) do
       begin
         if not (NewDBEdi.Text[i] in ['A'..'Z','a'..'z','0'..'9','-','_']) then
         begin
            error :=True;
            Break;
         end;
       end;
     end;
     if Error then
     begin
        MessageDlg ('Hier sind nur die Zeichen'+#13#10+
                    '"A-Z", "a-z", "0-9", "-" und "_" zulässig',
                    mterror,[mbok],0);
        NewDBEdi.SetFocus;
     end;
     ServerTestBtn.Enabled :=not Error;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.NewManAbortBtnClick(Sender: TObject);
begin
  PC1.ActivePage :=AuswahlTab;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.NewMandantNameEdiExit(Sender: TObject);
var I : Integer; Error : Boolean;
begin
     Error :=False;
     if length(NewMandantNameEdi.Text)>0 then
     begin
       for i:=1 to length(NewMandantNameEdi.Text) do
       begin
         if not (NewMandantNameEdi.Text[i] in ['A'..'Z','a'..'z','0'..'9','-','_']) then
         begin
            error :=True;
            Break;
         end;
       end;
     end;
     if Error then
     begin
        MessageDlg ('Hier sind nur die Zeichen'+#13#10+
                    '"A-Z", "a-z", "0-9", "-" und "_" zulässig',
                    mterror,[mbok],0);
        NewMandantNameEdi.SetFocus;
     end;
     ServerTestBtn.Enabled :=not Error;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.NewServerEdiChange(Sender: TObject);
begin
     if TestDB.Connected  then TestDB.Disconnect;

     TestDB.HostName  :=NewServerEdi.Text;
     TestDB.Port      :=StrToInt(NewPortEdi.Text);
     TestDB.Database  :=NewDBEdi.Text;
     TestDB.User      :=NewUserEdi.Text;
     TestDB.Password  :=NewPWEdi.Text;

     Hinweis.Caption :='Bitte zunächst "Einstellungen testen" ausführen ...';
     SaveBtn.Enabled :=False;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.SaveBtnClick(Sender: TObject);
var M       : MandantRec;
begin
     M.DB             :=NewDBEdi.Text;
     M.Name           :=NewMandantNameEdi.Text;
     M.Pass           :=NewPWEdi.Text;
     M.Port           :=StrToInt(NewPortEdi.Text);
     M.Server         :=NewServerEdi.Text;
     M.ShowLoginDlg   :=False;
     M.UseNTUserName  :=False;
     M.User           :=NewUserEdi.Text;

     DM1.NewMandant (M);
     PC1.ActivePage :=AuswahlTab;
     FormShow(Sender);
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.ServerTestBtnClick(Sender: TObject);
var V : String; DBName :String;
begin
     if length(NewMandantNameEdi.Text)>0 then
     begin
       V :='';
       try
          TestDB.Connect;
          V :=TestDB.ServerVersionStr;

          if V<>'' then
          begin
             MessageDlg ('Der Server ist erreichbar !'+#13#10+'Server-Version : '+V,
                        mtinformation,[mbok],0);
             ServerOK :=True;
          end
             else
          begin
             ServerOK :=False;
             MessageDlg ('Der Server ist nicht erreichbar !!!'+#13#10+V,
                         mterror,[mbok],0);
          end;
       except
          on E: Exception do
          begin
            V :=E.Message;

            if (Pos('UNBEKANNTE DATENBANK',Uppercase(V))>0)or
               (Pos('UNKNOWN DATABASE',Uppercase(V))>0) then
            begin
               MessageDlg ('Der Server ist erreichbar,'+#13#10+
                           'jedoch existiert die ausgewählte Datenbank noch nicht !',
                           mtinformation,[mbok],0);

               ServerOK :=True;
            end
               else
            if (Pos('ACCESS DENIED',Uppercase(V))>0)or
               (Pos('KEINE ZUGRIFFSBERECHTIGUNG',Uppercase(V))>0) then
            begin
               MessageDlg ('Der Server ist erreichbar,'+#13#10+
                           'jedoch wurde der Zugriff verweigert !',
                           mtinformation,[mbok],0);

               ServerOK :=False;
            end
               else
            begin
               ServerOK :=False;
               MessageDlg ('Der Server ist nicht erreichbar !!!'+#13#10+V,
                           mterror,[mbok],0);
            end;
          end;
       end;
       TestDB.Disconnect;

       if ServerOK then
       begin
          Hinweis.Caption :='Die Einstellungen sind in Ordnung,'+#13#10+
                            'Sie können die neuen Daten jetzt speichern.';
          SaveBtn.Enabled :=True;
       end
          else
       begin
          Hinweis.Caption :='Die Einstellungen sind nicht in Ordnung.'+#13#10+
                            'Speichern nicht möglich.'+#13#10+
                            'Bitte überprüfen Sie Ihre Einstellungen !';
          SaveBtn.Enabled :=False;
       end;
     end
        else
     begin
        Hinweis.Caption :='Der Name des Mandanten kann nicht leer sein !';
        SaveBtn.Enabled :=False;
     end;
end;
//------------------------------------------------------------------------------
procedure TMandantAWForm.UebernehmenBtnClick(Sender: TObject);
begin
     DM1.OpenMandant (MandantLB.Items[MandantLB.ItemIndex],
                      Application.Name,True);
     Close;
end;
//------------------------------------------------------------------------------

end.

