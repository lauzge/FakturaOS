object frmSelectResource: TfrmSelectResource
  Left = 303
  Height = 162
  Top = 202
  Width = 274
  HorzScrollBar.Page = 273
  VertScrollBar.Page = 161
  Caption = 'Select a Resource'
  ClientHeight = 162
  ClientWidth = 274
  Position = poDesktopCenter
  LCLVersion = '6.0'
  object Bevel1: TBevel
    Left = 8
    Height = 105
    Top = 8
    Width = 257
  end
  object lblSelectResource: TLabel
    Left = 16
    Height = 15
    Top = 16
    Width = 91
    Caption = 'Select a Resource'
    ParentColor = False
  end
  object VpResourceCombo1: TVpResourceCombo
    Left = 16
    Height = 21
    Top = 40
    Width = 232
    Style = csDropDownList
  end
  object btnOK: TButton
    Left = 112
    Height = 25
    Top = 128
    Width = 75
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 192
    Height = 25
    Top = 128
    Width = 75
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object btnAddNew: TButton
    Left = 16
    Height = 25
    Top = 72
    Width = 113
    Caption = 'Add New Resource'
    OnClick = btnAddNewClick
    TabOrder = 1
  end
  object btnEdit: TButton
    Left = 136
    Height = 25
    Top = 72
    Width = 113
    Caption = 'Edit This Resource'
    OnClick = btnEditClick
    TabOrder = 2
  end
  object VpResourceEditDialog1: TVpResourceEditDialog
    Version = 'v1.03'
    Options = []
    Placement.Position = mpCenter
    Placement.Top = 10
    Placement.Left = 10
    Placement.Height = 250
    Placement.Width = 400
    left = 232
    top = 16
  end
end
