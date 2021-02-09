object ZEForm: TZEForm
  Left = 387
  Height = 364
  Top = 256
  Width = 487
  HelpContext = 100250
  BorderStyle = bsDialog
  Caption = 'Zahlungseingang'
  ClientHeight = 364
  ClientWidth = 487
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object Panel1: TPanel
    Left = 0
    Height = 364
    Top = 0
    Width = 252
    Align = alLeft
    BevelOuter = bvNone
    ClientHeight = 364
    ClientWidth = 252
    Color = clInfoBk
    ParentColor = False
    TabOrder = 0
    object KunDatGB: TGroupBox
      Left = 0
      Height = 162
      Top = 0
      Width = 252
      Align = alTop
      Caption = 'Kundendaten'
      ClientHeight = 144
      ClientWidth = 248
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object DBText9: TDBText
        Left = 64
        Height = 13
        Top = 8
        Width = 76
        AutoSize = False
        DataField = 'KUN_NUM'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText1: TDBText
        Tag = 1
        Left = 64
        Height = 13
        Top = 32
        Width = 181
        AutoSize = False
        DataField = 'KUN_ANREDE'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText2: TDBText
        Tag = 1
        Left = 64
        Height = 13
        Top = 48
        Width = 181
        AutoSize = False
        DataField = 'KUN_NAME1'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText3: TDBText
        Tag = 1
        Left = 64
        Height = 13
        Top = 64
        Width = 181
        AutoSize = False
        DataField = 'KUN_NAME2'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText4: TDBText
        Tag = 1
        Left = 64
        Height = 13
        Top = 80
        Width = 181
        AutoSize = False
        DataField = 'KUN_NAME3'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText5: TDBText
        Tag = 1
        Left = 64
        Height = 13
        Top = 96
        Width = 181
        AutoSize = False
        DataField = 'KUN_STRASSE'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText6: TDBText
        Left = 64
        Height = 13
        Top = 112
        Width = 14
        AutoSize = False
        DataField = 'KUN_LAND'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText7: TDBText
        Left = 80
        Height = 13
        Top = 112
        Width = 35
        AutoSize = False
        DataField = 'KUN_PLZ'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText8: TDBText
        Tag = 1
        Left = 120
        Height = 13
        Top = 112
        Width = 125
        AutoSize = False
        DataField = 'KUN_ORT'
        DataSource = JoDS
        ParentColor = False
      end
      object DBText10: TDBText
        Tag = 1
        Left = 64
        Height = 13
        Top = 128
        Width = 181
        AutoSize = False
        DataField = 'GEGENKONTO'
        DataSource = JoDS
        ParentColor = False
      end
      object Label5: TLabel
        Left = 5
        Height = 13
        Top = 8
        Width = 52
        Caption = 'Kundennr.:'
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
        Top = 32
        Width = 37
        Caption = 'Anrede:'
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
        Top = 48
        Width = 31
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
        Top = 96
        Width = 34
        Caption = 'Straße:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 5
        Height = 13
        Top = 112
        Width = 42
        Caption = 'PLZ/Ort:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 5
        Height = 13
        Top = 128
        Width = 42
        Caption = 'G-Konto:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
    end
    object InfoGB: TGroupBox
      Left = 0
      Height = 202
      Top = 162
      Width = 252
      Align = alClient
      Caption = 'Info'
      ClientHeight = 184
      ClientWidth = 248
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label13: TLabel
        Left = 5
        Height = 13
        Top = 14
        Width = 90
        Caption = 'Rechnungsdatum: '
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 5
        Height = 13
        Top = 38
        Width = 102
        Caption = 'Zieldatum mit Skonto:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 5
        Height = 13
        Top = 64
        Width = 84
        Caption = 'Ziel ohne Skonto:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 5
        Height = 13
        Top = 88
        Width = 44
        Caption = 'Fälligkeit:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 5
        Height = 13
        Top = 112
        Width = 71
        Caption = 'Skonto-Betrag:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label18: TLabel
        Left = 5
        Height = 13
        Top = 136
        Width = 155
        Caption = 'Anzahlung / Teilzahlung gezahlt:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label19: TLabel
        Left = 5
        Height = 13
        Top = 160
        Width = 147
        Caption = 'verbleibender Restbetrag:'
        ParentColor = False
      end
      object DBText11: TDBText
        Left = 168
        Height = 13
        Top = 14
        Width = 77
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'RDATUM'
        DataSource = JoDS
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object SkontoDatLab: TLabel
        Tag = 1
        Left = 112
        Height = 13
        Top = 38
        Width = 133
        Alignment = taRightJustify
        AutoSize = False
        Caption = '11.12.2001'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object NettoDatLab: TLabel
        Left = 168
        Height = 13
        Top = 64
        Width = 77
        Alignment = taRightJustify
        AutoSize = False
        Caption = '11.12.2001'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object FaelligTage: TLabel
        Left = 168
        Height = 13
        Top = 88
        Width = 77
        Alignment = taRightJustify
        AutoSize = False
        Caption = '100 Tage'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object SkontoBetLab: TLabel
        Left = 168
        Height = 13
        Top = 112
        Width = 77
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.234,56 €'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object AnzahlungLab: TLabel
        Left = 168
        Height = 13
        Top = 136
        Width = 77
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.234,56 €'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object RestLab: TLabel
        Left = 168
        Height = 13
        Top = 160
        Width = 77
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.234,56 €'
        ParentColor = False
      end
    end
  end
  object Panel2: TPanel
    Left = 252
    Height = 364
    Top = 0
    Width = 235
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 364
    ClientWidth = 235
    Color = clInfoBk
    ParentColor = False
    TabOrder = 1
    object CaoGroupBox1: TGroupBox
      Left = 0
      Height = 364
      Top = 0
      Width = 235
      Align = alClient
      Caption = 'Zahlung'
      ClientHeight = 346
      ClientWidth = 231
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label7: TLabel
        Left = 5
        Height = 13
        Top = 8
        Width = 104
        Caption = 'Rechnungsbetrag:'
        ParentColor = False
      end
      object SkontoCB: TCheckBox
        Tag = 1
        Left = 5
        Height = 19
        Top = 26
        Width = 220
        Alignment = taLeftJustify
        Anchors = [akTop, akLeft, akRight]
        AutoSize = False
        Caption = 'Skonto'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = SkontoCBClick
        ParentFont = False
        TabOrder = 0
      end
      object Label8: TLabel
        Left = 5
        Height = 13
        Top = 56
        Width = 59
        Caption = 'Skonto in %:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 5
        Height = 13
        Top = 80
        Width = 71
        Caption = 'Skonto Betrag:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object SKBetrag: TLabel
        Tag = 1
        Left = 135
        Height = 13
        Top = 80
        Width = 90
        Alignment = taRightJustify
        Anchors = [akTop, akLeft, akRight]
        AutoSize = False
        Caption = 'SKBetrag'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object Label10: TLabel
        Left = 5
        Height = 13
        Top = 103
        Width = 80
        Caption = 'gezahlter Betrag:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object DiffLab: TLabel
        Left = 5
        Height = 13
        Top = 128
        Width = 111
        Caption = 'Differenz (Teilzahlung) :'
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object DiffBetrag: TLabel
        Left = 120
        Height = 13
        Top = 128
        Width = 105
        Alignment = taRightJustify
        Anchors = [akTop, akLeft, akRight]
        AutoSize = False
        Caption = 'DiffBetrag'
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object Label11: TLabel
        Left = 5
        Height = 13
        Top = 156
        Width = 83
        Caption = 'Buchungsdatum :'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object RBetrag: TLabel
        Tag = 1
        Left = 112
        Height = 13
        Top = 8
        Width = 113
        Alignment = taRightJustify
        Anchors = [akTop, akLeft, akRight]
        AutoSize = False
        Caption = 'RBetrag'
        ParentColor = False
      end
      object Label12: TLabel
        Left = 5
        Height = 13
        Top = 180
        Width = 59
        Caption = 'Zahlungsart:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object KontoLab: TLabel
        Left = 5
        Height = 13
        Top = 204
        Width = 31
        Caption = 'Konto:'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
      end
      object BuchenBtn: TBitBtn
        Left = 16
        Height = 41
        Top = 256
        Width = 202
        Caption = '&Buchen'
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
        OnClick = BuchenBtnClick
        ParentFont = False
        TabOrder = 5
      end
      object BitBtn2: TBitBtn
        Left = 16
        Height = 31
        Top = 304
        Width = 202
        Cancel = True
        Caption = 'Abbrechen'
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
        ModalResult = 3
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
      end
      object SkontoProz: TRxSpinEdit
        Tag = 1
        Left = 96
        Height = 21
        Top = 51
        Width = 109
        Alignment = taRightJustify
        MaxValue = 100
        Color = clWindow
        Enabled = False
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Anchors = [akTop, akLeft, akRight]
        ParentFont = False
        TabOrder = 1
        OnBottomClick = SkontoProzChange
        OnTopClick = SkontoProzChange
        OnChange = SkontoProzChange
        OnExit = SkontoProzChange
        OnKeyDown = SkontoProzKeyUp
        OnKeyUp = SkontoProzKeyUp
      end
      object IST_BETRAG: TDBEdit
        Tag = 1
        Left = 96
        Height = 21
        Top = 96
        Width = 129
        DataField = 'IST_BETRAG'
        DataSource = JoDS
        Color = clWindow
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        MaxLength = 0
        ParentFont = False
        TabOrder = 2
        OnChange = IST_BETRAGChange
      end
      object DBDateEdit1: TRxDBDateEdit
        Tag = 1
        Left = 96
        Height = 21
        Top = 152
        Width = 129
        Anchors = [akTop, akLeft, akRight]
        ButtonWidth = 23
        DialogTitle = 'Select a Date'
        Enabled = False
        MaxLength = 10
        PasswordChar = #0
        PopupAlign = epaRight
        PopupColor = clWindow
        TabOrder = 3
        Text = '  .  .    '
        YearDigits = dyFour
        DataField = 'IST_ZAHLDAT'
        DataSource = JoDS
      end
      object ZahlartCB: TDBLookupComboBox
        Tag = 1
        Left = 96
        Height = 21
        Top = 176
        Width = 129
        Anchors = [akTop, akLeft, akRight]
        Color = clWindow
        DataField = 'ZAHLART'
        DataSource = JoDS
        DropDownCount = 10
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        KeyField = 'LANGBEZ'
        ListField = 'ZAHL_ID'
        ListFieldIndex = 0
        ListSource = DM1.ZahlartDS
        LookupCache = False
        ParentFont = False
        TabOrder = 4
      end
      object FibuKtoLookupCB: TDBLookupComboBox
        Left = 96
        Height = 21
        Top = 200
        Width = 129
        Anchors = [akTop, akLeft, akRight]
        DataField = 'BANK_ID'
        DataSource = JoDS
        DropDownCount = 15
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        KeyField = 'FIBU_KTO'
        ListField = 'KURZBEZ;FIBU_KTO'
        ListFieldIndex = 0
        ListSource = FirKtoDS
        LookupCache = False
        ParentFont = False
        TabOrder = 7
      end
    end
  end
  object FirKtoDS: TDataSource
    Left = 125
    Top = 140
  end
  object JoDS: TDataSource
    DataSet = DM1.JourTab
    OnDataChange = JoDSDataChange
    Left = 125
    Top = 80
  end
end
