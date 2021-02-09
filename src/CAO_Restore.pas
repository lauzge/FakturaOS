{******************************************************************************}
{ PROJEKT      : CAO-FAKTURA                                                   }
{ DATEI        : CAO_RESTORE.PAS / DFM                                         }
{ BESCHREIBUNG : Dialog zur Rücksicherung (SQL)                                }
{ STAND        : 03.05.2004                                                    }
{ VERSION      : 1.2.5.3                                                       }
{ © 2004 Jan Pokrandt / Jan@JP-Soft.de                                         }
{                                                                              }
{ Diese Unit gehört zum Projekt CAO-Faktura und wird unter der                 }
{ GNU General Public License Version 2.0 freigegeben                           }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ This program is free software; you can redistribute it and/or                }
{ modify it under the terms of the GNU General Public License                  }
{ as published by the Free Software Foundation; either version 2               }
{ of the License, or any later version.                                        }
{                                                                              }
{ This program is distributed in the hope that it will be useful,              }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of               }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                }
{ GNU General Public License for more details.                                 }
{                                                                              }
{ You should have received a copy of the GNU General Public License            }
{ along with this program; if not, write to the Free Software                  }
{ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.  }
{                                                                              }
{    ******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************     }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ Historie :                                                                   }
{ 03.05.2003 - Unit erstellt Jan Pokrandt                                      }
{                                                                              }
{                                                                              }
{ Todo : Dialog und Funktion fertigstellen                                     }
{                                                                              }
{******************************************************************************}

{
-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
TODO:
Muss an die ZIPKomponenten komplett neu angepasst werden
}

unit CAO_Restore;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

{$O-}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, StdCtrls,
  ComCtrls, Buttons, AbUnzper, AbZBrows;

