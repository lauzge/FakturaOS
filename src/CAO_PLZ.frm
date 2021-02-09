object PLZForm: TPLZForm
  Left = 373
  Height = 289
  Top = 256
  Width = 456
  Caption = 'Postleitzahlen und Orte'
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
  object PLZPanel: TPanel
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
        DataSource = PLZ_DS
        Flat = True
        Options = []
        TabOrder = 0
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      end
      object ToolButton2: TToolButton
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
        Width = 54
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegr.'
        Layout = tlCenter
        ParentColor = False
      end
      object ToolButton1: TToolButton
        Left = 242
        Height = 22
        Top = 0
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object Suchbegr: TEdit
        Left = 250
        Height = 21
        Top = 0
        Width = 89
        OnChange = SuchbegrChange
        TabOrder = 1
      end
      object UebernBtn: TToolButton
        Left = 339
        Top = 0
        Caption = 'Über&nehmen'
        ImageIndex = 22
        OnClick = PLZGridDblClick
        Visible = False
      end
    end
    object PLZGrid: TDBGrid
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
          Title.Caption = 'PLZ'
          Width = 61
          FieldName = 'PLZ'
        end      
        item
          Title.Caption = 'Ort'
          Width = 141
          FieldName = 'NAME'
        end      
        item
          Title.Caption = 'Vorwahl'
          Width = 61
          FieldName = 'VORWAHL'
        end      
        item
          Title.Caption = 'Bundesland'
          Width = 64
          FieldName = 'BUNDESLAND'
        end>
      DataSource = PLZ_DS
      DefaultRowHeight = 16
      TabOrder = 2
      OnDblClick = PLZGridDblClick
    end
  end
  object PLZQuery: TZQuery
    Connection = DM1.DB1
    OnNewRecord = PLZQueryNewRecord
    SQL.Strings = (
      'SELECT LAND, PLZ ,NAME ,VORWAHL , BUNDESLAND'
      'FROM PLZ'
      'ORDER BY LAND, PLZ, NAME'
    )
    Params = <>
    Left = 163
    Top = 56
    object PLZQueryLAND: TZRawStringField
      DisplayLabel = 'Land'
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 3
    end
    object PLZQueryPLZ: TZRawStringField
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object PLZQueryNAME: TZRawStringField
      DisplayLabel = 'Ort'
      DisplayWidth = 45
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 50
    end
    object PLZQueryVORWAHL: TZRawStringField
      DisplayLabel = 'Vorwahl'
      FieldKind = fkData
      FieldName = 'VORWAHL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 12
    end
    object PLZQueryBUNDESLAND: TZRawStringField
      DisplayLabel = 'Bundesland'
      FieldKind = fkData
      FieldName = 'BUNDESLAND'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 3
    end
  end
  object PLZ_DS: TDataSource
    DataSet = PLZQuery
    OnDataChange = PLZ_DSDataChange
    Left = 240
    Top = 56
  end
end
