{

DELPHI-CLASS  TEuroDMEdit Version 1.0
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


******* TEuroDMEdit comes with ABSOLUTELY NO WARRANTY ***************
}

unit EuroDMEdit;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dbctrls, extctrls, db, stdctrls, buttons, LResources;

type tWaehrung = (Euro,DM);

type
  TEuroDMEdit = class(TCustomEdit)
  private
    FStoreWaehrung : tWaehrung;
    FViewWaehrung  : tWaehrung;
    FAlignment     : TAlignment;
    FKurs          : Double;
    FButton        : tButton;
    FValue         : Double;
    FDataLink      : TFieldDataLink;
    FCanvas        : TControlCanvas;
    FFocused       : Boolean;

    function  GetMinHeight: Integer;
    procedure SetEditRect;
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function  GetDataField: string;
    function  GetDataSource: TDataSource;
    function  GetField: TField;
    function  GetHint : String;
    procedure SetHint (Value:String);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetFocused(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure SetAlignment(Value: TAlignment);
    procedure SetViewWaehrung(Value: TWaehrung);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  protected
    procedure CreateWnd; override;
    procedure Change; override;
    function  EditCanModify: Boolean;
    function  GetReadOnly: Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Reset;
    procedure SetValue (New : Double);
    //--------------------------------------------------------------------------
    procedure EuroDMButtonClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function    ExecuteAction(Action: TBasicAction): Boolean; override;
    function    UpdateAction(Action: TBasicAction): Boolean; override;
    function    UseRightToLeftAlignment: Boolean; override;
    property    Field: TField read GetField;
  published

    property Value : Double Read FValue Write SetValue;

    property Alignment: TAlignment read FAlignment write SetAlignment default taRightJustify;
    property AutoSelect;
    property BorderStyle;
    property ButtonHint:String read GetHint write SetHint;
    property CharCase;
    property Color;
//    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
//    property ImeMode;
//    property ImeName;
    property MaxLength;
    property ParentColor;
//    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnEndDock;
    property OnStartDock;
    property Kurs         : Double read FKurs write FKurs;
    property SaveWaehrung : tWaehrung read fStoreWaehrung write fStoreWaehrung;
    property ViewWaehrung : tWaehrung read fViewWaehrung write SetViewWaehrung;
  end;


procedure Register;

implementation

{$R *.res}

function OkToChangeFieldAlignment(AField: TField; Alignment: TAlignment): Boolean;
begin
  { dont change the alignment for these fields:
    ftSmallInt     ftInteger      ftWord         ftFloat        ftCurrency
    ftBCD          ftDate         ftTime         ftDateTime     ftAutoInc
    ftTimeStamp    ftFMTBcd}
  if Assigned(AField) then with AField do
    Result := (DataType < ftSmallInt) or
              (DataType = ftBoolean) or
              ((DataType > ftDateTime) and (DataType <> ftAutoInc)
              and (DataType <> ftFMTBcd))
  else
    Result := Alignment <> taCenter;
end;

function DBUseRightToLeftAlignment(AControl: TControl; AField: TField): Boolean;
var
  AAlignment: TAlignment;
begin
  if Assigned(AField) then
    AAlignment := AField.Alignment
  else
    AAlignment := taLeftJustify;
  Result := (SysLocale.MiddleEast) and (AControl.BiDiMode = bdRightToLeft) and
    (OkToChangeFieldAlignment(AField, AAlignment));
end;

procedure ResetMaxLength(DBEdit: TEuroDMEdit);
var
  F: TField;
begin
  with DBEdit do
    if (MaxLength > 0) and (DataSource <> nil) and
      (DataSource.DataSet <> nil) then
    begin
      F := DataSource.DataSet.FindField(DataField);
      if Assigned(F) and (F.DataType = ftString) and
        (F.Size = MaxLength) then MaxLength := 0;
    end;
end;

function PaintComboEdit(Editor: TEuroDMEdit; const AText: string;
  AAlignment: TAlignment; StandardPaint: Boolean;
  var ACanvas: TControlCanvas; var Message: TWMPaint): Boolean;
var
  AWidth, ALeft : Integer;
  R             : TRect;
  DC            : HDC;
  PS            : TPaintStruct;
  S             : string;
  ExStyle       : DWORD;
const
  AlignStyle: array[Boolean, TAlignment] of DWORD =
   ((WS_EX_LEFT, WS_EX_RIGHT, WS_EX_LEFT),
    (WS_EX_RIGHT, WS_EX_LEFT, WS_EX_LEFT));
begin
  Result := True;
  with Editor do
  begin
    if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
    if StandardPaint and not (csPaintCopy in ControlState) then
    begin
      if SysLocale.MiddleEast and HandleAllocated and (IsRightToLeft) then
      begin { This keeps the right aligned text, right aligned }
        ExStyle := DWORD(GetWindowLong(Handle, GWL_EXSTYLE)) and (not WS_EX_RIGHT) and
          (not WS_EX_RTLREADING) and (not WS_EX_LEFTSCROLLBAR);
        if UseRightToLeftReading then
          ExStyle := ExStyle or WS_EX_RTLREADING;
        if UseRightToLeftScrollbar then
          ExStyle := ExStyle or WS_EX_LEFTSCROLLBAR;
        ExStyle := ExStyle or
          AlignStyle[UseRightToLeftAlignment, AAlignment];
        if DWORD(GetWindowLong(Handle, GWL_EXSTYLE)) <> ExStyle then
          SetWindowLong(Handle, GWL_EXSTYLE, ExStyle);
      end;
      Result := False;
      { return false if we need to use standard paint handler }
      Exit;
    end;
    if ACanvas = nil then
    begin
      ACanvas := TControlCanvas.Create;
      ACanvas.Control := Editor;
    end;
    DC := Message.DC;
    if DC = 0 then DC := BeginPaint(Handle, PS);
    ACanvas.Handle := DC;
    try
      ACanvas.Font := Font;
      if not Enabled and NewStyleControls and not
        (csDesigning in ComponentState) and
        (ColorToRGB(Color) <> ColorToRGB(clGrayText)) then
        ACanvas.Font.Color := clGrayText;
      with ACanvas do
      begin
        R := ClientRect;
        if not (NewStyleControls {and Ctl3D}) and
          (BorderStyle = bsSingle) then
        begin
          Brush.Color := clWindowFrame;
          FrameRect(R);
          InflateRect(R, -1, -1);
        end;
        Brush.Color := Color;
        S := AText;
        AWidth := TextWidth(S);
        if FButton.Width > 0 then Inc(AWidth);
        case AAlignment of
          taLeftJustify:
            ALeft := 0;
          taRightJustify:
            ALeft := ClientWidth - FButton.Width - AWidth - {Margins.X -} 2;
          else
            ALeft := (ClientWidth - FButton.Width - AWidth) div 2;
        end;
//        if SysLocale.MiddleEast then UpdateTextFlags;
        TextRect(R, ALeft, 2, S);
      end;
    finally
      ACanvas.Handle := 0;
      if Message.DC = 0 then EndPaint(Handle, PS);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TEuroDMEdit.CreateWnd;
begin
  inherited CreateWnd;
  SetEditRect;
end;

procedure TEuroDMEdit.SetEditRect;
var Loc: TRect;
begin
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));
  Loc.Bottom := ClientHeight + 1;
  Loc.Right  := ClientWidth - FButton.Width - 2;
  Loc.Top    := 0;
  Loc.Left   := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
  SendMessage(Handle, EM_GETRECT,   0, LongInt(@Loc));  {debug}
