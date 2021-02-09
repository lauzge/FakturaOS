object MakeVertragReForm: TMakeVertragReForm
  Left = 387
  Height = 556
  Top = 256
  Width = 732
  HorzScrollBar.Page = 537
  VertScrollBar.Page = 535
  AutoScroll = True
  Caption = 'Vertrag erstellen'
  ClientHeight = 536
  ClientWidth = 732
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  Menu = MainMenu1
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  LCLVersion = '7.2'
  object RePanel: TPanel
    Left = 0
    Height = 536
    Top = 0
    Width = 732
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 536
    ClientWidth = 732
    TabOrder = 0
    object PC1: TPageControl
      Left = 0
      Height = 509
      Top = 27
      Width = 732
      ActivePage = AdressTS
      Align = alClient
      TabIndex = 1
      TabOrder = 0
      OnChange = PC1Change
      OnChanging = PC1Changing
      object EdiListTS: TTabSheet
        Caption = 'Aus&wahl'
        ClientHeight = 483
        ClientWidth = 724
        object ToolBar3: TToolBar
          Left = 0
          Height = 26
          Top = 457
          Width = 724
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 98
          Caption = 'ToolBar3'
          EdgeBorders = []
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object DBNavigator1: TDBNavigator
            Left = 1
            Height = 26
            Top = 0
            Width = 185
            BevelOuter = bvNone
            ChildSizing.EnlargeHorizontal = crsScaleChilds
            ChildSizing.EnlargeVertical = crsScaleChilds
            ChildSizing.ShrinkHorizontal = crsScaleChilds
            ChildSizing.ShrinkVertical = crsScaleChilds
            ChildSizing.Layout = cclLeftToRightThenTopToBottom
            ChildSizing.ControlsPerLine = 100
            ClientHeight = 26
            ClientWidth = 185
            DataSource = ReEdiDS
            Flat = True
            Options = []
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          end
          object NewBelBtn: TToolButton
            Left = 186
            Top = 0
            AutoSize = True
            Caption = 'Neuen Beleg'
            ImageIndex = 7
            OnClick = New1BtnClick
          end
          object BelDelBtn: TToolButton
            Left = 284
            Top = 0
            AutoSize = True
            Caption = 'Beleg löschen'
            ImageIndex = 1
            OnClick = Del1BtnClick
          end
          object ReEdiBtn: TToolButton
            Left = 382
            Top = 0
            AutoSize = True
            Caption = 'Bearbeiten'
            ImageIndex = 10
            OnClick = ReEdiBtnClick
          end
        end
        object ReEdiListGrid: TDBGrid
          Left = 0
          Height = 457
          Top = 0
          Width = 724
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Aktiv'
              Width = 34
              FieldName = 'AKTIV_FLAG'
            end          
            item
              Title.Caption = 'Vertrag-Nr.'
              Width = 57
              FieldName = 'VVTNUM'
            end          
            item
              Title.Caption = 'Ku-Nr.'
              Width = 46
              FieldName = 'KUN_NUM'
            end          
            item
              Title.Caption = 'Kunde'
              Width = 198
              FieldName = 'KUN_NAME1'
            end          
            item
              Title.Caption = 'Projekt / Beschreibung'
              Width = 196
              FieldName = 'PROJEKT'
            end          
            item
              Title.Caption = 'Summe Netto'
              Width = 86
              FieldName = 'NSUMME'
            end          
            item
              Title.Caption = 'Summe Brutto'
              Visible = False
              FieldName = 'BSUMME'
            end          
            item
              Title.Caption = 'WA'
              Visible = False
              FieldName = 'WAEHRUNG'
            end          
            item
              Title.Caption = 'Datum Beginn'
              Width = 71
              FieldName = 'DATUM_START'
            end          
            item
              Title.Caption = 'Datum Ende'
              FieldName = 'DATUM_ENDE'
            end          
            item
              Title.Caption = 'nä. Rechnung'
              Width = 72
              FieldName = 'CALC_DATUM_NEXT'
            end          
            item
              Title.Caption = 'erstellt von'
              Width = 80
              FieldName = 'ERST_NAME'
            end>
          DataSource = ReEdiDS
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          Scrollbars = ssAutoBoth
          TabOrder = 1
          OnDblClick = DBGrid1DblClick
        end
      end
      object AdressTS: TTabSheet
        Caption = 'All&gemein'
        ClientHeight = 483
        ClientWidth = 724
        object ToolBar2: TToolBar
          Left = 0
          Height = 26
          Top = 457
          Width = 724
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 69
          Caption = 'ToolBar2'
          EdgeBorders = []
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object GotoAuswahlBtn: TToolButton
            Left = 1
            Top = 0
            AutoSize = True
            Caption = 'Zurück'
            ImageIndex = 8
            OnClick = GotoAuswahlBtnClick
          end
          object ToolButton4: TToolButton
            Left = 70
            Height = 26
            Top = 0
            Caption = 'ToolButton4'
            Style = tbsSeparator
          end
          object KopfNav2: TDBNavigator
            Left = 78
            Height = 26
            Top = 0
            Width = 185
            BevelOuter = bvNone
            ChildSizing.EnlargeHorizontal = crsScaleChilds
            ChildSizing.EnlargeVertical = crsScaleChilds
            ChildSizing.ShrinkHorizontal = crsScaleChilds
            ChildSizing.ShrinkVertical = crsScaleChilds
            ChildSizing.Layout = cclLeftToRightThenTopToBottom
            ChildSizing.ControlsPerLine = 100
            ClientHeight = 26
            ClientWidth = 185
            DataSource = ReEdiDS
            Flat = True
            Options = []
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          end
          object New1Btn: TToolButton
            Left = 263
            Top = 0
            AutoSize = True
            Caption = 'Neuen Beleg'
            ImageIndex = 7
            OnClick = New1BtnClick
          end
          object Del1Btn: TToolButton
            Left = 355
            Top = 0
            AutoSize = True
            Caption = 'Beleg löschen'
            ImageIndex = 1
            OnClick = Del1BtnClick
          end
          object ToolButton9: TToolButton
            Left = 452
            Height = 26
            Top = 0
            Caption = 'ToolButton9'
            Style = tbsSeparator
          end
          object GotoPosBtn: TToolButton
            Left = 460
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoPosBtnClick
          end
        end
        object KunDatPan: TPanel
          Left = 0
          Height = 70
          Top = 0
          Width = 724
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 70
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 1
          object KundatGB: TGroupBox
            Left = 0
            Height = 70
            Top = 0
            Width = 724
            Align = alClient
            Caption = 'Kundendaten'
            ClientHeight = 52
            ClientWidth = 720
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label47: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'Kunden-Nr:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label22: TLabel
              Left = 5
              Height = 13
              Top = 26
              Width = 77
              AutoSize = False
              Caption = 'Intern-Nr:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label53: TLabel
              Left = 199
              Height = 13
              Top = 4
              Width = 37
              Caption = 'Name1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label31: TLabel
              Left = 199
              Height = 13
              Top = 29
              Width = 78
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object KuNrEdit: TDBEdit
              Left = 88
              Height = 21
              Top = 0
              Width = 81
              DataField = 'KUN_NUM'
              DataSource = ReEdiDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object KuNrEditBtn: TSpeedButton
              Left = 170
              Height = 22
              Top = 0
              Width = 23
              Caption = '...'
              OnClick = KuNrEditButtonClick
            end
            object Panel2: TPanel
              Left = 88
              Height = 20
              Top = 22
              Width = 105
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 105
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object DBText1: TDBText
                Left = 0
                Height = 13
                Top = 4
                Width = 97
                Alignment = taCenter
                AutoSize = False
                DataField = 'VVTNUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel9: TPanel
              Left = 280
              Height = 20
              Top = 22
              Width = 24
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 24
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              object DBText7: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 18
                AutoSize = False
                DataField = 'KUN_LAND'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel10: TPanel
              Left = 308
              Height = 20
              Top = 22
              Width = 58
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 58
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              object DBText6: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 52
                AutoSize = False
                DataField = 'KUN_PLZ'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel11: TPanel
              Left = 368
              Height = 20
              Top = 22
              Width = 348
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 348
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              object DBText5: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 158
                AutoSize = False
                DataField = 'KUN_ORT'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel8: TPanel
              Left = 280
              Height = 20
              Top = 0
              Width = 436
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 436
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              object DBText4: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 245
                AutoSize = False
                DataField = 'KUN_NAME1'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
          end
        end
        object AlgPan2: TPanel
          Left = 0
          Height = 88
          Top = 70
          Width = 724
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 88
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 2
          object BestellGB: TGroupBox
            Left = 0
            Height = 88
            Top = 0
            Width = 326
            Align = alLeft
            Caption = 'Bestelldaten'
            ClientHeight = 70
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label21: TLabel
              Left = 5
              Height = 13
              Top = 8
              Width = 80
              AutoSize = False
              Caption = 'Bestellt durch:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label28: TLabel
              Left = 5
              Height = 13
              Top = 26
              Width = 80
              AutoSize = False
              Caption = 'Datum:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label32: TLabel
              Left = 5
              Height = 13
              Top = 48
              Width = 80
              AutoSize = False
              Caption = 'Referenznr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object best_name: TVolgaDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 232
              AutoSelect = False
              AutoSize = False
              Color = clWindow
              DataField = 'BEST_NAME'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object best_datum: TRxDBDateEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
              Width = 232
              AutoSelect = False
              ButtonWidth = 21
              DialogTitle = 'Select a Date'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 10
              ParentFont = False
              PasswordChar = #0
              PopupAlign = epaRight
              PopupColor = clWindow
              TabOrder = 1
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'BEST_DATUM'
              DataSource = ReEdiDS
            end
            object best_num: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 48
              Width = 232
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object TexteGB: TGroupBox
            Left = 326
            Height = 88
            Top = 0
            Width = 398
            Align = alClient
            Caption = 'Texte'
            ClientHeight = 70
            ClientWidth = 394
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label23: TLabel
              Left = 5
              Height = 13
              Top = 8
              Width = 77
              AutoSize = False
              Caption = 'Projekt:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label24: TLabel
              Left = 5
              Height = 13
              Top = 26
              Width = 77
              AutoSize = False
              Caption = 'Überschrift 1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label25: TLabel
              Left = 5
              Height = 13
              Top = 48
              Width = 77
              AutoSize = False
              Caption = 'Überschrift 2:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object projekt: TDBEdit
              Tag = 1
              Left = 86
              Height = 21
              Top = 0
              Width = 304
              DataField = 'PROJEKT'
              DataSource = ReEdiDS
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
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object usr1: TDBEdit
              Tag = 1
              Left = 86
              Height = 21
              Top = 24
              Width = 304
              DataField = 'USR1'
              DataSource = ReEdiDS
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
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object usr2: TDBEdit
              Tag = 1
              Left = 86
              Height = 21
              Top = 48
              Width = 304
              DataField = 'USR2'
              DataSource = ReEdiDS
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
              TabOrder = 2
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object AlgPan3: TPanel
          Left = 0
          Height = 273
          Top = 158
          Width = 326
          Align = alLeft
          BevelOuter = bvNone
          ClientHeight = 273
          ClientWidth = 326
          Color = 14680063
          ParentColor = False
          TabOrder = 3
          object CaoGroupBox3: TGroupBox
            Left = 0
            Height = 161
            Top = 0
            Width = 326
            Align = alTop
            Caption = 'Zuweisungen'
            ClientHeight = 143
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label26: TLabel
              Left = 5
              Height = 13
              Top = 3
              Width = 42
              Caption = 'Versand:'
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
              Top = 28
              Width = 77
              AutoSize = False
              Caption = 'Vertreter:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label27: TLabel
              Left = 5
              Height = 13
              Top = 52
              Width = 77
              AutoSize = False
              Caption = 'Zahlart:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label38: TLabel
              Left = 5
              Height = 13
              Top = 76
              Width = 77
              AutoSize = False
              Caption = 'Währung:'
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
              Top = 100
              Width = 77
              AutoSize = False
              Caption = 'Zahlungsziel:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label30: TLabel
              Left = 5
              Height = 13
              Top = 124
              Width = 77
              AutoSize = False
              Caption = 'Preisliste:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label7: TLabel
              Left = 119
              Height = 13
              Top = 100
              Width = 30
              AutoSize = False
              Caption = 'Tage'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label8: TLabel
              Left = 193
              Height = 13
              Top = 100
              Width = 39
              AutoSize = False
              Caption = 'Skonto:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label9: TLabel
              Left = 264
              Height = 13
              Top = 100
              Width = 58
              AutoSize = False
              Caption = 'Tage Netto'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Versand: TDBEdit
              Left = 88
              Height = 21
              Top = 0
              Width = 28
              DataField = 'LIEFART'
              DataSource = ReEdiDS
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
              TabOrder = 0
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Vertreter: TDBEdit
              Left = 88
              Height = 21
              Top = 24
              Width = 28
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Zahlart: TDBEdit
              Left = 88
              Height = 21
              Top = 48
              Width = 28
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
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
              TabOrder = 2
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object waehrung: TDBEdit
              Left = 88
              Height = 21
              Top = 72
              Width = 28
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
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
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object VersandCB: TDBLookupComboBox
              Tag = 1
              Left = 116
              Height = 21
              Top = 0
              Width = 204
              Color = clWindow
              DataField = 'LIEFART'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.LiefArtDS
              LookupCache = False
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 4
            end
            object VertreterCB: TDBLookupComboBox
              Tag = 1
              Left = 116
              Height = 21
              Top = 24
              Width = 204
              Color = clWindow
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'VERTRETER_ID'
              ListField = 'NAME'
              ListFieldIndex = 0
              ListSource = DM1.VertreterDS
              LookupCache = False
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object ZahlartDB: TDBLookupComboBox
              Tag = 1
              Left = 116
              Height = 21
              Top = 48
              Width = 204
              Color = clWindow
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.ZahlartDS
              LookupCache = False
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 116
              Height = 21
              Top = 72
              Width = 204
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.WhrungDS
              LookupCache = False
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 7
            end
            object SK_Skonto_Tage: TDBEdit
              Left = 88
              Height = 21
              Top = 96
              Width = 28
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 8
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Proz: TDBEdit
              Left = 149
              Height = 21
              Top = 96
              Width = 40
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 9
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Netto_Tage: TDBEdit
              Left = 234
              Height = 21
              Top = 96
              Width = 28
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
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
              TabOrder = 10
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object Label29: TLabel
              Left = 195
              Height = 13
              Top = 124
              Width = 39
              AutoSize = False
              Caption = 'Rabatt:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object GlobRabatt: TDBEdit
              Left = 234
              Height = 21
              Top = 120
              Width = 86
              DataField = 'GLOBRABATT'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 11
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object PR_EbeneCB: TRxDBComboBox
              Left = 88
              Height = 21
              Top = 120
              Width = 46
              Style = csDropDownList
              Color = clWindow
              DataField = 'PR_EBENE'
              DataSource = ReEdiDS
              EnableValues = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
              )
              MaxLength = 0
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object KFZGB: TGroupBox
            Left = 0
            Height = 112
            Top = 161
            Width = 326
            Align = alClient
            Caption = 'Vertragsdaten'
            ClientHeight = 94
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label1: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'Vertragsbeginn:'
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
              Top = 28
              Width = 77
              AutoSize = False
              Caption = 'Vertragsende:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label42: TLabel
              Left = 5
              Height = 13
              Top = 52
              Width = 77
              AutoSize = False
              Caption = 'nä. Rechnung:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label60: TLabel
              Left = 5
              Height = 13
              Top = 76
              Width = 77
              AutoSize = False
              Caption = 'Intervall:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label62: TLabel
              Left = 232
              Height = 81
              Top = 0
              Width = 85
              AutoSize = False
              Caption = 'direkt drucken, ansonsten wird die Rechn. zum bearbeiten erstellt'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              WordWrap = True
            end
            object JvDBDateEdit1: TRxDBDateEdit
              Left = 88
              Height = 21
              Top = 0
              Width = 126
              ButtonWidth = 21
              DialogTitle = 'Select a Date'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 10
              ParentFont = False
              PasswordChar = #0
              PopupColor = clWindow
              TabOrder = 0
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'DATUM_START'
              DataSource = ReEdiDS
            end
            object JvDBDateEdit2: TRxDBDateEdit
              Left = 88
              Height = 21
              Top = 24
              Width = 126
              ButtonWidth = 23
              DialogTitle = 'Select a Date'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 10
              ParentFont = False
              PasswordChar = #0
              PopupColor = clWindow
              TabOrder = 1
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'DATUM_ENDE'
              DataSource = ReEdiDS
            end
            object JvDBDateEdit3: TRxDBDateEdit
              Left = 88
              Height = 21
              Top = 48
              Width = 126
              ButtonWidth = 23
              DialogTitle = 'Select a Date'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 10
              ParentFont = False
              PasswordChar = #0
              PopupColor = clWindow
              TabOrder = 2
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'DATUM_NEXT'
              DataSource = ReEdiDS
            end
            object JvDBSpinEdit1: TDBEdit
              Left = 88
              Height = 21
              Top = 72
              Width = 43
              DataField = 'INTERVALL_NUM'
              DataSource = ReEdiDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object VolgaDBEdit1: TVolgaDBEdit
              Left = 136
              Height = 21
              Top = 72
              Width = 78
              AutoDropDown = True
              ButtonWidth = 17
              Color = clWindow
              ComboProps.ComboItems.Strings = (
                'Woche'
                'Monat'
                'Quartal'
                'Halbjahr'
                'Jahr'
              )
              ComboProps.ComboValues.Strings = (
                'W'
                'M'
                'Q'
                'H'
                'J'
              )
              DataField = 'INTERVALL'
              DataSource = ReEdiDS
              DialogStyle = vdsCombo
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              Style = vcsDropDownList
              TabOrder = 4
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBCheckBox1: TDBCheckBox
              Left = 216
              Height = 23
              Top = -2
              Width = 16
              Caption = 'DBCheckBox1'
              DataField = 'PRINT_FLAG'
              DataSource = ReEdiDS
              TabOrder = 5
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
        end
        object ReAllgBottomPan: TPanel
          Left = 326
          Height = 273
          Top = 158
          Width = 398
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 273
          ClientWidth = 398
          Color = 14680063
          ParentColor = False
          TabOrder = 4
          object InfoGB: TGroupBox
            Left = 0
            Height = 273
            Top = 0
            Width = 398
            Align = alClient
            Caption = 'Info'
            ClientHeight = 255
            ClientWidth = 394
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RechInfoMemo: TDBMemo
              Left = 0
              Height = 255
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Top = 0
              Width = 394
              Align = alClient
              Color = clWindow
              DataField = 'INFO'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              ParentShowHint = False
              ScrollBars = ssVertical
              ShowHint = True
              TabOrder = 0
            end
          end
        end
        object AlgSumPanel: TPanel
          Left = 0
          Height = 26
          Top = 431
          Width = 724
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'AlgSumPanel'
          ClientHeight = 26
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 5
          object Panel17: TPanel
            Left = 0
            Height = 26
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel18: TPanel
            Left = 721
            Height = 26
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel18'
            TabOrder = 1
          end
          object SumPan: TPanel
            Left = 3
            Height = 26
            Top = 0
            Width = 718
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 26
            ClientWidth = 718
            Color = 14680063
            ParentColor = False
            TabOrder = 2
            object Label55: TLabel
              Left = 0
              Height = 26
              Top = 0
              Width = 67
              Align = alLeft
              Caption = ' Summen:'
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object Label14: TLabel
              Left = 313
              Height = 26
              Top = 0
              Width = 39
              Align = alRight
              Alignment = taRightJustify
              Caption = 'Netto :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object Panel27: TPanel
              Left = 618
              Height = 26
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 26
              ClientWidth = 100
              TabOrder = 0
              object DBText15: TDBText
                Left = 0
                Height = 26
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
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
            object Label33: TLabel
              Left = 576
              Height = 26
              Top = 0
              Width = 42
              Align = alRight
              Alignment = taRightJustify
              Caption = 'Brutto :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object Panel28: TPanel
              Left = 491
              Height = 26
              Top = 0
              Width = 85
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 26
              ClientWidth = 85
              TabOrder = 1
              object DBText16: TDBText
                Left = 0
                Height = 26
                Top = 0
                Width = 85
                Align = alClient
                Alignment = taRightJustify
                DataField = 'MSUMME'
                DataSource = ReEdiDS
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
            object Label17: TLabel
              Left = 452
              Height = 26
              Top = 0
              Width = 39
              Align = alRight
              Alignment = taRightJustify
              Caption = 'MwSt :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object Panel29: TPanel
              Left = 352
              Height = 26
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 26
              ClientWidth = 100
              TabOrder = 2
              object DBText17: TDBText
                Left = 0
                Height = 26
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                DataField = 'NSUMME'
                DataSource = ReEdiDS
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
          end
        end
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ClientHeight = 483
        ClientWidth = 724
        object ToolBar1: TToolBar
          Left = 0
          Height = 26
          Top = 457
          Width = 724
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 56
          Caption = 'ToolBar1'
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object GotoAllgBtn: TToolButton
            Left = 1
            Top = 0
            AutoSize = True
            Caption = 'Zurück'
            ImageIndex = 8
            OnClick = GotoAllgBtnClick
          end
          object ToolButton3: TToolButton
            Left = 65
            Height = 8
            Top = 0
            Caption = 'ToolButton3'
            Style = tbsSeparator
          end
          object NeuArtBtn1: TToolButton
            Left = 73
            Top = 0
            AutoSize = True
            Caption = 'Artikel hinzu'
            DropdownMenu = ArtikelPopupMenu
            ImageIndex = 16
            OnClick = NeuArtBtnClick
            Style = tbsButtonDrop
          end
          object DelBtn: TToolButton
            Left = 170
            Hint = 'Position löschen'
            Top = 0
            AutoSize = True
            Caption = '&Löschen'
            ImageIndex = 6
            OnClick = DelBtnClick
            ParentShowHint = False
            ShowHint = True
          end
          object UpBtn: TToolButton
            Left = 241
            Hint = 'Position nach oben verschieben'
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtnClick
            ParentShowHint = False
            ShowHint = True
          end
          object DownBtn: TToolButton
            Left = 297
            Hint = 'Position nach unten verschieben'
            Top = 0
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtnClick
            ParentShowHint = False
            ShowHint = True
          end
          object DBNavigator3: TDBNavigator
            Left = 353
            Height = 26
            Top = 0
            Width = 120
            BevelOuter = bvNone
            ChildSizing.EnlargeHorizontal = crsScaleChilds
            ChildSizing.EnlargeVertical = crsScaleChilds
            ChildSizing.ShrinkHorizontal = crsScaleChilds
            ChildSizing.ShrinkVertical = crsScaleChilds
            ChildSizing.Layout = cclLeftToRightThenTopToBottom
            ChildSizing.ControlsPerLine = 100
            ClientHeight = 26
            ClientWidth = 120
            DataSource = PosDS
            Flat = True
            Options = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
          end
          object ToolButton2: TToolButton
            Left = 473
            Height = 8
            Top = 0
            Caption = 'ToolButton2'
            Style = tbsSeparator
          end
          object GotoFertigBtn: TToolButton
            Left = 481
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
        end
        object PosSumPan: TPanel
          Left = 0
          Height = 24
          Top = 433
          Width = 724
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
        end
        object BottomSpacePan: TPanel
          Left = 0
          Height = 3
          Top = 430
          Width = 724
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
        end
        object InfoPanOut: TPanel
          Left = 0
          Height = 24
          Top = 406
          Width = 724
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 24
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 3
          object Panel38: TPanel
            Left = 0
            Height = 24
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel1: TPanel
            Left = 721
            Height = 24
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel1'
            TabOrder = 1
          end
          object PosInfoPan: TPanel
            Left = 3
            Height = 24
            Hint = 'mit F9 kann man diese Info ein- und ausschalten ...'
            Top = 0
            Width = 718
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            ClientHeight = 24
            ClientWidth = 718
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object Label61: TLabel
              Left = 5
              Height = 14
              Top = 5
              Width = 65
              Align = alLeft
              Caption = ' Pos-Info:'
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object InfoRGW: TDBText
              Left = 633
              Height = 14
              Top = 5
              Width = 80
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'CALC_RGEWINN'
              DataSource = PosDS
              Layout = tlCenter
              ParentColor = False
            end
            object Label54: TLabel
              Left = 551
              Height = 14
              Top = 5
              Width = 82
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Rohgewinn :'
              Layout = tlCenter
              ParentColor = False
            end
            object InfoEK: TDBText
              Left = 471
              Height = 14
              Top = 5
              Width = 80
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'CALC_EK'
              DataSource = PosDS
              Layout = tlCenter
              ParentColor = False
            end
            object Label52: TLabel
              Left = 403
              Height = 14
              Top = 5
              Width = 68
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'EK-Preis :'
              ParentColor = False
            end
            object DBText29: TDBText
              Left = 347
              Height = 14
              Top = 5
              Width = 56
              Align = alRight
              Alignment = taRightJustify
              DataField = 'CALC_LAGERMENGE_STR'
              DataSource = PosDS
              Layout = tlCenter
              ParentColor = False
            end
          end
        end
        object PosTopKunPan: TPanel
          Left = 0
          Height = 68
          Top = 0
          Width = 724
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 68
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 4
          object KunDatGB2: TGroupBox
            Left = 0
            Height = 68
            Top = 0
            Width = 724
            Align = alClient
            Caption = 'Kundendaten'
            ClientHeight = 50
            ClientWidth = 720
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'Kunden-Nr:'
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
              Top = 28
              Width = 77
              AutoSize = False
              Caption = 'Intern-Nr:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label3: TLabel
              Left = 199
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'Name1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label2: TLabel
              Left = 199
              Height = 13
              Top = 28
              Width = 78
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Panel25: TPanel
              Left = 88
              Height = 20
              Top = 0
              Width = 105
              Alignment = taRightJustify
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 105
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              object DBText23: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 100
                Alignment = taCenter
                AutoSize = False
                DataField = 'KUN_NUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel13: TPanel
              Left = 88
              Height = 20
              Top = 24
              Width = 105
              Alignment = taRightJustify
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 105
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object DBText11: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 100
                Alignment = taCenter
                AutoSize = False
                DataField = 'VVTNUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel12: TPanel
              Tag = 1
              Left = 280
              Height = 20
              Top = 0
              Width = 438
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 438
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              object DBText9: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 245
                AutoSize = False
                DataField = 'KUN_NAME1'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel6: TPanel
              Left = 280
              Height = 20
              Top = 24
              Width = 24
              Alignment = taRightJustify
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 24
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              object DBText8: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 18
                AutoSize = False
                DataField = 'KUN_LAND'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel26: TPanel
              Left = 308
              Height = 20
              Top = 24
              Width = 58
              Alignment = taRightJustify
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 58
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              object DBText2: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 52
                AutoSize = False
                DataField = 'KUN_PLZ'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel5: TPanel
              Tag = 1
              Left = 368
              Height = 20
              Top = 24
              Width = 350
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 350
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              object DBText3: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 158
                AutoSize = False
                DataField = 'KUN_ORT'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
          end
        end
        object PosPan: TPanel
          Left = 0
          Height = 338
          Top = 68
          Width = 724
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 338
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 5
          object CaoGroupBox8: TGroupBox
            Left = 0
            Height = 338
            Top = 0
            Width = 724
            Align = alClient
            Caption = 'Positionen'
            ClientHeight = 320
            ClientWidth = 720
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object PosGrid: TRxDBGrid
              Left = 0
              Height = 320
              Top = 0
              Width = 720
              ColumnDefValues.BlobText = '(blob)'
              TitleButtons = False
              AutoSort = True
              Columns = <              
                item
                  ReadOnly = True
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'Pos.'
                  Width = 25
                  FieldName = 'POSITION'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Alignment = taCenter
                  ReadOnly = True
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'T'
                  Width = 16
                  FieldName = 'ARTIKELTYP'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  ReadOnly = True
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'Matchcode'
                  Width = 82
                  FieldName = 'MATCH_ARTNUM'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'Artikelbezeichnung'
                  Width = 270
                  FieldName = 'BEZEICHNUNG'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'Menge'
                  Width = 40
                  FieldName = 'MENGE'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'M.-Einheit'
                  Width = 52
                  FieldName = 'ME_EINHEIT'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'E-Preis'
                  Width = 52
                  FieldName = 'EPREIS'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'Rabatt'
                  Width = 36
                  FieldName = 'RABATT'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Alignment = taRightJustify
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'G-Preis'
                  Width = 50
                  FieldName = 'NSumme'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Alignment = taCenter
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'S'
                  Width = 16
                  FieldName = 'STEUER_CODE'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end              
                item
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Quality = fqAntialiased
                  Font.Style = [fsBold]
                  Title.Alignment = taCenter
                  Title.Orientation = toHorizontal
                  Title.Caption = 'MwSt'
                  Width = 34
                  FieldName = 'MwSt'
                  EditButtons = <>
                  Filter.DropDownRows = 0
                  Filter.EmptyValue = '(Empty)'
                  Filter.NotEmptyValue = '(Not empty)'
                  Filter.AllValue = '(All values)'
                  Filter.EmptyFont.Style = [fsItalic]
                  Filter.ItemIndex = -1
                  Footers = <>
                end>
              KeyStrokes = <              
                item
                  Command = rxgcShowFindDlg
                  ShortCut = 16454
                  Enabled = True
                end              
                item
                  Command = rxgcShowColumnsDlg
                  ShortCut = 16471
                  Enabled = True
                end              
                item
                  Command = rxgcShowFilterDlg
                  ShortCut = 16468
                  Enabled = True
                end              
                item
                  Command = rxgcShowSortDlg
                  ShortCut = 16467
                  Enabled = True
                end              
                item
                  Command = rxgcShowQuickFilter
                  ShortCut = 16465
                  Enabled = True
                end              
                item
                  Command = rxgcHideQuickFilter
                  ShortCut = 16456
                  Enabled = True
                end              
                item
                  Command = rxgcSelectAll
                  ShortCut = 16449
                  Enabled = True
                end              
                item
                  Command = rxgcDeSelectAll
                  ShortCut = 16429
                  Enabled = True
                end              
                item
                  Command = rxgcInvertSelection
                  ShortCut = 16426
                  Enabled = True
                end              
                item
                  Command = rxgcOptimizeColumnsWidth
                  ShortCut = 16427
                  Enabled = True
                end              
                item
                  Command = rxgcCopyCellValue
                  ShortCut = 16451
                  Enabled = True
                end>
              FooterOptions.DrawFullLine = False
              SearchOptions.QuickSearchOptions = [loCaseInsensitive, loPartialKey]
              SearchOptions.FromStart = False
              OptionsRx = [rdgAllowColumnsForm, rdgAllowDialogFind, rdgAllowQuickFilter]
              Align = alClient
              Color = clWindow
              DrawFullLine = False
              FocusColor = clRed
              SelectedColor = clHighlight
              GridLineStyle = psSolid
              DataSource = PosDS
              DefaultRowHeight = 51
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
              ParentFont = False
              ParentShowHint = False
              Scrollbars = ssHorizontal
              TabOrder = 0
              OnKeyDown = PosGridKeyDown
              OnKeyPress = PosGridKeyPress
            end
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ClientHeight = 483
        ClientWidth = 724
        object ToolBar5: TToolBar
          Left = 0
          Height = 26
          Top = 457
          Width = 724
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 96
          Caption = 'ToolBar2'
          EdgeBorders = []
          Images = MainForm.VorgangImgList
          List = True
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object ToolButton12: TToolButton
            Left = 1
            Top = 0
            AutoSize = True
            Caption = 'Zurück'
            ImageIndex = 8
            OnClick = GotoPosBtnClick
          end
          object ToolButton17: TToolButton
            Left = 97
            Height = 8
            Top = 0
            Caption = 'ToolButton17'
            Style = tbsSeparator
          end
          object BuchenBtn: TToolButton
            Left = 105
            Top = 0
            AutoSize = True
            Caption = 'Vertrag aktivieren'
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
          object DeaktivierenBtn: TToolButton
            Left = 218
            Top = 0
            AutoSize = True
            Caption = 'Vertrag deaktivieren'
            ImageIndex = 15
            OnClick = DeaktivierenBtnClick
            Visible = False
          end
        end
        object FertigTopKunPan: TPanel
          Left = 0
          Height = 68
          Top = 0
          Width = 724
          Align = alTop
          BevelOuter = bvNone
          Color = 14680063
          ParentColor = False
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 0
          Height = 92
          Top = 68
          Width = 724
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 92
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 2
          object CaoGroupBox2: TGroupBox
            Left = 0
            Height = 92
            Top = 0
            Width = 326
            Align = alLeft
            Caption = 'Bestelldaten'
            ClientHeight = 74
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label40: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'bestellt durch:'
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
              Top = 28
              Width = 77
              AutoSize = False
              Caption = 'Bestelldatum:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label37: TLabel
              Left = 5
              Height = 13
              Top = 52
              Width = 77
              AutoSize = False
              Caption = 'Bestellnummer:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBEdit4: TDBEdit
              Tag = 1
              Left = 86
              Height = 21
              Top = 48
              Width = 232
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit5: TDBEdit
              Tag = 1
              Left = 86
              Height = 21
              Top = 0
              Width = 232
              DataField = 'BEST_NAME'
              DataSource = ReEdiDS
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object RxDBDateEdit1: TRxDBDateEdit
              Tag = 1
              Left = 86
              Height = 21
              Top = 24
              Width = 232
              ButtonWidth = 21
              Color = clBtnFace
              DialogTitle = 'Select a Date'
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 10
              ParentFont = False
              PasswordChar = #0
              PopupColor = clWindow
              TabOrder = 1
              Text = '  .  .    '
              YearDigits = dyFour
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'BEST_DATUM'
              DataSource = ReEdiDS
            end
          end
          object CaoGroupBox1: TGroupBox
            Left = 326
            Height = 92
            Top = 0
            Width = 398
            Align = alClient
            Caption = 'Texte'
            ClientHeight = 74
            ClientWidth = 394
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label34: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'Projekt:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label35: TLabel
              Left = 5
              Height = 13
              Top = 28
              Width = 77
              AutoSize = False
              Caption = 'Überschrift 1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label36: TLabel
              Left = 5
              Height = 13
              Top = 52
              Width = 77
              AutoSize = False
              Caption = 'Überschrift 2:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 48
              Width = 304
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
              Width = 304
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 304
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Height = 144
          Top = 160
          Width = 724
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 144
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 3
          object CaoGroupBox5: TGroupBox
            Left = 0
            Height = 144
            Top = 0
            Width = 326
            Align = alLeft
            Caption = 'Zuweisungen'
            ClientHeight = 126
            ClientWidth = 322
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label43: TLabel
              Left = 5
              Height = 13
              Top = 1
              Width = 77
              AutoSize = False
              Caption = 'Versand:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label44: TLabel
              Left = 5
              Height = 13
              Top = 24
              Width = 77
              AutoSize = False
              Caption = 'Vertreter:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label45: TLabel
              Left = 5
              Height = 13
              Top = 48
              Width = 77
              AutoSize = False
              Caption = 'Zahlart:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label46: TLabel
              Left = 5
              Height = 13
              Top = 77
              Width = 55
              AutoSize = False
              Caption = 'Währung:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label48: TLabel
              Left = 5
              Height = 13
              Top = 100
              Width = 77
              AutoSize = False
              Caption = 'Zahlungsziel:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label49: TLabel
              Left = 119
              Height = 13
              Top = 100
              Width = 30
              AutoSize = False
              Caption = 'Tage'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label50: TLabel
              Left = 193
              Height = 13
              Top = 100
              Width = 39
              AutoSize = False
              Caption = 'Skonto:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label51: TLabel
              Left = 260
              Height = 13
              Top = 100
              Width = 58
              AutoSize = False
              Caption = 'Tage Netto'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Tag = 1
              Left = 86
              Height = 21
              Top = 24
              Width = 232
              AutoSize = False
              Color = clBtnFace
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'VERTRETER_ID'
              ListField = 'NAME'
              ListFieldIndex = 0
              ListSource = DM1.VertreterDS
              LookupCache = False
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Tag = 1
              Left = 86
              Height = 21
              Top = 48
              Width = 232
              AutoSize = False
              Color = clBtnFace
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'ZAHL_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.ZahlartDS
              LookupCache = False
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 2
            end
            object DBLookupComboBox3: TDBLookupComboBox
              Tag = 1
              Left = 86
              Height = 21
              Top = 72
              Width = 232
              AutoSize = False
              Color = clBtnFace
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.WhrungDS
              LookupCache = False
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBLookupComboBox4: TDBLookupComboBox
              Tag = 1
              Left = 86
              Height = 21
              Top = 0
              Width = 232
              AutoSize = False
              Color = clBtnFace
              DataField = 'LIEFART'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'LIEF_ID'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              ListSource = DM1.LiefArtDS
              LookupCache = False
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 0
            end
            object DBEdit6: TDBEdit
              Left = 86
              Height = 21
              Top = 96
              Width = 28
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              AutoSize = False
              CharCase = ecUppercase
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit7: TDBEdit
              Left = 149
              Height = 21
              Top = 96
              Width = 40
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              AutoSize = False
              CharCase = ecUppercase
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit8: TDBEdit
              Left = 234
              Height = 21
              Top = 96
              Width = 28
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              AutoSize = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object CaoGroupBox6: TGroupBox
            Left = 326
            Height = 144
            Top = 0
            Width = 398
            Align = alClient
            Caption = 'Info'
            ClientHeight = 126
            ClientWidth = 394
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object DBMemo1: TDBMemo
              Left = 0
              Height = 126
              Top = 0
              Width = 394
              Align = alClient
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object FertigSumPan: TPanel
          Left = 0
          Height = 24
          Top = 433
          Width = 724
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 24
          ClientWidth = 724
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          object Panel31: TPanel
            Left = 0
            Height = 24
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel32: TPanel
            Left = 721
            Height = 24
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object ProblemPanel: TPanel
          Left = 0
          Height = 129
          Top = 304
          Width = 724
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 129
          ClientWidth = 724
          Color = 14680063
          ParentColor = False
          TabOrder = 5
          object ProblemLab: TLabel
            Left = 0
            Height = 129
            Top = 0
            Width = 724
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'keine'
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            Layout = tlCenter
            ParentColor = False
            ParentFont = False
          end
        end
      end
    end
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 732
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 728
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 1
      object ReEdiTopLab: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 154
        Align = alLeft
        Caption = '  Vertrag bearbeiten ...'
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object ButtonPan: TPanel
        Left = 441
        Height = 23
        Top = 0
        Width = 287
        Align = alRight
        BevelOuter = bvNone
        ClientHeight = 23
        ClientWidth = 287
        TabOrder = 0
        object FertigBtn: TSpeedButton
          Tag = 4
          Left = 207
          Height = 22
          Top = 0
          Width = 80
          Caption = 'Fertigstellen'
          Flat = True
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          OnClick = GotoFertigBtnClick
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          ParentFont = False
        end
        object PositionenBtn: TSpeedButton
          Tag = 3
          Left = 136
          Height = 22
          Top = 0
          Width = 73
          Caption = 'Positionen'
          Flat = True
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          OnClick = GotoPosBtnClick
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          ParentFont = False
        end
        object AllgemeinBtn: TSpeedButton
          Tag = 2
          Left = 66
          Height = 22
          Top = 0
          Width = 68
          Caption = 'Allgemein'
          Flat = True
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          OnClick = GotoAllgBtnClick
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          ParentFont = False
        end
        object AuswahlBtn: TSpeedButton
          Tag = 1
          Left = 0
          Height = 22
          Top = 0
          Width = 65
          Caption = 'Auswahl'
          Flat = True
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          OnClick = GotoAuswahlBtnClick
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          ParentFont = False
        end
      end
    end
  end
  object ArtikelPopupMenu: TPopupMenu
    Left = 464
    Top = 384
    object freierArtikel1: TMenuItem
      Caption = 'freien Artikel hinzufügen'
    end
    object Text1: TMenuItem
      Caption = 'Text hinzufügen'
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 515
    Top = 384
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object neuenBelegerstellen1: TMenuItem
        Caption = 'neuen Beleg erstellen'
        ImageIndex = 23
        ShortCut = 16429
        OnClick = New1BtnClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Adressezuweisen1: TMenuItem
        Caption = 'Adresse zuweisen'
        ImageIndex = 33
        ShortCut = 114
        OnClick = KuNrEditButtonClick
      end
      object Artikelhinzufgen1: TMenuItem
        Caption = 'Artikel hinzufgen'
        ImageIndex = 33
        ShortCut = 45
        OnClick = NeuArtBtnClick
      end
      object freienArtikelhinzufgen1: TMenuItem
        Caption = 'freien Artikel hinzufügen'
        ImageIndex = 20
        ShortCut = 16457
        OnClick = NeuFrArtBtnClick
      end
      object Texthinzufgen1: TMenuItem
        Caption = 'Text hinzufügen'
        ImageIndex = 20
        ShortCut = 16468
        OnClick = NeuKomBtnClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Kopieren1: TMenuItem
        Caption = 'Kopieren'
        Enabled = False
        ImageIndex = 14
        ShortCut = 16459
      end
      object Storno1: TMenuItem
        Caption = 'Beleg löschen'
        ImageIndex = 19
        ShortCut = 8238
        OnClick = Del1BtnClick
      end
      object Positionlschen1: TMenuItem
        Caption = 'Position löschen'
        ImageIndex = 32
        ShortCut = 16430
        OnClick = DelBtnClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Speichernundaktivieren1: TMenuItem
        Caption = 'Speichern und aktivieren'
        ImageIndex = 18
        ShortCut = 32848
        OnClick = BuchenBtnClick
      end
      object Vertragdeaktivieren1: TMenuItem
        Caption = 'Vertrag deaktivieren'
        ImageIndex = 78
        ShortCut = 32837
        OnClick = DeaktivierenBtnClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = Suchen1Click
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
      Enabled = False
      GroupIndex = 3
      Visible = False
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object Auswahl1: TMenuItem
        Tag = 1
        Caption = 'Auswahl'
        Checked = True
        GroupIndex = 2
        ImageIndex = 2
        RadioItem = True
        ShortCut = 117
        OnClick = GotoAuswahlBtnClick
      end
      object Allgemein1: TMenuItem
        Tag = 2
        Caption = 'Allgemein'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 118
        OnClick = GotoAllgBtnClick
      end
      object Positionen1: TMenuItem
        Tag = 3
        Caption = 'Positionen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 119
        OnClick = GotoPosBtnClick
      end
      object Fertigstellen1: TMenuItem
        Tag = 4
        Caption = 'Fertigstellen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 123
        OnClick = GotoFertigBtnClick
      end
      object N5: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 3
        ImageIndex = 13
        ShortCut = 116
        OnClick = Aktualisieren1Click
      end
    end
    object Spezial1: TMenuItem
      Caption = 'Spe&zial'
      GroupIndex = 4
      object MakeBelege: TMenuItem
        Caption = 'fällige Belege erstellen'
        ImageIndex = 22
        ShortCut = 32887
        OnClick = MakeBelegeClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object UmschaltungBruttoNetto1: TMenuItem
        Caption = 'Umschaltung Brutto<-->Netto'
        OnClick = UmschaltungBruttoNetto1Click
      end
    end
  end
  object PosTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = PosTabAfterScroll
    AfterScroll = PosTabAfterScroll
    OnCalcFields = PosTabCalcFields
    BeforeInsert = PosTabBeforeInsert
    BeforeEdit = PosTabBeforeEdit
    BeforePost = PosTabBeforePost
    AfterPost = PosTabAfterPost
    AfterCancel = PosTabAfterPost
    BeforeDelete = PosTabBeforeDelete
    AfterDelete = PosTabAfterDelete
    OnNewRecord = PosTabNewRecord
    SQL.Strings = (
      'select * from VERTRAGPOS'
      'where JOURNAL_ID=:ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 515
    Top = 99
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    object PosTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabJOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabPOSITION: TZIntegerField
      DisplayLabel = 'Pos.'
      DisplayWidth = 3
      FieldKind = fkData
      FieldName = 'POSITION'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '000'
    end
    object PosTabARTIKELTYP: TZRawStringField
      Alignment = taCenter
      DisplayLabel = 'T'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object PosTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabVVTNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VVTNUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabMATCHCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBARCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBEZEICHNUNG: TZRawCLobField
      DisplayLabel = 'Artikelbezeichnung'
      DisplayWidth = 70
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
    object PosTabLAENGE: TZRawStringField
      FieldKind = fkData
      FieldName = 'LAENGE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGROESSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'GROESSE'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabDIMENSION: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIMENSION'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEWICHT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabME_EINHEIT: TZRawStringField
      DisplayLabel = 'M.-Einheit'
      FieldKind = fkData
      FieldName = 'ME_EINHEIT'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 10
    end
    object PosTabPR_EINHEIT: TZDoubleField
      FieldKind = fkData
      FieldName = 'PR_EINHEIT'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Precision = 10
    end
    object PosTabMENGE: TZDoubleField
      DisplayLabel = 'Menge'
      DisplayWidth = 6
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.0##;-,#0.0##; '
      EditFormat = '0.000'
    end
    object PosTabEPREIS: TZDoubleField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabRABATT: TZDoubleField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0"%";-,###,##0.0"%"; '
    end
    object PosTabE_RGEWINN: TZDoubleField
      FieldKind = fkData
      FieldName = 'E_RGEWINN'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabALTTEIL_STCODE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'ALTTEIL_STCODE'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEGENKTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GEGENKTO'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabNSumme: TCurrencyField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'NSumme'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabMSumme: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MSumme'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabBSumme: TCurrencyField
      DisplayLabel = 'G-PreisBrutto'
      FieldKind = fkCalculated
      FieldName = 'BSumme'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabSTEUER_CODE: TZShortIntField
      DisplayLabel = 'S'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-;-'
    end
    object PosTabMwSt: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'MwSt'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 8
    end
    object PosTabALTTEIL_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'ALTTEIL_PROZ'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabMATCH_ARTNUM: TStringField
      DisplayLabel = 'Matchcode'
      FieldKind = fkCalculated
      FieldName = 'MATCH_ARTNUM'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object PosTabCALC_EK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_EK'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00'
    end
    object PosTabCALC_RGEWINN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_RGEWINN'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00'
    end
    object PosTabALTTEIL_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'ALTTEIL_FLAG'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object PosTabBEZ_FEST_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BEZ_FEST_FLAG'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object PosTabCALC_LAGERMENGE_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_LAGERMENGE_STR'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 250
    end
    object PosTabCALC_LAGERMENGE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_LAGERMENGE'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBRUTTO_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object PosTabCALC_STEUERPORZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_STEUERPORZ'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object ReEdiTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ReEdiTabAfterScroll
    BeforeClose = ReEdiTabBeforeClose
    AfterScroll = ReEdiTabAfterScroll
    OnCalcFields = ReEdiTabCalcFields
    AfterEdit = ReEdiTabAfterEdit
    BeforePost = ReEdiTabBeforePost
    AfterPost = ReEdiTabAfterPost
    BeforeDelete = ReEdiTabBeforeDelete
    OnNewRecord = ReEdiTabOnNewRecord
    SQL.Strings = (
      'select * FROM VERTRAG'
      'order by VVTNUM'
    )
    Params = <>
    Left = 464
    Top = 99
    object ReEdiTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ReEdiTabVVTNUM: TZIntegerField
      DisplayLabel = 'Vertrag-Nr.'
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'VVTNUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '"V"0000'
    end
    object ReEdiTabVERTRETER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'VERTRETER_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabGLOBRABATT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GLOBRABATT'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0.0%'
    end
    object ReEdiTabPR_EBENE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'PR_EBENE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKOST_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'KOST_NETTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabWERT_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'WERT_NETTO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabLOHN: TZDoubleField
      FieldKind = fkData
      FieldName = 'LOHN'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabWARE: TZDoubleField
      FieldKind = fkData
      FieldName = 'WARE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabTKOST: TZDoubleField
      FieldKind = fkData
      FieldName = 'TKOST'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMSUMME_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabMSUMME_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabMSUMME_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabMSUMME_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabMSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
    end
    object ReEdiTabBSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabATSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'ATSUMME'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabATMSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'ATMSUMME'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabGEGENKONTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GEGENKONTO'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_STAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_STAGE'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_SKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_SKONTO'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object ReEdiTabSOLL_NTAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATEN: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_RATEN'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATBETR: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_RATBETR'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATINTERVALL: TZIntegerField
      FieldKind = fkData
      FieldName = 'SOLL_RATINTERVALL'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSTADIUM: TZSmallIntField
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabERST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKUN_NUM: TZRawStringField
      Alignment = taCenter
      FieldKind = fkData
      FieldName = 'KUN_NUM'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME1: TZRawStringField
      DisplayLabel = 'Kunde'
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME3'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_ABTEILUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ABTEILUNG'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_STRASSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_STRASSE'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_LAND: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_LAND'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 5
    end
    object ReEdiTabKUN_PLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_PLZ'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 10
    end
    object ReEdiTabKUN_ORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ORT'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabUSR1: TZRawStringField
      FieldKind = fkData
      FieldName = 'USR1'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 80
    end
    object ReEdiTabUSR2: TZRawStringField
      FieldKind = fkData
      FieldName = 'USR2'
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 80
    end
    object ReEdiTabPROJEKT: TZRawStringField
      DisplayLabel = 'Projekt / Beschreibung'
      DisplayWidth = 40
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabORGNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabBEST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'BEST_NAME'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabBEST_CODE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'BEST_CODE'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabBEST_DATUM: TZDateField
      FieldKind = fkData
      FieldName = 'BEST_DATUM'
      Index = 49
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 50
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ReEdiTabLIEFART: TZSmallIntField
      FieldKind = fkData
      FieldName = 'LIEFART'
      Index = 51
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;0'
    end
    object ReEdiTabZAHLART: TZSmallIntField
      FieldKind = fkData
      FieldName = 'ZAHLART'
      Index = 52
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;0'
    end
    object ReEdiTabNSUMME: TZDoubleField
      DisplayLabel = 'Gesamt (netto)'
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 53
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabWAEHRUNG: TZRawStringField
      DisplayLabel = 'WA'
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 54
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 55
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
      Index = 56
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ReEdiTabDATUM_START: TZDateField
      DisplayLabel = 'Datum Beginn'
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'DATUM_START'
      Index = 57
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabDATUM_ENDE: TZDateField
      DisplayLabel = 'Datum Ende'
      FieldKind = fkData
      FieldName = 'DATUM_ENDE'
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabDATUM_NEXT: TZDateField
      DisplayLabel = 'nä. Rechnung'
      FieldKind = fkData
      FieldName = 'DATUM_NEXT'
      Index = 59
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabINTERVALL_NUM: TZWordField
      DisplayLabel = 'Intervall'
      FieldKind = fkData
      FieldName = 'INTERVALL_NUM'
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      EditFormat = '0'
      MaxValue = 999
      MinValue = 1
    end
    object ReEdiTabAKTIV_FLAG: TBooleanField
      DisplayLabel = 'Aktiv'
      FieldKind = fkData
      FieldName = 'AKTIV_FLAG'
      Index = 61
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ReEdiTabPRINT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'PRINT_FLAG'
      Index = 62
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ReEdiTabINTERVALL: TZRawStringField
      FieldKind = fkData
      FieldName = 'INTERVALL'
      Index = 63
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object ReEdiTabCALC_DATUM_NEXT: TStringField
      DisplayLabel = 'nä. Rechnung'
      FieldKind = fkCalculated
      FieldName = 'CALC_DATUM_NEXT'
      Index = 64
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 464
    Top = 158
  end
  object PosDS: TDataSource
    DataSet = PosTab
    OnDataChange = PosDSDataChange
    Left = 515
    Top = 158
  end
end
