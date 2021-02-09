{******************************************************************************}
{ PROJEKT      : CAO-FAKTURA                                                   }
{ DATEI        : CAO_LINK.PAS / DFM                                            }
{ BESCHREIBUNG : Universelles Modul um Dateien jeglicher Art Artikel, Adressen }
{                und Vorgängen zuzuordnen                                      }
{ STAND        : 03.02.2004                                                    }
{ VERSION      :                                                               }
{                                                                              }
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
{ 11.10.2003 - Unit erstellt                                                   }
{ 03.02.2004 - Unit Variants für >=Delphi 6 integriert                         }
{                                                                              }
{                                                                              }
{ Todo :                                                                       }
{                                                                              }
{******************************************************************************}

{
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}
unit CAO_Link;

{$IFDEF FPC} {$MODE DELPHI} {$H+} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, Messages, Variants, ImgList, ShellApi, JvTypes, ZDataset,
  ZAbstractRODataset, Forms, ShellCtrls;

Type
  TDropEvent = procedure(Sender: TObject; Pos: TPoint; Value: TStringList) of object;

type
  TCaoDragDrop = class(TComponent)
  private
    FAcceptDrag: Boolean;
    FFiles: TStringList;
    FOnDrop: TDropEvent;
    FIsHooked: Boolean;
    procedure DropFiles(Handle: HDROP);

    function WndProc(var Msg: TMessage): Boolean;
  protected
    procedure HookControl (Owner : tWinControl);
    procedure UnHookControl (Owner : tWinControl);
    procedure Loaded; override;
  public
    procedure SetAcceptDrag(Value: Boolean; Owner : tWinControl);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { (rb) Should be changed to TStrings }
    property Files: TStringList read FFiles;
  published
    //property AcceptDrag: Boolean read FAcceptDrag write SetAcceptDrag default True;
    property OnDrop: TDropEvent read FOnDrop write FOnDrop;
  end;

type

  { TLinkForm }

  TLinkForm = class(TForm)
    LinkDS: TDataSource;
    ImageList1: TImageList;
    LinkTabDATEI: TZRawStringField;
    LinkTabMODUL_ID: TZSmallIntField;
    LinkTabPFAD: TZRawStringField;
    LinkTabREC_ID: TZIntegerField;
    LV1: TListView;
    MainPanel: TPanel;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    AddBtn: TToolButton;
    DelBtn: TToolButton;
    DetailsBtn: TToolButton;
    ToolButton7: TToolButton;
    GrSymBtn: TToolButton;
    KLSymBtn: TToolButton;
    ListeBtn: TToolButton;
    LinkTab: TZQuery;
    procedure AddBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure DetailsBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure GrSymBtnClick(Sender: TObject);
    procedure KLSymBtnClick(Sender: TObject);
    procedure LinkTabAfterOpen(DataSet: TDataSet);
    procedure LinkTabBeforePost(DataSet: TDataSet);
    procedure ListeBtnClick(Sender: TObject);
    procedure LV1DblClick(Sender: TObject);
    procedure JvDragDrop1Drop(Sender: TObject; Pos: TPoint;
      Value: TStringList);
    procedure LV1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private-Deklarationen }
    First       : Boolean;
    CaoDragDrop : TCaoDragDrop;
    FileInfo    : tshFileInfo; { unit ShellAPI }
    CurrOwner   : tWinControl;
    FCurrModul  : Integer;
    FCurrRecID  : Integer;
  public
    { Public-Deklarationen }
    procedure SetModul (ModulID, RecID : Integer; Sender: TObject);
    procedure AddLink  (ModulID, RecID : Integer; Datei : String);
    function  DelLinks (ModulID, RecID : Integer) : Boolean;

    property CurrModul : Integer Read FCurrModul;
    property CurrRecID : Integer Read FCurrRecID;
  end;

var
  LinkForm: TLinkForm;

implementation

{$R *.frm}

