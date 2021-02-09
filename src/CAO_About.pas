{

CAO-Faktura für Windows Version 1.0
Copyright (C) 2002 Jan Pokrandt / Jan@JP-SOFT.de

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

{01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert}

unit CAO_About;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  Buttons, StdCtrls, Grids, JvTypes, RichMemo;

const
  JVCL_VERSIONSTRING ='7.2.1';   // gehört in eine externe unit!!!!

type

  { TAboutBox }

  TAboutBox = class(TForm)
    Image1: TImage;
    Copyright: TLabel;
    OKButton: TBitBtn;
    PC1: TPageControl;
    Panel1: TPanel;
    RichEdit2: TRichMemo;
    RichEdit1: TRichMemo;
    SG1: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.frm}

uses
  CAO_DM, windows, CAO_Backup;

{ TAboutBox }

procedure TAboutBox.FormShow(Sender: TObject);
var puffer  : array[0..255] of Char;
    dc      : hdc;
    FarbStr : String;
    m       : double;
    s       : tMEMORYSTATUS;
//    ST      : String;
    BackupForm : tBackupForm;
begin
  PC1.ActivePage :=PC1.Pages[0];

  s.dwLength :=sizeof (s);
  GlobalMemoryStatus (s);

  with SG1 do
  begin
     Cells[0,0] :='Programm';     Cells[1,0] :=Application.Title+' ('+GetProjectVersion+')';
     Cells[0,1] :='ZEOS-DB';      Cells[1,1] :=dm1.db1.Version;
     Cells[0,2] :='MySQL-Client'; Cells[1,2] :=dm1.db1.ClientVersionStr;  //.Transact1.GetClientInfo;
     Cells[0,3] :='MySQL-Server'; Cells[1,3] :=dm1.db1.ServerVersionStr;  //Transact1.GetServerInfo;
     Cells[0,4] :='Verbindung';   Cells[1,4] :=dm1.DB1.HostName;          //.Transact1.GetHostInfo;
     Cells[0,5] :='Benutzername'; Cells[1,5] :=dm1.User;
     Cells[0,6] :='Rechnername';  Cells[1,6] :=dm1.Comp;

     m :=s.dwTotalPhys / 1024;
     Cells[0,7]:='Phys. Speicher';Cells[1,7]:=formatfloat (',###,##0.00',m) + ' kByte';

     m :=s.dwAvailPhys / 1024;
     Cells[0,8]:='davon frei';    Cells[1,8]:=formatfloat (',###,##0.00',m) + ' kByte';

     fillchar(puffer,254,#0);
     GetWindowsDirectory(@puffer,255);
     cells[0,9]:='Windowsverzeichnis'; cells[1,9]:=puffer;

     GetSystemDirectory(@puffer,255);
     cells[0,10]:='Systemverzeichnis'; cells[1,10]:=puffer;

     Cells[0,11] :='Festplatte Laufwerk C:'; Cells[1,11] :=formatfloat (',##0.00',disksize (3) / 1024 / 1024)+' MByte';
     Cells[0,12] :='Freier Speicher auf C:'; Cells[1,12] :=formatfloat (',##0.00',diskfree (3) / 1024 / 1024)+' MByte';
     cells[0,13] :='Zeit';
     cells[0,14] :='Zeit seit Systemstart';
     cells[0,15] :='Datum';                  cells[1,15] :=formatdatetime ('dd.mm.yyyy',now);
     cells[0,16] :='Grafikauflösung';        cells[1,16] :=inttostr(screen.width)+'x'+inttostr(screen.height);

     dc:=CreateDC('DISPLAY',nil,nil,nil);
     try
        case GetDeviceCaps(DC, BITSPIXEL) of
              1  : Farbstr :='2 Farben';
              4  : Farbstr :='16 Farben';
              8  : Farbstr :='256 Farben';
              16 : Farbstr :='16 bit Farbtiefe';
              24 : Farbstr :='24 bit Farbtiefe';
              32 : Farbstr :='32 bit Farbtiefe';
              else Farbstr :='unbekannte Anz. Farben';
        end;
        cells[0,17]:='Farben';cells[1,17]:=FarbStr;
     finally
        DeleteDC(dc);
     end;
     Cells[0,18] :='Jedi-VCL';   Cells[1,18] :=JVCL_VERSIONSTRING;
     BackupForm :=TBackupForm.Create(Self);
     try
//        Cells[0,19] :='TZipMaster'; Cells[1,19] :=BackupForm.Zip.VersionInfo;
//        Str(BackupForm.Zip.ZipVers/100:3:2,ST);
//        Cells[0,20] :='zipdll.dll'; Cells[1,20] :=ST;
//        Str(BackupForm.Zip.UnzVers/100:3:2,ST);
//        Cells[0,21] :='unzdll.dll'; Cells[1,21] :=ST;
     finally
        FreeAndNil(BackupForm);
     end;

  end;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  PC1.ActivePage:=TabSheet1;
  Close;
end;

procedure TAboutBox.Timer1Timer(Sender: TObject);
var days : integer;
    zeit : tdatetime;
begin
     with SG1 do
     begin
        cells[1,13]:= timetostr(time)+' Uhr';
        days :=trunc(gettickcount / 1000 / 24 / 60 / 60);
        zeit :=frac (gettickcount / 1000 / 24 / 60 / 60);
        cells [1,14] :=Inttostr (Days)+' Tag(e), '+
                       formatdatetime ('h "Stunden", m "Minuten und "s "Sek."',
                                       zeit);
        cells [1,15] :=FormatDateTime ('dddd, dd.mm.yyyy',now);
     end;
end;

end.

