object KFZForm: TKFZForm
  Left = 373
  Height = 540
  Top = 256
  Width = 658
  Caption = 'KFZ-Stammdaten'
  ClientHeight = 520
  ClientWidth = 658
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  Menu = MainMenu1
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object SB1: TStatusBar
    Left = 0
    Height = 23
    Top = 497
    Width = 658
    Panels = <    
      item
        Alignment = taCenter
        Text = 'Suchzeit'
        Width = 80
      end    
      item
        Alignment = taCenter
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
        Text = 'geändert'
        Width = 120
      end    
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object KFZPanel: TPanel
    Left = 0
    Height = 497
    Top = 0
    Width = 658
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 497
    ClientWidth = 658
    Color = clInfoBk
    ParentColor = False
    TabOrder = 1
    object KFZToolBar: TToolBar
      Left = 0
      Height = 22
      Top = 475
      Width = 658
      Align = alBottom
      AutoSize = True
      ButtonHeight = 22
      ButtonWidth = 88
      Caption = 'KFZToolBar'
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
      object DBNavigator2: TDBNavigator
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
        ConfirmDelete = False
        DataSource = KFZ_DS
        Flat = True
        Options = []
        TabOrder = 0
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
      end
      object Label52: TLabel
        Left = 241
        Height = 22
        Top = 0
        Width = 56
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchfeld'
        Layout = tlCenter
        ParentColor = False
      end
      object SuchFeldCB: TComboBox
        Left = 297
        Height = 21
        Top = 0
        Width = 100
        AutoComplete = True
        AutoCompleteText = [cbactEnabled, cbactEndOfLineComplete, cbactSearchAscending]
        Color = clWindow
        ItemHeight = 13
        Items.Strings = (
          'Kennzeichen'
          'Fahrgestell-Nr.'
          'Kunden-Nr.'
        )
        OnChange = SuchbegChange
        Style = csDropDownList
        TabOrder = 2
      end
      object Label31: TLabel
        Left = 397
        Height = 22
        Top = 0
        Width = 67
        Alignment = taCenter
        AutoSize = False
        Caption = '&Suchbegriff'
        Layout = tlCenter
        ParentColor = False
      end
      object Suchbeg: TEdit
        Left = 464
        Height = 22
        Hint = 'Mehrere Suchbegriffe können Sie durch ein Leerzeichen trennen.'
        Top = 0
        Width = 96
        AutoSize = False
        Color = clWindow
        OnChange = SuchbegChange
        OnKeyPress = SuchbegKeyPress
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object ToolButton6: TToolButton
        Left = 560
        Height = 22
        Top = 0
        Caption = 'ToolButton6'
        Style = tbsSeparator
      end
      object UebernahmeBtn: TToolButton
        Left = 568
        Top = 0
        Caption = 'Ü&bernahme'
        ImageIndex = 22
        OnClick = UebernahmeBtnClick
        Visible = False
      end
    end
    object KFZPan: TPanel
      Left = 0
      Height = 26
      Top = 0
      Width = 658
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 22
      ClientWidth = 654
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object Label10: TLabel
        Left = 0
        Height = 22
        Top = 0
        Width = 81
        Align = alLeft
        Alignment = taRightJustify
        Caption = ' Fahrzeuge '
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object ListeTabBtn: TSpeedButton
        Tag = 4
        Left = 592
        Height = 22
        Top = 0
        Width = 56
        Caption = 'Liste'
        Flat = True
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AlgTabBtnClick
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        ParentFont = False
      end
      object HistTabBtn: TSpeedButton
        Tag = 3
        Left = 528
        Height = 22
        Top = 0
        Width = 60
        Caption = 'Historie'
        Flat = True
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AlgTabBtnClick
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        ParentFont = False
      end
      object InfoTabBtn: TSpeedButton
        Tag = 2
        Left = 448
        Height = 22
        Top = 0
        Width = 73
        Caption = 'Info'
        Flat = True
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AlgTabBtnClick
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        ParentFont = False
      end
      object AlgTabBtn: TSpeedButton
        Tag = 1
        Left = 376
        Height = 22
        Top = 0
        Width = 66
        Caption = 'Allgemein'
        Flat = True
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AlgTabBtnClick
        OnMouseEnter = AlgTabBtnMouseEnter
        OnMouseLeave = AlgTabBtnMouseLeave
        ParentFont = False
      end
    end
    object KFZ_PC: TPageControl
      Left = 0
      Height = 449
      Top = 26
      Width = 658
      ActivePage = Allg_TS
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      OnChange = KFZ_PCChange
      object Allg_TS: TTabSheet
        Caption = 'Allgemein'
        ClientHeight = 420
        ClientWidth = 650
        ImageIndex = 0
        object Panel1: TPanel
          Left = 0
          Height = 420
          Top = 0
          Width = 282
          Align = alLeft
          BevelOuter = bvNone
          ClientHeight = 420
          ClientWidth = 282
          TabOrder = 0
          object SuchGB: TGroupBox
            Left = 0
            Height = 88
            Top = 0
            Width = 282
            Align = alTop
            Caption = 'Suchbegriffe'
            ClientHeight = 70
            ClientWidth = 278
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object kennz: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 0
              Width = 208
              DataField = 'POL_KENNZ'
              DataSource = KFZ_DS
              AutoSelect = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object fgstnum: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 24
              Width = 208
              DataField = 'FGST_NUM'
              DataSource = KFZ_DS
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Label3: TLabel
              Left = 8
              Height = 13
              Top = 4
              Width = 56
              AutoSize = False
              Caption = 'Kennz.:'
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
              Width = 56
              AutoSize = False
              Caption = 'FGST-Nr.:'
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
              Top = 52
              Width = 56
              AutoSize = False
              Caption = '&Gruppe:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Gruppe: TVolgaDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 48
              Width = 208
              AutoDropDown = True
              ButtonWidth = 17
              Color = clWindow
              ComboProps.ComboItems.Strings = (
                'Neuwagen'
                'Gebrauchtwagen'
                'Kundenfahrzeug'
                'Traktoren'
                'Landmaschinen'
              )
              ComboProps.ComboValues.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
              )
              DataField = 'GRUPPE'
              DataSource = KFZ_DS
              DialogStyle = vdsCombo
              MaxLength = 0
              Style = vcsDropDownList
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
          end
          object AlgGB: TGroupBox
            Left = 0
            Height = 216
            Top = 88
            Width = 282
            Align = alTop
            Caption = 'Allgemein'
            ClientHeight = 198
            ClientWidth = 278
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Typ: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 0
              Width = 208
              DataField = 'TYP'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object ausfuehr: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 24
              Width = 208
              DataField = 'AUSFUER'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object motor: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 48
              Width = 208
              DataField = 'MOTOR'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object MotorNr: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 72
              Width = 208
              DataField = 'MOTOR_NR'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object getriebe: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 120
              Width = 208
              DataField = 'GETRIEBE'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object farbe: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 96
              Width = 208
              DataField = 'FARBE'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object kw: TDBEdit
              Left = 64
              Height = 21
              Top = 168
              Width = 24
              DataField = 'KW'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
              OnChange = kwChange
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object ps: TDBEdit
              Left = 123
              Height = 21
              Top = 168
              Width = 21
              DataField = 'PS'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 8
              OnChange = psChange
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Hubraum: TDBEdit
              Tag = 1
              Left = 200
              Height = 21
              Top = 168
              Width = 72
              DataField = 'HUBRAUM'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 9
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object polster: TDBEdit
              Tag = 1
              Left = 64
              Height = 21
              Top = 144
              Width = 208
              DataField = 'POLSTER'
              DataSource = KFZ_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Label23: TLabel
              Left = 8
              Height = 13
              Top = 4
              Width = 56
              AutoSize = False
              Caption = 'Typ :'
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
              Top = 28
              Width = 56
              AutoSize = False
              Caption = 'Ausführ.:'
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
              Top = 52
              Width = 56
              AutoSize = False
              Caption = 'Motor :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label26: TLabel
              Left = 8
              Height = 13
              Top = 76
              Width = 56
              AutoSize = False
              Caption = 'Motor-Nr. :'
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
              Top = 100
              Width = 56
              AutoSize = False
              Caption = 'Getriebe :'
              FocusControl = getriebe
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
              Top = 124
              Width = 56
              AutoSize = False
              Caption = 'Farbe :'
              FocusControl = farbe
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
              Top = 148
              Width = 54
              AutoSize = False
              Caption = 'Polster :'
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
              Top = 172
              Width = 56
              AutoSize = False
              Caption = 'KW :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label1: TLabel
              Left = 88
              Height = 13
              Top = 168
              Width = 22
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'PS :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label25: TLabel
              Left = 144
              Height = 13
              Top = 168
              Width = 54
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Hubraum :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
          object GroupBox1: TGroupBox
            Left = 0
            Height = 116
            Top = 304
            Width = 282
            Align = alClient
            Caption = 'Kunde'
            ClientHeight = 98
            ClientWidth = 278
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object KundeEdit: TDBComboBox
              Tag = 1
              Left = 64
              Height = 21
              Top = 0
              Width = 208
              AutoSelect = False
              Color = clWindow
              DataField = 'NAME1'
              DataSource = KunDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ItemHeight = 13
              MaxLength = 0
              OnClick = KundeEditButtonClick
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit6: TDBEdit
              Left = 64
              Height = 21
              Top = 24
              Width = 18
              DataField = 'LAND'
              DataSource = KunDS
              ReadOnly = True
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object DBEdit7: TDBEdit
              Left = 83
              Height = 21
              Top = 24
              Width = 41
              DataField = 'PLZ'
              DataSource = KunDS
              ReadOnly = True
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object DBEdit8: TDBEdit
              Tag = 1
              Left = 125
              Height = 21
              Top = 24
              Width = 147
              DataField = 'ORT'
              DataSource = KunDS
              ReadOnly = True
              AutoSelect = False
              Color = clWindow
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Label33: TLabel
              Left = 8
              Height = 13
              Top = 4
              Width = 56
              AutoSize = False
              Caption = 'Name.:'
              FocusControl = kennz
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label34: TLabel
              Left = 8
              Height = 13
              Top = 28
              Width = 56
              AutoSize = False
              Caption = 'PLZ / Ort :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
        end
        object Panel2: TPanel
          Left = 282
          Height = 420
          Top = 0
          Width = 271
          Align = alLeft
          BevelOuter = bvNone
          ClientHeight = 420
          ClientWidth = 271
          TabOrder = 1
          object SchluesselGB: TGroupBox
            Left = 0
            Height = 140
            Top = 0
            Width = 271
            Align = alTop
            Caption = 'Schlüsselnummern'
            ClientHeight = 122
            ClientWidth = 267
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object schl2Edi: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 176
              DataField = 'SCHL_ZU_2'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object schl3Edi: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
              Width = 176
              DataField = 'SCHL_ZU_3'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object scl_nr: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 50
              Width = 176
              DataField = 'SCHLUES_NR'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object kfzbr_nr: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 72
              Width = 176
              DataField = 'KFZBRI_NR'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object zschl_nr: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 94
              Width = 176
              DataField = 'ZSCHL_NR'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Label27: TLabel
              Left = 8
              Height = 13
              Top = 4
              Width = 80
              AutoSize = False
              Caption = 'Schl.-Nr. zu 2. :'
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
              Width = 80
              AutoSize = False
              Caption = 'Schl.-Nr. zu 3.'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label11: TLabel
              Left = 8
              Height = 13
              Top = 52
              Width = 80
              AutoSize = False
              Caption = 'Schlüssel-Nr.:'
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
              Top = 76
              Width = 80
              AutoSize = False
              Caption = 'KFZ-Brief-Nr.:'
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
              Top = 100
              Width = 80
              AutoSize = False
              Caption = 'Z-Schlüssel-Nr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
          object ReifenGB: TGroupBox
            Left = 0
            Height = 67
            Top = 140
            Width = 271
            Align = alTop
            Caption = 'Reifen'
            ClientHeight = 49
            ClientWidth = 267
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Reifen: TDBEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = -4
              Width = 174
              DataField = 'REIFEN'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object ReifenGr: TDBEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 20
              Width = 174
              DataField = 'REIF_GR'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Label21: TLabel
              Left = 8
              Height = 13
              Top = 0
              Width = 80
              AutoSize = False
              Caption = 'Typ / Ausf. :'
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
              Top = 24
              Width = 80
              AutoSize = False
              Caption = 'Größe :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
          object BewDatGb: TGroupBox
            Left = 0
            Height = 213
            Top = 207
            Width = 271
            Align = alClient
            Caption = 'Bewegungsdaten'
            ClientHeight = 195
            ClientWidth = 267
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object baujahr: TDBEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 1
              Width = 174
              DataField = 'HERSTELLUNG'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object kmstand: TDBEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 48
              Width = 174
              DataField = 'KM_STAND'
              DataSource = KFZ_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
            end
            object Zulassungsdatum: TRxDBDateEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 24
              Width = 174
              AutoSelect = False
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
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
              DataField = 'ZULASSUNG'
              DataSource = KFZ_DS
            end
            object NextTUVEdi: TRxDBDateEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 72
              Width = 174
              AutoSelect = False
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
              TabOrder = 3
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
              DataField = 'NAE_TUEV'
              DataSource = KFZ_DS
            end
            object NextAUEdi: TRxDBDateEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 96
              Width = 174
              AutoSelect = False
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
              TabOrder = 4
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
              DataField = 'NAE_AU'
              DataSource = KFZ_DS
            end
            object NextSP: TRxDBDateEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 120
              Width = 174
              AutoSelect = False
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
              TabOrder = 5
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
              DataField = 'NAE_SP'
              DataSource = KFZ_DS
            end
            object NextTP: TRxDBDateEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 144
              Width = 174
              AutoSelect = False
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
              TabOrder = 6
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
              DataField = 'NAE_TP'
              DataSource = KFZ_DS
            end
            object LeBesuchEdi: TRxDBDateEdit
              Tag = 1
              Left = 90
              Height = 21
              Top = 168
              Width = 174
              AutoSelect = False
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
              TabOrder = 7
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = LeBesuchEdiEnter
              OnExit = LeBesuchEdiExit
              OnKeyDown = kennzKeyDown
              OnKeyPress = kennzKeyPress
              DataField = 'LE_BESUCH'
              DataSource = KFZ_DS
            end
            object Label30: TLabel
              Left = 8
              Height = 13
              Top = 5
              Width = 80
              AutoSize = False
              Caption = 'Baujahr :'
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
              Top = 29
              Width = 80
              AutoSize = False
              Caption = 'Tag d. Erstzul. :'
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
              Top = 53
              Width = 80
              AutoSize = False
              Caption = 'KM-Stand :'
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
              Top = 76
              Width = 80
              AutoSize = False
              Caption = 'nächster TÜV :'
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
              Top = 101
              Width = 80
              AutoSize = False
              Caption = 'nächste AU :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label35: TLabel
              Left = 8
              Height = 13
              Top = 125
              Width = 80
              AutoSize = False
              Caption = 'nächste SP :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label36: TLabel
              Left = 8
              Height = 13
              Top = 148
              Width = 80
              AutoSize = False
              Caption = 'nächste TP :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label19: TLabel
              Left = 8
              Height = 13
              Top = 172
              Width = 80
              AutoSize = False
              Caption = 'letzter Besuch :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
        end
        object CaoGroupBox5: TGroupBox
          Left = 553
          Height = 420
          Top = 0
          Width = 97
          Align = alClient
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
        end
      end
      object Notiz_TS: TTabSheet
        Caption = 'Notizen'
        ClientHeight = 420
        ClientWidth = 650
        ImageIndex = 3
        object CaoGroupBox1: TGroupBox
          Left = 0
          Height = 68
          Top = 0
          Width = 650
          Align = alTop
          Caption = 'Suchbegriffe'
          ClientHeight = 50
          ClientWidth = 646
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object DBEdit1: TDBEdit
            Tag = 1
            Left = 64
            Height = 21
            Top = 0
            Width = 576
            DataField = 'POL_KENNZ'
            DataSource = KFZ_DS
            AutoSelect = False
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            MaxLength = 0
            ParentFont = False
            TabOrder = 0
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
          object DBEdit2: TDBEdit
            Tag = 1
            Left = 64
            Height = 21
            Top = 24
            Width = 576
            DataField = 'FGST_NUM'
            DataSource = KFZ_DS
            AutoSelect = False
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            MaxLength = 0
            ParentFont = False
            TabOrder = 1
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
          object Label18: TLabel
            Left = 5
            Height = 13
            Top = 4
            Width = 59
            AutoSize = False
            Caption = 'Kennz.:'
            FocusControl = DBEdit1
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ParentColor = False
            ParentFont = False
          end
          object Label20: TLabel
            Left = 5
            Height = 13
            Top = 28
            Width = 59
            AutoSize = False
            Caption = 'FGST-Nr.:'
            FocusControl = DBEdit2
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ParentColor = False
            ParentFont = False
          end
        end
        object CaoGroupBox3: TGroupBox
          Left = 0
          Height = 352
          Top = 68
          Width = 650
          Align = alClient
          Caption = 'Info'
          ClientHeight = 334
          ClientWidth = 646
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object AddrNotiz: TDBMemo
            Left = 0
            Height = 334
            Hint = 'Zeilenumbruch mit Strg+Enter'
            Top = 0
            Width = 646
            Align = alClient
            DataField = 'INFO'
            DataSource = KFZ_DS
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object Hist_TS: TTabSheet
        Caption = 'Historie'
        ClientHeight = 420
        ClientWidth = 650
        ImageIndex = 6
        object CaoGroupBox2: TGroupBox
          Left = 0
          Height = 68
          Top = 0
          Width = 650
          Align = alTop
          Caption = 'Suchbegriffe'
          ClientHeight = 50
          ClientWidth = 646
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object DBEdit3: TDBEdit
            Tag = 1
            Left = 64
            Height = 21
            Top = 0
            Width = 576
            DataField = 'POL_KENNZ'
            DataSource = KFZ_DS
            Anchors = [akTop, akLeft, akRight]
            AutoSize = False
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            MaxLength = 0
            ParentFont = False
            TabOrder = 0
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
          object DBEdit4: TDBEdit
            Tag = 1
            Left = 64
            Height = 21
            Top = 24
            Width = 576
            DataField = 'FGST_NUM'
            DataSource = KFZ_DS
            Anchors = [akTop, akLeft, akRight]
            AutoSize = False
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            MaxLength = 0
            ParentFont = False
            TabOrder = 1
            OnEnter = LeBesuchEdiEnter
            OnExit = LeBesuchEdiExit
            OnKeyDown = kennzKeyDown
            OnKeyPress = kennzKeyPress
          end
          object Label24: TLabel
            Left = 8
            Height = 13
            Top = 4
            Width = 56
            AutoSize = False
            Caption = 'Kennz.:'
            FocusControl = DBEdit3
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
            Top = 28
            Width = 56
            AutoSize = False
            Caption = 'FGST-Nr.:'
            FocusControl = DBEdit4
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ParentColor = False
            ParentFont = False
          end
        end
        object Panel8: TPanel
          Left = 0
          Height = 30
          Top = 68
          Width = 650
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 3
          ClientHeight = 30
          ClientWidth = 650
          TabOrder = 1
          object ToolBar99: TToolBar
            Left = 3
            Height = 24
            Top = 3
            Width = 644
            Align = alClient
            BorderWidth = 1
            Caption = 'ToolBar99'
            Color = clBtnFace
            EdgeBorders = []
            ParentColor = False
            TabOrder = 0
            object Label60: TLabel
              Left = 1
              Height = 22
              Top = 0
              Width = 39
              Alignment = taRightJustify
              AutoSize = False
              Caption = '&Jahr : '
              Layout = tlCenter
              ParentColor = False
            end
            object JahrCB: TComboBox
              Left = 40
              Height = 21
              Top = 0
              Width = 98
              Color = clWindow
              ItemHeight = 13
              Style = csDropDownList
              TabOrder = 0
            end
            object ToolButton5: TToolButton
              Left = 138
              Height = 8
              Top = 0
              Caption = 'ToolButton5'
              Style = tbsSeparator
            end
            object OPOSViewBtn: TSpeedButton
              Left = 146
              Height = 22
              Top = 0
              Width = 65
              AllowAllUp = True
              Caption = 'OPOS'
              GroupIndex = 100
            end
            object ToolButton1: TToolButton
              Left = 211
              Height = 8
              Top = 0
              Caption = 'ToolButton1'
              Style = tbsSeparator
            end
            object ArtikelViewBtn: TSpeedButton
              Left = 219
              Height = 22
              Top = 0
              Width = 65
              AllowAllUp = True
              Caption = 'Artikel'
            end
          end
        end
        object CaoGroupBox6: TGroupBox
          Left = 0
          Height = 276
          Top = 98
          Width = 650
          Align = alClient
          Caption = 'Liste'
          ClientHeight = 258
          ClientWidth = 646
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object JourPosGrid: TDBGrid
            Left = 0
            Height = 120
            Top = 138
            Width = 646
            Align = alBottom
            BorderStyle = bsNone
            Color = clWindow
            Columns = <            
              item
                Title.Caption = 'Art.-Nr.'
                Width = 101
                FieldName = 'ARTNUM'
              end            
              item
                Title.Caption = 'BEZEICHNUNG'
                Width = 195
                FieldName = 'BEZEICHNUNG'
              end            
              item
                Alignment = taRightJustify
                Title.Caption = 'Menge'
                Width = 43
                FieldName = 'MENGE'
              end            
              item
                Alignment = taRightJustify
                Title.Caption = 'E-Preis'
                Width = 81
                FieldName = 'EPREIS'
              end            
              item
                Alignment = taRightJustify
                Title.Caption = 'Rabatt'
                Width = 41
                FieldName = 'RABATT'
              end            
              item
                Alignment = taRightJustify
                Title.Caption = 'MwSt'
                Width = 36
                FieldName = 'STEUER_PROZ'
              end>
            DataSource = JPosTabDS
            DefaultRowHeight = 30
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
          end
          object RxSplitter1: TSplitter
            Cursor = crVSplit
            Left = 0
            Height = 5
            Top = 133
            Width = 646
            Align = alBottom
            ResizeAnchor = akBottom
          end
          object JournalGrid: TDBGrid
            Left = 0
            Height = 133
            Top = 0
            Width = 646
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
                Alignment = taRightJustify
                Title.Caption = 'Netto'
                Width = 80
                FieldName = 'NSUMME'
              end            
              item
                Alignment = taRightJustify
                Title.Caption = 'MwSt'
                Width = 76
                FieldName = 'MSUMME'
              end            
              item
                Alignment = taRightJustify
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
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ParentFont = False
            TabOrder = 2
          end
        end
        object HistArtikelSB: TStatusBar
          Left = 0
          Height = 23
          Top = 397
          Width = 650
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
        object HistSumBar: TStatusBar
          Left = 0
          Height = 23
          Top = 374
          Width = 650
          Panels = <          
            item
              Bevel = pbNone
              Text = 'OFFEN'
              Width = 40
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Bevel = pbNone
              Text = 'BEZAHLT'
              Width = 55
            end          
            item
              Alignment = taRightJustify
              Text = '0,00 DM'
              Width = 100
            end          
            item
              Bevel = pbNone
              Text = 'GESAMT'
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
          UseSystemFont = False
        end
      end
      object List_TS: TTabSheet
        Caption = 'Liste'
        ClientHeight = 420
        ClientWidth = 650
        object KFZ_GRD: TDBGrid
          Left = 0
          Height = 420
          Top = 0
          Width = 650
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Kennzeichen'
              Width = 70
              FieldName = 'POL_KENNZ'
            end          
            item
              Title.Caption = 'Fahrgestell-Nr.'
              Width = 129
              FieldName = 'FGST_NUM'
            end          
            item
              Title.Caption = 'Baujahr'
              Width = 45
              FieldName = 'HERSTELLUNG'
            end          
            item
              Title.Caption = 'Hubraum'
              FieldName = 'HUBRAUM'
            end          
            item
              Title.Caption = 'KW'
              Width = 26
              FieldName = 'KW'
            end          
            item
              Title.Caption = 'PS'
              Width = 25
              FieldName = 'PS'
            end          
            item
              Title.Caption = 'KM-Stand'
              Width = 53
              FieldName = 'KM_STAND'
            end          
            item
              Title.Caption = 'Schl.-Nr. zu 2.'
              Width = 100
              FieldName = 'SCHL_ZU_2'
            end          
            item
              Title.Caption = 'Schl.-Nr. zu 3.'
              Width = 100
              FieldName = 'SCHL_ZU_3'
            end          
            item
              Title.Caption = 'KFZ-Brief'
              Width = 94
              FieldName = 'KFZBRI_NR'
            end          
            item
              Title.Caption = 'Zulassungstag'
              Width = 62
              FieldName = 'ZULASSUNG'
            end          
            item
              Title.Caption = 'le. Besuch'
              Width = 71
              FieldName = 'LE_BESUCH'
            end          
            item
              Title.Caption = 'nä. TÜV'
              FieldName = 'NAE_TUEV'
            end          
            item
              Title.Caption = 'nä. AU'
              FieldName = 'NAE_AU'
            end          
            item
              Title.Caption = 'Umsatz ges.'
              FieldName = 'UMSATZ_GES'
            end          
            item
              Title.Caption = 'Umsatz Gar.'
              FieldName = 'UMSATZ_GAR'
            end>
          DataSource = KFZ_DS
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines]
          TabOrder = 0
          OnTitleClick = KFZ_GRDTitleClick
        end
      end
    end
  end
  object KunDS: TDataSource
    DataSet = KunTab
    Left = 174
    Top = 91
  end
  object KFZ_DS: TDataSource
    DataSet = KFZTab
    OnDataChange = KFZ_DSDataChange
    Left = 174
    Top = 152
  end
  object JourTabDS: TDataSource
    DataSet = JourTab
    Left = 192
    Top = 216
  end
  object JPosTabDS: TDataSource
    DataSet = JPosTab
    Left = 174
    Top = 280
  end
  object KunTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * '
      'from ADRESSEN'
      'where REC_ID=:ADDR_ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ADDR_ID'
        ParamType = ptInput
      end>
    DataSource = KFZ_DS
    Options = [doPreferPrepared]
    Left = 111
    Top = 91
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ADDR_ID'
        ParamType = ptInput
      end>
  end
  object KFZTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = KFZTabAfterScroll
    AfterScroll = KFZTabAfterScroll
    AfterPost = KFZTabAfterScroll
    BeforeDelete = KFZTabBeforeDelete
    AfterDelete = KFZTabAfterScroll
    SQL.Strings = (
      'select * from KFZ'
    )
    Params = <>
    Left = 111
    Top = 152
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
      Required = True
    end
    object KFZTabKFZ_GRUPPE: TZShortIntField
      FieldKind = fkData
      FieldName = 'KFZ_GRUPPE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabPOL_KENNZ: TZRawStringField
      DisplayLabel = 'Kennzeichen'
      FieldKind = fkData
      FieldName = 'POL_KENNZ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 10
    end
    object KFZTabFGST_NUM: TZRawStringField
      DisplayLabel = 'Fahrgest.-Nr.'
      DisplayWidth = 20
      FieldKind = fkData
      FieldName = 'FGST_NUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KFZTabTYP_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'TYP_ID'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabTYP: TZRawStringField
      DisplayLabel = 'Typ'
      FieldKind = fkData
      FieldName = 'TYP'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabAUSFUER: TZRawStringField
      DisplayLabel = 'Ausführung'
      FieldKind = fkData
      FieldName = 'AUSFUER'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabART_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ART_ID'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabFABRIKAT_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'FABRIKAT_ID'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabKRAFTSTOFF_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KRAFTSTOFF_ID'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabGRUPPE: TZIntegerField
      DisplayLabel = 'Gruppe'
      FieldKind = fkData
      FieldName = 'GRUPPE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabSCHLUES_NR: TZRawStringField
      DisplayLabel = 'Schlüssel-Nr.'
      FieldKind = fkData
      FieldName = 'SCHLUES_NR'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabZSCHL_NR: TZRawStringField
      DisplayLabel = 'Zündschlüssel-Nr.'
      FieldKind = fkData
      FieldName = 'ZSCHL_NR'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabMOTOR_NR: TZRawStringField
      DisplayLabel = 'Motor-Nr.'
      FieldKind = fkData
      FieldName = 'MOTOR_NR'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabKFZBRI_NR: TZRawStringField
      DisplayLabel = 'KFZ-Brief'
      FieldKind = fkData
      FieldName = 'KFZBRI_NR'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object KFZTabMOTOR: TZRawStringField
      DisplayLabel = 'Motor'
      FieldKind = fkData
      FieldName = 'MOTOR'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object KFZTabGETRIEBE: TZRawStringField
      DisplayLabel = 'Getriebe'
      FieldKind = fkData
      FieldName = 'GETRIEBE'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabKW: TZIntegerField
      FieldKind = fkData
      FieldName = 'KW'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabPS: TZIntegerField
      FieldKind = fkData
      FieldName = 'PS'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabKM_STAND: TZIntegerField
      DisplayLabel = 'KM-Stand'
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0'
    end
    object KFZTabHUBRAUM: TZIntegerField
      DisplayLabel = 'Hubraum'
      FieldKind = fkData
      FieldName = 'HUBRAUM'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabREIFEN: TZRawStringField
      DisplayLabel = 'Reifen'
      FieldKind = fkData
      FieldName = 'REIFEN'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabREIF_GR: TZRawStringField
      DisplayLabel = 'Reifen-Größe'
      FieldKind = fkData
      FieldName = 'REIF_GR'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabFARBE: TZRawStringField
      DisplayLabel = 'Farbe'
      FieldKind = fkData
      FieldName = 'FARBE'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabPOLSTER: TZRawStringField
      DisplayLabel = 'Polster'
      FieldKind = fkData
      FieldName = 'POLSTER'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KFZTabZULASSUNG: TZDateField
      DisplayLabel = 'Zulassungstag'
      FieldKind = fkData
      FieldName = 'ZULASSUNG'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabHERSTELLUNG: TZDateField
      DisplayLabel = 'Baujahr'
      FieldKind = fkData
      FieldName = 'HERSTELLUNG'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'mm.yyyy'
      EditMask = '90/90/0000'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabKAUFDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'KAUFDATUM'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabLE_BESUCH: TZDateField
      DisplayLabel = 'le. Besuch'
      FieldKind = fkData
      FieldName = 'LE_BESUCH'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabNAE_TUEV: TZDateField
      DisplayLabel = 'nä. TÜV'
      FieldKind = fkData
      FieldName = 'NAE_TUEV'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabNAE_AU: TZDateField
      DisplayLabel = 'nä. AU'
      FieldKind = fkData
      FieldName = 'NAE_AU'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object KFZTabEK_PREIS: TZDoubleField
      FieldKind = fkData
      FieldName = 'EK_PREIS'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabRUESTK: TZDoubleField
      FieldKind = fkData
      FieldName = 'RUESTK'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabVK_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK_NETTO'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabMWST_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_PROZ'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabUMSATZ_GES: TZDoubleField
      DisplayLabel = 'Umsatz ges.'
      FieldKind = fkData
      FieldName = 'UMSATZ_GES'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabUMSATZ_GAR: TZDoubleField
      DisplayLabel = 'Umsatz Gar.'
      FieldKind = fkData
      FieldName = 'UMSATZ_GAR'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabSCHL_ZU_2: TZRawStringField
      FieldKind = fkData
      FieldName = 'SCHL_ZU_2'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabSCHL_ZU_3: TZRawStringField
      FieldKind = fkData
      FieldName = 'SCHL_ZU_3'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KFZTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object KFZTabNAE_SP: TZDateField
      FieldKind = fkData
      FieldName = 'NAE_SP'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KFZTabWKST_INFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'WKST_INFO'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object KFZTabNAE_TP: TZDateField
      FieldKind = fkData
      FieldName = 'NAE_TP'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
  end
  object JourTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = JourTabAfterOpen
    AfterScroll = JourTabAfterOpen
    OnCalcFields = JourTabCalcFields
    SQL.Strings = (
      'select KFZ_ID, REC_ID, QUELLE, VRENUM, RDATUM, KUN_NAME1, '
      'ADDR_ID, KFZ_ID, KM_STAND, NSUMME, MSUMME, BSUMME, '
      'IST_BETRAG, STADIUM, PROJEKT, ORGNUM, WAEHRUNG,'
      'MWST_0, MWST_1, MWST_2, MWST_3'
      'from JOURNAL'
      'where ADDR_ID=118 and JAHR=2000'
    )
    Params = <>
    Options = []
    Left = 72
    Top = 216
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
      Visible = False
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
    object JourTabRDATUM: TZDateField
      DisplayLabel = 'Datum'
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 4
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
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object JourTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JourTabKFZ_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KFZ_ID'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JourTabKM_STAND: TZIntegerField
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object JourTabNSUMME: TZDoubleField
      DisplayLabel = 'Netto'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabMSUMME: TZDoubleField
      DisplayLabel = 'MwSt'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 '
      Precision = 10
    end
    object JourTabBSUMME: TZDoubleField
      DisplayLabel = 'Brutto'
      DisplayWidth = 12
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00 '
    end
    object JourTabIST_BETRAG: TZDoubleField
      DisplayLabel = 'gezahlt'
      DisplayWidth = 14
      FieldKind = fkData
      FieldName = 'IST_BETRAG'
      Index = 12
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
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabPROJEKT: TZRawStringField
      DisplayWidth = 48
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object JourTabORGNUM: TZRawStringField
      DisplayLabel = 'Org.-Nummer'
      DisplayWidth = 14
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabWAEHRUNG: TZRawStringField
      DisplayLabel = 'W'
      DisplayWidth = 1
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 16
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
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object JourTabMWST_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabMWST_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabMWST_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object JourTabMWST_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object JPosTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JPosTabCalcFields
    SQL.Strings = (
      'select JOURNAL_ID, QUELLE, ARTIKEL_ID, ADDR_ID, VRENUM, '
      'BEZEICHNUNG, MATCHCODE, ARTNUM, BARCODE, MENGE,'
      'EPREIS, RABATT, STEUER_CODE'
      'from JOURNALPOS'
      'where JOURNAL_ID = 1000'
      'order by POSITION'
    )
    Params = <>
    Left = 112
    Top = 280
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
    object JPosTabMENGE: TZDoubleField
      DisplayLabel = 'Menge'
      FieldKind = fkData
      FieldName = 'MENGE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0;-,###,##0.0; '
      Precision = 10
    end
    object JPosTabEPREIS: TZDoubleField
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
    object JPosTabRABATT: TZDoubleField
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
    object JPosTabBEZEICHNUNG: TZRawCLobField
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
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select STADIUM, SUM(NSUMME), SUM(MSUMME), SUM(BSUMME), WAEHRUNG'
      'from JOURNAL'
      'where ADDR_ID=118 and JAHR>=2000 and JAHR<=2000'
      'group by STADIUM, WAEHRUNG'
    )
    Params = <>
    Options = [doPreferPrepared]
    Left = 111
    Top = 344
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = SearchTimerTimer
    Left = 240
    Top = 91
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 240
    Top = 152
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Neu1: TMenuItem
        Caption = '&Neu'
        GroupIndex = 2
        ImageIndex = 23
        ShortCut = 16462
      end
      object Lschen1: TMenuItem
        Caption = '&Löschen'
        GroupIndex = 2
        ImageIndex = 6
        ShortCut = 16430
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Suchen1: TMenuItem
        Caption = '&Suchen'
        GroupIndex = 2
        ImageIndex = 10
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
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      GroupIndex = 3
      object Match1: TMenuItem
        Tag = 1
        Caption = '&Kennzeichen'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = LiefNummer1Click
      end
      object Name11: TMenuItem
        Tag = 2
        Caption = '&Fahrgestellnummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = LiefNummer1Click
      end
      object PLZOrt1: TMenuItem
        Tag = 3
        Caption = '&Kundennummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = LiefNummer1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Allgemein1: TMenuItem
        Tag = 1
        Caption = 'Allgemein'
        Checked = True
        GroupIndex = 4
        RadioItem = True
        ShortCut = 117
        OnClick = AlgTabBtnClick
      end
      object Info1: TMenuItem
        Tag = 2
        Caption = 'Info'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32887
        OnClick = AlgTabBtnClick
      end
      object Historie1: TMenuItem
        Tag = 3
        Caption = 'Historie'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 32888
        OnClick = AlgTabBtnClick
      end
      object Liste1: TMenuItem
        Tag = 4
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        OnClick = AlgTabBtnClick
      end
      object N3: TMenuItem
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
      object N4: TMenuItem
        Caption = '-'
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        OnClick = Aktualisieren1Click
      end
    end
  end
end
