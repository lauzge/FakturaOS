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
Modul        : CAO_BACKUP
Stand        : 14.09.2003
Version      : 1.1.3.1
Beschreibung : Dialog zur Erstellung eines Backup-Scriptes (SQL)


History :

13.01.2003 - Version 1.1.1.6 released Jan Pokrandt
14.09.2003 - Beim einlesen der Tabellendaten werden jetzt jeweils max. 1000
             Datensätze euf einmal angefordert (Speichernutzung verringert)

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Backup;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}
{$O-}

interface

uses
  windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Buttons, AbBrowse, AbZipper, AbArcTyp, AbUtils;

type

  { TBackupForm }

  TBackupForm = class(TForm)
    PB2: TProgressBar;
    PB3: TProgressBar;
    PB1: TProgressBar;
    Zip: TAbZipper;
    ZipSizeLab: TLabel;
    TabNameLab: TLabel;
    StartBackupBtn: TBitBtn;
    CloseBtn: TBitBtn;
    BackupPLZBLZ: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ZipFileName: TLabel;
    ZipPfad: TLabel;
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StartBackupBtnClick(Sender: TObject);
    procedure ZipProcessItemFailure(Sender: TObject; Item: TAbArchiveItem;
      ProcessType: TAbProcessType; ErrorClass: TAbErrorClass; ErrorCode: Integer
      );
    procedure ZipProgress(Sender: TObject; Progress: Byte;
      var Abort: Boolean);
  private
    { Private-Deklarationen }
    ZipError : Boolean;

    ZIPTotalSize1,
    ZIPTotalProgress1,
    ZIPTotalSize2,
    ZIPTotalProgress2 : Int64;

    Busy              : Boolean;
  public
    { Public-Deklarationen }
  end;

//var
//  BackupForm: TBackupForm;

implementation

{$R *.frm}

uses
  CAO_DM, DB, CAO_Logging, CAO_Tool1;

{ TBackupForm }

procedure TBackupForm.FormCreate(Sender: TObject);
begin
  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;

end;

procedure TBackupForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBackupForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not Busy;
end;

procedure TBackupForm.FormShow(Sender: TObject);
begin
  //Zip.DLLDirectory       :=ExtractFilePath(ParamStr(0));
  Busy                   :=False;
  StartBackupBtn.Enabled :=True;
  ZipSizeLab.Caption     :='';
  PB3.Position           :=0;
  ZipFileName.Caption    :='';
  Zip.BaseDirectory:=dm1.BackupDir+dm1.AktMandant+'\';
end;

procedure TBackupForm.StartBackupBtnClick(Sender: TObject);
var s ,tab, lastkey, ks, d : string; i, row, x : integer;
     f : textfile; fn : string;
