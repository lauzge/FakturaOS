
{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I Vp.INC}

unit VpEdPop;

{-base popup edit field class}

interface

uses
  LCLProc, LCLType, LCLIntf,
  Buttons, Classes, Controls, ExtCtrls, Forms, Graphics, Menus,
  StdCtrls, SysUtils, VpConst;

type
  TVpEdButton = class(TBitBtn)
  protected
    ParentEdPopup: TWinControl;
  public
    procedure Click; override;
  end;

  TVpEdPopup = class(TCustomEdit)
  protected
    FButton: TVpEdButton;
    FPopupActive: boolean;
    FShowButton: boolean;
    procedure SetShowButton(Value: boolean);
    function GetButtonWidth: integer;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    function GetButtonEnabled: boolean; dynamic;
    procedure PopupClose(Sender: TObject); dynamic;
    property ShowButton: boolean read FShowButton write SetShowButton default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: integer);
      override;
    procedure PopupOpen; dynamic;
    property PopupActive: boolean read FPopupActive;
  end;

implementation

{*** TVpEditBtn ***}

procedure TVpEdButton.Click;
begin
 if ParentEdPopup<>nil then TVpEdPopup(ParentEdPopup).PopupOpen; //=== ct9999 =========
end;


{*** TVpEdPopup ***}

constructor TVpEdPopup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csAcceptsControls] - [csSetCaption]; //=== ct9999 =========

  FShowButton := True;

  FButton := TVpEdButton.Create(self);

  FButton.ParentEdPopup:= self;   //=== ct9999 =========

  FButton.Caption := '';
  FButton.TabStop := False;
  FButton.Visible := True;

  ShowButton := True;
end;

procedure TVpEdPopup.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  Params.Style := Params.Style or WS_CLIPCHILDREN;
end;

procedure TVpEdPopup.CreateWnd;
begin
  inherited CreateWnd;

  FButton.ParentWindow := self.Handle; //=== ct9999 =========

  {force button placement}
  SetBounds(Left, Top, Width, Height);

  FButton.Enabled := GetButtonEnabled;
end;

destructor TVpEdPopup.Destroy;
begin
  FButton.Free;
  FButton := nil;

  inherited Destroy;
end;

function TVpEdPopup.GetButtonEnabled: boolean;
begin
  Result := not ReadOnly;
end;

function TVpEdPopup.GetButtonWidth: integer;
begin
  if Assigned(FButton) and FShowButton then
    Result := FButton.Width
  else
    Result := 0;
end;

procedure TVpEdPopup.PopupClose;
begin
  FPopupActive := False;
end;

procedure TVpEdPopup.PopupOpen;
begin
  FPopupActive := True;
end;

procedure TVpEdPopup.SetBounds(ALeft, ATop, AWidth, AHeight: integer);
var
  H: integer;
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);

  if not HandleAllocated then  Exit;

  if not FShowButton then
  begin
    FButton.Height := 0;
    FButton.Width := 0;
    Exit;
  end;

  H := ClientHeight;
  if BorderStyle = bsNone then
  begin
    FButton.Height := H;
    FButton.Width := (FButton.Height div 4) * 3;
    if Assigned(Fbutton.Glyph) then
      if FButton.Width < FButton.Glyph.Width + 6 then
        FButton.Width := FButton.Glyph.Width + 6;
    FButton.Left := Width - FButton.Width;
    FButton.Top := 0;
  end
  else
  begin
    FButton.Height := H - 2;
    FButton.Width := (FButton.Height div 4) * 3;
    if Assigned(Fbutton.Glyph) then
      if FButton.Width < FButton.Glyph.Width + 6 then
        FButton.Width := FButton.Glyph.Width + 6;
    FButton.Left := Width - FButton.Width - 1;
    FButton.Top := 1;
  end;
end;

procedure TVpEdPopup.SetShowButton(Value: boolean);
begin
  if Value <> FShowButton then
  begin
    FShowButton := Value;
    {force resize and redisplay of button}
    SetBounds(Left, Top, Width, Height);
  end;
end;

end.
