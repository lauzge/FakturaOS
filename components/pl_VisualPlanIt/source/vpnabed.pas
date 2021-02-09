{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I vp.inc}

unit VpNabEd;
  {-property editor for the NavBar}

interface

uses
  LCLProc, LCLType, LCLIntf,
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PropEdits,
  TyphonPackageIntf,
  FieldsEditor,
  ComponentEditors,
  StdCtrls, ExtCtrls, Buttons,
  VpBase, VpNavBar;

type

  TVpNavBarEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index : Integer); override;
    function GetVerb(Index : Integer) : string; override;
    function GetVerbCount : Integer; override;
  end;

  TfrmNavBarEd = class(TForm)
    pnlItems: TPanel;
    pnlFolders: TPanel;
    lbItems: TListBox;
    lbFolders: TListBox;
    Panel1: TPanel;
    btnItemAdd: TSpeedButton;
    btnItemDelete: TSpeedButton;
    btnItemUp: TSpeedButton;
    btnItemDown: TSpeedButton;
    Panel4: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    btnFolderAdd: TSpeedButton;
    btnFolderDelete: TSpeedButton;
    btnFolderUp: TSpeedButton;
    btnFolderDown: TSpeedButton;
    Panel6: TPanel;
    Label1: TLabel;
    pnlImages: TPanel;
    Panel8: TPanel;
    Label3: TLabel;
    lbImages: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lbFoldersClick(Sender: TObject);
    procedure lbItemsMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure lbItemsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbImagesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbImagesClick(Sender: TObject);
    procedure btnItemUpClick(Sender: TObject);
    procedure btnItemDownClick(Sender: TObject);
    procedure btnFolderUpClick(Sender: TObject);
    procedure btnFolderDownClick(Sender: TObject);
    procedure btnItemDeleteClick(Sender: TObject);
    procedure btnFolderDeleteClick(Sender: TObject);
    procedure btnFolderAddClick(Sender: TObject);
    procedure btnItemAddClick(Sender: TObject);
    procedure lbItemsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    RefreshTimer: TTimer;
    procedure OnTimer(Sender: TObject);
  public
    { Public declarations }
    Bar : TVpNavBar;
    Designer   : TIDesigner;
    procedure PopulateFolderList;
    procedure PopulateItemList;
  end;

var
  frmNavEd: TfrmNavBarEd;

implementation

 {$R *.frm}

uses
  VpMisc;

procedure EditNavBar(Designer : TIDesigner; Bar : TVpNavBar);
var
  i : Integer;
begin
  frmNavEd := TfrmNavBarEd.Create(Application);
  frmNavEd.Bar := Bar;
  frmNavEd.PopulateFolderList;
  frmNavEd.Designer := Designer;
  if Bar.Images <> nil then begin
    frmNavEd.lbImages.ItemHeight := Bar.Images.Height + 4;
    for i := 0 to pred(Bar.Images.Count) do
      frmNavEd.lbImages.Items.Add(IntToStr(i));
  end;
  frmNavEd.Show;
end;

{*** TVpNavBarEditor ***}

procedure TVpNavBarEditor.ExecuteVerb(Index : Integer);
begin
  if Index = 0 then
    EditNavBar(Designer, (Component as TVpNavBar));
end;

function TVpNavBarEditor.GetVerb(Index : Integer) : string;
begin
  if Index = 0 then
    Result := 'Layout Tool...';
end;

function TVpNavBarEditor.GetVerbCount : Integer;
begin
  Result := 1;
end;

{*** TfrmNavBarEd ***}

procedure TfrmNavBarEd.FormCreate(Sender: TObject);
begin
  Top := (Screen.Height - Height) div 3;
  Left := (Screen.Width - Width) div 2;
  RefreshTimer := TTimer.Create(Self);
  RefreshTimer.Interval := 1000;
  RefreshTimer.OnTimer := OnTimer;
  RefreshTimer.Enabled := true;
end;

procedure TfrmNavBarEd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Unused(Action);
  RefreshTimer.Free;
  Release;
end;