begin
  Busy :=True;
  screen.cursor :=crSqlWait;
  try
    fn :=dm1.BackupDir+dm1.AktMandant+'\';
    ForceDirectories (FN);

    fn :=fn+application.name+'_backup_'+
         formatdatetime ('yyyy_mm_dd_hh_mm',now)+'.sql';

    ZipFileName.Caption :=extractfilename(fn);
    ZipPfad.Caption     :=extractfilepath(fn);

    assignfile (f,fn);
    rewrite (f);
    closefile (f);
    append(f);

    pb3.Position :=0;
    StartBackupBtn.Enabled :=False;
    CloseBtn.Enabled       :=False;
    BackupPLZBLZ.Enabled   :=False;

    try

      s :='# '+Application.Title+#13#10+
          '# Datum :'+FormatDateTime ('dd.mm.yyyy hh:mm:ss "Uhr"',now)+#13#10+
          '# Mandant :'+DM1.AktMandant+#13#10+
          '#'+#13#10;

      dm1.uniquery.close;
      dm1.uniquery.sql.clear;
      dm1.uniquery.sql.text :='SHOW TABLE STATUS';
      dm1.uniquery.open;

      pb1.Max :=dm1.uniquery.recordcount+1;
      pb1.Position :=0;

      while not dm1.uniquery.eof do
      begin
           pb1.position :=dm1.uniquery.RecNo;

           tab :=uppercase(dm1.uniquery.fieldbyName('Name').AsString);

           TabNameLab.Caption :=Tab;

           Application.ProcessMessages;

           s :=s +
              '#'+#13#10+
              '# TABLE ['+Tab+']'+#13#10+
              '#'+#13#10+
              'drop table if exists '+ tab +';'#13#10#13#10;

           s :=s + 'create table '+ tab +' ('+#13#10;

           // Feldnamen
           dm1.UniQuery2.close;
           dm1.UniQuery2.sql.text :='show fields from '+ tab;
           dm1.UniQuery2.Open;

           while not dm1.UniQuery2.eof do
           begin
                s :=s + '  '+
                    dm1.UniQuery2.FieldByName('Field').AsString+' '+
                    dm1.UniQuery2.FieldByName('Type').AsString;

                if length(dm1.UniQuery2.FieldByName('Default').AsString)>0
                 then s :=s+' default '''+dm1.UniQuery2.FieldByName('Default').AsString+'''';

                if dm1.UniQuery2.FieldByName('Null').AsString <>'YES'
                 then s :=s+' not null';

                if length(dm1.UniQuery2.FieldByName('Extra').AsString)>0
                 then s :=s+' '+ dm1.UniQuery2.FieldByName('Extra').AsString;

                if dm1.UniQuery2.RecNo < dm1.UniQuery2.RecordCount
                 then s :=s+','+#13#10;

                dm1.UniQuery2.next;
           end;
           dm1.UniQuery2.Close;

           // Keys
           dm1.UniQuery2.close;
           dm1.UniQuery2.sql.text :='show keys from '+ tab;
           dm1.UniQuery2.Open;

           lastkey :=''; ks :='';
           while not dm1.UniQuery2.eof do
           begin
              if (lastkey<>dm1.UniQuery2.FieldByName('Key_name').AsString)then
              begin
                 if length(ks)>0 then s :=s+','+#13#10 + '  ' + ks +')';
                 ks :='';
                 lastkey :=dm1.UniQuery2.FieldByName('Key_name').AsString;
              end;

              if (lastkey='PRIMARY')and(ks='') then
              begin
                ks :='PRIMARY KEY ('+dm1.UniQuery2.FieldByName('Column_name').AsString;
              end else
              if (dm1.UniQuery2.FieldByName('Non_unique').AsString='0')and(ks='') then
              begin
                 ks :='UNIQUE KEY '+lastkey+' ('+dm1.UniQuery2.FieldByName('Column_name').AsString;
              end else
              if ks='' then
              begin
                 ks :='KEY '+lastkey+' ('+dm1.UniQuery2.FieldByName('Column_name').AsString;
              end else

              begin
                 ks :=ks+', '+dm1.UniQuery2.FieldByName('Column_name').AsString;
              end;

              dm1.UniQuery2.next;
           end;
           dm1.UniQuery2.Close;

           // evt. letzten Key hinzufügen
           if length (ks)>0 then s :=s+','#13#10 + '  '+ ks + ')'+#13#10;

           s :=s+');'+#13#10#13#10;

           writeln (f,s);
           s :='';

           //Daten
           PB2.Max := dm1.UniQuery.FieldByName ('Rows').AsInteger+1;
           PB2.Position :=0;

           if (dm1.UniQuery.FieldByName ('Rows').AsInteger>0) and
              (
               (BackupPLZBLZ.Checked) or
               (
                (not BackupPLZBLZ.Checked) and
                (Tab<>'PLZ') and (Tab<>'BLZ') and (Tab<>'LAND')
               )
              ) then
           begin
             s :=s +
             '#'+#13#10+
             '# TABLE ['+Tab+'] DATA'+#13#10+
             '#'+#13#10;

             write (f,s); s :='';

             row :=-1;
             repeat
               inc(row);
               dm1.UniQuery2.close;
               dm1.UniQuery2.sql.text :='select * from '+ tab + ' limit '+ IntToStr(Row*1000)+',1000';
               dm1.UniQuery2.Open;

               while not dm1.UniQuery2.eof do
               begin
                    PB2.Position :=dm1.UniQuery2.RecNo+Row*1000;
                    Application.ProcessMessages;

                    d:='INSERT INTO ' + Tab + ' VALUES (';

                    for i:=0 to dm1.UniQuery2.FieldCount-1 do
                    begin
                        if i>0 then d:=d+',';
                        if dm1.UniQuery2.Fields[i].IsNull
                         then d :=d + 'NULL'
                         else
                        begin
                          if dm1.UniQuery2.Fields[i].DataType in
                           [ftSmallint, ftInteger, ftWord,
                            ftBoolean, ftBCD, ftBytes,
                            ftVarBytes, ftAutoInc, ftLargeint] then
                          begin
                            d :=d + ''''+dm1.UniQuery2.Fields[i].AsString+'''';
                          end
                             else
                          if dm1.UniQuery2.Fields[i].DataType in
                           [ftDate, ftTime, ftDateTime, ftFloat, ftCurrency] then
                          begin
                            case dm1.UniQuery2.Fields[i].DataType of
                              ftDate:     d :=d + ''''+FormatSqlDate(dm1.UniQuery2.Fields[i].AsDateTime)+'''';
                              ftTime:     d :=d + ''''+FormatSqlTime(dm1.UniQuery2.Fields[i].AsDateTime)+'''';
                              ftDateTime: d :=d + ''''+DateTimeToSqlDate(dm1.UniQuery2.Fields[i].AsDateTime)+'''';
                              ftFloat:    d :=d + ''''+FloatToStrEx(dm1.UniQuery2.Fields[i].AsFloat)+'''';
                              ftCurrency: d :=d + ''''+FloatToStrEx(dm1.UniQuery2.Fields[i].AsFloat)+'''';
                            end;
                          end
                             else
                          begin
                             d :=d + ''''+dm1.UniQuery2.Fields[i].AsString+'''';
                          end;
                        end;
                    end;

                  dm1.UniQuery2.next;

                  d:=d+');';
                  writeln (f,d);
               end;
             until DM1.UniQuery2.RecordCount=0;


             d:=#13#10#13#10;  writeln (f,d);
           end;


           dm1.UniQuery2.Close;
           dm1.uniquery.next;

           PB2.position :=0;
           Application.ProcessMessages;
      end;

      pb1.Position :=dm1.uniquery.RecNo+1;
      Application.ProcessMessages;
      dm1.uniquery.close;
    finally
      closefile (f);
    end;

    // Script packen (ZIP erstellen)
    pb1.position       :=0;
    TabNameLab.Caption :='';
    ZipError           :=False;
    ZipFileName.Caption :=extractfilename(ChangeFileExt (FN,'.zip'));
    ZipPfad.Caption     :=extractfilepath(ChangeFileExt (FN,'.zip'));

    try
      Zip.TempDirectory :=DM1.TmpDir;
//      Zip.FSpecArgs.Clear;
//      Zip.FSpecArgs.Add (FN);
      Zip.BaseDirectory:=ExtractFilePath(ParamStr(0));
      Zip.FileName:=ChangeFileExt (FN,'.zip');
      Zip.AddFiles(FN,0);

      x:=Get_File_Size(Zip.FileName,true);
      ZipSizeLab.Caption :=FormatFloat(',#0.0',x / 1024)+' kB';

      if not ZipError then
      begin
         AssignFile (F, ChangeFileExt (FN,'.sql'));
         Erase (F); // SQL-Datei löschen
      end
         else
      begin
         MessageDlg
           ('Während der Komprimierung ist ein Fehler aufgetreten,'+#13#10+
            'deshalb wurde die Sicherungsdatei :'+#13#10+
            ChangeFileExt (FN,'.sql')+#13#10+
            'nicht gelöscht, Sie müssen dies ggf. selbst tun.'+#13#10+
            'Nähere Informationen zum Fehler finden Sie im Log.',
            mterror,[mbok],0);
      end;

    finally
      screen.cursor :=crDefault;
      StartBackupBtn.Enabled :=True;
      CloseBtn.Enabled :=True;
      BackupPLZBLZ.Enabled :=True;
    end;

    // Datum der le. Sicherung merken
    DM1.WriteString ('MAIN\SICHERUNG','LAST_BACKUP',
                     FormatDateTime ('dd.mm.yyyy',now));
  finally
    Busy :=False;
    screen.cursor :=crDefault;
    StartBackupBtn.Enabled :=True;
    CloseBtn.Enabled :=True;
  end;
end;

procedure TBackupForm.ZipProcessItemFailure(Sender: TObject;
  Item: TAbArchiveItem; ProcessType: TAbProcessType; ErrorClass: TAbErrorClass;
  ErrorCode: Integer);
begin
  MessageDlg
    ('Während der Komprimierung ist der Fehler ('+IntToStr(ErrorCode)+') aufgetreten,'+#13#10+
     'deshalb wurde die Sicherungsdatei :'+#13#10+
     Zip.FileName+#13#10+
     'nicht gelöscht, Sie müssen dies ggf. selbst tun.'+#13#10+
     'Nähere Informationen zum Fehler finden Sie im Log.',
     mterror,[mbok],0);
end;

procedure TBackupForm.ZipProgress(Sender: TObject; Progress: Byte; var Abort: Boolean);
var
   Step: Integer;
begin
  PB3.Position:=Progress;
  Abort := false;
end;

end.

