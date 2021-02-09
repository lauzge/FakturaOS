{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I Vp.INC}

unit VpWavPE;
  {Wav File Property Editor }

interface

uses
  PropEdits,
  TyphonPackageIntf,
  FieldsEditor,
  ComponentEditors,
  VpWavDlg, Forms;

type
  {TWavFileProperty}
  TWavFileProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue : string; override;
    procedure Edit; override;
  end;

implementation

(*****************************************************************************)
{ TWavFileProperty }

function TWavFileProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;


function TWavFileProperty.GetValue : string;
begin
  Result := inherited GetValue;
end;


procedure TWavFileProperty.Edit;
var
  SoundFinder : TFrmSoundDialog;
begin
  SoundFinder := TFrmSoundDialog.Create(Application);
  try
//    SoundFinder.DingPath := Value;
    SoundFinder.Populate;
    SoundFinder.ShowModal;
{    if SoundFinder.ReturnCode = rtCommit then begin
      if SoundFinder.CBDefault.Checked then
        Value := ''
      else
        Value := SoundFinder.FileListBox1.FileName;
    end;}
  finally
    SoundFinder.Free;
  end;
end;


end.