end;

procedure TEuroDMEdit.WMSize(var Message: TWMSize);
var MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
  if Height < MinHeight then Height := MinHeight else
  begin
    if FButton <> nil then
    begin
      if NewStyleControls {and Ctl3D}
        then FButton.SetBounds(Width - FButton.Width - 4, 0, FButton.Width, Height - 4)
        else FButton.SetBounds (Width - FButton.Width, 1, FButton.Width, Height - 2);
      FButton.SetBounds(Width - FButton.Width - 4, 0, FButton.Width, Height - 4);
      SetEditRect;
    end;
  end;
end;

function TEuroDMEdit.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  I := SysMetrics.tmHeight;
  if I > Metrics.tmHeight then I := Metrics.tmHeight;
//  if Ctl3D then Result := Metrics.tmHeight + I div 4 + GetSystemMetrics(SM_CYBORDER) * 4 + 2
//           else Result := Metrics.tmHeight + I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  Result := Metrics.tmHeight + I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
end;

procedure TEuroDMEdit.WMPaint(var Message: TWMPaint);
var S: string;
begin
  S := Text;
  if not PaintComboEdit(Self, S, FAlignment, FFocused,
    FCanvas, Message) then inherited;
end;

procedure TEuroDMEdit.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then begin
    FAlignment := Value;
    Invalidate;
  end;
end;


//------------------------------------------------------------------------------

constructor TEuroDMEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  FButton := tButton.Create (Self);
  FButton.Font.Size :=6;
  FButton.Width     :=22;
  FButton.Height    :=17;
  FButton.Visible   :=True;
  FButton.Parent    :=Self;
  FButton.Caption   :='??';
  FButton.ShowHint  :=True;
  if fViewWaehrung=DM then FButton.Caption   :='DM' else
  if fViewWaehrung=EURO then FButton.Caption   :='€';
  FButton.TabStop   :=False;
  FButton.OnClick   := EuroDMButtonClick;
  FStoreWaehrung    :=DM;
  ViewWaehrung      :=EURO;
  FKurs             :=1.95583;
  FAlignment        :=taRightJustify;
end;

destructor TEuroDMEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FCanvas.Free;
  FButton.Free;
  inherited Destroy;
end;

procedure TEuroDMEdit.Loaded;
begin
  inherited Loaded;
  ResetMaxLength(Self);
  if (csDesigning in ComponentState) then DataChange(Self);
  //if not Ctl3D then FButton.Height :=FButton.Height+4;
end;

procedure TEuroDMEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TEuroDMEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then
    FDataLink.Edit;
end;

