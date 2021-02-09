object BLZForm: TBLZForm
  Left = 373
  Height = 289
  Top = 256
  Width = 456
  Caption = 'Bankleitzahlen'
  ClientHeight = 289
  ClientWidth = 456
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object BLZPanel: TPanel
    Left = 0
    Height = 289
    Top = 0
    Width = 456
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 289
    ClientWidth = 456
    TabOrder = 0
    object SB: TStatusBar
      Left = 0
      Height = 23
      Top = 266
      Width = 456
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      Panels = <      
        item
          Width = 100
        end      
        item
          Width = 100
        end      
        item
          Width = 50
        end>
      ParentFont = False
      SimplePanel = False
    end
    object ToolBar1: TToolBar
      Left = 0
      Height = 22
      Top = 244
      Width = 456
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 22
      ButtonWidth = 94
      Caption = 'ToolBar1'
      EdgeBorders = []
      Images = MainForm.ImageList1
      Indent = 0
      List = True
      ShowCaptions = True
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 0
        Height = 22
        Top = 0
        Width = 180
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 22
        ClientWidth = 180
        DataSource = BLZ_DS
        Flat = True
        Options = []
        TabOrder = 0
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      end
      object ToolButton1: TToolButton
        Left = 180
        Height = 22
        Top = 0
        Caption = 'ToolButton2'
        Style = tbsSeparator
      end
      object Label25: TLabel
        Left = 188
        Height = 22
        Top = 0
        Width = 57
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegr.'
        Layout = tlCenter
        ParentColor = False
      end
      object ToolButton2: TToolButton
        Left = 245
        Height = 22
        Top = 0
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object Suchbegr: TEdit
        Left = 253
        Height = 21
        Top = 0
        Width = 89
        Color = clWindow
        OnChange = SuchbegrChange
        TabOrder = 1
      end
      object UebernBtn: TToolButton
        Left = 342
        Top = 0
        Caption = 'Über&nehmen'
        ImageIndex = 22
        OnClick = BLZGridDblClick
        Visible = False
      end
    end
    object BLZGrid: TDBGrid
      Left = 0
      Height = 244
      Top = 0
      Width = 456
      Align = alClient
      Color = clWindow
      Columns = <      
        item
          Title.Caption = 'Land'
          Width = 30
          FieldName = 'LAND'
        end      
        item
          Title.Caption = 'BLZ'
          Width = 101
          FieldName = 'BLZ'
        end      
        item
          Title.Caption = 'Name der Bank'
          Width = 317
          FieldName = 'BANK_NAME'
        end>
      DataSource = BLZ_DS
      DefaultRowHeight = 16
      TabOrder = 2
      OnDblClick = BLZGridDblClick
    end
  end
  object BLZQuery: TZQuery
    Connection = DM1.DB1
    OnNewRecord = BLZQueryNewRecord
    SQL.Strings = (
      'SELECT LAND, BLZ ,BANK_NAME'
      'FROM BLZ'
      'ORDER BY BLZ, BANK_NAME'
    )
    Params = <>
    Left = 245
    Top = 108
    object BLZQueryLAND: TZRawStringField
      DisplayLabel = 'Land'
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object BLZQueryBLZ: TZIntegerField
      FieldKind = fkData
      FieldName = 'BLZ'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object BLZQueryBANK_NAME: TZRawStringField
      DisplayLabel = 'Name der Bank'
      DisplayWidth = 40
      FieldKind = fkData
      FieldName = 'BANK_NAME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
  end
  object BLZ_DS: TDataSource
    DataSet = BLZQuery
    OnDataChange = BLZ_DSDataChange
    Left = 176
    Top = 108
  end
end
