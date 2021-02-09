object InfoForm: TInfoForm
  Left = 86
  Height = 558
  Top = 85
  Width = 633
  Caption = 'alle Notizen'
  ClientHeight = 538
  ClientWidth = 633
  Color = clBtnFace
  Font.Color = clWindowText
  Menu = MainMenu1
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  LCLVersion = '7.2'
  object InfoPanel: TPanel
    Left = 0
    Height = 538
    Top = 0
    Width = 633
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 538
    ClientWidth = 633
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Height = 22
      Top = 516
      Width = 633
      Align = alBottom
      BorderWidth = 2
      ButtonHeight = 22
      ButtonWidth = 80
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 1
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 1
        Height = 22
        Top = 0
        Width = 241
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 22
        ClientWidth = 241
        DataSource = InfoDS
        Flat = True
        Options = []
        TabOrder = 0
      end
      object ToolButton1: TToolButton
        Left = 242
        Height = 22
        Top = 0
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object Label3: TLabel
        Left = 250
        Height = 22
        Top = 0
        Width = 64
        AutoSize = False
        Caption = 'Suchbegriff :'
        Layout = tlCenter
        ParentColor = False
      end
      object Suchbeg: TEdit
        Left = 314
        Height = 23
        Top = 0
        Width = 110
        TabOrder = 1
      end
      object ErledBtn: TToolButton
        Left = 432
        Top = 0
        AutoSize = True
        Caption = 'Erledigt'
        ImageIndex = 12
        OnClick = ErledBtnClick
      end
      object ToolButton3: TToolButton
        Left = 424
        Height = 22
        Top = 0
        Caption = 'ToolButton3'
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 512
        Height = 22
        Top = 0
        Caption = 'ToolButton4'
        Style = tbsSeparator
      end
      object PrintBtn: TToolButton
        Left = 520
        Top = 0
        Caption = 'Drucken'
        Enabled = False
        ImageIndex = 11
        Visible = False
      end
    end
    object TopStatusPan: TPanel
      Left = 0
      Height = 35
      Top = 0
      Width = 633
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      BorderWidth = 3
      ClientHeight = 35
      ClientWidth = 633
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 2
      object Label2: TLabel
        Left = 4
        Height = 27
        Top = 4
        Width = 5
        Align = alLeft
        AutoSize = False
        Color = clBtnShadow
        ParentColor = False
        Transparent = False
      end
      object MainLabLeft: TLabel
        Left = 9
        Height = 27
        Top = 4
        Width = 52
        Align = alLeft
        Caption = 'Notizen'
        Color = clBtnShadow
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object MainLabMid: TLabel
        Left = 61
        Height = 27
        Top = 4
        Width = 3
        Align = alLeft
        AutoSize = False
        Color = clBtnShadow
        ParentColor = False
        Transparent = False
      end
      object MainLabelMid: TLabel
        Left = 64
        Height = 27
        Top = 4
        Width = 523
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'ddfdfdd'
        Color = clBtnShadow
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object MainPanRight: TPanel
        Left = 587
        Height = 27
        Top = 4
        Width = 42
        Align = alRight
        BevelOuter = bvNone
        ClientHeight = 27
        ClientWidth = 42
        Color = clBtnShadow
        ParentColor = False
        TabOrder = 0
        object Image1: TImage
          Left = 0
          Height = 27
          Top = 0
          Width = 42
          Align = alClient
          Center = True
          Picture.Data = {
            1754506F727461626C654E6574776F726B477261706869639902000089504E47
            0D0A1A0A0000000D49484452000000110000001108030000000CB3B7C8000001
            85694343504943432070726F66696C65000028917D913D48C3401886DFA64A45
            2A1DAC20E290A13A5910157194562C8285D25668D5C1E4D23F68D290A4B8380A
            AE05077F16AB0E2ECEBA3AB80A82E00F8893A393A28B94F85D526811E31DC73D
            BCF7BD2F77DF0142B3CA54B367125035CB482762622EBF2A065E11A419828021
            89997A32B39885E7F8BA878FEF77519EE55DF7E718500A26037C22F13CD30D8B
            78837876D3D239EF138759595288CF89270CBA20F123D76597DF38971C167866
            D8C8A6E3C46162B1D4C57217B3B2A112CF10471455A37C21E7B2C2798BB35AAD
            B3F63DF90B83056D25C3755AA348600949A42042461D155461214ABB468A8934
            9DC73CFC238E3F452E995C1530722CA0061592E307FF83DFBD358BD3536E5230
            06F4BED8F6C71810D8055A0DDBFE3EB6EDD609E07F06AEB48EBFD604E63E496F
            74B4C81110DA062EAE3B9ABC075CEE00C34FBA64488EE4A725148BC0FB197D53
            1E18BC05FAD7DCBEB5CF71FA0064A957CB37C0C121305EA2EC758F77F775F7ED
            DF9A76FF7E00255E72881193432000000033504C5445504798000000BF000000
            BF00BFBF000000BFBF00BF00BFBFC0C0C0808080FF000000FF00FFFF000000FF
            FF00FF00FFFFFFFFFF8ABA65950000000174524E530040E6D86600000001624B
            47440088051D48000000097048597300000B1300000B1301009A9C1800000007
            74494D4507E40C0C162830AD08E0490000004E4944415418D3A590410A003108
            03EB5D21FF7FED9AD80D7BD84BE9A46019D442D73A2044170B2413369156BB1D
            0C950CD01D392AC628547B336FC0286ED494E0F4FBAEB1A9EAD35CF67CF8FF84
            0725FC060AC88ED8A10000000049454E44AE426082
          }
        end
      end
    end
    object CenterPan: TPanel
      Left = 0
      Height = 481
      Top = 35
      Width = 633
      Align = alClient
      BevelOuter = bvNone
      ClientHeight = 481
      ClientWidth = 633
      TabOrder = 0
      object MsgPan: TPanel
        Left = 0
        Height = 163
        Top = 318
        Width = 633
        Align = alBottom
        BevelOuter = bvNone
        ClientHeight = 163
        ClientWidth = 633
        TabOrder = 0
        object Panel4: TPanel
          Left = 0
          Height = 29
          Top = 0
          Width = 633
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel4'
          ClientHeight = 29
          ClientWidth = 633
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Height = 15
            Top = 10
            Width = 44
            Caption = 'Kurzinfo'
            ParentColor = False
          end
          object KurzInfoEdi: TDBEdit
            Left = 52
            Height = 23
            Top = 2
            Width = 368
            DataField = 'KURZTEXT'
            DataSource = InfoDS
            MaxLength = 0
            TabOrder = 0
          end
          object WVCB: TDBCheckBox
            Left = 428
            Height = 23
            Top = 2
            Width = 112
            Caption = 'Wiedergabevorlage'
            DataField = 'WIEDERVORLAGE'
            DataSource = InfoDS
            TabOrder = 1
            TabStop = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object WVDate: TDBDateEdit
            Left = 543
            Height = 21
            Top = 2
            Width = 91
            CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
            DateOrder = doNone
            ButtonWidth = 23
            AutoSize = False
            NumGlyphs = 1
            MaxLength = 0
            TabOrder = 2
            Text = 'WVDate'
            DataField = 'WV_DATUM'
            DataSource = InfoDS
          end
        end
        object DBRichMemo1: TDBRichMemo
          Left = 0
          Height = 134
          Top = 29
          Width = 633
          Align = alClient
          DataField = 'MEMO'
          DataSource = InfoDS
          TabOrder = 1
        end
      end
      object Splitter1: TSplitter
        Cursor = crVSplit
        Left = 0
        Height = 5
        Top = 313
        Width = 633
        Align = alBottom
        ResizeAnchor = akBottom
      end
      object InfoGrid: TDBGrid
        Left = 0
        Height = 313
        Top = 0
        Width = 633
        Align = alClient
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'lfd. Nr.'
            Width = 35
            FieldName = 'LFD_NR'
          end        
          item
            Title.Caption = 'Datum'
            Width = 64
            FieldName = 'DATUM'
          end        
          item
            Title.Caption = 'Erledigt'
            Visible = False
            FieldName = 'ERLED'
          end        
          item
            Title.Caption = 'Info'
            Width = 394
            FieldName = 'KURZTEXT'
          end        
          item
            Title.Caption = 'Erstellt von'
            Width = 124
            FieldName = 'ERST_VON'
          end        
          item
            Title.Caption = 'WV'
            Width = 25
            FieldName = 'CALC_WV'
          end        
          item
            Title.Caption = 'WV am'
            FieldName = 'WV_DATUM'
          end>
        DataSource = InfoDS
        TabOrder = 2
        OnDrawColumnCell = InfoGridDrawColumnCell
      end
    end
  end
  object InfoDS: TDataSource
    DataSet = InfoTab
    OnDataChange = InfoDSDataChange
    Left = 121
    Top = 153
  end
  object InfoTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = InfoTabAfterScroll
    AfterScroll = InfoTabAfterScroll
    OnCalcFields = InfoTabCalcFields
    AfterInsert = InfoTabAfterInsert
    AfterPost = InfoTabAfterPost
    OnNewRecord = InfoTabNewRecord
    SQL.Strings = (
      'select * from INFO'
    )
    Params = <>
    Left = 184
    Top = 153
    object InfoTabLFD_NR: TZIntegerField
      DisplayLabel = 'lfd.Nr.'
      DisplayWidth = 4
      FieldKind = fkData
      FieldName = 'LFD_NR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00000'
    end
    object InfoTabERLED: TZSmallIntField
      DisplayLabel = 'Erledigt'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'ERLED'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object InfoTabQUELLE: TZShortIntField
      DisplayLabel = 'Quelle'
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object InfoTabDATUM: TZDateField
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'DATUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object InfoTabKURZTEXT: TZRawStringField
      DisplayLabel = 'Info'
      DisplayWidth = 65
      FieldKind = fkData
      FieldName = 'KURZTEXT'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object InfoTabWIEDERVORLAGE: TZSmallIntField
      DisplayLabel = 'WV'
      FieldKind = fkData
      FieldName = 'WIEDERVORLAGE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object InfoTabWV_DATUM: TZDateField
      DisplayLabel = 'WV am'
      FieldKind = fkData
      FieldName = 'WV_DATUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object InfoTabERST_VON: TZRawStringField
      DisplayLabel = 'Erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_VON'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object InfoTabMEMO: TMemoField
      FieldKind = fkData
      FieldName = 'MEMO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      BlobType = ftMemo
    end
    object InfoTabCALC_WV: TBooleanField
      DisplayLabel = 'WV'
      FieldKind = fkCalculated
      FieldName = 'CALC_WV'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 41
    Top = 153
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object neuenBelegerstellen1: TMenuItem
        Caption = 'neue Info'
        ImageIndex = 23
        OnClick = neuenBelegerstellen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Löschen'
        ImageIndex = 19
        OnClick = Storno1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout Speichern'
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object Datum1: TMenuItem
        Tag = 1
        Caption = 'Datum'
        Checked = True
        GroupIndex = 1
        RadioItem = True
        OnClick = Erstellt1Click
      end
      object Info1: TMenuItem
        Tag = 2
        Caption = 'Info'
        GroupIndex = 1
        RadioItem = True
        OnClick = Erstellt1Click
      end
      object Erstellt1: TMenuItem
        Tag = 3
        Caption = 'Erstellt'
        GroupIndex = 1
        RadioItem = True
        OnClick = Erstellt1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object nurUnerledigt1: TMenuItem
        Caption = 'nur Unerledigt'
        OnClick = nurUnerledigt1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
  end
end
