object JournalVKKasseForm: TJournalVKKasseForm
  Left = 430
  Height = 600
  Top = 256
  Width = 715
  Caption = 'Journal Verkauf Kasse'
  ClientHeight = 580
  ClientWidth = 715
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
    Height = 580
    Top = 0
    Width = 715
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 580
    ClientWidth = 715
    TabOrder = 0
    object ArtPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 715
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 711
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      OnResize = ArtPanResize
      object DatumAW: TVolgaPeriod
        Left = 575
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
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 110
        Align = alLeft
        Caption = '  Kassenjournal '
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
    end
    object ToolBar1: TToolBar
      Left = 0
      Height = 22
      Top = 558
      Width = 715
      Align = alBottom
      AutoSize = True
      BorderWidth = 2
      Caption = 'ToolBar1'
      EdgeBorders = []
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
      object ViewSumBtn: TToolButton
        Left = 214
        Top = 0
        AutoSize = True
        Caption = 'Summen'
        ImageIndex = 7
        MenuItem = Summen1
      end
      object SuchenBtn: TToolButton
        Left = 281
        Top = 0
        AutoSize = True
        Caption = 'Suchen'
        ImageIndex = 10
        MenuItem = Suchen1
      end
      object StornoBtn: TToolButton
        Left = 344
        Top = 0
        AutoSize = True
        Caption = 'Storno'
        ImageIndex = 6
        MenuItem = Storno1
      end
      object TabAbschlussBtn: TToolButton
        Left = 401
        Top = 0
        AutoSize = True
        Caption = 'Tagesabschluß'
        ImageIndex = 12
        MenuItem = Tagesabschlu1
      end
      object PrintJournalBtn: TToolButton
        Left = 500
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object TagesJournalBtn: TToolButton
        Left = 560
        Top = 0
        AutoSize = True
        Caption = 'Tagesjournal'
        ImageIndex = 8
        MenuItem = Tagesjournal1
      end
    end
    object PC1: TPageControl
      Left = 0
      Height = 531
      Top = 27
      Width = 715
      ActivePage = TabSheet2
      Align = alClient
      TabIndex = 1
      TabOrder = 2
      OnChange = PC1Change
      object TabSheet1: TTabSheet
        Caption = 'Übersicht'
        ClientHeight = 505
        ClientWidth = 707
        object Panel1: TPanel
          Left = 0
          Height = 505
          Top = 0
          Width = 707
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 505
          ClientWidth = 707
          TabOrder = 0
          object SumPanel: TPanel
            Left = 0
            Height = 23
            Top = 482
            Width = 707
            Align = alBottom
            BevelOuter = bvNone
            ClientHeight = 23
            ClientWidth = 707
            TabOrder = 0
            object Label9: TLabel
              Left = 0
              Height = 23
              Top = 0
              Width = 80
              Align = alLeft
              Alignment = taRightJustify
              Caption = 'Gesamtsumme'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object B_SUM_PAN: TPanel
              Left = 599
              Height = 23
              Top = 0
              Width = 108
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvLowered
              Caption = '0,00 DM  '
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object Label12: TLabel
              Left = 553
              Height = 23
              Top = 0
              Width = 46
              Align = alRight
              Caption = '  Brutto '
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object M_SUM_PAN: TPanel
              Left = 445
              Height = 23
              Top = 0
              Width = 108
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvLowered
              Caption = '0,00 DM  '
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object Label11: TLabel
              Left = 402
              Height = 23
              Top = 0
              Width = 43
              Align = alRight
              Caption = '  MwSt '
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object N_SUM_PAN: TPanel
              Left = 294
              Height = 23
              Top = 0
              Width = 108
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvLowered
              Caption = '0,00 DM  '
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object Label10: TLabel
              Left = 259
              Height = 23
              Top = 0
              Width = 35
              Align = alRight
              Caption = 'Netto '
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
          end
          object Panel2: TPanel
            Left = 0
            Height = 482
            Top = 0
            Width = 707
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 482
            ClientWidth = 707
            TabOrder = 1
            object Panel3: TPanel
              Left = 0
              Height = 70
              Top = 412
              Width = 707
              Align = alBottom
              BevelOuter = bvNone
              ClientHeight = 70
              ClientWidth = 707
              TabOrder = 0
              object TagSumDetailGrid: TDBGrid
                Left = 0
                Height = 70
                Top = 0
                Width = 707
                Align = alClient
                Color = clWindow
                Columns = <                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'Datum'
                    Width = 82
                    FieldName = 'RDATUM'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'Beleg von'
                    Width = 53
                    FieldName = 'RN_VON'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'Beleg bis'
                    Width = 49
                    FieldName = 'RN_BIS'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'Anzahl'
                    Width = 41
                    FieldName = 'ANZAHL'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'Netto'
                    Width = 61
                    FieldName = 'NSUMME'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'MwSt 7%'
                    Width = 57
                    FieldName = 'MSUMME_1'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'MwSt 16%'
                    FieldName = 'MSUMME_2'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'MwSt'
                    Width = 61
                    FieldName = 'MSUMME'
                  end                
                  item
                    Alignment = taRightJustify
                    Title.Caption = 'Brutto'
                    FieldName = 'BSUMME'
                  end                
                  item
                    Title.Caption = 'Währung'
                    Width = 23
                    FieldName = 'WAEHRUNG'
                  end                
                  item
                    Title.Caption = 'Zahlart'
                    Width = 71
                    FieldName = 'Zahlart_Kurz'
                  end>
                DataSource = TagSumDetailDS
                DefaultRowHeight = 16
                Flat = True
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                Scrollbars = ssAutoBoth
                TabOrder = 0
              end
            end
            object JourGrid: TDBGrid
              Left = 0
              Height = 412
              Top = 0
              Width = 707
              Align = alClient
              Color = clWindow
              Columns = <              
                item
                  Title.Caption = 'Datum'
                  Width = 85
                  FieldName = 'RDATUM'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'Beleg von'
                  Width = 94
                  FieldName = 'RN_VON'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'Beleg bis'
                  Width = 94
                  FieldName = 'RN_BIS'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'Anzahl'
                  Width = 94
                  FieldName = 'ANZAHL'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'Netto'
                  FieldName = 'NSUMME'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'MwSt (1)'
                  FieldName = 'MSUMME_1'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'MwSt (2)'
                  FieldName = 'MSUMME_2'
                end              
                item
                  Title.Caption = 'MwSt (Summe)'
                  Width = 75
                  FieldName = 'MSUMME'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'Brutto'
                  FieldName = 'BSUMME'
                end              
                item
                  Alignment = taCenter
                  Title.Caption = 'Währung'
                  Width = 27
                  FieldName = 'WAEHRUNG'
                end              
                item
                  Alignment = taCenter
                  Title.Caption = 'Gebucht'
                  Width = 46
                  FieldName = 'GEBUCHT'
                end>
              DataSource = JourDS
              DefaultRowHeight = 16
              Flat = True
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              Scrollbars = ssHorizontal
              TabOrder = 1
              OnDrawColumnCell = JourGridDrawColumnCell
              OnKeyDown = JourGridKeyDown
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Tagesdetails'
        ClientHeight = 505
        ClientWidth = 707
        object JourPosGrid: TDBGrid
          Left = 0
          Height = 150
          Top = 355
          Width = 707
          Align = alBottom
          Color = clWindow
          Columns = <          
            item
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
              Title.Caption = 'Art.-Nr.'
              Visible = False
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
              FieldName = 'RABATT'
            end          
            item
              Title.Caption = 'G-Preis'
              FieldName = 'G_PREIS'
            end          
            item
              Title.Caption = 'Steuer'
              Width = 40
              FieldName = 'Steuer'
            end>
          DataSource = JoArtDS
          DefaultRowHeight = 16
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
        end
        object Splitter1: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 350
          Width = 707
          Align = alBottom
          ResizeAnchor = akBottom
        end
        object TagBelegeGrid: TDBGrid
          Left = 0
          Height = 350
          Top = 0
          Width = 707
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Datum'
              Width = 80
              FieldName = 'RDATUM'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Beleg'
              Width = 39
              FieldName = 'VRENUM'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Netto'
              Width = 59
              FieldName = 'NSUMME'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'MwSt 7%'
              FieldName = 'MSUMME_1'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'MwSt 16%'
              FieldName = 'MSUMME_2'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'MwSt'
              FieldName = 'MSUMME'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Brutto'
              FieldName = 'BSUMME'
            end          
            item
              Title.Caption = 'Währung'
              Width = 22
              FieldName = 'WAEHRUNG'
            end          
            item
              Title.Caption = 'Zahlart'
              Width = 90
              FieldName = 'Zahlart_Kurz'
            end          
            item
              Title.Caption = 'erstellt von'
              Width = 124
              FieldName = 'ERST_NAME'
            end>
          DataSource = TagBelegeDS
          DefaultRowHeight = 16
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
        end
      end
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
      'MENGE * EPREIS * (100-RABATT) / 100 AS G_PREIS'
      'from JOURNALPOS'
      'where JOURNAL_ID=:REC_ID'
      'order by POSITION'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'REC_ID'
        ParamType = ptUnknown
        Value = 13550
      end>
    DataSource = TagBelegeDS
    Left = 216
    Top = 496
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'REC_ID'
        ParamType = ptUnknown
        Value = 13550
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
      Alignment = taCenter
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
    end
    object JoArtTabEPREIS: TFloatField
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
    object JoArtTabRABATT: TFloatField
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
    object JoArtTabG_PREIS: TFloatField
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
    object JoArtTabSTEUER_CODE: TZSmallIntField
      DisplayWidth = 16
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 280
    Top = 496
  end
  object TagBelegeDS: TDataSource
    DataSet = TagBelege
    Left = 349
    Top = 266
  end
  object TagBelege: TZQuery
    Connection = DM1.DB1
    AfterOpen = TagBelegeAfterOpen
    AfterScroll = TagBelegeAfterOpen
    SQL.Strings = (
      'SELECT'
      'REC_ID, VRENUM, RDATUM,'
      'NSUMME,MSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, BSUMME,'
      'STADIUM, GEGENKONTO,WAEHRUNG, MWST_1, MWST_2, MWST_3,'
      'NAME as Zahlart_Kurz, ERST_NAME'
      'FROM JOURNAL, REGISTERY'
      'WHERE RDATUM=:RDATUM AND QUELLE_SUB = 2 AND QUELLE=3'
      'and zahlart=val_char and mainkey=''MAIN\\ZAHLART'''
      ''
      'ORDER BY VRENUM'
    )
    Params = <    
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    DataSource = JourDS
    Left = 256
    Top = 266
    ParamData = <    
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    object TagBelegeREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object TagBelegeVRENUM: TZIntegerField
      DisplayLabel = 'Beleg'
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object TagBelegeRDATUM: TZDateField
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      InvalidDisplayText = 'NAD'
    end
    object TagBelegeNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_0: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_1: TFloatField
      DisplayLabel = 'MwSt 7%'
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_2: TFloatField
      DisplayLabel = 'MwSt 16%'
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagBelegeMSUMME_3: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagBelegeBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagBelegeSTADIUM: TZShortIntField
      DisplayLabel = 'Stadium'
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagBelegeGEGENKONTO: TZIntegerField
      DisplayLabel = 'Geg.-Konto'
      FieldKind = fkData
      FieldName = 'GEGENKONTO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagBelegeWAEHRUNG: TZRawStringField
      DisplayLabel = 'Währung'
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object TagBelegeMWST_1: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagBelegeMWST_2: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagBelegeMWST_3: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagBelegeZahlart_Kurz: TZRawStringField
      DisplayLabel = 'Zahlart'
      FieldKind = fkData
      FieldName = 'Zahlart_Kurz'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 100
    end
    object TagBelegeERST_NAME: TZRawStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object JQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = JQueryAfterScroll
    AfterScroll = JQueryAfterScroll
    SQL.Strings = (
      'SELECT'
      'RDATUM,'
      'MIN(VRENUM) as RN_VON,'
      'MAX(VRENUM) as RN_BIS,'
      'COUNT(*) as ANZAHL,'
      'SUM(NSUMME) as NSUMME,'
      'SUM(MSUMME_0) as MSUMME_0,'
      'SUM(MSUMME_1) as MSUMME_1,'
      'SUM(MSUMME_2) as MSUMME_2,'
      'SUM(MSUMME_3) as MSUMME_3,'
      'SUM(MSUMME) as MSUMME,'
      'SUM(BSUMME) as BSUMME,'
      'WAEHRUNG,'
      'SUM(UW_NUM)=0 as GEBUCHT'
      'from JOURNAL'
      'WHERE RDATUM >=:VON AND RDATUM<=:BIS AND QUELLE_SUB = 2 AND QUELLE=3'
      'Group by RDATUM, WAEHRUNG'
      'ORDER BY RDATUM, WAEHRUNG'
    )
    Params = <    
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = 32874d
      end    
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = 37591d
      end>
    Left = 72
    Top = 268
    ParamData = <    
      item
        DataType = ftDate
        Name = 'VON'
        ParamType = ptInput
        Value = 32874d
      end    
      item
        DataType = ftDate
        Name = 'BIS'
        ParamType = ptInput
        Value = 37591d
      end>
    object JQueryRDATUM: TZDateField
      Alignment = taRightJustify
      DisplayLabel = 'Datum'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'ddd, dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JQueryRN_VON: TZIntegerField
      DisplayLabel = 'Beleg von'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'RN_VON'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryRN_BIS: TZIntegerField
      DisplayLabel = 'Beleg bis'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'RN_BIS'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryANZAHL: TZInt64Field
      DisplayLabel = 'Anzahl'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'ANZAHL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
    object JQueryMSUMME_0: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_1: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_2: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object JQueryMSUMME_3: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 8
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
      Index = 9
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
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
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
    object JQueryGEBUCHT: TZIntegerField
      DisplayLabel = 'Gebucht'
      DisplayWidth = 1
      FieldKind = fkData
      FieldName = 'GEBUCHT'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'Ja; ;Nein'
      MaxValue = 1
    end
  end
  object JourDS: TDataSource
    DataSet = JQuery
    Left = 152
    Top = 268
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = SumQueryAfterOpen
    SQL.Strings = (
      'SELECT SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'FROM JOURNAL'
      'WHERE RDATUM>=:VDAT AND RDATUM <= :BDAT AND QUELLE= :QUELLE and QUELLE_SUB=2'
      'group by WAEHRUNG'
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
    Left = 352
    Top = 496
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
    object SumQueryNetto: TFloatField
      DisplayLabel = 'Netto'
      FieldKind = fkData
      FieldName = 'SUM(NSUMME)'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryMwSt: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkData
      FieldName = 'SUM(MSUMME)'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryBrutto: TFloatField
      DisplayLabel = 'Brutto'
      FieldKind = fkData
      FieldName = 'SUM(BSUMME)'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',##,##0.00'
    end
    object SumQueryWAEHRUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
  end
  object TagSumDetail: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'SELECT'
      'RDATUM,'
      'MIN(VRENUM) as RN_VON,'
      'MAX(VRENUM) as RN_BIS,'
      'COUNT(*) as ANZAHL,'
      'SUM(NSUMME) as NSUMME,'
      'SUM(MSUMME_0) as MSUMME_0,'
      'SUM(MSUMME_1) as MSUMME_1,'
      'SUM(MSUMME_2) as MSUMME_2,'
      'SUM(MSUMME_3) as MSUMME_3,'
      'SUM(MSUMME) as MSUMME,'
      'SUM(BSUMME) as BSUMME,'
      'WAEHRUNG,'
      'name as Zahlart_Kurz'
      'from JOURNAL, REGISTERY'
      'WHERE RDATUM =:RDATUM AND QUELLE_SUB = 2 AND QUELLE=3 '
      'and zahlart=val_char and mainkey=''MAIN\\ZAHLART'''
      'Group by RDATUM, ZAHLART, WAEHRUNG'
      'ORDER BY RDATUM, ZAHLART, WAEHRUNG'
    )
    Params = <    
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    DataSource = JourDS
    Left = 48
    Top = 496
    ParamData = <    
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    object TagSumDetailRDATUM: TZDateField
      Alignment = taRightJustify
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'ddd, dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object TagSumDetailRN_VON: TZIntegerField
      DisplayLabel = 'Beleg von'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'RN_VON'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagSumDetailRN_BIS: TZIntegerField
      DisplayLabel = 'Beleg bis'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'RN_BIS'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagSumDetailANZAHL: TZInt64Field
      DisplayLabel = 'Anzahl'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'ANZAHL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagSumDetailNSUMME: TFloatField
      DisplayLabel = 'Netto'
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_0: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_1: TFloatField
      DisplayLabel = 'MwSt 7%'
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_2: TFloatField
      DisplayLabel = 'MwSt 16%'
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME_3: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagSumDetailWAEHRUNG: TZRawStringField
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
    object TagSumDetailZahlart_Kurz: TZRawStringField
      DisplayLabel = 'Zahlart'
      FieldKind = fkData
      FieldName = 'Zahlart_Kurz'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 100
    end
  end
  object TagSumDetailDS: TDataSource
    DataSet = TagSumDetail
    Left = 136
    Top = 496
  end
  object TagAbschlussQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'SELECT'
      'REC_ID, RDATUM, VRENUM,'
      'NSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME, BSUMME,'
      'WAEHRUNG, uw_num, zahlart'
      'from JOURNAL'
      'WHERE RDATUM =:RDATUM AND QUELLE_SUB = 2 AND QUELLE=3 and UW_NUM=-1'
      'ORDER BY RDATUM, ZAHLART, WAEHRUNG'
    )
    Params = <    
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    DataSource = JourDS
    Left = 456
    Top = 266
    ParamData = <    
      item
        DataType = ftDateTime
        Name = 'RDATUM'
        ParamType = ptUnknown
        Value = 37243d
      end>
    object DateField1: TZDateField
      Alignment = taRightJustify
      DisplayLabel = 'Datum'
      DisplayWidth = 17
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'ddd, dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object TagAbschlussQueryVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object TagAbschlussQueryNSUMME: TFloatField
      DisplayLabel = 'Netto'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object FloatField2: TFloatField
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'MwSt 7%'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'MwSt 16%'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object FloatField5: TFloatField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'MwSt'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TabAbschlussQueryBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object TagAbschlussQueryWAEHRUNG: TZRawStringField
      DisplayLabel = 'Währung'
      DisplayWidth = 9
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object TagAbschlussQueryuw_num: TZIntegerField
      FieldKind = fkData
      FieldName = 'uw_num'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagAbschlussQueryzahlart: TZSmallIntField
      FieldKind = fkData
      FieldName = 'zahlart'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object TagAbschlussQueryREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 536
    Top = 344
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Tagesabschlu1: TMenuItem
        Caption = 'Tagesabschluß'
        ImageIndex = 12
        OnClick = Tagesabschlu1Click
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16473
        OnClick = StornoBtnClick
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
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      GroupIndex = 4
      object Journaldrucken1: TMenuItem
        Caption = 'Journal'
        ImageIndex = 8
        ShortCut = 16452
        OnClick = PrintJournalBtnClick
      end
      object Tagesjournal1: TMenuItem
        Caption = 'Tagesjournal'
        ImageIndex = 8
        ShortCut = 16468
        OnClick = Tagesjournal1Click
      end
      object Rechnungdrucken1: TMenuItem
        Caption = 'Beleg'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = RePrintBtnClick
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Positionen1: TMenuItem
        Caption = 'Details'
        ImageIndex = 5
        ShortCut = 117
        OnClick = Positionen1Click
      end
      object Summen1: TMenuItem
        Caption = 'Summen'
        ImageIndex = 7
        ShortCut = 118
        OnClick = Summen1Click
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
end
