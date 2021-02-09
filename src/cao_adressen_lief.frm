object AdressenLiefForm: TAdressenLiefForm
  Left = 387
  Height = 232
  Top = 256
  Width = 424
  HelpContext = 110700
  Caption = 'Lieferanschrift'
  ClientHeight = 232
  ClientWidth = 424
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnCreate = FormCreate
  LCLVersion = '7.2'
  object PC1: TPageControl
    Left = 0
    Height = 210
    Top = 0
    Width = 424
    ActivePage = ListeTS
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object ListeTS: TTabSheet
      Caption = 'ListeTS'
      ClientHeight = 184
      ClientWidth = 416
      object AddrGrid: TDBGrid
        Left = 0
        Height = 184
        Top = 0
        Width = 416
        Align = alClient
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'Anrede'
            Width = 50
            FieldName = 'ANREDE'
          end        
          item
            Title.Caption = 'Name 1'
            Width = 100
            FieldName = 'NAME1'
          end        
          item
            Title.Caption = 'Name 2'
            Width = 100
            FieldName = 'NAME2'
          end        
          item
            Title.Caption = 'Straße'
            Width = 100
            FieldName = 'STRASSE'
          end        
          item
            Title.Caption = 'Land'
            Width = 30
            FieldName = 'LAND'
          end        
          item
            Title.Caption = 'PLZ'
            Width = 30
            FieldName = 'PLZ'
          end        
          item
            Title.Caption = 'Ort'
            Width = 100
            FieldName = 'ORT'
          end>
        DataSource = KunLiefDS
        TabOrder = 0
        OnDblClick = AddrGridDblClick
      end
    end
    object DetailsTS: TTabSheet
      Caption = 'DetailsTS'
      ClientHeight = 184
      ClientWidth = 416
      object LiefAnsrGB: TPanel
        Left = 0
        Height = 184
        Top = 0
        Width = 416
        Align = alClient
        BevelOuter = bvLowered
        ClientHeight = 184
        ClientWidth = 416
        Color = 14680063
        ParentColor = False
        TabOrder = 0
        object lanrede: TVolgaDBEdit
          Tag = 1
          Left = 92
          Height = 21
          Top = 6
          Width = 317
          AutoDropDown = True
          DataField = 'ANREDE'
          DataSource = KunLiefDS
          DialogStyle = vdsCombo
          MaxLength = 0
          Style = vcsDropDownList
          TabOrder = 0
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object Label1: TLabel
          Left = 5
          Height = 13
          Top = 10
          Width = 78
          AutoSize = False
          Caption = 'Anrede:'
          FocusControl = lanrede
          ParentColor = False
        end
        object Label2: TLabel
          Left = 5
          Height = 13
          Top = 154
          Width = 77
          AutoSize = False
          Caption = 'Land/Plz/Ort:'
          ParentColor = False
        end
        object Label18: TLabel
          Left = 5
          Height = 13
          Top = 130
          Width = 77
          AutoSize = False
          Caption = 'Strasse:'
          FocusControl = lstrasse
          ParentColor = False
        end
        object Label19: TLabel
          Left = 5
          Height = 13
          Top = 106
          Width = 77
          AutoSize = False
          Caption = 'z.Hd. von:'
          FocusControl = labteilung
          ParentColor = False
        end
        object Label20: TLabel
          Left = 5
          Height = 13
          Top = 82
          Width = 77
          AutoSize = False
          Caption = 'Name 3:'
          FocusControl = lname3
          ParentColor = False
        end
        object Label21: TLabel
          Left = 5
          Height = 13
          Top = 58
          Width = 77
          AutoSize = False
          Caption = 'Name 2:'
          FocusControl = lname2
          ParentColor = False
        end
        object Label22: TLabel
          Left = 6
          Height = 13
          Top = 34
          Width = 77
          AutoSize = False
          Caption = 'Name 1:'
          FocusControl = lname1
          ParentColor = False
        end
        object lname1: TDBEdit
          Left = 92
          Height = 21
          Top = 30
          Width = 317
          DataField = 'NAME1'
          DataSource = KunLiefDS
          AutoSelect = False
          MaxLength = 0
          TabOrder = 1
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lname2: TDBEdit
          Left = 92
          Height = 21
          Top = 54
          Width = 317
          DataField = 'NAME2'
          DataSource = KunLiefDS
          AutoSelect = False
          MaxLength = 0
          TabOrder = 2
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lname3: TDBEdit
          Left = 92
          Height = 21
          Top = 78
          Width = 317
          DataField = 'NAME3'
          DataSource = KunLiefDS
          AutoSelect = False
          MaxLength = 0
          TabOrder = 3
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object labteilung: TDBEdit
          Left = 92
          Height = 21
          Top = 102
          Width = 317
          DataField = 'ABTEILUNG'
          DataSource = KunLiefDS
          AutoSelect = False
          MaxLength = 0
          TabOrder = 4
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lstrasse: TDBEdit
          Left = 92
          Height = 21
          Top = 126
          Width = 317
          DataField = 'STRASSE'
          DataSource = KunLiefDS
          AutoSelect = False
          MaxLength = 0
          TabOrder = 5
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lland: TDBEdit
          Left = 92
          Height = 21
          Top = 150
          Width = 22
          DataField = 'LAND'
          DataSource = KunLiefDS
          MaxLength = 0
          TabOrder = 6
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
        end
        object lplz: TDBComboBox
          Left = 120
          Height = 21
          Top = 150
          Width = 75
          AutoSelect = False
          DataField = 'PLZ'
          DataSource = KunLiefDS
          ItemHeight = 13
          MaxLength = 0
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
          TabOrder = 7
        end
        object lort: TDBComboBox
          Left = 200
          Height = 21
          Top = 150
          Width = 209
          AutoSelect = False
          DataField = 'ORT'
          DataSource = KunLiefDS
          ItemHeight = 13
          MaxLength = 0
          OnClick = lplzButtonClick
          OnEnter = lanredeEnter
          OnExit = lanredeExit
          OnKeyDown = lanredeKeyDown
          OnKeyPress = lanredeKeyPress
          TabOrder = 8
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Height = 22
    Top = 210
    Width = 424
    Align = alBottom
    AutoSize = True
    ButtonHeight = 22
    ButtonWidth = 63
    Caption = 'ToolBar1'
    EdgeBorders = []
    Flat = False
    Images = MainForm.ImageList1
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    Wrapable = False
    object DBNavigator1: TDBNavigator
      Left = 1
      Height = 22
      Top = 0
      Width = 240
      BevelOuter = bvNone
      ChildSizing.EnlargeHorizontal = crsScaleChilds
      ChildSizing.EnlargeVertical = crsScaleChilds
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 100
      ClientHeight = 22
      ClientWidth = 240
      DataSource = KunLiefDS
      Flat = True
      Options = []
      ParentShowHint = False
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 241
      Height = 22
      Top = 0
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object DetailBtn: TToolButton
      Left = 249
      Top = 0
      AutoSize = True
      Caption = 'Details'
      ImageIndex = 48
      OnClick = AddrGridDblClick
    end
    object ToolButton3: TToolButton
      Left = 312
      Height = 22
      Top = 0
      Caption = 'ToolButton3'
      Style = tbsSeparator
    end
    object UebernehmenBtn: TToolButton
      Left = 320
      Top = 0
      AutoSize = True
      Caption = 'Übernehmen'
      ImageIndex = 22
      OnClick = UebernehmenBtnClick
    end
  end
  object KunLiefTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = KunLiefTabAfterOpen
    AfterInsert = KunLiefTabAfterInsert
    BeforePost = KunLiefTabBeforePost
    AfterPost = KunLiefTabAfterOpen
    AfterCancel = KunLiefTabAfterOpen
    BeforeDelete = KunLiefTabBeforeDelete
    AfterDelete = KunLiefTabAfterOpen
    SQL.Strings = (
      'select * from ADRESSEN_LIEF'
      'where ADDR_ID=:ADDR_ID'
      'order by NAME1, STRASSE, PLZ, ORT'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    Left = 175
    Top = 101
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    object KunLiefTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunLiefTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KunLiefTabANREDE: TZRawStringField
      DisplayLabel = 'Anrede'
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunLiefTabNAME1: TZRawStringField
      DisplayLabel = 'Name 1'
      FieldKind = fkData
      FieldName = 'NAME1'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object KunLiefTabNAME2: TZRawStringField
      DisplayLabel = 'Name 2'
      FieldKind = fkData
      FieldName = 'NAME2'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunLiefTabABTEILUNG: TZRawStringField
      DisplayLabel = 'Abteilung'
      FieldKind = fkData
      FieldName = 'ABTEILUNG'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunLiefTabSTRASSE: TZRawStringField
      DisplayLabel = 'Straße'
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object KunLiefTabLAND: TZRawStringField
      DisplayLabel = 'Land'
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KunLiefTabPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 10
    end
    object KunLiefTabORT: TZRawStringField
      DisplayLabel = 'Ort'
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object KunLiefTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object KunLiefTabNAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME3'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
  end
  object KunLiefDS: TDataSource
    DataSet = KunLiefTab
    Left = 264
    Top = 108
  end
end
