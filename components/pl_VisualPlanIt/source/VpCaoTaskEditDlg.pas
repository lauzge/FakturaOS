{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I vp.inc}

unit VpCaoTaskEditDlg;
  { default task editing dialog }

interface

uses
  LCLProc, LCLType, LCLIntf, LResources,
  SysUtils, Variants,
  Classes, Graphics, Controls, Forms, Dialogs, VpData, StdCtrls, ExtCtrls,
  VpBase, VpSR, VpDlg, ComCtrls, EditBtn;

type
  { forward declarations }
  TVpCaoTaskEditDialog = class;

  { TCaoTaskEditForm }

  TCaoTaskEditForm = class(TForm)
    ButtonPanel: TPanel;
    CbCategory: TComboBox;
    CbPriority: TComboBox;
    LblCategory: TLabel;
    LblPriority: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    MainPanel: TPanel;
    DescriptionEdit: TEdit;
    DueDateLbl: TLabel;
    DueDateEdit: TDateEdit;
    CbComplete: TCheckBox;
    LblCreatedOn: TLabel;
    LblCompletedOn: TLabel;
    DetailsMemo: TMemo;
    ResourceNameLbl: TLabel;
    Bevel1: TBevel;
    imgCalendar: TImage;
    imgCompleted: TImage;
    procedure FormCreate(Sender: TObject);
    procedure OnChange(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FReturnCode: TVpEditorReturnCode;
    FTask: TVpTask;
    FResource: TVpResource;
    FBtnHeight: Integer;
    FEditHeight: Integer;
    procedure PositionControls;
    procedure SetCaptions;
  public
    procedure PopulateSelf;
    procedure DePopulateSelf;
    property Task: TVpTask
      read FTask write FTask;
    property Resource: TVpResource
      read FResource write FResource;
    property ReturnCode: TVpEditorReturnCode
      read FReturnCode;
  end;

  TVpCaoTaskEditDialog = class(TVpBaseDialog)
  protected {private}
    teEditDlg: TCaoTaskEditForm;
    teTask: TVpTask;
  public
    constructor Create(AOwner: TComponent); override;
    function AddNewTask: Boolean;
    function Execute(Task: TVpTask): Boolean; reintroduce;
  published
    {properties}
    property DataStore;
    property Options;
    property Placement;
  end;

procedure Register;

implementation

uses
  Math, VpMisc;

 {$R *.frm}

{ TCaoTaskEditForm }

procedure TCaoTaskEditForm.FormCreate(Sender: TObject);
begin
  FReturnCode := rtAbandon;
  FBtnHeight := ScaleY(OKBtn.Height, DesignTimeDPI);
  FEditHeight := ScaleY(DueDateEdit.Height, DesignTimeDPI);
end;

procedure TCaoTaskEditForm.DePopulateSelf;
begin
  Task.Description := DescriptionEdit.Text;
  Task.DueDate := DueDateEdit.Date;
  Task.Details := DetailsMemo.Text;
  Task.Complete := CbComplete.Checked;
  Task.Priority := CbPriority.ItemIndex-1;
  Task.Category := CbCategory.ItemIndex;
  DueDateLbl.Caption := RSDueDateLabel;
end;


procedure TCaoTaskEditForm.SetCaptions;
var
  ct: TVpCategoryType;
  tp: TVpTaskPriority;
begin
  if Assigned(Resource) then
    ResourceNameLbl.Caption := Resource.Description;
  CbComplete.Caption := RSTaskComplete;
  DueDateLbl.Caption := RSDueDateLabel;
  OKBtn.Caption := RSOKBtn;
  CancelBtn.Caption := RSCancelBtn;
  LblPriority.Caption := RSPriorityLabel;
  LblCategory.Caption := RSCategoryLabel;

  CbCategory.Items.Clear;
  for ct in TVpCategoryType do
    CbCategory.Items.Add(CategoryLabel(ct));

  CbPriority.Items.Clear;
  for tp in TVpTaskPriority do
    CbPriority.Items.Add(TaskPriorityToStr(tp));
end;

procedure TCaoTaskEditForm.PopulateSelf;
begin
  SetCaptions;

  DescriptionEdit.Text := Task.Description;
  DueDateEdit.Date := Task.DueDate;
  DetailsMemo.Text := Task.Details;
  CbComplete.Checked := Task.Complete;
  if Task.CompletedOn <> 0 then
    LblCompletedOn.Caption := RSCompletedOn + ' ' + FormatDateTime('ddddd', Task.CompletedOn)
    // 'ddddd' = DefaultFormatSettings.ShortDateFormat
  else
    LblCompletedOn.Visible := False;
  LblCompletedOn.Visible := CbComplete.Checked;
  LblCreatedOn.Caption := RSCreatedOn + ' ' + FormatDateTime('ddddd', Task.CreatedOn);
  CbPriority.ItemIndex := Task.Priority + 1;
  CbCategory.ItemIndex := Task.Category;

  PositionControls;
end;

procedure TCaoTaskEditForm.PositionControls;
var
  VBevelDist: Integer = 8;  // Distance bevel-to-control
  VDist: Integer = 8;       // Vertical distance between controls
  HDist: Integer = 8;       // Horizontal distance between controls:
  w: Integer;
  cnv: TControlCanvas;
  cb: TCheckbox;
begin
  VBevelDist := ScaleY(VBevelDist, DesignTimeDPI);
  VDist := ScaleY(VDist, DesignTimeDPI);
  HDist := ScaleX(HDist, DesignTimeDPI);

  DescriptionEdit.Height := FEditHeight;
  DueDateEdit.Height := FEditHeight;
  DueDateEdit.ButtonWidth := FEditHeight;
  CbCategory.Height := FEditHeight;
  CbPriority.Height := FEditHeight;

  OKBtn.Height := FBtnHeight;
  OKBtn.Top := VDist;
  CancelBtn.Height := OKBtn.Height;
  CancelBtn.Top := OKBtn.Top;
  ButtonPanel.Height := OKBtn.Height + VDIST*2;
  ResourceNameLbl.Font.Size := ScaleY(ResourceNameLbl.Font.Size, DesignTimeDPI);
  ResourceNameLbl.Top := OKBtn.Top + (OKBtn.Height - ScaleY(ResourceNameLbl.Height, DesignTimeDPI)) div 2;

  DueDateEdit.Left := DueDateLbl.Left + GetLabelWidth(DueDateLbl) + HDist;
  cnv := TControlCanvas.Create;
  try
    cnv.Control := DueDateEdit;
    cnv.Font.Assign(DueDateEdit.Font);
    w := cnv.TextWidth(' 99-99-9999 ') + DueDateEdit.ButtonWidth + 10;
  finally
    cnv.Free;
  end;
  DueDateEdit.Width := w;

  if RightOf(DueDateEdit) + 3*HDist > ImgCompleted.Left then begin
    ImgCompleted.Left := RightOf(DueDateEdit) + 3*HDist;
    CbComplete.Left := RightOf(ImgCompleted) + HDist;
    LblCompletedOn.Left := CbComplete.Left;

    cnv := TControlCanvas.Create;
    try
      cnv.Control := CbComplete;
      cnv.Font.Assign(CbComplete.Font);
      w := cnv.TextWidth(CbComplete.Caption) + GetSystemMetrics(SM_CXMENUCHECK);
    finally
      cnv.Free;
    end;
    w := Max(GetlabelWidth(LblCompletedOn), w);
    ClientWidth := ClientWidth - MainPanel.ClientWidth + CbComplete.Left + w + HDist*2;
  end;

  CbCategory.Left := DueDateEdit.Left;
  LblCategory.Left := CbCategory.Left - HDist - GetLabelWidth(LblCategory);

  if RightOf(CbCategory) + 3*HDist + GetLabelWidth(LblPriority) + HDist > CbComplete.Left then
    CbPriority.Left := CbPriority.Parent.ClientWidth - HDist - CbPriority.Width
  else
    CbPriority.Left := CbComplete.Left;
  LblPriority.Left := CbPriority.Left - HDist - GetLabelWidth(LblPriority);

  OKBtn.Width := Max(GetButtonWidth(OKBtn), GetButtonWidth(CancelBtn));
  CancelBtn.Width := OKBtn.Width;
 {$IFDEF MSWINDOWS}
  CancelBtn.Left := ButtonPanel.ClientWidth - ResourcenameLbl.Left - CancelBtn.Width;
  OKBtn.Left := CancelBtn.Left - HDist - OKBtn.Width;
  OKBtn.TabOrder := 0;
  CancelBtn.TabOrder := 1;
 {$ELSE}
  OKBtn.Left := ButtonPanel.ClientWidth - ResourcenameLbl.Left - OKBtn.Width;
  CancelBtn.Left := OKBtn.Left - HDist - CancelBtn.Width;
  CancelBtn.TabOrder := 0;
  OKBtn.TabOrder := 1;
 {$ENDIF}

  CbCategory.Top := BottomOf(DescriptionEdit) + VDist;
  LblCategory.Top := CbCategory.Top + (CbCategory.Height - LblCategory.Height) div 2;
  CbPriority.Top := CbCategory.Top;
  LblPriority.Top := LblCategory.Top;

  //Bevel1.Top := DescriptionEdit.Top + editHeight + VBevelDist; //BottomOf(DescriptionEdit) + VBevelDist;

  ImgCalendar.Top := Bevel1.Top + 2 + VBevelDist;
  ImgCompleted.Top := ImgCalendar.Top;
  DueDateEdit.Top := ImgCalendar.Top; // + (ImgCalendar.Height - DueDateEdit.Height) div 2;
  DueDateLbl.Top := DueDateEdit.Top + (DueDateEdit.Height - DueDateLbl.Height) div 2;
  CbComplete.Top := ImgCompleted.Top; // + (ImgCompleted.Height - CbComplete.Height) div 2;

  LblCreatedOn.Top := DueDateEdit.Top + FEditHeight + VDist; //BottomOf(DueDateEdit) + VDist;
  LblCompletedOn.Top := LblCreatedOn.Top;

  DetailsMemo.Top := BottomOf(LblCreatedOn) + VBevelDist;
  DetailsMemo.Height :=  MainPanel.ClientHeight - DetailsMemo.Top - DescriptionEdit.Top;
end;


procedure TCaoTaskEditForm.OnChange(Sender: TObject);
begin
  Task.Changed := true;
end;



procedure TCaoTaskEditForm.OKBtnClick(Sender: TObject);
begin
  FReturnCode := rtCommit;
  Close;
end;


procedure TCaoTaskEditForm.CancelBtnClick(Sender: TObject);
begin
  Close;
end;


procedure TCaoTaskEditForm.FormShow(Sender: TObject);
begin
  DescriptionEdit.SetFocus;
end;


{ TVpCaoTaskEditDialog }

constructor TVpCaoTaskEditDialog.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FPlacement.Height := 340;
  FPlacement.Width := 545;
end;

function TVpCaoTaskEditDialog.Execute(Task: TVpTask): Boolean;
var
  CaoTaskEditForm: TCaoTaskEditForm;
begin
  Result := false;
  teTask := Task;
  if (teTask <> nil) and (DataStore <> nil) and (DataStore.Resource <> nil) then
  begin
    Application.CreateForm(TCaoTaskEditForm, CaoTaskEditForm);
    try
      DoFormPlacement(CaoTaskEditForm);
      SetFormCaption(CaoTaskEditForm, Task.Description, RSDlgTaskEdit);
      CaoTaskEditForm.Task := Task;
      CaoTaskEditForm.Resource := DataStore.Resource;
      CaoTaskEditForm.PopulateSelf;
      CaoTaskEditForm.ShowModal;
      Result := (CaoTaskEditForm.ReturnCode = rtCommit);
      Task.Changed := Result;
      if Result then begin
        CaoTaskEditForm.DePopulateSelf;
        DataStore.PostTasks;
        DataStore.NotifyDependents;
      end;
    finally
      CaoTaskEditForm.Release;
    end;
  end;
end;


function TVpCaoTaskEditDialog.AddNewTask: Boolean;
begin
  result := false;
  if DataStore <> nil then begin
    teTask := DataStore.Resource.Tasks.AddTask(DataStore.GetNextID('Tasks'));
    if teTask <> nil then begin
      Result := Execute(teTask);
      if not Result then
        teTask.Free;
    end;
  end;
end;

procedure Register;
begin
  {$I ..\resources\vpcaoevnteditdlg_icon.ctrs}
  RegisterComponents('Visual PlanIt',[TVpCaoTaskEditDialog]);
end;

end.
  
