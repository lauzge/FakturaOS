object VertreterForm: TVertreterForm
  Left = 373
  Height = 508
  Top = 256
  Width = 717
  Caption = 'Vertreter'
  ClientHeight = 488
  ClientWidth = 717
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
  object MainPanel: TPanel
    Left = 0
    Height = 488
    Top = 0
    Width = 717
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 488
    ClientWidth = 717
    Color = clInfoBk
    ParentColor = False
    TabOrder = 0
    object KunToolbar: TToolBar
      Left = 0
      Height = 22
      Top = 466
      Width = 717
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 22
      ButtonWidth = 88
      Caption = 'NavToolbar'
      Color = clBtnFace
      EdgeBorders = []
      Images = MainForm.ImageList1
      Indent = 2
      List = True
      ParentColor = False
      ShowCaptions = True
      TabOrder = 1
      object DBNavigator3: TDBNavigator
        Left = 2
        Height = 22
        Top = 0
        Width = 192
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 22
        ClientWidth = 192
        DataSource = Vert_DS
        Flat = True
        Options = []
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
      end
      object Label35: TLabel
        Left = 194
        Height = 22
        Top = 0
        Width = 62
        Alignment = taCenter
        AutoSize = False
        Caption = 'Suchbegriff'
        Layout = tlCenter
        ParentColor = False
      end
      object SuchBeg: TEdit
        Left = 256
        Height = 22
        Hint = 'durch Eingabe des Jokerzeichens % vor dem Suchtext '
        Top = 0
        Width = 100
        AutoSize = False
        Color = clWindow
        Enabled = False
        OnChange = SuchBegChange
        OnKeyPress = SuchBegKeyPress
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object ToolButton6: TToolButton
        Left = 356
        Height = 22
        Top = 0
        Caption = 'ToolButton6'
        Style = tbsSeparator
      end
      object UebernahmeBtn: TToolButton
        Left = 364
        Top = 0
        AutoSize = True
        Caption = 'Über&nahme'
        ImageIndex = 22
        Visible = False
      end
    end
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 717
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 713
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object MainTopLab: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 84
        Align = alLeft
        Caption = ' Vertreter ... '
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object ListeBtn: TSpeedButton
        Tag = 4
        Left = 669
        Height = 22
        Top = 2
        Width = 49
        Caption = 'Liste'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = ListeBtnClick
        OnMouseEnter = ListeBtnMouseEnter
        OnMouseLeave = ListeBtnMouseLeave
        ParentFont = False
      end
      object Liste_Btn: TSpeedButton
        Tag = 4
        Left = 592
        Height = 22
        Top = 2
        Width = 73
        Caption = '_Liste'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Visible = False
        OnClick = ListeBtnClick
        OnMouseEnter = ListeBtnMouseEnter
        OnMouseLeave = ListeBtnMouseLeave
        ParentFont = False
      end
      object ProBtn: TSpeedButton
        Tag = 2
        Left = 528
        Height = 22
        Top = 2
        Width = 65
        Caption = 'Provision'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = ListeBtnClick
        OnMouseEnter = ListeBtnMouseEnter
        OnMouseLeave = ListeBtnMouseLeave
        ParentFont = False
      end
      object AllgBtn: TSpeedButton
        Tag = 1
        Left = 456
        Height = 22
        Top = 2
        Width = 68
        Caption = 'All&gemein'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        OnClick = ListeBtnClick
        OnMouseEnter = ListeBtnMouseEnter
        OnMouseLeave = ListeBtnMouseLeave
        ParentFont = False
      end
    end
    object Main_PC: TPageControl
      Left = 0
      Height = 439
      Top = 27
      Width = 717
      ActivePage = Allg_TS
      Align = alClient
      Style = tsFlatButtons
      TabIndex = 0
      TabOrder = 2
      OnChange = Main_PCChange
      object Allg_TS: TTabSheet
        Caption = 'Allgemein'
        ClientHeight = 410
        ClientWidth = 709
        object BemerkungGB: TGroupBox
          Left = 0
          Height = 266
          Top = 144
          Width = 709
          Align = alClient
          Caption = 'Bemerkung'
          ClientHeight = 248
          ClientWidth = 705
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object MaBemerkung: TDBMemo
            Left = 0
            Height = 248
            Top = 0
            Width = 705
            Align = alClient
            Color = clWindow
            DataField = 'BEMERKUNG'
            DataSource = Vert_DS
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            OnEnter = VeNumEdiEnter
            OnExit = VeNumEdiExit
            OnKeyDown = VeNumEdiKeyDown
            OnKeyPress = VeNumEdiKeyPress
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel1: TPanel
          Left = 0
          Height = 144
          Top = 0
          Width = 709
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 144
          ClientWidth = 709
          TabOrder = 1
          object AllgemeinGB: TGroupBox
            Left = 0
            Height = 144
            Top = 0
            Width = 358
            Align = alLeft
            Caption = 'Allgemein'
            ClientHeight = 126
            ClientWidth = 354
            Color = clBtnFace
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object VeNumEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 0
              Width = 257
              DataField = 'MA_NUMMER'
              DataSource = Vert_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeNameEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 24
              Width = 257
              DataField = 'NAME'
              DataSource = Vert_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeVNameEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 48
              Width = 257
              DataField = 'VNAME'
              DataSource = Vert_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeStrasseEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 72
              Width = 257
              DataField = 'STRASSE'
              DataSource = Vert_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VePLZEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 96
              Width = 56
              DataField = 'PLZ'
              DataSource = Vert_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeOrtEdi: TDBEdit
              Tag = 1
              Left = 152
              Height = 21
              Top = 96
              Width = 200
              DataField = 'ORT'
              DataSource = Vert_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object Label3: TLabel
              Left = 5
              Height = 13
              Top = 32
              Width = 88
              AutoSize = False
              Caption = 'Name :'
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
              Top = 56
              Width = 88
              AutoSize = False
              Caption = 'Vorname :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label5: TLabel
              Left = 5
              Height = 13
              Top = 80
              Width = 88
              AutoSize = False
              Caption = 'Straße :'
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
              Top = 104
              Width = 88
              AutoSize = False
              Caption = 'Wohnort :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label56: TLabel
              Left = 5
              Height = 13
              Top = 8
              Width = 88
              AutoSize = False
              Caption = 'Vertreter-Nr..:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
          end
          object Kommunikation: TGroupBox
            Left = 358
            Height = 144
            Top = 0
            Width = 351
            Align = alClient
            Caption = 'Kommunikation'
            ClientHeight = 126
            ClientWidth = 347
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object VeTelEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 0
              Width = 261
              DataField = 'TELEFON'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeFaxEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 24
              Width = 261
              DataField = 'FAX'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeFunkEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 48
              Width = 261
              DataField = 'FUNK'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object VeEmailEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 72
              Width = 261
              DataField = 'EMAIL'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object Label10: TLabel
              Left = 8
              Height = 13
              Top = 80
              Width = 73
              AutoSize = False
              Caption = 'eMail :'
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
              Top = 8
              Width = 73
              AutoSize = False
              Caption = 'Telefon :'
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
              Top = 32
              Width = 73
              AutoSize = False
              Caption = 'Telefax :'
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
              Top = 56
              Width = 73
              AutoSize = False
              Caption = 'Mobilfunk :'
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
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ClientHeight = 410
        ClientWidth = 709
        object Panel2: TPanel
          Left = 0
          Height = 190
          Top = 0
          Width = 709
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 190
          ClientWidth = 709
          TabOrder = 0
          object CaoGroupBox1: TGroupBox
            Left = 0
            Height = 190
            Top = 0
            Width = 357
            Align = alLeft
            Caption = 'Provision'
            ClientHeight = 172
            ClientWidth = 353
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object ProvArtEdi: TDBEdit
              Left = 132
              Height = 21
              Top = 0
              Width = 217
              DataField = 'PROVISIONSART'
              DataSource = Vert_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object Label1: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 120
              AutoSize = False
              Caption = 'Provisionsart.: A/U/K'
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
              Top = 28
              Width = 120
              AutoSize = False
              Caption = 'Abrechnungszeitpunkt :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label11: TLabel
              Left = 5
              Height = 13
              Top = 52
              Width = 120
              AutoSize = False
              Caption = 'Provision mit Transport :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label12: TLabel
              Left = 5
              Height = 13
              Top = 76
              Width = 120
              AutoSize = False
              Caption = 'Provisions Satz :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label13: TLabel
              Left = 5
              Height = 13
              Top = 100
              Width = 120
              AutoSize = False
              Caption = 'Letzte Abrechnung :'
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
              Top = 124
              Width = 120
              AutoSize = False
              Caption = 'Umsatz :'
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
              Top = 148
              Width = 120
              AutoSize = False
              Caption = 'Erzielte Provision :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object DBEdit2: TDBEdit
              Left = 132
              Height = 21
              Top = 24
              Width = 217
              DataField = 'ABRECHNUNGSZEITPUNKT'
              DataSource = Vert_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit3: TDBEdit
              Left = 132
              Height = 21
              Top = 48
              Width = 217
              DataField = 'PROVISIONMITTRANSPORT'
              DataSource = Vert_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit4: TDBEdit
              Left = 132
              Height = 21
              Top = 72
              Width = 217
              DataField = 'PROVISIONSATZ'
              DataSource = Vert_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit5: TDBEdit
              Left = 132
              Height = 21
              Top = 96
              Width = 217
              DataField = 'LETZTEABRECHNUNG'
              DataSource = Vert_DS
              Enabled = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit6: TDBEdit
              Left = 132
              Height = 21
              Top = 120
              Width = 217
              DataField = 'UMSATZ'
              DataSource = Vert_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object DBEdit7: TDBEdit
              Left = 132
              Height = 21
              Top = 144
              Width = 217
              DataField = 'PROVISION'
              DataSource = Vert_DS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
          end
          object BankGB: TGroupBox
            Left = 357
            Height = 190
            Top = 0
            Width = 352
            Align = alClient
            Caption = 'Bankverbindung'
            ClientHeight = 172
            ClientWidth = 348
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
              Top = 4
              Width = 81
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
              Top = 28
              Width = 81
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
              Top = 52
              Width = 81
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
              Top = 76
              Width = 81
              AutoSize = False
              Caption = 'Name der Bank:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object KontoInhEdi: TDBEdit
              Left = 86
              Height = 21
              Top = 0
              Width = 257
              DataField = 'NAME'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object KontoEdi: TDBEdit
              Left = 86
              Height = 21
              Top = 24
              Width = 257
              DataField = 'KTO'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              DoubleBuffered = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 1
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object BlZEdi: TDBEdit
              Left = 86
              Height = 21
              Top = 48
              Width = 234
              DataField = 'BLZ'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object BankNameEdi: TDBEdit
              Left = 86
              Height = 21
              Top = 72
              Width = 257
              DataField = 'BANK'
              DataSource = Vert_DS
              Anchors = [akTop, akLeft, akRight]
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = VeNumEdiEnter
              OnExit = VeNumEdiExit
              OnKeyDown = VeNumEdiKeyDown
              OnKeyPress = VeNumEdiKeyPress
            end
            object BlZEdiBtn: TSpeedButton
              Left = 320
              Height = 23
              Top = 47
              Width = 24
              Anchors = [akTop, akRight]
              Caption = '...'
              OnClick = BlZEdiButtonClick
            end
          end
        end
        object CaoGroupBox2: TGroupBox
          Left = 0
          Height = 220
          Top = 190
          Width = 709
          Align = alClient
          Color = 14680063
          ParentColor = False
          TabOrder = 1
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
      end
      object Such_TS: TTabSheet
        Caption = 'Such_TS'
        ClientHeight = 407
        ClientWidth = 709
        object SuchGrid: TDBGrid
          Left = 0
          Height = 407
          Top = 0
          Width = 709
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Nummer'
              Width = 64
              FieldName = 'VERTR_NUMMER'
            end          
            item
              Title.Caption = 'Name'
              Width = 100
              FieldName = 'NAME'
            end          
            item
              Title.Caption = 'Vorname'
              Width = 100
              FieldName = 'VNAME'
            end          
            item
              Title.Caption = 'Straße'
              Width = 100
              FieldName = 'STRASSE'
            end          
            item
              Title.Caption = 'Land'
              Width = 34
              FieldName = 'LAND'
            end          
            item
              Title.Caption = 'PLZ'
              Width = 34
              FieldName = 'PLZ'
            end          
            item
              Title.Caption = 'Ort'
              Width = 100
              FieldName = 'ORT'
            end          
            item
              Title.Caption = 'Telefon'
              Width = 100
              FieldName = 'TELEFON'
            end          
            item
              Title.Caption = 'Fax'
              Width = 100
              FieldName = 'FAX'
            end          
            item
              Title.Caption = 'Mobil'
              Width = 100
              FieldName = 'FUNK'
            end          
            item
              Title.Caption = 'eMail'
              Width = 100
              FieldName = 'EMAIL'
            end          
            item
              Title.Caption = 'PROVISIONSART'
              Width = 0
              Visible = False
              FieldName = 'PROVISIONSART'
            end          
            item
              Title.Caption = 'ABRECHNUNGSZEITPUNKT'
              Width = 0
              Visible = False
              FieldName = 'ABRECHNUNGSZEITPUNKT'
            end          
            item
              Title.Caption = 'PROVISIONMITTRANSPORT'
              Width = 0
              Visible = False
              FieldName = 'PROVISIONMITTRANSPORT'
            end          
            item
              Title.Caption = 'PROVISIONSATZ'
              Width = 0
              Visible = False
              FieldName = 'PROVISIONSATZ'
            end          
            item
              Title.Caption = 'LETZTEABRECHNUNG'
              Width = 0
              Visible = False
              FieldName = 'LETZTEABRECHNUNG'
            end          
            item
              Title.Caption = 'Umsatz'
              Width = 64
              FieldName = 'UMSATZ'
            end          
            item
              Title.Caption = 'Provision'
              Width = 64
              FieldName = 'PROVISION'
            end          
            item
              Title.Caption = 'Geb.-Datum'
              Width = 112
              FieldName = 'GEBDATUM'
            end>
          DataSource = Vert_DS
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          Scrollbars = ssHorizontal
          TabOrder = 0
          OnDblClick = SuchGridDblClick
        end
      end
    end
  end
  object Vert_DS: TDataSource
    DataSet = Vert_Tab
    Left = 296
    Top = 287
  end
  object Vert_Tab: TZQuery
    Connection = DM1.DB1
    AfterOpen = Vert_TabAfterScroll
    AfterScroll = Vert_TabAfterScroll
    BeforeInsert = Vert_TabBeforeInsert
    BeforePost = Vert_TabBeforePost
    AfterPost = Vert_TabAfterPost
    AfterDelete = Vert_TabAfterScroll
    SQL.Strings = (
      'select * from VERTRETER'
    )
    Params = <>
    Left = 232
    Top = 287
    object Vert_TabVERTRETER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'VERTRETER_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Vert_TabVERTR_NUMMER: TZRawStringField
      FieldKind = fkData
      FieldName = 'VERTR_NUMMER'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object Vert_TabNAME: TZRawStringField
      DisplayWidth = 100
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Vert_TabVNAME: TZRawStringField
      DisplayWidth = 100
      FieldKind = fkData
      FieldName = 'VNAME'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Vert_TabANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object Vert_TabTITEL: TZRawStringField
      FieldKind = fkData
      FieldName = 'TITEL'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object Vert_TabZUSATZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'ZUSATZ'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Vert_TabZUSATZ2: TZRawStringField
      FieldKind = fkData
      FieldName = 'ZUSATZ2'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Vert_TabZUHAENDEN: TZRawStringField
      FieldKind = fkData
      FieldName = 'ZUHAENDEN'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Vert_TabSTRASSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Vert_TabLAND: TZRawStringField
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object Vert_TabPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object Vert_TabORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Vert_TabTELEFON: TZRawStringField
      FieldKind = fkData
      FieldName = 'TELEFON'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Vert_TabFAX: TZRawStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Vert_TabFUNK: TZRawStringField
      DisplayLabel = 'Mobil'
      FieldKind = fkData
      FieldName = 'FUNK'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Vert_TabEMAIL: TZRawStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Vert_TabINTERNET: TZRawStringField
      FieldKind = fkData
      FieldName = 'INTERNET'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Vert_TabSPRACH_ID: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SPRACH_ID'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Vert_TabPROVISIONSART: TZRawStringField
      FieldKind = fkData
      FieldName = 'PROVISIONSART'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object Vert_TabABRECHNUNGSZEITPUNKT: TZRawStringField
      FieldKind = fkData
      FieldName = 'ABRECHNUNGSZEITPUNKT'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object Vert_TabPROVISIONMITTRANSPORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'PROVISIONMITTRANSPORT'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object Vert_TabPROVISIONSATZ: TFloatField
      FieldKind = fkData
      FieldName = 'PROVISIONSATZ'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00" %"'
      EditFormat = '0.00'
    end
    object Vert_TabLETZTEABRECHNUNG: TZDateField
      FieldKind = fkData
      FieldName = 'LETZTEABRECHNUNG'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy;-;-'
      InvalidDisplayText = 'NAD'
    end
    object Vert_TabUMSATZ: TFloatField
      FieldKind = fkData
      FieldName = 'UMSATZ'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object Vert_TabPROVISION: TFloatField
      FieldKind = fkData
      FieldName = 'PROVISION'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object Vert_TabBESCHAEFTIGUNGSART: TZSmallIntField
      FieldKind = fkData
      FieldName = 'BESCHAEFTIGUNGSART'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Vert_TabBESCHAEFTIGUNGSGRAD: TZSmallIntField
      FieldKind = fkData
      FieldName = 'BESCHAEFTIGUNGSGRAD'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0" %"'
      EditFormat = '0'
    end
    object Vert_TabGUELTIG_VON: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'GUELTIG_VON'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Vert_TabGUELTIG_BIS: TZDateTimeField
      FieldKind = fkData
      FieldName = 'GUELTIG_BIS'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Vert_TabGEBDATUM: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'GEBDATUM'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Vert_TabGESCHLECHT: TZRawStringField
      FieldKind = fkData
      FieldName = 'GESCHLECHT'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object Vert_TabFAMSTAND: TZSmallIntField
      FieldKind = fkData
      FieldName = 'FAMSTAND'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Vert_TabBANK: TZRawStringField
      FieldKind = fkData
      FieldName = 'BANK'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Vert_TabBLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'BLZ'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object Vert_TabKTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Vert_TabBEMERKUNG: TMemoField
      FieldKind = fkData
      FieldName = 'BEMERKUNG'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
    end
    object Vert_TabERSTELLT: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyyy'
      InvalidDisplayText = 'NADT'
    end
    object Vert_TabERSTELLT_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERSTELLT_NAME'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Vert_TabGEAEND: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyyy'
      InvalidDisplayText = 'NADT'
    end
    object Vert_TabGEAEND_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'GEAEND_NAME'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 360
    Top = 287
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
        Enabled = False
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
      object Nummer: TMenuItem
        Tag = 3
        Caption = 'N&ummer'
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
      object Name: TMenuItem
        Tag = 1
        Caption = '&Name'
        Checked = True
        Default = True
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
      object Ort: TMenuItem
        Tag = 2
        Caption = '&Ort'
        GroupIndex = 3
        RadioItem = True
        OnClick = SortierungClick
      end
    end
    object MenuItem2: TMenuItem
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
      object Provision1: TMenuItem
        Tag = 2
        Caption = 'Provision'
        GroupIndex = 4
        RadioItem = True
        OnClick = ListeBtnClick
      end
      object Ansprechpartner1: TMenuItem
        Tag = 3
        Caption = 'Ansprechpartner'
        GroupIndex = 4
        RadioItem = True
        Visible = False
        OnClick = ListeBtnClick
      end
      object Liste1: TMenuItem
        Tag = 4
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = ListeBtnClick
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
          OnClick = TrefferClick
        end
        object N501: TMenuItem
          Tag = 50
          Caption = '50 Treffer'
          Checked = True
          Default = True
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object N1001: TMenuItem
          Tag = 100
          Caption = '100 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object N2001: TMenuItem
          Tag = 200
          Caption = '200 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object N5001: TMenuItem
          Tag = 500
          Caption = '500 Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
        object alle1: TMenuItem
          Tag = 999999999
          Caption = 'alle Treffer'
          GroupIndex = 12
          RadioItem = True
          OnClick = TrefferClick
        end
      end
      object N4: TMenuItem
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
      Visible = False
      object N5: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Caption = '-'
      end
    end
  end
end
