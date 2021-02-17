object JournalVKREForm: TJournalVKREForm
  Left = 430
  Height = 564
  Top = 256
  Width = 720
  Caption = 'Journal Verkauf Rechnung'
  ClientHeight = 544
  ClientWidth = 720
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
    Width = 720
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 544
    ClientWidth = 720
    TabOrder = 0
    object ArtPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 720
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 716
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      OnResize = ArtPanResize
      object Label1: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 144
        Align = alLeft
        Caption = '  Rechnungsjournal   '
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
        Left = 144
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
        Left = 580
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
      Height = 22
      Top = 522
      Width = 720
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
      object ViewSumBtn: TToolButton
        Left = 214
        Top = 0
        AutoSize = True
        Caption = 'Summen'
        ImageIndex = 7
        MenuItem = Summen1
      end
      object ToolButton2: TToolButton
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
      object ZEBtn: TToolButton
        Left = 401
        Top = 0
        AutoSize = True
        Caption = 'Zahlung'
        ImageIndex = 12
        MenuItem = Zahlungseingang1
      end
      object PrintJournalBtn: TToolButton
        Left = 466
        Top = 0
        AutoSize = True
        Caption = 'Journal'
        ImageIndex = 8
        MenuItem = Journaldrucken1
      end
      object RePrintBtn: TToolButton
        Left = 526
        Top = 0
        AutoSize = True
        Caption = 'Rechnung'
        ImageIndex = 11
        MenuItem = Rechnungdrucken1
      end
      object MahnungBtn: TToolButton
        Left = 602
        Top = 0
        AutoSize = True
        Caption = 'Mahnung1'
        ImageIndex = 11
        MenuItem = Mahnung1
      end
    end
    object Panel1: TPanel
      Left = 0
      Height = 495
      Top = 27
      Width = 720
      Align = alClient
      BevelOuter = bvNone
      ClientHeight = 495
      ClientWidth = 720
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Height = 417
        Top = 0
        Width = 720
        Align = alClient
        BevelOuter = bvNone
        ClientHeight = 417
        ClientWidth = 720
        TabOrder = 0
        object ReInfoPC: TPageControl
          Left = 0
          Height = 139
          Top = 278
          Width = 720
          ActivePage = TabSheet1
          Align = alBottom
          MultiLine = True
          TabIndex = 1
          TabOrder = 0
          OnChange = ReInfoPCChange
          Options = [nboMultiLine]
          object Allgemein: TTabSheet
            Caption = 'Allgemein'
          end
          object TabSheet1: TTabSheet
            Caption = 'Positionen'
            ClientHeight = 113
            ClientWidth = 712
            object JourPosGrid: TDBGrid
              Left = 0
              Height = 113
              Top = 0
              Width = 712
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
              DefaultRowHeight = 32
              Flat = True
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              Scrollbars = ssAutoBoth
              TabOrder = 0
            end
          end
          object ReInfoTS: TTabSheet
            Caption = 'Informationen (editierbar)'
            ClientHeight = 113
            ClientWidth = 712
            object Panel2: TPanel
              Left = 674
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
                ShowHint = True
                ParentShowHint = False
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
            object JourInfoMemo: TDBMemo
              Left = 0
              Height = 113
              Top = 0
              Width = 674
              Align = alClient
              DataField = 'INFO'
              DataSource = JourDS
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object DateiTS: TTabSheet
            Caption = 'Dateien'
            ClientHeight = 113
            ClientWidth = 712
            object DateiPan: TPanel
              Left = 0
              Height = 113
              Top = 0
              Width = 712
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
            end
          end
          object ShopStatusTS: TTabSheet
            Caption = 'Shop'
            ClientHeight = 113
            ClientWidth = 712
            object Label13: TLabel
              Left = 8
              Height = 13
              Top = 16
              Width = 71
              Caption = 'Shop-OrderID :'
              ParentColor = False
            end
            object Label2: TLabel
              Left = 8
              Height = 13
              Top = 40
              Width = 107
              Caption = 'aktueller Shop-Status :'
              ParentColor = False
            end
            object DBText1: TDBText
              Left = 128
              Height = 17
              Top = 16
              Width = 65
              AutoSize = False
              DataField = 'SHOP_ORDERID'
              DataSource = JourDS
              ParentColor = False
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 127
              Height = 21
              Top = 36
              Width = 145
              DataField = 'SHOP_STATUS'
              DataSource = JourDS
              KeyField = 'ORDERSTATUS_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.ShopOSDS
              LookupCache = False
              TabOrder = 0
            end
            object OrderStatusSaveBtn: TSpeedButton
              Left = 276
              Height = 23
              Hint = 'Änderung speichern'
              Top = 35
              Width = 29
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
            object OrderStatusCancelBtn: TSpeedButton
              Left = 309
              Height = 23
              Hint = 'Änderungen verwerfen'
              Top = 35
              Width = 29
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
              ShowHint = True
              ParentShowHint = False
            end
          end
        end
        object Splitter1: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 273
          Width = 720
          Align = alBottom
          ResizeAnchor = akBottom
        end
        object JourGrid: TDBGrid
          Left = 0
          Height = 273
          Top = 0
          Width = 720
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
              Alignment = taRightJustify
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
              Alignment = taRightJustify
              Title.Caption = ' '
              Width = 15
              FieldName = 'STADIUM'
            end          
            item
              Title.Alignment = taCenter
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
              Title.Caption = 'Lie.-Datum'
              FieldName = 'LDATUM'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'LS-Num.'
              Width = 48
              FieldName = 'VLSNUM'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Mahnkost.'
              FieldName = 'MAHNKOSTEN'
            end          
            item
              Title.Caption = 'Projekt'
              Width = 484
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
            end          
            item
              Title.Caption = 'Shop-Status'
              Width = 100
              FieldName = 'CALC_SHOPSTATUS'
            end>
          DataSource = JourDS
          DefaultRowHeight = 16
          ReadOnly = True
          TabOrder = 2
          OnDrawColumnCell = JourGridDrawColumnCell
        end
      end
      object SumPan: TPanel
        Left = 0
        Height = 78
        Top = 417
        Width = 720
        Align = alBottom
        BevelOuter = bvNone
        ClientHeight = 78
        ClientWidth = 720
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Height = 13
          Top = 21
          Width = 26
          Caption = 'Offen'
          ParentColor = False
        end
        object Label4: TLabel
          Left = 8
          Height = 13
          Top = 39
          Width = 85
          Caption = 'Bezahl mit Skonto'
          ParentColor = False
        end
        object Label5: TLabel
          Left = 8
          Height = 13
          Top = 64
          Width = 66
          Caption = 'Bezahlt Brutto'
          ParentColor = False
        end
        object Label6: TLabel
          Left = 184
          Height = 13
          Top = 2
          Width = 26
          Alignment = taRightJustify
          Caption = 'Netto'
          ParentColor = False
        end
        object Label7: TLabel
          Left = 304
          Height = 13
          Top = 2
          Width = 27
          Alignment = taRightJustify
          Caption = 'MwSt'
          ParentColor = False
        end
        object Label8: TLabel
          Left = 422
          Height = 13
          Top = 2
          Width = 28
          Alignment = taRightJustify
          Caption = 'Brutto'
          ParentColor = False
        end
        object Label9: TLabel
          Left = 606
          Height = 13
          Top = 2
          Width = 36
          Alignment = taRightJustify
          Caption = 'Gesamt'
          ParentColor = False
        end
        object N_OFF_PAN: TPanel
          Left = 104
          Height = 18
          Top = 18
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 0
        end
        object N_BEZSKONTO_PAN: TPanel
          Left = 104
          Height = 18
          Top = 37
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 1
        end
        object N_BEZ_PAN: TPanel
          Left = 104
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 2
        end
        object M_OFF_PAN: TPanel
          Left = 224
          Height = 18
          Top = 18
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 3
        end
        object M_BEZSKONTO_PAN: TPanel
          Left = 224
          Height = 18
          Top = 37
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 4
        end
        object M_BEZ_PAN: TPanel
          Left = 224
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 5
        end
        object B_OFF_PAN: TPanel
          Left = 344
          Height = 18
          Top = 18
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 6
        end
        object B_BEZSKONTO_PAN: TPanel
          Left = 344
          Height = 18
          Top = 37
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 7
        end
        object B_BEZ_PAN: TPanel
          Left = 344
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 8
        end
        object Label10: TLabel
          Left = 504
          Height = 13
          Top = 21
          Width = 26
          Caption = 'Netto'
          ParentColor = False
        end
        object Label11: TLabel
          Left = 504
          Height = 13
          Top = 39
          Width = 27
          Caption = 'MwSt'
          ParentColor = False
        end
        object Label12: TLabel
          Left = 504
          Height = 13
          Top = 58
          Width = 28
          Caption = 'Brutto'
          ParentColor = False
        end
        object N_SUM_PAN: TPanel
          Left = 536
          Height = 18
          Top = 18
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 9
        end
        object M_SUM_PAN: TPanel
          Left = 536
          Height = 18
          Top = 37
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 10
        end
        object B_SUM_PAN: TPanel
          Left = 536
          Height = 18
          Top = 56
          Width = 108
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Caption = '0,00 DM  '
          TabOrder = 11
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 588
    Top = 136
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
      object inEKBestellungumwandeln1: TMenuItem
        Caption = 'in EK-Bestellung umwandeln'
        ImageIndex = 14
        OnClick = inEKBestellungumwandeln1Click
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
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Summennachberechnen1: TMenuItem
        Caption = 'Summennachberechnen1'
        OnClick = Summennachberechnen1Click
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
        OnClick = Preis1Click
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Name'
        GroupIndex = 5
        OnClick = Preis1Click
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Stadium'
        GroupIndex = 5
        OnClick = Preis1Click
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Preis'
        GroupIndex = 5
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
      object Rechnungdrucken1: TMenuItem
        Caption = 'Rechnung'
        ImageIndex = 11
        ShortCut = 16464
        OnClick = RePrintBtn1Click
      end
      object Mahnung1: TMenuItem
        Caption = 'Mahnung1'
        ImageIndex = 11
        OnClick = MahnungBtnClick
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
        end
        object nurunbezahlteRechnungen1: TMenuItem
          Tag = 2
          Caption = 'nur unbezahlte Rechnungen'
          GroupIndex = 1
          RadioItem = True
        end
        object alleRechnungen1: TMenuItem
          Tag = 3
          Caption = 'alle Rechnungen'
          Checked = True
          GroupIndex = 1
          RadioItem = True
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
      object Summen1: TMenuItem
        Caption = 'Summen'
        ImageIndex = 7
        ShortCut = 118
        OnClick = ViewSumBtn1Click
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
  object JourDS: TDataSource
    DataSet = JQuery
    OnDataChange = JourDSDataChange
    Left = 96
    Top = 136
  end
  object JoArtDS: TDataSource
    DataSet = JoArtTab
    Left = 296
    Top = 136
  end
  object JQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = JQueryAfterScroll
    AfterScroll = JQueryAfterScroll
    OnCalcFields = JQueryCalcFields
    BeforeEdit = JQueryBeforeEdit
    BeforePost = JQueryBeforePost
    SQL.Strings = (
      'SELECT'
      'REC_ID,ADDR_ID,VRENUM,RDATUM,'
      'NSUMME,MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME,BSUMME,STADIUM,KUN_NUM,'
      'KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG,MAHNSTUFE,'
      'LDATUM AS LDATUM_ORG,ADATUM,ATRNUM,VLSNUM,KM_STAND,'
      'IST_SKONTO,IST_BETRAG,IST_ZAHLDAT AS IST_ZAHLDAT_ORG,'
      'MAHNKOSTEN, SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,MWST_1, MWST_2, MWST_3, ERST_NAME, INFO,'
      'SHOP_ORDERID, SHOP_STATUS, SHOP_ID, SHOP_CHANGE_FLAG, PRINT_FLAG'
      'FROM JOURNAL'
      'WHERE RDATUM >=:VON AND RDATUM<=:BIS AND QUELLE=3'
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
    Left = 41
    Top = 136
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
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object JQueryMAHNKOSTEN: TFloatField
      DisplayLabel = 'Mahnkosten'
      FieldKind = fkData
      FieldName = 'MAHNKOSTEN'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;-,#0.00; '
    end
    object JQueryIST_BETRAG: TFloatField
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
    object JQueryIST_SKONTO: TFloatField
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
    object JQuerySOLL_SKONTO: TFloatField
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
      Required = True
    end
    object JQuerySOLL_NTAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object JQueryVLSNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '0;"-"'
    end
    object JQueryMAHNSTUFE: TZSmallIntField
      DisplayLabel = 'MS'
      FieldKind = fkData
      FieldName = 'MAHNSTUFE'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;0; '
    end
    object JQueryERST_NAME: TZRawStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQueryINFO: TMemoField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
    end
    object JQuerySHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySHOP_ORDERID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_ORDERID'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySHOP_STATUS: TZWordField
      FieldKind = fkData
      FieldName = 'SHOP_STATUS'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JQuerySHOP_CHANGE_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'SHOP_CHANGE_FLAG'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object JQueryKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryKUN_NAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME3'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JQueryCALC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NAME'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object JQueryCALC_SHOPSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_SHOPSTATUS'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object JQueryPRINT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'PRINT_FLAG'
      Index = 49
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
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
    Left = 41
    Top = 200
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
    object SumQueryNetto: TFloatField
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
    object SumQueryMwSt: TFloatField
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
    object SumQueryBrutto: TFloatField
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
      'order by POSITION, ARTIKELTYP'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 8532
      end>
    Left = 228
    Top = 136
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
      Required = True
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
end
