object frmEditElement: TfrmEditElement
  Left = 486
  Height = 449
  Top = 220
  Width = 489
  HorzScrollBar.Page = 378
  VertScrollBar.Page = 444
  BorderStyle = bsDialog
  Caption = 'Edit Element'
  ClientHeight = 449
  ClientWidth = 489
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poScreenCenter
  LCLVersion = '6.0'
  object gbVisual: TGroupBox
    Left = 12
    Height = 152
    Top = 181
    Width = 465
    Align = alTop
    AutoSize = True
    BorderSpacing.Left = 12
    BorderSpacing.Top = 8
    BorderSpacing.Right = 12
    Caption = ' Visual '
    ClientHeight = 132
    ClientWidth = 461
    TabOrder = 3
    object rgMeasurement: TRadioGroup
      Left = 104
      Height = 124
      Top = 0
      Width = 98
      Align = alLeft
      AutoFill = True
      AutoSize = True
      BorderSpacing.Left = 8
      BorderSpacing.Bottom = 8
      Caption = ' Measurement '
      ChildSizing.LeftRightSpacing = 6
      ChildSizing.TopBottomSpacing = 6
      ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
      ChildSizing.EnlargeVertical = crsHomogenousChildResize
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 1
      ClientHeight = 104
      ClientWidth = 94
      ItemIndex = 1
      Items.Strings = (
        'Pixels'
        'Percent'
        'Inches'
        'cm'
      )
      OnClick = rgMeasurementClick
      TabOrder = 1
    end
    object rgRotation: TRadioGroup
      Left = 8
      Height = 124
      Top = 0
      Width = 88
      Align = alLeft
      AutoFill = True
      BorderSpacing.Left = 8
      BorderSpacing.Bottom = 8
      BorderSpacing.InnerBorder = 8
      Caption = ' Rotation '
      ChildSizing.LeftRightSpacing = 6
      ChildSizing.TopBottomSpacing = 6
      ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
      ChildSizing.EnlargeVertical = crsHomogenousChildResize
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 1
      ClientHeight = 104
      ClientWidth = 84
      ItemIndex = 0
      Items.Strings = (
        '0'
        '90'
        '180'
        '270'
      )
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 202
      Height = 132
      Top = 0
      Width = 239
      Align = alLeft
      BevelOuter = bvNone
      ClientHeight = 132
      ClientWidth = 239
      TabOrder = 2
      object LblTop: TLabel
        Left = 8
        Height = 15
        Top = 28
        Width = 23
        Caption = 'Top:'
        FocusControl = edTop
        ParentColor = False
      end
      object LblHeight: TLabel
        Left = 136
        Height = 15
        Top = 28
        Width = 39
        BorderSpacing.Right = 4
        Caption = 'Height:'
        FocusControl = edHeight
        ParentColor = False
      end
      object edTop: TEdit
        Left = 44
        Height = 23
        Top = 24
        Width = 48
        OnEnter = PosEditEnter
        OnExit = PosEditExit
        TabOrder = 0
        Text = '0.00'
      end
      object edHeight: TEdit
        Left = 183
        Height = 23
        Top = 24
        Width = 40
        OnEnter = PosEditEnter
        OnExit = PosEditExit
        TabOrder = 1
        Text = '0.00'
      end
      object udHeight: TUpDown
        AnchorSideRight.Side = asrBottom
        Left = 223
        Height = 23
        Top = 24
        Width = 12
        Associate = edHeight
        BorderSpacing.Right = 8
        Min = 0
        OnClick = UpDownClick
        Position = 0
        TabOrder = 2
        Wrap = False
      end
      object LblLeft: TLabel
        Left = 8
        Height = 15
        Top = 60
        Width = 23
        Caption = 'Left:'
        FocusControl = edLeft
        ParentColor = False
      end
      object LblWidth: TLabel
        Left = 141
        Height = 15
        Top = 60
        Width = 35
        BorderSpacing.Right = 4
        Caption = 'Width:'
        FocusControl = edWidth
        ParentColor = False
      end
      object edLeft: TEdit
        Left = 44
        Height = 23
        Top = 56
        Width = 48
        OnEnter = PosEditEnter
        OnExit = PosEditExit
        TabOrder = 3
        Text = '0.00'
      end
      object edWidth: TEdit
        Left = 183
        Height = 23
        Top = 56
        Width = 40
        OnEnter = PosEditEnter
        OnExit = PosEditExit
        TabOrder = 4
        Text = '0.00'
      end
      object udLeft: TUpDown
        Left = 92
        Height = 23
        Top = 56
        Width = 12
        Associate = edLeft
        Min = 0
        OnClick = UpDownClick
        Position = 0
        TabOrder = 5
        Wrap = False
      end
      object udWidth: TUpDown
        AnchorSideRight.Side = asrBottom
        Left = 223
        Height = 23
        Top = 56
        Width = 12
        Associate = edWidth
        BorderSpacing.Right = 8
        Min = 0
        OnClick = UpDownClick
        Position = 0
        TabOrder = 6
        Wrap = False
      end
      object chkVisible: TCheckBox
        Left = 48
        Height = 19
        Top = 88
        Width = 54
        Caption = 'Visible'
        TabOrder = 7
      end
      object udTop: TUpDown
        Left = 92
        Height = 23
        Top = 24
        Width = 12
        Associate = edTop
        Min = 0
        OnClick = UpDownClick
        Position = 0
        TabOrder = 8
        Wrap = False
      end
    end
  end
  object gbCaption: TGroupBox
    Left = 12
    Height = 54
    Top = 341
    Width = 465
    Align = alTop
    AutoSize = True
    BorderSpacing.Left = 12
    BorderSpacing.Top = 8
    BorderSpacing.Right = 12
    Caption = ' Caption '
    ClientHeight = 34
    ClientWidth = 461
    TabOrder = 4
    object lblCaptionText: TLabel
      AnchorSideLeft.Control = gbCaption
      AnchorSideTop.Control = edCaptionText
      AnchorSideTop.Side = asrCenter
      Left = 8
      Height = 15
      Top = 6
      Width = 27
      BorderSpacing.Left = 8
      Caption = 'Text: '
      FocusControl = edCaptionText
      ParentColor = False
    end
    object btnCaptionFont: TButton
      AnchorSideTop.Control = edCaptionText
      AnchorSideTop.Side = asrCenter
      AnchorSideRight.Control = gbCaption
      AnchorSideRight.Side = asrBottom
      Left = 386
      Height = 25
      Top = 1
      Width = 67
      Anchors = [akTop, akRight]
      BorderSpacing.Right = 8
      BorderSpacing.Bottom = 8
      Caption = 'Font...'
      OnClick = btnCaptionFontClick
      TabOrder = 1
    end
    object edCaptionText: TEdit
      AnchorSideLeft.Control = lblCaptionText
      AnchorSideLeft.Side = asrBottom
      AnchorSideRight.Control = btnCaptionFont
      Left = 39
      Height = 23
      Top = 2
      Width = 343
      Anchors = [akTop, akLeft, akRight]
      BorderSpacing.Left = 4
      BorderSpacing.Top = 2
      BorderSpacing.Right = 4
      BorderSpacing.Bottom = 8
      OnChange = edCaptionTextChange
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 12
    Height = 23
    Top = 8
    Width = 465
    Align = alTop
    AutoSize = True
    BorderSpacing.Left = 12
    BorderSpacing.Top = 8
    BorderSpacing.Right = 12
    BorderSpacing.Bottom = 8
    BevelOuter = bvNone
    ClientHeight = 23
    ClientWidth = 465
    TabOrder = 0
    object lblName: TLabel
      AnchorSideTop.Control = edName
      AnchorSideTop.Side = asrCenter
      Left = 0
      Height = 15
      Top = 4
      Width = 38
      Caption = 'Name: '
      ParentColor = False
    end
    object edName: TEdit
      AnchorSideLeft.Control = lblName
      AnchorSideLeft.Side = asrBottom
      Left = 42
      Height = 23
      Top = 0
      Width = 423
      Align = alRight
      Anchors = [akTop, akLeft, akRight, akBottom]
      BorderSpacing.Left = 4
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 12
    Height = 56
    Top = 117
    Width = 467
    Align = alTop
    AutoSize = True
    BorderSpacing.Left = 12
    BorderSpacing.Top = 8
    BorderSpacing.Right = 10
    BevelOuter = bvNone
    ClientHeight = 56
    ClientWidth = 467
    TabOrder = 2
    object gbDayOffset: TGroupBox
      Left = 0
      Height = 56
      Top = 0
      Width = 98
      Caption = 'Day Offset'
      ClientHeight = 36
      ClientWidth = 94
      TabOrder = 0
      object edOffset: TEdit
        Left = 8
        Height = 23
        Top = 2
        Width = 64
        BorderSpacing.Left = 8
        BorderSpacing.Bottom = 8
        TabOrder = 0
        Text = '0'
      end
      object udOffset: TUpDown
        Left = 72
        Height = 23
        Top = 2
        Width = 12
        Associate = edOffset
        BorderSpacing.Right = 8
        Min = 0
        Position = 0
        TabOrder = 1
        Wrap = False
      end
    end
    object rgDayOffsetUnit: TRadioGroup
      AnchorSideLeft.Control = gbDayOffset
      AnchorSideLeft.Side = asrBottom
      AnchorSideRight.Control = Panel2
      AnchorSideRight.Side = asrBottom
      Left = 106
      Height = 51
      Top = 0
      Width = 361
      Anchors = [akTop, akLeft, akRight]
      AutoFill = True
      AutoSize = True
      BorderSpacing.Left = 8
      Caption = ' Day Offset Unit '
      ChildSizing.LeftRightSpacing = 6
      ChildSizing.TopBottomSpacing = 6
      ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
      ChildSizing.EnlargeVertical = crsHomogenousChildResize
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 4
      ClientHeight = 31
      ClientWidth = 357
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Day'
        'Week'
        'Month'
        'Year'
      )
      TabOrder = 1
    end
  end
  object ButtonPanel: TPanel
    Left = 12
    Height = 25
    Top = 403
    Width = 465
    Align = alTop
    BorderSpacing.Left = 12
    BorderSpacing.Top = 8
    BorderSpacing.Right = 12
    BorderSpacing.Bottom = 9
    BevelOuter = bvNone
    ClientHeight = 25
    ClientWidth = 465
    TabOrder = 5
    object btnShape: TButton
      AnchorSideLeft.Control = ButtonPanel
      Left = 0
      Height = 25
      Top = 0
      Width = 75
      Caption = 'Shape...'
      Enabled = False
      OnClick = btnShapeClick
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 316
      Height = 25
      Top = 0
      Width = 75
      Caption = 'OK'
      Default = True
      OnClick = btnOkClick
      TabOrder = 1
    end
    object btnCancel: TButton
      AnchorSideRight.Side = asrBottom
      Left = 391
      Height = 25
      Top = 0
      Width = 74
      Anchors = [akTop]
      Cancel = True
      Caption = 'Cancel'
      OnClick = btnCancelClick
      TabOrder = 2
    end
  end
  object ItemTypePanel: TPanel
    Left = 12
    Height = 70
    Top = 39
    Width = 467
    Align = alTop
    AutoSize = True
    BorderSpacing.Left = 12
    BorderSpacing.Top = 8
    BorderSpacing.Right = 10
    BevelOuter = bvNone
    ClientHeight = 70
    ClientWidth = 467
    TabOrder = 1
    object rgItemType: TRadioGroup
      Left = 0
      Height = 70
      Top = 0
      Width = 303
      AutoFill = True
      AutoSize = True
      Caption = 'Item Type '
      ChildSizing.LeftRightSpacing = 6
      ChildSizing.TopBottomSpacing = 6
      ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
      ChildSizing.EnlargeVertical = crsHomogenousChildResize
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 4
      ClientHeight = 50
      ClientWidth = 299
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'DayView'
        'WeekView'
        'MonthView'
        'Calendar'
        'Shape'
        'Caption'
        'Tasks'
        'Contacts'
      )
      OnClick = rgItemTypeClick
      TabOrder = 0
    end
  end
  object FontDialog1: TFontDialog
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    MinFontSize = 0
    MaxFontSize = 0
    left = 224
    top = 352
  end
end
