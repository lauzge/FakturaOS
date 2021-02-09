{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I Vp.INC}

unit VpPrtFmtDlg;

interface

uses
  LCLProc, LCLType, LCLIntf,
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypInfo, ExtCtrls,
  VpBase, VpBaseDS, VpDlg, VpPrtFmtCBox, VpEdFmtLst;

type

  TVpPrintFormatEditDialog = class(TVpBaseDialog)
  private
    FControlLink: TVpControlLink;
    FDrawingStyle: TVpDrawingStyle;
    FWindowState: TWindowState;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetControlLink(const Value: TVpControlLink);
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean; override;

  published
    property ControlLink : TVpControlLink read FControlLink write SetControlLink;
    property DrawingStyle: TVpDrawingStyle read FDrawingStyle write FDrawingStyle default ds3d;
    property WindowState : TWindowState read FWindowState write FWindowState default wsNormal;

    property Options;
    property Placement;
  end;


implementation


{ TVpPrintFormatEditDialog }

constructor TVpPrintFormatEditDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FControlLink := SearchControlLink (Owner);
  FDrawingStyle := ds3d;

  FPlacement.Height := 480;
  FPlacement.Width := 640;
end;

function TVpPrintFormatEditDialog.Execute: Boolean;
var
  PrtFmtDlg : TfrmPrnFormat;
begin
  PrtFmtDlg := TfrmPrnFormat.Create(Application);
//  Application.CreateForm(TfrmPrnFormat, PrtFmtDlg);
  try
    DoFormPlacement(PrtFmtDlg);
    PrtFmtDlg.WindowState := WindowState;
    PrtFmtDlg.ControlLink := ControlLink;
    PrtFmtDlg.DrawingStyle := FDrawingStyle;
    Result := PrtFmtDlg.Execute;
  finally
    PrtFmtDlg.Free;
  end;
end;

procedure TVpPrintFormatEditDialog.Notification(AComponent: TComponent;
  Operation: TOperation);
  {-Handle new/deleted components}
begin
  inherited Notification (AComponent, Operation);

  if Operation = opRemove then begin
    {Owned components going away}
    if AComponent = FControlLink then begin
      FControlLink := nil;
    end;
  end else if Operation = opInsert then begin
    if AComponent is TVpControlLink then begin
      if not Assigned (FControlLink) then begin
        FControlLink := TVpControlLink (AComponent);
      end;
    end;
  end;
end;


procedure TVpPrintFormatEditDialog.SetControlLink(
  const Value: TVpControlLink);
begin
  if FControlLink <> Value then
    FControlLink := Value;
end;

end.
