object HerstellerForm: THerstellerForm
  Left = 373
  Height = 292
  Top = 256
  Width = 563
  BorderStyle = bsDialog
  Caption = 'Hersteller'
  ClientHeight = 292
  ClientWidth = 563
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  HelpFile = '110100'
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object MainPanel: TPanel
    Left = 0
    Height = 292
    Top = 0
    Width = 563
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 292
    ClientWidth = 563
    TabOrder = 0
    object CaoGroupBox7: TGroupBox
      Left = 272
      Height = 292
      Top = 0
      Width = 291
      Align = alClient
      Caption = 'Details'
      ClientHeight = 274
      ClientWidth = 287
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object HerstNameEdi: TDBEdit
        Left = 88
        Height = 21
        Top = 17
        Width = 193
        DataField = 'HERSTELLER_NAME'
        DataSource = HerstellerDS
        Anchors = [akTop, akLeft, akRight]
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        MaxLength = 0
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 88
        Height = 21
        Top = 48
        Width = 169
        DataField = 'HERSTELLER_IMAGE'
        DataSource = HerstellerDS
        Anchors = [akTop, akLeft, akRight]
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        MaxLength = 0
        ParentFont = False
        TabOrder = 1
      end
      object ShopDelCB: TDBCheckBox
        Left = 88
        Height = 19
        Top = 80
        Width = 193
        Anchors = [akTop, akLeft, akRight]
        Caption = 'beim nächsten Update löschen'
        DataField = 'DEL_FLAG'
        DataSource = HerstellerDS
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentFont = False
        TabOrder = 3
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object SprachLB: TRxDBComboBox
        Left = 88
        Height = 21
        Top = 112
        Width = 193
        Anchors = [akTop, akLeft, akRight]
        AutoDropDown = True
        Style = csDropDownList
        Color = clWindow
        DataField = 'HERSTELLER_ID'
        DataSource = HerstInfoDS
        EnableValues = True
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ItemHeight = 13
        Items.Strings = (
          'Deutsch'
          'Englisch'
          'Spanisch'
        )
        MaxLength = 0
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Values.Strings = (
          '1'
          '2'
          '3'
        )
      end
      object Bevel1: TBevel
        Tag = 1
        Left = 4
        Height = 2
        Top = 104
        Width = 277
      end
      object HerstInfoUrlEdi: TDBEdit
        Left = 88
        Height = 21
        Top = 144
        Width = 193
        DataField = 'HERSTELLER_URL'
        DataSource = HerstInfoDS
        Anchors = [akTop, akLeft, akRight]
        Color = clWindow
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        MaxLength = 0
        ParentFont = False
        TabOrder = 5
      end
      object Bevel2: TBevel
        Tag = 1
        Left = 4
        Height = 2
        Top = 180
        Width = 277
      end
      object DBNavigator1: TDBNavigator
        Left = 5
        Height = 29
        Top = 240
        Width = 148
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 29
        ClientWidth = 148
        DataSource = HerstellerDS
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Options = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      end
      object AddBtn: TSpeedButton
        Left = 160
        Height = 29
        Hint = 'Hersteller hinzufügen'
        Top = 240
        Width = 34
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Glyph.Data = {
          DA020000424DDA0200000000000036000000280000000D0000000D0000000100
          200000000000A402000064000000640000000000000000000000984750009847
          5000984750009847500098475000984750009847500098475000984750009847
          5000984750009847500098475000984750009847500098475000984750009847
          5000984750009847500098475000984750009847500098475000984750009847
          50009847500098475000984750009847500098475000000000FF000000FF0000
          00FF984750009847500098475000984750009847500098475000984750009847
          50009847500098475000000000FFFF0000FF000000FF98475000984750009847
          5000984750009847500098475000984750009847500098475000984750000000
          00FFFF0000FF000000FF98475000984750009847500098475000984750009847
          500098475000000000FF000000FF000000FF000000FFFF0000FF000000FF0000
          00FF000000FF000000FF98475000984750009847500098475000000000FFFF00
          00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF000000FF9847
          5000984750009847500098475000000000FF000000FF000000FF000000FFFF00
          00FF000000FF000000FF000000FF000000FF9847500098475000984750009847
          5000984750009847500098475000000000FFFF0000FF000000FF984750009847
          5000984750009847500098475000984750009847500098475000984750009847
          5000000000FFFF0000FF000000FF984750009847500098475000984750009847
          50009847500098475000984750009847500098475000000000FF000000FF0000
          00FF984750009847500098475000984750009847500098475000984750009847
          5000984750009847500098475000984750009847500098475000984750009847
          5000984750009847500098475000984750009847500098475000984750009847
          500098475000984750009847500098475000984750009847500098475000
        }
        Transparent = False
        OnClick = AddBtnClick
        ShowHint = True
        ParentFont = False
        ParentShowHint = False
      end
      object SaveBtn: TSpeedButton
        Left = 200
        Height = 29
        Hint = 'Änderungen speichern'
        Top = 240
        Width = 34
        Enabled = False
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Glyph.Data = {
          B60C0000424DB60C000000000000360000002800000028000000140000000100
          200000000000800C000064000000640000000000000000000000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000808080FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF808080FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000808080FF8080
          80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
          80FF808080FF808080FFF0A58000FFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FFFF0000FF000000FF808080FFFF0000FFFF00
          00FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFFF0000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFFF0A5
          8000808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A580008080
          80FFFFFFFFFFF0A58000808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FFFF0000FF000000FF808080FFFF0000FFFF00
          00FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFFF0000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFFF0A5
          8000808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A580008080
          80FFFFFFFFFFF0A58000808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FFFF0000FF000000FFC0C0C0FF808080FF8080
          80FFC0C0C0FFC0C0C0FFC0C0C0FF000000FFFF0000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFFF0A5
          8000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
          80FFF0A58000F0A58000808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FFFF0000FF808000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF808000FFFF0000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFFF0A5
          8000F0A58000808080FF808080FF808080FF808080FF808080FF808080FFF0A5
          8000F0A58000F0A58000808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
          00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFFF0A5
          8000F0A58000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF0A58000808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FF808000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF808000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFFF0A5
          8000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
          80FFF0A58000FFFFFFFF808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFF8080
          80FFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000808080FFFFFFFFFF808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFF8080
          80FFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000808080FFFFFFFFFF808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFF8080
          80FFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000808080FFFFFFFFFF808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFF8080
          80FFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000808080FFFFFFFFFF808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFF8080
          80FFFFFFFFFFF0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000808080FFFFFFFFFF808080FFFFFFFFFFF0A58000F0A58000F0A58000F0A5
          8000F0A58000000000FFFF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF0000FF000000FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000808080FFFFFFFFFF8080
          80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF808080FFFFFFFFFF808080FFF0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000808080FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF808080FFF0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000808080FF8080
          80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
          80FF808080FF808080FFF0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000F0A5
          8000F0A58000F0A58000F0A58000F0A58000F0A58000F0A58000
        }
        NumGlyphs = 2
        Transparent = False
        ShowHint = True
        ParentFont = False
        ParentShowHint = False
      end
      object AbortBtn: TSpeedButton
        Left = 240
        Height = 29
        Hint = 'Änderungen verwerfen'
        Top = 240
        Width = 34
        Enabled = False
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
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
        Transparent = False
        ShowHint = True
        ParentFont = False
        ParentShowHint = False
      end
      object Label76: TLabel
        Left = 5
        Height = 13
        Top = 120
        Width = 83
        AutoSize = False
        Caption = 'Sprache:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 5
        Height = 13
        Top = 25
        Width = 83
        AutoSize = False
        Caption = 'Name:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Height = 13
        Top = 56
        Width = 83
        AutoSize = False
        Caption = 'Bild-URL:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label77: TLabel
        Left = 5
        Height = 13
        Top = 152
        Width = 83
        AutoSize = False
        Caption = 'Hersteller-URL:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel
        Left = 5
        Height = 13
        Top = 203
        Width = 80
        AutoSize = False
        Caption = 'Clicks:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 88
        Height = 13
        Top = 203
        Width = 49
        AutoSize = False
        DataField = 'URL_CLICKED'
        DataSource = HerstInfoDS
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 160
        Height = 13
        Top = 203
        Width = 121
        Alignment = taRightJustify
        Anchors = [akTop, akLeft, akRight]
        AutoSize = False
        DataField = 'DATE_LAST_CLICK'
        DataSource = HerstInfoDS
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object ProdImageUploadBtn: TSpeedButton
        Left = 258
        Height = 22
        Hint = 'Hersteller-Bild hochladen'
        Top = 47
        Width = 23
        Anchors = [akRight, akBottom]
        Caption = '...'
        OnClick = ProdImageUploadBtnClick
        ShowHint = True
        ParentShowHint = False
      end
    end
    object ListeGB: TGroupBox
      Left = 0
      Height = 292
      Top = 0
      Width = 272
      Align = alLeft
      Caption = 'Liste'
      ClientHeight = 274
      ClientWidth = 268
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object HerstellerGrid: TDBGrid
        Left = 0
        Height = 274
        Top = 0
        Width = 268
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'ID'
            Width = 30
            FieldName = 'HERSTELLER_ID'
          end        
          item
            Title.Caption = 'Name'
            Width = 177
            FieldName = 'HERSTELLER_NAME'
          end>
        DataSource = HerstellerDS
        DefaultRowHeight = 17
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentFont = False
        ReadOnly = True
        Scrollbars = ssAutoBoth
        TabOrder = 0
      end
    end
  end
  object HerstellerTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = HerstellerTabAfterScroll
    AfterScroll = HerstellerTabAfterScroll
    BeforePost = HerstellerTabBeforePost
    AfterPost = HerstellerTabAfterScroll
    BeforeDelete = HerstellerTabBeforeDelete
    AfterDelete = HerstellerTabAfterScroll
    SQL.Strings = (
      'select * from HERSTELLER'
      'where SHOP_ID=:SID'
      'order by HERSTELLER_NAME'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 109
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
    object HerstellerTabSHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object HerstellerTabHERSTELLER_ID: TZIntegerField
      DisplayLabel = 'ID'
      FieldKind = fkData
      FieldName = 'HERSTELLER_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0000'
    end
    object HerstellerTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object HerstellerTabHERSTELLER_NAME: TZRawStringField
      DisplayLabel = 'Hersteller-Name'
      FieldKind = fkData
      FieldName = 'HERSTELLER_NAME'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 32
    end
    object HerstellerTabHERSTELLER_IMAGE: TZRawStringField
      FieldKind = fkData
      FieldName = 'HERSTELLER_IMAGE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 64
    end
    object HerstellerTabLAST_CHANGE: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'LAST_CHANGE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NADT'
    end
    object HerstellerTabSHOP_DATE_ADDED: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'SHOP_DATE_ADDED'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NADT'
    end
    object HerstellerTabSHOP_DATE_CHANGE: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'SHOP_DATE_CHANGE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NADT'
    end
    object HerstellerTabCHANGE_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'CHANGE_FLAG'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object HerstellerTabDEL_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'DEL_FLAG'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
  end
  object HerstInfoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = HerstInfoTabBeforePost
    AfterPost = HerstInfoTabAfterPost
    SQL.Strings = (
      'select * from HERSTELLER_INFO'
      'where SHOP_ID=:SID and HERSTELLER_ID=:HID and SPRACHE_ID=:SPID'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'HID'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SPID'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 176
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'HID'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SPID'
        ParamType = ptUnknown
      end>
    object HerstInfoTabSHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerstInfoTabHERSTELLER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'HERSTELLER_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerstInfoTabSPRACHE_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SPRACHE_ID'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerstInfoTabHERSTELLER_URL: TZRawStringField
      FieldKind = fkData
      FieldName = 'HERSTELLER_URL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object HerstInfoTabURL_CLICKED: TZIntegerField
      FieldKind = fkData
      FieldName = 'URL_CLICKED'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0'
    end
    object HerstInfoTabDATE_LAST_CLICK: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'DATE_LAST_CLICK'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
  end
  object HerstellerDS: TDataSource
    DataSet = HerstellerTab
    OnStateChange = HerstellerDSStateChange
    OnDataChange = HerstellerDSDataChange
    Left = 128
    Top = 109
  end
  object HerstInfoDS: TDataSource
    DataSet = HerstInfoTab
    OnDataChange = HerstellerDSDataChange
    Left = 128
    Top = 176
  end
end