{ Changed}
{ Could not find a way to get notification from the IDE that a change had }
{ been made to the component outside of the component editor, so I used a }
{ timer }
procedure TfrmNavBarEd.OnTimer(Sender: TObject);
var
  S : string;
begin
  if Bar.ActiveFolder < 0 then
    exit;

  { update folder }
  S := Bar.Folders[Bar.ActiveFolder].Caption;
  if S = '' then
    S := Bar.Folders[Bar.ActiveFolder].Name;
  lbFolders.Items[Bar.ActiveFolder] := S;

  if (lbItems.ItemIndex > -1) then begin                                 
    S := lbItems.Items.Strings[lbItems.ItemIndex];
    PopulateItemList;
    if S <> '' then
      lbItems.ItemIndex := lbItems.Items.IndexOf(S);                     
  end;                                                                   
end;

procedure TfrmNavBarEd.FormResize(Sender: TObject);
begin
  pnlFolders.Width := (pnlItems.Width + pnlFolders.Width) div 2;
  if Bar.Images <> nil then begin
    pnlImages.Height := 25 + (5 * (Bar.Images.Height div 3));
    lbImages.Columns := lbImages.Width div Bar.Images.Width;
    {Allow for scrollbar if excessive number of images}
    if (lbImages.Width >= Bar.Images.Width) then
      pnlImages.Height := pnlImages.Height + 20;
  end;
end;

procedure TfrmNavBarEd.PopulateFolderList;
var
  I : Integer;
  S : string;
begin
  lbFolders.Clear;
  for I := 0 to Pred(Bar.FolderCount) do begin
    S := Bar.Folders[I].Caption;
    if S = '' then
      S := Bar.Folders[I].Name;
    lbFolders.Items.AddObject(S, Bar.Folders[I]);
  end;
end;

procedure TfrmNavBarEd.PopulateItemList;
var
  I : Integer;
  S : string;
begin
  lbItems.Clear;
  if lbFolders.ItemIndex = -1 then exit;
  with Bar.Folders[lbFolders.ItemIndex] do
    for I := 0 to pred(ItemCount) do begin
      S := Items[I].Caption;
      if S = '' then
        S := Items[I].Name;
      lbItems.Items.AddObject(S,Items[i]);
    end;
end;

procedure TfrmNavBarEd.lbFoldersClick(Sender: TObject);
begin
end;

procedure TfrmNavBarEd.lbItemsMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
  Unused(Control, Index);
  if (Bar.Images <> nil) then
    Height := Bar.Images.Height + 4;
end;

procedure TfrmNavBarEd.lbItemsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  Unused(State);
  with TListBox(Control).Canvas do
    FillRect(Rect);
  if (Bar.Images <> nil)
    and (TVpNavBtnItem(lbItems.Items.Objects[Index]).IconIndex > -1)
    and (TVpNavBtnItem(lbItems.Items.Objects[Index]).IconIndex <
      Bar.Images.Count)
  then begin
    Bar.Images.Draw(TListBox(Control).Canvas, Rect.Right - Bar.Images.Width,
      Rect.Top, TVpNavBtnItem(lbItems.Items.Objects[Index]).IconIndex);
    with TListBox(Control).Canvas do
      TextOut(Rect.Left + 2, Rect.Top + (Rect.Bottom - Rect.Top) div 3,
        TListBox(Control).Items[Index]);
  end else
    with TListBox(Control).Canvas do
      TextOut(Rect.Left + 2, Rect.Top, TListBox(Control).Items[Index]);
end;

procedure TfrmNavBarEd.lbImagesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  Unused(State);
  with TListBox(Control).Canvas do
    FillRect(Rect);
  if (Bar.Images <> nil) then
    Bar.Images.Draw(TListBox(Control).Canvas, Rect.Left + 1, Rect.Top + 1,
      Index);
end;


procedure TfrmNavBarEd.lbItemsClick(Sender: TObject);
begin
end;


procedure TfrmNavBarEd.lbImagesClick(Sender: TObject);
begin
  if (lbImages.ItemIndex <> -1) and (lbItems.ItemIndex <> -1) then begin
    TVpNavBtnItem(lbItems.Items.Objects[lbItems.ItemIndex]).IconIndex :=
      lbImages.ItemIndex;
    lbItems.Invalidate;
    if assigned(Designer) then
      Designer.Modified;
  end;
