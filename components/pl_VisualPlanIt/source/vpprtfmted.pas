{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I vp.inc}

unit VpPrtFmtEd;
  {- property editor for TVpControlLink.Printer.PrintFormats property}

interface

uses
  LCLProc, LCLType, LCLIntf,
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PropEdits,
  TyphonPackageIntf,
  FieldsEditor,
  ComponentEditors,
  ExtCtrls, Buttons,
  VpSR, VpBaseDS, VpEdFmtLst;

type
  TVpPrtFmtPropertyEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index : Integer); override;
    function GetVerb(Index : Integer) : string; override;
    function GetVerbCount : Integer; override;
  end;

  TVpPrtFmtEditor = class(TfrmPrnFormat)
  public
    Designer   : TIDesigner;
  end;


implementation

var
  frmPrtFmtEd : TVpPrtFmtEditor;

procedure EditPrtFmts(Designer : TIDesigner; Link : TVpControlLink);
begin
  frmPrtFmtEd := TVpPrtFmtEditor.Create(Application);
  frmPrtFmtEd.Designer := Designer;
  frmPrtFmtEd.ControlLink := Link;
  frmPrtFmtEd.Execute;
  if Assigned(Designer) then
    Designer.Modified;
  frmPrtFmtEd.Free;  
end;


{ TVpPrtFmtEditor }

procedure TVpPrtFmtPropertyEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    EditPrtFmts(Designer, (Component as TVpControlLink));
end;

function TVpPrtFmtPropertyEditor.GetVerb(Index: Integer): string;
begin
  if Index = 0 then
    Result := RSEditPrintFormat;  
end;

function TVpPrtFmtPropertyEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
