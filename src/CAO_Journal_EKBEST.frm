object JournalEKBestForm: TJournalEKBestForm
  Left = 430
  Height = 564
  Top = 256
  Width = 690
  Caption = 'Journal Einkauf Bestellung'
  ClientHeight = 544
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
    Height = 544
    Top = 0
    Width = 690
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 544
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
        Width = 189
        Align = alLeft
        Caption = '  EK-Bestellungen Journal   '
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object FilterLab: TLabel
        Left = 189
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
    end
    object ToolBar2: TToolBar
      Left = 0
      Height = 26
      Top = 518
      Width = 690
      Align = alBottom
      BorderWidth = 2
      Caption = 'ToolBar2'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
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
      object ToolButton: TToolButton
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
      object ToolButton1: TToolButton
        Left = 334
        Top = 0
        AutoSize = True
        Caption = 'InEinkaufwandeln1'
        ImageIndex = 14
        MenuItem = InEinkaufwandeln1
      end
      object PrintJournalBtn: TToolButton
        Left = 451
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object EKBestPrintBtn: TToolButton
        Left = 511
        Top = 0
        AutoSize = True
        Caption = 'Bestellung'
        ImageIndex = 11
        MenuItem = EKBestellungdrucken1
      end
    end
    object Panel1: TPanel
      Left = 0
      Height = 491
      Top = 27
      Width = 690
      Align = alClient
      BevelOuter = bvNone
      ClientHeight = 491
      ClientWidth = 690
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Height = 491
        Top = 0
        Width = 690
        Align = alClient
        BevelOuter = bvNone
        ClientHeight = 491
        ClientWidth = 690
        TabOrder = 0
        object ReInfoPC: TPageControl
          Left = 0
          Height = 139
          Top = 352
          Width = 690
          ActivePage = TabSheet1
          Align = alBottom
          MultiLine = True
          TabIndex = 1
          TabOrder = 0
          Visible = False
          OnChange = ReInfoPCChange
          Options = [nboMultiLine]
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
                  Width = 280
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
                  Title.Caption = 'Menge EK'
                  FieldName = 'MENGE_EK'
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
                  Title.Caption = 'Steuer'
                  Width = 40
                  FieldName = 'Steuer'
                end>
              DataSource = JoArtDS
              DefaultRowHeight = 32
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
          Top = 347
          Width = 690
          Align = alBottom
          ResizeAnchor = akBottom
        end
        object JourGrid: TDBGrid
          Left = 0
          Height = 347
          Top = 0
          Width = 690
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Alignment = taRightJustify
              Title.Caption = 'Beleg'
              Width = 43
              FieldName = 'VRENUM'
            end          
            item
              Title.Caption = 'Datum'
              Width = 42
              FieldName = 'RDATUM'
            end          
            item
              Title.Caption = 'Kundennr.'
              FieldName = 'KUN_NUM'
            end          
            item
              Title.Caption = 'Name des Lieferanten'
              Width = 192
              FieldName = 'KUN_NAME1'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
              Title.Caption = 'Netto'
              Width = 62
              FieldName = 'NSUMME'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'MSUMME_1'
              Visible = False
              FieldName = 'MSUMME_1'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'MwSt 2'
              Visible = False
              FieldName = 'MSUMME_2'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
              Title.Caption = 'MwSt'
              Width = 63
              FieldName = 'MSUMME'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
              Title.Caption = 'Brutto'
              Width = 74
              FieldName = 'BSUMME'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Währung'
              Width = 26
              FieldName = 'WAEHRUNG'
            end          
            item
              Alignment = taCenter
              Title.Alignment = taCenter
              Title.Caption = 'Stadium'
              Width = 111
              FieldName = 'CalcStad'
            end          
            item
              Title.Caption = 'Konditionen'
              Width = 110
              FieldName = 'Kondit'
            end          
            item
              Title.Caption = 'Projekt'
              Width = 244
              FieldName = 'PROJEKT'
            end          
            item
              Title.Caption = 'Ref.-Nummer'
              Width = 108
              FieldName = 'ORGNUM'
            end          
            item
              Title.Caption = 'Lieferdatum'
              FieldName = 'LTERMIN'
            end          
            item
              Title.Caption = 'erstellt von'
              Visible = False
              FieldName = 'ERST_NAME'
            end>
          DataSource = JourDS
          DefaultRowHeight = 16
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu1
          ReadOnly = True
          Scrollbars = ssAutoBoth
          ShowHint = True
          TabOrder = 1
          OnDrawColumnCell = JourGridDrawColumnCell
          OnKeyDown = JourGridKeyDown
        end
      end
    end
  end
  object JourDS: TDataSource
    DataSet = JQuery
    OnDataChange = JourDSDataChange
    Left = 134
    Top = 152
  end
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 294
    Top = 151
  end
  object JQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = JQueryAfterScroll
    AfterScroll = JQueryAfterScroll
    OnCalcFields = JQueryCalcFields
    SQL.Strings = (
      'SELECT'
      'REC_ID,ADDR_ID,VRENUM,RDATUM,'
      'NSUMME,MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME,BSUMME,STADIUM,KUN_NUM,'
      'KUN_NAME1,PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG,'
      'LDATUM AS LTERMIN, ATRNUM as KUNLIEF_ID, '
      'SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,'
      'MWST_1, MWST_2, MWST_3, ERST_NAME'
      ''
      'FROM JOURNAL'
      ''
      'WHERE RDATUM >=:VON AND RDATUM<=:BIS'
      'AND QUELLE=3'
      ''
      'ORDER BY RDATUM'
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
    Left = 60
    Top = 156
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
    object JQueryVRENUM: TZIntegerField
      DisplayLabel = 'Beleg'
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryRDATUM: TZDateField
      DisplayLabel = 'Beleg'
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JQueryMWST_1: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%'
    end
    object JQueryMWST_2: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%'
    end
    object JQueryMWST_3: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%'
    end
    object JQueryNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 7
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
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_0: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_1: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_2: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_3: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 12
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
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryKUN_NUM: TZRawStringField
      DisplayLabel = 'Kundennr.'
      FieldKind = fkData
      FieldName = 'KUN_NUM'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKUN_NAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryORGNUM: TZRawStringField
      DisplayLabel = 'Org.-Nummer'
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKondit: TStringField
      DisplayLabel = 'Konditionen'
      FieldKind = fkCalculated
      FieldName = 'Kondit'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryWAEHRUNG: TZRawStringField
      DisplayLabel = 'Währung'
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object JQueryPROJEKT: TZRawStringField
      DisplayLabel = 'Projekt'
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
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
    object JQuerySTADIUM: TZShortIntField
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryLTERMIN: TZDateField
      DisplayLabel = 'Lieferdatum'
      FieldKind = fkData
      FieldName = 'LTERMIN'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JQueryKUNLIEF_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUNLIEF_ID'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JQueryCalcStad: TStringField
      DisplayLabel = 'Stadium'
      FieldKind = fkCalculated
      FieldName = 'CalcStad'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryERST_NAME: TZRawStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object JoArtTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JoArtTabCalcFields
    SQL.Strings = (
      'select '
      'JP1.REC_ID, JP1.JOURNAL_ID, JP1.ARTIKELTYP, JP1.ARTIKEL_ID, JP1.ATRNUM, '
      'JP1.VRENUM, JP1.VLSNUM, JP1.POSITION, JP1.BEZEICHNUNG, JP1.MATCHCODE, '
      'JP1.ARTNUM, JP1.BARCODE, JP1.MENGE, JP1.ME_EINHEIT, JP1.PR_EINHEIT, JP1.EPREIS, '
      'JP1.RABATT, JP1.STEUER_CODE, SUM(JP2.MENGE) as MENGE_EK,'
      'JP1.MENGE * JP1.EPREIS * (100-JP1.RABATT) / 100 AS G_PREIS'
      'from JOURNALPOS JP1'
      'left outer join JOURNALPOS JP2 on JP2.QUELLE_SRC=JP1.REC_ID and (JP2.QUELLE=5 or JP2.QUELLE=15)'
      'where JP1.JOURNAL_ID=:ID '
      'group by JP1.REC_ID'
      'order by POSITION'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 8532
      end>
    Left = 218
    Top = 156
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 8532
      end>
    object JoArtTabREC_ID: TZIntegerField
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabJOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabARTIKELTYP: TZRawStringField
      Alignment = taCenter
      DisplayLabel = 'T'
      DisplayWidth = 4
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 1
    end
    object JoArtTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabATRNUM: TZIntegerField
      DisplayLabel = 'Art.-Nr.'
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabVLSNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabPOSITION: TZIntegerField
      DisplayLabel = 'Pos.'
      DisplayWidth = 6
      FieldKind = fkData
      FieldName = 'POSITION'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '000'
    end
    object JoArtTabARTNUM: TZRawStringField
      DisplayLabel = 'Artikelnummer'
      DisplayWidth = 13
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
      Visible = False
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
      Transliterate = False
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
    object JoArtTabMENGE_EK: TFloatField
      DisplayLabel = 'Menge EK'
      FieldKind = fkData
      FieldName = 'MENGE_EK'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;,#0.00;- '
    end
    object JoArtTabMATCHCODE: TZRawStringField
      DisplayLabel = 'Match'
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 13
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
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 10
    end
    object JoArtTabPR_EINHEIT: TFloatField
      DisplayLabel = 'PE'
      DisplayWidth = 13
      FieldKind = fkData
      FieldName = 'PR_EINHEIT'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;,###,##0.00; '
    end
    object JoArtTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0"%";,###,##0.0"%"; '
    end
    object JoArtTabG_PREIS: TFloatField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'G_PREIS'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;,###,##0.00; '
    end
    object JoArtTabSTEUER_CODE: TZSmallIntField
      DisplayWidth = 16
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JoArtTabSteuer: TStringField
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'Steuer'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 6
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 361
    Top = 155
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
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
      end
      object InEinkaufwandeln1: TMenuItem
        Caption = 'InEinkaufwandeln1'
        ImageIndex = 14
        ShortCut = 16466
        OnClick = InEinkaufwandeln1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        OnClick = StornoBtn1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layoutspeichern1'
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
      object EKBestellungdrucken1: TMenuItem
        Caption = 'Bestellung'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = EKBestPrintBtn1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Filter1: TMenuItem
        Caption = 'Filter'
        ImageIndex = 10
        object AlleBestellungen1: TMenuItem
          Caption = 'alle Bestellungen'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = FilterClick
        end
        object nuroffeneBestellungen1: TMenuItem
          Tag = 1
          Caption = 'nur offene Bestellungen'
          GroupIndex = 1
          RadioItem = True
          OnClick = FilterClick
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
  object PopupMenu1: TPopupMenu
    Left = 437
    Top = 153
    object Stadiumndern1: TMenuItem
      Caption = 'Stadiumndern1'
      object offen1: TMenuItem
        Tag = 1
        Caption = 'offen'
        OnClick = vollgeliefert1Click
      end
      object teillieferung1: TMenuItem
        Tag = 2
        Caption = 'Teillieferung'
        OnClick = vollgeliefert1Click
      end
      object vollgeliefert1: TMenuItem
        Tag = 3
        Caption = 'voll geliefert'
        OnClick = vollgeliefert1Click
      end
    end
  end
end