end;


procedure TfrmNavBarEd.btnItemUpClick(Sender: TObject);
var
  SaveItemIndex : Integer;
  Item: TVpNavBtnItem;
begin
  if (lbItems.ItemIndex > 0) then begin
    SaveItemIndex := lbItems.ItemIndex;
    Item := TVpNavBtnItem(lbItems.Items.Objects[lbItems.ItemIndex]);

    if Item.Index > 0 then
    Item.Index := Item.Index - 1;

    if Assigned(Designer) then
      Designer.Modified;

    PopulateItemList;

    lbItems.ItemIndex := SaveItemIndex - 1;
  end;
end;


procedure TfrmNavBarEd.btnItemDownClick(Sender: TObject);
var
  Item: TVpNavBtnItem;
begin
  if (lbItems.ItemIndex > -1) then begin
    Item := TVpNavBtnItem(lbItems.Items.Objects[lbItems.ItemIndex]);

    if Item.Index < Pred(lbItems.Items.Count) then
      Item.Index := Item.Index + 1;

    if Assigned(Designer) then
      Designer.Modified;

    PopulateItemList;

    lbItems.ItemIndex := Item.Index;
  end;
end;


procedure TfrmNavBarEd.btnFolderUpClick(Sender: TObject);
var
  SaveItemIndex : Integer;
  Folder: TVpNavFolder;
begin
  if (lbFolders.ItemIndex > 0) then begin
    SaveItemIndex := lbFolders.ItemIndex;
    Folder := TVpNavFolder(lbFolders.Items.Objects[lbFolders.ItemIndex]);

    if Folder.Index > 0 then
      Folder.Index := Folder.Index - 1;

    if assigned(Designer) then
      Designer.Modified;

    PopulateFolderList;
    
    lbFolders.ItemIndex := SaveItemIndex - 1;
  end;
end;

procedure TfrmNavBarEd.btnFolderDownClick(Sender: TObject);
var
  Folder: TVpNavFolder;
begin
  if (lbFolders.ItemIndex > -1) then begin
    Folder := TVpNavFolder(lbFolders.Items.Objects[lbFolders.ItemIndex]);

    if Folder.Index < pred(lbFolders.Items.Count) then
      Folder.Index := Folder.Index + 1;

    if assigned(Designer) then
      Designer.Modified;

    PopulateFolderList;

    lbFolders.ItemIndex := Folder.Index;
  end;
end;

procedure TfrmNavBarEd.btnItemDeleteClick(Sender: TObject);
begin
  if (lbItems.ItemIndex <> -1) then begin
    TVpNavBtnItem(lbItems.Items.Objects[lbItems.ItemIndex]).Free;
    lbItems.ItemIndex := -1;
    PopulateItemList;
    if assigned(Designer) then
      Designer.Modified;
  end;
end;

procedure TfrmNavBarEd.btnFolderDeleteClick(Sender: TObject);
begin
  if (lbFolders.ItemIndex <> -1) then begin
    TVpNavFolder(lbFolders.Items.Objects[lbFolders.ItemIndex]).Free;
    lbFolders.ItemIndex := -1;
    PopulateFolderList;
    PopulateItemList;
    if assigned(Designer) then
      Designer.Modified;
  end;
end;

procedure TfrmNavBarEd.btnFolderAddClick(Sender: TObject);
begin
  Bar.FolderCollection.Add;
  PopulateFolderList;
  lbFolders.ItemIndex := lbFolders.Items.Count - 1;
  if assigned(Designer) then
    Designer.Modified;
  lbFoldersClick(Self);
end;

procedure TfrmNavBarEd.btnItemAddClick(Sender: TObject);
begin
  if (lbFolders.ItemIndex <> -1) then begin
    TVpNavFolder(
      lbFolders.Items.Objects[lbFolders.ItemIndex]).ItemCollection.Add;
    lbItems.ItemIndex := -1;
    PopulateItemList;
    if assigned(Designer) then
      Designer.Modified;
  end;
end;


end.
  