procedure TEuroDMEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key in [#33..#255]) and (FDataLink.Field <> nil) and
    not FDataLink.Field.IsValidChar(Key) then
  begin
    Beep;
    Key := #0;
  end;
  case Key of
    ^H, ^V, ^X, #33..#255:
      FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
        SelectAll;
        Key := #0;
      end;
    #32:
      begin
        EuroDMButtonClick(Self);
        SelectAll;
      end;
  end;
  invalidate;
end;

function TEuroDMEdit.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

procedure TEuroDMEdit.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

function  TEuroDMEdit.GetHint : String;
begin
     Result :=FButton.Hint;
end;
procedure TEuroDMEdit.SetHint (Value:String);
begin
     FButton.Hint :=Value;
end;

procedure TEuroDMEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then begin
    FFocused := Value;
    Invalidate;
    FDataLink.Reset;
  end;
end;

procedure TEuroDMEdit.SetViewWaehrung(Value: TWaehrung);
begin
     if fViewWaehrung <> Value then
     begin
        fViewWaehrung := Value;
        if fViewWaehrung=DM
         then FButton.Caption :='DM'
         else FButton.Caption :='€';
        invalidate;
     end;
end;

procedure TEuroDMEdit.Change;
begin
  FDataLink.Modified;
  if text >'' then try FValue :=StrtoFloat (Text);except fValue :=0; end else fValue :=0;
  inherited Change;
end;

function TEuroDMEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TEuroDMEdit.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TEuroDMEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TEuroDMEdit.SetDataField(const Value: string);
begin
  if not (csDesigning in ComponentState) then ResetMaxLength(Self);
  FDataLink.FieldName := Value;

  if (FDataLink.Field<>nil)and
     ((FDataLink.Field.DataType <> ftCurrency)or
      (FDataLink.Field.DataType <> ftFloat))
   then MessageDlg ('Das zugewiesenen Feld sollte schon '+#13#10+
                    'ein Währungsfeld sein !',mterror,[mbok],0);
end;

function TEuroDMEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TEuroDMEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TEuroDMEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TEuroDMEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TEuroDMEdit.WMPaste(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TEuroDMEdit.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TEuroDMEdit.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    inherited ReadOnly := False;
end;

procedure TEuroDMEdit.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    if CanFocus then SetFocus;
    raise;
  end;
  SetFocused(False);
  //CheckCursor;
  DoExit;
end;

procedure TEuroDMEdit.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

function TEuroDMEdit.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

function TEuroDMEdit.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TEuroDMEdit.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

//------------------------------------------------------------------------------

procedure TEuroDMEdit.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
  begin
    if not (csDesigning in ComponentState) then
    begin
      if (FDataLink.Field.DataType in [ftFloat,ftCurrency])
       then FValue :=FDataLink.Field.AsFloat;
    end else FValue :=0;

    if (SaveWaehrung=DM) and (ViewWaehrung=EURO) then FValue :=FValue / FKurs else
    if (SaveWaehrung=EURO) and (ViewWaehrung=DM) then FValue :=FValue * FKurs;

    Text := FormatFloat ('0.00',FValue)
  end
     else
  begin
      if csDesigning in ComponentState
       then Text := Name
       else Text := '';
  end;
end;

procedure TEuroDMEdit.UpdateData(Sender: TObject);
begin
  FDataLink.Edit;
  if ViewWaehrung = SaveWaehrung then
  begin
       FDataLink.Field.AsFloat := FValue;
  end
     else
  begin
      if (SaveWaehrung=DM)and(ViewWaehrung=EURO)
       then FDataLink.Field.AsFloat := FValue * FKurs
       else if (SaveWaehrung=EURO)and(ViewWaehrung=DM)
             then FDataLink.Field.AsFloat := FValue / FKurs;
  end;
end;

procedure TEuroDMEdit.EuroDMButtonClick(Sender: TObject);
begin
    try
      FValue :=StrtoFloat (Text);
    except
      FValue :=0;
      MessageBeep(0);
    end;
    if ViewWaehrung=DM then
    begin
         ViewWaehrung :=EURO;
         FValue :=FValue / FKurs;
    end
     else
    begin
         ViewWaehrung :=DM;
         FValue :=FValue * FKurs;
    end;
    Text := FormatFloat ('0.00',FValue);
    Self.SetFocus;
    Invalidate;
end;

procedure TEuroDMEdit.SetValue (New : Double);
begin
     FValue :=New;
     if (SaveWaehrung=DM) and (ViewWaehrung=EURO) then FValue :=FValue / FKurs else
     if (SaveWaehrung=EURO) and (ViewWaehrung=DM) then FValue :=FValue * FKurs;

     Text := FormatFloat ('0.00',FValue)
end;

//------------------------------------------------------------------------------

procedure Register;
begin
  {$I eurodmedit_icon.ctrs}
  RegisterComponents('JP-SOFT', [TEuroDMEdit]);
end;

end.



unit EuroDMEdit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs;

type
  TEuroDMEdit = class(TCustomEdit)
  private

  protected

  public

  published

  end;

procedure Register;

implementation

procedure Register;
begin
  {$I eurodmedit_icon.ctrs}
  RegisterComponents('JP-SOFT',[TEuroDMEdit]);
end;

end.
