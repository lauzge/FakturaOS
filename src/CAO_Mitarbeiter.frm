object MitarbeiterForm: TMitarbeiterForm
  Left = 373
  Height = 508
  Top = 256
  Width = 724
  Caption = 'Mitarbeiter'
  ClientHeight = 488
  ClientWidth = 724
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
    Width = 724
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 488
    ClientWidth = 724
    TabOrder = 0
    object KunToolbar: TToolBar
      Left = 0
      Height = 22
      Top = 466
      Width = 724
      Align = alBottom
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 22
      ButtonWidth = 88
      Caption = 'NavToolbar'
      EdgeBorders = []
      Images = MainForm.ImageList1
      Indent = 2
      List = True
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
        DataSource = Mita_DS
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
      Width = 724
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 720
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object MainTopLab: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 98
        Align = alLeft
        Caption = '  Mitarbeiter ...'
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
        Caption = '&Liste'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AnsichtAuswahlClick
        OnMouseEnter = ListeBtnMouseEnter
        OnMouseLeave = ListeBtnMouseLeave
        ParentFont = False
      end
      object PositionenBtn: TSpeedButton
        Tag = 4
        Left = 592
        Height = 22
        Top = 2
        Width = 73
        Caption = 'P&ositionen'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Visible = False
        OnClick = AnsichtAuswahlClick
        OnMouseEnter = ListeBtnMouseEnter
        OnMouseLeave = ListeBtnMouseLeave
        ParentFont = False
      end
      object AuswahlBtn: TSpeedButton
        Tag = 2
        Left = 528
        Height = 22
        Top = 2
        Width = 65
        Caption = 'Aus&wahl'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Visible = False
        OnClick = AnsichtAuswahlClick
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
        OnClick = AnsichtAuswahlClick
        OnMouseEnter = ListeBtnMouseEnter
        OnMouseLeave = ListeBtnMouseLeave
        ParentFont = False
      end
    end
    object Main_PC: TPageControl
      Left = 0
      Height = 439
      Top = 27
      Width = 724
      ActivePage = Allg_TS
      Align = alClient
      TabIndex = 0
      TabOrder = 2
      OnChange = Main_PCChange
      object Allg_TS: TTabSheet
        Caption = 'Allg_TS'
        ClientHeight = 410
        ClientWidth = 716
        object BemerkungGB: TGroupBox
          Left = 0
          Height = 210
          Top = 200
          Width = 716
          Align = alClient
          Caption = 'Bemerkung'
          ClientHeight = 192
          ClientWidth = 712
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object DBMemo1: TDBMemo
            Left = 0
            Height = 192
            Top = 0
            Width = 712
            Align = alClient
            Color = clWindow
            DataField = 'BEMERKUNG'
            DataSource = Mita_DS
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel1: TPanel
          Left = 0
          Height = 200
          Top = 0
          Width = 716
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 200
          ClientWidth = 716
          TabOrder = 1
          object AllgemeinGB: TGroupBox
            Left = 0
            Height = 200
            Top = 0
            Width = 358
            Align = alLeft
            Caption = 'Allgemein'
            ClientHeight = 182
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
            object MaNumEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 0
              Width = 257
              DataField = 'MA_NUMMER'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
            end
            object MaLoginEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 24
              Width = 257
              DataField = 'LOGIN_NAME'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
            end
            object MaAnzeigeEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 48
              Width = 257
              DataField = 'ANZEIGE_NAME'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
            end
            object MaNameEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 80
              Width = 257
              DataField = 'NAME'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
            end
            object MaVNameEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 104
              Width = 257
              DataField = 'VNAME'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
            end
            object MaStrasseEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 128
              Width = 257
              DataField = 'STRASSE'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
            end
            object MaPLZEdi: TDBEdit
              Tag = 1
              Left = 95
              Height = 21
              Top = 152
              Width = 56
              DataField = 'PLZ'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
            end
            object MaOrtEdi: TDBEdit
              Tag = 1
              Left = 152
              Height = 21
              Top = 152
              Width = 200
              DataField = 'ORT'
              DataSource = Mita_DS
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
            end
            object Label1: TLabel
              Left = 5
              Height = 13
              Top = 32
              Width = 88
              AutoSize = False
              Caption = 'Login-Name.:'
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
              Top = 56
              Width = 88
              AutoSize = False
              Caption = 'Anzeige-Name :'
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
              Top = 88
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
              Top = 112
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
              Top = 136
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
              Top = 160
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
              Caption = 'Mitarbeiter-Nr..:'
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
            Height = 200
            Top = 0
            Width = 358
            Align = alClient
            Caption = 'Kommunikation'
            ClientHeight = 182
            ClientWidth = 354
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object MaTelEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 0
              Width = 268
              DataField = 'TELEFON'
              DataSource = Mita_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
            end
            object MaFaxEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 24
              Width = 268
              DataField = 'FAX'
              DataSource = Mita_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
            end
            object MaFunkEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 48
              Width = 268
              DataField = 'FUNK'
              DataSource = Mita_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
            end
            object MaEmailEdi: TDBEdit
              Tag = 1
              Left = 81
              Height = 21
              Top = 72
              Width = 268
              DataField = 'EMAIL'
              DataSource = Mita_DS
              Anchors = [akTop, akLeft, akRight]
              Color = clWindow
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
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
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
      end
      object Such_TS: TTabSheet
        Caption = 'Such_TS'
        ClientHeight = 407
        ClientWidth = 716
        object SuchGrid: TDBGrid
          Left = 0
          Height = 407
          Top = 0
          Width = 716
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'MA-Nr.'
              Width = 40
              FieldName = 'MA_NUMMER'
            end          
            item
              Title.Caption = 'Login-Name'
              Width = 100
              FieldName = 'LOGIN_NAME'
            end          
            item
              Title.Caption = 'Anzeige-Name'
              Width = 120
              FieldName = 'ANZEIGE_NAME'
            end          
            item
              Title.Caption = 'Name'
              Width = 120
              FieldName = 'NAME'
            end          
            item
              Title.Caption = 'Vorname'
              Width = 100
              FieldName = 'VNAME'
            end          
            item
              Title.Caption = 'Straße'
              Width = 120
              FieldName = 'STRASSE'
            end          
            item
              Title.Caption = 'Land'
              Width = 25
              FieldName = 'LAND'
            end          
            item
              Title.Caption = 'PLZ'
              Width = 40
              FieldName = 'PLZ'
            end          
            item
              Title.Caption = 'Ort'
              Width = 120
              FieldName = 'ORT'
            end          
            item
              Title.Caption = 'Telefon'
              Width = 100
              FieldName = 'TELEFON'
            end          
            item
              Title.Caption = 'Telefax'
              Width = 100
              FieldName = 'FAX'
            end          
            item
              Title.Caption = 'Mobilfunk'
              Width = 100
              FieldName = 'FUNK'
            end          
            item
              Title.Caption = 'eMail'
              Width = 120
              FieldName = 'EMAIL'
            end          
            item
              Title.Caption = 'Geb.-Datum'
              Width = 70
              FieldName = 'GEBDATUM'
            end          
            item
              Title.Caption = 'Be.-Art'
              Width = 60
              FieldName = 'BESCHAEFTIGUNGSART'
            end          
            item
              Title.Caption = 'Be.-Grad'
              Width = 60
              FieldName = 'BESCHAEFTIGUNGSGRAD'
            end          
            item
              Title.Caption = 'Urlaub / Jahr'
              Width = 60
              FieldName = 'JAHRESURLAUB'
            end          
            item
              Title.Caption = 'von'
              Width = 70
              FieldName = 'GUELTIG_VON'
            end          
            item
              Title.Caption = 'bis'
              Width = 70
              FieldName = 'GUELTIG_BIS'
            end>
          DataSource = Mita_DS
          TabOrder = 0
          OnDblClick = SuchGridDblClick
        end
      end
    end
  end
  object Mita_DS: TDataSource
    DataSet = Mita_Tab
    Left = 296
    Top = 288
  end
  object Mita_Tab: TZQuery
    Connection = DM1.DB1
    AfterOpen = Mita_TabAfterScroll
    AfterScroll = Mita_TabAfterScroll
    BeforeInsert = Mita_TabBeforeInsert
    BeforePost = Mita_TabBeforePost
    AfterPost = Mita_TabAfterPost
    AfterDelete = Mita_TabAfterScroll
    SQL.Strings = (
      'select * from MITARBEITER '
      'order by NAME, VNAME'
    )
    Params = <>
    Left = 232
    Top = 287
    object Mita_TabMA_ID: TZCardinalField
      FieldKind = fkData
      FieldName = 'MA_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Mita_TabLOGIN_NAME: TZRawStringField
      DisplayLabel = 'Login-Name'
      FieldKind = fkData
      FieldName = 'LOGIN_NAME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object Mita_TabANZEIGE_NAME: TZRawStringField
      DisplayLabel = 'Anzeige-Name'
      FieldKind = fkData
      FieldName = 'ANZEIGE_NAME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object Mita_TabMA_NUMMER: TZRawStringField
      DisplayLabel = 'MA-Nr.'
      FieldKind = fkData
      FieldName = 'MA_NUMMER'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object Mita_TabNAME: TZRawStringField
      DisplayLabel = 'Name'
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Mita_TabVNAME: TZRawStringField
      DisplayLabel = 'Vorname'
      FieldKind = fkData
      FieldName = 'VNAME'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Mita_TabANREDE: TZRawStringField
      DisplayLabel = 'Anrede'
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object Mita_TabTITEL: TZRawStringField
      DisplayLabel = 'Titel'
      FieldKind = fkData
      FieldName = 'TITEL'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object Mita_TabZUSATZ: TZRawStringField
      DisplayLabel = 'Zusatz'
      FieldKind = fkData
      FieldName = 'ZUSATZ'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Mita_TabZUSATZ2: TZRawStringField
      DisplayLabel = 'Zusatz 2'
      FieldKind = fkData
      FieldName = 'ZUSATZ2'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Mita_TabZUHAENDEN: TZRawStringField
      DisplayLabel = 'zu Händen'
      FieldKind = fkData
      FieldName = 'ZUHAENDEN'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Mita_TabSTRASSE: TZRawStringField
      DisplayLabel = 'Straße'
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Mita_TabLAND: TZRawStringField
      DisplayLabel = 'Land'
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object Mita_TabPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object Mita_TabORT: TZRawStringField
      DisplayLabel = 'Ort'
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Mita_TabTELEFON: TZRawStringField
      DisplayLabel = 'Telefon'
      FieldKind = fkData
      FieldName = 'TELEFON'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Mita_TabFAX: TZRawStringField
      DisplayLabel = 'Telefax'
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Mita_TabFUNK: TZRawStringField
      DisplayLabel = 'Mobilfunk'
      FieldKind = fkData
      FieldName = 'FUNK'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Mita_TabEMAIL: TZRawStringField
      DisplayLabel = 'eMail'
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Mita_TabINTERNET: TZRawStringField
      DisplayLabel = 'Internet'
      FieldKind = fkData
      FieldName = 'INTERNET'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object Mita_TabSPRACH_ID: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SPRACH_ID'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Mita_TabBESCHAEFTIGUNGSART: TZSmallIntField
      DisplayLabel = 'Be.-Art'
      FieldKind = fkData
      FieldName = 'BESCHAEFTIGUNGSART'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Mita_TabBESCHAEFTIGUNGSGRAD: TZSmallIntField
      DisplayLabel = 'Be.-Grad'
      FieldKind = fkData
      FieldName = 'BESCHAEFTIGUNGSGRAD'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Mita_TabJAHRESURLAUB: TZDoubleField
      DisplayLabel = 'Urlaub / Jahr'
      FieldKind = fkData
      FieldName = 'JAHRESURLAUB'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 12
    end
    object Mita_TabGUELTIG_VON: TZDateTimeField
      DisplayLabel = 'von'
      FieldKind = fkData
      FieldName = 'GUELTIG_VON'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Mita_TabGUELTIG_BIS: TZDateTimeField
      DisplayLabel = 'bis'
      FieldKind = fkData
      FieldName = 'GUELTIG_BIS'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Mita_TabGEBDATUM: TZDateTimeField
      DisplayLabel = 'Geb.-Datum'
      FieldKind = fkData
      FieldName = 'GEBDATUM'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Mita_TabGESCHLECHT: TZRawStringField
      FieldKind = fkData
      FieldName = 'GESCHLECHT'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object Mita_TabFAMSTAND: TZSmallIntField
      FieldKind = fkData
      FieldName = 'FAMSTAND'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Mita_TabBANK: TZRawStringField
      FieldKind = fkData
      FieldName = 'BANK'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object Mita_TabBLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'BLZ'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object Mita_TabKTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Mita_TabBEMERKUNG: TZRawCLobField
      FieldKind = fkData
      FieldName = 'BEMERKUNG'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object Mita_TabERSTELLT: TZDateTimeField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Mita_TabERSTELLT_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERSTELLT_NAME'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object Mita_TabGEAEND: TZDateTimeField
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object Mita_TabGEAEND_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'GEAEND_NAME'
      Index = 36
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
      object MANummer: TMenuItem
        Tag = 3
        Caption = '&Mitarbeiternummer'
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
        OnClick = AnsichtAuswahlClick
      end
      object Provision1: TMenuItem
        Tag = 2
        Caption = 'Provision'
        GroupIndex = 4
        RadioItem = True
        OnClick = AnsichtAuswahlClick
      end
      object Ansprechpartner1: TMenuItem
        Tag = 3
        Caption = 'Ansprechpartner'
        GroupIndex = 4
        RadioItem = True
        Visible = False
        OnClick = AnsichtAuswahlClick
      end
      object Liste1: TMenuItem
        Tag = 4
        Caption = 'Liste'
        GroupIndex = 4
        RadioItem = True
        ShortCut = 118
        OnClick = AnsichtAuswahlClick
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
    end
  end
end
