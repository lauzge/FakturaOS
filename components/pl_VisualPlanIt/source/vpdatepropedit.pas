{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

unit VpDatePropEdit;

interface

uses
  LCLProc, LCLType, LCLIntf,
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, //VpEdPop, VpDateEdit, VpBase, VpBaseDS,
  VpCalendar;

type
  TfrmDatePropertyEditor = class(TForm)
    Button1: TButton;
    Button2: TButton;
    VpCalendar1: TVpCalendar;
  private
    { Private declarations }
  public
    function Execute : Boolean;
    { Public declarations }
  end;

var
  frmDatePropertyEditor: TfrmDatePropertyEditor;

implementation

 {$R *.frm}

function TfrmDatePropertyEditor.Execute : Boolean;
begin
  if ShowModal = mrOk then
    Result := True
  else
    Result := False;
end;

end.
  
