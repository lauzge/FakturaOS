object frmEditFormat: TfrmEditFormat
  Left = 403
  Height = 193
  Top = 199
  Width = 329
  HorzScrollBar.Page = 328
  VertScrollBar.Page = 188
  BorderStyle = bsDialog
  Caption = 'Edit Format'
  ClientHeight = 193
  ClientWidth = 329
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poScreenCenter
  LCLVersion = '6.0'
  object LblIncrement: TLabel
    Left = 16
    Height = 15
    Top = 72
    Width = 80
    Caption = 'Day Increment:'
    FocusControl = edIncrement
    ParentColor = False
  end
  object LblDescription: TLabel
    Left = 16
    Height = 15
    Top = 44
    Width = 66
    Caption = 'Description: '
    FocusControl = edDescription
    ParentColor = False
  end
  object LblName: TLabel
    Left = 16
    Height = 15
    Top = 16
    Width = 38
    Caption = 'Name: '
    FocusControl = edName
    ParentColor = False
  end
  object btnOk: TButton
    Left = 157
    Height = 25
    Top = 160
    Width = 75
    Caption = 'OK'
    Default = True
    OnClick = btnOkClick
    TabOrder = 5
  end
  object btnCancel: TButton
    Left = 237
    Height = 25
    Top = 160
    Width = 75
    Cancel = True
    Caption = 'Cancel'
    OnClick = btnCancelClick
    TabOrder = 6
  end
  object rgDayIncrement: TRadioGroup
    Left = 16
    Height = 51
    Top = 101
    Width = 296
    AutoFill = True
    Caption = ' Day Increment Unit '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 4
    ClientHeight = 31
    ClientWidth = 292
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Day'
      'Week'
      'Month'
      'Year'
    )
    TabOrder = 4
    TabStop = True
  end
  object edDescription: TEdit
    Left = 88
    Height = 23
    Top = 40
    Width = 224
    TabOrder = 1
  end
  object edName: TEdit
    Left = 64
    Height = 23
    Top = 12
    Width = 248
    TabOrder = 0
  end
  object udIncrement: TUpDown
    Left = 158
    Height = 23
    Top = 68
    Width = 12
    Associate = edIncrement
    Max = 365
    Min = 0
    Position = 0
    TabOrder = 3
    Wrap = False
  end
  object edIncrement: TEdit
    Left = 104
    Height = 23
    Top = 68
    Width = 54
    TabOrder = 2
    Text = '0'
  end
end
