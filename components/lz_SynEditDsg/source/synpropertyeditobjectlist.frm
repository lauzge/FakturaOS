object SynObjectPartListPropertyEditorForm: TSynObjectPartListPropertyEditorForm
  Left = 86
  Height = 300
  Top = 85
  Width = 190
  ActiveControl = SynObjectPartsListBox
  BorderStyle = bsSizeToolWin
  Caption = 'SynObjectPartListPropertyEditorForm'
  ClientHeight = 300
  ClientWidth = 190
  Constraints.MinHeight = 100
  Constraints.MinWidth = 190
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poDefaultPosOnly
  LCLVersion = '7.2'
  object ToolBar1: TToolBar
    AnchorSideTop.Control = ClassComboBox
    AnchorSideTop.Side = asrBottom
    Left = 0
    Height = 42
    Top = 0
    Width = 190
    AutoSize = True
    ButtonHeight = 40
    ButtonWidth = 44
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object AddButton: TToolButton
      Left = 1
      Top = 2
      Caption = 'Add'
      OnClick = AddButtonClick
    end
    object DeleteButton: TToolButton
      Left = 45
      Top = 2
      Caption = 'Delete'
      OnClick = DeleteButtonClick
    end
    object ToolButton3: TToolButton
      Left = 89
      Height = 40
      Top = 2
      Caption = 'ToolButton3'
      Style = tbsSeparator
    end
    object MoveUpButton: TToolButton
      Left = 97
      Top = 2
      Caption = 'Up'
      OnClick = MoveUpButtonClick
    end
    object MoveDownButton: TToolButton
      Left = 141
      Top = 2
      Caption = 'Down'
      OnClick = MoveDownButtonClick
    end
  end
  object SynObjectPartsListBox: TListBox
    Left = 0
    Height = 235
    Top = 65
    Width = 190
    Align = alClient
    ItemHeight = 0
    OnClick = SynObjectPartsListBoxClick
    TabOrder = 1
  end
  object ClassComboBox: TComboBox
    AnchorSideTop.Control = ToolBar1
    Left = 0
    Height = 23
    Top = 42
    Width = 190
    Align = alTop
    Anchors = []
    ItemHeight = 15
    Style = csDropDownList
    TabOrder = 2
  end
end
