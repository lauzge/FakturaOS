object KassenBuchForm: TKassenBuchForm
  Left = 373
  Height = 490
  Top = 256
  Width = 682
  Caption = 'Kassenbuch'
  ClientHeight = 470
  ClientWidth = 682
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  Menu = MainMenu1
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  LCLVersion = '7.2'
  object MainPanel: TPanel
    Left = 0
    Height = 470
    Top = 0
    Width = 682
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 470
    ClientWidth = 682
    TabOrder = 0
    object KasBuchGrid: TDBGrid
      Left = 0
      Height = 393
      Top = 27
      Width = 682
      Align = alClient
      BorderStyle = bsNone
      Color = clWindow
      Columns = <      
        item
          ReadOnly = True
          Title.Caption = 'Datum'
          Width = 60
          FieldName = 'BDATUM'
        end      
        item
          ReadOnly = True
          Title.Caption = 'Quelle'
          Width = 86
          FieldName = 'QuelleStr'
        end      
        item
          ReadOnly = True
          Title.Caption = 'Beleg'
          Width = 67
          FieldName = 'BELEGNUM'
        end      
        item
          Title.Caption = 'Zu- / Abgang'
          Width = 80
          FieldName = 'ZU_ABGANG'
        end      
        item
          Title.Caption = 'Buchungstext'
          Width = 266
          FieldName = 'BTXT'
        end      
        item
          Title.Caption = 'Skonto'
          Width = 41
          FieldName = 'SKONTO'
        end      
        item
          Title.Caption = 'G-Kto'
          Width = 41
          FieldName = 'GKONTO'
        end>
      DataSource = KasBuchDS
      DefaultRowHeight = 32
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      OnKeyDown = KasBuchGridKeyDown
    end
    object ToolBar1: TToolBar
      Left = 0
      Height = 26
      Top = 444
      Width = 682
      Align = alBottom
      ButtonHeight = 22
      ButtonWidth = 96
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 1
        Height = 22
        Top = 0
        Width = 177
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 22
        ClientWidth = 177
        DataSource = KasBuchDS
        Flat = True
        Options = []
        TabOrder = 0
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
      end
      object ToolButton2: TToolButton
        Left = 178
        Height = 22
        Top = 0
        Caption = 'ToolButton2'
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 186
        Top = 0
        AutoSize = True
        Caption = '&Suchen'
        ImageIndex = 10
        MenuItem = Suchen1
      end
      object ToolButton4: TToolButton
        Left = 282
        Height = 22
        Top = 0
        Caption = 'ToolButton4'
        Style = tbsSeparator
      end
      object StornoBtn: TToolButton
        Left = 290
        Top = 0
        Caption = 'Storno'
        ImageIndex = 6
        MenuItem = Storno1
      end
      object ToolButton3: TToolButton
        Left = 386
        Height = 22
        Top = 0
        Caption = 'ToolButton3'
        Style = tbsSeparator
      end
      object ManBuchBtn: TToolButton
        Left = 394
        Top = 0
        AutoSize = True
        Caption = 'man. Buchung'
        ImageIndex = 12
        MenuItem = ManuelleBuchung1
      end
      object ToolButton5: TToolButton
        Left = 490
        Height = 22
        Top = 0
        Caption = 'ToolButton5'
        Style = tbsSeparator
      end
      object PrintJournalBtn: TToolButton
        Left = 498
        Top = 0
        AutoSize = True
        Caption = 'Kassenbuch'
        ImageIndex = 11
        MenuItem = Kassenbuchdrucken1
      end
    end
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 682
      Align = alTop
      BevelOuter = bvNone
      ClientHeight = 27
      ClientWidth = 682
      Color = clBtnShadow
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      OnResize = TopPanResize
      object Label35: TLabel
        Left = 0
        Height = 27
        Top = 0
        Width = 100
        Align = alLeft
        Caption = '  Kassenbuch  '
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object DatumAW: TVolgaPeriod
        Left = 546
        Height = 27
        Hint = 'mit rechtem Mausklick Zeitraum auswählen ...'
        Top = 0
        Width = 136
        KindRange = ksMonth
        Year = 2001
        Month = 1
        OnChange = DatumAWChange
        Align = alRight
        ButtonWidth = 17
        Color = clBtnShadow
        EnablePopup = True
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
      end
    end
    object SumPan: TPanel
      Left = 0
      Height = 24
      Top = 420
      Width = 682
      Align = alBottom
      BevelOuter = bvNone
      ClientHeight = 24
      ClientWidth = 682
      TabOrder = 3
      object Label1: TLabel
        Left = 450
        Height = 24
        Top = 0
        Width = 56
        Align = alRight
        Caption = '  Endsaldo  '
        Layout = tlCenter
        ParentColor = False
      end
      object Panel1: TPanel
        Left = 506
        Height = 24
        Top = 0
        Width = 176
        Align = alRight
        BevelOuter = bvLowered
        ClientHeight = 24
        ClientWidth = 176
        TabOrder = 0
        object EndDatum: TLabel
          Left = 1
          Height = 22
          Top = 1
          Width = 48
          Align = alLeft
          Caption = 'Enddatum'
          Layout = tlCenter
          ParentColor = False
        end
        object WaehrungLab1: TLabel
          Left = 152
          Height = 22
          Top = 1
          Width = 23
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = 'DM'
          Layout = tlCenter
          ParentColor = False
        end
        object EndSaldo: TLabel
          Left = 100
          Height = 22
          Top = 1
          Width = 52
          Align = alRight
          Caption = '  EndSaldo'
          Layout = tlCenter
          ParentColor = False
        end
      end
      object Panel2: TPanel
        Left = 274
        Height = 24
        Top = 0
        Width = 176
        Align = alRight
        BevelOuter = bvLowered
        ClientHeight = 24
        ClientWidth = 176
        TabOrder = 1
        object WaehrungLab2: TLabel
          Left = 152
          Height = 22
          Top = 1
          Width = 23
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = 'DM'
          Layout = tlCenter
          ParentColor = False
        end
        object StartSaldo: TLabel
          Left = 103
          Height = 22
          Top = 1
          Width = 49
          Align = alRight
          Caption = 'StartSaldo'
          Layout = tlCenter
          ParentColor = False
        end
        object StartDatum: TLabel
          Left = 1
          Height = 22
          Top = 1
          Width = 51
          Align = alLeft
          Caption = 'Startdatum'
          Layout = tlCenter
          ParentColor = False
        end
      end
      object Label3: TLabel
        Left = 215
        Height = 24
        Top = 0
        Width = 59
        Align = alRight
        Caption = '  Startsaldo  '
        Layout = tlCenter
        ParentColor = False
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 336
    Top = 184
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = '&Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = Suchen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Anfangsbestand1: TMenuItem
        Caption = 'Anfangsbestand'
        Enabled = False
        ImageIndex = 31
        OnClick = Anfangsbestand1Click
      end
      object ManuelleBuchung1: TMenuItem
        Caption = 'man. Buchung'
        ImageIndex = 12
        ShortCut = 16461
        OnClick = ManuelleBuchung1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = Storno1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      Enabled = False
      GroupIndex = 3
      object Belegnummer1: TMenuItem
        Tag = 1
        Caption = 'Belegnummer1'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
      end
      object Datum1: TMenuItem
        Tag = 2
        Caption = 'Datum'
        GroupIndex = 3
        RadioItem = True
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Name'
        GroupIndex = 3
        RadioItem = True
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Stadium'
        GroupIndex = 3
        RadioItem = True
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Preis'
        GroupIndex = 3
        RadioItem = True
      end
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
      object Kassenbuchdrucken1: TMenuItem
        Caption = 'Kassenbuch'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = Kassenbuchdrucken1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
  end
  object EndSaldoTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select sum(ZU_ABGANG) as SALDO, max(BDATUM) as DATUM'
      'from FIBU_KASSE'
      'where JAHR=:JAHR and BDATUM <= :BDAT'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end    
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    Left = 264
    Top = 232
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end    
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    object EndSaldoTabSALDO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SALDO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00'
    end
    object EndSaldoTabDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'DATUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
  end
  object FindDialog1: TFindDialog
    Options = [frDown, frHideWholeWord, frWholeWord]
    OnFind = FindDialog1Find
    Left = 336
    Top = 232
  end
  object KasBuch: TZQuery
    Connection = DM1.DB1
    AfterOpen = KasBuchAfterOpen
    OnCalcFields = KasBuchCalcFields
    AfterPost = KasBuchAfterOpen
    AfterDelete = KasBuchAfterOpen
    SQL.Strings = (
      'select * from FIBU_KASSE'
      'where JAHR=:JAHR and BDATUM >=:VDAT and BDATUM <=:BDAT'
      'order by BDATUM'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = '2002'
      end    
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end    
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37289d
      end>
    Left = 196
    Top = 184
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = '2002'
      end    
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end    
      item
        DataType = ftDate
        Name = 'BDAT'
        ParamType = ptInput
        Value = 37289d
      end>
    object KasBuchREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object KasBuchJAHR: TZIntegerField
      FieldKind = fkData
      FieldName = 'JAHR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object KasBuchBDATUM: TZDateField
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'BDATUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KasBuchQUELLE: TZIntegerField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KasBuchJOURNAL_ID: TZIntegerField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KasBuchZU_ABGANG: TZDoubleField
      DisplayLabel = 'Zu- / Abgang'
      DisplayWidth = 17
      FieldKind = fkData
      FieldName = 'ZU_ABGANG'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',###,##0.00;-,###,##0.00;-'
      EditFormat = '0.00'
    end
    object KasBuchBTXT: TZRawCLobField
      DisplayLabel = 'Buchungstext'
      DisplayWidth = 48
      FieldKind = fkData
      FieldName = 'BTXT'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object KasBuchBELEGNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'BELEGNUM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KasBuchGKONTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GKONTO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-;-'
    end
    object KasBuchSKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SKONTO'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%;-0.0%; '
      Precision = 5
    end
    object KasBuchQuelleStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'QuelleStr'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object StartSaldoTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select sum(ZU_ABGANG) as SALDO, min(BDATUM) as DATUM'
      'from FIBU_KASSE'
      'where JAHR=:JAHR and BDATUM < :VDAT'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end    
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    Left = 196
    Top = 232
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'JAHR'
        ParamType = ptInput
        Value = 2002
      end    
      item
        DataType = ftDate
        Name = 'VDAT'
        ParamType = ptInput
        Value = 37258d
      end>
    object StartSaldoTabSALDO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SALDO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00'
    end
    object StartSaldoTabDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'DATUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
  end
  object KasBuchDS: TDataSource
    DataSet = KasBuch
    Left = 264
    Top = 184
  end
end