uses
  CAO_DM, CAO_MAIN, JvWndProcHook;

const
  FileTimeBase      = -109205.0;
  FileTimeStep: Extended = 24.0 * 60.0 * 60.0 * 1000.0 * 1000.0 * 10.0; // 100 nSek per Day


 type
  PULargeInteger = ^TULargeInteger;
  TULargeInteger = record
    case Integer of
    0: (
      LowPart: LongWord;
      HighPart: LongWord);
    1: (
      QuadPart: Int64);
  end;

  //------------------------------------------------------------------------------
function FileTimeToDateTime(const FileTime: TFileTime): TDateTime;
begin
  Result := Int64(FileTime) / FileTimeStep;
  Result := Result + FileTimeBase;
end;
//------------------------------------------------------------------------------
function PathAddSeparator(const Path: string): string;
begin
  Result := Path;
  if (Length(Path) = 0) or (AnsiLastChar(Path) <> PathSeparator) then
    Result := Path + PathSeparator;
end;
//------------------------------------------------------------------------------
function GetSizeOfFile(const FileName: string): Int64;
var
  Handle: THandle;
  FindData: TWin32FindData;
  Size: TULargeInteger;
begin
  Result := 0;
  Handle := FindFirstFile(PChar(FileName), FindData);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(Handle);
    Size.LowPart := FindData.nFileSizeLow;
    Size.HighPart := FindData.nFileSizeHigh;
    Result := Size.QuadPart;
  end
  else
    RaiseLastOSError;
end;
//------------------------------------------------------------------------------
function GetFileInformation(const FileName: string): TSearchRec;
begin
  if FindFirst(FileName, faAnyFile, Result) = 0 then
    SysUtils.FindClose(Result)
  else
    RaiseLastOSError;
end;
//------------------------------------------------------------------------------
function GetFileLastWrite(const FileName: string): TFileTime;
begin
  Result := GetFileInformation(FileName).FindData.ftLastWriteTime;
end;
//------------------------------------------------------------------------------
{ TLinkForm }
//------------------------------------------------------------------------------
procedure TLinkForm.LinkTabAfterOpen(DataSet: TDataSet);
var NewItem : tListItem;
    T       : tDateTime;
    P,D,S1  : String;
    S       : Int64;
begin
  LV1.Items.BeginUpdate;
  try
    LV1.Items.Clear;
    if LinkTab.RecordCount>0 then
    begin
       LinkTab.First;
       while not LinkTab.Eof do
       begin
          P :=PathAddSeparator(LinkTabPfad.AsString);
          D :=LinkTabDatei.AsString;
          if not FileExists (P+D)
           then begin LinkTab.Next; continue; end;

          shGetFileInfo(PChar(P+D), {FILE_ATTRIBUTE_NORMAL}0, FileInfo,
                        SizeOf(FileInfo),
                        {SHGFI_TYPENAME Or SHGFI_USEFILEATTRIBUTES Or
                        SHGFI_SYSICONINDEX Or SHGFI_ICON}
                        SHGFI_SYSIconIndex or SHGFI_TYPENAME);

          NewItem :=LV1.Items.Add;
          NewItem.Caption :=D;
          NewItem.SubItems.Add (P);
          NewItem.ImageIndex :=FileInfo.iIcon;

          //Größe
          S :=GetSizeOfFile(P+D);

          if S<1024 then S1 :=FormatFloat (',#0" Byte"',S) else
          if S<1024*1024 then S1 :=FormatFloat (',#0.0" kB"',S / 1024) else
          if S<1024*1024*1024 then S1 :=FormatFloat (',#0.0" MB"',S / (1024*1024)) else
          S1 :=FormatFloat (',#0.00" GB"',S / (1024*1024*1024));
          NewItem.SubItems.Add (S1);

          //Typ
          NewItem.SubItems.Add (FileInfo.szTypeName);

          //Geändert
          T :=FileTimeToDateTime (GetFileLastWrite(P+D));
          NewItem.SubItems.Add (FormatDateTime ('dd.mm.yyyy hh:mm:ss',T));

          LinkTab.Next;
       end;
    end;
  finally
    LV1.Items.EndUpdate;
    LV1.Invalidate;
    LV1.Repaint;
  end;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.FormCreate(Sender: TObject);
