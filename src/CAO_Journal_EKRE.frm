object JournalEKREForm: TJournalEKREForm
  Left = 387
  Height = 564
  Top = 256
  Width = 690
  Caption = 'JournalEKREForm'
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
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnResize = ArtPanResize
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 126
        Align = alLeft
        Caption = '  Einkaufsjournal   '
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
        Left = 126
        Height = 23
        Top = 0
        Width = 1
        Align = alLeft
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
    end
    object Panel1: TPanel
      Left = 0
      Height = 495
      Top = 27
      Width = 690
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      ClientHeight = 495
      ClientWidth = 690
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Height = 417
        Top = 0
        Width = 690
        Align = alClient
        BevelOuter = bvNone
        ClientHeight = 417
        ClientWidth = 690
        TabOrder = 0
        object JourGrid: TDBGrid
          Left = 0
          Height = 273
          Top = 0
          Width = 690
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Beleg'
              Width = 43
              FieldName = 'VRENUM'
            end          
            item
              Title.Caption = 'Datum'
              Width = 58
              FieldName = 'RDATUM'
            end          
            item
              Title.Caption = 'Kundennr.'
              Visible = False
              FieldName = 'KUN_NUM'
            end          
            item
              Title.Caption = 'Name des Lieferanten'
              Width = 192
              FieldName = 'CALC_NAME'
            end          
            item
              Title.Caption = 'Netto'
              Width = 62
              FieldName = 'NSUMME'
            end          
            item
              Title.Caption = 'MwSt 1'
              Visible = False
              FieldName = 'MSUMME_1'
            end          
            item
              Title.Caption = 'MwSt 2'
              Visible = False
              FieldName = 'MSUMME_2'
            end          
            item
              Title.Caption = 'MwSt'
              Width = 63
              FieldName = 'MSUMME'
            end          
            item
              Title.Caption = 'Brutto'
              Width = 74
              FieldName = 'BSUMME'
            end          
            item
              Title.Caption = 'Währung'
              Width = 26
              FieldName = 'WAEHRUNG'
            end          
            item
              Title.Caption = 'S'
              Width = 15
              FieldName = 'STADIUM'
            end          
            item
              Title.Caption = 'Stadium'
              Width = 118
              FieldName = 'CalcStad'
            end          
            item
              Title.Caption = 'Konditionen'
              Width = 110
              FieldName = 'Kondit'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
              Title.Caption = 'Skonto'
              Width = 39
              FieldName = 'IST_SKONTO'
            end          
            item
              Alignment = taCenter
              Title.Alignment = taCenter
              Title.Caption = 'Z-Eingang'
              Width = 69
              FieldName = 'IST_ZAHLDAT'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
              Title.Caption = 'gezahlt'
              Width = 68
              FieldName = 'IST_BETRAG'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'G-Konto'
              Width = 45
              FieldName = 'GEGENKONTO'
            end          
            item
              Title.Caption = 'Mahndatum'
              Visible = False
              FieldName = 'MAHNDATUM'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'MS'
              Visible = False
              FieldName = 'MAHNSTUFE'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Mahnkost.'
              Width = 54
              FieldName = 'MAHNKOSTEN'
            end          
            item
              Title.Caption = 'Projekt'
              Width = 119
              FieldName = 'PROJEKT'
            end          
            item
              Title.Caption = 'ER-Nummer'
              Width = 108
              FieldName = 'ORGNUM'
            end          
            item
              Title.Caption = 'erstellt von'
              Visible = False
              FieldName = 'ERST_NAME'
            end>
          DataSource = JourDS
          DefaultRowHeight = 16
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          OnDrawColumnCell = JourGridDrawColumnCell
          OnKeyDown = JourGridKeyDown
        end
        object ReInfoPC: TPageControl
          Left = 0
          Height = 139
          Top = 278
          Width = 690
          ActivePage = Allgemein
          Align = alBottom
          MultiLine = True
          TabIndex = 0
          TabOrder = 1
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
            ImageIndex = 2
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
                  Width = 322
                  FieldName = 'BEZEICHNUNG'
                end              
                item
                  Title.Caption = 'Menge'
                  Width = 48
                  FieldName = 'MENGE'
                end              
                item
                  Title.Caption = 'E-Preis'
                  Width = 67
                  FieldName = 'EPREIS'
                end              
                item
                  Title.Caption = 'Rabatt'
                  Width = 40
                  FieldName = 'RABATT'
                end              
                item
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
            ImageIndex = 2
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
          Top = 273
          Width = 690
          Align = alBottom
          ResizeAnchor = akBottom
        end
      end
      object SumPan: TPanel
        Left = 0
        Height = 78
        Top = 417
        Width = 690
        Align = alBottom
        BevelOuter = bvNone
        ClientHeight = 78
        ClientWidth = 690
        TabOrder = 1
        Visible = False
        object B_BEZ_PAN: TPanel
          Left = 400
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 0
        end
        object B_BEZSKONTO_PAN: TPanel
          Left = 400
          Height = 18
          Top = 36
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 1
        end
        object B_OFF_PAN: TPanel
          Left = 400
          Height = 18
          Top = 16
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 2
        end
        object B_SUM_PAN: TPanel
          Left = 570
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 3
        end
        object Label10: TLabel
          Left = 538
          Height = 13
          Top = 18
          Width = 26
          Caption = 'Netto'
          ParentColor = False
        end
        object Label11: TLabel
          Left = 537
          Height = 13
          Top = 38
          Width = 27
          Caption = 'MwSt'
          ParentColor = False
        end
        object Label12: TLabel
          Left = 536
          Height = 13
          Top = 58
          Width = 28
          Caption = 'Brutto'
          ParentColor = False
        end
        object Label3: TLabel
          Left = 16
          Height = 13
          Top = 18
          Width = 26
          Caption = 'Offen'
          ParentColor = False
        end
        object Label4: TLabel
          Left = 16
          Height = 13
          Top = 38
          Width = 85
          Caption = 'Bezahl mit Skonto'
          ParentColor = False
        end
        object Label5: TLabel
          Left = 16
          Height = 13
          Top = 58
          Width = 66
          Caption = 'Bezahlt Brutto'
          ParentColor = False
        end
        object Label6: TLabel
          Left = 226
          Height = 13
          Top = 0
          Width = 26
          Alignment = taRightJustify
          Caption = 'Netto'
          ParentColor = False
        end
        object Label7: TLabel
          Left = 353
          Height = 13
          Top = 0
          Width = 27
          Alignment = taRightJustify
          Caption = 'MwSt'
          ParentColor = False
        end
        object Label8: TLabel
          Left = 480
          Height = 13
          Top = 0
          Width = 28
          Alignment = taRightJustify
          Caption = 'Brutto'
          ParentColor = False
        end
        object Label9: TLabel
          Left = 648
          Height = 13
          Top = 0
          Width = 36
          Alignment = taRightJustify
          Caption = 'Gesamt'
          ParentColor = False
        end
        object M_BEZ_PAN: TPanel
          Left = 272
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 4
        end
        object M_BEZSKONTO_PAN: TPanel
          Left = 272
          Height = 18
          Top = 36
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 5
        end
        object M_OFF_PAN: TPanel
          Left = 272
          Height = 18
          Top = 16
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 6
        end
        object M_SUM_PAN: TPanel
          Left = 570
          Height = 18
          Top = 36
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 7
        end
        object N_BEZ_PAN: TPanel
          Left = 144
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 8
        end
        object N_BEZSKONTO_PAN: TPanel
          Left = 144
          Height = 18
          Top = 36
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 9
        end
        object N_OFF_PAN: TPanel
          Left = 144
          Height = 18
          Top = 16
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 10
        end
        object N_SUM_PAN: TPanel
          Left = 570
          Height = 18
          Top = 16
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 11
        end
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Height = 22
      Top = 522
      Width = 690
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 22
      ButtonWidth = 68
      Caption = 'ToolBar1'
      DisabledImages = MainForm.ImageList1
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.ImageList1
      Indent = 0
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 1
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 0
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
        Left = 155
        Top = 0
        AutoSize = True
        Caption = 'Details'
        ImageIndex = 5
        MenuItem = Positionen1
        OnClick = Positionen1Click
        Style = tbsCheck
      end
      object ViewSumBtn: TToolButton
        Left = 223
        Top = 0
        AutoSize = True
        Caption = 'Summen'
        ImageIndex = 7
        MenuItem = Summen1
        OnClick = ViewSumBtn1Click
        Style = tbsCheck
      end
      object ToolButton2: TToolButton
        Left = 291
        Top = 0
        AutoSize = True
        Caption = 'Suchen'
        ImageIndex = 10
        MenuItem = Suchen1
        OnClick = SuchenBtn1Click
      end
      object StornoBtn: TToolButton
        Left = 359
        Top = 0
        AutoSize = True
        Caption = 'Storno'
        ImageIndex = 6
        MenuItem = Storno1
        OnClick = StornoBtn1Click
      end
      object ZEBtn: TToolButton
        Left = 427
        Top = 0
        AutoSize = True
        Caption = 'Zahlung'
        ImageIndex = 12
        MenuItem = Zahlungseingang1
        OnClick = Zahlungseingang1Click
      end
      object PrintJournalBtn: TToolButton
        Left = 495
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
        OnClick = PrintJournalBtn1Click
      end
    end
  end
  object JoArtTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JoArtTabCalcFields
    SQL.Strings = (
      'select '
      'REC_ID, QUELLE, JOURNAL_ID, ARTIKELTYP, ARTIKEL_ID, ATRNUM, '
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
    Left = 208
    Top = 174
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
    object JoArtTabBEZEICHNUNG: TZRawCLobField
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
    object JoArtTabMENGE: TZDoubleField
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
    object JoArtTabPR_EINHEIT: TZDoubleField
      DisplayLabel = 'PE'
      DisplayWidth = 13
      FieldKind = fkData
      FieldName = 'PR_EINHEIT'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Precision = 10
    end
    object JoArtTabEPREIS: TZDoubleField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;,###,##0.00; '
    end
    object JoArtTabRABATT: TZDoubleField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0"%";,###,##0.0"%"; '
    end
    object JoArtTabG_PREIS: TZDoubleField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'G_PREIS'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;,###,##0.00; '
    end
    object JoArtTabSTEUER_CODE: TZShortIntField
      DisplayWidth = 16
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 18
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
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 6
    end
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
      'KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,'
      'PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG, MAHNSTUFE, MAHNDATUM,'
      'LDATUM AS LDATUM_ORG,ADATUM,ATRNUM,VLSNUM,KM_STAND,'
      'IST_SKONTO,IST_BETRAG,IST_ZAHLDAT AS IST_ZAHLDAT_ORG,'
      'MAHNKOSTEN, SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,'
      'MWST_1, MWST_2, MWST_3, ERST_NAME'
      'FROM JOURNAL'
      'WHERE RDATUM >=:VON AND RDATUM<=:BIS'
      'AND QUELLE=3'
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
    Left = 102
    Top = 174
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
      Required = True
    end
    object JQueryRDATUM: TZDateField
      DisplayLabel = 'Datum'
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
    object JQueryMWST_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%'
    end
    object JQueryMWST_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%'
    end
    object JQueryMWST_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%'
    end
    object JQueryNSUMME: TZDoubleField
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
    object JQueryMSUMME: TZDoubleField
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
    object JQueryMSUMME_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryBSUMME: TZDoubleField
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
    object JQuerySTADIUM: TZSmallIntField
      DisplayLabel = 'S'
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKUN_NUM: TZRawStringField
      DisplayLabel = 'Kundennr.'
      FieldKind = fkData
      FieldName = 'KUN_NUM'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKUN_NAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 16
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
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKondit: TStringField
      DisplayLabel = 'Konditionen'
      FieldKind = fkCalculated
      FieldName = 'Kondit'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryCalcStad: TStringField
      DisplayLabel = 'Stadium'
      FieldKind = fkCalculated
      FieldName = 'CalcStad'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 32
    end
    object JQueryGEGENKONTO: TZIntegerField
      DisplayLabel = 'Gegenkonto'
      FieldKind = fkData
      FieldName = 'GEGENKONTO'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;0;-'
    end
    object JQueryWAEHRUNG: TZRawStringField
      DisplayLabel = 'Währung'
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object JQueryLDATUM: TDateField
      DisplayLabel = 'Lie.-Datum'
      FieldKind = fkCalculated
      FieldName = 'LDATUM'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JQueryIST_ZAHLDAT: TDateField
      DisplayLabel = 'Zahlungseingang'
      FieldKind = fkCalculated
      FieldName = 'IST_ZAHLDAT'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryLDATUM_ORG: TZDateField
      FieldKind = fkData
      FieldName = 'LDATUM_ORG'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object JQueryKM_STAND: TZIntegerField
      DisplayLabel = 'KM-Stand'
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-'
    end
    object JQueryADATUM: TZDateField
      DisplayLabel = 'Auftr.Datum'
      FieldKind = fkData
      FieldName = 'ADATUM'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object JQueryATRNUM: TZIntegerField
      DisplayLabel = 'Auftrag'
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;"-"'
    end
    object JQueryPROJEKT: TZRawStringField
      DisplayLabel = 'Projekt'
      DisplayWidth = 40
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryMAHNKOSTEN: TZDoubleField
      DisplayLabel = 'Mahnkosten'
      FieldKind = fkData
      FieldName = 'MAHNKOSTEN'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',##,##0.00'
    end
    object JQueryIST_BETRAG: TZDoubleField
      DisplayLabel = 'gezahlt'
      FieldKind = fkData
      FieldName = 'IST_BETRAG'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;-,#0.00; '
    end
    object JQueryIST_SKONTO: TZDoubleField
      DisplayLabel = 'Skonto'
      FieldKind = fkData
      FieldName = 'IST_SKONTO'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0 "%"; ; '
    end
    object JQueryIST_ZAHLDAT_ORG: TZDateField
      FieldKind = fkData
      FieldName = 'IST_ZAHLDAT_ORG'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object JQuerySOLL_SKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_SKONTO'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySOLL_STAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_STAGE'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySOLL_NTAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryVLSNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;"-"'
    end
    object JQueryMAHNSTUFE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'MAHNSTUFE'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryMAHNDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'MAHNDATUM'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JQueryERST_NAME: TZRawStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME3'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryCALC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 328
    Top = 174
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = SuchenBtn1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Kopieren1: TMenuItem
        Caption = 'Kopieren'
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
      end
      object inRechnungumwandeln1: TMenuItem
        Caption = 'VK-Rechnung erzeugen'
        ImageIndex = 14
        OnClick = inRechnungumwandeln1Click
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
      object Zahlungseingang1: TMenuItem
        Caption = 'Zahlung'
        ImageIndex = 12
        ShortCut = 16474
        OnClick = Zahlungseingang1Click
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
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Filter1: TMenuItem
        Caption = 'Filter'
        ImageIndex = 10
        object nurbezahlteRechnungen1: TMenuItem
          Tag = 1
          Caption = 'nur bezahlte Rechnungen'
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
        object nurunbezahlteRechnungen1: TMenuItem
          Tag = 2
          Caption = 'nur unbezahlte Rechnungen'
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
        object alleRechnungen1: TMenuItem
          Tag = 3
          Caption = 'alle Rechnungen'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuFilterClick
        end
      end
      object N4: TMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object Positionen1: TMenuItem
        Caption = 'Details'
        GroupIndex = 2
        ImageIndex = 5
        ShortCut = 117
        OnClick = Positionen1Click
      end
      object Summen1: TMenuItem
        Caption = 'Summen'
        GroupIndex = 3
        ImageIndex = 7
        ShortCut = 118
        OnClick = ViewSumBtn1Click
      end
      object N5: TMenuItem
        Caption = '-'
        GroupIndex = 3
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 4
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = SumQueryAfterOpen
    SQL.Strings = (
      'SELECT STADIUM, SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'FROM JOURNAL'
      'WHERE RDATUM>=:VDAT AND RDATUM <= :BDAT AND QUELLE= :QUELLE and QUELLE_SUB<>2'
      'group by STADIUM, WAEHRUNG'
    )
    Params = <    
      item
        DataType = ftDateTime
        Name = 'VDAT'
        ParamType = ptInput
      end    
      item
        DataType = ftDateTime
        Name = 'BDAT'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '11'
      end>
    Left = 102
    Top = 232
    ParamData = <    
      item
        DataType = ftDateTime
        Name = 'VDAT'
        ParamType = ptInput
      end    
      item
        DataType = ftDateTime
        Name = 'BDAT'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '11'
      end>
    object SumQuerySTADIUM: TZShortIntField
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object SumQueryNetto: TZDoubleField
      DisplayLabel = 'Netto'
      FieldKind = fkData
      FieldName = 'SUM(NSUMME)'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryMwSt: TZDoubleField
      DisplayLabel = 'MwSt'
      FieldKind = fkData
      FieldName = 'SUM(MSUMME)'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryBrutto: TZDoubleField
      DisplayLabel = 'Brutto'
      FieldKind = fkData
      FieldName = 'SUM(BSUMME)'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryWAEHRUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
  end
  object JourDS: TDataSource
    DataSet = JQuery
    OnDataChange = JourDSDataChange
    Left = 157
    Top = 174
  end
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 264
    Top = 174
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 400
    Top = 174
  end
end
