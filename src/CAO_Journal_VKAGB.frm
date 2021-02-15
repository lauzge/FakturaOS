object JournalVKAGBForm: TJournalVKAGBForm
  Left = 430
  Height = 564
  Top = 256
  Width = 690
  Caption = 'Journal Verkauf Angebot'
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
        Width = 133
        Align = alLeft
        Caption = '  Angebotsjournal   '
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
        Month = 2
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
      Height = 22
      Top = 522
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
      object ToolButton1: TToolButton
        Left = 334
        Top = 0
        AutoSize = True
        Caption = 'In Rechnung wandeln'
        ImageIndex = 14
        MenuItem = InRechnungwandeln1
      end
      object PrintJournalBtn: TToolButton
        Left = 465
        Top = 0
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object RePrintBtn: TToolButton
        Left = 525
        Top = 0
        AutoSize = True
        Caption = 'Angebot'
        ImageIndex = 11
        MenuItem = Angebotdrucken1
      end
    end
    object Panel1: TPanel
      Left = 0
      Height = 495
      Top = 27
      Width = 690
      Align = alClient
      BevelOuter = bvNone
      ClientHeight = 495
      ClientWidth = 690
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Height = 495
        Top = 0
        Width = 690
        Align = alClient
        BevelOuter = bvNone
        ClientHeight = 495
        ClientWidth = 690
        TabOrder = 0
        object ReInfoPC: TPageControl
          Left = 0
          Height = 139
          Top = 356
          Width = 690
          ActivePage = JourInfoTS
          Align = alBottom
          TabIndex = 2
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
                  Title.Caption = 'Steuer'
                  Width = 40
                  FieldName = 'Steuer'
                end>
              DataSource = JoArtDS
              DefaultRowHeight = 28
              Flat = True
              ReadOnly = True
              Scrollbars = ssAutoBoth
              TabOrder = 0
            end
          end
          object JourInfoTS: TTabSheet
            Caption = 'Informationen (editierbar)'
            ClientHeight = 113
            ClientWidth = 682
            object JourInfoMemo: TDBMemo
              Left = 0
              Height = 113
              Top = 0
              Width = 644
              Align = alClient
              DataField = 'INFO'
              DataSource = JourDS
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Panel2: TPanel
              Left = 644
              Height = 113
              Top = 0
              Width = 38
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 113
              ClientWidth = 38
              TabOrder = 1
              object InfoSaveBtn: TSpeedButton
                Left = 2
                Height = 36
                Hint = 'Info speichern'
                Top = 1
                Width = 36
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360000002800000014000000140000000100
                  2000000000004006000064000000640000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000848484FF848484FF8484
                  84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
                  84FF848484FF848484FF848484FF848484FF848484FF00000000000000000000
                  0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8484
                  84FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF00FFFFFF0000
                  00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                  00FF00FFFFFFFFFFFFFF00FFFFFF000000FF848484FF00000000000000000000
                  00FFFFFFFFFF00FFFFFFFFFFFFFF000000FFFFFFFFFF000000FF000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF00FFFFFFFFFFFFFF0000
                  00FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF00FFFFFF0000
                  00FFFFFFFFFF848484FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                  00FF00FFFFFFFFFFFFFF00FFFFFF000000FF848484FF00000000000000000000
                  00FFFFFFFFFF00FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF00FFFFFFFFFFFFFF0000
                  00FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF00FFFFFFFFFF
                  FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF
                  FFFF00FFFFFFFFFFFFFF00FFFFFF000000FF848484FF00000000000000000000
                  00FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
                  FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF0000
                  00FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF00FFFFFFFFFF
                  FFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
                  FFFF00FFFFFFFFFFFFFF00FFFFFF000000FF848484FF00000000000000000000
                  00FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
                  FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF0000
                  00FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF00FFFFFFFFFF
                  FFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
                  FFFF00FFFFFFFFFFFFFF00FFFFFF000000FF848484FF00000000000000000000
                  00FFFFFFFFFF00FFFFFFFFFFFFFF000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF000000FF000000FFFFFFFFFF00FFFFFFFFFFFFFF0000
                  00FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                  00FF00FFFFFFFFFFFFFF00FFFFFF000000FF848484FF00000000000000000000
                  00FFFFFFFFFF00FFFFFF000000FFFFFFFFFFFF0000FFFF0000FFFF0000FFFF00
                  00FFFF0000FFFF0000FFFFFFFFFF000000FFFFFFFFFF00FFFFFFFFFFFFFF0000
                  00FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                  00FF00FFFFFFFFFFFFFF00FFFFFF000000FF848484FF00000000000000000000
                  00FFFFFFFFFF00FFFFFF000000FFFFFFFFFFFF0000FFFF0000FFFF0000FFFF00
                  00FFFF0000FFFF0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF0000
                  00FF848484FF0000000000000000000000FF00FFFFFFFFFFFFFF000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                  00FF00FFFFFFFFFFFFFF00FFFFFF000000FF0000000000000000000000000000
                  0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000
                }
                OnClick = InfoSaveBtnClick
                ShowHint = True
                ParentShowHint = False
              end
              object InfoCancelBtn: TSpeedButton
                Left = 2
                Height = 36
                Hint = 'Änderungen verwerfen'
                Top = 37
                Width = 36
                Flat = True
                Glyph.Data = {
                  560A0000424D560A000000000000360000002800000024000000120000000100
                  200000000000200A000064000000640000000000000000000000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000808080FF8080
                  80FF984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000FFFFFFFF98475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750000000FFFF000080FF000080FF808080FF98475000984750009847
                  500098475000984750000000FFFF808080FF9847500098475000984750009847
                  500098475000984750009847500098475000808080FF808080FFFFFFFFFF9847
                  50009847500098475000984750009847500098475000FFFFFFFF984750009847
                  500098475000984750009847500098475000984750000000FFFF000080FF0000
                  80FF000080FF808080FF9847500098475000984750000000FFFF000080FF0000
                  80FF808080FF9847500098475000984750009847500098475000984750008080
                  80FFFFFFFFFF98475000808080FFFFFFFFFF984750009847500098475000FFFF
                  FFFF808080FF808080FFFFFFFFFF984750009847500098475000984750009847
                  5000984750000000FFFF000080FF000080FF000080FF000080FF808080FF9847
                  50000000FFFF000080FF000080FF000080FF000080FF808080FF984750009847
                  5000984750009847500098475000808080FFFFFFFFFF98475000984750008080
                  80FFFFFFFFFF98475000FFFFFFFF808080FF9847500098475000808080FFFFFF
                  FFFF9847500098475000984750009847500098475000984750000000FFFF0000
                  80FF000080FF000080FF000080FF808080FF000080FF000080FF000080FF0000
                  80FF000080FF808080FF98475000984750009847500098475000984750008080
                  80FFFFFFFFFF984750009847500098475000808080FFFFFFFFFF808080FF9847
                  5000984750009847500098475000808080FFFFFFFFFF98475000984750009847
                  50009847500098475000984750000000FFFF000080FF000080FF000080FF0000
                  80FF000080FF000080FF000080FF000080FF808080FF98475000984750009847
                  500098475000984750009847500098475000808080FFFFFFFFFF984750009847
                  500098475000808080FF98475000984750009847500098475000FFFFFFFF8080
                  80FF984750009847500098475000984750009847500098475000984750009847
                  50000000FFFF000080FF000080FF000080FF000080FF000080FF000080FF8080
                  80FF984750009847500098475000984750009847500098475000984750009847
                  500098475000808080FFFFFFFFFF984750009847500098475000984750009847
                  500098475000FFFFFFFF808080FF984750009847500098475000984750009847
                  50009847500098475000984750009847500098475000000080FF000080FF0000
                  80FF000080FF000080FF808080FF984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000808080FFFFFF
                  FFFF9847500098475000984750009847500098475000808080FF984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750000000FFFF000080FF000080FF000080FF000080FF808080FF9847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000808080FFFFFFFFFF98475000984750009847
                  5000808080FF9847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750000000FFFF000080FF000080FF0000
                  80FF000080FF000080FF808080FF984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750008080
                  80FF98475000984750009847500098475000808080FFFFFFFFFF984750009847
                  5000984750009847500098475000984750009847500098475000984750000000
                  FFFF000080FF000080FF000080FF808080FF000080FF000080FF000080FF8080
                  80FF984750009847500098475000984750009847500098475000984750009847
                  50009847500098475000808080FF984750009847500098475000984750009847
                  5000808080FFFFFFFFFF98475000984750009847500098475000984750009847
                  500098475000984750000000FFFF000080FF000080FF000080FF808080FF9847
                  50000000FFFF000080FF000080FF000080FF808080FF98475000984750009847
                  50009847500098475000984750009847500098475000808080FF984750009847
                  500098475000808080FFFFFFFFFF9847500098475000808080FFFFFFFFFF9847
                  50009847500098475000984750009847500098475000984750000000FFFF0000
                  80FF000080FF808080FF9847500098475000984750000000FFFF000080FF0000
                  80FF000080FF808080FF98475000984750009847500098475000984750009847
                  5000808080FFFFFFFFFF9847500098475000808080FF98475000808080FFFFFF
                  FFFF9847500098475000808080FFFFFFFFFF9847500098475000984750009847
                  50009847500098475000984750000000FFFF000080FF98475000984750009847
                  500098475000984750000000FFFF000080FF000080FF000080FF984750009847
                  500098475000984750009847500098475000808080FFFFFFFFFFFFFFFFFF8080
                  80FF984750009847500098475000808080FFFFFFFFFF98475000984750008080
                  80FFFFFFFFFF9847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750000000
                  FFFF000080FF0000FFFF98475000984750009847500098475000984750009847
                  500098475000808080FF808080FF984750009847500098475000984750009847
                  5000808080FFFFFFFFFFFFFFFFFFFFFFFFFF808080FF98475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  50009847500098475000984750009847500098475000808080FF808080FF8080
                  80FF984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000
                }
                NumGlyphs = 2
                OnClick = InfoCancelBtnClick
              end
              object SpeedButton3: TSpeedButton
                Left = 2
                Height = 36
                Top = 73
                Width = 36
                Flat = True
                Visible = False
              end
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
          Top = 351
          Width = 690
          Align = alBottom
          ResizeAnchor = akBottom
        end
        object JourGrid: TDBGrid
          Left = 0
          Height = 351
          Top = 0
          Width = 690
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = ''
              Width = 16
              FieldName = 'STADIUM'
            end          
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
              Visible = False
              FieldName = 'KUN_NUM'
            end          
            item
              Title.Caption = 'Name des Kunden'
              Width = 192
              FieldName = 'CALC_NAME'
            end          
            item
              Alignment = taRightJustify
              Title.Alignment = taRightJustify
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
              Title.Caption = 'Org.-Nummer'
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
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          Scrollbars = ssAutoBoth
          ShowHint = True
          TabOrder = 2
          OnContextPopup = JourGridContextPopup
          OnDrawColumnCell = JourGridDrawColumnCell
          OnKeyDown = JourGridKeyDown
        end
      end
    end
  end
  object JourDS: TDataSource
    DataSet = JQuery
    OnDataChange = JourDSDataChange
    Left = 136
    Top = 149
  end
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 312
    Top = 149
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
      'KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG,'
      'LDATUM AS LDATUM_ORG,'
      'ADATUM,'
      'ATRNUM,'
      'VLSNUM,'
      'KM_STAND,'
      'IST_SKONTO,IST_BETRAG,IST_ZAHLDAT AS IST_ZAHLDAT_ORG,'
      'MAHNKOSTEN, SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,'
      'MWST_1, MWST_2, MWST_3, ERST_NAME, INFO'
      'FROM JOURNAL'
      'WHERE RDATUM >=:VON AND RDATUM<=:BIS'
      'AND QUELLE=1'
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
    Left = 61
    Top = 149
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
    object JQueryADATUM: TZDateField
      DisplayLabel = 'Auftr.Datum'
      FieldKind = fkData
      FieldName = 'ADATUM'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object JQueryPROJEKT: TZRawStringField
      DisplayLabel = 'Projekt'
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQuerySOLL_SKONTO: TFloatField
      FieldKind = fkData
      FieldName = 'SOLL_SKONTO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySOLL_STAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_STAGE'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySOLL_NTAGE: TZShortIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryERST_NAME: TZRawStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySTADIUM: TZSmallIntField
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryINFO: TMemoField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object JQueryCALC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object JQueryKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME3'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
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
    Left = 232
    Top = 149
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
      Alignment = taCenter
      DisplayLabel = 'Pos.'
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
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 390
    Top = 153
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
      object InRechnungwandeln1: TMenuItem
        Caption = 'In Rechnung wandeln'
        ImageIndex = 14
        ShortCut = 16466
        OnClick = InRechnungwandeln1Click
      end
      object inEKBestellungumwandeln1: TMenuItem
        Caption = 'in EK-Bestellung umwandeln'
        ImageIndex = 14
        OnClick = inEKBestellungumwandeln1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Storno1: TMenuItem
        Caption = 'Storno'
        ImageIndex = 6
        ShortCut = 16430
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
      object Angebotdrucken1: TMenuItem
        Caption = 'Angebot'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = AgbPrintBtn1Click
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
    Images = MainForm.ImageList1
    Left = 462
    Top = 150
    object Stadiumndern1: TMenuItem
      Caption = 'Stadium ändern'
      object MnuStadiumOffen: TMenuItem
        Caption = 'offen'
        ImageIndex = 0
        OnClick = MnuStadiumChange
      end
      object MnuStadiumPruefen: TMenuItem
        Tag = 102
        Caption = 'bitte prüfen ...'
        ImageIndex = 3
        OnClick = MnuStadiumChange
      end
      object MnuStadiumAbgelehnt: TMenuItem
        Tag = 101
        Caption = 'abgelehnt'
        ImageIndex = 1
        OnClick = MnuStadiumChange
      end
      object MnuStadiumUmgewandelt: TMenuItem
        Tag = 100
        Caption = 'in Rechnung gewandelt'
        ImageIndex = 2
        OnClick = MnuStadiumChange
      end
    end
  end
end
