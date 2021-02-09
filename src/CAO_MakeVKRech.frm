object MakeVKReForm: TMakeVKReForm
  Left = 387
  Height = 688
  Top = 256
  Width = 806
  Caption = 'Rechnung erstellen'
  ClientHeight = 668
  ClientWidth = 806
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
    Height = 668
    Top = 0
    Width = 806
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 668
    ClientWidth = 806
    Color = 14680063
    ParentColor = False
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 806
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 802
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object ReEdiTopLab: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 172
        Align = alLeft
        Caption = '  Rechnung bearbeiten ...'
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
        Left = 426
        Height = 23
        Top = 0
        Width = 376
        Align = alRight
        BevelOuter = bvNone
        ClientHeight = 23
        ClientWidth = 376
        TabOrder = 0
        object AllgemeinBtn: TSpeedButton
          Tag = 1
          Left = 72
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
        object PosDetailBtn: TSpeedButton
          Tag = 5
          Left = 208
          Height = 22
          Top = 0
          Width = 86
          Caption = 'Pos.-Details'
          Flat = True
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          OnClick = PosDetailBtnClick
          OnMouseEnter = AuswahlBtnMouseEnter
          OnMouseLeave = AuswahlBtnMouseLeave
          ParentFont = False
        end
        object FertigBtn: TSpeedButton
          Tag = 5
          Left = 296
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
        object AuswahlBtn: TSpeedButton
          Tag = 4
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
    object PC1: TPageControl
      Left = 0
      Height = 641
      Top = 27
      Width = 806
      ActivePage = EdiListTS
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      OnChange = PC1Change
      OnChanging = PC1Changing
      object EdiListTS: TTabSheet
        Caption = 'Aus&wahl'
        ClientHeight = 615
        ClientWidth = 798
        object ReEdiListGrid: TDBGrid
          Left = 0
          Height = 589
          Top = 0
          Width = 798
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'ST'
              Width = 16
              FieldName = 'STADIUM'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'int. Nr.'
              Width = 57
              FieldName = 'VRENUM'
            end          
            item
              Alignment = taCenter
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
              Width = 68
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
              Alignment = taCenter
              Title.Caption = 'le.Änderung'
              Width = 66
              FieldName = 'RDATUM'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Termin'
              Width = 75
              FieldName = 'WV_Datum-Str'
            end          
            item
              Title.Caption = 'Zahlart'
              Width = 100
              FieldName = 'ZAHLART_STR'
            end          
            item
              Title.Caption = 'Versandart'
              Width = 100
              FieldName = 'LIEFART_STR'
            end          
            item
              Title.Caption = 'Status'
              Width = 60
              FieldName = 'STADIUM_STR'
            end          
            item
              Title.Caption = 'Shop-Status'
              Width = 120
              FieldName = 'CALC_SHOPSTATUS'
            end          
            item
              Title.Caption = 'erstellt von'
              Width = 80
              FieldName = 'ERST_NAME'
            end>
          DataSource = ReEdiDS
          DefaultRowHeight = 16
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          OnDrawColumnCell = ReEdiListGridDrawColumnCell
          OnDblClick = DBGrid1DblClick
        end
        object ToolBar3: TToolBar
          Left = 0
          Height = 26
          Top = 589
          Width = 798
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 98
          Caption = 'ToolBar2'
          Color = clBtnFace
          EdgeBorders = []
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
          ShowCaptions = True
          TabOrder = 1
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
            OnClick = NewBelBtnClick
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
            OnClick = DBGrid1DblClick
          end
        end
      end
      object AdressTS: TTabSheet
        Caption = 'All&gemein'
        ClientHeight = 615
        ClientWidth = 798
        object AlgPan2: TPanel
          Left = 0
          Height = 117
          Top = 67
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 117
          ClientWidth = 798
          TabOrder = 0
          object BestellGB: TGroupBox
            Left = 0
            Height = 117
            Top = 0
            Width = 341
            Align = alLeft
            Caption = 'Bestelldaten'
            ClientHeight = 99
            ClientWidth = 337
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label21: TLabel
              Left = 8
              Height = 13
              Top = 4
              Width = 78
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
              Left = 8
              Height = 13
              Top = 28
              Width = 78
              AutoSize = False
              Caption = 'Bestelldatum:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label32: TLabel
              Left = 8
              Height = 13
              Top = 52
              Width = 78
              AutoSize = False
              Caption = 'Referenznr.:'
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
              Top = 76
              Width = 78
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
              Width = 240
              AutoDropDown = True
              ButtonWidth = 16
              DataField = 'BEST_NAME'
              DataSource = ReEdiDS
              DialogStyle = vdsCombo
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
              Width = 240
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
              Width = 240
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
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
            object DBDateEdit2: TRxDBDateEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 72
              Width = 240
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
              TabOrder = 3
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'TERMIN'
              DataSource = ReEdiDS
            end
          end
          object TexteGB: TGroupBox
            Left = 341
            Height = 117
            Top = 0
            Width = 457
            Align = alClient
            Caption = 'Texte'
            ClientHeight = 99
            ClientWidth = 453
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label23: TLabel
              Left = 8
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
            object Label24: TLabel
              Left = 8
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
            object Label25: TLabel
              Left = 8
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
            object projekt: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 358
              DataField = 'PROJEKT'
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
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
              Left = 88
              Height = 21
              Top = 24
              Width = 358
              DataField = 'USR1'
              DataSource = ReEdiDS
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
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object usr2: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 48
              Width = 358
              DataField = 'USR2'
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
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
          Height = 168
          Top = 184
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 168
          ClientWidth = 798
          TabOrder = 1
          OnResize = AlgPan3Resize
          object CaoGroupBox3: TGroupBox
            Left = 0
            Height = 168
            Top = 0
            Width = 341
            Align = alLeft
            Caption = 'Zuweisungen'
            ClientHeight = 150
            ClientWidth = 337
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label26: TLabel
              Left = 8
              Height = 13
              Top = 4
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
            object Label15: TLabel
              Left = 8
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
              Left = 8
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
              Left = 8
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
              Left = 8
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
              Left = 8
              Height = 13
              Top = 124
              Width = 78
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
              Left = 120
              Height = 13
              Top = 100
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
            object Label8: TLabel
              Left = 200
              Height = 13
              Top = 100
              Width = 37
              Caption = 'Skonto:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label9: TLabel
              Left = 274
              Height = 13
              Top = 100
              Width = 54
              Caption = 'Tage Netto'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label29: TLabel
              Left = 200
              Height = 13
              Top = 124
              Width = 35
              AutoSize = False
              Caption = 'Rabatt:'
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
              Top = -1
              Width = 28
              DataField = 'LIEFART'
              DataSource = ReEdiDS
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
            object Zahlart: TDBEdit
              Left = 88
              Height = 21
              Top = 48
              Width = 28
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
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
              AutoSize = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Tage: TDBEdit
              Left = 88
              Height = 21
              Top = 96
              Width = 28
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              AutoSize = False
              CharCase = ecUppercase
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
            object PR_EbeneCB: TVolgaDBEdit
              Left = 88
              Height = 21
              Top = 120
              Width = 49
              ButtonWidth = 17
              DataField = 'PR_EBENE'
              DataSource = ReEdiDS
              DialogStyle = vdsCombo
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
            object SK_Skonto_Proz: TDBEdit
              Left = 152
              Height = 21
              Top = 96
              Width = 40
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              AutoSize = False
              CharCase = ecUppercase
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
            object SK_Netto_Tage: TDBEdit
              Tag = 1
              Left = 240
              Height = 21
              Top = 96
              Width = 28
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              AutoSize = False
              CharCase = ecUppercase
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
            object GlobRabatt: TDBEdit
              Tag = 1
              Left = 240
              Height = 21
              Top = 120
              Width = 88
              DataField = 'GLOBRABATT'
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 12
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object VersandCB: TDBLookupComboBox
              Tag = 1
              Left = 120
              Height = 21
              Top = 0
              Width = 208
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
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
              TabOrder = 1
            end
            object VertreterCB: TDBLookupComboBox
              Tag = 1
              Left = 120
              Height = 21
              Top = 24
              Width = 208
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Color = clWindow
              DataField = 'VERTRETER_ID'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'VERTRETER_ID'
              ListField = 'NAME;VNAME'
              ListFieldIndex = 0
              ListSource = DM1.VertreterDS
              LookupCache = False
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 3
            end
            object ZahlartDB: TDBLookupComboBox
              Tag = 1
              Left = 120
              Height = 21
              Top = 48
              Width = 208
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
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
              TabOrder = 5
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 120
              Height = 21
              Top = 72
              Width = 208
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              KeyField = 'WAEHRUNG'
              ListField = 'LANGBEZ'
              ListFieldIndex = 0
              LookupCache = False
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 7
            end
          end
          object LiefanschrGB: TGroupBox
            Left = 341
            Height = 168
            Top = 0
            Width = 457
            Align = alClient
            Caption = 'Lieferanschrift'
            ClientHeight = 150
            ClientWidth = 453
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label1: TLabel
              Left = 8
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'Anrede:'
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
              Top = 28
              Width = 77
              AutoSize = False
              Caption = 'Name 1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label42: TLabel
              Left = 8
              Height = 13
              Top = 52
              Width = 77
              AutoSize = False
              Caption = 'Name 2:'
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
              Top = 76
              Width = 77
              AutoSize = False
              Caption = 'Name 3:'
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
              Top = 100
              Width = 77
              AutoSize = False
              Caption = 'Straße:'
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
              Top = 124
              Width = 77
              AutoSize = False
              Caption = 'Land/PLZ/Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object L_Anrede: TEdit
              Left = 88
              Height = 21
              Top = 0
              Width = 190
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 0
            end
            object L_Name1: TEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
              Width = 358
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object L_Name2: TEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 48
              Width = 358
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 2
            end
            object L_Name3: TEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 72
              Width = 358
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 3
            end
            object L_Strasse: TEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 96
              Width = 358
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 4
            end
            object L_LAND: TEdit
              Left = 88
              Height = 21
              Top = 120
              Width = 19
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object L_PLZ: TEdit
              Left = 110
              Height = 21
              Top = 120
              Width = 54
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object L_Ort: TEdit
              Tag = 1
              Left = 168
              Height = 21
              Top = 120
              Width = 278
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 7
            end
            object LiefAnschriftDelBtn: TSpeedButton
              Left = 283
              Height = 22
              Hint = 'Lieferanschrift löschen'
              Top = -1
              Width = 23
              Flat = True
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
              OnClick = LiefAnschriftDelBtnClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
            object LiefAnschriftAuswahlBtn: TSpeedButton
              Left = 312
              Height = 22
              Hint = 'Lieferanschrift auswählen'
              Top = -1
              Width = 23
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Glyph.Data = {
                46050000424D4605000000000000360000002800000012000000120000000100
                2000000000001005000064000000640000000000000000000000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                5000000000FF000000FF000000FF984750009847500098475000984750009847
                5000000000FF000000FF000000FF984750009847500098475000984750009847
                50009847500098475000000000FFFFFFFFFF000000FF98475000984750009847
                50009847500098475000000000FFFFFFFFFF000000FF98475000984750009847
                500098475000984750009847500098475000000000FF000000FF000000FF8080
                80FF984750009847500098475000808080FF000000FF000000FF000000FF9847
                5000984750009847500098475000984750009847500098475000000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF9847500098475000984750009847500098475000984750009847
                5000000000FFFFFFFFFF000000FF000000FF000000FF000000FFFFFFFFFF0000
                00FF000000FF000000FF000000FF984750009847500098475000984750009847
                50009847500098475000000000FFFFFFFFFF000000FF000000FF000000FF0000
                00FFFFFFFFFF000000FF000000FF000000FF000000FF98475000984750008080
                80FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF9847
                500098475000000000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF0000
                00FF000000FF000000FF000000FF808080FF000000FF000000FF000000FF0000
                00FF984750009847500098475000000000FF00FFFFFFFFFFFFFF00FFFFFFFFFF
                FFFF00FFFFFFFFFFFFFF000000FF000000FF00FFFFFF000000FF984750000000
                00FF000000FF98475000984750009847500098475000000000FFFFFFFFFF00FF
                FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF000000FFFFFFFFFF0000
                00FF98475000000000FF000000FF984750009847500098475000984750000000
                00FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF000000FF0000
                00FF00FFFFFF000000FF98475000000000FF000000FF98475000984750009847
                500098475000000000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
                FFFFFFFFFFFF00FFFFFFFFFFFFFF000000FF9847500098475000984750009847
                5000984750009847500098475000000000FF00FFFFFFFFFFFFFF00FFFFFFFFFF
                FFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000FF984750009847
                50009847500098475000984750009847500098475000000000FFFFFFFFFF00FF
                FFFFFFFFFFFF000000FF000000FF000000FF000000FF000000FF000000FF8080
                80FF984750009847500098475000984750009847500098475000984750009847
                5000000000FF000000FF000000FF984750009847500098475000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                5000984750009847500098475000984750009847500098475000984750009847
                50009847500098475000
              }
              OnClick = LiefAnschriftAuswahlBtnClick
              ShowHint = True
              ParentFont = False
              ParentShowHint = False
            end
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Height = 26
          Top = 589
          Width = 798
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 69
          Caption = 'ToolBar2'
          Color = clBtnFace
          EdgeBorders = []
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
          ShowCaptions = True
          TabOrder = 2
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
        object AlgSumPan: TPanel
          Left = 0
          Height = 24
          Top = 565
          Width = 798
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 24
          ClientWidth = 798
          TabOrder = 3
          object Panel17: TPanel
            Left = 0
            Height = 24
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel18: TPanel
            Left = 795
            Height = 24
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object SumPan: TPanel
            Left = 3
            Height = 24
            Top = 0
            Width = 792
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 24
            ClientWidth = 792
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label14: TLabel
              Left = 368
              Height = 24
              Top = 0
              Width = 46
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Netto :'
              Layout = tlCenter
              ParentColor = False
            end
            object Label55: TLabel
              Left = 0
              Height = 24
              Top = 0
              Width = 55
              Align = alLeft
              Caption = ' Summen:'
              Layout = tlCenter
              ParentColor = False
            end
            object Label33: TLabel
              Left = 645
              Height = 24
              Top = 0
              Width = 47
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Brutto :'
              Layout = tlCenter
              ParentColor = False
            end
            object Label17: TLabel
              Left = 514
              Height = 24
              Top = 0
              Width = 46
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'MwSt :'
              Layout = tlCenter
              ParentColor = False
            end
            object Label83: TLabel
              Left = 236
              Height = 24
              Top = 0
              Width = 61
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Gewicht :'
              Layout = tlCenter
              ParentColor = False
            end
            object RohgewLab1: TLabel
              Left = 100
              Height = 24
              Top = 0
              Width = 65
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Rohgew. :'
              Layout = tlCenter
              ParentColor = False
            end
            object Panel27: TPanel
              Left = 692
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 100
              TabOrder = 0
              object DBText15: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'BSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Panel28: TPanel
              Left = 560
              Height = 24
              Top = 0
              Width = 85
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 85
              TabOrder = 1
              object DBText16: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 85
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'BSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Panel29: TPanel
              Left = 414
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 100
              TabOrder = 2
              object DBText17: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Panel62: TPanel
              Left = 297
              Height = 24
              Top = 0
              Width = 71
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 71
              TabOrder = 3
              object DBText41: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 71
                Align = alClient
                Alignment = taRightJustify
                DataField = 'GEWICHT'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object RohgewLab2: TPanel
              Left = 165
              Height = 24
              Top = 0
              Width = 71
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 71
              TabOrder = 4
              object DBText10: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 71
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'ROHGEWINN'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
          end
        end
        object ReAllgBottomPan: TPanel
          Left = 0
          Height = 213
          Top = 352
          Width = 798
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 213
          ClientWidth = 798
          TabOrder = 4
          object Panel53: TPanel
            Left = 0
            Height = 213
            Top = 0
            Width = 341
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'Panel53'
            ClientHeight = 213
            ClientWidth = 341
            TabOrder = 0
            object ShopStatusGB: TGroupBox
              Left = 0
              Height = 47
              Top = 166
              Width = 341
              Align = alBottom
              Caption = 'Shop-Status'
              ClientHeight = 29
              ClientWidth = 337
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object ShopStatusLab: TLabel
                Left = 8
                Height = 13
                Top = 7
                Width = 33
                Caption = 'Status:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object DBEdit6: TDBEdit
                Left = 88
                Height = 21
                Top = 0
                Width = 28
                DataField = 'SHOP_STATUS'
                DataSource = ReEdiDS
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
              object DBLookupComboBox5: TDBLookupComboBox
                Tag = 1
                Left = 120
                Height = 21
                Top = 0
                Width = 210
                Color = clWindow
                DataField = 'SHOP_STATUS'
                DataSource = ReEdiDS
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                KeyField = 'ORDERSTATUS_ID'
                ListField = 'LANGBEZ'
                ListFieldIndex = 0
                ListSource = DM1.ShopOSDS
                LookupCache = False
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
                ParentFont = False
                TabOrder = 1
              end
            end
            object KFZGB: TGroupBox
              Left = 0
              Height = 166
              Top = 0
              Width = 341
              Align = alClient
              Caption = 'Fahrzeugdaten'
              ClientHeight = 148
              ClientWidth = 337
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object Label64: TLabel
                Left = 8
                Height = 13
                Top = 4
                Width = 68
                AutoSize = False
                Caption = 'Kennzeichen:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object Label65: TLabel
                Left = 8
                Height = 13
                Top = 28
                Width = 77
                AutoSize = False
                Caption = 'Schl.-Nr. zu 2.:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object Label66: TLabel
                Left = 8
                Height = 13
                Top = 52
                Width = 77
                AutoSize = False
                Caption = 'Schl.-Nr. zu 3.:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object Label62: TLabel
                Left = 8
                Height = 13
                Top = 76
                Width = 77
                AutoSize = False
                Caption = 'Fahrgestell-Nr.:'
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
                Top = 100
                Width = 77
                AutoSize = False
                Caption = 'Kilometerstand:'
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                ParentColor = False
                ParentFont = False
              end
              object KFZPolKZ: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 0
                Width = 242
                DataField = 'POL_KENNZ'
                DataSource = ReKFZDS
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
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object KFZ_SCHL_ZU_2: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 24
                Width = 242
                DataField = 'SCHL_ZU_2'
                DataSource = ReKFZDS
                Color = clWindow
                Enabled = False
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
              object KFZ_SCHL_ZU_3: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 48
                Width = 242
                DataField = 'SCHL_ZU_3'
                DataSource = ReKFZDS
                Color = clWindow
                Enabled = False
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
              object KFZFGSTNR: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 72
                Width = 242
                DataField = 'FGST_NUM'
                DataSource = ReKFZDS
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
                TabOrder = 3
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object KFZ_KMSTAND: TDBEdit
                Tag = 1
                Left = 88
                Height = 21
                Top = 96
                Width = 242
                DataField = 'KM_STAND'
                DataSource = ReKFZDS
                AutoSize = False
                Color = clWindow
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                MaxLength = 0
                ParentFont = False
                TabOrder = 4
                OnEnter = KuNrEditEnter
                OnExit = KuNrEditExit
                OnKeyDown = KuNrEditKeyDown
                OnKeyPress = KuNrEditKeyPress
              end
              object KFZNavZurueckBtn: TSpeedButton
                Left = 7
                Height = 25
                Hint = 'vorheriges Fahrzeug'
                Top = 120
                Width = 25
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Glyph.Data = {
                  DA020000424DDA0200000000000036000000280000000D0000000D0000000100
                  200000000000A402000064000000640000000000000000000000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000000000FF98475000984750009847500098475000984750009847
                  50009847500098475000984750009847500098475000000000FF000000FF9847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000000000FFBFBF00FF000000FF9847500098475000984750009847
                  50009847500098475000984750009847500098475000000000FFBFBF00FFBFBF
                  00FF000000FF000000FF000000FF000000FF000000FF98475000984750009847
                  500098475000000000FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF
                  00FFBFBF00FF000000FF984750009847500098475000000000FFBFBF00FFBFBF
                  00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FF000000FF9847
                  5000984750009847500098475000000000FFBFBF00FFBFBF00FFBFBF00FFBFBF
                  00FFBFBF00FFBFBF00FFBFBF00FF000000FF9847500098475000984750009847
                  500098475000000000FFBFBF00FFBFBF00FF000000FF000000FF000000FF0000
                  00FF000000FF9847500098475000984750009847500098475000984750000000
                  00FFBFBF00FF000000FF98475000984750009847500098475000984750009847
                  50009847500098475000984750009847500098475000000000FF000000FF9847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000000000FF9847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000984750009847500098475000984750009847500098475000
                }
                OnClick = KFZNavZurueckBtnClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object KFZNavVorBtn: TSpeedButton
                Left = 32
                Height = 25
                Hint = 'nächstes Fahrzeug'
                Top = 120
                Width = 25
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Glyph.Data = {
                  DA020000424DDA0200000000000036000000280000000D0000000D0000000100
                  200000000000A402000064000000640000000000000000000000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000000000FF98475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000000000FF0000
                  00FF984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000000000FFBFBF00FF000000FF984750009847
                  500098475000984750009847500098475000000000FF000000FF000000FF0000
                  00FF000000FFBFBF00FFBFBF00FF000000FF9847500098475000984750009847
                  500098475000000000FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF
                  00FFBFBF00FF000000FF98475000984750009847500098475000000000FFBFBF
                  00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FFBFBF00FF0000
                  00FF984750009847500098475000000000FFBFBF00FFBFBF00FFBFBF00FFBFBF
                  00FFBFBF00FFBFBF00FFBFBF00FF000000FF9847500098475000984750009847
                  5000000000FF000000FF000000FF000000FF000000FFBFBF00FFBFBF00FF0000
                  00FF984750009847500098475000984750009847500098475000984750009847
                  500098475000000000FFBFBF00FF000000FF9847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000000000FF0000
                  00FF984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000000000FF9847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000984750009847500098475000984750009847500098475000
                }
                OnClick = KFZNavVorBtnClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object KFZUebernehmenBtn: TSpeedButton
                Left = 56
                Height = 25
                Hint = 'Fahrzeug in Rechnung übernehmen'
                Top = 120
                Width = 93
                Caption = 'Übernehmen'
                Flat = True
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
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  50009847500098475000FFFFFFFF984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000800000FF800000FF98475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  50009847500098475000984750009847500098475000808080FF808080FFFFFF
                  FFFF984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000800000FF0080
                  00FF008000FF800000FF98475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000808080FF9847500098475000808080FFFFFFFFFF98475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000800000FF008000FF008000FF008000FF008000FF800000FF9847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000808080FF9847500098475000984750009847
                  5000808080FFFFFFFFFF98475000984750009847500098475000984750009847
                  500098475000984750009847500098475000800000FF008000FF008000FF0080
                  00FF008000FF008000FF008000FF800000FF9847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000808080FF9847
                  50009847500098475000984750009847500098475000808080FFFFFFFFFF9847
                  5000984750009847500098475000984750009847500098475000984750008000
                  00FF008000FF008000FF008000FF00FF00FF008000FF008000FF008000FF0080
                  00FF800000FF9847500098475000984750009847500098475000984750009847
                  500098475000808080FFFFFFFFFF9847500098475000808080FFFFFFFFFF9847
                  50009847500098475000808080FFFFFFFFFF9847500098475000984750009847
                  5000984750009847500098475000008000FF008000FF008000FF00FF00FF9847
                  500000FF00FF008000FF008000FF008000FF800000FF98475000984750009847
                  50009847500098475000984750009847500098475000808080FFFFFFFFFF9847
                  5000808080FF98475000808080FFFFFFFFFF9847500098475000808080FFFFFF
                  FFFF9847500098475000984750009847500098475000984750009847500000FF
                  00FF008000FF00FF00FF98475000984750009847500000FF00FF008000FF0080
                  00FF008000FF800000FF98475000984750009847500098475000984750009847
                  500098475000808080FFFFFFFFFF808080FF9847500098475000984750008080
                  80FFFFFFFFFF9847500098475000808080FFFFFFFFFF98475000984750009847
                  50009847500098475000984750009847500000FF00FF98475000984750009847
                  5000984750009847500000FF00FF008000FF008000FF008000FF800000FF9847
                  5000984750009847500098475000984750009847500098475000808080FF9847
                  500098475000984750009847500098475000808080FFFFFFFFFF984750009847
                  5000808080FFFFFFFFFF98475000984750009847500098475000984750009847
                  50009847500098475000984750009847500098475000984750009847500000FF
                  00FF008000FF008000FF008000FF800000FF9847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000808080FFFFFFFFFF9847500098475000808080FFFFFFFFFF9847
                  5000984750009847500098475000984750009847500098475000984750009847
                  50009847500098475000984750009847500000FF00FF008000FF008000FF0080
                  00FF800000FF9847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000808080FFFFFF
                  FFFF9847500098475000808080FFFFFFFFFF9847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  50009847500000FF00FF008000FF008000FF008000FF800000FF984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000808080FFFFFFFFFF98475000984750008080
                  80FFFFFFFFFF9847500098475000984750009847500098475000984750009847
                  500098475000984750009847500098475000984750009847500000FF00FF0080
                  00FF008000FF008000FF800000FF984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000808080FFFFFFFFFF9847500098475000808080FFFFFFFFFF984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000984750009847500000FF00FF008000FF008000FF800000FF9847
                  5000984750009847500098475000984750009847500098475000984750009847
                  50009847500098475000984750009847500098475000808080FFFFFFFFFF9847
                  5000808080FFFFFFFFFF98475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500000FF00FF008000FF008000FF984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  50009847500098475000808080FFFFFFFFFF808080FF98475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500000FF00FF984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750008080
                  80FF984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000
                }
                NumGlyphs = 2
                OnClick = KFZUebernehmenBtnClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object KFZAddrErase: TSpeedButton
                Left = 150
                Height = 25
                Hint = 'Fahrzeug aus der Rechnung entfernen'
                Top = 120
                Width = 78
                Caption = 'Verwerfen'
                Flat = True
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
                OnClick = KFZAddrEraseClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object KFZAddrAssign: TSpeedButton
                Left = 228
                Height = 25
                Hint = 'Fahrzeug dem Kunden zuordnen'
                Top = 120
                Width = 25
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Glyph.Data = {
                  76060000424D7606000000000000360000002800000014000000140000000100
                  2000000000004006000064000000640000000000000000000000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  500098475000984750009847500098475000808080FF000000FF984750009847
                  500098475000000000FF000000FF000000FF9847500098475000984750009847
                  500098475000984750009847500098475000984750009847500098475000FFFF
                  FFFFC0C0C0FF808080FF000000FF000000FF000000FF000000FF808080FF8080
                  80FF000000FF000000FF98475000984750009847500098475000984750009847
                  5000984750009847500098475000000000FFFFFFFFFFC0C0C0FF808080FF0000
                  00FF808080FF808080FFFFFFFFFFFFFFFFFF808080FF808080FF000000FF9847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000000000FFFFFFFFFFC0C0C0FF808080FF000000FF000000FF000000FF0000
                  00FFFFFFFFFFC0C0C0FF808080FF000000FF9847500098475000984750009847
                  500098475000984750009847500098475000000000FF000000FFFFFFFFFFC0C0
                  C0FF808080FF000000FFC0C0C0FFC0C0C0FF000000FFFFFFFFFFC0C0C0FF8080
                  80FF000000FF9847500098475000984750009847500098475000984750009847
                  5000000000FFC0C0C0FF000000FFFFFFFFFFC0C0C0FF808080FF000000FFC0C0
                  C0FFC0C0C0FF000000FFFFFFFFFFC0C0C0FF808080FF000000FF984750009847
                  5000984750009847500098475000000000FFC0C0C0FFC0C0C0FF000000FF0000
                  00FFFFFFFFFFC0C0C0FF000000FFC0C0C0FFC0C0C0FFC0C0C0FF000000FFFFFF
                  FFFFC0C0C0FF808080FF000000FF984750009847500098475000984750000000
                  00FFFFFFFFFF808080FF000000FFC0C0C0FF000000FF000000FFC0C0C0FFC0C0
                  C0FFC0C0C0FFC0C0C0FFC0C0C0FF000000FFFFFFFFFFC0C0C0FF808080FF0000
                  00FF984750009847500098475000000000FFFFFFFFFF808080FF000000FFC0C0
                  C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                  C0FF000000FFFFFFFFFF808080FF000000FF9847500098475000984750009847
                  5000000000FFFFFFFFFF808080FF000000FFFFFFFFFFC0C0C0FFFFFFFFFFC0C0
                  C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF000000FFFFFFFFFF8080
                  80FF000000FF984750009847500098475000000000FFFFFFFFFFC0C0C0FF0000
                  00FFC0C0C0FFFFFFFFFFC0C0C0FFFFFFFFFFC0C0C0FFC0C0C0FF000000FF0000
                  00FFC0C0C0FF000000FFFFFFFFFF808080FF000000FF98475000984750009847
                  500098475000000000FFFFFFFFFF000000FFFFFFFFFFC0C0C0FFFFFFFFFFC0C0
                  C0FFFFFFFFFF000000FFC0C0C0FF808080FF000000FF000000FFC0C0C0FF8080
                  80FF000000FF984750009847500098475000FFFFFFFF000000FF808080FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FF000000FFFFFFFFFFC0C0
                  C0FF808080FF000000FF000000FF000000FF9847500098475000984750009847
                  500098475000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                  00FFFFFFFFFFC0C0C0FF000000FFFFFFFFFFC0C0C0FF808080FF000000FF0000
                  00FF98475000984750009847500098475000FFFFFFFFC0C0C0FFFFFFFFFFFFFF
                  FFFFFFFFFFFF808080FF000000FF808080FF000000FF000000FF000000FF0000
                  00FFFFFFFFFFC0C0C0FF808080FF000000FF9847500098475000984750009847
                  500098475000FFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                  FFFF808080FF808080FFC0C0C0FFC0C0C0FF000000FFFFFFFFFFC0C0C0FF8080
                  80FF000000FF9847500098475000984750009847500098475000FFFFFFFF9847
                  5000FFFFFFFF000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF0000
                  00FF000000FF000000FFFFFFFFFFC0C0C0FF808080FF98475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000000000FF000000FF000000FF984750009847500098475000000000FFFFFF
                  FFFF984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000984750009847
                  5000984750009847500098475000984750009847500098475000
                }
                OnClick = KFZAddrAssignClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
              object KFZAuswahlBtn: TSpeedButton
                Left = 252
                Height = 25
                Hint = 'Fahrzeugstamm öffnen und Fahrzeug auswählen'
                Top = 120
                Width = 79
                Caption = 'Auswahl ...'
                Flat = True
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Quality = fqAntialiased
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777770000007777777777777777770000007777770007777700070000007777
                  770F0777770F0700000077777700087778000700000077777700000000000700
                  00007777770F0000F000070000007777770F0000F00007000000780000000000
                  00000700000070FBFB00000800007700000070BFBFBF00B070077700000070FB
                  FBFB00F070077700000070BFBFBF00B070077700000070FBFBFBFBF077777700
                  000070BFBFBFBFB077777700000070FBF0000008777777000000770007777777
                  777777000000777777777777777777000000
                }
                OnClick = KFZIDCBButtonClick
                ShowHint = True
                ParentFont = False
                ParentShowHint = False
              end
            end
          end
          object InfoGB: TGroupBox
            Left = 341
            Height = 213
            Top = 0
            Width = 457
            Align = alClient
            Caption = 'Info'
            ClientHeight = 195
            ClientWidth = 453
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RechInfoMemo: TDBMemo
              Left = 0
              Height = 195
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Top = 0
              Width = 453
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
        object Panelxxx: TPanel
          Left = 0
          Height = 67
          Top = 0
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 67
          ClientWidth = 798
          TabOrder = 5
          object KundatGB: TGroupBox
            Left = 0
            Height = 67
            Top = 0
            Width = 798
            Align = alClient
            Caption = 'Kundendaten'
            ClientHeight = 49
            ClientWidth = 794
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label47: TLabel
              Left = 8
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
              Left = 8
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
            object Label53: TLabel
              Left = 200
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
            object Label31: TLabel
              Left = 200
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
            object KuNrEdit: TDBComboBox
              Left = 88
              Height = 21
              Hint = 'mit F3 gelangen Sie in die Adressauswahl'
              Top = 0
              Width = 105
              DataField = 'KUN_NUM'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = KuNrEditButtonClick
              OnEnter = KuNrEditEnter
              OnExit = KuNrEditExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object Panel2: TPanel
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
              object DBText1: TDBText
                Left = 0
                Height = 13
                Top = 4
                Width = 102
                Alignment = taCenter
                AutoSize = False
                DataField = 'VRENUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel8: TPanel
              Tag = 1
              Left = 280
              Height = 21
              Top = 0
              Width = 507
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 21
              ClientWidth = 507
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              object DBText4: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 42
                DataField = 'KUN_NAME1'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel9: TPanel
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
              Left = 306
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
              Tag = 1
              Left = 366
              Height = 20
              Top = 24
              Width = 421
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 421
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              object DBText5: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 42
                DataField = 'KUN_ORT'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
          end
        end
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ClientHeight = 615
        ClientWidth = 798
        object PosKunDatPan: TPanel
          Left = 0
          Height = 68
          Top = 0
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 68
          ClientWidth = 798
          TabOrder = 0
          object KunDatGB2: TGroupBox
            Left = 0
            Height = 68
            Top = 0
            Width = 798
            Align = alClient
            Caption = 'Kundendaten'
            ClientHeight = 50
            ClientWidth = 794
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
              Left = 8
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
              Left = 200
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
              Left = 200
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
            object Panel4: TPanel
              Left = 306
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
              TabOrder = 0
              object DBText2: TDBText
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
            object Panel5: TPanel
              Left = 366
              Height = 20
              Top = 24
              Width = 422
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 422
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object DBText3: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 42
                DataField = 'KUN_ORT'
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
              TabOrder = 2
              object DBText8: TDBText
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
            object Panel12: TPanel
              Left = 280
              Height = 20
              Top = 0
              Width = 507
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 507
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              object DBText9: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 42
                DataField = 'KUN_NAME1'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel25: TPanel
              Left = 88
              Height = 20
              Top = 0
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
              TabOrder = 4
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
              TabOrder = 5
              object DBText11: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 100
                Alignment = taCenter
                AutoSize = False
                DataField = 'VRENUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
          end
        end
        object ToolBar1: TToolBar
          Left = 0
          Height = 26
          Top = 589
          Width = 798
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 56
          Caption = 'ToolBar1'
          Color = clBtnFace
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
          ShowCaptions = True
          TabOrder = 1
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
            Height = 26
            Top = 0
            Caption = 'ToolButton3'
            Style = tbsSeparator
          end
          object EditSNBtn1: TToolButton
            Left = 170
            Top = 0
            Caption = '&Seriennummern'
            ImageIndex = 13
            OnClick = EditSNBtn1Click
          end
          object PosDelBtn1: TToolButton
            Left = 273
            Hint = 'Position löschen'
            Top = 0
            Caption = 'Löschen'
            ImageIndex = 6
            OnClick = PosDelBtn1Click
            ParentShowHint = False
            ShowHint = True
          end
          object UpBtn1: TToolButton
            Left = 344
            Hint = 'Position nach oben verschieben'
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtn1Click
            ParentShowHint = False
            ShowHint = True
          end
          object DownBtn1: TToolButton
            Left = 400
            Hint = 'Position nach unten verschieben'
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtn1Click
            ParentShowHint = False
            ShowHint = True
          end
          object DBNavigator3: TDBNavigator
            Left = 456
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
            Options = []
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
          end
          object GotoFertigBtn: TToolButton
            Left = 584
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
          object ToolButton2: TToolButton
            Left = 576
            Height = 26
            Top = 0
            Caption = 'ToolButton2'
            Style = tbsSeparator
          end
          object NeuArtBtn1: TToolButton
            Left = 73
            Top = 0
            Caption = 'Artikel hinzu'
            DropdownMenu = ArtikelPopupMenu
            ImageIndex = 16
            OnClick = NeuArtBtnClick
            ParentShowHint = False
            ShowHint = True
            Style = tbsButtonDrop
          end
        end
        object PosSumPan: TPanel
          Left = 0
          Height = 24
          Top = 565
          Width = 798
          Align = alBottom
          BevelOuter = bvNone
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
        end
        object BottomSpacePan: TPanel
          Left = 0
          Height = 65
          Top = 500
          Width = 798
          Align = alBottom
          BevelOuter = bvNone
          Color = clBtnFace
          ParentColor = False
          TabOrder = 3
        end
        object InfoPanOut: TPanel
          Left = 0
          Height = 24
          Top = 476
          Width = 798
          Align = alBottom
          BevelOuter = bvNone
          BorderWidth = 1
          ClientHeight = 24
          ClientWidth = 798
          TabOrder = 4
          object Panel38: TPanel
            Left = 1
            Height = 22
            Top = 1
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel39: TPanel
            Left = 794
            Height = 22
            Top = 1
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object PosInfoPan: TPanel
            Left = 4
            Height = 22
            Hint = 'mit F9 kann man diese Info ein- und ausschalten ...'
            Top = 1
            Width = 790
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            ClientHeight = 22
            ClientWidth = 790
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object Label61: TLabel
              Left = 5
              Height = 12
              Top = 5
              Width = 55
              Align = alLeft
              Caption = ' Pos-Info:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object DBText29: TDBText
              Left = 64
              Height = 13
              Top = 5
              Width = 371
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object InfoEKLab: TLabel
              Left = 432
              Height = 13
              Top = 5
              Width = 71
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              Caption = 'EK-Preis :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object InfoEK: TDBText
              Left = 507
              Height = 13
              Top = 5
              Width = 99
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              AutoSize = False
              DataField = 'EK_PREIS'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object InfoRGWLab: TLabel
              Left = 611
              Height = 13
              Top = 5
              Width = 75
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'Rohgewinn :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
            end
            object InfoRGW: TDBText
              Left = 691
              Height = 13
              Top = 5
              Width = 96
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              AutoSize = False
              DataField = 'CALC_RGEWINN'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
          end
        end
        object Panelyyy: TPanel
          Left = 0
          Height = 408
          Top = 68
          Width = 798
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 408
          ClientWidth = 798
          TabOrder = 5
          object CaoGroupBox8: TGroupBox
            Left = 0
            Height = 408
            Top = 0
            Width = 798
            Align = alClient
            Caption = 'Positionen'
            ClientHeight = 390
            ClientWidth = 794
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object PosGrid: TRxDBGrid
              Left = 0
              Height = 390
              Top = 0
              Width = 794
              ColumnDefValues.BlobText = '(blob)'
              TitleButtons = False
              AutoSort = True
              Columns = <              
                item
                  Alignment = taCenter
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
                  Title.Caption = 'Suchbegriff Artikelnummer'
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
                  ReadOnly = True
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'G-Preis'
                  Width = 50
                  FieldName = 'NSUMME'
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
                  ReadOnly = True
                  Title.Alignment = taLeftJustify
                  Title.Orientation = toHorizontal
                  Title.Caption = 'MWST'
                  Width = 34
                  FieldName = 'MWST'
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
                  Title.Caption = 'Lief.-Nr.'
                  Visible = False
                  FieldName = 'VLSNUM'
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
                  Title.Caption = 'Menge geliefert'
                  Visible = False
                  FieldName = 'MENGE_GELIEFERT'
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
                  Title.Caption = 'Gewicht (Kg)'
                  Width = 65
                  FieldName = 'GEWICHT'
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
              BorderStyle = bsNone
              Color = clWindow
              DrawFullLine = False
              FocusColor = clRed
              SelectedColor = clHighlight
              GridLineStyle = psSolid
              DataSource = PosDS
              DefaultRowHeight = 51
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
              ParentFont = False
              ParentShowHint = False
              Scrollbars = ssHorizontal
              TabOrder = 0
              OnKeyPress = PosGridKeyPress
            end
          end
        end
      end
      object PosDetailTS: TTabSheet
        Caption = 'Detail'
        ClientHeight = 615
        ClientWidth = 798
        object ToolBar4: TToolBar
          Left = 0
          Height = 26
          Top = 589
          Width = 798
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 56
          Caption = 'ToolBar4'
          Color = clBtnFace
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object PosDetailZurueckBtn: TToolButton
            Left = 1
            Top = 0
            AutoSize = True
            Caption = 'Zurück'
            ImageIndex = 8
            OnClick = GotoAllgBtnClick
          end
          object ToolButton7: TToolButton
            Left = 65
            Height = 26
            Top = 0
            Caption = 'ToolButton7'
            Style = tbsSeparator
          end
          object JvArrowButton1: TFZDropDownButton
            Left = 73
            Height = 26
            Top = 0
            Width = 112
            Appearance.Border.Normal.Color = clSilver
            Appearance.Border.Normal.Width = 1
            Appearance.Border.Normal.Option = [mboTop, mboLeft, mboBottom, mboRight]
            Appearance.Border.Normal.Visible = True
            Appearance.Border.Hover.Color = clBlack
            Appearance.Border.Hover.Width = 0
            Appearance.Border.Hover.Option = [mboTop, mboLeft, mboBottom, mboRight]
            Appearance.Border.Hover.Visible = True
            Appearance.Border.HotTrack = False
            Appearance.Color.Normal = clDefault
            Appearance.Color.Hover = clDefault
            Appearance.Color.HotTrack = False
            Appearance.Font.HotTrack = False
            Appearance.Icon.Normal.Color = clBlack
            Appearance.Icon.Normal.Width = 1
            Appearance.Icon.Hover.Color = clBlack
            Appearance.Icon.Hover.Width = 1
            Appearance.Icon.HotTrack = False
            TabOrder = 0
            OnClick = NeuArtBtnClick
            Constraints.MinHeight = 22
            Constraints.MinWidth = 22
            Image.Data = {
              1754506F727461626C654E6574776F726B47726170686963B502000089504E47
              0D0A1A0A0000000D4948445200000014000000140803000000BA57ED3F000001
              86694343504943432070726F66696C65000028917D913D48C35014854F53B522
              15073B883864A84E2D888A082E52C52258286D85561D4C5EFA074D1A92141747
              C1B5E0E0CF62D5C1C5595707574110FC0171737352749112EF4B0A2D62BCF078
              1FE7DD7378EF3E406854986A768D03AA6619A9784CCCE656C5C02B7CE8811FB3
              8848CCD413E9C50C3CEBEB9EBAA9EEA23CCBBBEFCFEA57F226037C22F11CD30D
              8B7883787AD3D239EF138758495288CF8923065D90F891EBB2CB6F9C8B0E0B3C
              33646452F3C42162B1D8C17207B392A1124F11871555A37C21EBB2C2798BB35A
              A9B1D63DF90B83796D25CD755A2388630909242142460D655460214ABB468A89
              149DC73CFCC38E3F492E995C6530722CA00A1592E307FF83DFB3350B93136E52
              300674BFD8F6C72810D8059A75DBFE3EB6EDE609E07F06AEB4B6BFDA00663E49
              AFB7B5F01130B00D5C5CB735790FB8DC01869E74C9901CC94F4B281480F733FA
              A61C30780BF4ADB9736B9DE3F401C8D0AC966F80834360AC48D9EB1EEFEEED9C
              DBBF3DADF9FD00A69272BC0420ABE600000033504C5445000000000000800000
              008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000
              FFFF00FF00FFFFFFFFFF8225EB060000000174524E530040E6D8660000000162
              4B47440088051D48000000097048597300000B1300000B1301009A9C18000000
              0774494D4507E50109031435B06EEB84000000694944415418D3958F410AC020
              0C04DD4360410FFBFFD73689DA5A0F964E41E8320E58CA3700B65F90A8EF516A
              BED7E1A223732FC07404FFB49A32F3C92F2B9A648E4D0A6FB8634C33302305DE
              CDDECD3BB71908FD7C9AB3DB8EE6B9D9D99A4CCAF2F6E94CC8C5F9C505E49507
              55196B9CC30000000049454E44AE426082
            }
            ImageStyle = isLeft
            Spacing = -1
            ShowCaption = True
            DropDownMenu = ArtikelPopupMenu
            Caption = 'Artikel hinzu'
          end
          object EditSNBtn2: TToolButton
            Left = 185
            Top = 0
            AutoSize = True
            Caption = '&Seriennummern'
            ImageIndex = 13
            OnClick = EditSNBtn1Click
          end
          object PosDelBtn2: TToolButton
            Left = 288
            Hint = 'Position löschen'
            Top = 0
            AutoSize = True
            Caption = 'Löschen'
            ImageIndex = 6
            OnClick = PosDelBtn1Click
            ParentShowHint = False
            ShowHint = True
          end
          object UpBtn2: TToolButton
            Left = 359
            Hint = 'Position nach oben verschieben'
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtn1Click
            ParentShowHint = False
            ShowHint = True
          end
          object DownBtn2: TToolButton
            Left = 415
            Hint = 'Position nach unten verschieben'
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtn1Click
            ParentShowHint = False
            ShowHint = True
          end
          object DBNavigator2: TDBNavigator
            Left = 471
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
            TabOrder = 1
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
          end
          object ToolButton14: TToolButton
            Left = 591
            Height = 26
            Top = 0
            Caption = 'ToolButton14'
            Style = tbsSeparator
          end
          object PosDetailWeiterBtn: TToolButton
            Left = 599
            Top = 0
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
        end
        object PosDetailKundatPan: TPanel
          Left = 0
          Height = 68
          Top = 0
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
        end
        object Panelzzz: TPanel
          Left = 0
          Height = 129
          Top = 68
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 129
          ClientWidth = 798
          TabOrder = 2
          object CaoGroupBox10: TGroupBox
            Left = 0
            Height = 129
            Top = 0
            Width = 798
            Align = alClient
            Caption = 'akt. Position'
            ClientHeight = 111
            ClientWidth = 794
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object DetailArtNumLab: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 77
              AutoSize = False
              Caption = 'Artikelnr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailMatchLab: TLabel
              Left = 5
              Height = 13
              Top = 28
              Width = 77
              AutoSize = False
              Caption = 'Suchbegriff:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailBarcodeLab: TLabel
              Left = 5
              Height = 13
              Top = 52
              Width = 77
              AutoSize = False
              Caption = 'Barcode/EAN:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailGewichtLab: TLabel
              Left = 5
              Height = 13
              Top = 76
              Width = 77
              AutoSize = False
              Caption = 'Gewicht (Kg):'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label79: TLabel
              Left = 240
              Height = 13
              Top = 4
              Width = 29
              AutoSize = False
              Caption = 'Text:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailText: TDBMemo
              Left = 272
              Height = 106
              Top = 0
              Width = 520
              Anchors = [akTop, akLeft, akRight]
              DataField = 'BEZEICHNUNG'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              WantTabs = True
            end
            object DetailArtnum: TDBEdit
              Left = 85
              Height = 21
              Top = 0
              Width = 149
              DataField = 'ARTNUM'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailMatch: TDBEdit
              Left = 85
              Height = 21
              Top = 24
              Width = 149
              DataField = 'MATCHCODE'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailBarcode: TDBEdit
              Left = 85
              Height = 21
              Top = 48
              Width = 149
              DataField = 'BARCODE'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailGewichtEdi: TDBEdit
              Left = 85
              Height = 21
              Top = 72
              Width = 68
              DataField = 'GEWICHT'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailVPELab: TLabel
              Left = 160
              Height = 13
              Top = 76
              Width = 26
              AutoSize = False
              Caption = 'VPE:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailVPE: TDBEdit
              Left = 190
              Height = 21
              Top = 72
              Width = 44
              DataField = 'VPE'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DBText31: TDBText
              Left = 85
              Height = 13
              Top = -16
              Width = 48
              Color = 14680063
              DataField = 'POSITION'
              DataSource = PosDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label84: TLabel
              Left = 198
              Height = 13
              Top = -16
              Width = 77
              AutoSize = False
              Caption = 'Artikeltyp:'
              Color = 14680063
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object DetailArtikelTyp: TLabel
              Left = 279
              Height = 13
              Top = -16
              Width = 137
              AutoSize = False
              Caption = 'DetailArtikelTyp'
              Color = 14680063
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
          end
        end
        object Panelqqq: TPanel
          Left = 0
          Height = 87
          Top = 197
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 87
          ClientWidth = 798
          TabOrder = 3
          object PosDetailCalcGB: TGroupBox
            Left = 0
            Height = 87
            Top = 0
            Width = 798
            Align = alClient
            Caption = 'Kalkulation'
            ClientHeight = 69
            ClientWidth = 794
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object DetailEKPreisLab: TLabel
              Left = 13
              Height = 13
              Top = 0
              Width = 43
              Caption = 'EK-Preis:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailFaktorLab: TLabel
              Left = 104
              Height = 13
              Top = 0
              Width = 33
              Caption = 'Faktor:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailEPreisLab: TLabel
              Left = 186
              Height = 13
              Top = 0
              Width = 50
              Caption = 'Basispreis:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailRabattLab: TLabel
              Left = 278
              Height = 13
              Top = 0
              Width = 35
              Caption = 'Rabatt:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailEPreisRLab: TLabel
              Left = 344
              Height = 13
              Top = 0
              Width = 53
              Caption = 'Einzelpreis:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailMengeLab: TLabel
              Left = 436
              Height = 13
              Top = 0
              Width = 36
              Caption = 'Menge:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailMEEinheitLab: TLabel
              Left = 486
              Height = 13
              Top = 0
              Width = 35
              Caption = 'Einheit:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailGPreisLab: TLabel
              Left = 538
              Height = 13
              Top = 0
              Width = 78
              Caption = 'Gesamtpreis (N):'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailGPreisBLab: TLabel
              Left = 630
              Height = 13
              Top = 0
              Width = 77
              Caption = 'Gesamtpreis (B):'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailEKPreis: TDBEdit
              Left = 13
              Height = 21
              Top = 16
              Width = 88
              DataField = 'EK_PREIS'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailEPreis: TDBEdit
              Left = 186
              Height = 21
              Top = 16
              Width = 88
              DataField = 'EPREIS'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailRabatt: TDBEdit
              Left = 278
              Height = 21
              Top = 16
              Width = 63
              DataField = 'RABATT'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailMenge: TDBEdit
              Left = 436
              Height = 21
              Top = 16
              Width = 45
              DataField = 'MENGE'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailMEEinheit: TDBEdit
              Left = 486
              Height = 21
              Top = 16
              Width = 50
              DataField = 'ME_EINHEIT'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailGPreis: TDBEdit
              Left = 538
              Height = 21
              Top = 16
              Width = 86
              DataField = 'NSUMME'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailGPreisB: TDBEdit
              Left = 630
              Height = 21
              Top = 16
              Width = 86
              DataField = 'BSUMME'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailRGW_NR: TDBEdit
              Left = 344
              Height = 21
              Top = 40
              Width = 88
              DataField = 'E_RGEWINN'
              DataSource = PosDS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailFaktor: TcyEditFloat
              Left = 104
              Height = 21
              Top = 16
              Width = 78
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              ParentFont = False
              TabOrder = 8
              AutoComplete = True
              Precision = 5
              OnForbiddenCharPressed = DetailArtnumKeyPress
            end
            object DetailRGW: TCurrencyEdit
              Left = 104
              Height = 21
              Top = 40
              Width = 78
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 9
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailEPreisR: TCurrencyEdit
              Left = 344
              Height = 21
              Top = 16
              Width = 88
              Alignment = taRightJustify
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 10
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object DetailAufpreisLab: TLabel
              Left = 60
              Height = 13
              Top = 44
              Width = 41
              Caption = 'Aufpreis:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DetailRohertragLab: TLabel
              Left = 285
              Height = 13
              Top = 44
              Width = 60
              Caption = 'E-Rohertrag:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
        end
        object PosDetailSumPan: TPanel
          Left = 0
          Height = 24
          Top = 565
          Width = 798
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 24
          ClientWidth = 798
          Color = clBtnFace
          ParentColor = False
          TabOrder = 4
          object Panel41: TPanel
            Left = 0
            Height = 24
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel42: TPanel
            Left = 795
            Height = 24
            Top = 0
            Width = 3
            Align = alRight
            TabOrder = 1
          end
        end
        object PosDetailInfoPan: TPanel
          Left = 0
          Height = 281
          Top = 284
          Width = 798
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 281
          ClientWidth = 798
          TabOrder = 5
          object Panel55: TPanel
            Left = 0
            Height = 233
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel58: TPanel
            Left = 795
            Height = 233
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel59: TPanel
            Left = 3
            Height = 233
            Top = 0
            Width = 792
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 233
            ClientWidth = 792
            TabOrder = 2
            object Panel57: TPanel
              Left = 0
              Height = 5
              Top = 0
              Width = 792
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object Panel60: TPanel
              Left = 0
              Height = 3
              Top = 230
              Width = 792
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
            end
            object PreisPC: TPageControl
              Left = 0
              Height = 225
              Top = 5
              Width = 792
              ActivePage = PreisAlgTS
              Align = alClient
              Style = tsButtons
              TabIndex = 0
              TabOrder = 1
              OnChange = PreisPCChange
              OnResize = PreisPCResize
              object PreisAlgTS: TTabSheet
                Caption = 'Preise allgemein'
                ClientHeight = 196
                ClientWidth = 784
                object PreisGrid: TStringGrid
                  Left = 0
                  Height = 80
                  Top = 0
                  Width = 487
                  ColCount = 6
                  DefaultColWidth = 100
                  DefaultRowHeight = 18
                  RowCount = 4
                  ScrollBars = ssNone
                  TabOrder = 0
                end
              end
              object PreisVKHisTS: TTabSheet
                Caption = 'VK-Historie'
                ClientHeight = 196
                ClientWidth = 784
                object HistGrid: TDBGrid
                  Left = 0
                  Height = 196
                  Top = 0
                  Width = 784
                  Align = alClient
                  BorderStyle = bsNone
                  Color = clWindow
                  Columns = <                  
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
                      Alignment = taRightJustify
                      Title.Caption = 'Menge'
                      Width = 47
                      FieldName = 'MENGE'
                    end                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'E-Preis'
                      Width = 69
                      FieldName = 'EPREIS_STR'
                    end                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'Rabatt'
                      Width = 52
                      FieldName = 'RABATT'
                    end                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'Gesamt'
                      Width = 85
                      FieldName = 'GPREIS_STR'
                    end                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'MwSt'
                      Width = 36
                      FieldName = 'STEUER_PROZ'
                    end>
                  DataSource = HisDS
                  DefaultRowHeight = 17
                  Flat = True
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                end
              end
              object LiefPreisTS: TTabSheet
                Caption = 'Lieferanten / Preise'
                ClientHeight = 196
                ClientWidth = 784
                object ArtLiefPreisGrid: TDBGrid
                  Left = 0
                  Height = 196
                  Top = 0
                  Width = 784
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
                      Alignment = taRightJustify
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
                  Flat = True
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object PreisEKHisTS: TTabSheet
                Caption = 'EK-Historie'
              end
              object EKBestTS: TTabSheet
                Caption = 'EK-Bestellungen'
              end
              object TabSheet6: TTabSheet
                Caption = 'Artikel-Info'
                ClientHeight = 196
                ClientWidth = 784
                object Memo1: TMemo
                  Left = 0
                  Height = 196
                  Top = 0
                  Width = 784
                  Align = alClient
                  Color = clWindow
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
              object StueckListTS: TTabSheet
                Caption = 'Stückliste'
                ClientHeight = 196
                ClientWidth = 784
                object StListGrid: TDBGrid
                  Left = 0
                  Height = 196
                  Top = 0
                  Width = 784
                  Align = alClient
                  BorderStyle = bsNone
                  Color = clWindow
                  Columns = <                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'Menge'
                      Width = 60
                      FieldName = 'MENGE'
                    end                  
                    item
                      Title.Caption = 'Artikelnummer'
                      Width = 90
                      FieldName = 'ARTNUM'
                    end                  
                    item
                      Title.Caption = 'Matchcode'
                      Width = 90
                      FieldName = 'MATCHCODE'
                    end                  
                    item
                      Title.Caption = 'EAN'
                      Width = 90
                      FieldName = 'BARCODE'
                    end                  
                    item
                      Title.Caption = 'Artikelbezeichnung'
                      Width = 200
                      FieldName = 'KURZNAME'
                    end                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'EK-Preis'
                      FieldName = 'EK_PREIS'
                    end                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'Lagermenge'
                      Width = 65
                      FieldName = 'MENGE_AKT'
                    end>
                  DataSource = STListDS
                  DefaultRowHeight = 17
                  Flat = True
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object LiefTS: TTabSheet
                Caption = 'Lieferungen'
                ClientHeight = 196
                ClientWidth = 784
                object LiefGrid: TDBGrid
                  Left = 0
                  Height = 196
                  Top = 0
                  Width = 784
                  Align = alClient
                  BorderStyle = bsNone
                  Color = clWindow
                  Columns = <                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'LS-Num.'
                      Width = 50
                      FieldName = 'VLSNUM'
                    end                  
                    item
                      Title.Caption = 'Lief.-Datum'
                      Width = 60
                      FieldName = 'LDATUM'
                    end                  
                    item
                      Title.Caption = 'Versand'
                      Width = 100
                      FieldName = 'LIEFART_STR'
                    end                  
                    item
                      Title.Caption = 'Kunde'
                      Width = 140
                      FieldName = 'KUN_NAME1'
                    end                  
                    item
                      Alignment = taRightJustify
                      Title.Caption = 'Menge'
                      Width = 50
                      FieldName = 'MENGE'
                    end                  
                    item
                      Title.Caption = 'Artikelnr.'
                      Width = 60
                      FieldName = 'ARTNUM'
                    end                  
                    item
                      Title.Caption = 'Bezeichnung'
                      Width = 230
                      FieldName = 'BEZEICHNUNG'
                    end>
                  DataSource = LiefDS
                  DefaultRowHeight = 17
                  Flat = True
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
          end
          object SchnellerfassungGB: TGroupBox
            Left = 0
            Height = 48
            Top = 233
            Width = 798
            Align = alBottom
            Caption = 'Schnellerfassung'
            ClientHeight = 30
            ClientWidth = 794
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object Label94: TLabel
              Left = 8
              Height = 13
              Top = 8
              Width = 36
              Caption = 'Menge:'
              FocusControl = SchnellArtnum
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object AddMengeEdi: TRxSpinEdit
              Left = 48
              Height = 21
              Top = 4
              Width = 74
              Alignment = taRightJustify
              ValueType = vtFloat
              Value = 1
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 0
              OnEnter = DetailArtnumEnter
              OnExit = DetailArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = DetailArtnumKeyPress
            end
            object Label90: TLabel
              Left = 152
              Height = 13
              Top = 8
              Width = 69
              Caption = 'Artikel&nummer:'
              FocusControl = SchnellArtnum
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object SchnellArtnum: TEdit
              Tag = -2
              Left = 224
              Height = 21
              Top = 4
              Width = 106
              CharCase = ecUppercase
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = DetailArtnumEnter
              OnExit = SchnellArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = SchnellArtnumKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object Label91: TLabel
              Left = 336
              Height = 13
              Top = 8
              Width = 70
              Caption = 'Barcode/&EAN:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object SchnellBarcode: TEdit
              Tag = -3
              Left = 408
              Height = 21
              Top = 4
              Width = 106
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = DetailArtnumEnter
              OnExit = SchnellArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = SchnellArtnumKeyPress
              ParentFont = False
              TabOrder = 2
            end
            object Label92: TLabel
              Left = 520
              Height = 13
              Top = 8
              Width = 60
              Caption = '&Suchbegriff :'
              FocusControl = SchnellMatchcode
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object SchnellMatchcode: TEdit
              Tag = -1
              Left = 584
              Height = 21
              Top = 4
              Width = 106
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = DetailArtnumEnter
              OnExit = SchnellArtnumExit
              OnKeyDown = DetailArtnumKeyDown
              OnKeyPress = SchnellArtnumKeyPress
              ParentFont = False
              TabOrder = 3
            end
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ClientHeight = 615
        ClientWidth = 798
        object ToolBar5: TToolBar
          Left = 0
          Height = 26
          Top = 589
          Width = 798
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 69
          Caption = 'ToolBar2'
          Color = clBtnFace
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = False
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object ToolButton12: TToolButton
            Left = 1
            Top = 0
            Caption = 'Zurück'
            ImageIndex = 8
            OnClick = GotoPosBtnClick
          end
          object ToolButton17: TToolButton
            Left = 70
            Height = 26
            Top = 0
            Caption = 'ToolButton17'
            Style = tbsSeparator
          end
          object LieferscheinBuchenBtn: TToolButton
            Left = 78
            Top = 0
            AutoSize = True
            Caption = '&Lieferschein erstellen'
            ImageIndex = 12
            OnClick = LieferscheinBuchenBtnClick
          end
          object ToolButton8: TToolButton
            Left = 207
            Height = 26
            Top = 0
            Caption = 'ToolButton8'
            Style = tbsSeparator
          end
          object TeillieferungBtn: TToolButton
            Left = 215
            Top = 0
            AutoSize = True
            Caption = '&Teillieferung'
            ImageIndex = 12
            OnClick = TeillieferungBtnClick
          end
          object ToolButton6: TToolButton
            Left = 302
            Height = 26
            Top = 0
            Caption = 'ToolButton6'
            Style = tbsSeparator
          end
          object BuchenBtn: TToolButton
            Left = 310
            Top = 0
            Caption = 'S&peichern und Buchen'
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
          object ToolButton1: TToolButton
            Left = 449
            Height = 26
            Top = 0
            Caption = 'ToolButton1'
            Style = tbsSeparator
          end
          object PrintPrevBtn: TToolButton
            Left = 457
            Top = 0
            Caption = 'Druck&vorschau'
            ImageIndex = 14
            OnClick = PrintPrevBtnClick
          end
          object ToolButton5: TToolButton
            Left = 560
            Height = 26
            Top = 0
            Caption = 'ToolButton5'
            Style = tbsSeparator
          end
          object Label78: TLabel
            Left = 568
            Height = 26
            Top = 0
            Width = 52
            Alignment = taCenter
            AutoSize = False
            Caption = 'Status :'
            Layout = tlCenter
            ParentColor = False
          end
          object StadiumCB: TRxDBComboBox
            Left = 620
            Height = 24
            Top = 0
            Width = 145
            Style = csDropDownList
            DataField = 'STADIUM'
            DataSource = ReEdiDS
            EnableValues = True
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ItemHeight = 16
            Items.Strings = (
              'in Bearbeitung'
              'bitte prüfen'
              'Freigegeben'
              'Stapeldruck'
            )
            MaxLength = 0
            ParentFont = False
            TabOrder = 0
            Values.Strings = (
              '0'
              '10'
              '20'
              '30'
            )
          end
        end
        object FertigSumPan: TPanel
          Left = 0
          Height = 24
          Top = 565
          Width = 798
          Align = alBottom
          BevelOuter = bvNone
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
        end
        object FertigKundDatPan: TPanel
          Left = 0
          Height = 68
          Top = 0
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
        end
        object Panel3: TPanel
          Left = 0
          Height = 92
          Top = 68
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 92
          ClientWidth = 798
          TabOrder = 3
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
              Top = 1
              Width = 77
              AutoSize = False
              Caption = 'Bestellt durch:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label39: TLabel
              Left = 5
              Height = 13
              Top = 24
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
              Top = 47
              Width = 77
              AutoSize = False
              Caption = 'Referenznr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBEdit5: TDBEdit
              Left = 86
              Height = 21
              Top = 0
              Width = 232
              DataField = 'BEST_NAME'
              DataSource = ReEdiDS
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
            object DBEdit4: TDBEdit
              Left = 86
              Height = 21
              Top = 47
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
              TabOrder = 1
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBDateEdit1: TRxDBDateEdit
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
              TabOrder = 2
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
            Width = 472
            Align = alClient
            Caption = 'Texte'
            ClientHeight = 74
            ClientWidth = 468
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
              Top = 1
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
              Top = 24
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
              Top = 47
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
            object DBEdit3: TDBEdit
              Left = 86
              Height = 21
              Top = 0
              Width = 377
              DataField = 'PROJEKT'
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
              OnKeyPress = KuNrEditKeyPress
              OnKeyUp = KuNrEditKeyDown
            end
            object DBEdit2: TDBEdit
              Left = 86
              Height = 21
              Top = 24
              Width = 377
              DataField = 'USR1'
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
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
            object DBEdit1: TDBEdit
              Left = 86
              Height = 21
              Top = 47
              Width = 377
              DataField = 'USR2'
              DataSource = ReEdiDS
              Anchors = [akTop, akLeft, akRight]
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
          end
        end
        object Kundendaten: TPanel
          Left = 0
          Height = 144
          Top = 160
          Width = 798
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 144
          ClientWidth = 798
          TabOrder = 4
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
              Top = 8
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
              Top = 32
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
              Top = 53
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
              Top = 80
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
            object Label48: TLabel
              Left = 5
              Height = 13
              Top = 99
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
              Top = 99
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
              Top = 99
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
              Left = 264
              Height = 13
              Top = 99
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
            object DBEdit11: TDBEdit
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
              TabOrder = 0
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit12: TDBEdit
              Left = 152
              Height = 21
              Top = 96
              Width = 40
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              CharCase = ecUppercase
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
            object DBEdit13: TDBEdit
              Left = 234
              Height = 21
              Top = 96
              Width = 28
              DataField = 'SOLL_NTAGE'
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
              TabOrder = 2
              OnKeyPress = KuNrEditKeyPress
              OnKeyUp = KuNrEditKeyDown
            end
            object DBLookupComboBox4: TDBLookupComboBox
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
              TabOrder = 3
            end
            object DBLookupComboBox1: TDBLookupComboBox
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
              TabOrder = 4
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 86
              Height = 21
              Top = 48
              Width = 232
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
              TabOrder = 5
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
              TabOrder = 6
            end
          end
          object CaoGroupBox6: TGroupBox
            Left = 326
            Height = 144
            Top = 0
            Width = 472
            Align = alClient
            Caption = 'Info'
            ClientHeight = 126
            ClientWidth = 468
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
              Width = 468
              Align = alClient
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
              TabOrder = 0
            end
          end
        end
        object Panel999: TPanel
          Left = 0
          Height = 261
          Top = 304
          Width = 798
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 261
          ClientWidth = 798
          TabOrder = 5
          object CaoGroupBox7: TGroupBox
            Left = 0
            Height = 261
            Top = 0
            Width = 798
            Align = alClient
            Caption = 'festgestellte Probleme'
            ClientHeight = 243
            ClientWidth = 794
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object ProblemLab: TLabel
              Left = 0
              Height = 243
              Top = 0
              Width = 794
              Align = alClient
              Alignment = taCenter
              Caption = 'keine'
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              WordWrap = True
            end
          end
        end
      end
    end
  end
  object ArtPreisTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = ArtPreisTabCalcFields
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
    Left = 64
    Top = 408
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
    end
    object ArtPreisTabADRESS_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADRESS_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ArtPreisTabPREIS_TYP: TZByteField
      FieldKind = fkData
      FieldName = 'PREIS_TYP'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ArtPreisTabBESTNUM: TZRawStringField
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
    object ArtPreisTabPREIS: TZDoubleField
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
      Precision = 10
    end
    object ArtPreisTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object ArtPreisTabGEAEND_NAME: TZRawStringField
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
    object ArtPreisTabMENGE2: TZUInt64Field
      FieldKind = fkData
      FieldName = 'MENGE2'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtPreisTabPREIS2: TZDoubleField
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
    object ArtPreisTabMENGE3: TZCardinalField
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
    object ArtPreisTabPREIS3: TZDoubleField
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
    object ArtPreisTabMENGE4: TZUInt64Field
      DisplayWidth = 10
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
    object ArtPreisTabPREIS4: TZDoubleField
      FieldKind = fkData
      FieldName = 'PREIS4'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ArtPreisTabMENGE5: TZCardinalField
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
    object ArtPreisTabPREIS5: TZDoubleField
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
  object HisTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = HisTabCalcFields
    SQL.Strings = (
      'select '
      'JOURNALPOS.JOURNAL_ID, JOURNALPOS.QUELLE, JOURNALPOS.ARTIKEL_ID, JOURNALPOS.VRENUM, '
      'JOURNALPOS.BEZEICHNUNG, JOURNALPOS.MENGE,JOURNALPOS.EPREIS, JOURNALPOS.RABATT, JOURNALPOS.STEUER_CODE,'
      ''
      'JOURNAL.REC_ID, JOURNAL.RDATUM, JOURNAL.KUN_NAME1, JOURNAL.WAEHRUNG, JOURNAL.MWST_0, '
      'JOURNAL.MWST_1, JOURNAL.MWST_2, JOURNAL.MWST_3, JOURNAL.LDATUM, JOURNAL.VLSNUM, JOURNAL.BRUTTO_FLAG'
      ''
      'from JOURNALPOS, JOURNAL'
      ''
      'where JOURNAL.QUELLE=:QID and JOURNALPOS.ARTIKEL_ID =:AID'
      'and JOURNALPOS.JOURNAL_ID = JOURNAL.REC_ID'
      'and JOURNALPOS.ARTIKELTYP in (''N'',''S'',''L'') and JOURNALPOS.ARTIKEL_ID>0'
      'order by RDATUM DESC, VRENUM DESC'
      'LIMIT 0,100'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'QID'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    MasterSource = PosDS
    Left = 192
    Top = 408
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'QID'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    object HisTabQUELLE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object HisTabRDATUM: TZDateField
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object HisTabLDATUM: TZDateField
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'LDATUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object HisTabVRENUM: TZIntegerField
      DisplayLabel = 'Beleg'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HisTabVLSNUM: TZIntegerField
      DisplayLabel = 'Beleg'
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HisTabKUN_NAME1: TZRawStringField
      DisplayLabel = 'Kunde / Lieferant'
      DisplayWidth = 30
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object HisTabMENGE: TZDoubleField
      DisplayLabel = 'Menge'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',###,##0.00'
    end
    object HisTabEPREIS: TZDoubleField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HisTabEPREIS_STR: TStringField
      DisplayLabel = 'E-Preis'
      FieldKind = fkCalculated
      FieldName = 'EPREIS_STR'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HisTabRABATT: TZDoubleField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0.0 "%";-0.0 "%"; '
    end
    object HisTabGPREIS_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Gesamt'
      FieldKind = fkCalculated
      FieldName = 'GPREIS_STR'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HisTabWAEHRUNG: TZRawStringField
      DisplayLabel = 'W'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object HisTabMWST_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object HisTabMWST_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object HisTabMWST_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object HisTabMWST_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object HisTabSTEUER_CODE: TZSmallIntField
      DisplayLabel = 'ST-Code'
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HisTabSTEUER_PROZ: TFloatField
      DisplayLabel = 'MwSt'
      FieldKind = fkCalculated
      FieldName = 'STEUER_PROZ'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0"%";0"%"; '
    end
    object HisTabBRUTTO_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object HisTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object LiefTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select J.VLSNUM, J.LDATUM, J.LIEFART, J.KUN_NAME1, JP.ARTNUM, JP.MENGE, JP.BEZEICHNUNG'
      'from JOURNAL J, JOURNALPOS JP'
      'where J.REC_ID=JP.JOURNAL_ID'
      'and JP.QUELLE=2 and JP.QUELLE_SRC=:SRC_ID'
      'order by J.LDATUM ASC'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'SRC_ID'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 472
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'SRC_ID'
        ParamType = ptUnknown
      end>
    object LiefTabVLSNUM: TZIntegerField
      DisplayLabel = 'LS-Num.'
      DisplayWidth = 7
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object LiefTabLDATUM: TZDateField
      DisplayLabel = 'Lief.-Datum'
      DisplayWidth = 9
      FieldKind = fkData
      FieldName = 'LDATUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object LiefTabLIEFART: TZShortIntField
      DisplayWidth = 7
      FieldKind = fkData
      FieldName = 'LIEFART'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object LiefTabKUN_NAME1: TZRawStringField
      DisplayLabel = 'Kunde'
      DisplayWidth = 25
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object LiefTabARTNUM: TZRawStringField
      DisplayLabel = 'Artikelnr.'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabMENGE: TZDoubleField
      DisplayLabel = 'Menge'
      DisplayWidth = 6
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0.00'
    end
    object LiefTabBEZEICHNUNG: TZRawCLobField
      DisplayLabel = 'Bezeichnung'
      FieldKind = fkData
      FieldName = 'BEZEICHNUNG'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object LiefTabLIEFART_STR: TStringField
      DisplayLabel = 'Versand'
      DisplayWidth = 61
      FieldKind = fkLookup
      FieldName = 'LIEFART_STR'
      Index = 7
      KeyFields = 'LIEFART'
      LookupCache = False
      LookupDataSet = DM1.LiefArtTab
      LookupKeyFields = 'LIEF_ID'
      LookupResultField = 'LANGBEZ'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
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
      'select * from JOURNALPOS'
      'where JOURNAL_ID=:ID'
      'order by POSITION'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 560
    Top = 216
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
    object PosTabQUELLE: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabQUELLE_SUB: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE_SUB'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabJOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabPOSITION: TZIntegerField
      Alignment = taCenter
      DisplayLabel = 'Pos.'
      DisplayWidth = 3
      FieldKind = fkData
      FieldName = 'POSITION'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '000'
    end
    object PosTabARTIKELTYP: TZRawStringField
      DisplayLabel = 'T'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabATRNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabVLSNUM: TZIntegerField
      DisplayLabel = 'Lief.-Nr.'
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;-'
    end
    object PosTabMATCHCODE: TZRawStringField
      DisplayLabel = 'Suchbegriff'
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBARCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 13
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
      Index = 14
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
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGROESSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'GROESSE'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabDIMENSION: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIMENSION'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEWICHT: TZDoubleField
      DisplayLabel = 'Gewicht (Kg)'
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',#0.000;-,#0.000;-'
      EditFormat = '0.000'
    end
    object PosTabME_EINHEIT: TZRawStringField
      DisplayLabel = 'M.-Einheit'
      FieldKind = fkData
      FieldName = 'ME_EINHEIT'
      Index = 19
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
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabMENGE: TZDoubleField
      DisplayLabel = 'Menge'
      DisplayWidth = 6
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 21
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
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
      EditFormat = '0.00'
    end
    object PosTabRABATT: TZDoubleField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0"%";-,###,##0.0"%"; '
      EditFormat = '0.00'
    end
    object PosTabE_RGEWINN: TZDoubleField
      FieldKind = fkData
      FieldName = 'E_RGEWINN'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
      EditFormat = '0.00'
    end
    object PosTabALTTEIL_STCODE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'ALTTEIL_STCODE'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEGENKTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GEGENKTO'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabNSUMME: TCurrencyField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'NSUMME'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabMSumme: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MSumme'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabBSUMME: TCurrencyField
      DisplayLabel = 'G-PreisBrutto'
      FieldKind = fkCalculated
      FieldName = 'BSUMME'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabSTEUER_CODE: TZSmallIntField
      Alignment = taCenter
      DisplayLabel = 'S'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-;-'
    end
    object PosTabMWST: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'MWST'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 8
    end
    object PosTabALTTEIL_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'ALTTEIL_PROZ'
      Index = 32
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
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object PosTabCALC_RGEWINN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_RGEWINN'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00'
    end
    object PosTabSN_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'SN_FLAG'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabALTTEIL_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'ALTTEIL_FLAG'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabBEZ_FEST_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'BEZ_FEST_FLAG'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabCALC_LAGERMENGE_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_LAGERMENGE_STR'
      Index = 38
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
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBRUTTO_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabCALC_STEUERPORZ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_STEUERPORZ'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object PosTabPROVIS_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'PROVIS_PROZ'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object PosTabPROVIS_WERT: TZDoubleField
      FieldKind = fkData
      FieldName = 'PROVIS_WERT'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object PosTabVPE: TZUInt64Field
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'VPE'
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object PosTabMENGE_GELIEFERT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MENGE_GELIEFERT'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;,#0.00;-'
    end
    object PosTabEK_PREIS: TZDoubleField
      FieldKind = fkData
      FieldName = 'EK_PREIS'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditFormat = ',#0.00'
    end
    object PosTabCALC_FAKTOR: TZDoubleField
      FieldKind = fkData
      FieldName = 'CALC_FAKTOR'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object PosTabNO_RABATT_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'NO_RABATT_FLAG'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object ReEdiTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ReEdiTabAfterScroll
    BeforeClose = ReEdiTabBeforeClose
    AfterScroll = ReEdiTabAfterScroll
    OnCalcFields = ReEdiTabCalcFields
    BeforeInsert = ReEdiTabBeforeEdit
    BeforeEdit = ReEdiTabBeforeEdit
    BeforePost = ReEdiTabBeforePost
    AfterPost = ReEdiTabAfterPost
    BeforeDelete = ReEdiTabBeforeDelete
    OnNewRecord = ReEdiTabNewRecord
    SQL.Strings = (
      'select * FROM JOURNAL'
      'where QUELLE=:QUELLE and QUELLE_SUB<>2'
      'order by VRENUM'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    Left = 448
    Top = 216
    ParamData = <    
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    object ReEdiTabQUELLE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ReEdiTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabQUELLE_SUB: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE_SUB'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ReEdiTabATRNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabVRENUM: TZIntegerField
      Alignment = taCenter
      DisplayLabel = 'int. Nr.'
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '"EDI-"0000'
    end
    object ReEdiTabVLSNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabFOLGENR: TZIntegerField
      FieldKind = fkData
      FieldName = 'FOLGENR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKM_STAND: TZIntegerField
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',#0;-;-'
    end
    object ReEdiTabKFZ_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KFZ_ID'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabVERTRETER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'VERTRETER_ID'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;-'
    end
    object ReEdiTabGLOBRABATT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GLOBRABATT'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0.0%'
    end
    object ReEdiTabADATUM: TZDateField
      FieldKind = fkData
      FieldName = 'ADATUM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabLDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'LDATUM'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabWV_DATUM: TZDateField
      FieldKind = fkData
      FieldName = 'Termin'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabPR_EBENE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'PR_EBENE'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKOST_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'KOST_NETTO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabWERT_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'WERT_NETTO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabLOHN: TZDoubleField
      FieldKind = fkData
      FieldName = 'LOHN'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabWARE: TZDoubleField
      FieldKind = fkData
      FieldName = 'WARE'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabTKOST: TZDoubleField
      FieldKind = fkData
      FieldName = 'TKOST'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMSUMME_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 25
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
      Index = 26
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
      Index = 27
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
      Index = 28
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
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabBSUMME: TZDoubleField
      DisplayLabel = 'Brutto'
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 30
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
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabATMSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'ATMSUMME'
      Index = 32
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
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_STAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_STAGE'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditFormat = '0'
    end
    object ReEdiTabSOLL_SKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_SKONTO'
      Index = 35
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
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      EditFormat = '0'
    end
    object ReEdiTabSOLL_RATEN: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_RATEN'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATBETR: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_RATBETR'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATINTERVALL: TZIntegerField
      FieldKind = fkData
      FieldName = 'SOLL_RATINTERVALL'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSTADIUM: TZSmallIntField
      DisplayLabel = 'ST'
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSTADIUM_STR: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'STADIUM_STR'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ReEdiTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 42
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
      Index = 43
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
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 47
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
      Index = 48
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
      Index = 49
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
      Index = 50
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
      Index = 51
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
      Index = 52
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
      Index = 53
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
      Index = 54
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
      Index = 55
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 80
    end
    object ReEdiTabPROJEKT: TZRawStringField
      DisplayLabel = 'Projekt / Beschreibung'
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 56
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ReEdiTabORGNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 57
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabBEST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'BEST_NAME'
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 40
    end
    object ReEdiTabBEST_CODE: TZShortIntField
      FieldKind = fkData
      FieldName = 'BEST_CODE'
      Index = 59
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabBEST_DATUM: TZDateField
      FieldKind = fkData
      FieldName = 'BEST_DATUM'
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 61
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
      Index = 62
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '0'
    end
    object ReEdiTabZAHLART: TZSmallIntField
      FieldKind = fkData
      FieldName = 'ZAHLART'
      Index = 63
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '0'
    end
    object ReEdiTabNSUMME: TZDoubleField
      DisplayLabel = 'Gesamt (netto)'
      DisplayWidth = 9
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 64
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00'
      Currency = True
    end
    object ReEdiTabWAEHRUNG: TZRawStringField
      DisplayLabel = 'WA'
      DisplayWidth = 3
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 65
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object ReEdiTabRDATUM: TZDateField
      DisplayLabel = 'le.Änderung'
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 66
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabWV_DatumStr: TStringField
      DisplayLabel = 'Termin'
      FieldKind = fkCalculated
      FieldName = 'WV_Datum-Str'
      Index = 67
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object ReEdiTabBRUTTO_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 68
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object ReEdiTabMWST_FREI_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
      Index = 69
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object ReEdiTabSHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 70
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabSHOP_ORDERID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_ORDERID'
      Index = 71
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabSHOP_STATUS: TZWordField
      FieldKind = fkData
      FieldName = 'SHOP_STATUS'
      Index = 72
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabSHOP_CHANGE_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'SHOP_CHANGE_FLAG'
      Index = 73
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object ReEdiTabLIEF_ADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'LIEF_ADDR_ID'
      Index = 74
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabPROVIS_WERT: TZDoubleField
      FieldKind = fkData
      FieldName = 'PROVIS_WERT'
      Index = 75
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabZAHLART_STR: TStringField
      DisplayLabel = 'Zahlart'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAHLART_STR'
      Index = 76
      KeyFields = 'ZAHLART'
      LookupCache = False
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'LANGBEZ'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ReEdiTabLIEFART_STR: TStringField
      DisplayLabel = 'Versandart'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'LIEFART_STR'
      Index = 77
      KeyFields = 'LIEFART'
      LookupCache = False
      LookupDataSet = DM1.LiefArtTab
      LookupKeyFields = 'LIEF_ID'
      LookupResultField = 'LANGBEZ'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ReEdiTabGEWICHT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 78
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.000" Kg";-,#0.000" Kg";-'
    end
    object ReEdiTabROHGEWINN: TZDoubleField
      FieldKind = fkData
      FieldName = 'ROHGEWINN'
      Index = 79
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object ReEdiTabCALC_SHOPSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_SHOPSTATUS'
      Index = 80
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
  object ReKFZTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ReKFZTabAfterScroll
    AfterScroll = ReKFZTabAfterScroll
    AfterPost = ReKFZTabAfterScroll
    SQL.Strings = (
      'select KFZ_ID,ADDR_ID,FGST_NUM,POL_KENNZ,SCHL_ZU_2,SCHL_ZU_3,KM_STAND,'
      'ZULASSUNG,LE_BESUCH,NAE_TUEV,NAE_AU from KFZ'
      'where KFZ_ID=:KID or ADDR_ID=:AID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'KID'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    Left = 560
    Top = 176
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'KID'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end>
    object ReKFZTabKFZ_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KFZ_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReKFZTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReKFZTabFGST_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'FGST_NUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReKFZTabPOL_KENNZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'POL_KENNZ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 10
    end
    object ReKFZTabSCHL_ZU_2: TZRawStringField
      FieldKind = fkData
      FieldName = 'SCHL_ZU_2'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReKFZTabSCHL_ZU_3: TZRawStringField
      FieldKind = fkData
      FieldName = 'SCHL_ZU_3'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReKFZTabKM_STAND: TZIntegerField
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0;-;-'
    end
    object ReKFZTabZULASSUNG: TZDateField
      FieldKind = fkData
      FieldName = 'ZULASSUNG'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ReKFZTabLE_BESUCH: TZDateField
      FieldKind = fkData
      FieldName = 'LE_BESUCH'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ReKFZTabNAE_TUEV: TZDateField
      FieldKind = fkData
      FieldName = 'NAE_TUEV'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ReKFZTabNAE_AU: TZDateField
      FieldKind = fkData
      FieldName = 'NAE_AU'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
  end
  object SNTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL_SERNUM'
    )
    Params = <>
    Left = 448
    Top = 176
    object SNTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object SNTabSERNUMMER: TZRawStringField
      FieldKind = fkData
      FieldName = 'SERNUMMER'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object SNTabVERK_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VERK_NUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object SNTabLIEF_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'LIEF_NUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object SNTabVK_JOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'VK_JOURNAL_ID'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object SNTabVK_JOURNALPOS_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'VK_JOURNALPOS_ID'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object SNTabLS_JOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'LS_JOURNAL_ID'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object SNTabLS_JOURNALPOS_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'LS_JOURNALPOS_ID'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object STListTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select ARS.*,  A.ARTNUM, A.MATCHCODE, A.BARCODE, A.KURZNAME, A.EK_PREIS, A.MENGE_AKT'
      'from ARTIKEL_STUECKLIST ARS, ARTIKEL A'
      'where ARS.REC_ID=:ID and A.REC_ID=ARS.ART_ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 192
    Top = 472
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object STListTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object STListTabART_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ART_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
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
      Visible = False
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
      Visible = False
    end
    object STListTabGEAEND: TZDateField
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
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
      Visible = False
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
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'MENGE_AKT'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
  end
  object SNDS: TDataSource
    DataSet = SNTab
    Left = 496
    Top = 176
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 496
    Top = 216
  end
  object ReKFZDS: TDataSource
    DataSet = ReKFZTab
    Left = 616
    Top = 176
  end
  object PosDS: TDataSource
    DataSet = PosTab
    OnDataChange = PosDSDataChange
    Left = 616
    Top = 216
  end
  object ArtPreisDS: TDataSource
    DataSet = ArtPreisTab
    Left = 116
    Top = 408
  end
  object LiefDS: TDataSource
    DataSet = LiefTab
    Left = 116
    Top = 472
  end
  object HisDS: TDataSource
    DataSet = HisTab
    Left = 240
    Top = 408
  end
  object STListDS: TDataSource
    DataSet = STListTab
    Left = 240
    Top = 472
  end
  object ArtikelPopupMenu: TPopupMenu
    Left = 448
    Top = 440
    object freierArtikel1: TMenuItem
      Caption = 'freien Artikel hinzufügen'
      OnClick = NeuFrArtBtnClick
    end
    object Text1: TMenuItem
      Caption = 'Text hinzufügen'
      OnClick = NeuKomBtnClick
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 536
    Top = 440
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object neuenBelegerstellen1: TMenuItem
        Caption = 'neuen Beleg erstellen'
        ImageIndex = 23
        ShortCut = 16429
        OnClick = New1BtnClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Adressezuweisen1: TMenuItem
        Caption = 'Adresse zuweisen'
        ImageIndex = 33
        ShortCut = 114
        OnClick = KuNrEditButtonClick
      end
      object Artikelhinzufgen1: TMenuItem
        Caption = 'Artikel hinzufügen'
        ImageIndex = 20
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
      object N2: TMenuItem
        Caption = '-'
      end
      object Kopieren1: TMenuItem
        Caption = 'Kopieren'
        ImageIndex = 14
        ShortCut = 16459
        OnClick = Kopieren1Click
      end
      object EKBestellungerstellen1: TMenuItem
        Caption = 'in EK-Bestellung umwandeln'
        ImageIndex = 14
        OnClick = EKBestellungerstellen1Click
      end
      object Storno1: TMenuItem
        Caption = 'Beleg löschen'
        ImageIndex = 19
        ShortCut = 8238
        OnClick = Del1BtnClick
      end
      object Positionlschen1: TMenuItem
        Caption = 'Position löschen'
        ImageIndex = 6
        ShortCut = 16430
        OnClick = PosDelBtn1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Teillieferung1: TMenuItem
        Caption = 'Teillieferung'
        ImageIndex = 18
        ShortCut = 32852
        OnClick = TeillieferungBtnClick
      end
      object Lieferscheinerstellen1: TMenuItem
        Caption = 'Lieferschein erstellen'
        ImageIndex = 18
        ShortCut = 32844
        OnClick = LieferscheinBuchenBtnClick
      end
      object Speichernundbuchen1: TMenuItem
        Caption = 'Speichern und buchen'
        ImageIndex = 18
        ShortCut = 32848
        OnClick = BuchenBtnClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        OnClick = Suchen1Click
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
      Enabled = False
      GroupIndex = 3
      Visible = False
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object Auswahl1: TMenuItem
        Caption = 'Auswahl'
        Checked = True
        GroupIndex = 1
        RadioItem = True
        ShortCut = 117
        OnClick = GotoAuswahlBtnClick
      end
      object Allgemein1: TMenuItem
        Caption = 'Allgemein'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 118
        OnClick = GotoAllgBtnClick
      end
      object Positionen1: TMenuItem
        Caption = 'Positionen'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 119
        OnClick = GotoPosBtnClick
      end
      object PosDetails1: TMenuItem
        Caption = 'Pos.-Details'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 122
        OnClick = PosDetailBtnClick
      end
      object Fertigstellen1: TMenuItem
        Caption = 'Fertigstellen'
        GroupIndex = 1
        ShortCut = 123
        OnClick = GotoFertigBtnClick
      end
      object N6: TMenuItem
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
      object AtrisImport1: TMenuItem
        Caption = 'Atris-Import'
        ImageIndex = 22
        ShortCut = 32887
      end
      object PossortierennachArtikelnummer1: TMenuItem
        Caption = 'Pos. sortieren nach Artikelnummer'
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object UmschaltungBruttoNetto1: TMenuItem
        Caption = 'Umschaltung Brutto<-->Netto'
        ShortCut = 16469
      end
    end
  end
end
