object ArtikelForm: TArtikelForm
  Left = 86
  Height = 686
  Top = 85
  Width = 768
  Caption = 'Material und Dienstleistungen'
  ClientHeight = 666
  ClientWidth = 768
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
  OnShow = FormShow
  UseDockManager = True
  LCLVersion = '7.2'
  Scaled = False
  object ArtikelPanel: TPanel
    Left = 0
    Height = 643
    Top = 0
    Width = 768
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 643
    ClientWidth = 768
    Color = 14680063
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Quality = fqAntialiased
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnResize = ArtikelPanelResize
    object Art_PC: TPageControl
      Left = 175
      Height = 594
      Top = 27
      Width = 593
      ActivePage = Allg_TS
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      OnChange = Art_PCChange
      object Allg_TS: TTabSheet
        Tag = 1
        Caption = 'Allgemein'
        ClientHeight = 568
        ClientWidth = 585
        TabVisible = False
        object Panel5: TPanel
          Left = 326
          Height = 568
          Top = 0
          Width = 259
          Align = alRight
          BevelOuter = bvNone
          ClientHeight = 568
          ClientWidth = 259
          TabOrder = 0
          object MerkmaleCB: TGroupBox
            Left = 0
            Height = 106
            Top = 0
            Width = 259
            Align = alTop
            Caption = 'Merkmale'
            ClientHeight = 88
            ClientWidth = 255
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object ArtMerkmalLB: TCheckListBox
              Tag = 1
              Left = 0
              Height = 88
              Top = 0
              Width = 255
              Align = alClient
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 0
              OnClickCheck = ArtMerkmalLBClickCheck
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyPress = MatchKeyPress
              OnKeyDown = MatchKeyDown
              ParentFont = False
              TabOrder = 0
            end
          end
          object KurztextGB: TGroupBox
            Left = 0
            Height = 49
            Top = 106
            Width = 259
            Align = alTop
            Caption = 'Kurztext'
            ClientHeight = 31
            ClientWidth = 255
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object kurzname: TDBEdit
              Tag = 1
              Left = 0
              Height = 21
              Top = 0
              Width = 255
              DataField = 'KURZNAME'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = MatchEnter
              OnExit = kurznameExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
          end
          object KasTextGB: TGroupBox
            Left = 0
            Height = 46
            Top = 155
            Width = 259
            Align = alTop
            Caption = 'Kasse'
            ClientHeight = 28
            ClientWidth = 255
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object kasname: TDBEdit
              Tag = 1
              Left = 0
              Height = 21
              Top = 0
              Width = 255
              DataField = 'KAS_NAME'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = MatchEnter
              OnExit = kurznameExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
          end
          object LangtextGB: TGroupBox
            Left = 0
            Height = 227
            Top = 201
            Width = 259
            Align = alClient
            Caption = 'Langtext'
            ClientHeight = 209
            ClientWidth = 255
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object LtextMemo: TDBMemo
              Tag = 1
              Left = 0
              Height = 209
              Hint = 'Zeilenumbruch mit Strg+Enter, Tab mit Strg+Tab'
              Top = 0
              Width = 255
              Align = alClient
              DataField = 'LANGNAME'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = MatchEnter
              OnExit = LtextMemoExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
              ParentFont = False
              TabOrder = 0
            end
          end
          object InfoGB: TGroupBox
            Left = 0
            Height = 73
            Top = 428
            Width = 259
            Align = alBottom
            Caption = 'Info'
            ClientHeight = 55
            ClientWidth = 255
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object InfoMemo: TDBMemo
              Tag = 1
              Left = 0
              Height = 55
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Top = 0
              Width = 255
              Align = alClient
              DataField = 'INFO'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
          object SpezialGB: TGroupBox
            Left = 0
            Height = 67
            Top = 501
            Width = 259
            Align = alBottom
            Caption = 'Spezial'
            ClientHeight = 49
            ClientWidth = 255
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object NO_RABATT: TDBCheckBox
              Left = 0
              Height = 23
              Top = 0
              Width = 90
              Caption = 'Ohne  Rabatt:'
              DataField = 'NO_RABATT_FLAG'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 0
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object NO_PROV: TDBCheckBox
              Left = 0
              Height = 23
              Top = 24
              Width = 90
              Caption = 'Ohne  Provision'
              DataField = 'NO_PROVISION_FLAG'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object NO_EK: TDBCheckBox
              Left = 96
              Height = 23
              Top = 0
              Width = 90
              Caption = 'EK-Sperre'
              DataField = 'NO_EK_FLAG'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 2
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object NO_VK: TDBCheckBox
              Left = 96
              Height = 23
              Top = 24
              Width = 90
              Caption = 'VK-Sperre'
              DataField = 'NO_VK_FLAG'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object NO_BEZEICHNUNG: TDBCheckBox
              Left = 192
              Height = 23
              Top = 0
              Width = 90
              Caption = 'Bez. fest'
              DataField = 'NO_BEZEDIT_FLAG'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 4
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object SerNoCB: TDBCheckBox
              Left = 192
              Height = 23
              Top = 24
              Width = 90
              Caption = 'SN-Pflicht'
              DataField = 'SN_FLAG'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 5
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Height = 568
          Top = 0
          Width = 326
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 568
          ClientWidth = 326
          TabOrder = 1
          object SuchGB: TGroupBox
            Left = 0
            Height = 144
            Top = 0
            Width = 326
            Align = alTop
            Caption = 'Suchbegriffe'
            ClientHeight = 126
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Match: TDBEdit
              Tag = 1
              Left = 97
              Height = 21
              Top = 0
              Width = 220
              DataField = 'MATCHCODE'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Artikelnr: TDBEdit
              Tag = 1
              Left = 97
              Height = 21
              Top = 24
              Width = 220
              DataField = 'ARTNUM'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnChange = ArtikelnrChange
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Ersatz_artnr: TDBEdit
              Tag = 1
              Left = 97
              Height = 21
              Top = 48
              Width = 220
              DataField = 'ERSATZ_ARTNUM'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object barcode: TDBEdit
              Tag = 1
              Left = 97
              Height = 21
              Top = 72
              Width = 220
              DataField = 'BARCODE'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Label11: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 88
              AutoSize = False
              Caption = 'Suchbegriff:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label12: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 88
              AutoSize = False
              Caption = 'Artikel-Nr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label30: TLabel
              Left = 8
              Height = 13
              Top = 56
              Width = 88
              AutoSize = False
              Caption = 'Ersatz-Nr.:'
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
              Top = 80
              Width = 88
              AutoSize = False
              Caption = 'Barcode/EAN:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label13: TLabel
              Left = 8
              Height = 13
              Top = 104
              Width = 88
              AutoSize = False
              Caption = 'Artikel-Typ:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object ArtikelTyp: TVolgaDBEdit
              Tag = 1
              Left = 97
              Height = 21
              Top = 96
              Width = 220
              Anchors = [akTop, akLeft, akRight]
              AutoDropDown = True
              ButtonWidth = 17
              Color = clWindow
              ComboProps.ComboItems.Strings = (
                'normaler Artikel'
                'Artikel mit Stückliste'
                'Lohn'
                'Transportkosten'
                'Text / Kommentar'
              )
              ComboProps.ComboValues.Strings = (
                'N'
                'S'
                'L'
                'K'
                'T'
              )
              DataField = 'ARTIKELTYP'
              DataSource = AS_DS
              DialogStyle = vdsCombo
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              Style = vcsDropDownList
              TabOrder = 4
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
          end
          object ZuwGB: TGroupBox
            Left = 0
            Height = 145
            Top = 144
            Width = 326
            Align = alTop
            Caption = 'Zuweisungen'
            ClientHeight = 127
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Warengr: TDBEdit
              Left = 97
              Height = 21
              Top = 0
              Width = 40
              DataField = 'WARENGRUPPE'
              DataSource = AS_DS
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Land: TDBEdit
              Left = 97
              Height = 21
              Top = 24
              Width = 40
              DataSource = AS_DS
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object lagerort: TDBEdit
              Tag = 1
              Left = 97
              Height = 21
              Top = 48
              Width = 220
              DataField = 'LAGERORT'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object HerstArtnum: TDBEdit
              Tag = 1
              Left = 97
              Height = 21
              Top = 96
              Width = 220
              DataField = 'HERST_ARTNUM'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 6
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Warengr_CB: TDBLookupComboBox
              Tag = 1
              Cursor = crHandPoint
              Left = 136
              Height = 21
              Top = 0
              Width = 181
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              DataField = 'WARENGRUPPE'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'ID'
              ListField = 'NAME'
              ListFieldIndex = 0
              ListSource = DM1.WgrDS
              LookupCache = False
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object Land_CB: TDBLookupComboBox
              Tag = 1
              Left = 136
              Height = 21
              Top = 24
              Width = 181
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'ID'
              ListField = 'NAME'
              ListFieldIndex = 0
              ListSource = DM1.LandDS
              LookupCache = False
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
              ParentFont = False
              TabOrder = 3
            end
            object Hersteller_CB: TDBLookupComboBox
              Cursor = crHandPoint
              Left = 97
              Height = 21
              Top = 72
              Width = 191
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              DataField = 'HERSTELLER_ID'
              DataSource = AS_DS
              DropDownCount = 15
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'HERSTELLER_ID'
              ListField = 'HERSTELLER_NAME'
              ListFieldIndex = 0
              ListSource = DM1.HerstellerDS
              LookupCache = False
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object HerstellerEdiBtn: TBGRASpeedButton
              Left = 294
              Height = 22
              Hint = 'Hersteller öffnen'
              Top = 72
              Width = 23
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnClick = HerstellerEdiBtnClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
            object Warengruppe: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 87
              AutoSize = False
              Caption = 'Warengruppe'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label14: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 88
              AutoSize = False
              Caption = 'Herkunftsland:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label15: TLabel
              Left = 8
              Height = 13
              Top = 56
              Width = 87
              AutoSize = False
              Caption = 'Lager-Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label68: TLabel
              Left = 8
              Height = 13
              Top = 80
              Width = 87
              AutoSize = False
              Caption = 'Hersteller:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label56: TLabel
              Left = 8
              Height = 13
              Top = 104
              Width = 86
              AutoSize = False
              Caption = 'Herst.-Artnum.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
          object EinheitenGB: TGroupBox
            Left = 0
            Height = 163
            Top = 289
            Width = 326
            Align = alTop
            Caption = 'Einheiten / Konten'
            ClientHeight = 145
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label19: TLabel
              Left = 8
              Height = 13
              Top = 56
              Width = 88
              AutoSize = False
              Caption = 'Mwst-Code:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label17: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 88
              AutoSize = False
              Caption = 'Mengeneinh.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label22: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 88
              AutoSize = False
              Caption = 'Rabattgruppe:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label29: TLabel
              Left = 8
              Height = 13
              Top = 80
              Width = 88
              AutoSize = False
              Caption = 'Gewicht (Kg):'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label53: TLabel
              Left = 8
              Height = 13
              Top = 104
              Width = 88
              AutoSize = False
              Caption = 'Dimension:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label47: TLabel
              Left = 8
              Height = 13
              Top = 128
              Width = 88
              AutoSize = False
              Caption = 'Vertr.-Prov.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label28: TLabel
              Left = 172
              Height = 13
              Top = 8
              Width = 59
              AutoSize = False
              Caption = 'Aufw.-Kto:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label21: TLabel
              Left = 172
              Height = 13
              Top = 32
              Width = 59
              AutoSize = False
              Caption = 'Erlös-Kto:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label46: TLabel
              Left = 172
              Height = 13
              Top = 56
              Width = 59
              AutoSize = False
              Caption = 'Inv.-Wert:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label55: TLabel
              Left = 172
              Height = 13
              Top = 80
              Width = 59
              AutoSize = False
              Caption = 'Länge:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label54: TLabel
              Left = 172
              Height = 13
              Top = 103
              Width = 59
              AutoSize = False
              Caption = 'Größe:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label48: TLabel
              Left = 172
              Height = 13
              Top = 128
              Width = 59
              AutoSize = False
              Caption = 'VPE:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object MEinheit: TDBEdit
              Left = 97
              Height = 21
              Top = 0
              Width = 72
              DataField = 'ME_EINHEIT'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object RabGrpLoCB: TDBLookupComboBox
              Cursor = crHandPoint
              Left = 97
              Height = 21
              Top = 24
              Width = 72
              DataField = 'RABGRP_ID'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'RABGRP_ID'
              ListField = 'RABGRP_ID; BESCHREIBUNG; RABATT1; RABATT2; RABATT3'
              ListFieldIndex = 0
              ListSource = DM1.RabGrpDS
              LookupCache = False
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object Gewicht: TDBEdit
              Left = 97
              Height = 21
              Top = 72
              Width = 72
              DataField = 'GEWICHT'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object dimension: TDBEdit
              Left = 97
              Height = 21
              Top = 96
              Width = 72
              DataField = 'DIMENSION'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object provision: TDBEdit
              Left = 97
              Height = 21
              Top = 120
              Width = 72
              DataField = 'PROVIS_PROZ'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object A_KTO: TDBEdit
              Tag = 1
              Left = 237
              Height = 21
              Top = 0
              Width = 80
              DataField = 'AUFW_KTO'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object E_KTO: TDBEdit
              Tag = 1
              Left = 237
              Height = 21
              Top = 24
              Width = 80
              DataField = 'ERLOES_KTO'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Inventur_wert: TDBEdit
              Tag = 1
              Left = 237
              Height = 21
              Top = 48
              Width = 80
              DataField = 'INVENTUR_WERT'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 8
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Laenge: TDBEdit
              Tag = 1
              Left = 237
              Height = 21
              Top = 72
              Width = 80
              DataField = 'LAENGE'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 9
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Groesse: TDBEdit
              Tag = 1
              Left = 237
              Height = 21
              Top = 96
              Width = 80
              DataField = 'GROESSE'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 10
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object VPE: TDBEdit
              Tag = 1
              Left = 237
              Height = 21
              Top = 120
              Width = 80
              DataField = 'VPE'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 11
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object MwstCB: TVolgaDBEdit
              Left = 97
              Height = 21
              Top = 48
              Width = 72
              AutoDropDown = True
              ButtonWidth = 17
              Color = clWindow
              ComboProps.ComboItems.Strings = (
                '0=0,0%'
                '1=7,0%'
                '2=16,0%'
                '3=0,0%'
              )
              ComboProps.ComboValues.Strings = (
                '0'
                '1'
                '2'
                '3'
              )
              DataField = 'STEUER_CODE'
              DataSource = AS_DS
              DialogStyle = vdsCombo
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              Style = vcsDropDownList
              TabOrder = 2
              OnChange = MwstCBChange
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
          end
          object BewDatGB: TGroupBox
            Left = 0
            Height = 116
            Top = 452
            Width = 326
            Align = alClient
            Caption = 'Menge / Preis'
            ClientHeight = 98
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object EK_Preis: TDBEdit
              Left = 97
              Height = 21
              Top = 48
              Width = 72
              DataField = 'EK_PREIS'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
              OnKeyUp = EK_PreisKeyUp
            end
            object EKPreisLab: TLabel
              Left = 8
              Height = 13
              Top = 56
              Width = 86
              AutoSize = False
              Caption = 'Einkaufspreis:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object GewinnFaktor: TCurrencyEdit
              Tag = 1
              Left = 234
              Height = 21
              Top = 48
              Width = 83
              Alignment = taRightJustify
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000" ";-,0.000" "'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Anchors = [akTop, akLeft, akRight]
              ParentFont = False
              TabOrder = 1
              ZeroEmpty = False
              OnChange = GewinnFaktorChange
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object FaktorLab: TLabel
              Left = 172
              Height = 13
              Top = 56
              Width = 59
              AutoSize = False
              Caption = 'Faktor'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object ListPreisLab: TLabel
              Left = 8
              Height = 13
              Top = 80
              Width = 86
              AutoSize = False
              Caption = 'Listenpreis (2):'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object ListPreis: TDBEdit
              Left = 96
              Height = 21
              Top = 72
              Width = 72
              DataField = 'VK5'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = MatchEnter
              OnExit = vk1Change
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object BruttoPreis: TDBEdit
              Tag = 1
              Left = 233
              Height = 21
              Top = 72
              Width = 83
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = MatchEnter
              OnExit = vk1_bruttoChange
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object BrLiPreisLab: TLabel
              Left = 172
              Height = 13
              Top = 80
              Width = 59
              AutoSize = False
              Caption = 'Brutto :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object MinMenge: TDBEdit
              Left = 97
              Height = 21
              Top = 0
              Width = 72
              DataField = 'MENGE_MIN'
              DataSource = AS_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object ME_Bestvorschlag: TDBEdit
              Left = 97
              Height = 21
              Top = 24
              Width = 72
              DataField = 'MENGE_BVOR'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Menge: TDBEdit
              Tag = 1
              Left = 234
              Height = 21
              Top = 0
              Width = 83
              DataField = 'MENGE_AKT'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnChange = MengeChange
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object MEBestellt: TDBEdit
              Tag = 1
              Left = 234
              Height = 21
              Top = 24
              Width = 83
              DataField = 'MENGE_BESTELLT'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
              OnChange = MengeChange
              OnEnter = MatchEnter
              OnExit = MatchExit
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object Label23: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 86
              AutoSize = False
              Caption = 'Mind.-Bestand:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label60: TLabel
              Left = 8
              Height = 13
              Top = 32
              Width = 86
              AutoSize = False
              Caption = 'Bestellvorschl.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label20: TLabel
              Left = 172
              Height = 13
              Top = 8
              Width = 59
              AutoSize = False
              Caption = 'Bestand:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label59: TLabel
              Left = 172
              Height = 13
              Top = 32
              Width = 59
              AutoSize = False
              Caption = 'Bestellt:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
        end
      end
      object Preis_TS: TTabSheet
        Tag = 2
        Caption = 'Preise'
        ClientHeight = 568
        ClientWidth = 585
        TabVisible = False
        object ArtTopPanelPreise: TPanel
          Left = 0
          Height = 96
          Top = 0
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 96
          ClientWidth = 585
          TabOrder = 0
          object ArtKopfGB: TGroupBox
            Left = 0
            Height = 96
            Top = 0
            Width = 585
            Align = alClient
            Caption = 'Artikel'
            ClientHeight = 78
            ClientWidth = 581
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 88
              AutoSize = False
              Caption = 'Suchbegriff:'
              FocusControl = DBEdit1
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
              Top = 32
              Width = 88
              AutoSize = False
              Caption = 'Artikel-Nr.:'
              FocusControl = DBEdit3
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
              Top = 56
              Width = 88
              AutoSize = False
              Caption = 'Ersatz-Nr.:'
              FocusControl = DBEdit4
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label6: TLabel
              Left = 288
              Height = 13
              Top = 8
              Width = 66
              AutoSize = False
              Caption = 'Kurztext:'
              FocusControl = DBEdit1
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label7: TLabel
              Left = 288
              Height = 13
              Top = 32
              Width = 66
              AutoSize = False
              Caption = 'Langtext:'
              FocusControl = DBEdit3
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 96
              Height = 21
              Top = 0
              Width = 184
              DataField = 'MATCHCODE'
              DataSource = AS_DS
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object DBEdit3: TDBEdit
              Left = 96
              Height = 21
              Top = 24
              Width = 184
              DataField = 'ARTNUM'
              DataSource = AS_DS
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object DBEdit4: TDBEdit
              Left = 96
              Height = 21
              Top = 48
              Width = 184
              DataField = 'ERSATZ_ARTNUM'
              DataSource = AS_DS
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 353
              Height = 21
              Top = 0
              Width = 227
              DataField = 'KURZNAME'
              DataSource = AS_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnKeyDown = MatchKeyDown
              OnKeyPress = MatchKeyPress
            end
            object DBMemo1: TDBMemo
              Tag = 1
              Left = 353
              Height = 48
              Top = 24
              Width = 227
              Anchors = [akTop, akLeft, akRight]
              DataField = 'LANGNAME'
              DataSource = AS_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 2
            end
          end
        end
        object ArtPreisPanel: TPanel
          Left = 0
          Height = 472
          Top = 96
          Width = 585
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 472
          ClientWidth = 585
          TabOrder = 1
          object Panel8: TPanel
            Left = 0
            Height = 472
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel9: TPanel
            Left = 582
            Height = 472
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel11: TPanel
            Left = 3
            Height = 472
            Top = 0
            Width = 579
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 472
            ClientWidth = 579
            TabOrder = 2
            object PreisPC: TPageControl
              Left = 0
              Height = 469
              Top = 3
              Width = 579
              ActivePage = PreisStdTS
              Align = alClient
              Style = tsButtons
              TabIndex = 0
              TabOrder = 0
              OnChange = PreisPCChange
              OnChanging = PreisPCChanging
              object PreisStdTS: TTabSheet
                Tag = 1
                Caption = 'Standard'
                ClientHeight = 440
                ClientWidth = 571
                object EKPreisGB: TGroupBox
                  Left = 0
                  Height = 48
                  Top = 3
                  Width = 571
                  Align = alTop
                  Caption = 'EK-Preise'
                  ClientHeight = 30
                  ClientWidth = 567
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Quality = fqAntialiased
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object ekpreis: TDBEdit
                    Left = 87
                    Height = 21
                    Top = 0
                    Width = 87
                    DataField = 'EK_PREIS'
                    DataSource = AS_DS
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 0
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                    OnKeyUp = EK_PreisKeyUp
                  end
                  object Label3: TLabel
                    Left = 8
                    Height = 13
                    Top = 8
                    Width = 80
                    AutoSize = False
                    Caption = '&EK-Preis :'
                    FocusControl = ekpreis
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    Layout = tlCenter
                    ParentColor = False
                    ParentFont = False
                  end
                  object lastekpreis: TDBEdit
                    Left = 336
                    Height = 21
                    Top = 0
                    Width = 95
                    DataField = 'LAST_EK'
                    DataSource = AS_DS
                    ReadOnly = True
                    Enabled = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 1
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object Label4: TLabel
                    Left = 264
                    Height = 13
                    Top = 8
                    Width = 67
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'letzter &EK :'
                    FocusControl = lastekpreis
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                end
                object VKPreisGB: TGroupBox
                  Left = 0
                  Height = 389
                  Top = 51
                  Width = 571
                  Align = alClient
                  Caption = 'VK-Preise'
                  ClientHeight = 371
                  ClientWidth = 567
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Quality = fqAntialiased
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  object vk1: TDBEdit
                    Tag = -1
                    Left = 88
                    Height = 21
                    Top = 8
                    Width = 87
                    DataField = 'VK1'
                    DataSource = AS_DS
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 0
                    OnEnter = MatchEnter
                    OnExit = vk1Change
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk2: TDBEdit
                    Tag = -2
                    Left = 88
                    Height = 21
                    Top = 32
                    Width = 87
                    DataField = 'VK2'
                    DataSource = AS_DS
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 4
                    OnEnter = MatchEnter
                    OnExit = vk1Change
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk3: TDBEdit
                    Tag = -3
                    Left = 88
                    Height = 21
                    Top = 56
                    Width = 87
                    DataField = 'VK3'
                    DataSource = AS_DS
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 8
                    OnEnter = MatchEnter
                    OnExit = vk1Change
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk4: TDBEdit
                    Tag = -4
                    Left = 88
                    Height = 21
                    Top = 80
                    Width = 87
                    DataField = 'VK4'
                    DataSource = AS_DS
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 12
                    OnEnter = MatchEnter
                    OnExit = vk1Change
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk5: TDBEdit
                    Tag = -5
                    Left = 88
                    Height = 21
                    Top = 104
                    Width = 87
                    DataField = 'VK5'
                    DataSource = AS_DS
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 16
                    OnEnter = MatchEnter
                    OnExit = vk1Change
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object Label1: TLabel
                    Left = 8
                    Height = 13
                    Top = 16
                    Width = 80
                    AutoSize = False
                    Caption = 'VK-Preis &1:'
                    FocusControl = vk1
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object Label2: TLabel
                    Left = 8
                    Height = 13
                    Top = 40
                    Width = 80
                    AutoSize = False
                    Caption = 'VK-Preis &2:'
                    FocusControl = vk2
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object vk3lab: TLabel
                    Left = 8
                    Height = 13
                    Top = 64
                    Width = 80
                    AutoSize = False
                    Caption = 'VK-Preis &3:'
                    FocusControl = vk3
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object vk4lab: TLabel
                    Left = 8
                    Height = 13
                    Top = 88
                    Width = 80
                    AutoSize = False
                    Caption = 'VK-Preis &4:'
                    FocusControl = vk4
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object vk5lab: TLabel
                    Left = 8
                    Height = 13
                    Top = 112
                    Width = 80
                    AutoSize = False
                    Caption = 'VK-Preis &5:'
                    FocusControl = vk5
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object vk1_mwst: TCurrencyEdit
                    Tag = -1
                    Left = 176
                    Height = 21
                    Top = 8
                    Width = 80
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Enabled = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                    Value = 99999
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk2_mwst: TCurrencyEdit
                    Tag = -2
                    Left = 176
                    Height = 21
                    Top = 32
                    Width = 80
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Enabled = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 5
                    Value = 99999
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk3_mwst: TCurrencyEdit
                    Tag = -3
                    Left = 176
                    Height = 21
                    Top = 56
                    Width = 80
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Enabled = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 9
                    Value = 99999
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk4_mwst: TCurrencyEdit
                    Tag = -4
                    Left = 176
                    Height = 21
                    Top = 80
                    Width = 80
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Enabled = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 13
                    Value = 99999
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk5_mwst: TCurrencyEdit
                    Tag = -5
                    Left = 176
                    Height = 21
                    Top = 104
                    Width = 80
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Enabled = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 17
                    Value = 99999
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk1_brutto: TDBEdit
                    Tag = -1
                    Left = 256
                    Height = 21
                    Top = 8
                    Width = 80
                    DataField = 'VK1B'
                    DataSource = AS_DS
                    AutoSize = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 2
                    OnEnter = MatchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk2_brutto: TDBEdit
                    Tag = -2
                    Left = 256
                    Height = 21
                    Top = 32
                    Width = 80
                    DataField = 'VK2B'
                    DataSource = AS_DS
                    AutoSize = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 6
                    OnEnter = MatchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk3_brutto: TDBEdit
                    Tag = -3
                    Left = 256
                    Height = 21
                    Top = 56
                    Width = 80
                    DataField = 'VK3B'
                    DataSource = AS_DS
                    AutoSize = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 10
                    OnEnter = MatchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk4_brutto: TDBEdit
                    Tag = -4
                    Left = 256
                    Height = 21
                    Top = 80
                    Width = 80
                    DataField = 'VK4B'
                    DataSource = AS_DS
                    AutoSize = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 14
                    OnEnter = MatchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk5_brutto: TDBEdit
                    Tag = -5
                    Left = 256
                    Height = 21
                    Top = 104
                    Width = 80
                    DataField = 'VK5B'
                    DataSource = AS_DS
                    AutoSize = False
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxLength = 0
                    ParentFont = False
                    TabOrder = 18
                    OnEnter = MatchEnter
                    OnExit = vk1_bruttoChange
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk1_rgw: TCurrencyEdit
                    Tag = -1
                    Left = 336
                    Height = 21
                    Top = 8
                    Width = 95
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxValue = 999999
                    MinValue = -999999
                    ParentFont = False
                    TabOrder = 3
                    ZeroEmpty = False
                    OnChange = vk1_rgwChange
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk2_rgw: TCurrencyEdit
                    Tag = -2
                    Left = 336
                    Height = 21
                    Top = 32
                    Width = 95
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxValue = 999999
                    MinValue = -999999
                    ParentFont = False
                    TabOrder = 7
                    ZeroEmpty = False
                    OnChange = vk1_rgwChange
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk3_rgw: TCurrencyEdit
                    Tag = -3
                    Left = 336
                    Height = 21
                    Top = 56
                    Width = 95
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxValue = 999999
                    MinValue = -999999
                    ParentFont = False
                    TabOrder = 11
                    ZeroEmpty = False
                    OnChange = vk1_rgwChange
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk4_rgw: TCurrencyEdit
                    Tag = -4
                    Left = 336
                    Height = 21
                    Top = 80
                    Width = 95
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxValue = 999999
                    MinValue = -999999
                    ParentFont = False
                    TabOrder = 15
                    ZeroEmpty = False
                    OnChange = vk1_rgwChange
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object vk5_rgw: TCurrencyEdit
                    Tag = -5
                    Left = 336
                    Height = 21
                    Top = 104
                    Width = 95
                    Alignment = taRightJustify
                    AutoSize = False
                    DisplayFormat = ',0.00 €;-,0.00 €'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    MaxValue = 999999
                    MinValue = -999999
                    ParentFont = False
                    TabOrder = 19
                    ZeroEmpty = False
                    OnChange = vk1_rgwChange
                    OnEnter = MatchEnter
                    OnExit = MatchExit
                    OnKeyDown = MatchKeyDown
                    OnKeyPress = MatchKeyPress
                  end
                  object Label32: TLabel
                    Left = 88
                    Height = 13
                    Top = -8
                    Width = 86
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'Netto'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object MwStLabel: TLabel
                    Left = 176
                    Height = 13
                    Top = -8
                    Width = 80
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'MwSt'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object Label34: TLabel
                    Left = 256
                    Height = 13
                    Top = -8
                    Width = 80
                    AutoSize = False
                    Caption = 'Brutto (incl.MwSt)'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                  object Label35: TLabel
                    Left = 336
                    Height = 13
                    Top = -8
                    Width = 95
                    AutoSize = False
                    Caption = 'Netto-Gewinn'
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    ParentColor = False
                    ParentFont = False
                  end
                end
                object Panel20: TPanel
                  Left = 0
                  Height = 3
                  Top = 0
                  Width = 571
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                end
              end
              object StaffelpreisTS: TTabSheet
                Tag = 2
                Caption = 'Staffelpreise'
                ClientHeight = 440
                ClientWidth = 571
                object PreisGrid: TStringGrid
                  Left = 8
                  Height = 152
                  Top = 8
                  Width = 484
                  ColCount = 6
                  DefaultColWidth = 80
                  DefaultRowHeight = 18
                  Flat = True
                  Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goEditing, goSmoothScroll]
                  ParentShowHint = False
                  RowCount = 8
                  ScrollBars = ssNone
                  TabOrder = 0
                  OnCellProcess = PreisGridExitCell
                  OnGetEditText = PreisGridGetEditText
                  OnKeyPress = PreisGridKeyPress
                  OnPrepareCanvas = PreisGridSetCanvasProperties
                  OnSelectCell = PreisGridSelectCell
                end
              end
              object KunPreisTS: TTabSheet
                Tag = 3
                Caption = 'Kundenpreise'
                ClientHeight = 440
                ClientWidth = 571
                object ArtKunPreisGrid: TDBGrid
                  Left = 0
                  Height = 414
                  Top = 0
                  Width = 571
                  Align = alClient
                  BorderStyle = bsNone
                  Color = clWindow
                  Columns = <                  
                    item
                      Title.Caption = 'Kunde'
                      Width = 200
                      FieldName = 'LieferantStr'
                    end                  
                    item
                      Title.Caption = 'Bestellnummer'
                      Width = 120
                      FieldName = 'BESTNUM'
                    end                  
                    item
                      Title.Caption = 'Preis (netto)'
                      FieldName = 'PREIS'
                    end                  
                    item
                      Title.Caption = 'le. Änderung'
                      Width = 70
                      FieldName = 'GEAEND'
                    end                  
                    item
                      Title.Caption = 'geändert von'
                      Width = 124
                      FieldName = 'GEAEND_NAME'
                    end>
                  DataSource = ArtPreisDS
                  DefaultRowHeight = 17
                  Flat = True
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 2
                end
                object ToolBar4: TToolBar
                  Left = 0
                  Height = 22
                  Top = 418
                  Width = 571
                  Align = alBottom
                  AutoSize = True
                  ButtonHeight = 22
                  ButtonWidth = 75
                  Caption = 'ToolBar1'
                  Color = clBtnFace
                  EdgeBorders = []
                  Images = MainForm.ImageList1
                  List = True
                  ParentColor = False
                  ShowCaptions = True
                  TabOrder = 0
                  object ToolButton8: TToolButton
                    Left = 1
                    Top = 0
                    AutoSize = True
                    Caption = 'Neu'
                    ImageIndex = 31
                    OnClick = NewLiefPreisBtnClick
                  end
                  object ToolButton6: TToolButton
                    Left = 76
                    Height = 22
                    Top = 0
                    Caption = 'ToolButton6'
                    Style = tbsDivider
                  end
                  object KunPreisDelBtn: TToolButton
                    Left = 81
                    Top = 0
                    AutoSize = True
                    Caption = 'Löschen'
                    ImageIndex = 50
                    OnClick = LiefDelBtnClick
                  end
                  object ToolButton7: TToolButton
                    Left = 156
                    Height = 22
                    Top = 0
                    Caption = 'ToolButton7'
                    Style = tbsDivider
                  end
                  object KunPreisSaveBtn: TToolButton
                    Left = 161
                    Top = 0
                    AutoSize = True
                    Caption = 'Speichern'
                    ImageIndex = 16
                    OnClick = LiefPreisSaveBtnClick
                  end
                  object ToolButton30: TToolButton
                    Left = 236
                    Height = 22
                    Top = 0
                    Caption = 'ToolButton30'
                    Style = tbsDivider
                  end
                  object KunPreisAbortBtn: TToolButton
                    Left = 241
                    Top = 0
                    Caption = 'Abbruch'
                    ImageIndex = 19
                    OnClick = LiefPreisAbortBtnClick
                  end
                end
                object Panel21: TPanel
                  Left = 0
                  Height = 4
                  Top = 414
                  Width = 571
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 1
                end
              end
              object LiefPreisTS: TTabSheet
                Tag = 4
                Caption = 'Lieferanten / Preise'
                ClientHeight = 440
                ClientWidth = 571
                object ToolBar3: TToolBar
                  Left = 0
                  Height = 22
                  Top = 418
                  Width = 571
                  Align = alBottom
                  AutoSize = True
                  ButtonHeight = 22
                  ButtonWidth = 75
                  Caption = 'ToolBar1'
                  Color = clBtnFace
                  EdgeBorders = []
                  Images = MainForm.ImageList1
                  List = True
                  ParentColor = False
                  ShowCaptions = True
                  TabOrder = 0
                  object NewLiefPreisBtn: TToolButton
                    Left = 1
                    Top = 0
                    AutoSize = True
                    Caption = 'Neu'
                    ImageIndex = 31
                    OnClick = NewLiefPreisBtnClick
                  end
                  object ToolButton9: TToolButton
                    Left = 76
                    Height = 22
                    Top = 0
                    Caption = 'ToolButton9'
                    Style = tbsDivider
                  end
                  object LiefStdBtn: TToolButton
                    Left = 81
                    Top = 0
                    AutoSize = True
                    Caption = 'Als Standard'
                    ImageIndex = 12
                    OnClick = LiefStdBtnClick
                  end
                  object ToolButton10: TToolButton
                    Left = 167
                    Height = 22
                    Top = 0
                    Caption = 'ToolButton10'
                    Style = tbsDivider
                  end
                  object LiefDelBtn: TToolButton
                    Left = 172
                    Top = 0
                    AutoSize = True
                    Caption = 'Löschen'
                    ImageIndex = 50
                    OnClick = LiefDelBtnClick
                  end
                  object ToolButton11: TToolButton
                    Left = 247
                    Height = 22
                    Top = 0
                    Caption = 'ToolButton11'
                    Style = tbsDivider
                  end
                  object LiefPreisSaveBtn: TToolButton
                    Left = 252
                    Top = 0
                    AutoSize = True
                    Caption = 'Speichern'
                    ImageIndex = 16
                    OnClick = LiefPreisSaveBtnClick
                  end
                  object ToolButton13: TToolButton
                    Left = 327
                    Height = 22
                    Top = 0
                    Caption = 'ToolButton13'
                    Style = tbsDivider
                  end
                  object LiefPreisAbortBtn: TToolButton
                    Left = 332
                    Top = 0
                    AutoSize = True
                    Caption = 'Abbruch'
                    ImageIndex = 19
                    OnClick = LiefPreisAbortBtnClick
                  end
                end
                object ArtLiefPreisGrid: TDBGrid
                  Left = 0
                  Height = 418
                  Top = 0
                  Width = 571
                  Align = alClient
                  BorderStyle = bsNone
                  Color = clWindow
                  Columns = <                  
                    item
                      Title.Caption = 'Lieferant'
                      Width = 200
                      FieldName = 'LieferantStr'
                    end                  
                    item
                      Title.Caption = 'Bestellnummer'
                      Width = 120
                      FieldName = 'BESTNUM'
                    end                  
                    item
                      Title.Caption = 'EK-Preis'
                      FieldName = 'PREIS'
                    end                  
                    item
                      Title.Caption = 'le. Änderung'
                      Width = 70
                      FieldName = 'GEAEND'
                    end                  
                    item
                      Title.Caption = 'geändert von'
                      Width = 124
                      FieldName = 'GEAEND_NAME'
                    end>
                  DataSource = ArtPreisDS
                  DefaultRowHeight = 17
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 1
                end
              end
            end
            object Panel19: TPanel
              Left = 0
              Height = 3
              Top = 0
              Width = 579
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
            end
          end
        end
      end
      object ErweitertTS: TTabSheet
        Tag = 3
        Caption = 'Erweitert'
        ClientHeight = 568
        ClientWidth = 585
        TabVisible = False
        object ArtTopPanelErweitert: TPanel
          Left = 0
          Height = 88
          Top = 0
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel57: TPanel
          Left = 0
          Height = 5
          Top = 88
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
        object ErweitertPC: TPageControl
          Left = 0
          Height = 475
          Top = 93
          Width = 585
          ActivePage = ErsatzteilTS
          Align = alClient
          Style = tsButtons
          TabIndex = 5
          TabOrder = 2
          OnChange = Art_PCChange
          object UserFelderTS: TTabSheet
            Tag = 1
            Caption = 'Benutzerfelder'
            ClientHeight = 446
            ClientWidth = 577
            object Panel17: TPanel
              Left = 0
              Height = 3
              Top = 0
              Width = 577
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object CaoGroupBox2: TGroupBox
              Left = 0
              Height = 443
              Top = 3
              Width = 577
              Align = alClient
              Caption = 'Benutzerfelder'
              ClientHeight = 425
              ClientWidth = 573
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object UFeld01Lab: TLabel
                Left = 8
                Height = 13
                Top = 16
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 01:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld02Lab: TLabel
                Left = 8
                Height = 13
                Top = 40
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 02:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld03Lab: TLabel
                Left = 8
                Height = 13
                Top = 64
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 03:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld04Lab: TLabel
                Left = 8
                Height = 13
                Top = 88
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 04:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld05Lab: TLabel
                Left = 8
                Height = 13
                Top = 112
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 05:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld06Lab: TLabel
                Left = 8
                Height = 13
                Top = 136
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 06:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld07Lab: TLabel
                Left = 8
                Height = 13
                Top = 160
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 07:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld08Lab: TLabel
                Left = 8
                Height = 13
                Top = 184
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 08:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld09Lab: TLabel
                Left = 8
                Height = 13
                Top = 208
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 09:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object UFeld10Lab: TLabel
                Left = 8
                Height = 13
                Top = 232
                Width = 98
                AutoSize = False
                Caption = 'Benutzerfeld 10:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object Userfeld01: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 8
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 0
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld02: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 32
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 1
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld03: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 56
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 2
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld04: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 80
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 3
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld05: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 104
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 4
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld06: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 128
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 5
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld07: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 152
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 6
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld08: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 176
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 7
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld09: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 200
                Width = 454
                DataField = 'USERFELD_01'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 8
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Userfeld10: TDBEdit
                Tag = 1
                Left = 112
                Height = 21
                Top = 224
                Width = 454
                DataField = 'USERFELD_10'
                DataSource = AS_DS
                Anchors = [akTop, akLeft, akRight]
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                TabOrder = 9
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
            end
          end
          object SerNoTS: TTabSheet
            Tag = 2
            Caption = 'Seriennummern'
            ClientHeight = 446
            ClientWidth = 577
            object Panel7: TPanel
              Left = 0
              Height = 3
              Top = 0
              Width = 577
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object CaoGroupBox14: TGroupBox
              Left = 0
              Height = 53
              Top = 393
              Width = 577
              Align = alBottom
              Caption = 'Erfassen'
              ClientHeight = 35
              ClientWidth = 573
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object SNEdit: TEdit
                Left = 8
                Height = 21
                Top = 7
                Width = 200
                CharCase = ecUppercase
                Color = clWindow
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                OnChange = SNEditChange
                ParentFont = False
                ParentShowHint = False
                TabOrder = 0
              end
              object SNAddBtn: TButton
                Left = 216
                Height = 25
                Top = 4
                Width = 184
                Caption = 'Hinzufügen'
                Enabled = False
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                OnClick = SNAddBtnClick
                ParentFont = False
                TabOrder = 1
              end
            end
            object CaoGroupBox16: TGroupBox
              Left = 0
              Height = 70
              Top = 323
              Width = 577
              Align = alBottom
              Caption = 'Details'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object CaoGroupBox15: TGroupBox
              Left = 0
              Height = 320
              Top = 3
              Width = 577
              Align = alClient
              Caption = 'Liste der Seriennummern'
              ClientHeight = 302
              ClientWidth = 573
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              object SerNoGrid: TDBGrid
                Left = 0
                Height = 302
                Top = 0
                Width = 573
                Align = alClient
                BorderStyle = bsNone
                Color = clWindow
                Columns = <                
                  item
                    Title.Caption = 'Seriennummer'
                    Width = 273
                    FieldName = 'SERNUMMER'
                  end                
                  item
                    Title.Caption = 'Einkauf'
                    Width = 76
                    FieldName = 'EINK_NUM'
                  end                
                  item
                    Title.Caption = 'Lieferschein'
                    Width = 76
                    FieldName = 'LIEF_NUM'
                  end                
                  item
                    Title.Caption = 'Rechnung'
                    Width = 76
                    FieldName = 'VERK_NUM'
                  end>
                DataSource = SerNoDS
                DefaultRowHeight = 17
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object StueckListTS: TTabSheet
            Tag = 3
            Caption = 'Stückliste'
            ClientHeight = 446
            ClientWidth = 577
            object ToolBar2: TToolBar
              Left = 0
              Height = 22
              Top = 424
              Width = 577
              Align = alBottom
              AutoSize = True
              ButtonHeight = 22
              ButtonWidth = 117
              Caption = 'ToolBar99'
              Color = clBtnFace
              EdgeInner = esNone
              EdgeOuter = esNone
              Images = MainForm.ImageList1
              List = True
              ParentColor = False
              ShowCaptions = True
              TabOrder = 0
              object DBNavigator2: TDBNavigator
                Left = 1
                Height = 22
                Top = 0
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
                DataSource = STListDS
                Flat = True
                Options = []
                TabOrder = 0
              end
              object ToolButton12: TToolButton
                Left = 242
                Top = 0
                AutoSize = True
                Caption = 'Artikel &hinzufügen'
                ImageIndex = 20
                OnClick = ToolButton12Click
              end
              object STListArtDelBtn: TToolButton
                Left = 359
                Top = 0
                AutoSize = True
                Caption = 'Artikel löschen'
                ImageIndex = 19
                OnClick = STListArtDelBtnClick
              end
            end
            object Panel3: TPanel
              Left = 0
              Height = 3
              Top = 0
              Width = 577
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel3'
              TabOrder = 1
            end
            object CaoGroupBox18: TGroupBox
              Left = 0
              Height = 48
              Top = 376
              Width = 577
              Align = alBottom
              Caption = 'Summe'
              ClientHeight = 30
              ClientWidth = 573
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object Label49: TLabel
                Left = 8
                Height = 13
                Top = 8
                Width = 83
                Caption = 'EK-Preis gesamt :'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object STListSumEK: TCurrencyEdit
                Left = 96
                Height = 21
                Top = 4
                Width = 80
                Alignment = taRightJustify
                Color = clWindow
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentFont = False
                ParentShowHint = False
                TabOrder = 0
                Value = 1
              end
              object STListPreisUebernehmenBtn: TSpeedButton
                Left = 184
                Height = 22
                Top = 4
                Width = 152
                Caption = 'als EK-Preis übernehmen'
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Transparent = False
                OnClick = STListPreisUebernehmenBtnClick
                ParentFont = False
                ParentShowHint = False
              end
              object SetLangTextfromStklBtn: TSpeedButton
                Left = 336
                Height = 22
                Top = 3
                Width = 183
                Caption = 'Details in den Langtext übernehmen'
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Transparent = False
                OnClick = SetLangTextfromStklBtnClick
                ParentFont = False
                ParentShowHint = False
              end
            end
            object CaoGroupBox17: TGroupBox
              Left = 0
              Height = 373
              Top = 3
              Width = 577
              Align = alClient
              Caption = 'Stückliste'
              ClientHeight = 355
              ClientWidth = 573
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              object STListGrid: TDBGrid
                Left = 0
                Height = 355
                Top = 0
                Width = 573
                Align = alClient
                Color = clWindow
                Columns = <                
                  item
                    Title.Caption = 'Menge'
                    Width = 50
                    FieldName = 'MENGE'
                  end                
                  item
                    Title.Caption = 'Artikelnummer'
                    Width = 100
                    FieldName = 'ARTNUM'
                  end                
                  item
                    Title.Caption = 'Matchcode'
                    Visible = False
                    FieldName = 'MATCHCODE'
                  end                
                  item
                    Title.Caption = 'EAN'
                    Visible = False
                    FieldName = 'BARCODE'
                  end                
                  item
                    Title.Caption = 'Artikelbezeichnung'
                    Width = 250
                    FieldName = 'KURZNAME'
                  end                
                  item
                    Title.Caption = 'EK-Preis'
                    FieldName = 'EK_PREIS'
                  end                
                  item
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Quality = fqAntialiased
                    Font.Style = [fsBold]
                    Title.Caption = 'Lagermenge'
                    Width = 65
                    FieldName = 'MENGE_AKT'
                  end>
                DataSource = STListDS
                DefaultRowHeight = 17
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
              end
            end
          end
          object ArtikelSetTS: TTabSheet
            Tag = 4
            Caption = 'Artikelset'
          end
          object ZubehoerTS: TTabSheet
            Tag = 5
            Caption = 'Zubehör'
            ClientHeight = 446
            ClientWidth = 577
            object Panel18: TPanel
              Left = 0
              Height = 3
              Top = 0
              Width = 577
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object CaoGroupBox8: TGroupBox
              Left = 0
              Height = 443
              Top = 3
              Width = 577
              Align = alClient
              Caption = 'Zubehör'
              ClientHeight = 425
              ClientWidth = 573
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object ZubGrid: TDBGrid
                Left = 0
                Height = 425
                Top = 0
                Width = 573
                Align = alClient
                BorderStyle = bsNone
                Color = clWindow
                Columns = <                
                  item
                    Title.Caption = 'Artikelnummer'
                    Width = 100
                    FieldName = 'ARTNUM'
                  end                
                  item
                    Title.Caption = 'Suchbegriff'
                    Width = 100
                    FieldName = 'MATCHCODE'
                  end                
                  item
                    Title.Caption = 'EAN'
                    Visible = False
                    FieldName = 'BARCODE'
                  end                
                  item
                    Title.Caption = 'Artikelbezeichnung'
                    Width = 250
                    FieldName = 'KURZNAME'
                  end                
                  item
                    Title.Caption = 'Lagermenge'
                    Width = 65
                    FieldName = 'MENGE_AKT'
                  end>
                DataSource = STListDS
                DefaultRowHeight = 17
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
              end
            end
          end
          object ErsatzteilTS: TTabSheet
            Tag = 6
            Caption = 'Ersatzteile'
            ClientHeight = 446
            ClientWidth = 577
            object Panel22: TPanel
              Left = 0
              Height = 3
              Top = 0
              Width = 577
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object CaoGroupBox9: TGroupBox
              Left = 0
              Height = 443
              Top = 3
              Width = 577
              Align = alClient
              Caption = 'Ersatzteile'
              ClientHeight = 425
              ClientWidth = 573
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object ErsGrid: TDBGrid
                Left = 0
                Height = 425
                Top = 0
                Width = 573
                Align = alClient
                BorderStyle = bsNone
                Color = clWindow
                Columns = <                
                  item
                    Title.Caption = 'Artikelnummer'
                    Width = 100
                    FieldName = 'ARTNUM'
                  end                
                  item
                    Title.Caption = 'Suchbegriff'
                    Width = 100
                    FieldName = 'MATCHCODE'
                  end                
                  item
                    Title.Caption = 'EAN'
                    Visible = False
                    FieldName = 'BARCODE'
                  end                
                  item
                    Title.Caption = 'Artikelbezeichnung'
                    Width = 250
                    FieldName = 'KURZNAME'
                  end                
                  item
                    Title.Caption = 'Lagermenge'
                    Width = 65
                    FieldName = 'MENGE_AKT'
                  end>
                DataSource = STListDS
                DefaultRowHeight = 17
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
              end
            end
          end
        end
      end
      object ShopTS: TTabSheet
        Tag = 4
        Caption = 'Shop'
        ClientHeight = 568
        ClientWidth = 585
        TabVisible = False
        object Panel6: TPanel
          Left = 0
          Height = 296
          Top = 0
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 296
          ClientWidth = 585
          TabOrder = 0
          object ShopTopPanel: TPanel
            Left = 0
            Height = 296
            Top = 0
            Width = 248
            Align = alLeft
            BevelOuter = bvNone
            ClientHeight = 296
            ClientWidth = 248
            TabOrder = 0
            object ShopAllgGB: TGroupBox
              Left = 0
              Height = 224
              Top = 0
              Width = 248
              Align = alTop
              Caption = 'Allgemein'
              ClientHeight = 206
              ClientWidth = 244
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object ShopPreisEdi: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 80
                Width = 152
                DataField = 'SHOP_PREIS_LISTE'
                DataSource = AS_DS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 3
                OnEnter = MatchEnter
                OnExit = ShopPreisEdiExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object ShopPreisLab: TLabel
                Left = 8
                Height = 13
                Top = 88
                Width = 82
                AutoSize = False
                Caption = 'Preis (netto):'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ShopModellEdi: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 32
                Width = 152
                DataField = 'ARTNUM'
                DataSource = AS_DS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 1
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Label61: TLabel
                Left = 8
                Height = 13
                Top = 41
                Width = 82
                AutoSize = False
                Caption = 'Artikel-Nr.:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ShopArtName: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 56
                Width = 152
                DataField = 'KURZNAME'
                DataSource = AS_DS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 2
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object ShopProdUrlEdi: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Hint = 'ohne führendes http://'
                Top = 104
                Width = 152
                DataField = 'SHOP_DATENBLATT'
                DataSource = AS_DS
                AutoSelect = False
                AutoSize = False
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object ShopImgEdi: TDBEdit
                Left = 88
                Height = 21
                Top = 128
                Width = 128
                DataField = 'SHOP_IMAGE'
                DataSource = AS_DS
                AutoSelect = False
                AutoSize = False
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 5
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object DBEdit17: TDBEdit
                Left = 88
                Height = 21
                Top = 152
                Width = 128
                DataField = 'SHOP_IMAGE_MED'
                DataSource = AS_DS
                AutoSelect = False
                AutoSize = False
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 6
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object DBEdit18: TDBEdit
                Left = 88
                Height = 21
                Top = 176
                Width = 128
                DataField = 'SHOP_IMAGE_LARGE'
                DataSource = AS_DS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 7
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
              object Label66: TLabel
                Left = 8
                Height = 13
                Top = 16
                Width = 82
                AutoSize = False
                Caption = 'Shopartikel:'
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
                Top = 64
                Width = 82
                AutoSize = False
                Caption = 'Artikelname:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object Label67: TLabel
                Left = 8
                Height = 13
                Top = 112
                Width = 82
                AutoSize = False
                Caption = 'Herstellerlink:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ShopImageLab: TLabel
                Left = 8
                Height = 13
                Top = 136
                Width = 82
                AutoSize = False
                Caption = 'Artikelbild:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ShopImageMedLab: TLabel
                Left = 8
                Height = 13
                Top = 160
                Width = 82
                AutoSize = False
                Caption = 'Artikelbild (2):'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ShopImageLargeLab: TLabel
                Left = 8
                Height = 13
                Top = 184
                Width = 82
                AutoSize = False
                Caption = 'Artikelbild (3):'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object ProdImageLargeUploadBtn: TSpeedButton
                Tag = 3
                Left = 217
                Height = 22
                Hint = 'Produkt-Bild hochladen'
                Top = 176
                Width = 23
                Caption = '...'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                OnClick = ProdImageUploadBtnClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object ProdImageMedUploadBtn: TSpeedButton
                Tag = 2
                Left = 217
                Height = 22
                Hint = 'Produkt-Bild hochladen'
                Top = 151
                Width = 23
                Caption = '...'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                OnClick = ProdImageUploadBtnClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object ProdImageUploadBtn: TSpeedButton
                Tag = 1
                Left = 217
                Height = 22
                Hint = 'Produkt-Bild hochladen'
                Top = 127
                Width = 23
                Caption = '...'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                OnClick = ProdImageUploadBtnClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object ShopArtLB: TVolgaDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 8
                Width = 152
                AutoDropDown = True
                ButtonWidth = 17
                ClearValue = '-1'
                Color = clWindow
                ComboProps.ComboItems.Strings = (
                  'kein Shopartikel'
                  'Shopartikel Shop 1'
                )
                ComboProps.ComboValues.Strings = (
                  '-1'
                  '1'
                )
                DataField = 'SHOP_ID'
                DataSource = AS_DS
                DialogStyle = vdsCombo
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                Style = vcsDropDownList
                TabOrder = 0
                OnEnter = MatchEnter
                OnExit = MatchExit
                OnKeyDown = MatchKeyDown
                OnKeyPress = MatchKeyPress
              end
            end
            object ShopDivGB: TGroupBox
              Left = 0
              Height = 72
              Top = 224
              Width = 248
              Align = alClient
              Caption = 'Diverses'
              ClientHeight = 54
              ClientWidth = 244
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object ShopAktivCB: TDBCheckBox
                Left = 8
                Height = 23
                Top = 0
                Width = 232
                Alignment = taLeftJustify
                Caption = 'Aktiv'
                DataField = 'SHOP_VISIBLE'
                DataSource = AS_DS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentFont = False
                TabOrder = 0
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object ShopDelCB: TDBCheckBox
                Left = 8
                Height = 23
                Top = 24
                Width = 232
                Alignment = taLeftJustify
                Caption = 'beim nächsten Update löschen'
                DataField = 'SHOP_DEL_FLAG'
                DataSource = AS_DS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentFont = False
                TabOrder = 1
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
            end
          end
          object ShopKatGB: TGroupBox
            Left = 248
            Height = 296
            Top = 0
            Width = 337
            Align = alClient
            Caption = 'Kategori(en)'
            ClientHeight = 278
            ClientWidth = 333
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object ArtKatGrid: TDBGrid
              Left = 0
              Height = 278
              Hint = 'mit Doppelclick Kat.-Auswahl öffnen'
              Top = 0
              Width = 333
              Align = alClient
              BorderStyle = bsNone
              Color = clWindow
              Columns = <              
                item
                  Title.Caption = 'ID'
                  Width = 30
                  FieldName = 'ID'
                end              
                item
                  Title.Caption = 'Name'
                  Width = 220
                  FieldName = 'NAME'
                end>
              DataSource = ArtKatDS
              DefaultRowHeight = 16
              FixedCols = 0
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Options = [dgTitles, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              OnDblClick = ArtKatGridDblClick
            end
          end
        end
        object ShopBeschrGB: TGroupBox
          Left = 0
          Height = 272
          Top = 296
          Width = 585
          Align = alClient
          Caption = 'Artikelbeschreibung:'
          ClientHeight = 254
          ClientWidth = 581
          Color = clBtnFace
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object Label62: TLabel
            Left = 120
            Height = 13
            Top = -16
            Width = 92
            Alignment = taCenter
            AutoSize = False
            Caption = '(als HTML-Text)'
            Color = clWindow
            Font.Color = clBtnShadow
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          inline SynEdit1: TSynEdit
            Left = 0
            Height = 254
            Top = 0
            Width = 581
            Align = alClient
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Quality = fqNonAntialiased
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Gutter.Width = 57
            Gutter.MouseActions = <>
            RightGutter.Width = 0
            RightGutter.MouseActions = <>
            Highlighter = SynHTMLSyn1
            Keystrokes = <            
              item
                Command = ecUp
                ShortCut = 38
              end            
              item
                Command = ecSelUp
                ShortCut = 8230
              end            
              item
                Command = ecScrollUp
                ShortCut = 16422
              end            
              item
                Command = ecDown
                ShortCut = 40
              end            
              item
                Command = ecSelDown
                ShortCut = 8232
              end            
              item
                Command = ecScrollDown
                ShortCut = 16424
              end            
              item
                Command = ecLeft
                ShortCut = 37
              end            
              item
                Command = ecSelLeft
                ShortCut = 8229
              end            
              item
                Command = ecWordLeft
                ShortCut = 16421
              end            
              item
                Command = ecSelWordLeft
                ShortCut = 24613
              end            
              item
                Command = ecRight
                ShortCut = 39
              end            
              item
                Command = ecSelRight
                ShortCut = 8231
              end            
              item
                Command = ecWordRight
                ShortCut = 16423
              end            
              item
                Command = ecSelWordRight
                ShortCut = 24615
              end            
              item
                Command = ecPageDown
                ShortCut = 34
              end            
              item
                Command = ecSelPageDown
                ShortCut = 8226
              end            
              item
                Command = ecPageBottom
                ShortCut = 16418
              end            
              item
                Command = ecSelPageBottom
                ShortCut = 24610
              end            
              item
                Command = ecPageUp
                ShortCut = 33
              end            
              item
                Command = ecSelPageUp
                ShortCut = 8225
              end            
              item
                Command = ecPageTop
                ShortCut = 16417
              end            
              item
                Command = ecSelPageTop
                ShortCut = 24609
              end            
              item
                Command = ecLineStart
                ShortCut = 36
              end            
              item
                Command = ecSelLineStart
                ShortCut = 8228
              end            
              item
                Command = ecEditorTop
                ShortCut = 16420
              end            
              item
                Command = ecSelEditorTop
                ShortCut = 24612
              end            
              item
                Command = ecLineEnd
                ShortCut = 35
              end            
              item
                Command = ecSelLineEnd
                ShortCut = 8227
              end            
              item
                Command = ecEditorBottom
                ShortCut = 16419
              end            
              item
                Command = ecSelEditorBottom
                ShortCut = 24611
              end            
              item
                Command = ecToggleMode
                ShortCut = 45
              end            
              item
                Command = ecCopy
                ShortCut = 16429
              end            
              item
                Command = ecPaste
                ShortCut = 8237
              end            
              item
                Command = ecDeleteChar
                ShortCut = 46
              end            
              item
                Command = ecCut
                ShortCut = 8238
              end            
              item
                Command = ecDeleteLastChar
                ShortCut = 8
              end            
              item
                Command = ecDeleteLastChar
                ShortCut = 8200
              end            
              item
                Command = ecDeleteLastWord
                ShortCut = 16392
              end            
              item
                Command = ecUndo
                ShortCut = 32776
              end            
              item
                Command = ecRedo
                ShortCut = 40968
              end            
              item
                Command = ecLineBreak
                ShortCut = 13
              end            
              item
                Command = ecSelectAll
                ShortCut = 16449
              end            
              item
                Command = ecCopy
                ShortCut = 16451
              end            
              item
                Command = ecBlockIndent
                ShortCut = 24649
              end            
              item
                Command = ecLineBreak
                ShortCut = 16461
              end            
              item
                Command = ecInsertLine
                ShortCut = 16462
              end            
              item
                Command = ecDeleteWord
                ShortCut = 16468
              end            
              item
                Command = ecBlockUnindent
                ShortCut = 24661
              end            
              item
                Command = ecPaste
                ShortCut = 16470
              end            
              item
                Command = ecCut
                ShortCut = 16472
              end            
              item
                Command = ecDeleteLine
                ShortCut = 16473
              end            
              item
                Command = ecDeleteEOL
                ShortCut = 24665
              end            
              item
                Command = ecUndo
                ShortCut = 16474
              end            
              item
                Command = ecRedo
                ShortCut = 24666
              end            
              item
                Command = ecGotoMarker0
                ShortCut = 16432
              end            
              item
                Command = ecGotoMarker1
                ShortCut = 16433
              end            
              item
                Command = ecGotoMarker2
                ShortCut = 16434
              end            
              item
                Command = ecGotoMarker3
                ShortCut = 16435
              end            
              item
                Command = ecGotoMarker4
                ShortCut = 16436
              end            
              item
                Command = ecGotoMarker5
                ShortCut = 16437
              end            
              item
                Command = ecGotoMarker6
                ShortCut = 16438
              end            
              item
                Command = ecGotoMarker7
                ShortCut = 16439
              end            
              item
                Command = ecGotoMarker8
                ShortCut = 16440
              end            
              item
                Command = ecGotoMarker9
                ShortCut = 16441
              end            
              item
                Command = ecSetMarker0
                ShortCut = 24624
              end            
              item
                Command = ecSetMarker1
                ShortCut = 24625
              end            
              item
                Command = ecSetMarker2
                ShortCut = 24626
              end            
              item
                Command = ecSetMarker3
                ShortCut = 24627
              end            
              item
                Command = ecSetMarker4
                ShortCut = 24628
              end            
              item
                Command = ecSetMarker5
                ShortCut = 24629
              end            
              item
                Command = ecSetMarker6
                ShortCut = 24630
              end            
              item
                Command = ecSetMarker7
                ShortCut = 24631
              end            
              item
                Command = ecSetMarker8
                ShortCut = 24632
              end            
              item
                Command = ecSetMarker9
                ShortCut = 24633
              end            
              item
                Command = EcFoldLevel1
                ShortCut = 41009
              end            
              item
                Command = EcFoldLevel2
                ShortCut = 41010
              end            
              item
                Command = EcFoldLevel3
                ShortCut = 41011
              end            
              item
                Command = EcFoldLevel4
                ShortCut = 41012
              end            
              item
                Command = EcFoldLevel5
                ShortCut = 41013
              end            
              item
                Command = EcFoldLevel6
                ShortCut = 41014
              end            
              item
                Command = EcFoldLevel7
                ShortCut = 41015
              end            
              item
                Command = EcFoldLevel8
                ShortCut = 41016
              end            
              item
                Command = EcFoldLevel9
                ShortCut = 41017
              end            
              item
                Command = EcFoldLevel0
                ShortCut = 41008
              end            
              item
                Command = EcFoldCurrent
                ShortCut = 41005
              end            
              item
                Command = EcUnFoldCurrent
                ShortCut = 41003
              end            
              item
                Command = EcToggleMarkupWord
                ShortCut = 32845
              end            
              item
                Command = ecNormalSelect
                ShortCut = 24654
              end            
              item
                Command = ecColumnSelect
                ShortCut = 24643
              end            
              item
                Command = ecLineSelect
                ShortCut = 24652
              end            
              item
                Command = ecTab
                ShortCut = 9
              end            
              item
                Command = ecShiftTab
                ShortCut = 8201
              end            
              item
                Command = ecMatchBracket
                ShortCut = 24642
              end            
              item
                Command = ecColSelUp
                ShortCut = 40998
              end            
              item
                Command = ecColSelDown
                ShortCut = 41000
              end            
              item
                Command = ecColSelLeft
                ShortCut = 40997
              end            
              item
                Command = ecColSelRight
                ShortCut = 40999
              end            
              item
                Command = ecColSelPageDown
                ShortCut = 40994
              end            
              item
                Command = ecColSelPageBottom
                ShortCut = 57378
              end            
              item
                Command = ecColSelPageUp
                ShortCut = 40993
              end            
              item
                Command = ecColSelPageTop
                ShortCut = 57377
              end            
              item
                Command = ecColSelLineStart
                ShortCut = 40996
              end            
              item
                Command = ecColSelLineEnd
                ShortCut = 40995
              end            
              item
                Command = ecColSelEditorTop
                ShortCut = 57380
              end            
              item
                Command = ecColSelEditorBottom
                ShortCut = 57379
              end>
            MouseActions = <>
            MouseTextActions = <>
            MouseSelActions = <>
            Lines.Strings = (
              'SynEdit1'
            )
            VisibleSpecialChars = [vscSpace, vscTabAtLast]
            SelectedColor.BackPriority = 50
            SelectedColor.ForePriority = 50
            SelectedColor.FramePriority = 50
            SelectedColor.BoldPriority = 50
            SelectedColor.ItalicPriority = 50
            SelectedColor.UnderlinePriority = 50
            SelectedColor.StrikeOutPriority = 50
            ScrollOnEditLeftOptions.ScrollExtraPercent = 20
            ScrollOnEditLeftOptions.ScrollExtraMax = 10
            ScrollOnEditRightOptions.ScrollExtraPercent = 30
            ScrollOnEditRightOptions.ScrollExtraMax = 25
            BracketHighlightStyle = sbhsBoth
            BracketMatchColor.Background = clNone
            BracketMatchColor.Foreground = clNone
            BracketMatchColor.Style = [fsBold]
            FoldedCodeColor.Background = clNone
            FoldedCodeColor.Foreground = clGray
            FoldedCodeColor.FrameColor = clGray
            MouseLinkColor.Background = clNone
            MouseLinkColor.Foreground = clBlue
            LineHighlightColor.Background = clNone
            LineHighlightColor.Foreground = clNone
            inline SynLeftGutterPartList1: TSynGutterPartList
              object SynGutterMarks1: TSynGutterMarks
                Width = 24
                MouseActions = <>
              end
              object SynGutterLineNumber1: TSynGutterLineNumber
                Width = 17
                MouseActions = <>
                MarkupInfo.Background = clBtnFace
                MarkupInfo.Foreground = clNone
                DigitCount = 2
                ShowOnlyLineNumbersMultiplesOf = 1
                ZeroStart = False
                LeadingZeros = False
              end
              object SynGutterChanges1: TSynGutterChanges
                Width = 4
                MouseActions = <>
                ModifiedColor = 59900
                SavedColor = clGreen
              end
              object SynGutterSeparator1: TSynGutterSeparator
                Width = 2
                MouseActions = <>
                MarkupInfo.Background = clWhite
                MarkupInfo.Foreground = clGray
              end
              object SynGutterCodeFolding1: TSynGutterCodeFolding
                MouseActions = <>
                MarkupInfo.Background = clNone
                MarkupInfo.Foreground = clGray
                MouseActionsExpanded = <>
                MouseActionsCollapsed = <>
              end
            end
          end
        end
      end
      object Link_TS: TTabSheet
        Tag = 5
        Caption = 'Dateien'
        ClientHeight = 568
        ClientWidth = 585
        TabVisible = False
        object ArtTopPanelDateien: TPanel
          Left = 0
          Height = 88
          Top = 0
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object CaoGroupBox7: TGroupBox
          Left = 0
          Height = 480
          Top = 88
          Width = 585
          Align = alClient
          Caption = 'Datei-Link''s'
          ClientHeight = 462
          ClientWidth = 581
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object LinkPanel: TPanel
            Left = 0
            Height = 462
            Top = 0
            Width = 581
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
      end
      object Hist_TS: TTabSheet
        Tag = 6
        Caption = 'Historie'
        ClientHeight = 568
        ClientWidth = 585
        TabVisible = False
        object ArtTopPanelHistorie: TPanel
          Left = 0
          Height = 88
          Top = 0
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object HistSumBar: TStatusBar
          Left = 0
          Height = 23
          Top = 545
          Width = 585
          Panels = <          
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Einkauf'
              Width = 40
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Alignment = taRightJustify
              Text = '0 Stück'
              Width = 80
            end          
            item
              Alignment = taRightJustify
              Bevel = pbNone
              Text = 'Verkauf'
              Width = 45
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Alignment = taRightJustify
              Text = '0 Stück'
              Width = 80
            end          
            item
              Alignment = taCenter
              Text = 'alles Netto !'
              Width = 50
            end>
          SimplePanel = False
        end
        object Panel2: TPanel
          Left = 0
          Height = 28
          Top = 88
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 28
          ClientWidth = 585
          TabOrder = 2
          object Panel13: TPanel
            Left = 0
            Height = 2
            Top = 26
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel14: TPanel
            Left = 582
            Height = 2
            Top = 26
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object ToolBar99: TToolBar
            Left = 0
            Height = 26
            Top = 0
            Width = 585
            Caption = 'ToolBar99'
            Color = clBtnFace
            Images = MainForm.ImageList1
            List = True
            ParentColor = False
            ShowCaptions = True
            TabOrder = 2
            Wrapable = False
            object Label27: TLabel
              Left = 1
              Height = 22
              Top = 2
              Width = 55
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Selektion : '
              Layout = tlCenter
              ParentColor = False
            end
            object HistorySelCB: TComboBox
              Left = 56
              Height = 21
              Top = 2
              Width = 181
              AutoComplete = True
              AutoCompleteText = [cbactEnabled, cbactEndOfLineComplete, cbactSearchAscending]
              Color = clWindow
              DropDownCount = 10
              ItemHeight = 13
              Items.Strings = (
                'alle Bewegungen'
                'nur Einkäufe'
                'nur Verkäufe'
                'Angebote'
                'Lieferscheine'
                'EK-Bestellungen'
                'offene Bestellungen'
                'unfertige Bestellungen'
                'unfertige Rechnungen'
              )
              OnChange = JahrCBChange
              Style = csDropDownList
              TabOrder = 1
            end
            object ToolButton4: TToolButton
              Left = 237
              Height = 22
              Top = 2
              Caption = 'ToolButton4'
              Style = tbsDivider
            end
            object Label26: TLabel
              Left = 242
              Height = 22
              Top = 2
              Width = 38
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Jahr : '
              Layout = tlCenter
              ParentColor = False
            end
            object JahrCB: TComboBox
              Left = 280
              Height = 21
              Top = 2
              Width = 65
              ItemHeight = 13
              OnChange = JahrCBChange
              Style = csDropDownList
              TabOrder = 0
            end
            object ToolButton5: TToolButton
              Left = 345
              Height = 22
              Top = 2
              Caption = 'ToolButton5'
              Style = tbsDivider
            end
            object JumpMenuBtn: TToolButton
              Left = 350
              Top = 2
              AutoSize = True
              Caption = 'Aktionen ... '
              DropdownMenu = JumpMenu
              ImageIndex = 18
            end
          end
        end
        object Panel15: TPanel
          Left = 0
          Height = 3
          Top = 116
          Width = 585
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
        end
        object CaoGroupBox4: TGroupBox
          Left = 0
          Height = 426
          Top = 119
          Width = 585
          Align = alClient
          Caption = 'Vorgänge'
          ClientHeight = 408
          ClientWidth = 581
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object HistGrid: TDBGrid
            Left = 0
            Height = 408
            Top = 0
            Width = 581
            Align = alClient
            BorderStyle = bsNone
            Color = clWindow
            Columns = <            
              item
                ReadOnly = True
                Title.Caption = 'Quelle'
                Width = 58
                FieldName = 'CalcQuelle'
              end            
              item
                Title.Caption = 'Datum'
                Width = 61
                FieldName = 'RDATUM'
              end            
              item
                Alignment = taRightJustify
                Title.Caption = 'Beleg'
                Width = 49
                FieldName = 'VRENUM'
              end            
              item
                Title.Caption = 'Kunde / Lieferant'
                Width = 181
                FieldName = 'KUN_NAME1'
              end            
              item
                Title.Caption = 'Menge'
                Width = 47
                FieldName = 'MENGE'
              end            
              item
                Title.Caption = 'E-Preis'
                Width = 69
                FieldName = 'EPREIS_STR'
              end            
              item
                Title.Caption = 'Rabatt'
                Width = 52
                FieldName = 'RABATT'
              end            
              item
                Title.Caption = 'Gesamt'
                Width = 85
                FieldName = 'GPREIS_STR'
              end            
              item
                Title.Caption = 'MwSt'
                Width = 36
                FieldName = 'STEUER_PROZ'
              end>
            DataSource = JPosDS
            DefaultRowHeight = 17
            Flat = True
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            PopupMenu = JumpMenu
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object Such_TS: TTabSheet
        Tag = 7
        Caption = 'Liste'
        ClientHeight = 568
        ClientWidth = 585
        TabVisible = False
        object ArtSuchGrid: TDBGrid
          Left = 0
          Height = 568
          Top = 0
          Width = 585
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'WG'
              Width = 26
              FieldName = 'WARENGRUPPE'
            end          
            item
              ReadOnly = True
              Title.Caption = 'T'
              Width = 11
              FieldName = 'ARTIKELTYP'
            end          
            item
              Title.Caption = 'Suchbegriff'
              Width = 124
              FieldName = 'MATCHCODE'
            end          
            item
              Title.Caption = 'Art.-Nr.'
              Width = 93
              FieldName = 'ARTNUM'
            end          
            item
              Title.Caption = 'Ersatz-Art.Nr.'
              Visible = False
              FieldName = 'ERSATZ_ARTNUM'
            end          
            item
              Title.Caption = 'Herst.-Artikelnr.'
              Visible = False
              FieldName = 'HERST_ARTNUM'
            end          
            item
              Title.Caption = 'Barcode'
              Visible = False
              FieldName = 'BARCODE'
            end          
            item
              Title.Caption = 'Kurzname'
              Width = 196
              FieldName = 'KURZNAME'
            end          
            item
              ReadOnly = True
              Title.Caption = 'Langtext (max 200 Zeichen)'
              Visible = False
              FieldName = 'LN'
            end          
            item
              Title.Caption = 'Menge'
              Width = 47
              FieldName = 'MENGE_AKT'
            end          
            item
              ReadOnly = True
              Title.Caption = 'Menge Best.'
              FieldName = 'MENGE_BESTELLT'
            end          
            item
              Title.Caption = 'ME-Einh.'
              Width = 49
              FieldName = 'ME_EINHEIT'
            end          
            item
              Title.Caption = 'EK-Preis'
              Width = 54
              FieldName = 'CALC_EK'
            end          
            item
              Title.Caption = 'VK-Preis 1N'
              FieldName = 'CALC_VK1'
            end          
            item
              Title.Caption = 'VK-Preis 1B'
              Visible = False
              FieldName = 'CALC_VK1B'
            end          
            item
              Title.Caption = 'VK-Preis 2N'
              FieldName = 'CALC_VK2'
            end          
            item
              Title.Caption = 'VK-Preis 2B'
              Visible = False
              FieldName = 'CALC_VK2B'
            end          
            item
              Title.Caption = 'VK-Preis 3N'
              Width = 61
              FieldName = 'CALC_VK3'
            end          
            item
              Title.Caption = 'VK-Preis 3B'
              Visible = False
              FieldName = 'CALC_VK3B'
            end          
            item
              Title.Caption = 'VK-Preis 4N'
              Width = 62
              FieldName = 'CALC_VK4'
            end          
            item
              Title.Caption = 'VK-Preis 4B'
              Visible = False
              FieldName = 'CALC_VK4B'
            end          
            item
              Title.Caption = 'VK-Preis 5N'
              Width = 63
              FieldName = 'VK5'
            end          
            item
              Title.Caption = 'VK-Preis 5B'
              Visible = False
              FieldName = 'VK5B'
            end          
            item
              Title.Caption = 'S'
              Width = 12
              FieldName = 'STEUER_CODE'
            end          
            item
              Title.Caption = 'VPE'
              Visible = False
              FieldName = 'VPE'
            end          
            item
              Title.Caption = 'PR-Einh.'
              Visible = False
              FieldName = 'PR_EINHEIT'
            end          
            item
              Title.Caption = 'Länge'
              Visible = False
              FieldName = 'LAENGE'
            end          
            item
              Title.Caption = 'Größe'
              Visible = False
              FieldName = 'GROESSE'
            end          
            item
              Title.Caption = 'Dimension'
              Visible = False
              FieldName = 'DIMENSION'
            end          
            item
              Title.Caption = 'Gewicht'
              Visible = False
              FieldName = 'GEWICHT'
            end          
            item
              Title.Caption = 'I-Wert'
              Visible = False
              FieldName = 'INVENTUR_WERT'
            end          
            item
              Title.Caption = 'Rab.Gr.'
              Visible = False
              FieldName = 'RABGRP_ID'
            end          
            item
              Title.Caption = 'Herk.-Land'
              Width = 86
              FieldName = 'HERKUNFSLAND'
            end          
            item
              Title.Caption = 'Hersteller'
              Width = 80
              FieldName = 'HERSTELLER_NAME'
            end          
            item
              Title.Caption = 'Lagerort'
              Width = 80
              FieldName = 'LAGERORT'
            end          
            item
              Title.Caption = 'E-KTO'
              Width = 36
              FieldName = 'ERLOES_KTO'
            end          
            item
              Title.Caption = 'A-KTO'
              Width = 38
              FieldName = 'AUFW_KTO'
            end          
            item
              Title.Caption = 'erstellt'
              Visible = False
              FieldName = 'ERSTELLT'
            end          
            item
              Title.Caption = 'erstellt von'
              Visible = False
              FieldName = 'ERST_NAME'
            end          
            item
              Title.Caption = 'le. Änderung'
              Visible = False
              FieldName = 'GEAEND'
            end          
            item
              Title.Caption = 'geändert von'
              Visible = False
              FieldName = 'GEAEND_NAME'
            end>
          DataSource = AS_DS
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines]
          TabOrder = 0
        end
      end
    end
    object ArtPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 768
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 764
      Color = clBtnShadow
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object ArtHirViewBtn: TSpeedButton
        Left = 1
        Height = 22
        Top = 1
        Width = 103
        Caption = 'Artikel'
        Flat = True
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        OnClick = ArtHirViewBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
        ParentFont = False
      end
      object ArtSuchenBtn: TSpeedButton
        Tag = 7
        Left = 680
        Height = 22
        Top = 1
        Width = 45
        Caption = 'Liste'
        Flat = True
        OnClick = ArtAllgemeinBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
      end
      object ArtHistorieBtn: TSpeedButton
        Tag = 6
        Left = 624
        Height = 22
        Top = 1
        Width = 55
        Caption = 'Historie'
        Flat = True
        OnClick = ArtAllgemeinBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
      end
      object ArtLinkBtn: TSpeedButton
        Tag = 5
        Left = 568
        Height = 22
        Top = 1
        Width = 57
        Caption = 'Dateien'
        Flat = True
        OnClick = ArtAllgemeinBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
      end
      object ArtShopBtn: TSpeedButton
        Tag = 4
        Left = 528
        Height = 22
        Top = 1
        Width = 40
        Caption = 'Shop'
        Flat = True
        OnClick = ArtAllgemeinBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
      end
      object ArtErweitertBtn: TSpeedButton
        Tag = 3
        Left = 416
        Height = 22
        Top = 1
        Width = 105
        Caption = 'Erweitert'
        Flat = True
        OnClick = ArtAllgemeinBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
      end
      object ArtMengeBtn: TSpeedButton
        Tag = 2
        Left = 352
        Height = 22
        Top = 1
        Width = 60
        Caption = 'Preise'
        Flat = True
        OnClick = ArtAllgemeinBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
      end
      object ArtAllgemeinBtn: TSpeedButton
        Tag = 1
        Left = 288
        Height = 22
        Top = 1
        Width = 63
        Caption = 'Allgemein'
        Flat = True
        OnClick = ArtAllgemeinBtnClick
        OnMouseEnter = ArtAllgemeinBtnMouseEnter
        OnMouseLeave = ArtAllgemeinBtnMouseLeave
      end
    end
    object ArtWgrPan: TPanel
      Left = 0
      Height = 594
      Top = 27
      Width = 170
      Align = alLeft
      BevelOuter = bvNone
      ClientHeight = 594
      ClientWidth = 170
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
        object ArtHirDockBtn: TSpeedButton
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
          OnClick = ArtHirDockBtnClick
          OnMouseEnter = ArtAllgemeinBtnMouseEnter
          OnMouseLeave = ArtAllgemeinBtnMouseLeave
        end
      end
      object ArtWgrTV: TTreeView
        Left = 0
        Height = 570
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
        OnChange = ArtWgrTVChange
        OnDblClick = ArtWgrTVDblClick
        Options = [tvoAutoItemHeight, tvoHideSelection, tvoKeepCollapsedNodes, tvoReadOnly, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoToolTips, tvoThemedDraw]
      end
    end
    object ArtikelToolbar1: TToolBar
      Left = 0
      Height = 22
      Top = 621
      Width = 768
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 22
      ButtonWidth = 88
      Caption = 'ArtikelToolbar1'
      Color = clBtnFace
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.ImageList1
      Indent = 0
      List = True
      ParentColor = False
      ShowCaptions = True
      TabOrder = 2
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 0
        Height = 22
        Top = 0
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
        DataSource = AS_DS
        Flat = True
        Options = []
        TabOrder = 0
      end
      object ToolButton1: TToolButton
        Left = 241
        Height = 22
        Top = 0
        Caption = 'ToolButton1'
        Style = tbsDivider
      end
      object Label52: TLabel
        Left = 246
        Height = 22
        Top = 0
        Width = 61
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchfeld:'
        Layout = tlCenter
        ParentColor = False
      end
      object SuchFeldCB: TComboBox
        Left = 307
        Height = 21
        Top = 0
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
        OnChange = SuchFeldCBChange
        TabOrder = 2
      end
      object Label31: TLabel
        Left = 407
        Height = 22
        Top = 0
        Width = 72
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegriff'
        Layout = tlCenter
        ParentColor = False
      end
      object SuchBeg: TEdit
        Left = 479
        Height = 22
        Hint = 'Mehrere Suchbegriffe können Sie durch ein Leerzeichen trennen.'
        Top = 0
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
        Left = 579
        Height = 22
        Top = 0
        Caption = 'ToolButton2'
        Style = tbsDivider
      end
      object AddMengeLab: TLabel
        Left = 584
        Height = 22
        Top = 0
        Width = 43
        Alignment = taCenter
        AutoSize = False
        Caption = '&Menge'
        Layout = tlCenter
        ParentColor = False
      end
      object ToolButton3: TToolButton
        Left = 685
        Height = 22
        Top = 0
        Caption = 'ToolButton3'
        Style = tbsDivider
      end
      object UebernahmeBtn1: TToolButton
        Left = 690
        Hint = 'Artikel übernehmen mit F12'
        Top = 0
        AutoSize = True
        Caption = 'Übernehmen'
        ImageIndex = 22
        OnClick = UebernahmeBtn1Click
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object AddMengeEdi: TFloatSpinEdit
        Left = 627
        Height = 21
        Top = 0
        Width = 58
        MaxValue = 0
        TabOrder = 3
      end
    end
    object Splitter2: TSplitter
      Left = 170
      Height = 594
      Top = 27
      Width = 5
    end
  end
  object SB1: TStatusBar
    Left = 0
    Height = 23
    Top = 643
    Width = 768
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
    Left = 8
    Top = 104
    object MnuDatei: TMenuItem
      Caption = '&Datei'
      GroupIndex = 2
      object MnuViewEK: TMenuItem
        Caption = 'EK-Preise anzeigen'
        Checked = True
        GroupIndex = 200
        RadioItem = True
        ShortCut = 120
        OnClick = MnuViewEKClick
      end
      object N3: TMenuItem
        Caption = '-'
        GroupIndex = 200
      end
      object MnuClose: TMenuItem
        Caption = 'Schließen'
        GroupIndex = 200
        ImageIndex = 44
        OnClick = MnuCloseClick
      end
    end
    object MnuEdit: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 3
      object MnuNew: TMenuItem
        Caption = '&Neu'
        GroupIndex = 2
        ImageIndex = 23
        ShortCut = 16462
        OnClick = MnuNewClick
      end
      object MnuCopy: TMenuItem
        Caption = 'Kopieren'
        GroupIndex = 2
        ImageIndex = 14
        ShortCut = 16459
        OnClick = MnuCopyClick
      end
      object MnuDelete: TMenuItem
        Caption = '&Löschen'
        GroupIndex = 2
        ImageIndex = 6
        OnClick = MnuDeleteClick
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuDiscountGroup: TMenuItem
        Caption = 'Rabattgruppen'
        GroupIndex = 2
        ImageIndex = 30
        OnClick = MnuDiscountGroupClick
      end
      object N8: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuSearch: TMenuItem
        Caption = 'Suchen'
        GroupIndex = 2
        ImageIndex = 10
        ShortCut = 114
        OnClick = MnuSearchClick
      end
      object N10: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuVisibleCol: TMenuItem
        Caption = 'Sichtbare Spalten'
        GroupIndex = 2
        ImageIndex = 15
        OnClick = MnuVisibleColClick
      end
      object MnuSaveLayout: TMenuItem
        Caption = 'Layout speichern'
        GroupIndex = 2
        ImageIndex = 16
        OnClick = MnuSaveLayoutClick
      end
      object N2: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object uebernehmen1: TMenuItem
        Caption = 'Übernehmen'
        GroupIndex = 2
        Hint = 'Artikel übernehmen mit F12'
        ImageIndex = 22
        ShortCut = 123
        Visible = False
        OnClick = UebernahmeBtn1Click
      end
      object bernehmenundSchlieen1: TMenuItem
        Caption = 'Übernehmen und Schließen'
        GroupIndex = 2
        ImageIndex = 22
        ShortCut = 32891
        Visible = False
        OnClick = bernehmenundSchlieen1Click
      end
    end
    object MnuSort: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 4
      object MnuSortMatch: TMenuItem
        Tag = 1
        Caption = 'Suchbegriff'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
      object MnuSortArtNo: TMenuItem
        Tag = 2
        Caption = 'Artikelnummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
    end
    object MnuPrint: TMenuItem
      Caption = 'Drucken'
      GroupIndex = 5
      object MnuPrintList: TMenuItem
        Caption = 'Artikelliste'
        ImageIndex = 11
        OnClick = MnuPrintListClick
      end
      object MnuPrintPartList: TMenuItem
        Caption = 'Artikel-Stückliste'
        ImageIndex = 11
        OnClick = MnuPrintPartListClick
      end
      object MnuPrintHistory: TMenuItem
        Caption = 'Artikel-Historie'
        ImageIndex = 11
        OnClick = MnuPrintHistoryClick
      end
    end
    object MnuView: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 6
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
        OnClick = ArtAllgemeinBtnClick
      end
      object MengePreise1: TMenuItem
        Tag = 2
        Caption = 'Preise'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32884
        OnClick = ArtAllgemeinBtnClick
      end
      object Erweitert1: TMenuItem
        Tag = 3
        Caption = 'Erweitert'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32886
        OnClick = ArtAllgemeinBtnClick
      end
      object Shop1: TMenuItem
        Tag = 4
        Caption = 'Shop'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32885
        OnClick = ArtAllgemeinBtnClick
      end
      object Dateien1: TMenuItem
        Tag = 5
        Caption = 'Dateien'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32887
        OnClick = ArtAllgemeinBtnClick
      end
      object Historie1: TMenuItem
        Tag = 6
        Caption = 'Historie'
        GroupIndex = 4
        RadioItem = True
        OnClick = ArtAllgemeinBtnClick
      end
      object Liste1: TMenuItem
        Tag = 7
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        OnClick = ArtAllgemeinBtnClick
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
      object N6: TMenuItem
        Caption = '-'
        GroupIndex = 200
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 200
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
    object MnuExtras: TMenuItem
      Caption = '&Extras'
      GroupIndex = 7
      object ArtikelZusammenfassen1: TMenuItem
        Caption = 'Artikel zusammenfassen'
        ImageIndex = 9
        OnClick = ArtikelZusammenfassen1Click
      end
      object Artikelnummernvergeben1: TMenuItem
        Caption = 'Artikelnummern vergeben'
        ImageIndex = 18
        OnClick = Artikelnummernvergeben1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object MnuImportUpdate: TMenuItem
        Caption = 'Import / Update'
        ImageIndex = 33
        OnClick = MnuImportUpdateClick
      end
      object MnuExportCSV: TMenuItem
        Caption = 'Export (CSV)'
        GroupIndex = 2
        ImageIndex = 37
        OnClick = MnuExportCSVClick
      end
      object N9: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuUpdateEDI: TMenuItem
        Caption = 'Artikeldaten aktualisieren'
        GroupIndex = 2
        ImageIndex = 9
        OnClick = MnuUpdateEDIClick
      end
      object N11: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuDelAllArtikelFromWGR: TMenuItem
        Caption = 'Alle Artikel in der akt. Warengruppe löschen'
        GroupIndex = 2
        ImageIndex = 1
        Visible = False
        OnClick = MnuDelAllArtikelFromWGRClick
      end
      object N12: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object MnuSearchSerNo: TMenuItem
        Caption = 'Seriennummer suchen'
        GroupIndex = 2
        OnClick = MnuSearchSerNoClick
      end
      object MnuExtSearch: TMenuItem
        Caption = 'Erweiterte Suche'
        GroupIndex = 2
        ImageIndex = 15
        ShortCut = 16471
        OnClick = MnuExtSearchClick
      end
    end
  end
  object JumpMenu: TPopupMenu
    Images = MainForm.ImageList1
    OnPopup = JumpMenuPopup
    Left = 8
    Top = 56
    object JumpMen1: TMenuItem
      Caption = 'Jump-Menü'
      Enabled = False
      ImageIndex = 18
    end
    object N7: TMenuItem
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
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing, ofViewDetail]
    Left = 80
    Top = 56
  end
  object MerkmalTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL_TO_MERK where ARTIKEL_ID=:ID order by MERKMAL_ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 80
    Top = 104
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object MerkmalTabMERKMAL_ID: TZCardinalField
      FieldKind = fkData
      FieldName = 'MERKMAL_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object MerkmalTabARTIKEL_ID: TZCardinalField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 8
    Top = 152
  end
  object StListUpdSQL: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from ARTIKEL_STUECKLIST '
      'where REC_ID=:REC_ID and ART_ID=:ART_ID'
    )
    InsertSQL.Strings = (
      'INSERT INTO ARTIKEL_STUECKLIST '
      'SET REC_ID=:REC_ID, ART_ID=:ART_ID, MENGE=:MENGE, '
      'ERSTELLT=now(), ERST_NAME=:ERST_NAME,'
      'ARTIKEL_ART=:ARTIKEL_ART'
    )
    ModifySQL.Strings = (
      'UPDATE ARTIKEL_STUECKLIST '
      'SET ART_ID=:ART_ID, MENGE=:MENGE, '
      'GEAEND=now(), GEAEND_NAME=:GEAEND_NAME,'
      'ARTIKEL_ART=:ARTIKEL_ART'
      'where REC_ID=:REC_ID and ART_ID=:ART_ID'
    )
    UseSequenceFieldForRefreshSQL = False
    ParamCheck = False
    Left = 80
    Top = 152
  end
  object STListTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = STListTabAfterOpen
    UpdateObject = StListUpdSQL
    BeforePost = STListTabBeforePost
    AfterPost = STListTabAfterOpen
    AfterDelete = STListTabAfterOpen
    SQL.Strings = (
      'select ARS.*,  A.ARTNUM, A.MATCHCODE, A.BARCODE, A.KURZNAME, A.EK_PREIS, A.MENGE_AKT'
      'from ARTIKEL_STUECKLIST ARS, ARTIKEL A'
      'where ARS.REC_ID=:ID and A.REC_ID=ARS.ART_ID'
      'and ARTIKEL_ART=:ART'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'ART'
        ParamType = ptInput
      end>
    Left = 8
    Top = 200
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'ART'
        ParamType = ptInput
      end>
    object STListTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object STListTabART_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ART_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object STListTabMENGE: TZDoubleField
      DisplayLabel = 'Menge'
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.00'
    end
    object STListTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object STListTabERST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object STListTabGEAEND: TZDateField
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object STListTabGEAEND_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'GEAEND_NAME'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object STListTabARTNUM: TZRawStringField
      DisplayLabel = 'Artikelnummer'
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
    end
    object STListTabMATCHCODE: TZRawStringField
      DisplayLabel = 'Matchcode'
      DisplayWidth = 30
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object STListTabBARCODE: TZRawStringField
      DisplayLabel = 'EAN'
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object STListTabKURZNAME: TZRawStringField
      DisplayLabel = 'Artikelbezeichnung'
      FieldKind = fkData
      FieldName = 'KURZNAME'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object STListTabEK_PREIS: TZDoubleField
      DisplayLabel = 'EK-Preis'
      FieldKind = fkData
      FieldName = 'EK_PREIS'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      DisplayFormat = ',#0.00'
    end
    object STListTabMENGE_AKT: TZDoubleField
      DisplayLabel = 'Lagermenge'
      FieldKind = fkData
      FieldName = 'MENGE_AKT'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object STListTabARTIKEL_ART: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ART'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 3
    end
  end
  object ASQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = ASQueryAfterScroll
    BeforeScroll = ASQueryBeforeScroll
    AfterScroll = ASQueryAfterScroll
    OnCalcFields = ASQueryCalcFields
    UpdateObject = ArtikelUpdateSql
    OnUpdateRecord = ASQueryUpdateRecord
    BeforePost = ASQueryBeforePost
    AfterPost = ASQueryAfterScroll
    AfterCancel = ASQueryAfterScroll
    AfterDelete = ASQueryAfterScroll
    OnPostError = ASQueryPostError
    OnNewRecord = ASQueryNewRecord
    SQL.Strings = (
      'select *,SUBSTRING(LANGNAME,1,200) as LN'
      'from ARTIKEL'
      'LIMIT 0,50'
    )
    Params = <>
    Left = 8
    Top = 248
    object ASQueryREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ASQueryWARENGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'WARENGRUPPE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ASQueryMATCHCODE: TStringField
      DisplayLabel = 'Suchbegriff'
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryARTNUM: TStringField
      DisplayLabel = 'Art.-Nr.'
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryBARCODE: TStringField
      DisplayLabel = 'Barcode'
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryKURZNAME: TStringField
      DisplayLabel = 'Kurzname'
      FieldKind = fkData
      FieldName = 'KURZNAME'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ASQueryLANGNAME: TBlobField
      DisplayLabel = 'Langtext'
      FieldKind = fkData
      FieldName = 'LANGNAME'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryVK1: TFloatField
      DisplayLabel = 'VK-Preis 1N'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'VK1'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
    end
    object ASQueryVK1B: TFloatField
      DisplayLabel = 'VK-Preis 1B'
      FieldKind = fkData
      FieldName = 'VK1B'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryCALC_VK1: TFloatField
      DisplayLabel = 'VK-Preis 1N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK1'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
    end
    object ASQueryCALC_VK1B: TFloatField
      DisplayLabel = 'VK-Preis 1B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK1B'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryVK2: TFloatField
      DisplayLabel = 'VK-Preis 2N'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'VK2'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK2B: TFloatField
      DisplayLabel = 'VK-Preis 2B'
      FieldKind = fkData
      FieldName = 'VK2B'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditFormat = '#0.00'
    end
    object ASQueryCALC_VK2: TFloatField
      DisplayLabel = 'VK-Preis 2N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK2'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
    end
    object ASQueryCALC_VK2B: TFloatField
      DisplayLabel = 'VK-Preis 2B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK2B'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryVK3: TFloatField
      DisplayLabel = 'VK-Preis 3N'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'VK3'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK3B: TFloatField
      DisplayLabel = 'VK-Preis 3B'
      FieldKind = fkData
      FieldName = 'VK3B'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditFormat = '#0.00'
    end
    object ASQueryCALC_VK3: TFloatField
      DisplayLabel = 'VK-Preis 3N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK3'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
    end
    object ASQueryCALC_VK3B: TFloatField
      DisplayLabel = 'VK-Preis 3B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK3B'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryVK4: TFloatField
      DisplayLabel = 'VK-Preis 4N'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'VK4'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
      EditFormat = '#0.00'
    end
    object ASQueryVK4B: TFloatField
      DisplayLabel = 'VK-Preis 4B'
      FieldKind = fkData
      FieldName = 'VK4B'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditFormat = '#0.00'
    end
    object ASQueryCALC_VK4: TFloatField
      DisplayLabel = 'VK-Preis 4N'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK4'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
    end
    object ASQueryCALC_VK4B: TFloatField
      DisplayLabel = 'VK-Preis 4B'
      FieldKind = fkCalculated
      FieldName = 'CALC_VK4B'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryVK5: TFloatField
      DisplayLabel = 'VK-Preis 5N'
      FieldKind = fkData
      FieldName = 'VK5'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 "DM"'
    end
    object ASQueryVK5B: TFloatField
      DisplayLabel = 'VK-Preis 5B'
      FieldKind = fkData
      FieldName = 'VK5B'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditFormat = '#0.00'
    end
    object ASQuerySTEUER_CODE: TZSmallIntField
      DisplayLabel = 'S'
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      MaxValue = 3
    end
    object ASQueryARTIKELTYP: TStringField
      DisplayLabel = 'T'
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object ASQueryME_EINHEIT: TStringField
      DisplayLabel = 'ME-Einh.'
      FieldKind = fkData
      FieldName = 'ME_EINHEIT'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object ASQueryERLOES_KTO: TLongintField
      DisplayLabel = 'E-KTO'
      FieldKind = fkData
      FieldName = 'ERLOES_KTO'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-;-'
      MaxValue = 99999
      MinValue = -1
    end
    object ASQueryAUFW_KTO: TLongintField
      DisplayLabel = 'A-KTO'
      FieldKind = fkData
      FieldName = 'AUFW_KTO'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-;-'
      EditFormat = '0'
      MaxValue = 99999
      MinValue = -1
    end
    object ASQueryMENGE_AKT: TFloatField
      DisplayLabel = 'Menge'
      FieldKind = fkData
      FieldName = 'MENGE_AKT'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object ASQueryERSATZ_ARTNUM: TStringField
      DisplayLabel = 'Ersatz-Art.Nr.'
      FieldKind = fkData
      FieldName = 'ERSATZ_ARTNUM'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryKAS_NAME: TStringField
      DisplayLabel = 'Kasentext'
      FieldKind = fkData
      FieldName = 'KAS_NAME'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ASQueryINFO: TBlobField
      DisplayLabel = 'Info'
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryPR_EINHEIT: TFloatField
      DisplayLabel = 'PR-Einh.'
      FieldKind = fkData
      FieldName = 'PR_EINHEIT'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryLAENGE: TStringField
      DisplayLabel = 'Länge'
      FieldKind = fkData
      FieldName = 'LAENGE'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryGROESSE: TStringField
      DisplayLabel = 'Größe'
      FieldKind = fkData
      FieldName = 'GROESSE'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryDIMENSION: TStringField
      DisplayLabel = 'Dimension'
      FieldKind = fkData
      FieldName = 'DIMENSION'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryGEWICHT: TFloatField
      DisplayLabel = 'Gewicht'
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.000'
      EditFormat = '0.0'
    end
    object ASQueryINVENTUR_WERT: TFloatField
      DisplayLabel = 'I-Wert'
      FieldKind = fkData
      FieldName = 'INVENTUR_WERT'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.0 %'
      EditFormat = '0.0'
      MaxValue = 100
    end
    object ASQueryPROVIS_PROZ: TFloatField
      DisplayLabel = 'Provision %'
      FieldKind = fkData
      FieldName = 'PROVIS_PROZ'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.0" %";,#0.0" %";-'
      EditFormat = '0.0'
    end
    object ASQueryEK_PREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldKind = fkData
      FieldName = 'EK_PREIS'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#0.000'
    end
    object ASQueryCALC_EK: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldKind = fkCalculated
      FieldName = 'CALC_EK'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object ASQueryMENGE_START: TFloatField
      FieldKind = fkData
      FieldName = 'MENGE_START'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryMENGE_MIN: TFloatField
      FieldKind = fkData
      FieldName = 'MENGE_MIN'
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      EditFormat = '0'
    end
    object ASQueryMENGE_BESTELLT: TFloatField
      DisplayLabel = 'Menge Best.'
      FieldKind = fkData
      FieldName = 'MENGE_BESTELLT'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object ASQueryMENGE_BVOR: TFloatField
      FieldKind = fkData
      FieldName = 'MENGE_BVOR'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryLAST_EK: TFloatField
      DisplayLabel = 'le. EK-Preis'
      FieldKind = fkData
      FieldName = 'LAST_EK'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditFormat = '0.00'
    end
    object ASQueryHERKUNFSLAND: TStringField
      DisplayLabel = 'Herk.-Land'
      FieldKind = fkData
      FieldName = 'HERKUNFSLAND'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object ASQueryHERSTELLER_NAME: TStringField
      DisplayLabel = 'Hersteller'
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'HERSTELLER_NAME'
      Index = 49
      KeyFields = 'HERSTELLER_NAME'
      LookupCache = False
      LookupDataSet = DM1.HerstellerTab
      LookupKeyFields = 'HERSTELLER_ID'
      LookupResultField = 'HERSTELLER_NAME'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 32
    end
    object ASQueryHERSTELLER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'HERSTELLER_ID'
      Index = 50
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ASQueryLAGERORT: TStringField
      DisplayLabel = 'Lagerort'
      FieldKind = fkData
      FieldName = 'LAGERORT'
      Index = 51
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryERSTELLT: TZDateField
      DisplayLabel = 'erstellt'
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 52
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object ASQueryERST_NAME: TStringField
      DisplayLabel = 'erstellt von'
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 53
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryGEAEND: TZDateField
      DisplayLabel = 'le. Änderung'
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 54
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object ASQueryGEAEND_NAME: TStringField
      DisplayLabel = 'geändert von'
      FieldKind = fkData
      FieldName = 'GEAEND_NAME'
      Index = 55
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryRABGRP_ID: TStringField
      FieldKind = fkData
      FieldName = 'RABGRP_ID'
      Index = 56
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object ASQueryAUTODEL_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'AUTODEL_FLAG'
      Index = 57
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQuerySN_FLAG: TBooleanField
      DisplayLabel = 'SN-Pflicht'
      FieldKind = fkData
      FieldName = 'SN_FLAG'
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQueryNO_RABATT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_RABATT_FLAG'
      Index = 59
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQueryNO_PROVISION_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_PROVISION_FLAG'
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQueryNO_BEZEDIT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_BEZEDIT_FLAG'
      Index = 61
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQueryNO_EK_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_EK_FLAG'
      Index = 62
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQueryNO_VK_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_VK_FLAG'
      Index = 63
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQueryALTTEIL_FLAG: TBooleanField
      DisplayLabel = 'Alt-Teil'
      FieldKind = fkData
      FieldName = 'ALTTEIL_FLAG'
      Index = 64
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQuerySHOP_ID: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 65
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ASQuerySHOP_LANGTEXT: TMemoField
      DisplayLabel = 'Shop-Langtext'
      FieldKind = fkData
      FieldName = 'SHOP_LANGTEXT'
      Index = 66
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ASQuerySHOP_IMAGE: TStringField
      DisplayLabel = 'Shop Bild-URL'
      FieldKind = fkData
      FieldName = 'SHOP_IMAGE'
      Index = 67
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ASQuerySHOP_IMAGE_MED: TStringField
      FieldKind = fkData
      FieldName = 'SHOP_IMAGE_MED'
      Index = 68
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ASQuerySHOP_IMAGE_LARGE: TStringField
      FieldKind = fkData
      FieldName = 'SHOP_IMAGE_LARGE'
      Index = 69
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ASQuerySHOP_DATENBLATT: TStringField
      FieldKind = fkData
      FieldName = 'SHOP_DATENBLATT'
      Index = 70
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ASQuerySHOP_PREIS_LISTE: TFloatField
      DisplayLabel = 'Shop-Preis'
      FieldKind = fkData
      FieldName = 'SHOP_PREIS_LISTE'
      Index = 71
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00000000'
    end
    object ASQuerySHOP_CHANGE_DATE: TZDateTimeField
      FieldKind = fkData
      FieldName = 'SHOP_CHANGE_DATE'
      Index = 72
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NADT'
    end
    object ASQuerySHOP_CHANGE_FLAG: TZWordField
      FieldKind = fkData
      FieldName = 'SHOP_CHANGE_FLAG'
      Index = 73
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ASQuerySHOP_ARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_ARTIKEL_ID'
      Index = 74
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQuerySHOP_VISIBLE: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_VISIBLE'
      Index = 75
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQuerySHOP_DEL_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'SHOP_DEL_FLAG'
      Index = 76
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ASQueryDEFAULT_LIEF_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'DEFAULT_LIEF_ID'
      Index = 77
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ASQueryVPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'VPE'
      Index = 78
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#0;#0;-'
      EditFormat = '0'
      MaxValue = 999999
    end
    object ASQueryHERST_ARTNUM: TStringField
      DisplayLabel = 'Herst.-Artikelnr.'
      FieldKind = fkData
      FieldName = 'HERST_ARTNUM'
      Index = 79
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ASQueryUSERFELD_01: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_01'
      Index = 80
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_02: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_02'
      Index = 81
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_03: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_03'
      Index = 82
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_04: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_04'
      Index = 83
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_05: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_05'
      Index = 84
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_06: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_06'
      Index = 85
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_07: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_07'
      Index = 86
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_08: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_08'
      Index = 87
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_09: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_09'
      Index = 88
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryUSERFELD_10: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_10'
      Index = 89
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ASQueryLN: TStringField
      FieldKind = fkData
      FieldName = 'LN'
      Index = 90
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Size = 200
    end
  end
  object JPosTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JPosTabCalcFields
    SQL.Strings = (
      'select '
      'JOURNAL_ID, '
      'JOURNALPOS.QUELLE, '
      'ARTIKEL_ID, '
      'JOURNALPOS.VRENUM, '
      'JOURNALPOS.BEZEICHNUNG, '
      'MENGE,'
      'EPREIS, '
      'RABATT, '
      'JOURNAL.REC_ID, JOURNAL.RDATUM, JOURNAL.KUN_NAME1, WAEHRUNG, '
      'MWST_0, MWST_1, MWST_2, MWST_3, STEUER_CODE,'
      'LDATUM, JOURNAL.VLSNUM, JOURNAL.BRUTTO_FLAG'
      'from JOURNALPOS, JOURNAL'
      'where ARTIKEL_ID>0 and JOURNAL.QUELLE in (3,5)'
      'and JOURNALPOS.JOURNAL_ID = JOURNAL.REC_ID'
      'and JOURNAL.STADIUM BETWEEN 20 and 99'
    )
    Params = <>
    Left = 8
    Top = 296
    object JPosTabCalcQuelle: TStringField
      DisplayLabel = 'Quelle'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'CalcQuelle'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 12
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
    object JPosTabRDATUM: TZDateField
      Alignment = taCenter
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object JPosTabLDATUM: TZDateField
      Alignment = taCenter
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
    object JPosTabVRENUM: TZIntegerField
      DisplayLabel = 'Beleg'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JPosTabVLSNUM: TZIntegerField
      DisplayLabel = 'Beleg'
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JPosTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde / Lieferant'
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object JPosTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00'
    end
    object JPosTabEPREIS: TFloatField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabEPREIS_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'E-Preis'
      FieldKind = fkCalculated
      FieldName = 'EPREIS_STR'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JPosTabRABATT: TFloatField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0 "%";-0.0 "%"; '
    end
    object JPosTabGPREIS_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Gesamt'
      FieldKind = fkCalculated
      FieldName = 'GPREIS_STR'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JPosTabWAEHRUNG: TStringField
      Alignment = taCenter
      DisplayLabel = 'W'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object JPosTabMWST_0: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabMWST_1: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabMWST_3: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabMWST_2: TFloatField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JPosTabSTEUER_CODE: TZSmallIntField
      DisplayLabel = 'ST-Code'
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JPosTabSTEUER_PROZ: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkCalculated
      FieldName = 'STEUER_PROZ'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0"%";0"%"; '
    end
    object JPosTabBRUTTO_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object JPosTabJOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
  end
  object SerNoTab: TZQuery
    Connection = DM1.DB1
    BeforePost = SerNoTabBeforePost
    SQL.Strings = (
      'select * from ARTIKEL_SERNUM'
      'where ARTIKEL_ID =:ID'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 8
    Top = 344
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object SerNoTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object SerNoTabSERNUMMER: TZRawStringField
      DisplayLabel = 'Seriennummer'
      DisplayWidth = 84
      FieldKind = fkData
      FieldName = 'SERNUMMER'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object SerNoTabEINK_NUM: TZIntegerField
      DisplayLabel = 'Einkauf'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'EINK_NUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '0;---;---'
    end
    object SerNoTabLIEF_NUM: TZIntegerField
      DisplayLabel = 'Lieferschein'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'LIEF_NUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object SerNoTabVERK_NUM: TZIntegerField
      DisplayLabel = 'Rechnung'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'VERK_NUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '0;---;---'
    end
    object SerNoTabSNUM_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SNUM_ID'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
  end
  object ArtPreisTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ArtPreisTabAfterScroll
    AfterScroll = ArtPreisTabAfterScroll
    OnCalcFields = ArtPreisTabCalcFields
    BeforePost = ArtPreisTabBeforePost
    AfterPost = ArtPreisTabAfterScroll
    AfterCancel = ArtPreisTabAfterScroll
    AfterDelete = ArtPreisTabAfterScroll
    SQL.Strings = (
      'select * from ARTIKEL_PREIS'
      'where ARTIKEL_ID=:ID and PREIS_TYP=5'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 8
    Top = 392
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object ArtPreisTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ArtPreisTabADRESS_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADRESS_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ArtPreisTabPREIS_TYP: TZByteField
      FieldKind = fkData
      FieldName = 'PREIS_TYP'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ArtPreisTabBESTNUM: TStringField
      DisplayLabel = 'Bestellnummer'
      FieldKind = fkData
      FieldName = 'BESTNUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object ArtPreisTabPREIS: TFloatField
      DisplayLabel = 'EK-Preis'
      FieldKind = fkData
      FieldName = 'PREIS'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabINFO: TMemoField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ArtPreisTabGEAEND: TZDateTimeField
      DisplayLabel = 'le. Änderung'
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object ArtPreisTabGEAEND_NAME: TStringField
      DisplayLabel = 'geändert von'
      FieldKind = fkData
      FieldName = 'GEAEND_NAME'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtPreisTabLieferantStr: TStringField
      DisplayLabel = 'Lieferant'
      FieldKind = fkCalculated
      FieldName = 'LieferantStr'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ArtPreisTabMENGE2: TLongintField
      FieldKind = fkData
      FieldName = 'MENGE2'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtPreisTabPREIS2: TFloatField
      FieldKind = fkData
      FieldName = 'PREIS2'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabMENGE3: TLongintField
      FieldKind = fkData
      FieldName = 'MENGE3'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0'
      EditFormat = '0'
    end
    object ArtPreisTabPREIS3: TFloatField
      FieldKind = fkData
      FieldName = 'PREIS3'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabMENGE4: TLongintField
      FieldKind = fkData
      FieldName = 'MENGE4'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0'
      EditFormat = '0'
    end
    object ArtPreisTabPREIS4: TFloatField
      FieldKind = fkData
      FieldName = 'PREIS4'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabMENGE5: TLongintField
      FieldKind = fkData
      FieldName = 'MENGE5'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0'
      EditFormat = '0'
    end
    object ArtPreisTabPREIS5: TFloatField
      FieldKind = fkData
      FieldName = 'PREIS5'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
  end
  object ArtKat: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select AK.ID, AK.NAME from ARTIKEL_KAT AK, ARTIKEL_TO_KAT A2K'
      'where A2K.KAT_ID=AK.ID and AK.SHOP_ID=:SHOP_ID and A2K.SHOP_ID=:SHOP_ID '
      'and A2K.ARTIKEL_ID=:ARTIKEL_ID and A2K.DEL_FLAG=''N'''
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end    
      item
        DataType = ftInteger
        Name = 'ARTIKEL_ID'
        ParamType = ptInput
      end>
    Left = 8
    Top = 488
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end    
      item
        DataType = ftInteger
        Name = 'ARTIKEL_ID'
        ParamType = ptInput
      end>
  end
  object ArtikelUpdateSql: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from ARTIKEL where REC_ID=:REC_ID'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 8
    Top = 440
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end>
  end
  object SynHTMLSyn1: TSynHTMLSyn
    DefaultFilter = 'HTML-Dokumente (*.htm,*.html)|*.htm;*.html'
    Enabled = False
    AndAttri.BackPriority = 0
    AndAttri.ForePriority = 0
    AndAttri.FramePriority = 0
    AndAttri.BoldPriority = 0
    AndAttri.ItalicPriority = 0
    AndAttri.UnderlinePriority = 0
    AndAttri.StrikeOutPriority = 0
    ASPAttri.BackPriority = 0
    ASPAttri.ForePriority = 0
    ASPAttri.FramePriority = 0
    ASPAttri.BoldPriority = 0
    ASPAttri.ItalicPriority = 0
    ASPAttri.UnderlinePriority = 0
    ASPAttri.StrikeOutPriority = 0
    CDATAAttri.BackPriority = 0
    CDATAAttri.ForePriority = 0
    CDATAAttri.FramePriority = 0
    CDATAAttri.BoldPriority = 0
    CDATAAttri.ItalicPriority = 0
    CDATAAttri.UnderlinePriority = 0
    CDATAAttri.StrikeOutPriority = 0
    DOCTYPEAttri.BackPriority = 0
    DOCTYPEAttri.ForePriority = 0
    DOCTYPEAttri.FramePriority = 0
    DOCTYPEAttri.BoldPriority = 0
    DOCTYPEAttri.ItalicPriority = 0
    DOCTYPEAttri.UnderlinePriority = 0
    DOCTYPEAttri.StrikeOutPriority = 0
    CommentAttri.BackPriority = 0
    CommentAttri.ForePriority = 0
    CommentAttri.FramePriority = 0
    CommentAttri.BoldPriority = 0
    CommentAttri.ItalicPriority = 0
    CommentAttri.UnderlinePriority = 0
    CommentAttri.StrikeOutPriority = 0
    IdentifierAttri.BackPriority = 0
    IdentifierAttri.ForePriority = 0
    IdentifierAttri.FramePriority = 0
    IdentifierAttri.BoldPriority = 0
    IdentifierAttri.ItalicPriority = 0
    IdentifierAttri.UnderlinePriority = 0
    IdentifierAttri.StrikeOutPriority = 0
    KeyAttri.BackPriority = 0
    KeyAttri.ForePriority = 0
    KeyAttri.FramePriority = 0
    KeyAttri.BoldPriority = 0
    KeyAttri.ItalicPriority = 0
    KeyAttri.UnderlinePriority = 0
    KeyAttri.StrikeOutPriority = 0
    SpaceAttri.BackPriority = 0
    SpaceAttri.ForePriority = 0
    SpaceAttri.FramePriority = 0
    SpaceAttri.BoldPriority = 0
    SpaceAttri.ItalicPriority = 0
    SpaceAttri.UnderlinePriority = 0
    SpaceAttri.StrikeOutPriority = 0
    SymbolAttri.BackPriority = 0
    SymbolAttri.ForePriority = 0
    SymbolAttri.FramePriority = 0
    SymbolAttri.BoldPriority = 0
    SymbolAttri.ItalicPriority = 0
    SymbolAttri.UnderlinePriority = 0
    SymbolAttri.StrikeOutPriority = 0
    TextAttri.BackPriority = 0
    TextAttri.ForePriority = 0
    TextAttri.FramePriority = 0
    TextAttri.BoldPriority = 0
    TextAttri.ItalicPriority = 0
    TextAttri.UnderlinePriority = 0
    TextAttri.StrikeOutPriority = 0
    UndefKeyAttri.BackPriority = 0
    UndefKeyAttri.ForePriority = 0
    UndefKeyAttri.FramePriority = 0
    UndefKeyAttri.BoldPriority = 0
    UndefKeyAttri.ItalicPriority = 0
    UndefKeyAttri.UnderlinePriority = 0
    UndefKeyAttri.StrikeOutPriority = 0
    ValueAttri.BackPriority = 0
    ValueAttri.ForePriority = 0
    ValueAttri.FramePriority = 0
    ValueAttri.BoldPriority = 0
    ValueAttri.ItalicPriority = 0
    ValueAttri.UnderlinePriority = 0
    ValueAttri.StrikeOutPriority = 0
    Left = 80
    Top = 440
  end
  object STListDS: TDataSource
    DataSet = STListTab
    Left = 80
    Top = 200
  end
  object AS_DS: TDataSource
    DataSet = ASQuery
    OnDataChange = AS_DSDataChange
    Left = 80
    Top = 248
  end
  object JPosDS: TDataSource
    DataSet = JPosTab
    Left = 80
    Top = 296
  end
  object SerNoDS: TDataSource
    DataSet = SerNoTab
    Left = 80
    Top = 344
  end
  object ArtPreisDS: TDataSource
    DataSet = ArtPreisTab
    OnDataChange = ArtPreisDSDataChange
    Left = 80
    Top = 392
  end
  object ArtKatDS: TDataSource
    DataSet = ArtKat
    Left = 80
    Top = 488
  end
  object ArtikelSecurity: tCaoDatasetSecurity
    CaoSecurity = DM1.CaoSecurity
    Dataset = ASQuery
    ModulID = 1020
    SubModulID = 0
    Left = 220
    Top = 462
  end
end
