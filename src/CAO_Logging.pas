{
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
Todo:
Muss an die neuen Funktionalitäten von TZSQLMonitor angepasst werden
}
unit CAO_Logging;

{$IFDEF FPC} {$MODE DELPHI} {$H+} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Spin, DBGrids, ZDataset;

type

  { TLogForm }

  TLogForm = class(TForm)
    Button1: TButton;
    SrvStatusDS: TDataSource;
    SrvProzDS: TDataSource;
    SrvProzessGrid: TDBGrid;
    SrvStatusGrid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    LogAktivCB: TCheckBox;
    Memo1: TMemo;
    PC1: TPageControl;
    Panel1: TPanel;
    LogMaxEntryEdit: TSpinEdit;
    StatusBar1: TStatusBar;
    LogTS: TTabSheet;
    SrvVarTS: TTabSheet;
    SrvStatusTS: TTabSheet;
    SrvProzListTS: TTabSheet;
    SrvProzList: TZQuery;
    SrvStatus: TZQuery;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LogAktivCBClick(Sender: TObject);
    procedure LogMaxEntryEditChange(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
    Memo2Merk : AnsiString;
  public
    { Public-Deklarationen }

    LogEnabled : Boolean;
    LogMaxEntry : Integer;

    procedure addlog (t : string);
  end;

var
  LogForm: TLogForm;

implementation

{$R *.frm}

uses
  CAO_DM;

{ TLogForm }

procedure TLogForm.Button1Click(Sender: TObject);
begin
  Memo1.lines.clear;
end;

procedure TLogForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Timer1.Enabled:=false;
  SrvStatus.Close;
  SrvProzList.Close;

  DM1.WriteBooleanU ('','SQL_LOG_AKTIV',LogEnabled);
  DM1.WriteIntegerU ('','SQL_LOG_MAX',LogMaxEntry);
end;

procedure TLogForm.FormCreate(Sender: TObject);
begin
  Timer1.Enabled :=false;
  LogEnabled  :=True;
  LogMaxEntry :=300;
end;

procedure TLogForm.FormShow(Sender: TObject);
begin
//  SrvStatusGrid.RowColor2  :=DM1.C2Color;
//  SrvProzessGrid.RowColor2 :=DM1.C2Color;
  LogMaxEntryEdit.Value    :=LogMaxEntry;
  LogAktivCB.Checked       :=LogEnabled;

  PC1.ActivePage :=LogTS;

  Timer1.Enabled:=true;
  Memo2Merk:='';
  Memo1.Lines.BeginUpdate;
  Memo1.Lines.Clear;
end;

procedure TLogForm.LogAktivCBClick(Sender: TObject);
begin
  Timer1.Enabled:=LogAktivCB.Checked;
  LogEnabled    :=LogAktivCB.Checked;
end;

procedure TLogForm.LogMaxEntryEditChange(Sender: TObject);
begin
  LogMaxEntry :=Round(LogMaxEntryEdit.Value);
end;

procedure TLogForm.PC1Change(Sender: TObject);
begin
  SrvStatus.Active :=False;
  if PC1.ActivePage=SrvStatusTS then
  begin
     SrvStatus.Sql.Text :='SHOW STATUS';
     SrvStatusGrid.Parent :=SrvStatusTS;
  end
     else
  if PC1.ActivePage=SrvVarTS then
  begin
     SrvStatus.Sql.Text :='SHOW VARIABLES';
     SrvStatusGrid.Parent :=SrvVarTS;
  end;

  SrvStatus.Active :=(PC1.ActivePage=SrvStatusTS)or(PC1.ActivePage=SrvVarTS);
  SrvProzList.Active :=PC1.ActivePage=SrvProzListTS;
end;


procedure TLogForm.Timer1Timer(Sender: TObject);

  function ReadTail(FileName:AnsiString; Lines:integer=10; MaxLineSize:integer=80):AnsiString;
  var fs:TFileStream;
    sl:TStringList;
    Bts:integer;
    Buf:AnsiString;
  begin
    fs:=TFileStream.Create(FileName,fmOpenRead);
    bts:=Lines*MaxLineSize;
    fs.Seek(-bts,soFromEnd);
    SetLength(Buf,bts);
    fs.Read(Buf[1],bts);
    sl:=TStringList.Create;
    sl.Text:=Buf;
    sl.BeginUpdate;
    Repeat
      sl.Delete(0);
    until sl.Count<Lines+1;
    sl.EndUpdate;
    Result:=sl.text;
    sl.free;
    fs.free;
  end;
var
  Memo : PChar;

const
  FileName : AnsiString = 'FakturaOS.log';
begin
  if LogAktivCB.Checked then
    if FileExists(FileName,true) then
    begin
      Memo := PChar(ReadTail(FileName));
      if Memo^ <> PChar(Memo2Merk)^ then
      begin
        Memo2Merk:=AnsiString(Memo);
        Memo1.Lines.AddStrings(Memo2Merk);
      end;
    end;
end;

procedure TLogForm.addlog (t : string);
begin
    if (not assigned(memo1)) or
       (not LogEnabled) then exit;
    try
     memo1.text :=memo1.text + #13#10 +
                  formatdatetime ('dd.mm.yy hh:mm:ss',now)+ #13#10 + t;
     while memo1.lines.count > LogMaxEntry do memo1.lines.Delete(0);
    except end;
end;

end.

