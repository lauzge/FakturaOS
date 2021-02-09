object SetupForm: TSetupForm
  Left = 86
  Height = 445
  Top = 85
  Width = 638
  BorderStyle = bsDialog
  Caption = 'CAO-Einstellungen'
  ClientHeight = 445
  ClientWidth = 638
  Color = clBtnFace
  Font.Color = clWindowText
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poMainFormCenter
  ShowInTaskBar = stNever
  LCLVersion = '7.2'
  object StatusBar1: TStatusBar
    Left = 0
    Height = 23
    Top = 422
    Width = 638
    Panels = <>
  end
  object NavPan: TPanel
    Left = 0
    Height = 26
    Top = 396
    Width = 638
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 26
    ClientWidth = 638
    TabOrder = 1
    object Nav1: TDBNavigator
      Left = 0
      Height = 25
      Top = 0
      Width = 241
      BevelOuter = bvNone
      ChildSizing.EnlargeHorizontal = crsScaleChilds
      ChildSizing.EnlargeVertical = crsScaleChilds
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 100
      ClientHeight = 25
      ClientWidth = 241
      Flat = True
      Options = []
      TabOrder = 0
    end
    object ShopSaveBtn: TSpeedButton
      Left = 272
      Height = 25
      Top = 0
      Width = 105
      Caption = 'Speichern'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888000088877777777777777778000088000000000000000778000080BF
        B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
        000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
        FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
        BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
        000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
        F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
        88888888888888880000
      }
      OnClick = ShopSaveBtnClick
    end
    object ExportSetupBtn: TSpeedButton
      Left = 368
      Height = 25
      Top = 0
      Width = 129
      Caption = 'Export-Einstellungen'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777788888888888877700000000000087770FFFFFFFFF
        F087770F44444FEEF087770F4FFF4FFFF087770F4FFF4F66F087770F44444FEE
        F087770FFFFFFFFFF087770FEEEEFEFFF0877704444444444087770000000000
        0077777777777777777777777777777777777777777777777777
      }
      OnClick = ExportSetupBtnClick
    end
    object PreisCalcBtn: TSpeedButton
      Left = 493
      Height = 25
      Top = 0
      Width = 144
      Caption = 'Preis neu berechnen'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000000070777777777777707078078078078070707F07F07F07
        F07070777777777777707078078078078070707F07F07F07F070707777777777
        777070700000000077707070FFFFFFF077707070000000007770707777777777
        7770770000000000000777777777777777777777777777777777
      }
      OnClick = PreisCalcBtnClick
    end
  end
  object PC1: TPageControl
    Left = 0
    Height = 396
    Top = 0
    Width = 638
    ActivePage = FirmDat1Tab
    Align = alClient
    TabIndex = 1
    TabOrder = 2
    OnChange = PC1Change
    OnChanging = PC1Changing
    object AllgTS: TTabSheet
      Tag = 10
      Caption = 'Allgemein'
      ClientHeight = 368
      ClientWidth = 630
      object GroupBox2: TGroupBox
        Left = 440
        Height = 177
        Top = 7
        Width = 185
        Caption = 'GroupBox2'
        ClientHeight = 157
        ClientWidth = 181
        TabOrder = 0
        object Label74: TLabel
          Left = 8
          Height = 15
          Top = 8
          Width = 50
          Caption = 'MwSt (0):'
          ParentColor = False
        end
        object Label75: TLabel
          Left = 8
          Height = 15
          Top = 33
          Width = 50
          Caption = 'MwSt (1):'
          ParentColor = False
        end
        object Label76: TLabel
          Left = 8
          Height = 15
          Top = 56
          Width = 50
          Caption = 'MwSt (2):'
          ParentColor = False
        end
        object Label77: TLabel
          Left = 8
          Height = 15
          Top = 80
          Width = 50
          Caption = 'MwSt (3):'
          ParentColor = False
        end
        object Label78: TLabel
          Left = 8
          Height = 15
          Top = 104
          Width = 41
          Caption = 'Default:'
          ParentColor = False
        end
        object Label79: TLabel
          Left = 16
          Height = 15
          Top = 128
          Width = 170
          Caption = 'Wird für neue Artikel werwendet'
          ParentColor = False
        end
        object MWST0_EDIT: TCurrencyEdit
          Left = 72
          Height = 23
          Top = 0
          Width = 100
          Alignment = taRightJustify
          DisplayFormat = '0.00'
          MaxValue = 99
          TabOrder = 0
          ZeroEmpty = False
          OnExit = MWST0_EDITExit
        end
        object MWST1_EDIT: TCurrencyEdit
          Left = 72
          Height = 23
          Top = 25
          Width = 100
          Alignment = taRightJustify
          DisplayFormat = '0.00'
          MaxValue = 99
          TabOrder = 1
          ZeroEmpty = False
          OnExit = MWST0_EDITExit
        end
        object MWST2_EDIT: TCurrencyEdit
          Left = 72
          Height = 23
          Top = 48
          Width = 100
          Alignment = taRightJustify
          DisplayFormat = '0.00'
          MaxValue = 99
          TabOrder = 2
          ZeroEmpty = False
          OnExit = MWST0_EDITExit
        end
        object MWST3_EDIT: TCurrencyEdit
          Left = 72
          Height = 23
          Top = 72
          Width = 100
          Alignment = taRightJustify
          DisplayFormat = '0.00'
          MaxValue = 99
          TabOrder = 3
          ZeroEmpty = False
          OnExit = MWST0_EDITExit
        end
        object DefMwstCB: TComboBox
          Left = 72
          Height = 23
          Top = 96
          Width = 100
          ItemHeight = 15
          Style = csDropDownList
          TabOrder = 4
        end
      end
      object GroupBox3: TGroupBox
        Left = 272
        Height = 177
        Top = 7
        Width = 153
        Caption = 'GroupBox3'
        ClientHeight = 157
        ClientWidth = 149
        TabOrder = 1
        object Label68: TLabel
          Left = 8
          Height = 15
          Top = 8
          Width = 20
          Caption = 'VK1'
          ParentColor = False
        end
        object Label69: TLabel
          Left = 8
          Height = 15
          Top = 33
          Width = 20
          Caption = 'VK2'
          ParentColor = False
        end
        object Label70: TLabel
          Left = 8
          Height = 15
          Top = 55
          Width = 20
          Caption = 'VK3'
          ParentColor = False
        end
        object Label71: TLabel
          Left = 8
          Height = 15
          Top = 80
          Width = 20
          Caption = 'VK4'
          ParentColor = False
        end
        object Label72: TLabel
          Left = 8
          Height = 15
          Top = 104
          Width = 20
          Caption = 'VK5'
          ParentColor = False
        end
        object Label73: TLabel
          Left = 8
          Height = 15
          Top = 128
          Width = 27
          Caption = 'Shop'
          ParentColor = False
        end
        object VK1_CALC: TCurrencyEdit
          Left = 48
          Height = 23
          Top = 0
          Width = 88
          Alignment = taRightJustify
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          MaxValue = 99
          TabOrder = 0
          ZeroEmpty = False
        end
        object VK2_CALC: TCurrencyEdit
          Left = 48
          Height = 23
          Top = 25
          Width = 88
          Alignment = taRightJustify
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          MaxValue = 99
          TabOrder = 1
          ZeroEmpty = False
        end
        object VK3_CALC: TCurrencyEdit
          Left = 48
          Height = 23
          Top = 48
          Width = 88
          Alignment = taRightJustify
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          MaxValue = 99
          TabOrder = 2
          ZeroEmpty = False
        end
        object VK4_CALC: TCurrencyEdit
          Left = 48
          Height = 23
          Top = 72
          Width = 88
          Alignment = taRightJustify
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          MaxValue = 99
          TabOrder = 3
          ZeroEmpty = False
        end
        object VK5_CALC: TCurrencyEdit
          Left = 48
          Height = 23
          Top = 96
          Width = 88
          Alignment = taRightJustify
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          MaxValue = 99
          TabOrder = 4
          ZeroEmpty = False
        end
        object SVK_CALC: TCurrencyEdit
          Left = 48
          Height = 23
          Top = 120
          Width = 88
          Alignment = taRightJustify
          DecimalPlaces = 5
          DisplayFormat = '0.00000 '
          MaxValue = 99
          TabOrder = 5
          ZeroEmpty = False
        end
      end
      object Label67: TLabel
        Left = 14
        Height = 15
        Top = 15
        Width = 52
        Caption = 'Währung:'
        ParentColor = False
      end
      object Label80: TLabel
        Left = 288
        Height = 15
        Top = 224
        Width = 129
        Caption = 'Text für "Zahlbar sofort":'
        ParentColor = False
      end
      object Label81: TLabel
        Left = 288
        Height = 15
        Top = 248
        Width = 32
        Caption = 'Land :'
        ParentColor = False
      end
      object UseKFZCB: TCheckBox
        Left = 14
        Height = 19
        Top = 40
        Width = 171
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'KFZ-Verwaltung '
        TabOrder = 2
      end
      object LeitwaehrungEdit: TEdit
        Left = 120
        Height = 23
        Top = 11
        Width = 65
        TabOrder = 3
      end
      object Edit1: TEdit
        Left = 408
        Height = 23
        Top = 216
        Width = 208
        TabOrder = 4
      end
      object LandLangEdi: TEdit
        Left = 472
        Height = 23
        Top = 243
        Width = 144
        TabOrder = 6
      end
      object LandEdi: TVolgaDBEdit
        Left = 408
        Height = 23
        Top = 243
        Width = 53
        ButtonWidth = 18
        Color = clBtnFace
        DialogStyle = vdsLookup
        LookupDataSet = DM1.LandTab
        MaxLength = 0
        Style = vcsDropDownList
        TabOrder = 5
        OnChange = LandEdiChange
      end
    end
    object FirmDat1Tab: TTabSheet
      Tag = 7
      Caption = 'Firmendaten (1)'
      ClientHeight = 368
      ClientWidth = 630
      object Label1: TLabel
        Left = 8
        Height = 15
        Top = 16
        Width = 38
        Caption = 'Anrede'
        ParentColor = False
      end
      object Label2: TLabel
        Left = 8
        Height = 15
        Top = 40
        Width = 41
        Caption = 'Name 1'
        ParentColor = False
      end
      object Label3: TLabel
        Left = 8
        Height = 15
        Top = 64
        Width = 41
        Caption = 'Name 2'
        ParentColor = False
      end
      object Label4: TLabel
        Left = 8
        Height = 15
        Top = 88
        Width = 41
        Caption = 'Name 3'
        ParentColor = False
      end
      object Label5: TLabel
        Left = 8
        Height = 15
        Top = 112
        Width = 33
        Caption = 'Straße'
        ParentColor = False
      end
      object Label6: TLabel
        Left = 8
        Height = 15
        Top = 136
        Width = 26
        Caption = 'Land'
        ParentColor = False
      end
      object Label7: TLabel
        Left = 8
        Height = 15
        Top = 160
        Width = 17
        Caption = 'Ort'
        ParentColor = False
      end
      object Label8: TLabel
        Left = 128
        Height = 15
        Top = 136
        Width = 20
        Caption = 'PLZ'
        ParentColor = False
      end
      object Label9: TLabel
        Left = 8
        Height = 15
        Top = 184
        Width = 50
        Caption = 'Absender'
        ParentColor = False
      end
      object Label10: TLabel
        Left = 8
        Height = 15
        Top = 260
        Width = 35
        Caption = 'Bank 1'
        ParentColor = False
      end
      object Label11: TLabel
        Left = 8
        Height = 15
        Top = 296
        Width = 35
        Caption = 'Bank 2'
        ParentColor = False
      end
      object Label12: TLabel
        Left = 232
        Height = 15
        Top = 260
        Width = 29
        Caption = 'BLZ 1'
        ParentColor = False
      end
      object Label13: TLabel
        Left = 232
        Height = 15
        Top = 296
        Width = 29
        Caption = 'BLZ 2'
        ParentColor = False
      end
      object FirAnrede: TDBEdit
        Left = 65
        Height = 23
        Top = 8
        Width = 185
        DataField = 'ANREDE'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 0
      end
      object FirName1: TDBEdit
        Left = 65
        Height = 23
        Top = 32
        Width = 185
        DataField = 'NAME1'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 1
      end
      object FirName2: TDBEdit
        Left = 65
        Height = 23
        Top = 56
        Width = 185
        DataField = 'NAME2'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 2
      end
      object FirName3: TDBEdit
        Left = 65
        Height = 23
        Top = 80
        Width = 185
        DataField = 'NAME3'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 3
      end
      object FirStrasse: TDBEdit
        Left = 65
        Height = 23
        Top = 104
        Width = 185
        DataField = 'STRASSE'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 4
      end
      object FirLand: TDBEdit
        Left = 65
        Height = 23
        Top = 128
        Width = 57
        DataField = 'LAND'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 5
      end
      object FirOrt: TDBEdit
        Left = 65
        Height = 23
        Top = 152
        Width = 185
        DataField = 'ORT'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 6
      end
      object FirAbsender: TDBEdit
        Left = 65
        Height = 23
        Top = 176
        Width = 185
        DataField = 'ABSENDER'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 7
      end
      object FirPLZ: TDBEdit
        Left = 153
        Height = 23
        Top = 128
        Width = 97
        DataField = 'PLZ'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 8
      end
      object FirBank1: TDBEdit
        Left = 65
        Height = 23
        Top = 252
        Width = 161
        DataField = 'BANK1_NAME'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 9
      end
      object FirdBank2: TDBEdit
        Left = 65
        Height = 23
        Top = 288
        Width = 161
        DataField = 'BANK2_NAME'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 10
      end
      object FirBLZ1: TDBEdit
        Left = 264
        Height = 23
        Top = 252
        Width = 145
        DataField = 'BANK1_BLZ'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 11
      end
      object FirBLZ2: TDBEdit
        Left = 264
        Height = 23
        Top = 288
        Width = 145
        DataField = 'BANK2_BLZ'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 12
      end
      object Label14: TLabel
        Left = 256
        Height = 15
        Top = 16
        Width = 47
        Caption = 'Telefon 1'
        ParentColor = False
      end
      object Label15: TLabel
        Left = 256
        Height = 15
        Top = 40
        Width = 47
        Caption = 'Telefon 2'
        ParentColor = False
      end
      object Label16: TLabel
        Left = 256
        Height = 15
        Top = 64
        Width = 20
        Caption = 'FAX'
        ParentColor = False
      end
      object Label17: TLabel
        Left = 256
        Height = 15
        Top = 88
        Width = 55
        Caption = 'Mobilfunk'
        ParentColor = False
      end
      object Label18: TLabel
        Left = 256
        Height = 15
        Top = 112
        Width = 29
        Caption = 'Email'
        ParentColor = False
      end
      object Label19: TLabel
        Left = 256
        Height = 15
        Top = 136
        Width = 42
        Caption = 'Website'
        ParentColor = False
      end
      object FirTele1: TDBEdit
        Left = 304
        Height = 23
        Top = 8
        Width = 128
        DataField = 'TELEFON1'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 13
      end
      object FirTele2: TDBEdit
        Left = 304
        Height = 23
        Top = 32
        Width = 128
        DataField = 'TELEFON2'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 14
      end
      object FirFax: TDBEdit
        Left = 304
        Height = 23
        Top = 56
        Width = 128
        DataField = 'FAX'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 15
      end
      object FirMobil: TDBEdit
        Left = 304
        Height = 23
        Top = 80
        Width = 128
        DataField = 'MOBILFUNK'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 16
      end
      object FirEMail: TDBEdit
        Left = 304
        Height = 23
        Top = 104
        Width = 128
        DataField = 'EMAIL'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 17
      end
      object FirWebsite: TDBEdit
        Left = 304
        Height = 23
        Top = 128
        Width = 128
        DataField = 'WEBSEITE'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 18
      end
      object FirKto1: TDBEdit
        Left = 467
        Height = 23
        Top = 252
        Width = 158
        DataField = 'BANK1_KONTONR'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 19
      end
      object FirKto2: TDBEdit
        Left = 467
        Height = 23
        Top = 288
        Width = 158
        DataField = 'BANK2_KONTONR'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 20
      end
      object FirSteuerNo: TDBEdit
        Left = 512
        Height = 23
        Top = 8
        Width = 113
        DataField = 'STEUERNUMMER'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 21
      end
      object FirUSRID: TDBEdit
        Left = 512
        Height = 23
        Top = 32
        Width = 113
        DataField = 'UST_ID'
        DataSource = DM1.FirmaDS
        MaxLength = 0
        TabOrder = 22
      end
      object Label20: TLabel
        Left = 451
        Height = 15
        Top = 16
        Width = 54
        Caption = 'Steuer-Nr.'
        ParentColor = False
      end
      object Label21: TLabel
        Left = 451
        Height = 15
        Top = 40
        Width = 36
        Caption = 'UST-ID'
        ParentColor = False
      end
      object Label22: TLabel
        Left = 416
        Height = 15
        Top = 260
        Width = 41
        Caption = 'Konto 1'
        ParentColor = False
      end
      object Label23: TLabel
        Left = 416
        Height = 15
        Top = 296
        Width = 41
        Caption = 'Konto 2'
        ParentColor = False
      end
    end
    object FirmDat2Tab: TTabSheet
      Tag = 8
      Caption = 'Firmendaten (2)'
      ClientHeight = 368
      ClientWidth = 630
      object Label24: TLabel
        Left = 8
        Height = 15
        Top = 184
        Width = 235
        Caption = 'allgemeiner Fußtext für Formulare (RTF-Text)'
        ParentColor = False
      end
      object Label25: TLabel
        Left = 8
        Height = 15
        Top = 8
        Width = 240
        Caption = 'allgemeiner Kopftext für Formulare (RTF-Text)'
        ParentColor = False
      end
      object DBRichEdit1: TDBRichMemo
        Left = 8
        Height = 152
        Top = 24
        Width = 616
        Color = clWindow
        DataField = 'KOPFTEXT'
        DataSource = DM1.FirmaDS
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
      object DBRichEdit2: TDBRichMemo
        Left = 8
        Height = 168
        Top = 200
        Width = 616
        DataField = 'FUSSTEXT'
        DataSource = DM1.FirmaDS
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
    object NumTab: TTabSheet
      Tag = 1
      Caption = 'Nummernkreis'
      ClientHeight = 368
      ClientWidth = 630
      object NumGrid: TDBGrid
        Left = 8
        Height = 356
        Top = 8
        Width = 616
        Color = clWindow
        Columns = <        
          item
            ReadOnly = True
            Title.Caption = 'Nummernkreis'
            Width = 231
            FieldName = 'NAME'
          end        
          item
            ReadOnly = True
            Title.Caption = 'QUELLE'
            Visible = False
            FieldName = 'QUELLE'
          end        
          item
            Title.Caption = 'max. Länge'
            Width = 66
            FieldName = 'MAXLEN'
          end        
          item
            Title.Caption = 'Anzeigeformat'
            Width = 111
            FieldName = 'FORMAT'
          end        
          item
            Title.Caption = 'nä. zu vergebende Nummer'
            Width = 152
            FieldName = 'NEXT_NUM'
          end>
        DataSource = NumDS
        TabOrder = 0
      end
    end
    object ZahlArtTab: TTabSheet
      Tag = 2
      Caption = 'Zahlungsarten'
      ClientHeight = 368
      ClientWidth = 630
      object DBMemo1: TDBMemo
        Left = 8
        Height = 43
        Top = 320
        Width = 616
        DataField = 'TEXT'
        DataSource = ZahlArtDS
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 8
        Height = 288
        Top = 8
        Width = 616
        Color = clWindow
        Columns = <        
          item
            ReadOnly = True
            Title.Caption = 'ID'
            Width = 116
            FieldName = 'ZAHL_ID'
          end        
          item
            Title.Caption = 'Skonto in %'
            Width = 116
            FieldName = 'SKONTO_PROZ'
          end        
          item
            Title.Caption = 'Skonto Tage'
            Width = 116
            FieldName = 'SKONTO_TAGE'
          end        
          item
            Title.Caption = 'Netto Tage'
            Width = 116
            FieldName = 'NETTO_TAGE'
          end        
          item
            Title.Caption = 'Kurztext'
            Width = 119
            FieldName = 'LANGBEZ'
          end>
        DataSource = ZahlArtDS
        TabOrder = 1
      end
      object Label26: TLabel
        Left = 8
        Height = 15
        Top = 304
        Width = 46
        Caption = 'Langtext'
        ParentColor = False
      end
    end
    object LiefArtTab: TTabSheet
      Tag = 3
      Caption = 'Lieferarten'
      ClientHeight = 368
      ClientWidth = 630
      object Label27: TLabel
        Left = 8
        Height = 15
        Top = 304
        Width = 46
        Caption = 'Langtext'
        ParentColor = False
      end
      object DBMemo2: TDBMemo
        Left = 8
        Height = 43
        Top = 320
        Width = 616
        DataField = 'TEXT'
        DataSource = LiefArtDS
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 8
        Height = 288
        Top = 8
        Width = 616
        Color = clWindow
        Columns = <        
          item
            ReadOnly = True
            Title.Caption = 'ID'
            Width = 25
            FieldName = 'LIEF_ID'
          end        
          item
            Title.Caption = 'Kurztext'
            Width = 544
            FieldName = 'LANGBEZ'
          end>
        DataSource = LiefArtDS
        TabOrder = 1
      end
    end
    object KunGrTab: TTabSheet
      Tag = 4
      Caption = 'Adressgruppen'
      ClientHeight = 368
      ClientWidth = 630
      object DBGrid3: TDBGrid
        Left = 8
        Height = 288
        Top = 8
        Width = 616
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'ID'
            Width = 26
            FieldName = 'GR'
          end        
          item
            Title.Caption = 'Beschreibung'
            Width = 544
            FieldName = 'LANGBEZ'
          end>
        DataSource = KunGrDS
        TabOrder = 0
      end
      object DBMemo3: TDBMemo
        Left = 8
        Height = 43
        Top = 320
        Width = 616
        DataField = 'SQL_STATEMENT'
        DataSource = KunGrDS
        TabOrder = 1
      end
      object Label28: TLabel
        Left = 8
        Height = 15
        Top = 305
        Width = 151
        Caption = 'SQL-Statement ohne SELECT'
        ParentColor = False
      end
    end
    object AdressenTab: TTabSheet
      Tag = 11
      Caption = 'Adressen'
      ClientHeight = 368
      ClientWidth = 630
      object AddrUserFeldGB: TGroupBox
        Left = 8
        Height = 264
        Top = 0
        Width = 232
        Caption = 'Benutzerfelder (noch nicht fertig !)'
        ClientHeight = 244
        ClientWidth = 228
        TabOrder = 0
        object ADUF1: TCheckBox
          Left = 208
          Height = 19
          Top = 2
          Width = 20
          TabOrder = 0
        end
        object ADUF2: TCheckBox
          Left = 208
          Height = 19
          Top = 26
          Width = 20
          TabOrder = 1
        end
        object ADUF3: TCheckBox
          Left = 208
          Height = 19
          Top = 50
          Width = 20
          TabOrder = 2
        end
        object ADUF4: TCheckBox
          Left = 208
          Height = 19
          Top = 74
          Width = 20
          TabOrder = 3
        end
        object ADUF5: TCheckBox
          Left = 208
          Height = 19
          Top = 98
          Width = 20
          TabOrder = 4
        end
        object ADUF6: TCheckBox
          Left = 208
          Height = 19
          Top = 123
          Width = 20
          TabOrder = 5
        end
        object ADUF7: TCheckBox
          Left = 208
          Height = 19
          Top = 144
          Width = 20
          TabOrder = 6
        end
        object ADUF8: TCheckBox
          Left = 208
          Height = 19
          Top = 168
          Width = 20
          TabOrder = 7
        end
        object ADUF9: TCheckBox
          Left = 208
          Height = 19
          Top = 194
          Width = 20
          TabOrder = 8
        end
        object ADUF10: TCheckBox
          Left = 208
          Height = 19
          Top = 218
          Width = 20
          TabOrder = 9
        end
        object AddrUserFeld1: TEdit
          Left = 8
          Height = 23
          Top = 0
          Width = 192
          TabOrder = 10
          Text = 'AddrUserFeld1'
        end
        object AddrUserFeld2: TEdit
          Left = 8
          Height = 23
          Top = 24
          Width = 192
          TabOrder = 11
          Text = 'AddrUserFeld2'
        end
        object AddrUserFeld3: TEdit
          Left = 8
          Height = 23
          Top = 48
          Width = 192
          TabOrder = 12
          Text = 'AddrUserFeld3'
        end
        object AddrUserFeld4: TEdit
          Left = 8
          Height = 23
          Top = 72
          Width = 192
          TabOrder = 13
          Text = 'AddrUserFeld4'
        end
        object AddrUserFeld5: TEdit
          Left = 8
          Height = 23
          Top = 96
          Width = 192
          TabOrder = 14
          Text = 'AddrUserFeld5'
        end
        object AddrUserFeld6: TEdit
          Left = 8
          Height = 23
          Top = 120
          Width = 192
          TabOrder = 15
          Text = 'AddrUserFeld6'
        end
        object AddrUserFeld7: TEdit
          Left = 8
          Height = 23
          Top = 144
          Width = 192
          TabOrder = 16
          Text = 'AddrUserFeld7'
        end
        object AddrUserFeld8: TEdit
          Left = 8
          Height = 23
          Top = 168
          Width = 192
          TabOrder = 17
          Text = 'AddrUserFeld8'
        end
        object AddrUserFeld9: TEdit
          Left = 8
          Height = 23
          Top = 192
          Width = 192
          TabOrder = 18
          Text = 'AddrUserFeld9'
        end
        object AddrUserFeld10: TEdit
          Left = 8
          Height = 23
          Top = 216
          Width = 192
          TabOrder = 19
          Text = 'AddrUserFeld10'
        end
      end
      object AddrAlgGB: TGroupBox
        Left = 8
        Height = 89
        Top = 272
        Width = 613
        Caption = 'Diverse'
        ClientHeight = 69
        ClientWidth = 609
        TabOrder = 1
        object Kunnum1Edi_CB: TCheckBox
          Left = 8
          Height = 19
          Top = 8
          Width = 160
          Caption = 'Kundennummer editierbar'
          TabOrder = 0
        end
      end
      object AddrMerkmalGB: TGroupBox
        Left = 264
        Height = 272
        Top = 0
        Width = 357
        Caption = 'Merkmal'
        ClientHeight = 252
        ClientWidth = 353
        TabOrder = 2
        object AddrMerkmalGrid: TDBGrid
          Left = 8
          Height = 246
          Top = 2
          Width = 336
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Nr.'
              Width = 40
              FieldName = 'MERKMAL_ID'
            end          
            item
              Title.Caption = 'Name'
              Width = 256
              FieldName = 'NAME'
            end>
          DataSource = MerkmalDS
          TabOrder = 0
        end
      end
    end
    object ArtGrTab: TTabSheet
      Tag = 5
      Caption = 'Warengruppen / Kalkulation'
      ClientHeight = 368
      ClientWidth = 630
      object DBGrid4: TDBGrid
        Left = 8
        Height = 352
        Top = 8
        Width = 296
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'Nr.'
            Width = 40
            FieldName = 'ID'
          end        
          item
            Title.Caption = 'Beschreibung'
            Width = 220
            FieldName = 'NAME'
          end>
        DataSource = ArtGrDS
        TabOrder = 0
      end
      object Label29: TLabel
        Left = 320
        Height = 15
        Top = 11
        Width = 19
        Caption = 'Nr.:'
        ParentColor = False
      end
      object Label30: TLabel
        Left = 320
        Height = 15
        Top = 40
        Width = 75
        Caption = 'Beschreibung:'
        ParentColor = False
      end
      object Label31: TLabel
        Left = 320
        Height = 15
        Top = 64
        Width = 112
        Caption = 'überg. Warengruppe:'
        ParentColor = False
      end
      object Label32: TLabel
        Left = 320
        Height = 15
        Top = 120
        Width = 128
        Caption = 'Default Aufwandskonto:'
        ParentColor = False
      end
      object Label33: TLabel
        Left = 320
        Height = 15
        Top = 144
        Width = 100
        Caption = 'Default Erlöskonto:'
        ParentColor = False
      end
      object Label34: TLabel
        Left = 320
        Height = 15
        Top = 190
        Width = 77
        Caption = 'Default MwSt.:'
        ParentColor = False
      end
      object Label35: TLabel
        Left = 320
        Height = 15
        Top = 251
        Width = 121
        Caption = 'Kalkulationsfaktor VK1:'
        ParentColor = False
      end
      object Label36: TLabel
        Left = 320
        Height = 15
        Top = 275
        Width = 121
        Caption = 'Kalkulationsfaktor VK2:'
        ParentColor = False
      end
      object Label37: TLabel
        Left = 320
        Height = 15
        Top = 299
        Width = 121
        Caption = 'Kalkulationsfaktor VK3:'
        ParentColor = False
      end
      object Label38: TLabel
        Left = 320
        Height = 15
        Top = 323
        Width = 121
        Caption = 'Kalkulationsfaktor VK4:'
        ParentColor = False
      end
      object Label39: TLabel
        Left = 320
        Height = 15
        Top = 347
        Width = 121
        Caption = 'Kalkulationsfaktor VK5:'
        ParentColor = False
      end
      object WGNumEdi: TDBEdit
        Left = 440
        Height = 23
        Top = 8
        Width = 184
        DataField = 'ID'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 1
      end
      object WGDescEdi: TDBEdit
        Left = 440
        Height = 23
        Top = 32
        Width = 184
        DataField = 'NAME'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 2
      end
      object WGTopGRCB: TDBLookupComboBox
        Left = 440
        Height = 23
        Top = 56
        Width = 184
        DataField = 'TOP_ID'
        DataSource = ArtGrDS
        KeyField = 'ID'
        ListField = 'NAME'
        ListFieldIndex = 0
        ListSource = WgrLo
        LookupCache = False
        TabOrder = 3
      end
      object NoTopWgrBtn: TBitBtn
        Left = 440
        Height = 24
        Top = 80
        Width = 184
        Caption = 'Keine übergeordnete Warengruppe'
        OnClick = NoTopWgrBtnClick
        TabOrder = 4
      end
      object WgrDefAKtoEdi: TDBEdit
        Left = 440
        Height = 23
        Top = 112
        Width = 184
        DataField = 'DEF_AKTO'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 5
      end
      object WgrDefEKtoEdi: TDBEdit
        Left = 440
        Height = 23
        Top = 136
        Width = 184
        DataField = 'DEF_EKTO'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 6
      end
      object WgrClac1Edi: TDBEdit
        Left = 440
        Height = 23
        Top = 243
        Width = 184
        DataField = 'VK1_FAKTOR'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 8
      end
      object WgrClac2Edi: TDBEdit
        Left = 440
        Height = 23
        Top = 267
        Width = 184
        DataField = 'VK2_FAKTOR'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 9
      end
      object WgrClac3Edi: TDBEdit
        Left = 440
        Height = 23
        Top = 291
        Width = 184
        DataField = 'VK3_FAKTOR'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 10
      end
      object WgrClac4Edi: TDBEdit
        Left = 440
        Height = 23
        Top = 315
        Width = 184
        DataField = 'VK4_FAKTOR'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 11
      end
      object WgrClac5Edi: TDBEdit
        Left = 440
        Height = 23
        Top = 339
        Width = 184
        DataField = 'VK5_FAKTOR'
        DataSource = ArtGrDS
        MaxLength = 0
        TabOrder = 12
      end
      object WgrDefSteuer: TRxDBComboBox
        Left = 440
        Height = 23
        Top = 184
        Width = 184
        AutoSize = False
        Style = csDropDownList
        Color = clWhite
        DataField = 'STEUER_CODE'
        DataSource = ArtGrDS
        EnableValues = True
        ItemHeight = 15
        MaxLength = 0
        TabOrder = 7
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
        )
      end
    end
    object ArtikelTab: TTabSheet
      Tag = 12
      Caption = 'Artikel'
      ClientHeight = 368
      ClientWidth = 630
      object ArtUserFeldGB: TGroupBox
        Left = 8
        Height = 264
        Top = 0
        Width = 232
        Caption = ' Benutzerfelder '
        ClientHeight = 244
        ClientWidth = 228
        TabOrder = 0
        object ArtUserFeld1: TEdit
          Left = 8
          Height = 23
          Top = 0
          Width = 192
          TabOrder = 0
          Text = 'ArtUserFeld1'
        end
        object ArtUserFeld2: TEdit
          Left = 8
          Height = 23
          Top = 24
          Width = 192
          TabOrder = 1
          Text = 'ArtUserFeld2'
        end
        object ArtUserFeld3: TEdit
          Left = 8
          Height = 23
          Top = 48
          Width = 192
          TabOrder = 2
          Text = 'ArtUserFeld3'
        end
        object ArtUserFeld4: TEdit
          Left = 8
          Height = 23
          Top = 72
          Width = 192
          TabOrder = 3
          Text = 'ArtUserFeld4'
        end
        object ArtUserFeld5: TEdit
          Left = 8
          Height = 23
          Top = 96
          Width = 192
          TabOrder = 4
          Text = 'ArtUserFeld5'
        end
        object ArtUserFeld6: TEdit
          Left = 8
          Height = 23
          Top = 120
          Width = 192
          TabOrder = 5
          Text = 'ArtUserFeld6'
        end
        object ArtUserFeld7: TEdit
          Left = 8
          Height = 23
          Top = 144
          Width = 192
          TabOrder = 6
          Text = 'ArtUserFeld7'
        end
        object ArtUserFeld8: TEdit
          Left = 8
          Height = 23
          Top = 168
          Width = 192
          TabOrder = 7
          Text = 'ArtUserFeld8'
        end
        object ArtUserFeld9: TEdit
          Left = 8
          Height = 23
          Top = 192
          Width = 192
          TabOrder = 8
          Text = 'ArtUserFeld9'
        end
        object ArtUserFeld10: TEdit
          Left = 8
          Height = 23
          Top = 216
          Width = 192
          TabOrder = 9
          Text = 'ArtUserFeld10'
        end
        object ARUF1: TCheckBox
          Left = 208
          Height = 19
          Top = 2
          Width = 20
          TabOrder = 10
        end
        object ARUF2: TCheckBox
          Left = 208
          Height = 19
          Top = 26
          Width = 20
          TabOrder = 11
        end
        object ARUF3: TCheckBox
          Left = 208
          Height = 19
          Top = 50
          Width = 20
          TabOrder = 12
        end
        object ARUF4: TCheckBox
          Left = 208
          Height = 19
          Top = 74
          Width = 20
          TabOrder = 13
        end
        object ARUF5: TCheckBox
          Left = 208
          Height = 19
          Top = 98
          Width = 20
          TabOrder = 14
        end
        object ARUF6: TCheckBox
          Left = 208
          Height = 19
          Top = 122
          Width = 20
          TabOrder = 15
        end
        object ARUF7: TCheckBox
          Left = 208
          Height = 19
          Top = 146
          Width = 20
          TabOrder = 16
        end
        object ARUF8: TCheckBox
          Left = 208
          Height = 19
          Top = 170
          Width = 20
          TabOrder = 17
        end
        object ARUF9: TCheckBox
          Left = 208
          Height = 19
          Top = 194
          Width = 20
          TabOrder = 18
        end
        object ARUF10: TCheckBox
          Left = 207
          Height = 19
          Top = 218
          Width = 20
          TabOrder = 19
        end
      end
      object ArtMerkmalGB: TGroupBox
        Left = 264
        Height = 264
        Top = 0
        Width = 357
        Caption = 'Merkmale'
        TabOrder = 1
      end
      object GroupBox7: TGroupBox
        Left = 8
        Height = 89
        Top = 272
        Width = 613
        Caption = 'Diverses'
        ClientHeight = 69
        ClientWidth = 609
        TabOrder = 2
        object ArtnumAutoCB: TCheckBox
          Left = 10
          Height = 19
          Top = 8
          Width = 340
          Caption = 'Artikelnummer autom. vergeben (wenn leer beim Speichern)'
          TabOrder = 0
        end
        object AnzPreisCB: TComboBox
          Left = 100
          Height = 23
          Top = 32
          Width = 100
          ItemHeight = 15
          Items.Strings = (
            '2'
            '3'
            '4'
            '5'
          )
          TabOrder = 1
          Text = 'AnzPreisCB'
        end
        object Label40: TLabel
          Left = 10
          Height = 15
          Top = 40
          Width = 95
          Caption = 'Anzahl VK-Preise :'
          ParentColor = False
        end
        object BRRundWert: TFloatSpinEdit
          Left = 528
          Height = 23
          Top = 6
          Width = 74
          Increment = 0.01
          MaxValue = 999
          MinValue = 0.01
          TabOrder = 2
          Value = 0.01
        end
        object BN_CalcSchranke: TFloatSpinEdit
          Left = 528
          Height = 23
          Top = 32
          Width = 74
          Increment = 0.01
          MaxValue = 999
          MinValue = 0.01
          TabOrder = 3
          Value = 0.01
        end
        object Label41: TLabel
          Left = 392
          Height = 15
          Top = 14
          Width = 146
          Caption = 'Bruttopreis-Rundungswert :'
          ParentColor = False
        end
        object Label42: TLabel
          Left = 391
          Height = 15
          Top = 40
          Width = 155
          Caption = 'max. Brutto-Netto-Differenz :'
          ParentColor = False
        end
      end
    end
    object FirKontenTab: TTabSheet
      Tag = 6
      Caption = 'Firmen-Konten'
      ClientHeight = 368
      ClientWidth = 630
      object DividerBevel1: TDividerBevel
        Left = 0
        Height = 13
        Top = 88
        Width = 624
        Caption = 'Konten-Liste'
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 96
        Height = 23
        Top = 8
        Width = 289
        DataField = 'KURZBEZ'
        DataSource = FirKontenDS
        MaxLength = 0
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 96
        Height = 23
        Top = 32
        Width = 289
        DataField = 'INHABER'
        DataSource = FirKontenDS
        MaxLength = 0
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 466
        Height = 23
        Top = 8
        Width = 152
        DataField = 'KTONR'
        DataSource = FirKontenDS
        MaxLength = 0
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 466
        Height = 23
        Top = 32
        Width = 152
        DataField = 'BLZ'
        DataSource = FirKontenDS
        MaxLength = 0
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 466
        Height = 23
        Top = 56
        Width = 152
        DataField = 'FIBU_KTO'
        DataSource = FirKontenDS
        MaxLength = 0
        TabOrder = 4
      end
      object Label43: TLabel
        Left = 8
        Height = 13
        Top = 16
        Width = 82
        AutoSize = False
        Caption = 'Kurzbezeichnung'
        ParentColor = False
      end
      object Label44: TLabel
        Left = 8
        Height = 13
        Top = 40
        Width = 82
        AutoSize = False
        Caption = 'Inhaber'
        ParentColor = False
      end
      object Label45: TLabel
        Left = 392
        Height = 13
        Top = 16
        Width = 72
        AutoSize = False
        Caption = 'Konto'
        ParentColor = False
      end
      object Label46: TLabel
        Left = 392
        Height = 13
        Top = 40
        Width = 72
        AutoSize = False
        Caption = 'Bankleitzeit'
        ParentColor = False
      end
      object Label47: TLabel
        Left = 392
        Height = 13
        Top = 64
        Width = 72
        AutoSize = False
        Caption = 'FIBU-Konto'
        ParentColor = False
      end
      object FirKtoGrid: TDBGrid
        Left = 8
        Height = 252
        Top = 112
        Width = 610
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'KURZBEZ'
            FieldName = 'KURZBEZ'
          end        
          item
            Title.Caption = 'INHABER'
            FieldName = 'INHABER'
          end        
          item
            Title.Caption = 'BLZ'
            FieldName = 'BLZ'
          end        
          item
            Title.Caption = 'KTONR'
            FieldName = 'KTONR'
          end        
          item
            Title.Caption = 'FIBU_KTO'
            FieldName = 'FIBU_KTO'
          end>
        DataSource = FirKontenDS
        TabOrder = 5
      end
    end
    object EMailTab: TTabSheet
      Tag = 13
      Caption = 'EMail / Belege'
      ClientHeight = 368
      ClientWidth = 630
      object Label48: TLabel
        Left = 8
        Height = 15
        Top = 8
        Width = 29
        Caption = 'Beleg'
        ParentColor = False
      end
      object Label49: TLabel
        Left = 208
        Height = 15
        Top = 11
        Width = 104
        Caption = 'Betreff für die eMail'
        ParentColor = False
      end
      object Label50: TLabel
        Left = 210
        Height = 15
        Top = 56
        Width = 85
        Caption = 'Nachrichtentext'
        ParentColor = False
      end
      object BelegLB: TListBox
        Left = 8
        Height = 344
        Top = 24
        Width = 180
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Items.Strings = (
          'Angebot'
          'Rechnung'
          'Lieferschein'
          'EK-Bestellung'
          'Mahnung'
          'Textverarbeitung'
        )
        ItemHeight = 16
        OnClick = BelegLBClick
        ParentFont = False
        TabOrder = 0
      end
      object EMailBetreff: TEdit
        Left = 208
        Height = 23
        Top = 24
        Width = 408
        TabOrder = 1
        Text = 'EMailBetreff'
      end
      object eMailBodyMemo: TMemo
        Left = 210
        Height = 296
        Top = 72
        Width = 406
        Lines.Strings = (
          'eMailBodyMemo'
        )
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object PfadTS: TTabSheet
      Tag = 14
      Caption = 'Verzeichnisse'
      ClientHeight = 368
      ClientWidth = 630
      object Label51: TLabel
        Left = 28
        Height = 15
        Top = 32
        Width = 83
        Caption = 'Datensicherung'
        ParentColor = False
      end
      object Label52: TLabel
        Left = 28
        Height = 15
        Top = 64
        Width = 29
        Caption = 'Temp'
        ParentColor = False
      end
      object Label53: TLabel
        Left = 28
        Height = 15
        Top = 95
        Width = 20
        Caption = 'DTA'
        ParentColor = False
      end
      object Label54: TLabel
        Left = 28
        Height = 15
        Top = 126
        Width = 66
        Caption = 'Export / PDF'
        ParentColor = False
      end
      object Label55: TLabel
        Left = 28
        Height = 15
        Top = 157
        Width = 36
        Caption = 'Import'
        ParentColor = False
      end
      object BackupDirEdi: TDirectoryEdit
        Left = 112
        Height = 23
        Top = 25
        Width = 456
        ShowHidden = False
        ButtonWidth = 23
        NumGlyphs = 1
        MaxLength = 0
        TabOrder = 0
      end
      object TempDirEdi: TDirectoryEdit
        Left = 112
        Height = 23
        Top = 56
        Width = 456
        ShowHidden = False
        ButtonWidth = 23
        NumGlyphs = 1
        MaxLength = 0
        TabOrder = 1
      end
      object DTADirEdi: TDirectoryEdit
        Left = 112
        Height = 23
        Top = 87
        Width = 456
        ShowHidden = False
        ButtonWidth = 23
        NumGlyphs = 1
        MaxLength = 0
        TabOrder = 2
      end
      object ExportDirEdi: TDirectoryEdit
        Left = 112
        Height = 23
        Top = 118
        Width = 456
        ShowHidden = False
        ButtonWidth = 23
        NumGlyphs = 1
        MaxLength = 0
        TabOrder = 3
      end
      object ImportDirEdi: TDirectoryEdit
        Left = 112
        Height = 23
        Top = 149
        Width = 456
        ShowHidden = False
        ButtonWidth = 23
        NumGlyphs = 1
        MaxLength = 0
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Tag = 17
      Caption = 'Fibu'
      ClientHeight = 368
      ClientWidth = 630
      object FibuModeGB: TRadioGroup
        Left = 8
        Height = 65
        Top = 8
        Width = 200
        AutoFill = True
        Caption = 'Fibu-Modus'
        ChildSizing.LeftRightSpacing = 6
        ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
        ChildSizing.EnlargeVertical = crsHomogenousChildResize
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 1
        ClientHeight = 45
        ClientWidth = 196
        Items.Strings = (
          'Bilanzbuchhaltung'
          'Einnahmen-Überschussrechnung '
        )
        OnClick = FibuModeGBClick
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 10
        Height = 137
        Top = 88
        Width = 198
        Caption = 'Anwendung'
        ClientHeight = 117
        ClientWidth = 194
        TabOrder = 1
        object FibuTypCB: TComboBox
          Left = 8
          Height = 23
          Top = 5
          Width = 176
          Color = clWindow
          ItemHeight = 15
          Items.Strings = (
            'Universeller Export (CSV)'
            'IBM-FIBU'
          )
          OnChange = FibuTypCBChange
          Style = csDropDownList
          TabOrder = 0
        end
        object FibuDosCB: TCheckBox
          Left = 8
          Height = 19
          Top = 32
          Width = 177
          AutoSize = False
          Caption = 'DOS-Anwendung'
          TabOrder = 1
        end
        object FibuExportFNCB: TCheckBox
          Left = 8
          Height = 19
          Top = 48
          Width = 176
          AutoSize = False
          Caption = 'incl. Feldnamen'
          TabOrder = 2
        end
        object FibuExportHKCB: TCheckBox
          Left = 8
          Height = 19
          Top = 64
          Width = 176
          AutoSize = False
          Caption = 'Text in Hochkommas'
          TabOrder = 3
        end
        object TrennzeichenCB: TComboBox
          Left = 85
          Height = 23
          Top = 88
          Width = 100
          ItemHeight = 15
          Items.Strings = (
            ';'
            ','
            'TAB'
          )
          Style = csDropDownList
          TabOrder = 4
        end
        object TrennzeichenLab: TLabel
          Left = 8
          Height = 15
          Top = 96
          Width = 69
          Caption = 'Trennzeichen'
          ParentColor = False
        end
      end
      object AufwKtoIN: TcyEditInteger
        Left = 328
        Height = 23
        Top = 24
        Width = 80
        Alignment = taRightJustify
        TabOrder = 2
        Text = '0'
      end
      object ErloesKtoIN: TcyEditInteger
        Left = 328
        Height = 23
        Top = 48
        Width = 80
        Alignment = taRightJustify
        TabOrder = 3
        Text = '0'
      end
      object FordLLKto: TcyEditInteger
        Left = 328
        Height = 23
        Top = 72
        Width = 80
        Alignment = taRightJustify
        TabOrder = 4
        Text = '0'
      end
      object VerbLLKto: TcyEditInteger
        Left = 328
        Height = 23
        Top = 96
        Width = 80
        Alignment = taRightJustify
        TabOrder = 5
        Text = '0'
      end
      object AufwKtoEU: TcyEditInteger
        Left = 432
        Height = 23
        Top = 24
        Width = 80
        Alignment = taRightJustify
        TabOrder = 6
        Text = '0'
      end
      object ErloesKtoEU: TcyEditInteger
        Left = 432
        Height = 23
        Top = 48
        Width = 80
        Alignment = taRightJustify
        TabOrder = 7
        Text = '0'
      end
      object AufwKtoAU: TcyEditInteger
        Left = 536
        Height = 23
        Top = 24
        Width = 80
        Alignment = taRightJustify
        TabOrder = 8
        Text = '0'
      end
      object ErloesKtoAU: TcyEditInteger
        Left = 536
        Height = 23
        Top = 48
        Width = 80
        Alignment = taRightJustify
        TabOrder = 9
        Text = '0'
      end
      object KasseKto: TcyEditInteger
        Left = 536
        Height = 23
        Top = 72
        Width = 80
        Alignment = taRightJustify
        TabOrder = 10
        Text = '0'
      end
      object ScheckKto: TcyEditInteger
        Left = 536
        Height = 23
        Top = 96
        Width = 80
        Alignment = taRightJustify
        TabOrder = 11
        Text = '0'
      end
      object BankKto: TcyEditInteger
        Left = 536
        Height = 23
        Top = 120
        Width = 80
        Alignment = taRightJustify
        TabOrder = 12
        Text = '0'
      end
      object Label57: TLabel
        Left = 216
        Height = 15
        Top = 32
        Width = 122
        Caption = 'Default-Aufwandkonto'
        ParentColor = False
      end
      object Label58: TLabel
        Left = 216
        Height = 15
        Top = 56
        Width = 99
        Caption = 'Default-Erlöskonto'
        ParentColor = False
      end
      object FordLLLab: TLabel
        Left = 216
        Height = 15
        Top = 78
        Width = 114
        Caption = 'Forderungen aus L&&L'
        ParentColor = False
      end
      object VerbLLLab: TLabel
        Left = 216
        Height = 15
        Top = 104
        Width = 114
        Caption = 'Verbindlichk. aus L&&L'
        ParentColor = False
      end
      object Label61: TLabel
        Left = 328
        Height = 15
        Top = 8
        Width = 33
        Caption = 'Inland'
        ParentColor = False
      end
      object Label62: TLabel
        Left = 432
        Height = 15
        Top = 8
        Width = 14
        Caption = 'EU'
        ParentColor = False
      end
      object Label63: TLabel
        Left = 536
        Height = 15
        Top = 8
        Width = 43
        Caption = 'Ausland'
        ParentColor = False
      end
      object Label64: TLabel
        Left = 483
        Height = 15
        Top = 80
        Width = 29
        Caption = 'Kasse'
        ParentColor = False
      end
      object Label65: TLabel
        Left = 483
        Height = 15
        Top = 104
        Width = 37
        Caption = 'Scheck'
        ParentColor = False
      end
      object Label66: TLabel
        Left = 483
        Height = 15
        Top = 128
        Width = 26
        Caption = 'Bank'
        ParentColor = False
      end
    end
    object TabSheet1: TTabSheet
      Tag = 15
      Caption = 'Erlösgruppen'
      ClientHeight = 368
      ClientWidth = 630
      object ErloesGrGrid: TDBGrid
        Left = 8
        Height = 360
        Top = 8
        Width = 616
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'Erlösgruppe'
            Width = 90
            FieldName = 'ERLOESGRUPPE'
          end        
          item
            Title.Caption = 'Inland'
            Width = 60
            FieldName = 'KTO_INLAND'
          end        
          item
            Title.Caption = 'EU'
            Width = 60
            FieldName = 'KTO_EU'
          end        
          item
            Title.Caption = 'Ausland'
            Width = 60
            FieldName = 'KTO_AUSLAND'
          end        
          item
            Title.Caption = 'Beschreibung'
            Width = 300
            FieldName = 'BESCHREIBUNG'
          end>
        DataSource = FibuErloesKtoDS
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Tag = 16
      Caption = 'Aufwandsgr.'
      ClientHeight = 368
      ClientWidth = 630
      object AufwGrGrid: TDBGrid
        Left = 8
        Height = 360
        Top = 8
        Width = 616
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'Aufandsgruppe'
            Width = 90
            FieldName = 'AUFWANDSGRUPPE'
          end        
          item
            Title.Caption = 'Inland'
            Width = 60
            FieldName = 'KTO_INLAND'
          end        
          item
            Title.Caption = 'EU'
            Width = 60
            FieldName = 'KTO_EU'
          end        
          item
            Title.Caption = 'Ausland'
            Width = 60
            FieldName = 'KTO_AUSLAND'
          end        
          item
            Title.Caption = 'Beschreibung'
            Width = 300
            FieldName = 'BESCHREIBUNG'
          end>
        DataSource = FibuAufwKtoDS
        TabOrder = 0
      end
    end
  end
  object FibuAufwKtoDS: TDataSource
    DataSet = FibuAufwKtoTab
    Left = 320
    Top = 288
  end
  object FibuAufwKtoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = FibuAufwKtoTabBeforePost
    SQL.Strings = (
      'select '
      'MAINKEY, '
      'NAME as AUFWANDSGRUPPE, '
      'VAL_INT as KTO_INLAND, '
      'VAL_INT2 as KTO_EU, '
      'VAL_INT3 as KTO_AUSLAND,'
      'VAL_CHAR as BESCHREIBUNG'
      'from REGISTERY'
      'where MAINKEY=''MAIN\\FIBU\\AUFWANDSGRUPPEN'''
    )
    Params = <>
    Left = 232
    Top = 288
  end
  object MerkmalTab: TZQuery
    Connection = DM1.DB1
    BeforeDelete = MerkmalTabBeforeDelete
    SQL.Strings = (
      'select * from ADRESSEN_MERK'
      'order by MERKMAL_ID ASC'
    )
    Params = <>
    Left = 168
    Top = 336
    object MerkmalTabMERKMAL_ID: TZIntegerField
      DisplayLabel = 'Nr.'
      DisplayWidth = 4
      FieldKind = fkData
      FieldName = 'MERKMAL_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0000'
      EditFormat = '0'
    end
    object MerkmalTabNAME: TZRawStringField
      DisplayLabel = 'Name'
      DisplayWidth = 50
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 100
    end
  end
  object FibuErloesKtoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = FibuErloesKtoTabBeforePost
    SQL.Strings = (
      'select '
      'MAINKEY, '
      'NAME as ERLOESGRUPPE, '
      'VAL_INT as KTO_INLAND, '
      'VAL_INT2 as KTO_EU, '
      'VAL_INT3 as KTO_AUSLAND,'
      'VAL_CHAR as BESCHREIBUNG'
      'from REGISTERY'
      'where MAINKEY=''MAIN\\FIBU\\ERLOESGRUPPEN'''
    )
    Params = <>
    Left = 232
    Top = 240
  end
  object WgrLoTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select ID, NAME from WARENGRUPPEN'
      'where ID !=:ID'
      'order by NAME'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '-1'
      end>
    Left = 40
    Top = 336
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '-1'
      end>
  end
  object LiefArtDS: TDataSource
    OnDataChange = LiefArtDSDataChange
    Left = 40
    Top = 240
  end
  object ArtGrDS: TDataSource
    OnDataChange = ArtGrDSDataChange
    Left = 40
    Top = 288
  end
  object KunGrDS: TDataSource
    Left = 112
    Top = 240
  end
  object NumDS: TDataSource
    Left = 112
    Top = 288
  end
  object WgrLo: TDataSource
    DataSet = WgrLoTab
    Left = 112
    Top = 336
  end
  object ZahlArtDS: TDataSource
    Left = 168
    Top = 240
  end
  object FirKontenDS: TDataSource
    Left = 168
    Top = 288
  end
  object FibuErloesKtoDS: TDataSource
    DataSet = FibuErloesKtoTab
    Left = 320
    Top = 240
  end
  object MerkmalDS: TDataSource
    DataSet = MerkmalTab
    Left = 232
    Top = 336
  end
end
