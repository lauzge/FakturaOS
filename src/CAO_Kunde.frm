object AdressForm: TAdressForm
  Left = 86
  Height = 634
  Top = 85
  Width = 741
  Caption = 'Adressen'
  ClientHeight = 614
  ClientWidth = 741
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  KeyPreview = True
  Menu = MainMenu1
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  UseDockManager = True
  LCLVersion = '7.2'
  Scaled = False
  object AddrPanel: TPanel
    Left = 0
    Height = 591
    Top = 0
    Width = 741
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 591
    ClientWidth = 741
    Color = 14680063
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Quality = fqAntialiased
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnResize = AddrPanelResize
    object ADDR_PC: TPageControl
      Left = 175
      Height = 540
      Top = 27
      Width = 566
      ActivePage = Allg_TS
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      OnChange = ADDR_PCChange
      object Allg_TS: TTabSheet
        Tag = 1
        Caption = 'Allgemein'
        ClientHeight = 514
        ClientWidth = 558
        TabVisible = False
        object KunAlgRightPan: TPanel
          Left = 316
          Height = 514
          Top = 0
          Width = 242
          Align = alRight
          BevelOuter = bvNone
          ClientHeight = 514
          ClientWidth = 242
          TabOrder = 0
          object KommunikationGB: TGroupBox
            Left = 0
            Height = 208
            Top = 0
            Width = 242
            Align = alTop
            Caption = 'Kommunikation'
            ClientHeight = 190
            ClientWidth = 238
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object TelefonLab: TLabel
              Left = 3
              Height = 13
              Top = 6
              Width = 64
              AutoSize = False
              Caption = 'Telefon:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Telefon2Lab: TLabel
              Left = 3
              Height = 13
              Top = 28
              Width = 62
              AutoSize = False
              Caption = 'Telefon 2:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object TelefaxLab: TLabel
              Left = 3
              Height = 13
              Top = 52
              Width = 63
              AutoSize = False
              Caption = 'Telefax:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object MobilfunkLab: TLabel
              Left = 4
              Height = 13
              Top = 76
              Width = 61
              AutoSize = False
              Caption = 'Mobilfunk:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object EmailLab: TLabel
              Left = 5
              Height = 13
              Top = 98
              Width = 61
              AutoSize = False
              Caption = 'eMail:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object EMail2Lab: TLabel
              Left = 5
              Height = 13
              Top = 120
              Width = 64
              AutoSize = False
              Caption = 'eMail 2:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object InternetLab: TLabel
              Left = 4
              Height = 13
              Top = 142
              Width = 64
              AutoSize = False
              Caption = 'Internet:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DiversesLab: TLabel
              Left = 3
              Height = 13
              Top = 164
              Width = 64
              AutoSize = False
              Caption = 'Diverses:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object tele1: TDBComboBox
              Tag = 1
              Left = 72
              Height = 21
              Top = 2
              Width = 132
              DataField = 'TELE1'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 0
            end
            object tele2: TDBComboBox
              Tag = 1
              Left = 72
              Height = 21
              Top = 24
              Width = 132
              DataField = 'TELE2'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object fax: TDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 48
              Width = 160
              DataField = 'FAX'
              DataSource = KS_DS
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object funk: TDBComboBox
              Tag = 1
              Left = 72
              Height = 21
              Top = 72
              Width = 132
              DataField = 'FUNK'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = tele1ButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 3
            end
            object email: TDBComboBox
              Tag = 1
              Left = 72
              Height = 21
              Top = 94
              Width = 132
              DataField = 'EMAIL'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 4
            end
            object email2: TDBComboBox
              Tag = 1
              Left = 72
              Height = 21
              Top = 116
              Width = 132
              DataField = 'EMAIL2'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object internet: TDBComboBox
              Tag = 1
              Left = 72
              Height = 21
              Top = 138
              Width = 132
              DataField = 'INTERNET'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object divers1: TDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 160
              Width = 160
              DataField = 'DIVERSES'
              DataSource = KS_DS
              AutoSelect = False
              AutoSize = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object tele1Btn: TSpeedButton
              Left = 209
              Height = 22
              Hint = 'anrufen (über Tapi)'
              Top = 1
              Width = 23
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000064000000640000000000000000000000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000000FF000000FF000000FF000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                800000008000000000FF000000FF808000FFFFFF00FF808000FF000000FF0000
                00FF000080000000800000008000000080000000800000008000000080000000
                00FF000000FF808000FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF8080
                00FF000000FF000000FF00008000000080000000800000008000808000FF8080
                00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFC0C0C0FF808000FF8080
                00FF808000FF808000FF000000FF000000FF0000800000008000808000FFFFFF
                00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF00FFC0C0C0FF8080
                00FF808000FF808000FF000000FF000000FF000000FF00008000808000FFFFFF
                00FFFFFFFFFFFFFFFFFFC0C0C0FF808000FF808000FFC0C0C0FFFFFF00FFC0C0
                C0FF808000FF000000FFFFFF00FFC0C0C0FF808000FF000000FF000080008080
                00FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FF808000FFC0C0C0FFFFFF
                00FFC0C0C0FF000000FFFFFFFFFFFFFF00FF808000FF000000FF000080000000
                8000808000FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FFC0C0C0FFFFFF
                00FFC0C0C0FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000000FF000080000000
                800000008000808000FFFFFF00FFC0C0C0FFC0C0C0FFFFFF00FFFFFF00FFFFFF
                FFFF000000FF000000FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000080000000
                800000008000808000FF808000FFFFFFFFFFFFFF00FFFFFFFFFF000000FF8080
                80FF000000FFFFFFFFFFFFFF00FFC0C0C0FF808000FF00008000000080000000
                8000808000FF000000FF808000FF000000FFC0C0C0FF000000FF808080FF8080
                80FFFFFF00FFFFFF00FFC0C0C0FF808000FF0000800000008000000080000000
                8000808000FFC0C0C0FFFFFF00FF808080FF808080FF000000FFFFFF00FFFFFF
                00FFC0C0C0FF808000FF808000FF000080000000800000008000000080000000
                800000008000808000FFC0C0C0FFFFFF00FFFFFFFFFFFFFF00FFC0C0C0FF8080
                00FF808000FF0000800000008000000080000000800000008000000080000000
                80000000800000008000808000FF808000FF808000FF808000FF808000FF0000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000
              }
              OnClick = tele1ButtonClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
            object tele2Btn: TSpeedButton
              Left = 209
              Height = 22
              Hint = 'anrufen (über Tapi)'
              Top = 24
              Width = 23
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000064000000640000000000000000000000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000000FF000000FF000000FF000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                800000008000000000FF000000FF808000FFFFFF00FF808000FF000000FF0000
                00FF000080000000800000008000000080000000800000008000000080000000
                00FF000000FF808000FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF8080
                00FF000000FF000000FF00008000000080000000800000008000808000FF8080
                00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFC0C0C0FF808000FF8080
                00FF808000FF808000FF000000FF000000FF0000800000008000808000FFFFFF
                00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF00FFC0C0C0FF8080
                00FF808000FF808000FF000000FF000000FF000000FF00008000808000FFFFFF
                00FFFFFFFFFFFFFFFFFFC0C0C0FF808000FF808000FFC0C0C0FFFFFF00FFC0C0
                C0FF808000FF000000FFFFFF00FFC0C0C0FF808000FF000000FF000080008080
                00FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FF808000FFC0C0C0FFFFFF
                00FFC0C0C0FF000000FFFFFFFFFFFFFF00FF808000FF000000FF000080000000
                8000808000FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FFC0C0C0FFFFFF
                00FFC0C0C0FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000000FF000080000000
                800000008000808000FFFFFF00FFC0C0C0FFC0C0C0FFFFFF00FFFFFF00FFFFFF
                FFFF000000FF000000FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000080000000
                800000008000808000FF808000FFFFFFFFFFFFFF00FFFFFFFFFF000000FF8080
                80FF000000FFFFFFFFFFFFFF00FFC0C0C0FF808000FF00008000000080000000
                8000808000FF000000FF808000FF000000FFC0C0C0FF000000FF808080FF8080
                80FFFFFF00FFFFFF00FFC0C0C0FF808000FF0000800000008000000080000000
                8000808000FFC0C0C0FFFFFF00FF808080FF808080FF000000FFFFFF00FFFFFF
                00FFC0C0C0FF808000FF808000FF000080000000800000008000000080000000
                800000008000808000FFC0C0C0FFFFFF00FFFFFFFFFFFFFF00FFC0C0C0FF8080
                00FF808000FF0000800000008000000080000000800000008000000080000000
                80000000800000008000808000FF808000FF808000FF808000FF808000FF0000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000
              }
              OnClick = tele1ButtonClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
            object funkBtn: TSpeedButton
              Left = 209
              Height = 22
              Hint = 'anrufen (über Tapi)'
              Top = 71
              Width = 23
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000064000000640000000000000000000000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000000FF000000FF000000FF000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                800000008000000000FF000000FF808000FFFFFF00FF808000FF000000FF0000
                00FF000080000000800000008000000080000000800000008000000080000000
                00FF000000FF808000FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF8080
                00FF000000FF000000FF00008000000080000000800000008000808000FF8080
                00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFC0C0C0FF808000FF8080
                00FF808000FF808000FF000000FF000000FF0000800000008000808000FFFFFF
                00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF00FFC0C0C0FF8080
                00FF808000FF808000FF000000FF000000FF000000FF00008000808000FFFFFF
                00FFFFFFFFFFFFFFFFFFC0C0C0FF808000FF808000FFC0C0C0FFFFFF00FFC0C0
                C0FF808000FF000000FFFFFF00FFC0C0C0FF808000FF000000FF000080008080
                00FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FF808000FFC0C0C0FFFFFF
                00FFC0C0C0FF000000FFFFFFFFFFFFFF00FF808000FF000000FF000080000000
                8000808000FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FFC0C0C0FFFFFF
                00FFC0C0C0FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000000FF000080000000
                800000008000808000FFFFFF00FFC0C0C0FFC0C0C0FFFFFF00FFFFFF00FFFFFF
                FFFF000000FF000000FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000080000000
                800000008000808000FF808000FFFFFFFFFFFFFF00FFFFFFFFFF000000FF8080
                80FF000000FFFFFFFFFFFFFF00FFC0C0C0FF808000FF00008000000080000000
                8000808000FF000000FF808000FF000000FFC0C0C0FF000000FF808080FF8080
                80FFFFFF00FFFFFF00FFC0C0C0FF808000FF0000800000008000000080000000
                8000808000FFC0C0C0FFFFFF00FF808080FF808080FF000000FFFFFF00FFFFFF
                00FFC0C0C0FF808000FF808000FF000080000000800000008000000080000000
                800000008000808000FFC0C0C0FFFFFF00FFFFFFFFFFFFFF00FFC0C0C0FF8080
                00FF808000FF0000800000008000000080000000800000008000000080000000
                80000000800000008000808000FF808000FF808000FF808000FF808000FF0000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000000080000000
                8000000080000000800000008000000080000000800000008000
              }
              OnClick = tele1ButtonClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
            object emailBtn: TSpeedButton
              Left = 209
              Height = 22
              Hint = 'neue EMail mit dieser Adresse erstellen'
              Top = 93
              Width = 23
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Glyph.Data = {
                BA040000424DBA04000000000000360000002800000011000000110000000100
                20000000000084040000640000006400000000000000000000000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB00000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF0000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF00
                00FFBF0000FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB000000
                00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000
                BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF000000FF0000
                BB000000BB00000000FFFFFFFFFF000000FF000000FF000000FF000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF0000
                00FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000FF0000BB000000BB00000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF0000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB00
              }
              OnClick = Email1BtnClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
            object email2Btn: TSpeedButton
              Left = 209
              Height = 22
              Hint = 'neue EMail mit dieser Adresse erstellen'
              Top = 115
              Width = 23
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Glyph.Data = {
                BA040000424DBA04000000000000360000002800000011000000110000000100
                20000000000084040000640000006400000000000000000000000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB00000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF0000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF00
                00FFBF0000FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB000000
                00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000
                BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF000000FF0000
                BB000000BB00000000FFFFFFFFFF000000FF000000FF000000FF000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF0000
                00FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000FF0000BB000000BB00000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF0000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB00
              }
              OnClick = Email2BtnClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
            object internetBtn: TSpeedButton
              Left = 209
              Height = 22
              Hint = 'Internetseite aufrufen'
              Top = 138
              Width = 23
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Glyph.Data = {
                36080000424D3608000000000000360000002800000020000000100000000100
                2000000000000008000064000000640000000000000000000000985010009850
                1000985010009850100098501000985010009850100098501000985010009850
                1000985010009850100098501000985010009850100098501000985010009850
                100098501000985010009850100098501000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF9850100098501000985010009850100098501000985010009850
                1000985010009850100098501000800000FF800000FFFF0000FF800000FFFF00
                00FF985010009850100098501000985010009850100098501000985010009850
                10009850100098501000FFFFFFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
                7FFF98501000FFFFFFFFFFFFFFFF985010009850100098501000985010009850
                100098501000800000FFFF0000FF800000FF800000FF800000FFFF0000FF8000
                00FF800000FF800000FF98501000985010009850100098501000985010009850
                1000985010007F7F7FFF7F7F7FFF98501000FFFFFFFFFFFFFFFF985010009850
                10007F7F7FFF7F7F7FFF98501000FFFFFFFF9850100098501000985010009850
                1000800000FFFF0000FF800000FF008080FF008080FF800000FF800000FF8000
                00FF800000FF800000FF800000FF985010009850100098501000985010009850
                10007F7F7FFF98501000985010007F7F7FFF7F7F7FFFFFFFFFFF985010009850
                100098501000985010007F7F7FFFFFFFFFFFFFFFFFFF98501000985010008000
                00FFFF0000FF800000FFFF0000FF008080FF008080FF800000FFFF0000FF8000
                00FFFF0000FF800000FF008080FF008080FF9850100098501000985010007F7F
                7FFFFFFFFFFF98501000985010007F7F7FFF7F7F7FFFFFFFFFFFFFFFFFFF9850
                100098501000985010007F7F7FFF7F7F7FFFFFFFFFFF98501000985010008000
                00FFFF0000FFFF0000FFFF0000FF008080FF008080FF008080FF800000FF8000
                00FF800000FF800000FF008080FF008080FF9850100098501000985010007F7F
                7FFF9850100098501000985010007F7F7FFF7F7F7FFF7F7F7FFFFFFFFFFF9850
                100098501000985010007F7F7FFF7F7F7FFF98501000FFFFFFFFFF0000FFFF00
                00FFFF0000FFFF0000FFFF0000FF008080FF008080FF008080FFFF0000FFFF00
                00FFFF0000FF800000FFFF0000FF800000FF800000FF985010007F7F7FFFFFFF
                FFFF9850100098501000FFFFFFFF7F7F7FFF7F7F7FFF7F7F7FFFFFFFFFFF9850
                1000985010009850100098501000985010007F7F7FFFFFFFFFFF800000FFFF00
                00FFFF0000FF008080FF008080FF008080FF008080FF008080FFFF0000FFFF00
                00FFFF0000FF800000FF800000FF800000FFFF0000FF985010007F7F7FFFFFFF
                FFFF985010007F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFFFFFFFFFF9850
                1000FFFFFFFF9850100098501000985010007F7F7FFFFFFFFFFFFF0000FF8000
                00FF008080FF008080FF008080FF008080FF008080FF008080FFFF0000FF0080
                80FFFF0000FF800000FFFF0000FFFF0000FFFF0000FF985010007F7F7FFFFFFF
                FFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFFFFFFFFFF7F7F
                7FFFFFFFFFFFFFFFFFFF98501000985010007F7F7FFFFFFFFFFF800000FFFF00
                00FFFF0000FF008080FF008080FF008080FF008080FF008080FF008080FF0080
                80FF008080FFFF0000FF800000FFFF0000FF800000FF985010007F7F7FFFFFFF
                FFFF985010007F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
                7FFF7F7F7FFFFFFFFFFF98501000985010007F7F7FFFFFFFFFFFFF0000FFFF00
                00FFFF0000FF008080FF008080FFFF0000FFFF0000FF800000FF008080FF0080
                80FF008080FFFF0000FFFF0000FF800000FFFF0000FF985010007F7F7FFF9850
                1000FFFFFFFF7F7F7FFF7F7F7FFF9850100098501000FFFFFFFF7F7F7FFF7F7F
                7FFF7F7F7FFFFFFFFFFFFFFFFFFF985010007F7F7FFF9850100098501000FF00
                00FFFF0000FFFF0000FFFF0000FFFF0000FF008080FF008080FF008080FF0080
                80FF008080FF008080FF800000FFFF0000FF9850100098501000985010007F7F
                7FFFFFFFFFFF98501000FFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
                7FFF7F7F7FFF7F7F7FFFFFFFFFFF7F7F7FFFFFFFFFFF98501000985010008000
                00FFFF0000FF008080FF008080FF008080FF008080FF008080FF008080FF0080
                80FF008080FF008080FFFF0000FFFF0000FF9850100098501000985010007F7F
                7FFF985010007F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
                7FFF7F7F7FFF7F7F7FFFFFFFFFFF7F7F7FFF9850100098501000985010009850
                1000008080FF008080FF008080FF008080FFFF0000FFFF0000FF008080FFFF00
                00FF008080FF008080FFFF0000FF985010009850100098501000985010009850
                10007F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF98501000985010007F7F7FFF9850
                10007F7F7FFF7F7F7FFF7F7F7FFF985010009850100098501000985010009850
                100098501000008080FF008080FFFF0000FFFF0000FF800000FFFF0000FF8000
                00FFFF0000FFFF0000FF98501000985010009850100098501000985010009850
                1000985010007F7F7FFF7F7F7FFF98501000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7FFF7F7F7FFF98501000985010009850100098501000985010009850
                1000985010009850100098501000FF0000FF800000FFFF0000FFFF0000FFFF00
                00FF985010009850100098501000985010009850100098501000985010009850
                10009850100098501000985010007F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
                7FFF985010009850100098501000985010009850100098501000
              }
              NumGlyphs = 2
              OnClick = InternetBtnClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
          end
          object BriefanredeGB: TGroupBox
            Left = 0
            Height = 49
            Top = 208
            Width = 242
            Align = alTop
            Caption = 'Briefanrede'
            ClientHeight = 31
            ClientWidth = 238
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object BAnrede: TVolgaDBEdit
              Tag = 1
              Left = 4
              Height = 21
              Top = 0
              Width = 228
              ButtonWidth = 17
              Color = clWindow
              ComboProps.ComboItems.Strings = (
                'Sehr geehrte Damen und Herren,'
                'Sehr geehrte Frau,'
                'Sehr geehrter Herr,'
              )
              DataField = 'BRIEFANREDE'
              DataSource = KS_DS
              DialogStyle = vdsCombo
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object DatumGB: TGroupBox
            Left = 0
            Height = 128
            Top = 257
            Width = 242
            Align = alTop
            Caption = 'Daten'
            ClientHeight = 110
            ClientWidth = 238
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object GebdatToOutlookLabel: TLabel
              Left = 4
              Height = 13
              Top = 2
              Width = 69
              AutoSize = False
              Caption = 'Geburtsdatum:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label30: TLabel
              Left = 4
              Height = 13
              Top = 24
              Width = 69
              AutoSize = False
              Caption = 'Kunde seit:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object GebDat: TDBDateEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = -6
              Width = 160
              CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
              DateOrder = doNone
              ButtonWidth = 23
              AutoSize = False
              AutoSelect = False
              NumGlyphs = 1
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 0
              DataField = 'KUN_GEBDATUM'
              DataSource = KS_DS
            end
            object KunSeit: TDBDateEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 16
              Width = 160
              CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
              DateOrder = doNone
              ButtonWidth = 23
              AutoSize = False
              AutoSelect = False
              NumGlyphs = 1
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 1
              DataField = 'KUN_SEIT'
              DataSource = KS_DS
            end
            object Bevel2: TDividerBevel
              Tag = 1
              Left = 0
              Height = 15
              Top = 41
              Width = 240
              Caption = 'Shop'
              Font.Color = clBtnShadow
              ParentFont = False
              Style = gsHorLines
            end
            object ShopKundeCB: TCheckBox
              Left = 4
              Height = 19
              Top = 59
              Width = 84
              Alignment = taLeftJustify
              AutoSize = False
              Caption = 'Shop-Kunde'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnClick = ShopKundeCBClick
              ParentFont = False
              TabOrder = 3
            end
            object ShopDelCB: TCheckBox
              Left = 96
              Height = 19
              Top = 59
              Width = 136
              Alignment = taLeftJustify
              AutoSize = False
              Caption = 'beim nä. Update löschen'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 4
            end
            object ShopPwLab: TLabel
              Left = 4
              Height = 13
              Top = 88
              Width = 68
              AutoSize = False
              Caption = 'Shop-PW:'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object ShopPW: TDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 81
              Width = 160
              DataField = 'SHOP_PASSWORD'
              DataSource = KS_DS
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              PasswordChar = '*'
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object GroupBox1: TGroupBox
            Left = 0
            Height = 129
            Top = 385
            Width = 242
            Align = alClient
            Caption = 'Zahlungsbedingungen'
            ClientHeight = 111
            ClientWidth = 238
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object Label41: TLabel
              Left = 5
              Height = 13
              Top = 16
              Width = 62
              AutoSize = False
              Caption = 'Zahlungsziel:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label54: TLabel
              Left = 104
              Height = 13
              Top = 8
              Width = 44
              Caption = 'Preisliste:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label66: TLabel
              Left = 72
              Height = 13
              Top = 40
              Width = 25
              AutoSize = False
              Caption = 'Tage'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label10: TLabel
              Left = 104
              Height = 13
              Top = 40
              Width = 32
              Caption = 'Netto :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label72: TLabel
              Left = 207
              Height = 13
              Top = 40
              Width = 25
              Caption = 'Tage'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label58: TLabel
              Left = 4
              Height = 13
              Top = 64
              Width = 76
              AutoSize = False
              Caption = 'Kunde-Versand:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label59: TLabel
              Left = 4
              Height = 13
              Top = 88
              Width = 76
              AutoSize = False
              Caption = 'Kunde-Zahlart:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object ZBSktoProz: TDBEdit
              Left = 4
              Height = 21
              Hint = 'Skonto in %'
              Top = 32
              Width = 35
              DataField = 'NET_SKONTO'
              DataSource = KS_DS
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ZBSktoTage: TDBEdit
              Left = 40
              Height = 21
              Hint = 'Skonto Tage'
              Top = 32
              Width = 28
              DataField = 'NET_TAGE'
              DataSource = KS_DS
              Alignment = taRightJustify
              AutoSize = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object ZBNettoTage: TDBEdit
              Left = 152
              Height = 21
              Hint = 'Nettoziel Tage'
              Top = 32
              Width = 56
              DataField = 'BRT_TAGE'
              DataSource = KS_DS
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunVersand: TDBEdit
              Left = 80
              Height = 21
              Top = 56
              Width = 32
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              Alignment = taRightJustify
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunZahlart: TDBEdit
              Left = 80
              Height = 21
              Top = 80
              Width = 32
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              Alignment = taRightJustify
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunVersandArtCB: TDBLookupComboBox
              Tag = 1
              Left = 112
              Height = 21
              Top = 56
              Width = 120
              Color = clWindow
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              DropDownCount = 7
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.LiefArtDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object KunVersandArtCBxx: TDBLookupComboBox
              Tag = 1
              Left = 112
              Height = 21
              Top = 80
              Width = 120
              Color = clWindow
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              DropDownCount = 7
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.ZahlartDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 7
            end
            object PR_EbeneCB: TVolgaDBEdit
              Tag = 1
              Left = 152
              Height = 21
              Top = 0
              Width = 80
              Alignment = taRightJustify
              AutoDropDown = True
              ButtonWidth = 17
              Color = clWindow
              DataField = 'PR_EBENE'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              Style = vcsDropDownList
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
        object KunAlgLeftPan: TPanel
          Left = 0
          Height = 514
          Top = 0
          Width = 316
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 514
          ClientWidth = 316
          TabOrder = 1
          object SuchbegrGB: TGroupBox
            Left = 0
            Height = 73
            Top = 0
            Width = 316
            Align = alTop
            Caption = 'Suchbegriffe'
            ClientHeight = 55
            ClientWidth = 312
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label24: TLabel
              Left = 8
              Height = 13
              Top = 6
              Width = 80
              AutoSize = False
              Caption = 'Suchbegriff:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label25: TLabel
              Left = 8
              Height = 13
              Top = 28
              Width = 80
              AutoSize = False
              Caption = 'Kunden-Nr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object match: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 2
              Width = 216
              DataField = 'MATCHCODE'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunNum1Edit: TDBEdit
              Left = 88
              Height = 21
              Top = 24
              Width = 48
              DataField = 'KUNNUM1'
              DataSource = KS_DS
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Label36: TLabel
              Left = 136
              Height = 13
              Top = 28
              Width = 82
              Caption = 'Ku-Nr. vom Lief. :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 215
              Height = 21
              Top = 24
              Width = 89
              DataField = 'KUNNUM2'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object ZuweisungenGB: TGroupBox
            Left = 0
            Height = 105
            Top = 73
            Width = 316
            Align = alTop
            Caption = 'Zuweisungen'
            ClientHeight = 87
            ClientWidth = 312
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label71: TLabel
              Left = 8
              Height = 13
              Top = 7
              Width = 80
              AutoSize = False
              Caption = 'Gruppe:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label16: TLabel
              Left = 8
              Height = 13
              Top = 30
              Width = 80
              AutoSize = False
              Caption = 'Selektion:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object MerkmalLab: TLabel
              Left = 8
              Height = 13
              Top = 54
              Width = 80
              AutoSize = False
              Caption = 'Merkmale:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object KunGR1: TDBLookupComboBox
              Tag = 1
              Left = 88
              Height = 21
              Top = -1
              Width = 216
              Anchors = [akTop, akLeft, akRight]
              DataField = 'KUNDENGRUPPE'
              DataSource = KS_DS
              DropDownCount = 7
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'GR'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.KgrDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 0
            end
            object gruppe: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 22
              Width = 216
              DataField = 'GRUPPE'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KunMerkmalLB: TCheckListBox
              Tag = 1
              Left = 88
              Height = 38
              Top = 46
              Width = 216
              Anchors = [akTop, akLeft, akRight, akBottom]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 0
              OnClickCheck = KunMerkmalLBClickCheck
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyPress = matchKeyPress
              OnKeyDown = matchKeyDown
              ParentFont = False
              TabOrder = 2
            end
          end
          object AnschriftGB: TGroupBox
            Left = 0
            Height = 214
            Top = 178
            Width = 316
            Align = alTop
            Caption = 'Anschrift'
            ClientHeight = 196
            ClientWidth = 312
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label3: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 80
              AutoSize = False
              Caption = 'Anrede:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object AddAdressToOutlookLabel: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 80
              AutoSize = False
              Caption = 'Name 1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label5: TLabel
              Left = 8
              Height = 13
              Top = 56
              Width = 80
              AutoSize = False
              Caption = 'Name 2:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label6: TLabel
              Left = 8
              Height = 13
              Top = 80
              Width = 80
              AutoSize = False
              Caption = 'Name 3:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label7: TLabel
              Left = 8
              Height = 13
              Top = 104
              Width = 80
              AutoSize = False
              Caption = 'z.Hd. von:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label8: TLabel
              Left = 8
              Height = 13
              Top = 128
              Width = 80
              AutoSize = False
              Caption = 'Strasse:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label9: TLabel
              Left = 8
              Height = 13
              Top = 152
              Width = 80
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label43: TLabel
              Left = 8
              Height = 13
              Top = 175
              Width = 80
              AutoSize = False
              Caption = 'Land/Plz/Postf.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object name1: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
              Width = 216
              DataField = 'NAME1'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object name2: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 48
              Width = 216
              DataField = 'NAME2'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object name3: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 72
              Width = 216
              DataField = 'NAME3'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object abteilung: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 96
              Width = 216
              DataField = 'ABTEILUNG'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object strasse: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 120
              Width = 216
              DataField = 'STRASSE'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object Land: TDBEdit
              Left = 88
              Height = 21
              Top = 144
              Width = 24
              DataField = 'LAND'
              DataSource = KS_DS
              AutoSelect = False
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object PF_Land: TDBEdit
              Left = 88
              Height = 21
              Top = 167
              Width = 24
              DataField = 'LAND'
              DataSource = KS_DS
              AutoSelect = False
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 9
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object PLZ: TDBComboBox
              Left = 112
              Height = 21
              Hint = 'Postleitzahlenverzeichis aufrufen'
              Top = 144
              Width = 56
              DataField = 'PLZ'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 7
            end
            object PF_PLZ: TDBComboBox
              Left = 112
              Height = 21
              Hint = 'Postleitzahlenverzeichis aufrufen'
              Top = 167
              Width = 56
              DataField = 'PF_PLZ'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 10
            end
            object Ort: TDBComboBox
              Tag = 2
              Left = 168
              Height = 21
              Top = 144
              Width = 136
              Anchors = [akTop, akLeft, akRight]
              DataField = 'ORT'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 8
            end
            object Postfach: TDBComboBox
              Tag = 2
              Left = 168
              Height = 21
              Top = 167
              Width = 136
              Anchors = [akTop, akLeft, akRight]
              DataField = 'POSTFACH'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = PLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 11
            end
            object Anrede: TVolgaDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 216
              Anchors = [akTop, akLeft, akRight]
              ButtonWidth = 17
              Color = clWindow
              ComboProps.ComboItems.Strings = (
                'Bürgermeister'
                'Doktor'
                'Familie'
                'Firma'
                'Frau'
                'Herr'
                'Pfarrer'
                'Professor'
              )
              DataField = 'ANREDE'
              DataSource = KS_DS
              DialogStyle = vdsCombo
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
          object InfoGB: TGroupBox
            Left = 0
            Height = 122
            Top = 392
            Width = 316
            Align = alClient
            Caption = 'Info'
            ClientHeight = 104
            ClientWidth = 312
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object InfoMemo: TDBMemo
              Left = 0
              Height = 104
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Top = 0
              Width = 312
              Align = alClient
              DataField = 'INFO'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
      object Zuweis_TS: TTabSheet
        Tag = 2
        Caption = 'Erweitert'
        ClientHeight = 514
        ClientWidth = 558
        TabVisible = False
        object ErwTopPanel: TPanel
          Left = 0
          Height = 72
          Top = 0
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 72
          ClientWidth = 558
          TabOrder = 0
          object AddrTopGB: TGroupBox
            Left = 0
            Height = 72
            Top = 0
            Width = 558
            Align = alClient
            Caption = 'Suchbegriffe'
            ClientHeight = 54
            ClientWidth = 554
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label55: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 97
              AutoSize = False
              Caption = 'Suchbegriff:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label63: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 97
              AutoSize = False
              Caption = 'Kunden-Nr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label64: TLabel
              Left = 168
              Height = 13
              Top = 32
              Width = 82
              AutoSize = False
              Caption = 'Ku-Nr. vom Lief. :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBEdit13: TDBEdit
              Left = 104
              Height = 21
              Top = 2
              Width = 214
              DataField = 'MATCHCODE'
              DataSource = KS_DS
              ReadOnly = True
              AutoSize = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit14: TDBEdit
              Tag = 1
              Left = 320
              Height = 21
              Top = 2
              Width = 232
              DataField = 'NAME1'
              DataSource = KS_DS
              ReadOnly = True
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit11: TDBEdit
              Left = 104
              Height = 21
              Top = 24
              Width = 56
              DataField = 'KUNNUM1'
              DataSource = KS_DS
              ReadOnly = True
              AutoSize = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit12: TDBEdit
              Left = 246
              Height = 21
              Top = 24
              Width = 72
              DataField = 'KUNNUM2'
              DataSource = KS_DS
              ReadOnly = True
              AutoSize = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit15: TDBEdit
              Left = 320
              Height = 21
              Top = 24
              Width = 22
              DataField = 'LAND'
              DataSource = KS_DS
              ReadOnly = True
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit1: TDBEdit
              Left = 352
              Height = 21
              Top = 24
              Width = 41
              DataField = 'PLZ'
              DataSource = KS_DS
              ReadOnly = True
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object DBEdit7: TDBEdit
              Tag = 1
              Left = 400
              Height = 21
              Top = 24
              Width = 152
              DataField = 'ORT'
              DataSource = KS_DS
              ReadOnly = True
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Height = 96
          Top = 72
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 96
          ClientWidth = 558
          TabOrder = 1
          object LieferantGB: TGroupBox
            Left = 0
            Height = 96
            Top = 0
            Width = 265
            Align = alLeft
            Caption = 'Lieferant'
            ClientHeight = 78
            ClientWidth = 261
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label56: TLabel
              Left = 8
              Height = 13
              Top = 9
              Width = 97
              AutoSize = False
              Caption = 'Kreditor-Nr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label70: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 97
              AutoSize = False
              Caption = 'Lief.-Versand:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label69: TLabel
              Left = 8
              Height = 13
              Top = 56
              Width = 97
              AutoSize = False
              Caption = 'Lief.-Zahlart:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object LieferExpCB: TCheckBox
              Left = 171
              Height = 19
              Top = 3
              Width = 86
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'Lief. exportiert'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyPress = matchKeyPress
              OnKeyDown = matchKeyDown
              ParentFont = False
              TabOrder = 2
            end
            object krdnum: TDBEdit
              Left = 104
              Height = 21
              Top = 3
              Width = 56
              DataField = 'KRD_NUM'
              DataSource = KS_DS
              ReadOnly = True
              Alignment = taRightJustify
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object LVersand: TDBEdit
              Left = 104
              Height = 21
              Top = 24
              Width = 32
              DataField = 'LIEF_LIEFART'
              DataSource = KS_DS
              Alignment = taRightJustify
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object LZahlart: TDBEdit
              Left = 104
              Height = 21
              Top = 48
              Width = 32
              DataField = 'LIEF_ZAHLART'
              DataSource = KS_DS
              Alignment = taRightJustify
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object LVersandCB: TDBLookupComboBox
              Tag = 1
              Left = 136
              Height = 21
              Top = 24
              Width = 121
              Color = clWindow
              DataField = 'LIEF_LIEFART'
              DataSource = KS_DS
              DropDownCount = 7
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.LiefArtDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 4
            end
            object LZahlartCB: TDBLookupComboBox
              Tag = 1
              Left = 136
              Height = 21
              Top = 48
              Width = 121
              DataField = 'LIEF_ZAHLART'
              DataSource = KS_DS
              DropDownCount = 7
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.ZahlartDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object IstLieferCB: TCheckBox
              Left = 171
              Height = 19
              Top = -16
              Width = 86
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'ist Lieferant'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyPress = matchKeyPress
              OnKeyDown = matchKeyDown
              ParentFont = False
              TabOrder = 1
            end
          end
          object KundeGB: TGroupBox
            Left = 265
            Height = 96
            Top = 0
            Width = 293
            Align = alClient
            Caption = 'Kunde'
            ClientHeight = 78
            ClientWidth = 289
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label32: TLabel
              Left = 5
              Height = 13
              Top = 9
              Width = 83
              AutoSize = False
              Caption = 'Debitor-Nr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label68: TLabel
              Left = 5
              Height = 13
              Top = 32
              Width = 83
              AutoSize = False
              Caption = 'Kunde-Versand:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label67: TLabel
              Left = 5
              Height = 13
              Top = 56
              Width = 83
              AutoSize = False
              Caption = 'Kunde-Zahlart:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object debnum: TDBEdit
              Left = 87
              Height = 21
              Top = 3
              Width = 65
              DataField = 'DEB_NUM'
              DataSource = KS_DS
              ReadOnly = True
              Alignment = taRightJustify
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KVersand: TDBEdit
              Left = 87
              Height = 21
              Top = 24
              Width = 33
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              Alignment = taRightJustify
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KZahlart: TDBEdit
              Left = 87
              Height = 21
              Top = 48
              Width = 33
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              Alignment = taRightJustify
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KVersandCB: TDBLookupComboBox
              Tag = 1
              Left = 120
              Height = 21
              Top = 24
              Width = 167
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              DataField = 'KUN_LIEFART'
              DataSource = KS_DS
              DropDownCount = 7
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.LiefArtDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 4
            end
            object KZahlartCB: TDBLookupComboBox
              Tag = 1
              Left = 120
              Height = 21
              Top = 48
              Width = 167
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              DataField = 'KUN_ZAHLART'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.ZahlartDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object KundeExpCB: TCheckBox
              Left = 160
              Height = 19
              Top = 3
              Width = 127
              Alignment = taLeftJustify
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Caption = 'Kunde exportiert '
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyPress = matchKeyPress
              OnKeyDown = matchKeyDown
              ParentFont = False
              TabOrder = 2
            end
            object IstKundeCB: TCheckBox
              Left = 160
              Height = 19
              Top = -16
              Width = 127
              Alignment = taLeftJustify
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Caption = 'Ist Kunde'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyPress = matchKeyPress
              OnKeyDown = matchKeyDown
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object Panel6: TPanel
          Left = 0
          Height = 192
          Top = 168
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 192
          ClientWidth = 558
          TabOrder = 2
          object ZuweisGB: TGroupBox
            Left = 0
            Height = 192
            Top = 0
            Width = 265
            Align = alLeft
            Caption = 'Zuweisungen'
            ClientHeight = 174
            ClientWidth = 261
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label38: TLabel
              Left = 8
              Height = 13
              Top = 10
              Width = 97
              AutoSize = False
              Caption = 'Währung:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label33: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 97
              AutoSize = False
              Caption = 'Kreditlimit:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label28: TLabel
              Left = 8
              Height = 13
              Top = 56
              Width = 97
              AutoSize = False
              Caption = 'UmsatzSt.-ID:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label76: TLabel
              Left = 8
              Height = 13
              Top = 104
              Width = 97
              AutoSize = False
              Caption = 'Sprache:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label77: TLabel
              Left = 8
              Height = 13
              Top = 128
              Width = 97
              AutoSize = False
              Caption = 'Vertreter:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label1: TLabel
              Left = 8
              Height = 13
              Top = 152
              Width = 97
              AutoSize = False
              Caption = 'Provision:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label65: TLabel
              Left = 160
              Height = 13
              Top = 32
              Width = 38
              AutoSize = False
              Caption = 'Rabatt:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object waehrung: TDBEdit
              Left = 104
              Height = 21
              Top = 2
              Width = 32
              DataField = 'WAERUNG'
              DataSource = KS_DS
              ReadOnly = True
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object klimit: TDBEdit
              Left = 104
              Height = 21
              Top = 24
              Width = 48
              DataField = 'KUN_KRDLIMIT'
              DataSource = KS_DS
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object globrabatt: TDBEdit
              Tag = 1
              Left = 201
              Height = 21
              Top = 24
              Width = 56
              DataField = 'GRABATT'
              DataSource = KS_DS
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object UST_ID_EDI: TDBEdit
              Tag = 1
              Left = 104
              Height = 21
              Top = 48
              Width = 153
              DataField = 'UST_NUM'
              DataSource = KS_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object SpracheEdi: TDBEdit
              Left = 104
              Height = 21
              Top = 96
              Width = 32
              DataField = 'SPRACH_ID'
              DataSource = KS_DS
              ReadOnly = True
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object VertreterEdi: TDBEdit
              Left = 104
              Height = 21
              Top = 120
              Width = 32
              DataField = 'VERTRETER_ID'
              DataSource = KS_DS
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 9
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object VertrProzEdi: TDBEdit
              Left = 104
              Height = 21
              Top = 144
              Width = 80
              DataField = 'PROVIS_PROZ'
              DataSource = KS_DS
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 11
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 136
              Height = 21
              Top = 2
              Width = 121
              Color = clWindow
              DataField = 'WAERUNG'
              DataSource = KS_DS
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.WhrungDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object SpracheCB: TDBLookupComboBox
              Tag = 1
              Left = 139
              Height = 21
              Top = 96
              Width = 118
              DataField = 'SPRACH_ID'
              DataSource = KS_DS
              DropDownCount = 7
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'SPRACH_ID'
              ListField = 'NAME'
              ListFieldIndex = 0
              ListSource = DM1.SprachDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 8
            end
            object VertreterCB: TDBLookupComboBox
              Tag = 1
              Left = 139
              Height = 21
              Top = 120
              Width = 118
              Color = clWindow
              DataField = 'VERTRETER_ID'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'VERTRETER_ID'
              ListField = 'NAME;VNAME'
              ListFieldIndex = 0
              ListSource = DM1.VertreterDS
              LookupCache = False
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 10
            end
            object BRUTTO_CB: TDBCheckBox
              Left = 8
              Height = 23
              Top = 72
              Width = 109
              Alignment = taLeftJustify
              Caption = 'Brutto-Berechn.'
              DataField = 'BRUTTO_FLAG'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              ParentFont = False
              TabOrder = 5
              ValueChecked = 'Wahr'
              ValueUnchecked = 'Falsch'
            end
            object MWST_FREI_CB: TDBCheckBox
              Tag = 1
              Left = 159
              Height = 23
              Top = 70
              Width = 98
              Alignment = taLeftJustify
              Caption = 'MwSt-Frei'
              DataField = 'MWST_FREI_FLAG'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              ParentFont = False
              TabOrder = 6
              ValueChecked = 'Wahr'
              ValueUnchecked = 'Falsch'
            end
          end
          object BankGB: TGroupBox
            Left = 265
            Height = 192
            Top = 0
            Width = 293
            Align = alClient
            Caption = 'Bankverbindung'
            ClientHeight = 174
            ClientWidth = 289
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label78: TLabel
              Left = 5
              Height = 13
              Top = 7
              Width = 76
              AutoSize = False
              Caption = 'Konto-Inhaber:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label73: TLabel
              Left = 5
              Height = 13
              Top = 27
              Width = 76
              AutoSize = False
              Caption = 'Konto-Nummer:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label74: TLabel
              Left = 5
              Height = 13
              Top = 48
              Width = 76
              AutoSize = False
              Caption = 'Bankleitzahl:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label75: TLabel
              Left = 5
              Height = 13
              Top = 72
              Width = 76
              AutoSize = False
              Caption = 'Name der Bank:'
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
              Top = 128
              Width = 76
              AutoSize = False
              Caption = 'IBAN:'
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
              Top = 152
              Width = 76
              AutoSize = False
              Caption = 'SWIFT:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object KontoInhEdi: TDBEdit
              Tag = 1
              Left = 87
              Height = 21
              Top = 0
              Width = 200
              DataField = 'KTO_INHABER'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object KontoEdi: TDBEdit
              Tag = 1
              Left = 87
              Height = 21
              Top = 24
              Width = 200
              DataField = 'KTO'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object BankNameEdi: TDBEdit
              Tag = 1
              Left = 87
              Height = 21
              Top = 72
              Width = 200
              DataField = 'BANK'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object iban: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 120
              Width = 200
              DataField = 'IBAN'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object swift: TDBEdit
              Tag = 1
              Left = 87
              Height = 21
              Top = 144
              Width = 200
              DataField = 'SWIFT'
              DataSource = KS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object BlZEdi: TDBComboBox
              Tag = 1
              Left = 87
              Height = 21
              Top = 48
              Width = 200
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              DataField = 'BLZ'
              DataSource = KS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnEnter = matchEnter
              OnExit = BlZEdiExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 2
            end
            object Bevel1: TDividerBevel
              Left = 5
              Height = 15
              Top = 97
              Width = 282
              Caption = ' Bankverbindung (Ausland)'
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clBtnShadow
              ParentFont = False
              Style = gsHorLines
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Height = 154
          Top = 360
          Width = 558
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 154
          ClientWidth = 558
          TabOrder = 3
          object CaoGroupBox10: TGroupBox
            Left = 0
            Height = 154
            Top = 0
            Width = 558
            Align = alClient
            Caption = 'Lieferanschriften'
            ClientHeight = 136
            ClientWidth = 554
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object KunLiefAddrGrid: TDBGrid
              Left = 0
              Height = 108
              Top = 0
              Width = 554
              Align = alClient
              BorderStyle = bsNone
              Color = clWindow
              Columns = <              
                item
                  Title.Caption = 'Anrede'
                  Width = 50
                  FieldName = 'ANREDE'
                end              
                item
                  Title.Caption = 'Name 1'
                  Width = 100
                  FieldName = 'NAME1'
                end              
                item
                  Title.Caption = 'Name 2'
                  Width = 100
                  FieldName = 'NAME2'
                end              
                item
                  Title.Caption = 'Straße'
                  Width = 100
                  FieldName = 'STRASSE'
                end              
                item
                  Title.Caption = 'Land'
                  Width = 30
                  FieldName = 'LAND'
                end              
                item
                  Title.Caption = 'PLZ'
                  Width = 50
                  FieldName = 'PLZ'
                end              
                item
                  Title.Caption = 'Ort'
                  Width = 100
                  FieldName = 'ORT'
                end>
              DataSource = KunLiefDS
              DefaultRowHeight = 17
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
            end
            object Panel12: TPanel
              Left = 0
              Height = 6
              Top = 108
              Width = 554
              Align = alBottom
              BevelOuter = bvNone
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 1
            end
            object ToolBar1: TToolBar
              Left = 0
              Height = 22
              Top = 114
              Width = 554
              Align = alBottom
              AutoSize = True
              ButtonHeight = 22
              ButtonWidth = 87
              Caption = 'ToolBar1'
              Color = clBtnFace
              EdgeBorders = []
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Images = MainForm.ImageList1
              List = True
              ParentColor = False
              ParentFont = False
              ShowCaptions = True
              TabOrder = 2
              Wrapable = False
              object KunLiefEdiBtn: TToolButton
                Left = 1
                Top = 0
                AutoSize = True
                Caption = 'Bearbeiten'
                ImageIndex = 9
                OnClick = BitBtn1Click
              end
              object ToolButton4: TToolButton
                Left = 88
                Height = 5
                Top = 0
                Caption = 'ToolButton4'
                Style = tbsDivider
              end
              object KunLiefStdBtn: TToolButton
                Left = 93
                Top = 0
                AutoSize = True
                Caption = 'Als Standard'
                ImageIndex = 12
                OnClick = KunLiefStdBtnClick
              end
              object ToolButton6: TToolButton
                Left = 180
                Height = 5
                Top = 0
                Caption = 'ToolButton6'
                Style = tbsDivider
              end
              object KunLiefDelBtn: TToolButton
                Left = 185
                Top = 0
                AutoSize = True
                Caption = 'Löschen'
                ImageIndex = 19
                OnClick = KunLiefDelBtnClick
              end
            end
          end
        end
      end
      object ASP_TS: TTabSheet
        Tag = 3
        Caption = 'Ansprechpartner'
        ClientHeight = 514
        ClientWidth = 558
        TabVisible = False
        object ASPTopPanel: TPanel
          Left = 0
          Height = 80
          Top = 0
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 0
          Height = 236
          Top = 80
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 236
          ClientWidth = 558
          TabOrder = 1
          object Panel10: TPanel
            Left = 279
            Height = 236
            Top = 0
            Width = 279
            Align = alRight
            BevelOuter = bvNone
            ClientHeight = 236
            ClientWidth = 279
            TabOrder = 0
            object AspKommGB: TGroupBox
              Left = 0
              Height = 200
              Top = 0
              Width = 279
              Align = alClient
              Caption = 'Kommunikation'
              ClientHeight = 182
              ClientWidth = 275
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object ASPTelefonLab: TLabel
                Left = 2
                Height = 13
                Top = 16
                Width = 71
                AutoSize = False
                Caption = 'Telefon:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ASPTelPrivLab: TLabel
                Left = 2
                Height = 13
                Top = 40
                Width = 71
                AutoSize = False
                Caption = 'Telefon privat:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ASPFaxLab: TLabel
                Left = 2
                Height = 13
                Top = 64
                Width = 71
                AutoSize = False
                Caption = 'Telefax:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ASPMobilLab: TLabel
                Left = 2
                Height = 13
                Top = 88
                Width = 71
                AutoSize = False
                Caption = 'Mobilfunk:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ASPEmailLab: TLabel
                Left = 2
                Height = 13
                Top = 112
                Width = 71
                AutoSize = False
                Caption = 'eMail:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ASPEmail2Lab: TLabel
                Left = 2
                Height = 13
                Top = 136
                Width = 71
                AutoSize = False
                Caption = 'eMail (2):'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ASPGebDatumLab: TLabel
                Left = 2
                Height = 13
                Top = 160
                Width = 71
                AutoSize = False
                Caption = 'Geburtsdatum:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object APTelefax: TDBEdit
                Tag = 1
                Left = 80
                Height = 21
                Top = 56
                Width = 192
                DataField = 'TELEFAX'
                DataSource = APDS
                AutoSelect = False
                AutoSize = False
                Color = clWindow
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 2
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
              end
              object APTelefon: TDBComboBox
                Tag = 1
                Left = 80
                Height = 21
                Hint = 'anrufen (über Tapi)'
                Top = 8
                Width = 165
                DataField = 'TELEFON'
                DataSource = APDS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ItemHeight = 13
                MaxLength = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object APTelPriv: TDBComboBox
                Tag = 1
                Left = 80
                Height = 21
                Hint = 'anrufen (über Tapi)'
                Top = 31
                Width = 165
                Color = clWindow
                DataField = 'TELEPRIVAT'
                DataSource = APDS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ItemHeight = 13
                MaxLength = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
              object APMobilfunk: TDBComboBox
                Tag = 1
                Left = 80
                Height = 21
                Hint = 'anrufen (über Tapi)'
                Top = 80
                Width = 165
                Color = clWindow
                DataField = 'MOBILFUNK'
                DataSource = APDS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ItemHeight = 13
                MaxLength = 0
                OnClick = tele1ButtonClick
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
              end
              object APemail: TDBComboBox
                Tag = 1
                Left = 79
                Height = 21
                Hint = 'neue EMail mit dieser Adresse erstellen'
                Top = 104
                Width = 165
                AutoSelect = False
                Color = clWindow
                DataField = 'EMAIL'
                DataSource = APDS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ItemHeight = 13
                MaxLength = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
              end
              object APEmail2: TDBComboBox
                Tag = 1
                Left = 80
                Height = 21
                Hint = 'neue EMail mit dieser Adresse erstellen'
                Top = 128
                Width = 165
                AutoSelect = False
                Color = clWindow
                DataField = 'EMAIL2'
                DataSource = APDS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ItemHeight = 13
                MaxLength = 0
                OnEnter = matchEnter
                OnExit = matchEnter
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
              end
              object APGebDatum: TDBDateEdit
                Left = 80
                Height = 21
                Top = 152
                Width = 192
                CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
                DateOrder = doNone
                ButtonWidth = 23
                Anchors = [akTop, akLeft, akRight, akBottom]
                AutoSelect = False
                NumGlyphs = 1
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                OnEnter = matchEnter
                OnExit = matchExit
                OnKeyDown = matchKeyDown
                OnKeyPress = matchKeyPress
                ParentFont = False
                TabOrder = 6
                DataField = 'GEBDATUM'
                DataSource = APDS
              end
              object APTelefonBtn: TSpeedButton
                Left = 249
                Height = 22
                Top = 7
                Width = 23
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000064000000640000000000000000000000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000000FF000000FF000000FF000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  800000008000000000FF000000FF808000FFFFFF00FF808000FF000000FF0000
                  00FF000080000000800000008000000080000000800000008000000080000000
                  00FF000000FF808000FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF8080
                  00FF000000FF000000FF00008000000080000000800000008000808000FF8080
                  00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFC0C0C0FF808000FF8080
                  00FF808000FF808000FF000000FF000000FF0000800000008000808000FFFFFF
                  00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF00FFC0C0C0FF8080
                  00FF808000FF808000FF000000FF000000FF000000FF00008000808000FFFFFF
                  00FFFFFFFFFFFFFFFFFFC0C0C0FF808000FF808000FFC0C0C0FFFFFF00FFC0C0
                  C0FF808000FF000000FFFFFF00FFC0C0C0FF808000FF000000FF000080008080
                  00FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FF808000FFC0C0C0FFFFFF
                  00FFC0C0C0FF000000FFFFFFFFFFFFFF00FF808000FF000000FF000080000000
                  8000808000FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FFC0C0C0FFFFFF
                  00FFC0C0C0FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000000FF000080000000
                  800000008000808000FFFFFF00FFC0C0C0FFC0C0C0FFFFFF00FFFFFF00FFFFFF
                  FFFF000000FF000000FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000080000000
                  800000008000808000FF808000FFFFFFFFFFFFFF00FFFFFFFFFF000000FF8080
                  80FF000000FFFFFFFFFFFFFF00FFC0C0C0FF808000FF00008000000080000000
                  8000808000FF000000FF808000FF000000FFC0C0C0FF000000FF808080FF8080
                  80FFFFFF00FFFFFF00FFC0C0C0FF808000FF0000800000008000000080000000
                  8000808000FFC0C0C0FFFFFF00FF808080FF808080FF000000FFFFFF00FFFFFF
                  00FFC0C0C0FF808000FF808000FF000080000000800000008000000080000000
                  800000008000808000FFC0C0C0FFFFFF00FFFFFFFFFFFFFF00FFC0C0C0FF8080
                  00FF808000FF0000800000008000000080000000800000008000000080000000
                  80000000800000008000808000FF808000FF808000FF808000FF808000FF0000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000
                }
                OnClick = tele1ButtonClick
              end
              object APTelPrivBtn: TSpeedButton
                Left = 249
                Height = 22
                Top = 31
                Width = 23
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000064000000640000000000000000000000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000000FF000000FF000000FF000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  800000008000000000FF000000FF808000FFFFFF00FF808000FF000000FF0000
                  00FF000080000000800000008000000080000000800000008000000080000000
                  00FF000000FF808000FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF8080
                  00FF000000FF000000FF00008000000080000000800000008000808000FF8080
                  00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFC0C0C0FF808000FF8080
                  00FF808000FF808000FF000000FF000000FF0000800000008000808000FFFFFF
                  00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF00FFC0C0C0FF8080
                  00FF808000FF808000FF000000FF000000FF000000FF00008000808000FFFFFF
                  00FFFFFFFFFFFFFFFFFFC0C0C0FF808000FF808000FFC0C0C0FFFFFF00FFC0C0
                  C0FF808000FF000000FFFFFF00FFC0C0C0FF808000FF000000FF000080008080
                  00FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FF808000FFC0C0C0FFFFFF
                  00FFC0C0C0FF000000FFFFFFFFFFFFFF00FF808000FF000000FF000080000000
                  8000808000FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FFC0C0C0FFFFFF
                  00FFC0C0C0FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000000FF000080000000
                  800000008000808000FFFFFF00FFC0C0C0FFC0C0C0FFFFFF00FFFFFF00FFFFFF
                  FFFF000000FF000000FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000080000000
                  800000008000808000FF808000FFFFFFFFFFFFFF00FFFFFFFFFF000000FF8080
                  80FF000000FFFFFFFFFFFFFF00FFC0C0C0FF808000FF00008000000080000000
                  8000808000FF000000FF808000FF000000FFC0C0C0FF000000FF808080FF8080
                  80FFFFFF00FFFFFF00FFC0C0C0FF808000FF0000800000008000000080000000
                  8000808000FFC0C0C0FFFFFF00FF808080FF808080FF000000FFFFFF00FFFFFF
                  00FFC0C0C0FF808000FF808000FF000080000000800000008000000080000000
                  800000008000808000FFC0C0C0FFFFFF00FFFFFFFFFFFFFF00FFC0C0C0FF8080
                  00FF808000FF0000800000008000000080000000800000008000000080000000
                  80000000800000008000808000FF808000FF808000FF808000FF808000FF0000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000
                }
                OnClick = tele1ButtonClick
              end
              object APMobilfunkBtn: TSpeedButton
                Left = 249
                Height = 22
                Top = 79
                Width = 23
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000064000000640000000000000000000000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000000FF000000FF000000FF000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  800000008000000000FF000000FF808000FFFFFF00FF808000FF000000FF0000
                  00FF000080000000800000008000000080000000800000008000000080000000
                  00FF000000FF808000FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF8080
                  00FF000000FF000000FF00008000000080000000800000008000808000FF8080
                  00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFC0C0C0FF808000FF8080
                  00FF808000FF808000FF000000FF000000FF0000800000008000808000FFFFFF
                  00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFC0C0C0FFFFFF00FFC0C0C0FF8080
                  00FF808000FF808000FF000000FF000000FF000000FF00008000808000FFFFFF
                  00FFFFFFFFFFFFFFFFFFC0C0C0FF808000FF808000FFC0C0C0FFFFFF00FFC0C0
                  C0FF808000FF000000FFFFFF00FFC0C0C0FF808000FF000000FF000080008080
                  00FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FF808000FFC0C0C0FFFFFF
                  00FFC0C0C0FF000000FFFFFFFFFFFFFF00FF808000FF000000FF000080000000
                  8000808000FFFFFF00FFC0C0C0FF808000FFC0C0C0FF808000FFC0C0C0FFFFFF
                  00FFC0C0C0FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000000FF000080000000
                  800000008000808000FFFFFF00FFC0C0C0FFC0C0C0FFFFFF00FFFFFF00FFFFFF
                  FFFF000000FF000000FFC0C0C0FFFFFF00FFC0C0C0FF808000FF000080000000
                  800000008000808000FF808000FFFFFFFFFFFFFF00FFFFFFFFFF000000FF8080
                  80FF000000FFFFFFFFFFFFFF00FFC0C0C0FF808000FF00008000000080000000
                  8000808000FF000000FF808000FF000000FFC0C0C0FF000000FF808080FF8080
                  80FFFFFF00FFFFFF00FFC0C0C0FF808000FF0000800000008000000080000000
                  8000808000FFC0C0C0FFFFFF00FF808080FF808080FF000000FFFFFF00FFFFFF
                  00FFC0C0C0FF808000FF808000FF000080000000800000008000000080000000
                  800000008000808000FFC0C0C0FFFFFF00FFFFFFFFFFFFFF00FFC0C0C0FF8080
                  00FF808000FF0000800000008000000080000000800000008000000080000000
                  80000000800000008000808000FF808000FF808000FF808000FF808000FF0000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000000080000000
                  8000000080000000800000008000000080000000800000008000
                }
                OnClick = tele1ButtonClick
              end
              object APemailBtn: TSpeedButton
                Left = 249
                Height = 22
                Top = 103
                Width = 23
                Glyph.Data = {
                  BA040000424DBA04000000000000360000002800000011000000110000000100
                  20000000000084040000640000006400000000000000000000000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB00000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF0000FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF00
                  00FFBF0000FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB000000
                  00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000
                  BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF000000FF0000
                  BB000000BB00000000FFFFFFFFFF000000FF000000FF000000FF000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF0000
                  00FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF000000FF0000BB000000BB00000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF0000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB00
                }
                OnClick = AsPEMailLabClick
              end
              object APEmail2Btn: TSpeedButton
                Left = 249
                Height = 22
                Top = 128
                Width = 23
                Glyph.Data = {
                  BA040000424DBA04000000000000360000002800000011000000110000000100
                  20000000000084040000640000006400000000000000000000000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB00000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF0000FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB00000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF0000FFBF0000FFBF0000FFBF0000FFBF00
                  00FFBF0000FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000BB000000
                  00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000BB000000
                  BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF000000FF0000
                  BB000000BB00000000FFFFFFFFFF000000FF000000FF000000FF000000FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000BFFF0000BFFFFFFFFFFF0000
                  00FF0000BB000000BB00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF000000FF0000BB000000BB00000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                  00FF000000FF000000FF0000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB000000
                  BB000000BB000000BB000000BB000000BB000000BB000000BB000000BB00
                }
                OnClick = AsPEMailLab2Click
              end
            end
            object CaoGroupBox9: TGroupBox
              Left = 0
              Height = 36
              Top = 200
              Width = 279
              Align = alBottom
              Caption = 'Navigation'
              ClientHeight = 18
              ClientWidth = 275
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object DBNavigator1: TDBNavigator
                Left = 0
                Height = 18
                Top = 0
                Width = 275
                Align = alClient
                BevelOuter = bvNone
                ChildSizing.EnlargeHorizontal = crsScaleChilds
                ChildSizing.EnlargeVertical = crsScaleChilds
                ChildSizing.ShrinkHorizontal = crsScaleChilds
                ChildSizing.ShrinkVertical = crsScaleChilds
                ChildSizing.Layout = cclLeftToRightThenTopToBottom
                ChildSizing.ControlsPerLine = 100
                ClientHeight = 18
                ClientWidth = 275
                Color = clBtnFace
                DataSource = APDS
                Flat = True
                Options = []
                ParentColor = False
                TabOrder = 0
              end
            end
          end
          object AspAlgGB: TGroupBox
            Left = 0
            Height = 236
            Top = 0
            Width = 279
            Align = alClient
            Caption = 'Allgemein'
            ClientHeight = 218
            ClientWidth = 275
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label23: TLabel
              Left = 3
              Height = 13
              Top = 16
              Width = 65
              AutoSize = False
              Caption = 'Funktion:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label62: TLabel
              Left = 3
              Height = 13
              Top = 40
              Width = 65
              AutoSize = False
              Caption = 'Anrede:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label39: TLabel
              Left = 3
              Height = 13
              Top = 64
              Width = 65
              AutoSize = False
              Caption = 'Vorname:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label40: TLabel
              Left = 3
              Height = 13
              Top = 88
              Width = 65
              AutoSize = False
              Caption = 'Name:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label48: TLabel
              Left = 3
              Height = 13
              Top = 112
              Width = 65
              AutoSize = False
              Caption = 'Strasse:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label61: TLabel
              Left = 3
              Height = 13
              Top = 136
              Width = 65
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label46: TLabel
              Left = 3
              Height = 13
              Top = 160
              Width = 65
              AutoSize = False
              Caption = 'Info:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object APFunktion: TDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 8
              Width = 197
              DataField = 'FUNKTION'
              DataSource = APDS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APVorname: TDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 56
              Width = 197
              DataField = 'VORNAME'
              DataSource = APDS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APName: TDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 80
              Width = 197
              DataField = 'NAME'
              DataSource = APDS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APStrasse: TDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 104
              Width = 197
              DataField = 'STRASSE'
              DataSource = APDS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APLand: TDBEdit
              Left = 72
              Height = 21
              Top = 128
              Width = 24
              DataField = 'LAND'
              DataSource = APDS
              AutoSelect = False
              AutoSize = False
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
            object APInfo: TDBMemo
              Left = 72
              Height = 64
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Top = 152
              Width = 197
              Anchors = [akTop, akLeft, akRight, akBottom]
              DataField = 'INFO'
              DataSource = APDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 7
            end
            object APPLZ: TDBComboBox
              Left = 96
              Height = 21
              Hint = 'Postleitzahlenverzeichis aufrufen'
              Top = 128
              Width = 48
              AutoSelect = False
              AutoSize = False
              DataField = 'PLZ'
              DataSource = APDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = APPLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object APOrt: TDBComboBox
              Left = 144
              Height = 21
              Top = 128
              Width = 125
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              DataField = 'ORT'
              DataSource = APDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = APPLZButtonClick
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
              ParentFont = False
              TabOrder = 8
            end
            object APAnrede: TVolgaDBEdit
              Tag = 1
              Left = 72
              Height = 21
              Top = 32
              Width = 197
              Anchors = [akTop, akLeft, akRight]
              ButtonWidth = 17
              Color = clWindow
              ComboProps.ComboItems.Strings = (
                'Bürgermeister'
                'Doktor'
                'Familie'
                'Firma'
                'Frau'
                'Herr'
                'Pfarrer'
                'Professor'
              )
              DataField = 'ANREDE'
              DataSource = APDS
              DialogStyle = vdsCombo
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = matchEnter
              OnExit = matchExit
              OnKeyDown = matchKeyDown
              OnKeyPress = matchKeyPress
            end
          end
        end
        object CaoGroupBox3: TGroupBox
          Left = 0
          Height = 198
          Top = 316
          Width = 558
          Align = alClient
          Caption = 'Liste der Ansprechpartner'
          ClientHeight = 180
          ClientWidth = 554
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object ASPGrid: TDBGrid
            Left = 0
            Height = 180
            Top = 0
            Width = 554
            Align = alClient
            Color = clWindow
            Columns = <            
              item
                Title.Caption = 'Funktion'
                Width = 96
                FieldName = 'FUNKTION'
              end            
              item
                Title.Caption = 'Name'
                Width = 110
                FieldName = 'NAME'
              end            
              item
                Title.Caption = 'Vorname'
                Width = 82
                FieldName = 'VORNAME'
              end            
              item
                Title.Caption = 'Telefon'
                Width = 85
                FieldName = 'TELEFON'
              end            
              item
                Title.Caption = 'FAX'
                Width = 70
                FieldName = 'TELEFAX'
              end            
              item
                Title.Caption = 'Mobilfunk'
                Width = 70
                FieldName = 'MOBILFUNK'
              end            
              item
                Title.Caption = 'Tel. privat'
                Width = 124
                FieldName = 'TELEPRIVAT'
              end            
              item
                Title.Caption = 'eMail'
                Width = 166
                FieldName = 'EMAIL'
              end>
            DataSource = APDS
            DefaultRowHeight = 16
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgCancelOnExit]
            OptionsExtra = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object KFZ_TS: TTabSheet
        Tag = 4
        Caption = 'KFZ'
        ClientHeight = 514
        ClientWidth = 558
        TabVisible = False
        object KFZTopPanel: TPanel
          Left = 0
          Height = 80
          Top = 0
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
        object CaoGroupBox5: TGroupBox
          Left = 0
          Height = 411
          Top = 80
          Width = 558
          Align = alClient
          Caption = 'Kundenfahrzeuge'
          ClientHeight = 393
          ClientWidth = 554
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object KFZGrid: TDBGrid
            Left = 0
            Height = 393
            Top = 0
            Width = 554
            Align = alClient
            BorderStyle = bsNone
            Color = clWindow
            Columns = <            
              item
                Title.Caption = 'g'
                Width = 14
                FieldName = 'GRUPPE'
              end            
              item
                Title.Caption = 'Kennzeichen'
                Width = 73
                FieldName = 'POL_KENNZ'
              end            
              item
                Title.Caption = 'FGST-Nr.'
                Width = 136
                FieldName = 'FGST_NUM'
              end            
              item
                Title.Caption = 'Typ'
                Width = 27
                FieldName = 'TYP'
              end            
              item
                Title.Caption = 'Hubraum'
                Width = 49
                FieldName = 'HUBRAUM'
              end            
              item
                Title.Caption = 'KW'
                Width = 32
                FieldName = 'KW'
              end            
              item
                Title.Caption = 'PS'
                Width = 30
                FieldName = 'PS'
              end            
              item
                Title.Caption = 'Tag d. EZ'
                Width = 60
                FieldName = 'ZULASSUNG'
              end            
              item
                Title.Caption = 'KM-Stand'
                Width = 53
                FieldName = 'KM_STAND'
              end            
              item
                Title.Caption = 'nä. TÜV'
                Width = 70
                FieldName = 'NAE_TUEV'
              end            
              item
                Title.Caption = 'nä. AU'
                Width = 70
                FieldName = 'NAE_AU'
              end>
            DataSource = KFZ_DS
            DefaultRowHeight = 16
            Flat = True
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            OptionsExtra = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object StatusBar2: TStatusBar
          Left = 0
          Height = 23
          Top = 491
          Width = 558
          Color = clBtnFace
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Quality = fqAntialiased
          Panels = <          
            item
              Width = 50
            end          
            item
              Width = 50
            end          
            item
              Width = 50
            end          
            item
              Width = 50
            end          
            item
              Width = 50
            end>
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          SimplePanel = False
        end
      end
      object Link_TS: TTabSheet
        Tag = 5
        Caption = 'Dateien'
        ClientHeight = 514
        ClientWidth = 558
        TabVisible = False
        object DateiTopPanel: TPanel
          Left = 0
          Height = 80
          Top = 0
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          ParentBackground = False
          ParentShowHint = False
          TabOrder = 0
        end
        object CaoGroupBox11: TGroupBox
          Left = 0
          Height = 434
          Top = 80
          Width = 558
          Align = alClient
          Caption = 'Datei-Link''s'
          ClientHeight = 416
          ClientWidth = 554
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object LinkPanel: TPanel
            Left = 0
            Height = 416
            Top = 0
            Width = 554
            Align = alClient
            BevelOuter = bvNone
            ParentBackground = False
            ParentShowHint = False
            TabOrder = 0
          end
        end
      end
      object Hist_TS: TTabSheet
        Tag = 6
        Caption = 'Historie'
        ClientHeight = 514
        ClientWidth = 558
        TabVisible = False
        object HistTopPanel: TPanel
          Left = 0
          Height = 80
          Top = 0
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          ParentBackground = False
          ParentShowHint = False
          TabOrder = 4
        end
        object Panel2: TPanel
          Left = 0
          Height = 31
          Top = 80
          Width = 558
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 31
          ClientWidth = 558
          TabOrder = 1
          object Panel13: TPanel
            Left = 0
            Height = 28
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel14: TPanel
            Left = 555
            Height = 28
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel15: TPanel
            Left = 0
            Height = 3
            Top = 28
            Width = 558
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
          end
          object ToolBar99: TToolBar
            Left = 3
            Height = 28
            Top = 0
            Width = 552
            Align = alClient
            BorderWidth = 1
            ButtonHeight = 21
            ButtonWidth = 23
            Caption = 'ToolBar99'
            Color = clBtnFace
            Flat = False
            ParentColor = False
            TabOrder = 3
            Wrapable = False
            object Label4: TLabel
              Left = 1
              Height = 21
              Top = 2
              Width = 72
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Selektion : '
              Layout = tlCenter
              ParentColor = False
            end
            object HistorySelCB: TComboBox
              Left = 73
              Height = 21
              Top = 2
              Width = 151
              AutoComplete = True
              AutoCompleteText = [cbactEnabled, cbactEndOfLineComplete, cbactSearchAscending]
              AutoSelect = False
              AutoSize = False
              Color = clWindow
              DropDownCount = 15
              ItemHeight = 13
              Items.Strings = (
                'alle Bewegungen'
                'Rechnungen'
                'offene Rechnungen'
                'unfertige Rechnungen'
                'Lieferscheine'
                'Angebote'
                'Einkäufe'
                'offene Einkäufe'
                'EK-Bestellungen'
                'offene EK-Bestellungen'
                'unfertige EK-Bestellungen'
              )
              OnChange = HistorySelCBChange
              ParentShowHint = False
              Style = csDropDownList
              TabOrder = 1
            end
            object ToolButton3: TToolButton
              Left = 224
              Height = 5
              Top = 2
              Caption = 'ToolButton3'
              Style = tbsDivider
            end
            object Label60: TLabel
              Left = 229
              Height = 21
              Top = 2
              Width = 38
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Jahr : '
              Layout = tlCenter
              ParentColor = False
            end
            object JahrCB: TComboBox
              Left = 267
              Height = 21
              Top = 2
              Width = 80
              AutoComplete = True
              AutoCompleteText = [cbactEnabled, cbactEndOfLineComplete, cbactSearchAscending]
              AutoSelect = False
              AutoSize = False
              Color = clWindow
              DropDownCount = 13
              ItemHeight = 13
              OnChange = JahrCBClick
              ParentShowHint = False
              Style = csDropDownList
              TabOrder = 0
            end
            object ToolButton5: TToolButton
              Left = 347
              Height = 5
              Top = 2
              Caption = 'ToolButton5'
              Style = tbsDivider
            end
            object ArtikelViewBtn: TSpeedButton
              Left = 352
              Height = 21
              Top = 2
              Width = 83
              AllowAllUp = True
              Caption = 'Artikel'
              Flat = True
              GroupIndex = 101
              Transparent = False
              OnClick = JahrCBClick
              ParentShowHint = False
            end
            object ToolButton7: TToolButton
              Left = 435
              Height = 5
              Top = 2
              Caption = 'ToolButton7'
              Style = tbsDivider
            end
            object JumpMenuBtn: TSpeedButton
              Left = 440
              Height = 21
              Top = 2
              Width = 91
              Caption = 'Aktionen ...'
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000064000000640000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000FF000000FF848484FFC6C6C6FF0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000FF00FFFFFF00BDBDFF000000FF848484FFC6C6C6FF000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000FF00FFFFFF00FFFFFF000000FF000000FF848484FFC6C6
                C6FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000FF00FFFFFF00FFFFFF00BDBDFF000000FF0000
                00FF848484FF0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFFFF0000
                00FF000000FF848484FF00000000000000000000000000000000000000000000
                0000000000000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FF
                FFFF000000FF000000FFC6C6C6FF000000000000000000000000000000000000
                00000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFFFF0000
                00FF000000FFC6C6C6FF00000000000000000000000000000000000000000000
                0000000000000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FF
                FFFF000000FF000000FFC6C6C6FF000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000FF000000FF00FF
                FFFF00FFFFFF000000FF000000FFC6C6C6FF0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00FF000000FF00FFFFFF000000FF000000FFC6C6C6FF00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000FF000000FF000000FF0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000
              }
              Transparent = False
              ParentShowHint = False
              PopupMenu = JumpMenu
            end
          end
        end
        object HistSumBar: TStatusBar
          Left = 0
          Height = 23
          Top = 491
          Width = 558
          Panels = <          
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Offen'
              Width = 38
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Bezahlt '
              Width = 55
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Gesamt '
              Width = 50
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Width = 50
            end>
          SimplePanel = False
        end
        object HistArtikelSB: TStatusBar
          Left = 0
          Height = 23
          Top = 468
          Width = 558
          Panels = <          
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Summe der Positionen'
              Width = 120
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Alignment = taCenter
              Width = 50
            end>
          SimplePanel = False
        end
        object JourPosGrid: TDBGrid
          Left = 0
          Height = 120
          Top = 348
          Width = 558
          Align = alBottom
          BorderStyle = bsNone
          Color = clWindow
          Columns = <          
            item
              MinSize = 0
              MaxSize = 0
              Title.Caption = 'ARTIKELTYP'
              Width = 18
              FieldName = 'ARTIKELTYP'
            end          
            item
              MinSize = 0
              MaxSize = 0
              Title.Caption = 'Art.-Nr.'
              Width = 101
              FieldName = 'ARTNUM'
            end          
            item
              Title.Caption = 'BEZEICHNUNG'
              Width = 295
              FieldName = 'BEZEICHNUNG'
            end          
            item
              Alignment = taRightJustify
              MinSize = 0
              MaxSize = 0
              Title.Caption = 'Menge'
              Width = 43
              FieldName = 'MENGE'
            end          
            item
              Alignment = taRightJustify
              MinSize = 0
              MaxSize = 0
              Title.Caption = 'E-Preis'
              Width = 81
              FieldName = 'EPREIS'
            end          
            item
              Alignment = taRightJustify
              MinSize = 0
              MaxSize = 0
              Title.Caption = 'Rabatt'
              Width = 41
              FieldName = 'RABATT'
            end          
            item
              Alignment = taRightJustify
              MinSize = 0
              MaxSize = 0
              Title.Caption = 'MwSt'
              Width = 36
              FieldName = 'STEUER_PROZ'
            end>
          DataSource = JPosTabDS
          DefaultRowHeight = 30
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          OptionsExtra = []
          TabOrder = 0
          Visible = False
        end
        object Splitter1: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 343
          Width = 558
          Align = alBottom
          ResizeAnchor = akBottom
        end
        object JournalGrid: TDBGrid
          Left = 0
          Height = 232
          Top = 111
          Width = 558
          Align = alClient
          BorderStyle = bsNone
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Quelle'
              Width = 50
              FieldName = 'CalcEKVK'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Beleg-Nr.'
              Width = 51
              FieldName = 'VRENUM'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Datum'
              Width = 62
              FieldName = 'RDATUM'
            end          
            item
              Title.Caption = 'Kunde'
              Visible = False
              FieldName = 'KUN_NAME1'
            end          
            item
              Title.Caption = 'Netto'
              Width = 80
              FieldName = 'NSUMME'
            end          
            item
              Title.Caption = 'MwSt'
              Width = 76
              FieldName = 'MSUMME'
            end          
            item
              Title.Caption = 'Brutto'
              Width = 84
              FieldName = 'BSUMME'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'W'
              Width = 20
              FieldName = 'WAEHRUNG'
            end          
            item
              Title.Caption = 'Stadium'
              Width = 122
              FieldName = 'CalcStadium'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'gezahlt'
              Width = 88
              FieldName = 'IST_BETRAG'
            end          
            item
              Title.Caption = 'Org.-Nummer'
              Width = 148
              FieldName = 'ORGNUM'
            end>
          DataSource = JourTabDS
          DefaultDrawing = False
          DefaultRowHeight = 17
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          OptionsExtra = []
          PopupMenu = JumpMenu
          ReadOnly = True
          TabOrder = 2
        end
      end
      object Such_TS: TTabSheet
        Tag = 7
        Caption = 'Liste'
        ClientHeight = 514
        ClientWidth = 558
        TabVisible = False
        object KunSuchGrid: TDBGrid
          Left = 0
          Height = 514
          Top = 0
          Width = 558
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Alignment = taRightJustify
              Title.Caption = 'KG'
              Width = 19
              FieldName = 'KUNDENGRUPPE'
            end          
            item
              Title.Caption = 'Suchbegriff'
              Width = 94
              FieldName = 'MATCHCODE'
            end          
            item
              Title.Caption = 'Anrede'
              Width = 93
              FieldName = 'ANREDE'
            end          
            item
              Title.Caption = 'Name1'
              Width = 151
              FieldName = 'NAME1'
            end          
            item
              Title.Caption = 'Name2'
              Width = 189
              FieldName = 'NAME2'
            end          
            item
              Title.Caption = 'Name3'
              Width = 132
              FieldName = 'NAME3'
            end          
            item
              Title.Caption = 'Abteilung'
              Width = 134
              FieldName = 'ABTEILUNG'
            end          
            item
              Title.Caption = 'Straße'
              Width = 125
              FieldName = 'STRASSE'
            end          
            item
              Title.Caption = 'PLZ'
              Width = 29
              FieldName = 'PLZ'
            end          
            item
              Title.Caption = 'Ort'
              Width = 124
              FieldName = 'ORT'
            end          
            item
              ReadOnly = True
              Title.Caption = 'KuNr.'
              Width = 57
              FieldName = 'KUNNUM1'
            end          
            item
              Title.Caption = 'Lie.-Nr.'
              Width = 65
              FieldName = 'KUNNUM2'
            end          
            item
              Title.Caption = 'Telefon1'
              Width = 80
              FieldName = 'TELE1'
            end          
            item
              Title.Caption = 'Telefon2'
              Width = 80
              FieldName = 'TELE2'
            end          
            item
              Title.Caption = 'Fax'
              Width = 80
              FieldName = 'FAX'
            end          
            item
              Title.Caption = 'Mobil'
              Width = 80
              FieldName = 'FUNK'
            end          
            item
              Title.Caption = 'E-Mail'
              Width = 80
              FieldName = 'EMAIL'
            end          
            item
              Title.Caption = 'Homepage'
              Visible = False
              FieldName = 'INTERNET'
            end          
            item
              Title.Caption = 'Diverses'
              Visible = False
              FieldName = 'DIVERSES'
            end          
            item
              Title.Caption = 'Selektion'
              Visible = False
              FieldName = 'GRUPPE'
            end          
            item
              Title.Caption = 'Land'
              Visible = False
              FieldName = 'LAND'
            end          
            item
              Title.Caption = 'Postfach'
              Visible = False
              FieldName = 'POSTFACH'
            end          
            item
              Title.Caption = 'PF-PLZ'
              Visible = False
              FieldName = 'PF_PLZ'
            end          
            item
              Title.Caption = 'Br.-Anrede'
              Visible = False
              FieldName = 'BRIEFANREDE'
            end          
            item
              Title.Caption = 'BLZ'
              Visible = False
              FieldName = 'BLZ'
            end          
            item
              Title.Caption = 'Konto'
              Visible = False
              FieldName = 'KTO'
            end          
            item
              Title.Caption = 'Name der Bank'
              Visible = False
              FieldName = 'BANK'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Rab.'
              Visible = False
              FieldName = 'GRABATT'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Kreditlim.'
              FieldName = 'KUN_KRDLIMIT'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'PE'
              Visible = False
              FieldName = 'PR_EBENE'
            end          
            item
              Alignment = taRightJustify
              ReadOnly = True
              Title.Caption = 'D-NUM'
              FieldName = 'DEB_NUM'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'K-NUM'
              FieldName = 'KRD_NUM'
            end          
            item
              Title.Caption = 'Gebdat.'
              Visible = False
              FieldName = 'KUN_GEBDATUM'
            end          
            item
              Title.Caption = 'Kunde seit'
              Visible = False
              FieldName = 'KUN_SEIT'
            end          
            item
              Title.Caption = 'erstellt'
              FieldName = 'ERSTELLT'
            end          
            item
              Title.Caption = 'erstellt von'
              Visible = False
              FieldName = 'ERST_NAME'
            end          
            item
              Title.Caption = 'le. Änderung'
              FieldName = 'GEAEND'
            end          
            item
              Title.Caption = 'geändert von'
              Visible = False
              FieldName = 'GEAEND_NAME'
            end>
          DataSource = KS_DS
          DefaultRowHeight = 16
          Flat = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgCancelOnExit]
          OptionsExtra = []
          TabOrder = 0
          OnDblClick = KunSuchGridDblClick
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 741
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 737
      Color = clBtnShadow
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object AddrHirViewBtn: TSpeedButton
        Left = 1
        Height = 22
        Top = 1
        Width = 103
        Caption = 'Adressen'
        Flat = True
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        OnClick = AddrHirViewBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
        ParentFont = False
      end
      object ListeBtn: TSpeedButton
        Tag = 7
        Left = 680
        Height = 22
        Top = 1
        Width = 45
        Caption = 'Liste'
        Flat = True
        OnClick = ListeBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
      end
      object HistBtn: TSpeedButton
        Tag = 6
        Left = 624
        Height = 22
        Top = 1
        Width = 55
        Caption = 'Historie'
        Flat = True
        OnClick = ListeBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
      end
      object LinkBtn: TSpeedButton
        Tag = 5
        Left = 568
        Height = 22
        Top = 1
        Width = 57
        Caption = 'Dateien'
        Flat = True
        OnClick = ListeBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
      end
      object KFZBtn: TSpeedButton
        Tag = 4
        Left = 528
        Height = 22
        Top = 1
        Width = 40
        Caption = 'KFZ'
        Flat = True
        OnClick = ListeBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
      end
      object ASPBtn: TSpeedButton
        Tag = 3
        Left = 416
        Height = 22
        Top = 1
        Width = 105
        Caption = 'Ansprechpartner'
        Flat = True
        OnClick = ListeBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
      end
      object ErwBtn: TSpeedButton
        Tag = 2
        Left = 352
        Height = 22
        Top = 1
        Width = 60
        Caption = 'Erweitert'
        Flat = True
        OnClick = ListeBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
      end
      object AllgBtn: TSpeedButton
        Tag = 1
        Left = 288
        Height = 22
        Top = 1
        Width = 63
        Caption = 'Allgemein'
        Flat = True
        OnClick = ListeBtnClick
        OnMouseEnter = AllgBtnMouseEnter
        OnMouseLeave = AllgBtnMouseLeave
      end
    end
    object KunGRPan: TPanel
      Left = 0
      Height = 540
      Top = 27
      Width = 170
      Align = alLeft
      BevelOuter = bvNone
      ClientHeight = 540
      ClientWidth = 170
      Color = 14680063
      ParentColor = False
      TabOrder = 3
      object Panel1: TPanel
        Left = 0
        Height = 24
        Top = 0
        Width = 170
        Align = alTop
        Alignment = taLeftJustify
        BevelColor = clBtnFace
        BevelOuter = bvNone
        Caption = ' Hierarchie'
        ClientHeight = 24
        ClientWidth = 170
        Color = 14680063
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        object AddrHirDockBtn: TSpeedButton
          Left = 144
          Height = 22
          Top = 0
          Width = 23
          Flat = True
          Glyph.Data = {
            F6060000424DF6060000000000003600000028000000240000000C0000000100
            200000000000C006000064000000640000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000FF0000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000FF000000000000000000000000000000000000
            0000000000000000000000000000000000FF0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000FF000000FF0000000000000000000000000000
            00FF000000FF0000000000000000000000000000000000000000000000FF0000
            00FF000000000000000000000000000000FF000000FF00000000000000000000
            0000000000FF000000FF000000FF000000FF000000FF000000FF000000000000
            0000000000000000000000000000000000000000000000000000000000FF8484
            84FF000000FF000000FF000000FF848484FF000000FF00000000000000000000
            00000000000000000000000000FF848484FF000000FF000000FF000000FF8484
            84FF000000FF000000000000000000000000000000FF000000FF848484FF8484
            84FF000000FF000000FF000000FF000000000000000000000000000000000000
            00000000000000000000000000FF00FFFFFF000000FF848484FF000000FF00FF
            FFFF000000FF0000000000000000000000000000000000000000000000FF8484
            84FF000000FF848484FF000000FF848484FF000000FF00000000000000000000
            0000000000FF848484FF848484FF848484FF848484FF000000FF000000FF0000
            00FF0000000000000000000000FF000000FF000000FF000000FF000000FFFFFF
            FFFF00FFFFFFFFFFFFFF848484FFFFFFFFFF000000FF00000000000000FF0000
            00FF000000FF000000FF000000FF848484FF848484FFC5C5C5FF848484FFC5C5
            C5FF000000FF000000000000000000000000000000FF848484FFFFFFFFFF00FF
            FFFF000000FF000000FF000000FF000000FF0000000000000000000000000000
            00000000000000000000000000FF00FFFFFFFFFFFFFF00FFFFFF00FFFFFF00FF
            FFFF000000FF0000000000000000000000000000000000000000000000FF8484
            84FFC5C5C5FF848484FF848484FF848484FF000000FF00000000000000000000
            0000000000FFFFFFFFFF00FFFFFF000000FF848484FF848484FF848484FF0000
            00FF000000FF0000000000000000000000000000000000000000000000FFFFFF
            FFFF000000FF000000FF000000FFFFFFFFFF000000FF00000000000000000000
            00000000000000000000000000FFC5C5C5FF000000FF000000FF000000FFC5C5
            C5FF000000FF000000000000000000000000000000FF00FFFFFFFFFFFFFF0000
            00FF00FFFFFFFFFFFFFF848484FF848484FF000000FF00000000000000000000
            00000000000000000000000000FF000000FF0000000000000000000000000000
            00FF000000FF0000000000000000000000000000000000000000000000FF0000
            00FF000000000000000000000000000000FF000000FF00000000000000000000
            000000000000000000FF00FFFFFF000000FFFFFFFFFF00FFFFFFFFFFFFFF8484
            84FF000000FF0000000000000000000000000000000000000000000000FF0000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000FF000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000FF0000
            00FF00FFFFFFFFFFFFFF00FFFFFF848484FF000000FF00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000FF000000FF000000FF0000
            00FF000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000
          }
          NumGlyphs = 3
          OnClick = AddrHirDockBtnClick
          OnMouseEnter = AllgBtnMouseEnter
          OnMouseLeave = AllgBtnMouseLeave
        end
      end
      object KunTV: TTreeView
        Left = 0
        Height = 516
        Top = 24
        Width = 170
        Align = alClient
        BackgroundColor = 14680063
        BorderStyle = bsNone
        Color = 14680063
        Indent = 19
        ReadOnly = True
        ScrollBars = ssAutoBoth
        TabOrder = 0
        OnChange = KunTVChange
        OnDblClick = KunTVExit
        OnExit = KunTVExit
        Options = [tvoAutoItemHeight, tvoHideSelection, tvoKeepCollapsedNodes, tvoReadOnly, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoToolTips, tvoThemedDraw]
      end
      object Button1: TButton
        Left = 31
        Height = 25
        Top = 288
        Width = 75
        Caption = 'Button1'
        OnClick = Button1Click
        TabOrder = 2
        Visible = False
      end
    end
    object KunToolbar: TToolBar
      Left = 0
      Height = 24
      Top = 567
      Width = 741
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 22
      ButtonWidth = 88
      Caption = 'KunToolbar'
      Color = clBtnFace
      Images = MainForm.ImageList1
      List = True
      ParentColor = False
      ShowCaptions = True
      TabOrder = 2
      Wrapable = False
      object DBNavigator3: TDBNavigator
        Left = 1
        Height = 22
        Top = 2
        Width = 241
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 22
        ClientWidth = 241
        DataSource = KS_DS
        Flat = True
        Options = []
        TabOrder = 0
      end
      object ToolButton1: TToolButton
        Left = 242
        Height = 22
        Top = 2
        Caption = 'ToolButton1'
        Style = tbsDivider
      end
      object Label29: TLabel
        Left = 247
        Height = 22
        Top = 2
        Width = 61
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchfeld:'
        Layout = tlCenter
        ParentColor = False
      end
      object SuchFeldCB: TComboBox
        Left = 308
        Height = 21
        Top = 2
        Width = 100
        ItemHeight = 13
        Items.Strings = (
          'Name'
          'Suchbegriff'
          'Info'
          'Kundenr.'
          'Ort'
          'Straße'
          'Selektion'
          'Ansprechpartner'
        )
        TabOrder = 2
      end
      object Label35: TLabel
        Left = 408
        Height = 22
        Top = 2
        Width = 72
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegriff'
        Layout = tlCenter
        ParentColor = False
      end
      object SuchBeg: TEdit
        Left = 480
        Height = 22
        Hint = 'Mehrere Suchbegriffe können Sie durch ein Leerzeichen trennen.'#13#10'Eine Oder-Verknüpfte Suche erreicht man mit "Begriff1 or Begriff2"'
        Top = 2
        Width = 100
        AutoSize = False
        Color = clWindow
        OnChange = SuchBegChange
        OnKeyPress = SuchBegKeyPress
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object ToolButton2: TToolButton
        Left = 580
        Height = 22
        Top = 2
        Caption = 'ToolButton2'
        Style = tbsDivider
      end
      object UebernahmeBtn: TToolButton
        Left = 585
        Top = 2
        AutoSize = True
        Caption = 'Über&nehmen'
        ImageIndex = 22
        MenuItem = uebernehmen1
        OnClick = UebernahmeBtnClick
        Visible = False
      end
    end
    object Splitter2: TSplitter
      Left = 170
      Height = 540
      Top = 27
      Width = 5
    end
  end
  object SB1: TStatusBar
    Left = 0
    Height = 23
    Top = 591
    Width = 741
    Panels = <    
      item
        Text = 'Suchzeit'
        Width = 80
      end    
      item
        Text = 'Satz 1 von 1'
        Width = 120
      end    
      item
        Text = 'Sortierung'
        Width = 140
      end    
      item
        Text = 'erstellt'
        Width = 120
      end    
      item
        Text = 'geaend'
        Width = 120
      end    
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 32
    Top = 56
    object Adresse1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Neu1: TMenuItem
        Caption = '&Neu'
        GroupIndex = 2
        ImageIndex = 23
        ShortCut = 16462
        OnClick = Neu1Click
      end
      object Loeschen1: TMenuItem
        Caption = '&Löschen'
        GroupIndex = 2
        ImageIndex = 6
        ShortCut = 16430
        OnClick = Loeschen1Click
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Vorgangneu1: TMenuItem
        Caption = 'Vorgang neu'
        GroupIndex = 2
        ImageIndex = 23
        object Angebot1: TMenuItem
          Tag = 1
          Caption = 'Angebot'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
        object Rechnung1: TMenuItem
          Tag = 3
          Caption = 'Rechnung'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
        object EKBestellung1: TMenuItem
          Tag = 6
          Caption = 'EK-Bestellung'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
        object EKRechnung1: TMenuItem
          Tag = 5
          Caption = 'EK-Rechnung'
          ImageIndex = 40
          OnClick = JumpToNewVorgang
        end
      end
      object N8: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Suchen1: TMenuItem
        Caption = '&Suchen'
        GroupIndex = 2
        ImageIndex = 10
        ShortCut = 114
        OnClick = Suchen1Click
      end
      object N2: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        GroupIndex = 2
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        GroupIndex = 2
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
      object N3: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object uebernehmen1: TMenuItem
        Caption = 'Über&nehmen'
        GroupIndex = 2
        ImageIndex = 22
        ShortCut = 123
        Visible = False
        OnClick = UebernahmeBtnClick
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object Match1: TMenuItem
        Tag = 1
        Caption = '&Suchbegriff'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object Name11: TMenuItem
        Tag = 2
        Caption = '&Name1'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object PLZOrt1: TMenuItem
        Tag = 3
        Caption = '&PLZ / Ort'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object Kundennummer1: TMenuItem
        Tag = 4
        Caption = '&Kundennummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
      object LiefNummer1: TMenuItem
        Tag = 5
        Caption = '&Lief.-Nummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = Sort1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
        OnClick = ListeBtnClick
      end
      object Zuweisungen1: TMenuItem
        Tag = 2
        Caption = 'Erweitert'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32884
        OnClick = ListeBtnClick
      end
      object Ansprechpartner1: TMenuItem
        Tag = 3
        Caption = 'Ansprechpartner'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32885
        OnClick = ListeBtnClick
      end
      object Fahrzeuge1: TMenuItem
        Tag = 4
        Caption = 'Fahrzeuge'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32886
        OnClick = ListeBtnClick
      end
      object Dateien1: TMenuItem
        Tag = 5
        Caption = 'Dateien'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32884
        OnClick = ListeBtnClick
      end
      object Historie1: TMenuItem
        Tag = 6
        Caption = 'Historie'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32888
        OnClick = ListeBtnClick
      end
      object Liste1: TMenuItem
        Tag = 7
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = ListeBtnClick
      end
      object N4: TMenuItem
        Caption = '-'
        GroupIndex = 4
      end
      object Treffer1: TMenuItem
        Caption = 'Treffer'
        GroupIndex = 4
        ImageIndex = 18
        object N101: TMenuItem
          Tag = 10
          Caption = '10 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N501: TMenuItem
          Tag = 50
          Caption = '50 Treffer'
          Checked = True
          Default = True
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N1001: TMenuItem
          Tag = 100
          Caption = '100 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N2001: TMenuItem
          Tag = 200
          Caption = '200 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object N5001: TMenuItem
          Tag = 500
          Caption = '500 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
        object alle1: TMenuItem
          Tag = 999999999
          Caption = 'alle Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = alle1Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
        GroupIndex = 4
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 4
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
    object Extras1: TMenuItem
      Caption = '&Extras'
      GroupIndex = 5
      object Adressenzusammenfassen1: TMenuItem
        Caption = 'Adressen zusammenfassen'
        ImageIndex = 9
        OnClick = Adressenzusammenfassen1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Kundennummerzuweisen1: TMenuItem
        Caption = 'Kundennummer zuweisen'
        ImageIndex = 18
        OnClick = Kundennummerzuweisen1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ImportUpdate1: TMenuItem
        Caption = 'Import/Update'
        ImageIndex = 33
        OnClick = ImportUpdate1Click
      end
      object Export1: TMenuItem
        Caption = 'Export'
        GroupIndex = 2
        ImageIndex = 37
        object AdresseinZwischenablage1: TMenuItem
          Caption = 'Adresse in Zwischenablage'
          ImageIndex = 9
          OnClick = AdresseinZwischenablage1Click
        end
        object CSV1: TMenuItem
          Caption = 'CSV'
          ImageIndex = 54
          OnClick = CSV1Click
        end
      end
      object N9: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object ErweiterteSuche1: TMenuItem
        Caption = 'Erweiterte Suche'
        GroupIndex = 2
        ImageIndex = 15
        ShortCut = 16471
        OnClick = ErweiterteSuche1Click
      end
    end
  end
  object KSQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = KSQueryAfterScroll
    AfterScroll = KSQueryAfterScroll
    UpdateObject = AddrUpdSQL
    OnUpdateRecord = KSQueryUpdateRecord
    BeforeInsert = KSQueryBeforeInsert
    BeforePost = AddrTabBeforePost
    AfterPost = KSQueryAfterPost
    AfterCancel = KSQueryAfterScroll
    BeforeDelete = KSQueryBeforeDelete
    AfterDelete = KSQueryAfterScroll
    OnNewRecord = KSQueryNewRecord
    SQL.Strings = (
      'select ADRESSEN.*'
      'FROM ADRESSEN, APARTNER'
      'USE INDEX (primary)'
      'WHERE UPPER(APARTNER.NAME) LIKE "wohl%" and ADRESSEN.REC_ID = APARTNER.ADDR_ID'
      'ORDER BY MATCHCODE'
      'LIMIT 0,200'
    )
    Params = <>
    Left = 32
    Top = 104
    object KSQueryREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryKUNDENGRUPPE: TZIntegerField
      DisplayLabel = 'KG'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'KUNDENGRUPPE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryMATCHCODE: TZRawStringField
      DisplayLabel = 'MATCH'
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 200
    end
    object KSQueryANREDE: TZRawStringField
      DisplayLabel = 'Anrede'
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryNAME1: TZRawStringField
      DisplayLabel = 'Name1'
      FieldKind = fkData
      FieldName = 'NAME1'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryNAME2: TZRawStringField
      DisplayLabel = 'Name2'
      FieldKind = fkData
      FieldName = 'NAME2'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryNAME3: TZRawStringField
      DisplayLabel = 'Name3'
      FieldKind = fkData
      FieldName = 'NAME3'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryABTEILUNG: TZRawStringField
      DisplayLabel = 'Abteilung'
      FieldKind = fkData
      FieldName = 'ABTEILUNG'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQuerySTRASSE: TZRawStringField
      DisplayLabel = 'Straße'
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KSQueryORT: TZRawStringField
      DisplayLabel = 'Ort'
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryKUNNUM1: TZRawStringField
      DisplayLabel = 'KuNr.'
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'KUNNUM1'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryKUNNUM2: TZRawStringField
      DisplayLabel = 'Lie.-Nr.'
      FieldKind = fkData
      FieldName = 'KUNNUM2'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryTELE1: TZRawStringField
      DisplayLabel = 'Telefon1'
      FieldKind = fkData
      FieldName = 'TELE1'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryTELE2: TZRawStringField
      DisplayLabel = 'Telefon2'
      FieldKind = fkData
      FieldName = 'TELE2'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryFAX: TZRawStringField
      DisplayLabel = 'Fax'
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryFUNK: TZRawStringField
      DisplayLabel = 'Mobil'
      FieldKind = fkData
      FieldName = 'FUNK'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryDEB_NUM: TZIntegerField
      DisplayLabel = 'D-NUM'
      FieldKind = fkData
      FieldName = 'DEB_NUM'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00000; ; '
    end
    object KSQueryKRD_NUM: TZIntegerField
      DisplayLabel = 'K-NUM'
      FieldKind = fkData
      FieldName = 'KRD_NUM'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00000; ; '
    end
    object KSQueryGRUPPE: TZRawStringField
      DisplayLabel = 'Selektion'
      FieldKind = fkData
      FieldName = 'GRUPPE'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 4
    end
    object KSQueryLAND: TZRawStringField
      DisplayLabel = 'Land'
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KSQueryPOSTFACH: TZRawStringField
      DisplayLabel = 'Postfach'
      FieldKind = fkData
      FieldName = 'POSTFACH'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryPF_PLZ: TZRawStringField
      DisplayLabel = 'PF-PLZ'
      FieldKind = fkData
      FieldName = 'PF_PLZ'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KSQueryDEFAULT_LIEFANSCHRIFT_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'DEFAULT_LIEFANSCHRIFT_ID'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KSQueryEMAIL: TZRawStringField
      DisplayLabel = 'E-Mail'
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryEMAIL2: TZRawStringField
      FieldKind = fkData
      FieldName = 'EMAIL2'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryINTERNET: TZRawStringField
      DisplayLabel = 'Homepage'
      FieldKind = fkData
      FieldName = 'INTERNET'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryDIVERSES: TZRawStringField
      DisplayLabel = 'Diverses'
      FieldKind = fkData
      FieldName = 'DIVERSES'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryBRIEFANREDE: TZRawStringField
      DisplayLabel = 'Br.-Anrede'
      FieldKind = fkData
      FieldName = 'BRIEFANREDE'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQueryKTO_INHABER: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO_INHABER'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryBLZ: TZRawStringField
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'BLZ'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 8
    end
    object KSQueryKTO: TZRawStringField
      DisplayLabel = 'Konto'
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'KTO'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KSQueryBANK: TZRawStringField
      DisplayLabel = 'Name der Bank'
      FieldKind = fkData
      FieldName = 'BANK'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KSQueryIBAN: TZRawStringField
      FieldKind = fkData
      FieldName = 'IBAN'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQuerySWIFT: TZRawStringField
      FieldKind = fkData
      FieldName = 'SWIFT'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KSQuerySTATUS: TZIntegerField
      FieldKind = fkData
      FieldName = 'STATUS'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryNET_SKONTO: TFloatField
      FieldKind = fkData
      FieldName = 'NET_SKONTO'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0 %'
      EditFormat = '0.0'
    end
    object KSQueryNET_TAGE: TZShortIntField
      FieldKind = fkData
      FieldName = 'NET_TAGE'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0'
    end
    object KSQueryBRT_TAGE: TZShortIntField
      FieldKind = fkData
      FieldName = 'BRT_TAGE'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object KSQueryWAERUNG: TZRawStringField
      DisplayLabel = 'Währung'
      FieldKind = fkData
      FieldName = 'WAERUNG'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KSQueryINFO: TBlobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryGRABATT: TFloatField
      DisplayLabel = 'Rab.'
      FieldKind = fkData
      FieldName = 'GRABATT'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object KSQueryKUN_KRDLIMIT: TFloatField
      DisplayLabel = 'Kreditlim.'
      FieldKind = fkData
      FieldName = 'KUN_KRDLIMIT'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryERSTELLT: TZDateField
      DisplayLabel = 'erstellt'
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KSQueryERST_NAME: TZRawStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryGEAEND: TZDateField
      DisplayLabel = 'le. Änderung'
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KSQueryGEAEND_NAME: TZRawStringField
      DisplayLabel = 'geändert von'
      FieldKind = fkData
      FieldName = 'GEAEND_NAME'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQueryKUN_LIEFART: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUN_LIEFART'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryKUN_ZAHLART: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUN_ZAHLART'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryLIEF_LIEFART: TZIntegerField
      FieldKind = fkData
      FieldName = 'LIEF_LIEFART'
      Index = 49
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryLIEF_ZAHLART: TZIntegerField
      FieldKind = fkData
      FieldName = 'LIEF_ZAHLART'
      Index = 50
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00;-;00'
      EditFormat = '#0'
    end
    object KSQueryPR_EBENE: TZShortIntField
      DisplayLabel = 'PE'
      FieldKind = fkData
      FieldName = 'PR_EBENE'
      Index = 51
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      MaxValue = 5
      MinValue = 1
    end
    object KSQueryKUN_GEBDATUM: TZDateField
      DisplayLabel = 'Gebdat.'
      FieldKind = fkData
      FieldName = 'KUN_GEBDATUM'
      Index = 52
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KSQueryKUN_SEIT: TZDateField
      DefaultExpression = 'dd.mm.yyyy'
      FieldKind = fkData
      FieldName = 'KUN_SEIT'
      Index = 53
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'Kunde seit'
      InvalidDisplayText = 'NAD'
    end
    object KSQueryBRUTTO_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 54
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object KSQueryMWST_FREI_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
      Index = 55
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object KSQueryUST_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'UST_NUM'
      Index = 56
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 25
    end
    object KSQuerySPRACH_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SPRACH_ID'
      Index = 57
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-;-'
    end
    object KSQueryVERTRETER_ID: TZCardinalField
      FieldKind = fkData
      FieldName = 'VERTRETER_ID'
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-;-'
    end
    object KSQueryPROVIS_PROZ: TFloatField
      DisplayLabel = 'Provision'
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'PROVIS_PROZ'
      Index = 59
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '0.00" %"'
      EditFormat = '0.00'
    end
    object KSQuerySHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQuerySHOP_PASSWORD: TZRawStringField
      FieldKind = fkData
      FieldName = 'SHOP_PASSWORD'
      Index = 61
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KSQuerySHOP_KUNDE_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_KUNDE_ID'
      Index = 62
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KSQuerySHOP_CHANGE_FLAG: TZByteField
      FieldKind = fkData
      FieldName = 'SHOP_CHANGE_FLAG'
      Index = 63
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KSQuerySHOP_DEL_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'SHOP_DEL_FLAG'
      Index = 64
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
  end
  object AddrUpdSQL: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ADRESSEN WHERE REC_ID=:REC_ID'
    )
    InsertSQL.Strings = (
      'INSERT INTO ADRESSEN '
    )
    ModifySQL.Strings = (
      'UPDATE ADRESSEN WHERE REC_ID=:REC_ID'
    )
    UseSequenceFieldForRefreshSQL = False
    ParamCheck = False
    Left = 101
    Top = 248
  end
  object KS_DS: TDataSource
    DataSet = KSQuery
    OnDataChange = KS_DSDataChange
    Left = 101
    Top = 104
  end
  object KunLiefDS: TDataSource
    DataSet = KunLiefTab
    Left = 101
    Top = 440
  end
  object KunLiefTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = KunLiefTabAfterScroll
    AfterScroll = KunLiefTabAfterScroll
    AfterPost = KunLiefTabAfterScroll
    AfterDelete = KunLiefTabAfterScroll
    SQL.Strings = (
      'select * from ADRESSEN_LIEF'
      'where ADDR_ID=:ADDR_ID'
      'order by NAME1, STRASSE, PLZ, ORT'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 440
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'ADDR_ID'
        ParamType = ptUnknown
      end>
    object KunLiefTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunLiefTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KunLiefTabANREDE: TZRawStringField
      DisplayLabel = 'Anrede'
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunLiefTabNAME1: TZRawStringField
      DisplayLabel = 'Name 1'
      FieldKind = fkData
      FieldName = 'NAME1'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object KunLiefTabNAME2: TZRawStringField
      DisplayLabel = 'Name 2'
      FieldKind = fkData
      FieldName = 'NAME2'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunLiefTabABTEILUNG: TZRawStringField
      DisplayLabel = 'Abteilung'
      FieldKind = fkData
      FieldName = 'ABTEILUNG'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunLiefTabSTRASSE: TZRawStringField
      DisplayLabel = 'Straße'
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object KunLiefTabLAND: TZRawStringField
      DisplayLabel = 'Land'
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KunLiefTabPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 10
    end
    object KunLiefTabORT: TZRawStringField
      DisplayLabel = 'Ort'
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object KunLiefTabINFO: TMemoField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object KunLiefTabNAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME3'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
  end
  object APDS: TDataSource
    DataSet = APTab
    Left = 101
    Top = 296
  end
  object APTab: TZQuery
    Connection = DM1.DB1
    BeforeInsert = APTabBeforeEdit
    BeforeEdit = APTabBeforeEdit
    BeforePost = APTabBeforePost
    AfterPost = KSQueryAfterPost
    BeforeDelete = APTabBeforeDelete
    OnNewRecord = APTabNewRecord
    SQL.Strings = (
      'select * from APARTNER'
      'where ADDR_ID=:ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 32
    Top = 296
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object KFZ_DS: TDataSource
    DataSet = KFZTab
    Left = 101
    Top = 344
  end
  object KFZTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select KFZ_ID, ADDR_ID, FGST_NUM, POL_KENNZ, TYP_ID, TYP, GRUPPE,  '
      'KW, PS, KM_STAND, HUBRAUM, ZULASSUNG, HERSTELLUNG, KAUFDATUM, '
      'LE_BESUCH, NAE_TUEV, NAE_AU'
      'FROM KFZ'
      'where ADDR_ID =:ID'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 344
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object KFZTabKFZ_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KFZ_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabFGST_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'FGST_NUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabPOL_KENNZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'POL_KENNZ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabTYP_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'TYP_ID'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabTYP: TZRawStringField
      FieldKind = fkData
      FieldName = 'TYP'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'GRUPPE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabKW: TZIntegerField
      FieldKind = fkData
      FieldName = 'KW'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabPS: TZIntegerField
      FieldKind = fkData
      FieldName = 'PS'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabKM_STAND: TZIntegerField
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabHUBRAUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'HUBRAUM'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabZULASSUNG: TZDateField
      DefaultExpression = 'dd.mm.yyy'
      FieldKind = fkData
      FieldName = 'ZULASSUNG'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KFZTabHERSTELLUNG: TZDateField
      FieldKind = fkData
      FieldName = 'HERSTELLUNG'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabKAUFDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'KAUFDATUM'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KFZTabLE_BESUCH: TZDateField
      FieldKind = fkData
      FieldName = 'LE_BESUCH'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabNAE_TUEV: TZDateField
      FieldKind = fkData
      FieldName = 'NAE_TUEV'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabNAE_AU: TZDateField
      FieldKind = fkData
      FieldName = 'NAE_AU'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
  end
  object JourTabDS: TDataSource
    DataSet = JourTab
    OnDataChange = JourTabDSDataChange
    Left = 101
    Top = 152
  end
  object JourTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = JourTabAfterOpen
    AfterScroll = JourTabAfterOpen
    OnCalcFields = JourTabCalcFields
    SQL.Strings = (
      'select REC_ID, QUELLE, VRENUM, VLSNUM, RDATUM, LDATUM, KUN_NAME1, '
      'ADDR_ID, KFZ_ID, KM_STAND, NSUMME, MSUMME, BSUMME, '
      'IST_BETRAG, STADIUM, PROJEKT, ORGNUM, WAEHRUNG,'
      'MWST_0, MWST_1, MWST_2, MWST_3'
      'from JOURNAL'
      'where ADDR_ID=118'
      ''
    )
    Params = <>
    Left = 32
    Top = 152
    object JourTabCalcEKVK: TStringField
      DisplayLabel = 'Quelle'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'CalcEKVK'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 12
    end
    object JourTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabQUELLE: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JourTabVRENUM: TZIntegerField
      Alignment = taCenter
      DisplayLabel = 'Beleg-Nr.'
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabVLSNUM: TZIntegerField
      DisplayLabel = 'Beleg-Nr.'
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabRDATUM: TZDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JourTabLDATUM: TZDateField
      DisplayLabel = 'Datum'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'LDATUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JourTabKUN_NAME1: TZRawStringField
      DisplayLabel = 'Kunde'
      DisplayWidth = 36
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object JourTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JourTabKFZ_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KFZ_ID'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JourTabKM_STAND: TZIntegerField
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JourTabNSUMME: TFloatField
      DisplayLabel = 'Netto'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabMSUMME: TFloatField
      DisplayLabel = 'MwSt'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabIST_BETRAG: TFloatField
      DisplayLabel = 'gezahlt'
      DisplayWidth = 14
      FieldKind = fkData
      FieldName = 'IST_BETRAG'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabSTADIUM: TZShortIntField
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabPROJEKT: TZRawStringField
      DisplayWidth = 48
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JourTabORGNUM: TZRawStringField
      DisplayLabel = 'Org.-Nummer'
      DisplayWidth = 24
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabWAEHRUNG: TZRawStringField
      Alignment = taCenter
      DisplayLabel = 'W'
      DisplayWidth = 1
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object JourTabCalcStadium: TStringField
      DisplayLabel = 'Stadium'
      DisplayWidth = 120
      FieldKind = fkCalculated
      FieldName = 'CalcStadium'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object JourTabMWST_0: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabMWST_1: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabMWST_2: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabMWST_3: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object JPosTabDS: TDataSource
    DataSet = JPosTab
    Left = 101
    Top = 200
  end
  object JPosTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JPosTabCalcFields
    SQL.Strings = (
      'select JOURNAL_ID, QUELLE, ARTIKEL_ID, ADDR_ID, VRENUM, '
      'BEZEICHNUNG, MATCHCODE, ARTNUM, BARCODE, MENGE,'
      'EPREIS, RABATT, STEUER_CODE, ARTIKELTYP'
      'from JOURNALPOS'
      'where JOURNAL_ID = 1000'
      'order by POSITION, ARTIKELTYP'
    )
    Params = <>
    Left = 32
    Top = 200
    object JPosTabJOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabQUELLE: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabVRENUM: TZIntegerField
      DisplayLabel = 'Beleg'
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabMATCHCODE: TZRawStringField
      DisplayLabel = 'MATCH'
      DisplayWidth = 24
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabBARCODE: TZRawStringField
      DisplayLabel = 'Barcode'
      DisplayWidth = 24
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabARTNUM: TZRawStringField
      DisplayLabel = 'Art.-Nr.'
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JPosTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0;-,###,##0.0; '
    end
    object JPosTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM";-,###,##0.00 "DM"; '
    end
    object JPosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 7
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0 "%";0.0 "%"; '
    end
    object JPosTabSTEUER_PROZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STEUER_PROZ'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0"%";0"%"; '
    end
    object JPosTabBEZEICHNUNG: TMemoField
      FieldKind = fkData
      FieldName = 'BEZEICHNUNG'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object JPosTabSTEUER_CODE: TZShortIntField
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JPosTabARTIKELTYP: TZRawStringField
      DisplayLabel = 'AT'
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing, ofViewDetail]
    Left = 101
    Top = 56
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select STADIUM, SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'from JOURNAL'
      'where ADDR_ID=118 and YEAR(RDATUM) BETWEEN 2000 and 2001'
      'group by STADIUM, WAEHRUNG'
    )
    Params = <>
    Left = 32
    Top = 392
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 101
    Top = 392
  end
  object MerkmalTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select AM.MERKMAL_ID, AM.NAME, IF(ATM.MERKMAL_ID=AM.MERKMAL_ID,1,0) as FLAG '
      'from ADRESSEN_MERK AM'
      'left outer join ADRESSEN_TO_MERK ATM on ATM.ADDR_ID=:ID and ATM.MERKMAL_ID=AM.MERKMAL_ID'
      'order by FLAG DESC, AM.NAME ASC'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 32
    Top = 248
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object MerkmalTabMERKMAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'MERKMAL_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object MerkmalTabFLAG: TZIntegerField
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'FLAG'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object MerkmalTabNAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
  end
  object JumpMenu: TPopupMenu
    Images = MainForm.ImageList1
    OnPopup = JumpMenuPopup
    Left = 101
    Top = 488
    object JumpMen1: TMenuItem
      Caption = 'Jump-Menü'
      Enabled = False
      ImageIndex = 18
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object Rechnungdrucken1: TMenuItem
      Caption = 'Beleg drucken'
      ImageIndex = 11
      OnClick = Rechnungdrucken1Click
    end
    object Belegbearbeiten1: TMenuItem
      Caption = 'Beleg bearbeiten'
      ImageIndex = 40
      OnClick = Belegbearbeiten1Click
    end
    object zumJournal1: TMenuItem
      Caption = 'zum Journal'
      ImageIndex = 42
      OnClick = zumJournal1Click
    end
  end
end