type

  { TRestoreForm }

  TRestoreForm = class(TForm)
    ZipBrowser: TAbZipBrowser;
    TabNameLab: TLabel;
    ZipSizeLab: TLabel;
    Zip: TAbUnZipper;
    StartRestoreBtn: TBitBtn;
    CloseBtn: TBitBtn;
    FileNameEdit1: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PB3: TProgressBar;
    PB1: TProgressBar;
    procedure CloseBtnClick(Sender: TObject);
    procedure FileNameEdit1AcceptFileName(Sender: TObject; var Value: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StartRestoreBtnClick(Sender: TObject);
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

implementation

{$R *.frm}

uses
  CAO_DM, db;

{ TRestoreForm }

procedure TRestoreForm.FormCreate(Sender: TObject);
begin
  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

procedure TRestoreForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not Busy;
end;

procedure TRestoreForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TRestoreForm.FileNameEdit1AcceptFileName(Sender: TObject;
  var Value: String);
begin
  StartRestoreBtn.Enabled :=FileExists(Value);
end;

procedure TRestoreForm.FormShow(Sender: TObject);
var D : String;
begin
  Zip.TempDirectory       :=DM1.TmpDir;
  Busy                    :=False;
  StartRestoreBtn.Enabled :=False;
  ZipSizeLab.Caption      :='';
  PB3.Position            :=0;
  //ZipFileName.Caption     :='';

  d :=dm1.BackupDir+dm1.AktMandant+'\';
  if not DirectoryExists (D) then D :=ExtractFilePath(ParamStr(0));

  FilenameEdit1.FileName   :=D;
end;

procedure TRestoreForm.StartRestoreBtnClick(Sender: TObject);
var RPfad   : string;
    RP, DN  : String;
    DSTab   : Array of Boolean;
    I,SQLCount,Error : Integer;
    SQL,
    SQL2, S, str : String;
//    ZDE     : ZipDirEntry;
    NoSqlFile : Boolean;
    TF        : TextFile;
begin
  rpfad :=dm1.maindir+'Restore\';

  rp :=DM1.Readstring ('MAIN\SICHERUNG','RESTORE_PFAD','@@@');
  if rp = '@@@' then DM1.Writestring ('MAIN\SICHERUNG','RESTORE_PFAD','')
                else if rp <> '' then rpfad :=rp;

  ForceDirectories (RPfad);

  ZipError :=False;

  ZipBrowser.FileName:=FilenameEdit1.FileName;

  zip.FileName :=FilenameEdit1.FileName;

  // Prüfen ob im Zip eine CAO-Datensicherung ist

  NoSqlFile :=False;

  if (Zip.Count=1) then
  begin
//     ZDE :=ZIP.GetNamePath;
      DN  :=uppercase(ChangeFileExt(ExtractFileName(FilenameEdit1.FileName),'.sql'));

     if ZipBrowser.ZipArchive.FindFile(ChangeFileExt(FilenameEdit1.FileName,'.sql')) = 0 then
       NoSqlFile:=true;
//     if (Pos('CAO_BACKUP_',DN)<>1) or
//        (ExtractFileExt(DN)<>'.SQL') then NoSqlFile :=True;

  end else NoSqlFile :=True;

  if NoSqlFile then
  begin
     MessageDlg ('Die angegebene Datei enthält keine CAO-Datensicherung.',
                 mterror,[mbok],0);
     exit;
  end;

  // Pfad hinzufügen
  DN :=RPfad+DN;

  if fileexists (DN) then
  begin
     if MessageDlg ('Die Datei "'+DN+'" existiert bereits, '+#13#10+
                    'soll sie überschrieben werden ?',mtconfirmation,
                    [mbyes, mbcancel],0)<>mryes then exit;

     if not DeleteFile (DN) then exit; // Abbruch, wenn Datei nicht gelöscht werden kann
  end;


  Zip.BaseDirectory :=RPfad;
//  zip.ExtrOptions :=[ExtrOverWrite];
//  zip.FSpecArgs.Clear;
//  zip.FSpecArgs.Add ('CAO_backup_*.sql');
    zip.OpenArchive(FilenameEdit1.FileName);

  if rpfad[length(rpfad)]<>'\' then rpfad :=rpfad+'\';

  try
     Zip.ExtractFiles('CAO_backup_*.sql');
  except
     ZipError :=True;

  end;

  if ZipError then
  begin
     MessageDlg ('Beim Entpacken der Datensicherung ist ein Fehler aufgetreten.'+#13#10+
                 'Aus Sicherheitsgründen wurde die Rücksicherung abgebrochen !',mterror,[mbok],0);
     Exit;
  end;


  AssignFile (TF, DN);
  try
     Reset (TF);

     SQLCount   :=0;
     SQL :='';
     try
        while not Eof(TF) do
        begin
           Readln (TF,S);

           SQL :=SQL+S;
           if (length(SQL)>0)and(S[length(S)]=';') then
           begin
              // SQL ausführen

              inc(SQLCount); Label2.Caption :=IntToStr(SQLCount);
              SQL :='';

              Application.ProcessMessages;
           end;
        end;

        if length(SQL)>0 then
        begin
          // le. SQL ausführen
          inc(SQLCount);  Label2.Caption :=IntToStr(SQLCount);
        end;
     finally
        CloseFile (TF);
     end;
  except
     //Fehler beim Öffnen
  end;


  //exit;

  // Datenbank schließen

  // offene Datasets merken
  setlength(DSTab,DM1.Transact1.DatasetCount);
  for i:=0 to DM1.Transact1.DatasetCount-1 do
  begin
       DSTab[i] :=tDataset(DM1.Transact1.Datasets[i]).Active;
       tDataset(DM1.Transact1.Datasets[i]).Close;
  end;

  // Tabellen umbenennen
  DM1.UniQuery.Close;
  DM1.UniQuery.Sql.Clear;
  DM1.UniQuery.Sql.Add ('FLUSH TABLES');
  DM1.UniQuery.ExecSql;

  //evt. alte Backups löschen
  DM1.UniQuery.Close;
  DM1.UniQuery.Sql.Text :='show Tables from '+DM1.DB1.Database;
  DM1.UniQuery.Open;

  while not DM1.UniQuery.Eof do
  begin
     S :=DM1.UniQuery.FieldByName ('Tables_In_'+DM1.DB1.Database).AsString;
     if Pos('BACK_',UpperCase(S))=1 then
     begin
        if length(SQL)>0 then SQL :=SQL+',';
        SQL :=SQL+S;
     end;
     DM1.UniQuery.Next;
  end;

  // alte Backups löschen
  if length(SQL)>0 then
  begin
    SQL :='DROP TABLE IF EXISTS '+SQL;
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Text :=SQL;
    DM1.UniQuery.ExecSql;
  end;

  // alle Tabellen in BACK_.... unbenennen
  DM1.UniQuery.Close;
  DM1.UniQuery.Sql.Text :='show Tables from '+DM1.DB1.Database;
  DM1.UniQuery.Open;

  Sql :=''; SQL2 :='';

  while not DM1.UniQuery.Eof do
  begin
     S :=DM1.UniQuery.FieldByName ('Tables_In_'+DM1.DB1.Database).AsString;
     //if (Pos('BACK_',Uppercase(S))=0)and(fileexists (rpfad+S+'.MYD')) then
     //begin
        if length(SQL)>0 then SQL :=SQL+',';
        SQL :=SQL+S+' TO BACK_'+S;

        if length(SQL2)>0 then SQL2 :=SQL2+',';
        SQL2 :=SQL2+S;
     //end;
     DM1.UniQuery.Next;
  end;

  if length(SQL)>0 then
  begin
     SQL :='RENAME TABLE '+SQL;
     DM1.UniQuery.Close;
     DM1.UniQuery.Sql.Text :=SQL;
     DM1.UniQuery.ExecSql;
  end;


  pb1.Max      :=SQLCount;
  pb1.Position :=0;
  Error        :=0;

  AssignFile (TF, DN);
  try
     Reset (TF); I:=0;
     SQL :='';
     try
        while not Eof(TF) do
        begin
           Readln (TF,S);
           SQL :=SQL+S;
           if (length(SQL)>0)and(S[length(S)]=';') then
           begin
              inc(I); PB1.Position :=I;

              // SQL ausführen
              DM1.UniQuery.Close;
              DM1.UniQuery.Sql.Text :=SQL;
              try
                 DM1.UniQuery.ExecSql;
              except
                 inc(Error);
              end;


              SQL :='';
              Application.ProcessMessages;
           end;
        end;

        if length(SQL)>0 then
        begin
          // le. SQL ausführen
          DM1.UniQuery.Close;
          DM1.UniQuery.Sql.Text :=SQL;
          try
             DM1.UniQuery.ExecSql;
          except
             inc(Error);
          end;
          inc(I);  PB1.Position :=I;
        end;
     finally
        CloseFile (TF);
     end;
  except
     //Fehler beim Öffnen
  end;








  DM1.OpenMandant (DM1.AktMandant,Application.Name,True);

  // offene Datasets erneut öffnen
  for i:=0 to DM1.Transact1.DatasetCount-1 do
  begin
       if DSTab[i] then tDataset(DM1.Transact1.Datasets[i]).Open;
  end;
  MessageDlg ('Rücksicherung abgeschlossen !!!',mtinformation,[mbok],0);
end;

end.

