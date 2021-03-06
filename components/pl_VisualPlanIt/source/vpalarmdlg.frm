object AlarmNotifyForm: TAlarmNotifyForm
  Left = 487
  Height = 215
  Top = 256
  Width = 410
  HorzScrollBar.Page = 399
  VertScrollBar.Page = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Reminder'
  ClientHeight = 215
  ClientWidth = 410
  Color = clWindow
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  Position = poDefault
  LCLVersion = '7.2'
  object SnoozeCaption: TLabel
    Left = 16
    Height = 57
    Top = 136
    Width = 152
    AutoSize = False
    Caption = 'SnoozeCaption'
    ParentColor = False
    WordWrap = True
  end
  object lSubject: TLabel
    Left = 16
    Height = 15
    Top = 32
    Width = 45
    Caption = 'lSubject'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lTime: TLabel
    Left = 16
    Height = 15
    Top = 8
    Width = 29
    Caption = 'lTime'
    ParentColor = False
  end
  object DismissBtn: TButton
    Left = 176
    Height = 32
    Top = 170
    Width = 112
    Caption = 'DismissBtn'
    OnClick = DismissBtnClick
    TabOrder = 0
  end
  object SnoozeBtn: TButton
    Left = 296
    Height = 32
    Top = 136
    Width = 99
    Caption = 'SnoozeBtn'
    OnClick = SnoozeBtnClick
    TabOrder = 1
  end
  object OpenItemBtn: TButton
    Left = 296
    Height = 32
    Top = 170
    Width = 99
    Caption = 'OpenItemBtn'
    Default = True
    OnClick = OpenItemBtnClick
    TabOrder = 2
  end
  object SnoozeCombo: TComboBox
    Left = 176
    Height = 23
    Top = 136
    Width = 112
    ItemHeight = 15
    Items.Strings = (
      '5 Minutes'
      '10 Minutes'
      '15 Minutes'
      '30 Minutes'
      '45 Minutes'
      '1 Hours'
      '2 Hours'
      '3 Hours'
      '4 Hours'
      '5 Hours'
      '6 Hours'
      '7 Hours'
      '8 Hours'
      '1 Days'
      '2 Days'
      '3 Days'
      '4 Days'
      '5 Days'
      '6 Days'
      '1 Week'
    )
    OnChange = SnoozeComboChange
    ParentColor = True
    Style = csDropDownList
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 16
    Height = 72
    Top = 56
    Width = 379
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ClientHeight = 72
    ClientWidth = 379
    TabOrder = 4
    object lNotes: TLabel
      Left = 2
      Height = 68
      Top = 2
      Width = 375
      Align = alClient
      AutoSize = False
      Caption = 'lNotes'
      ParentColor = False
      WordWrap = True
    end
  end
  object EventDialog: TVpEventEditDialog
    TimeFormat = tf24Hour
    Options = []
    Placement.Position = mpCenterTop
    Placement.Top = 10
    Placement.Left = 10
    Placement.Height = 412
    Placement.Width = 705
    Left = 360
    Top = 8
  end
end
