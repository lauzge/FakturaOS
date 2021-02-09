{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

unit VpSelResDlg;

interface

uses
  LCLProc, LCLType, LCLIntf, LResources,
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, VpBaseDS, VpResEditDlg, ExtCtrls;

type
  TfrmSelectResource = class(TForm)
    VpResourceCombo1: TVpResourceCombo;
    lblSelectResource: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    VpResourceEditDialog1: TVpResourceEditDialog;
    btnAddNew: TButton;
    btnEdit: TButton;
    Bevel1: TBevel;
    procedure btnAddNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectResource: TfrmSelectResource;

implementation

 {$R *.frm}

procedure TfrmSelectResource.btnAddNewClick(Sender: TObject);
begin
  VpResourceEditDialog1.AddNewResource;
end;

procedure TfrmSelectResource.btnEditClick(Sender: TObject);
begin
  VpResourceEditDialog1.Execute;
end;

end.
 
