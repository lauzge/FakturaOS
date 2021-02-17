object JournalVKLiefForm: TJournalVKLiefForm
  Left = 430
  Height = 390
  Top = 256
  Width = 690
  Caption = 'Journal Verkauf Lieferschein'
  ClientHeight = 370
  ClientWidth = 690
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
  object JournalPanel: TPanel
    Left = 0
    Height = 370
    Top = 0
    Width = 690
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 370
    ClientWidth = 690
    TabOrder = 0
    object ArtPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 690
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 686
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      OnResize = ArtPanResize
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 151
        Align = alLeft
        Caption = '  Lieferscheinjournal   '
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
        Left = 550
        Height = 23
        Hint = 'mit rechtem Mausklick Zeitraum auswählen ...'
        Top = 0
        Width = 136
        KindRange = ksMonth
        Year = 2001
        Month = 1
        OnChange = JahrCBChange
        Align = alRight
        ButtonWidth = 17
        Color = clBtnShadow
        EnablePopup = True
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
      end
      object FilterLab: TLabel
        Left = 151
        Height = 23
        Top = 0
        Width = 1
        Align = alLeft
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Height = 22
      Top = 348
      Width = 690
      Align = alBottom
      AutoSize = True
      BorderWidth = 2
      Caption = 'ToolBar2'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 1
        Height = 22
        Top = 0
        Width = 155
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 22
        ClientWidth = 155
        DataSource = JourDS
        Flat = True
        Options = []
        TabOrder = 0
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      end
      object ViewPosBtn: TToolButton
        Left = 156
        Top = 0
        AutoSize = True
        Caption = 'Details'
        ImageIndex = 5
        MenuItem = Positionen1
      end
      object ToolButton2: TToolButton
        Left = 214
        Top = 0
        AutoSize = True
        Caption = 'Suchen'
        ImageIndex = 10
        MenuItem = Suchen1
      end
      object StornoBtn: TToolButton
        Left = 277
        Top = 0
        AutoSize = True
        Caption = 'Storno'
        ImageIndex = 6
        MenuItem = Storno1
      end
      object PrintJournalBtn: TToolButton
        Left = 334
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object RePrintBtn: TToolButton
        Left = 394
        Top = 0
        AutoSize = True
        Caption = 'Lieferschein'
        ImageIndex = 11
        MenuItem = Lieferscheindrucken1
      end
    end
    object Panel1: TPanel
      Left = 0
      Height = 321
      Top = 27
      Width = 690
      Align = alClient
      BevelOuter = bvNone
      ClientHeight = 321
      ClientWidth = 690
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Height = 321
        Top = 0
        Width = 690
        Align = alClient
        BevelOuter = bvNone
        ClientHeight = 321
        ClientWidth = 690
        TabOrder = 0
        object ReInfoPC: TPageControl
          Left = 0
          Height = 139
          Top = 182
          Width = 690
          ActivePage = TabSheet1
          Align = alBottom
          TabIndex = 1
          TabOrder = 0
          OnChange = ReInfoPCChange
          object Allgemein: TTabSheet
            Caption = 'Allgemein'
          end
          object TabSheet1: TTabSheet
            Caption = 'Positionen'
            ClientHeight = 113
            ClientWidth = 682
            object JourPosGrid: TDBGrid
              Left = 0
              Height = 113
              Top = 0
              Width = 682
              Align = alClient
              Color = clWindow
              Columns = <              
                item
                  Alignment = taCenter
                  Title.Caption = 'Pos.'
                  Width = 27
                  FieldName = 'POSITION'
                end              
                item
                  Alignment = taCenter
                  Title.Caption = 'T'
                  Width = 13
                  FieldName = 'ARTIKELTYP'
                end              
                item
                  Title.Caption = 'Artikelnummer'
                  Width = 82
                  FieldName = 'ATRNUM'
                end              
                item
                  Title.Caption = 'BARCODE'
                  Visible = False
                  FieldName = 'BARCODE'
                end              
                item
                  Title.Caption = 'Match'
                  Visible = False
                  FieldName = 'MATCHCODE'
                end              
                item
                  Title.Caption = 'Artikelbezeichnung'
                  Width = 345
                  FieldName = 'BEZEICHNUNG'
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Menge'
                  Width = 48
                  FieldName = 'MENGE'
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taRightJustify
                  Title.Caption = 'E-Preis'
                  Width = 67
                  FieldName = 'EPREIS'
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Rabatt'
                  Width = 40
                  FieldName = 'RABATT'
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taRightJustify
                  Title.Caption = 'G-Preis'
                  Width = 66
                  FieldName = 'G_PREIS'
                end              
                item
                  Title.Alignment = taRightJustify
                  Title.Caption = 'MwSt'
                  Width = 40
                  FieldName = 'Steuer'
                end>
              DataSource = JoArtDS
              DefaultRowHeight = 28
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
            end
          end
          object DateiTS: TTabSheet
            Caption = 'Dateien'
            ClientHeight = 113
            ClientWidth = 682
            object DateiPan: TPanel
              Left = 0
              Height = 113
              Top = 0
              Width = 682
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
            end
          end
        end
        object Splitter1: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 177
          Width = 690
          Align = alBottom
          ResizeAnchor = akBottom
        end
        object JourGrid: TDBGrid
          Left = 0
          Height = 177
          Top = 0
          Width = 690
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Alignment = taRightJustify
              Title.Caption = 'Beleg'
              Width = 46
              FieldName = 'VLSNUM'
            end          
            item
              Title.Caption = 'Datum'
              Width = 58
              FieldName = 'LDATUM'
            end          
            item
              Title.Caption = 'Kundennr.'
              Visible = False
              FieldName = 'KUN_NUM'
            end          
            item
              Title.Caption = 'Name des Kunden'
              Width = 195
              FieldName = 'CALC_NAME'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
              Title.Caption = 'Warenwert'
              Width = 62
              FieldName = 'WERT_NETTO'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
              Title.Caption = 'T-Kosten'
              Width = 67
              FieldName = 'KOST_NETTO'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Währung'
              Width = 24
              FieldName = 'WAEHRUNG'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = ' '
              Width = 16
              FieldName = 'STADIUM'
            end          
            item
              Title.Alignment = taCenter
              Title.Caption = 'Stadium'
              Width = 128
              FieldName = 'CalcStad'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Re.-Nr-'
              Width = 48
              FieldName = 'VRENUM'
            end          
            item
              Title.Caption = 'Re.-Datum'
              Width = 85
              FieldName = 'RDatum'
            end          
            item
              Title.Caption = 'Projekt'
              Width = 118
              FieldName = 'Projekt'
            end          
            item
              Title.Caption = 'Org.-Num.'
              Width = 87
              FieldName = 'OrgNum'
            end          
            item
              Title.Caption = 'erstellt von'
              Visible = False
              FieldName = 'ERST_NAME'
            end>
          DataSource = JourDS
          DefaultRowHeight = 16
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          Scrollbars = ssAutoBoth
          TabOrder = 2
          OnDrawColumnCell = JourGridDrawColumnCell
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 595
    Top = 124
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = SuchenBtn1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Kopieren1: TMenuItem
        Caption = 'Kopieren'
        Enabled = False
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = StornoBtn1Click
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
        Caption = 'Layout speichern'
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object Belegnummer1: TMenuItem
        Tag = 1
        Caption = 'Belegnummer'
        Checked = True
        Default = True
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Datum1: TMenuItem
        Tag = 2
        Caption = 'Datum'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Name'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Stadium'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Preis'
        GroupIndex = 5
        RadioItem = True
        OnClick = Preis1Click
      end
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
      object Journaldrucken1: TMenuItem
        Caption = 'Journal'
        ImageIndex = 8
        ShortCut = 16452
        OnClick = PrintJournalBtn1Click
      end
      object Lieferscheindrucken1: TMenuItem
        Caption = 'Lieferschein'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = RePrintBtn1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Filter1: TMenuItem
        Caption = 'Filter'
        ImageIndex = 10
        object alleLieferscheine1: TMenuItem
          Caption = 'alle Lieferscheine'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = SetFilterClick
        end
        object nurungedruckteLieferschein1: TMenuItem
          Tag = 1
          Caption = 'nur ungedruckte Lieferschein'
          GroupIndex = 1
          RadioItem = True
          OnClick = SetFilterClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Positionen1: TMenuItem
        Caption = 'Details'
        ImageIndex = 5
        ShortCut = 117
        OnClick = Positionen1Click
      end
      object N4: TMenuItem
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
  object JQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = JQueryAfterScroll
    AfterScroll = JQueryAfterScroll
    OnCalcFields = JQueryCalcFields
    SQL.Strings = (
      'SELECT'
      'REC_ID,ADDR_ID,VLSNUM,LDATUM,'
      'NSUMME,MSUMME,BSUMME,STADIUM,KUN_NUM,'
      'KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,'
      'WAEHRUNG,KOST_NETTO, WERT_NETTO,'
      'RDATUM AS RDATUM_ORG,VRENUM,'
      'SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,'
      'MWST_1, MWST_2, MWST_3, Projekt, OrgNum, ERST_NAME, PRINT_FLAG'
      ''
      'FROM JOURNAL'
      ''
      'WHERE LDATUM >=:VON AND LDATUM<=:BIS'
      'AND QUELLE=2'
      ''
      'ORDER BY LDATUM'
    )
    Params = <    
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = '1.1.2001'
      end    
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = '1.3.2001'
      end>
    Left = 106
    Top = 112
    ParamData = <    
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = '1.1.2001'
      end    
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = '1.3.2001'
      end>
    object JQueryREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryVLSNUM: TZIntegerField
      DisplayLabel = 'Beleg'
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryLDATUM: TZDateField
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'LDATUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JQueryNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQuerySTADIUM: TZSmallIntField
      DisplayLabel = 'S'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKUN_NUM: TZRawStringField
      DisplayLabel = 'Kundennr.'
      FieldKind = fkData
      FieldName = 'KUN_NUM'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKUN_NAME1: TZRawStringField
      DisplayLabel = 'Name des Kunden'
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryCalcStad: TStringField
      DisplayLabel = 'Stadium'
      FieldKind = fkCalculated
      FieldName = 'CalcStad'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object JQueryWAEHRUNG: TZRawStringField
      DisplayLabel = 'Währung'
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object JQueryMWST_1: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryMWST_2: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryMWST_3: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryVRENUM: TZIntegerField
      DisplayLabel = 'Re.-Nr-'
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0; ; '
    end
    object JQueryRDATUM_ORG: TZDateField
      FieldKind = fkData
      FieldName = 'RDATUM_ORG'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object JQueryRDatum: TStringField
      DisplayLabel = 'Re.-Datum'
      FieldKind = fkCalculated
      FieldName = 'RDatum'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object JQueryKOST_NETTO: TFloatField
      DisplayLabel = 'T-Kosten'
      FieldKind = fkData
      FieldName = 'KOST_NETTO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryWERT_NETTO: TFloatField
      DisplayLabel = 'Warenwert'
      FieldKind = fkData
      FieldName = 'WERT_NETTO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQuerySOLL_SKONTO: TFloatField
      FieldKind = fkData
      FieldName = 'SOLL_SKONTO'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySOLL_STAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_STAGE'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySOLL_NTAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryProjekt: TZRawStringField
      FieldKind = fkData
      FieldName = 'Projekt'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryOrgNum: TZRawStringField
      FieldKind = fkData
      FieldName = 'OrgNum'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryERST_NAME: TZRawStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryCALC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object JQueryKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME3'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryPRINT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'PRINT_FLAG'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
  end
  object JoArtTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JoArtTabCalcFields
    SQL.Strings = (
      'select '
      'REC_ID, JOURNAL_ID, ARTIKELTYP, ARTIKEL_ID, ATRNUM, '
      'VRENUM, VLSNUM, POSITION, BEZEICHNUNG, MATCHCODE, '
      'ARTNUM, BARCODE, MENGE, ME_EINHEIT, PR_EINHEIT, EPREIS, '
      'RABATT, STEUER_CODE,'
      ''
      'MENGE * EPREIS * (100-RABATT) / 100 AS G_PREIS'
      ''
      'from JOURNALPOS'
      'where JOURNAL_ID=:ID'
      'order by POSITION'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 8532
      end>
    Left = 264
    Top = 112
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 8532
      end>
    object JoArtTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JoArtTabJOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JoArtTabARTIKELTYP: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object JoArtTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JoArtTabATRNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JoArtTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JoArtTabVLSNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JoArtTabPOSITION: TZIntegerField
      FieldKind = fkData
      FieldName = 'POSITION'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JoArtTabARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JoArtTabBARCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JoArtTabBEZEICHNUNG: TMemoField
      DisplayLabel = 'Bezeichnung'
      DisplayWidth = 61
      FieldKind = fkData
      FieldName = 'BEZEICHNUNG'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
    end
    object JoArtTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0;,###,##0.0; '
    end
    object JoArtTabMATCHCODE: TZRawStringField
      DisplayLabel = 'Match'
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabME_EINHEIT: TZRawStringField
      DisplayLabel = 'ME'
      DisplayWidth = 13
      FieldKind = fkData
      FieldName = 'ME_EINHEIT'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 10
    end
    object JoArtTabPR_EINHEIT: TFloatField
      FieldKind = fkData
      FieldName = 'PR_EINHEIT'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JoArtTabEPREIS: TFloatField
      CustomConstraint = ',#0.00'
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JoArtTabRABATT: TFloatField
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,0.0"%"'
    end
    object JoArtTabSTEUER_CODE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JoArtTabG_PREIS: TFloatField
      CustomConstraint = ',#0.00'
      FieldKind = fkData
      FieldName = 'G_PREIS'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JoArtTabSteuer: TStringField
      FieldKind = fkCalculated
      FieldName = 'Steuer'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
  end
  object JourDS: TDataSource
    DataSet = JQuery
    OnDataChange = JourDSDataChange
    Left = 160
    Top = 112
  end
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 336
    Top = 112
  end
end