begin
  First       :=True;
  CaoDragDrop :=nil;
  CurrOwner   :=nil;
  {Get/set system-imagelist for small icons:}
  lv1.SmallImages              := TImageList.Create(Self);

//  lv1.SmallImages.Handle       := SHGetFileInfo('', 0,
//                                                FileInfo,
//                                                SizeOf(FileInfo),
//                                                SHGFI_SYSICONINDEX or
//                                                SHGFI_SMALLICON);
  lv1.SmallImages.ShareImages  := True;

  lv1.LargeImages := TImageList.Create(Self);
//  lv1.LargeImages.Handle := SHGetFileInfo('', 0,
//                                          FileInfo,
//                                          SizeOf(FileInfo),
//                                          SHGFI_SYSICONINDEX or
//                                          SHGFI_LARGEICON);
  lv1.LargeImages.ShareImages := True;

  CaoDragDrop :=tCaoDragDrop.Create (self);
  CaoDragDrop.OnDrop :=JvDragDrop1Drop;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.FormDeactivate(Sender: TObject);
begin
  LinkTab.Close;
  CaoDragDrop.SetAcceptDrag (False,CurrOwner);
  CurrOwner :=nil;
  LV1.Items.Clear;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.GrSymBtnClick(Sender: TObject);
begin
  LV1.ViewStyle :=vsIcon;
  DM1.WriteIntegerU ('','DATEI_LINK_ANSICHT',ord(LV1.ViewStyle));
end;
//------------------------------------------------------------------------------
procedure TLinkForm.KLSymBtnClick(Sender: TObject);
begin
  LV1.ViewStyle :=vsSmallIcon;
  DM1.WriteIntegerU ('','DATEI_LINK_ANSICHT',ord(LV1.ViewStyle));
end;
//------------------------------------------------------------------------------
procedure TLinkForm.FormActivate(Sender: TObject);
begin
  if First then
  begin
     First :=False;
     LV1.ViewStyle :=
       TViewStyle(DM1.ReadIntegerU ('','DATEI_LINK_ANSICHT',ord(vsIcon)));
  end;

  LinkTab.Close;
  LinkTab.ParamByName ('MID').AsInteger :=FCurrModul;
  LinkTab.ParamByName ('RID').AsInteger :=FCurrRecID;
  LinkTab.Open;

  CurrOwner :=tWinControl(Sender);
  CaoDragDrop.SetAcceptDrag (True,tWinControl(Sender));
end;
//------------------------------------------------------------------------------
procedure TLinkForm.AddBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    LinkTab.Append;
    LinkTabPfad.AsString  :=ExtractFilePath (OpenDialog1.FileName);
    LinkTabDatei.AsString :=ExtractFileName (OpenDialog1.FileName);
    LinkTab.Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.DelBtnClick(Sender: TObject);
var Name, Dir : String;
begin
  if LV1.ItemFocused = Nil then exit;
  Name :=LV1.ItemFocused.Caption;
  Dir  :=LV1.ItemFocused.SubItems[0];

  if LinkTab.Locate ('PFAD;DATEI',VarArrayOf ([Dir,Name]),[]) then
  begin
     if MessageDlg ('Wollen Sie die Verknüpfung zu'+#13#10+
                    Name+' wirklich löschen ?',mtconfirmation,
                    [mbyes, mbno],0)=mryes then
     begin
        LinkTab.Delete;
        LV1.ItemFocused.Delete;
     end;
  end;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.DetailsBtnClick(Sender: TObject);
begin
  LV1.ViewStyle :=vsReport;
  DM1.WriteIntegerU ('','DATEI_LINK_ANSICHT',ord(LV1.ViewStyle));
end;
//------------------------------------------------------------------------------
procedure TLinkForm.LinkTabBeforePost(DataSet: TDataSet);
begin
  LinkTabMODUL_ID.AsInteger :=FCurrModul;
  LinkTabREC_ID.AsInteger   :=FCurrRecID;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.ListeBtnClick(Sender: TObject);
begin
  LV1.ViewStyle :=vsList;
  DM1.WriteIntegerU ('','DATEI_LINK_ANSICHT',ord(LV1.ViewStyle));
end;
//------------------------------------------------------------------------------
procedure TLinkForm.LV1DblClick(Sender: TObject);
var Ext, Cmd, Name, Dir : String;
    Executable          : array[0..500] of Char;
begin
  //in_progstart :=true;
  if LV1.ItemFocused = Nil then exit;

  Name :=LV1.ItemFocused.Caption;
  Dir  :=LV1.ItemFocused.SubItems[0];

  Cmd :='';

  //ist es ein Directory ???
  if DirectoryExists (Dir+Name) then
  begin
     Name :='EXPLORER.EXE';
     CMD :=Dir;
     Dir :='';
  end;


  try
     Ext :='';
     if (length(Name)>0) then Ext :=uppercase(ExtractFileExt (name));
     if ((ext='.EXE')or(ext='.COM')) then
     begin
        // Programm wurde angegeben
        MainForm.StarteNewProgramm (Name, Cmd, Dir);
     end
        else
     begin
        cmd :=name+#0;
        name :='';

        // zugeordnete Programdatei suchen
        fillchar (Executable,sizeof (Executable),#32);
        Executable[0] :=#0;
        if findexecutable (pchar(cmd),pchar(dir),@executable) >32
         then MainForm.StarteNewProgramm (Executable, Cmd, Dir)
         else MessageDlg ('Konnte kein Programm für diesen Dateityp finden.',
                          mterror,[mbok],0);
     end;
  finally
    //in_progstart :=False;
  end;
end;

//------------------------------------------------------------------------------
constructor tCaoDragDrop.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAcceptDrag := True;
  FFiles := TStringList.Create;
  FIsHooked := False;
end;
//------------------------------------------------------------------------------
destructor tCaoDragDrop.Destroy;
begin
  FFiles.Free;
  UnHookControl (nil);
  inherited Destroy;
end;
//------------------------------------------------------------------------------
procedure tCaoDragDrop.SetAcceptDrag(Value: Boolean; Owner : tWinControl);
begin
  FAcceptDrag := Value;
  if [csDesigning, csLoading] * ComponentState <> [] then
    Exit;

  if Owner is TWinControl then
  begin
    DragAcceptFiles(TWinControl(Owner).Handle, FAcceptDrag);
    if FAcceptDrag then
      HookControl (TWinControl(Owner))
    else
      UnHookControl (TWinControl(Owner));
  end;
end;
//------------------------------------------------------------------------------
function tCaoDragDrop.WndProc(var Msg: TMessage): boolean;
begin
  Result := (Msg.Msg=WM_DROPFILES);//or(Msg.Msg=45075{4321});
  if Result then
    DropFiles(HDrop(Msg.wParam))
end;
//------------------------------------------------------------------------------
procedure tCaoDragDrop.DropFiles(Handle: HDROP);
var
  pszFileWithPath, pszFile: PChar;
  iFile, iStrLen, iTempLen: Integer;
  MousePt: TPoint;
  Count: Integer;
begin
  FFiles.Clear;
  iStrLen := 128;
  pszFileWithPath := StrAlloc(iStrLen);
  pszFile := StrAlloc(iStrLen);
  Count := DragQueryFile(Handle, $FFFFFFFF, pszFile, iStrLen);
  iFile := 0;
  while iFile < Count do
  begin
    iTempLen := DragQueryFile(Handle, iFile, nil, 0) + 1;
    if iTempLen > iStrLen then
    begin
      iStrLen := iTempLen;
      StrDispose(pszFileWithPath);
      pszFileWithPath := StrAlloc(iStrLen);
    end;
    DragQueryFile(Handle, iFile, pszFileWithPath, iStrLen);
    FFiles.Add(StrPas(pszFileWithPath));
    Inc(iFile);
  end;
  StrDispose(pszFileWithPath);
  if Assigned(FOnDrop) then
  begin
    DragQueryPoint(Handle, @MousePt);
    FOnDrop(Self, MousePt, FFiles);
  end;
  DragFinish(Handle);
end;
procedure tCaoDragDrop.Loaded;
begin
  inherited Loaded;
  SetAcceptDrag(FAcceptDrag,nil);
end;
//------------------------------------------------------------------------------
procedure tCaoDragDrop.HookControl (Owner : tWinControl);
begin
  if FIsHooked then Exit;

  if (Owner is TWinControl) and not (csDesigning in ComponentState) then
    FIsHooked := RegisterWndProcHook(TWinControl(Owner), WndProc, hoBeforeMsg);
end;
//------------------------------------------------------------------------------
procedure tCaoDragDrop.UnHookControl (Owner : tWinControl);
begin
  if not FIsHooked then Exit;

  FIsHooked := False;

  if (Owner is TWinControl) and not (csDesigning in ComponentState) then
    UnRegisterWndProcHook(TWinControl(Owner), WndProc, hoBeforeMsg);
end;
//------------------------------------------------------------------------------
procedure TLinkForm.SetModul (ModulID, RecID : Integer; Sender: TObject);
begin
     if (FCurrModul=ModulID) and (FCurrRecID=RecID) then exit;

     FCurrModul :=ModulID;
     FCurrRecID :=RecID;
     FormActivate (Sender);
     MainPanel.Invalidate;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.AddLink  (ModulID, RecID : Integer; Datei : String);
var DN : String;
begin
     try
       DN :=ExpandUNCFileName(Datei);

       FCurrModul   :=ModulID;
       FCurrRecID   :=RecID;

       if not LinkTab.Active then LinkTab.Open;

       LinkTab.Append;
       LinkTabPfad.AsString  :=ExtractFilePath (DN);
       LinkTabDatei.AsString :=ExtractFileName (DN);
       try
          LinkTab.Post;
       except
          LinkTab.Cancel;
       end;
     except
     end;
end;
//------------------------------------------------------------------------------
function TLinkForm.DelLinks  (ModulID, RecID : Integer) : Boolean;
begin
     try
       with DM1.Uniquery do
       begin
          SQL.Text :='DELETE FROM LINK '+
                     'WHERE MODUL_ID='+IntToStr(ModulID)+' '+
                     'AND REC_ID='+IntToStr(RecID);
          ExecSql;
          Close;
          SQL.Text :='';

          Result :=True;
       end;
     except
       Result :=False;
     end;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.JvDragDrop1Drop(Sender: TObject; Pos: TPoint;
  Value: TStringList);

var I : Integer; DN : String;
begin
     if Value.Count>0 then
     begin
        for i :=0 to Value.Count-1 do
        begin
          //if DirectoryExists (Value[i]) then continue;

          DN :=ExpandUNCFileName(Value[i]);

          LinkTab.Append;
          LinkTabPfad.AsString  :=ExtractFilePath (DN);
          LinkTabDatei.AsString :=ExtractFileName (DN);
          try
             LinkTab.Post;
          except
             LinkTab.Cancel;
          end;
        end;
     end;
end;
//------------------------------------------------------------------------------
procedure TLinkForm.LV1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=vk_delete then
     begin
       key :=0;
       DelBtnClick(Sender);
     end
        else
     if key=vk_insert then
     begin
       key :=0;
       AddBtnClick(Sender);
     end
        else
     if key=vk_return then
     begin
       key :=0;
       LV1DblClick(Sender);
     end;
end;
//------------------------------------------------------------------------------

end.

