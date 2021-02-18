object MakeEKReForm: TMakeEKReForm
  Left = 783
  Height = 547
  Top = 293
  Width = 704
  Caption = 'Einkauf erfassen'
  ClientHeight = 527
  ClientWidth = 704
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
  ShowHint = True
  LCLVersion = '7.2'
  object RePanel: TPanel
    Left = 0
    Height = 527
    Top = 0
    Width = 704
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 527
    ClientWidth = 704
    Color = 14680063
    ParentColor = False
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 704
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 700
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object ButtonPan: TPanel
        Left = 414
        Height = 23
        Top = 0
        Width = 286
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        ClientHeight = 23
        ClientWidth = 286
        TabOrder = 0
        object AuswahlBtn: TSpeedButton
          Tag = 4
          Left = 0
          Height = 23
          Top = 0
          Width = 65
          Align = alRight
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
        object AllgemeinBtn: TSpeedButton
          Tag = 1
          Left = 65
          Height = 23
          Top = 0
          Width = 68
          Align = alRight
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
          Left = 133
          Height = 23
          Top = 0
          Width = 73
          Align = alRight
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
        object FertigBtn: TSpeedButton
          Tag = 5
          Left = 206
          Height = 23
          Top = 0
          Width = 80
          Align = alRight
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
      end
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 154
        Align = alLeft
        Caption = '  Einkauf bearbeiten ...'
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
    end
    object PC1: TPageControl
      Left = 0
      Height = 500
      Top = 27
      Width = 704
      ActivePage = EdiListTS
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      OnChange = PC1Change
      OnChanging = PC1Changing
      object EdiListTS: TTabSheet
        Caption = 'Aus&wahl'
        ClientHeight = 474
        ClientWidth = 696
        object ToolBar3: TToolBar
          Left = 0
          Height = 26
          Top = 448
          Width = 696
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 23
          Caption = 'ToolBar3'
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
            Hints.Strings = (
              'Erster Beleg'
              'Vorheriger Beleg'
              'Nächster Beleg'
              'Letzter Beleg'
              'Datensatz einfügen'
              'Datensatz löschen'
              'Datensatz bearbeiten'
              'Übernehmen'
              'Bearbeiten abbrechen'
              'Daten aktualisieren'
            )
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
            Left = 278
            Top = 0
            AutoSize = True
            Caption = 'Beleg löschen'
            ImageIndex = 1
            OnClick = Del1BtnClick
          end
          object ReEdiBtn: TToolButton
            Left = 375
            Top = 0
            AutoSize = True
            Caption = 'Bearbeiten'
            ImageIndex = 10
            OnClick = ReEdiBtnClick
          end
        end
        object ReEdiListGrid: TDBGrid
          Left = 0
          Height = 448
          Top = 0
          Width = 696
          Align = alClient
          BorderStyle = bsNone
          Color = clWindow
          Columns = <          
            item
              Alignment = taCenter
              Title.Caption = 'int. Nr.'
              Width = 65
              FieldName = 'VRENUM'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Ku-Nr. vom Lief.'
              Width = 46
              FieldName = 'KUN_NUM'
            end          
            item
              Title.Caption = 'Lieferant'
              Width = 198
              FieldName = 'KUN_NAME1'
            end          
            item
              Title.Caption = 'Projekt / Beschreibung'
              Width = 196
              FieldName = 'PROJEKT'
            end          
            item
              Alignment = taRightJustify
              Title.Caption = 'Summe Netto'
              Width = 68
              FieldName = 'NSUMME'
            end          
            item
              Alignment = taRightJustify
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
            end>
          DataSource = ReEdiDS
          DefaultRowHeight = 17
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          OnDblClick = DBGrid1DblClick
        end
      end
      object AdressTS: TTabSheet
        Caption = 'All&gemein'
        ClientHeight = 474
        ClientWidth = 696
        object ToolBar2: TToolBar
          Left = 0
          Height = 26
          Top = 448
          Width = 696
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 23
          Caption = 'ToolBar2'
          Color = clBtnFace
          EdgeBorders = []
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
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
            Left = 65
            Height = 8
            Top = 0
            Caption = 'ToolButton4'
            Style = tbsSeparator
          end
          object KopfNav2: TDBNavigator
            Left = 73
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
            Hints.Strings = (
              'Erster Beleg'
              'Vorheriger Beleg'
              'Nächster Beleg'
              'Letzter Beleg'
              'Datensatz einfügen'
              'Datensatz löschen'
              'Datensatz bearbeiten'
              'Übernehmen'
              'Bearbeiten abbrechen'
              'Daten aktualisieren'
            )
            Options = []
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          end
          object New1Btn: TToolButton
            Left = 258
            Top = 0
            AutoSize = True
            Caption = 'Neuen Beleg'
            ImageIndex = 7
            OnClick = New1BtnClick
          end
          object Del1Btn: TToolButton
            Left = 350
            Top = 0
            AutoSize = True
            Caption = 'Beleg löschen'
            ImageIndex = 1
            OnClick = Del1BtnClick
          end
          object ToolButton9: TToolButton
            Left = 447
            Height = 8
            Top = 0
            Caption = 'ToolButton9'
            Style = tbsSeparator
          end
          object GotoPosBtn: TToolButton
            Left = 455
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoPosBtnClick
          end
        end
        object KundatPan: TPanel
          Left = 0
          Height = 70
          Top = 0
          Width = 696
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 70
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 1
          object KunDatGB: TGroupBox
            Left = 0
            Height = 70
            Top = 0
            Width = 696
            Align = alClient
            Caption = 'Lieferant'
            ClientHeight = 52
            ClientWidth = 692
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
              Width = 84
              AutoSize = False
              Caption = 'Ku-Nr. vom Lief. :'
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
              Top = 27
              Width = 77
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
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
            object Label22: TLabel
              Left = 5
              Height = 13
              Top = 27
              Width = 84
              AutoSize = False
              Caption = 'Intern-Nr:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Panel2: TPanel
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
              TabOrder = 0
              object DBText1: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 100
                AutoSize = False
                DataField = 'VRENUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel8: TPanel
              Left = 280
              Height = 20
              Top = 0
              Width = 408
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 408
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object DBText4: TDBText
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
            object Panel9: TPanel
              Left = 280
              Height = 20
              Top = 24
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
                Top = 3
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
              Top = 24
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
                Top = 3
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
              Top = 24
              Width = 320
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 320
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
                Top = 3
                Width = 158
                AutoSize = False
                DataField = 'KUN_ORT'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object KuNrEdit: TDBEdit
              Left = 88
              Height = 21
              Top = 0
              Width = 80
              DataField = 'KUN_NUM'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object KuNrEdtBtn: TSpeedButton
              Left = 170
              Height = 22
              Top = -1
              Width = 23
              Caption = '...'
              OnClick = KuNrEditButtonClick
            end
          end
        end
        object AlgPan2: TPanel
          Left = 0
          Height = 186
          Top = 70
          Width = 696
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 186
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 2
          object ZuweisungenGB: TGroupBox
            Left = 0
            Height = 186
            Top = 0
            Width = 327
            Align = alLeft
            Caption = 'Zuweisungen'
            ClientHeight = 168
            ClientWidth = 323
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label27: TLabel
              Left = 5
              Height = 13
              Top = 4
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
              Top = 26
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
              Top = 52
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
            object Label15: TLabel
              Left = 5
              Height = 13
              Top = 72
              Width = 77
              AutoSize = False
              Caption = 'ER-Datum:'
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
              Top = 96
              Width = 79
              AutoSize = False
              Caption = 'ER-Nummer:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label23: TLabel
              Left = 5
              Height = 34
              Top = 118
              Width = 84
              AutoSize = False
              Caption = 'Überweisungs- text:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              WordWrap = True
            end
            object Label7: TLabel
              Left = 120
              Height = 13
              Top = 52
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
              Top = 52
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
              Top = 52
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
            object Zahlart: TDBEdit
              Left = 88
              Height = 21
              Top = 0
              Width = 28
              DataField = 'ZAHLART'
              DataSource = ReEdiDS
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object waehrung: TDBEdit
              Left = 88
              Height = 21
              Top = 24
              Width = 28
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Tage: TDBEdit
              Left = 88
              Height = 21
              Top = 48
              Width = 28
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 2
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Skonto_Proz: TDBEdit
              Left = 149
              Height = 21
              Top = 48
              Width = 40
              DataField = 'SOLL_SKONTO'
              DataSource = ReEdiDS
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 3
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object SK_Netto_Tage: TDBEdit
              Left = 234
              Height = 21
              Top = 48
              Width = 28
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              CharCase = ecUppercase
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object ZahlartDB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Height = 21
              Top = 0
              Width = 204
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
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 115
              Height = 21
              Top = 24
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
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object RE_Datum: TRxDBDateEdit
              Tag = 1
              Left = 88
              Height = 21
              Hint = 'Datum der Eingangsrechnung'
              Top = 72
              Width = 231
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
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'RDATUM'
              DataSource = ReEdiDS
            end
            object Org_num: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Hint = 'Belegnummer der Eingangsrechnung'
              Top = 96
              Width = 231
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
              TabOrder = 8
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object USR1: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 120
              Width = 231
              DataField = 'USR1'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 9
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object USR2: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 144
              Width = 231
              DataField = 'USR2'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 10
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object InfoGB: TGroupBox
            Left = 327
            Height = 186
            Top = 0
            Width = 369
            Align = alClient
            Caption = 'Info'
            ClientHeight = 168
            ClientWidth = 365
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RechInfoMemo: TDBMemo
              Left = 0
              Height = 168
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Top = 0
              Width = 365
              Align = alClient
              DataField = 'INFO'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Height = 24
          Top = 424
          Width = 696
          Align = alBottom
          ClientHeight = 24
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 3
          object Panel16: TPanel
            Left = 1
            Height = 22
            Top = 1
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel17: TPanel
            Left = 692
            Height = 22
            Top = 1
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel18: TPanel
            Left = 4
            Height = 22
            Top = 1
            Width = 688
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 22
            ClientWidth = 688
            TabOrder = 2
            object Label34: TLabel
              Left = 0
              Height = 22
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
            object Label36: TLabel
              Left = 226
              Height = 22
              Top = 0
              Width = 65
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Panel19: TPanel
              Left = 588
              Height = 22
              Top = 0
              Width = 100
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 100
              TabOrder = 0
              object DBText15: TDBText
                Left = 0
                Height = 22
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'BSUMME'
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
            object Panel27: TPanel
              Left = 447
              Height = 22
              Top = 0
              Width = 85
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 85
              TabOrder = 1
              object DBText16: TDBText
                Left = 0
                Height = 22
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
            object Label39: TLabel
              Left = 532
              Height = 22
              Top = 0
              Width = 56
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Label37: TLabel
              Left = 391
              Height = 22
              Top = 0
              Width = 56
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Panel28: TPanel
              Left = 291
              Height = 22
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 100
              TabOrder = 2
              object DBText17: TDBText
                Left = 0
                Height = 22
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
        object CaoGBPan: TPanel
          Left = 0
          Height = 168
          Top = 256
          Width = 696
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 168
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 4
          object CaoGroupBox3: TGroupBox
            Left = 0
            Height = 168
            Top = 0
            Width = 696
            Align = alClient
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ClientHeight = 474
        ClientWidth = 696
        object ToolBar1: TToolBar
          Left = 0
          Height = 26
          Top = 448
          Width = 696
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 23
          Caption = 'ToolBar1'
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
          object GotoAllgBtn: TToolButton
            Left = 1
            Top = 0
            AutoSize = True
            Caption = 'Zurück'
            ImageIndex = 8
            OnClick = GotoAllgBtnClick
          end
          object ToolButton1: TToolButton
            Left = 65
            Height = 8
            Top = 0
            Caption = 'ToolButton1'
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
            Style = tbsDropDown
          end
          object EditSNBtn: TToolButton
            Left = 172
            Top = 0
            AutoSize = True
            Caption = 'Seriennummern'
            ImageIndex = 13
            OnClick = EditSNBtnClick
          end
          object DelBtn: TToolButton
            Left = 275
            Top = 0
            AutoSize = True
            Caption = 'Löschen'
            ImageIndex = 6
            OnClick = DelBtnClick
          end
          object UpBtn: TToolButton
            Left = 346
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtnClick
          end
          object DownBtn: TToolButton
            Left = 397
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtnClick
          end
          object DBNavigator3: TDBNavigator
            Left = 448
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
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
          end
          object ToolButton2: TToolButton
            Left = 568
            Height = 8
            Top = 0
            Caption = 'ToolButton2'
            Style = tbsSeparator
          end
          object GotoFertigBtn: TToolButton
            Left = 576
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
        end
        object KundatPan2: TPanel
          Left = 0
          Height = 70
          Top = 0
          Width = 696
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 70
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 1
          object KunDatGB2: TGroupBox
            Left = 0
            Height = 70
            Top = 0
            Width = 696
            Align = alClient
            Caption = 'Lieferant'
            ClientHeight = 52
            ClientWidth = 692
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 84
              AutoSize = False
              Caption = 'Ku-Nr. vom Lief. :'
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
              Top = 27
              Width = 77
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
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
            object Label4: TLabel
              Left = 5
              Height = 13
              Top = 27
              Width = 84
              AutoSize = False
              Caption = 'Intern-Nr:'
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
              object DBText12: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 100
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
              TabOrder = 1
              object DBText11: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 100
                AutoSize = False
                DataField = 'VRENUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel12: TPanel
              Left = 280
              Height = 20
              Top = 0
              Width = 408
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 408
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
            object Panel4: TPanel
              Left = 308
              Height = 20
              Top = 24
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
              Left = 368
              Height = 20
              Top = 24
              Width = 320
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 320
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
        object Panel1a: TPanel
          Left = 0
          Height = 24
          Top = 424
          Width = 696
          Align = alBottom
          ClientHeight = 24
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 2
          object Panel14: TPanel
            Left = 1
            Height = 22
            Top = 1
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel15: TPanel
            Left = 692
            Height = 22
            Top = 1
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object SumPan: TPanel
            Left = 4
            Height = 22
            Top = 1
            Width = 688
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 22
            ClientWidth = 688
            TabOrder = 2
            object Label33: TLabel
              Left = 0
              Height = 22
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
            object Label18: TLabel
              Left = 226
              Height = 22
              Top = 0
              Width = 65
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object bsumpan: TPanel
              Left = 588
              Height = 22
              Top = 0
              Width = 100
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 100
              TabOrder = 0
              object DBText10: TDBText
                Left = 0
                Height = 22
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'BSUMME'
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
            object Panel39: TPanel
              Left = 447
              Height = 22
              Top = 0
              Width = 85
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 85
              TabOrder = 1
              object DBText25: TDBText
                Left = 0
                Height = 22
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
            object Label20: TLabel
              Left = 532
              Height = 22
              Top = 0
              Width = 56
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Label19: TLabel
              Left = 391
              Height = 22
              Top = 0
              Width = 56
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Panel40: TPanel
              Left = 291
              Height = 22
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 100
              TabOrder = 2
              object DBText26: TDBText
                Left = 0
                Height = 22
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
        object OffBestGBPan: TPanel
          Left = 0
          Height = 354
          Top = 70
          Width = 696
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 354
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 3
          object PosiGB: TGroupBox
            Left = 0
            Height = 231
            Top = 0
            Width = 696
            Align = alClient
            Caption = 'Positionen'
            ClientHeight = 213
            ClientWidth = 692
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object PosGrid: TRxDBGrid
              Left = 0
              Height = 213
              Top = 0
              Width = 692
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
                  Width = 26
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
                  ReadOnly = True
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
              BorderStyle = bsNone
              Color = clWindow
              DrawFullLine = False
              FocusColor = clRed
              SelectedColor = clHighlight
              GridLineStyle = psSolid
              DataSource = PosDS
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete]
              ParentFont = False
              Scrollbars = ssHorizontal
              TabOrder = 0
              OnKeyDown = PosGridKeyDown
              OnKeyPress = PosGridKeyPress
            end
          end
          object OffBestGB: TGroupBox
            Left = 0
            Height = 118
            Top = 236
            Width = 696
            Align = alBottom
            Caption = 'offene Bestellungen'
            ClientHeight = 100
            ClientWidth = 692
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object OffBestGrid: TDBGrid
              Left = 0
              Height = 100
              Top = 0
              Width = 692
              Align = alClient
              BorderStyle = bsNone
              Color = clWindow
              Columns = <              
                item
                  Title.Caption = 'Best.-Nr.'
                  Width = 45
                  FieldName = 'VRENUM'
                end              
                item
                  Title.Caption = 'Datum'
                  Width = 56
                  FieldName = 'RDATUM'
                end              
                item
                  Title.Caption = 'Lieferdatum'
                  FieldName = 'LDATUM'
                end              
                item
                  Title.Caption = 'Artikelnr.'
                  Width = 77
                  FieldName = 'ARTNUM'
                end              
                item
                  Title.Caption = 'Match'
                  Width = 74
                  FieldName = 'MATCHCODE'
                end              
                item
                  Title.Caption = 'Bezeichnung'
                  Width = 155
                  FieldName = 'BEZEICHNUNG'
                end              
                item
                  Title.Caption = 'Bestellmenge'
                  Width = 67
                  FieldName = 'MENGE_BEST'
                end              
                item
                  Title.Caption = 'Menge offen'
                  FieldName = 'MENGE_OFFEN'
                end              
                item
                  Alignment = taRightJustify
                  Title.Caption = 'E-Preis'
                  FieldName = 'EPREIS'
                end              
                item
                  Title.Caption = 'Rab.'
                  Width = 46
                  FieldName = 'RABATT'
                end              
                item
                  Title.Caption = 'RABATT2'
                  FieldName = 'RABATT2'
                end              
                item
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Quality = fqAntialiased
                  Font.Style = [fsBold]
                  Title.Caption = 'RABATT3'
                  Visible = False
                  FieldName = 'RABATT3'
                end              
                item
                  Title.Caption = 'POSREC_ID'
                  Visible = False
                  FieldName = 'POSREC_ID'
                end              
                item
                  Title.Caption = 'ARTIKEL_ID'
                  Visible = False
                  FieldName = 'ARTIKEL_ID'
                end              
                item
                  Title.Caption = 'MENGE_EK'
                  FieldName = 'MENGE_EK'
                end>
              DataSource = OffBestDS
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete]
              ParentFont = False
              TabOrder = 0
              OnDblClick = OffBestGridDblClick
            end
          end
          object OffBestSplitter: TSplitter
            Cursor = crVSplit
            Left = 0
            Height = 5
            Top = 231
            Width = 696
            Align = alBottom
            ResizeAnchor = akBottom
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ClientHeight = 474
        ClientWidth = 696
        object ToolBar5: TToolBar
          Left = 0
          Height = 26
          Top = 448
          Width = 696
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 23
          Caption = 'ToolBar5'
          Color = clBtnFace
          EdgeBorders = []
          Images = MainForm.VorgangImgList
          List = True
          ParentColor = False
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
            Left = 65
            Height = 8
            Top = 0
            Caption = 'ToolButton17'
            Style = tbsSeparator
          end
          object BuchenBtn: TToolButton
            Left = 73
            Top = 0
            Caption = 'Speichern und Buchen '
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
        end
        object KundatPan3: TPanel
          Left = 0
          Height = 70
          Top = 0
          Width = 696
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 70
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 1
          object KunDatGB3: TGroupBox
            Left = 0
            Height = 70
            Top = 0
            Width = 696
            Align = alClient
            Caption = 'Lieferant'
            ClientHeight = 52
            ClientWidth = 692
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label13: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 84
              AutoSize = False
              Caption = 'Ku-Nr. vom Lief. :'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label10: TLabel
              Left = 199
              Height = 13
              Top = 27
              Width = 77
              AutoSize = False
              Caption = 'Land/Plz/Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label11: TLabel
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
            object Label12: TLabel
              Left = 5
              Height = 13
              Top = 27
              Width = 84
              AutoSize = False
              Caption = 'Intern-Nr:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Panel26: TPanel
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
              TabOrder = 0
              object DBText24: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 100
                AutoSize = False
                DataField = 'KUN_NUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel24: TPanel
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
              TabOrder = 1
              object DBText22: TDBText
                Left = 3
                Height = 13
                Top = 3
                Width = 100
                AutoSize = False
                DataField = 'VRENUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel23: TPanel
              Left = 280
              Height = 20
              Top = 0
              Width = 408
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 408
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              object DBText21: TDBText
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
            object Panel22: TPanel
              Left = 280
              Height = 20
              Top = 24
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
              TabOrder = 3
              object DBText20: TDBText
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
            object Panel20: TPanel
              Left = 308
              Height = 20
              Top = 24
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
              TabOrder = 4
              object DBText18: TDBText
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
            object Panel21: TPanel
              Left = 368
              Height = 20
              Top = 24
              Width = 320
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 320
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              object DBText19: TDBText
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
        object AlgPan3: TPanel
          Left = 0
          Height = 186
          Top = 70
          Width = 696
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 186
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 2
          object ZuweisungenGB1: TGroupBox
            Left = 0
            Height = 186
            Top = 0
            Width = 327
            Align = alLeft
            Caption = 'Zuweisungen'
            ClientHeight = 168
            ClientWidth = 323
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label14: TLabel
              Left = 5
              Height = 13
              Top = 4
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
            object Label16a: TLabel
              Left = 5
              Height = 13
              Top = 26
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
            object Label17: TLabel
              Left = 5
              Height = 13
              Top = 52
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
            object Label26: TLabel
              Left = 5
              Height = 13
              Top = 72
              Width = 77
              AutoSize = False
              Caption = 'ER-Datum:'
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
              Top = 96
              Width = 79
              AutoSize = False
              Caption = 'ER-Nummer:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label29: TLabel
              Left = 5
              Height = 34
              Top = 118
              Width = 84
              AutoSize = False
              Caption = 'Überweisungs- text:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              WordWrap = True
            end
            object Label21: TLabel
              Left = 120
              Height = 13
              Top = 52
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
            object Label24: TLabel
              Left = 193
              Height = 13
              Top = 52
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
            object Label25: TLabel
              Left = 264
              Height = 13
              Top = 52
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
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 231
              DataField = 'Zahlart_Str'
              DataSource = ReEdiDS
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
            object DBEdit1: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
              Width = 231
              DataField = 'WAEHRUNG'
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
            object DBEdit3: TDBEdit
              Left = 88
              Height = 21
              Top = 48
              Width = 28
              DataField = 'SOLL_STAGE'
              DataSource = ReEdiDS
              AutoSelect = False
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
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit4: TDBEdit
              Left = 149
              Height = 21
              Top = 48
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
              TabOrder = 3
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit5: TDBEdit
              Left = 234
              Height = 21
              Top = 48
              Width = 28
              DataField = 'SOLL_NTAGE'
              DataSource = ReEdiDS
              AutoSelect = False
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
            object DBEdit6: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 96
              Width = 231
              DataField = 'ORGNUM'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 5
              OnKeyPress = KuNrEditKeyPress
              OnKeyUp = KuNrEditKeyDown
            end
            object DBEdit7: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 120
              Width = 231
              DataField = 'USR1'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 6
              OnKeyPress = KuNrEditKeyPress
              OnKeyUp = KuNrEditKeyDown
            end
            object DBEdit8: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 144
              Width = 231
              DataField = 'USR2'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 7
              OnKeyPress = KuNrEditKeyPress
              OnKeyUp = KuNrEditKeyDown
            end
            object DBEdit9: TDBEdit
              Left = 88
              Height = 21
              Top = 72
              Width = 231
              DataField = 'RDATUM'
              DataSource = ReEdiDS
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 8
              OnKeyPress = KuNrEditKeyPress
              OnKeyUp = KuNrEditKeyDown
            end
          end
          object InfoGB1: TGroupBox
            Left = 327
            Height = 186
            Top = 0
            Width = 369
            Align = alClient
            Caption = 'Info'
            ClientHeight = 168
            ClientWidth = 365
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object DBMemo1: TDBMemo
              Left = 0
              Height = 168
              Top = 0
              Width = 365
              Align = alClient
              Color = clBtnFace
              DataField = 'INFO'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object Panel29a: TPanel
          Left = 0
          Height = 24
          Top = 424
          Width = 696
          Align = alBottom
          ClientHeight = 24
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 3
          object Panel29: TPanel
            Left = 1
            Height = 22
            Top = 1
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel30: TPanel
            Left = 692
            Height = 22
            Top = 1
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel31: TPanel
            Left = 4
            Height = 22
            Top = 1
            Width = 688
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 22
            ClientWidth = 688
            TabOrder = 2
            object Label30: TLabel
              Left = 0
              Height = 22
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
            object Label40: TLabel
              Left = 226
              Height = 22
              Top = 0
              Width = 65
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Panel33: TPanel
              Left = 588
              Height = 22
              Top = 0
              Width = 100
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 100
              TabOrder = 0
              object DBText27: TDBText
                Left = 0
                Height = 22
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'BSUMME'
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
            object Panel34: TPanel
              Left = 447
              Height = 22
              Top = 0
              Width = 85
              Align = alRight
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 85
              TabOrder = 1
              object DBText28: TDBText
                Left = 0
                Height = 22
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
            object Label42: TLabel
              Left = 532
              Height = 22
              Top = 0
              Width = 56
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Label41: TLabel
              Left = 391
              Height = 22
              Top = 0
              Width = 56
              Align = alRight
              Alignment = taRightJustify
              AutoSize = False
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
            object Panel35: TPanel
              Left = 291
              Height = 22
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 22
              ClientWidth = 100
              TabOrder = 2
              object DBText29: TDBText
                Left = 0
                Height = 22
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
        object CaoGB3Pan: TPanel
          Left = 0
          Height = 168
          Top = 256
          Width = 696
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 168
          ClientWidth = 696
          Color = 14680063
          ParentColor = False
          TabOrder = 4
          object CaoGroupBox4: TGroupBox
            Left = 0
            Height = 168
            Top = 0
            Width = 696
            Align = alClient
            Caption = 'festgestellte Probleme'
            ClientHeight = 150
            ClientWidth = 692
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object ProblemLab: TLabel
              Left = 0
              Height = 150
              Top = 0
              Width = 692
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
    end
  end
  object ArtikelPopupMenu: TPopupMenu
    Images = MainForm.ImageList1
    Left = 384
    Top = 264
    object freierArtikel1: TMenuItem
      Caption = 'freien Artikel hinzufügen'
      ImageIndex = 20
      OnClick = NeuFrArtBtnClick
    end
    object Text1: TMenuItem
      Caption = 'Text hinzufügen'
      ImageIndex = 20
      OnClick = AddTextBtnClick
    end
  end
  object ArtikelTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL'
      'where REC_ID=:ID'
      'LIMIT 0,10'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 272
    Top = 200
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object ArtikelTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabARTIKELTYP: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object ArtikelTabARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabMATCHCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ArtikelTabBARCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabKURZNAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'KURZNAME'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ArtikelTabKAS_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'KAS_NAME'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ArtikelTabLANGNAME: TZRawCLobField
      FieldKind = fkData
      FieldName = 'LANGNAME'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ArtikelTabLAENGE: TZRawStringField
      FieldKind = fkData
      FieldName = 'LAENGE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabGROESSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'GROESSE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabDIMENSION: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIMENSION'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabGEWICHT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ArtikelTabEK_PREIS: TZDoubleField
      FieldKind = fkData
      FieldName = 'EK_PREIS'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.000'
    end
    object ArtikelTabVK1: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK1'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabVK2: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK2'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabVK3: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK3'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabVK4: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK4'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabVK5: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK5'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabSTEUER_CODE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabME_EINHEIT: TZRawStringField
      FieldKind = fkData
      FieldName = 'ME_EINHEIT'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object ArtikelTabPR_EINHEIT: TZDoubleField
      FieldKind = fkData
      FieldName = 'PR_EINHEIT'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ArtikelTabWARENGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'WARENGRUPPE'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ArtikelTabMENGE_AKT: TZDoubleField
      FieldKind = fkData
      FieldName = 'MENGE_AKT'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ArtikelTabERLOES_KTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'ERLOES_KTO'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabAUFW_KTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'AUFW_KTO'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabERSATZ_ARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERSATZ_ARTNUM'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabRABGRP_ID: TZRawStringField
      FieldKind = fkData
      FieldName = 'RABGRP_ID'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object ArtikelTabALTTEIL_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'ALTTEIL_FLAG'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabNO_RABATT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_RABATT_FLAG'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabNO_BEZEDIT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_BEZEDIT_FLAG'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabNO_EK_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_EK_FLAG'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabSN_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'SN_FLAG'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
  end
  object KunTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ADRESSEN'
      'where REC_ID = :ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 216
    Top = 200
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object KunTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabMATCHCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabKUNDENGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUNDENGRUPPE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabSPRACH_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SPRACH_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKUNNUM1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUNNUM1'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKUNNUM2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUNNUM2'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabNAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME1'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KunTabORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabLAND: TZRawStringField
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KunTabNAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME2'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabNAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME3'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabABTEILUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'ABTEILUNG'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabSTRASSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabPOSTFACH: TZRawStringField
      FieldKind = fkData
      FieldName = 'POSTFACH'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabPF_PLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PF_PLZ'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KunTabDEFAULT_LIEFANSCHRIFT_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'DEFAULT_LIEFANSCHRIFT_ID'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabGRUPPE: TZRawStringField
      FieldKind = fkData
      FieldName = 'GRUPPE'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 4
    end
    object KunTabTELE1: TZRawStringField
      FieldKind = fkData
      FieldName = 'TELE1'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabTELE2: TZRawStringField
      FieldKind = fkData
      FieldName = 'TELE2'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabFAX: TZRawStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabFUNK: TZRawStringField
      FieldKind = fkData
      FieldName = 'FUNK'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabEMAIL: TZRawStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabEMAIL2: TZRawStringField
      FieldKind = fkData
      FieldName = 'EMAIL2'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabINTERNET: TZRawStringField
      FieldKind = fkData
      FieldName = 'INTERNET'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabDIVERSES: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIVERSES'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabBRIEFANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BRIEFANREDE'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabBLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'BLZ'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 8
    end
    object KunTabKTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KunTabBANK: TZRawStringField
      FieldKind = fkData
      FieldName = 'BANK'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabIBAN: TZRawStringField
      FieldKind = fkData
      FieldName = 'IBAN'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabSWIFT: TZRawStringField
      FieldKind = fkData
      FieldName = 'SWIFT'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabKTO_INHABER: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO_INHABER'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabDEB_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'DEB_NUM'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKRD_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'KRD_NUM'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabSTATUS: TZIntegerField
      FieldKind = fkData
      FieldName = 'STATUS'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabNET_SKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'NET_SKONTO'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 5
    end
    object KunTabNET_TAGE: TZShortIntField
      FieldKind = fkData
      FieldName = 'NET_TAGE'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabBRT_TAGE: TZShortIntField
      FieldKind = fkData
      FieldName = 'BRT_TAGE'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabWAERUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'WAERUNG'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KunTabUST_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'UST_NUM'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 25
    end
    object KunTabVERTRETER_ID: TZCardinalField
      FieldKind = fkData
      FieldName = 'VERTRETER_ID'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KunTabPROVIS_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'PROVIS_PROZ'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 5
    end
    object KunTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object KunTabGRABATT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GRABATT'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 5
    end
    object KunTabKUN_KRDLIMIT: TZDoubleField
      FieldKind = fkData
      FieldName = 'KUN_KRDLIMIT'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKUN_LIEFART: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUN_LIEFART'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKUN_ZAHLART: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUN_ZAHLART'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKUN_PRLISTE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_PRLISTE'
      Index = 49
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object KunTabLIEF_LIEFART: TZIntegerField
      FieldKind = fkData
      FieldName = 'LIEF_LIEFART'
      Index = 50
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabLIEF_ZAHLART: TZIntegerField
      FieldKind = fkData
      FieldName = 'LIEF_ZAHLART'
      Index = 51
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabLIEF_PRLISTE: TZRawStringField
      FieldKind = fkData
      FieldName = 'LIEF_PRLISTE'
      Index = 52
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object KunTabPR_EBENE: TZShortIntField
      FieldKind = fkData
      FieldName = 'PR_EBENE'
      Index = 53
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabBRUTTO_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 54
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object KunTabMWST_FREI_FLAG: TZRawStringField
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
      Index = 55
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object KunTabKUN_SEIT: TZDateField
      FieldKind = fkData
      FieldName = 'KUN_SEIT'
      Index = 56
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KunTabKUN_GEBDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'KUN_GEBDATUM'
      Index = 57
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KunTabENTFERNUNG: TZUInt64Field
      FieldKind = fkData
      FieldName = 'ENTFERNUNG'
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 59
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KunTabERST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabGEAEND: TZDateField
      FieldKind = fkData
      FieldName = 'GEAEND'
      Index = 61
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KunTabGEAEND_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'GEAEND_NAME'
      Index = 62
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabSHOP_ID: TSmallintField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 63
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabSHOP_KUNDE_ID: TLongintField
      FieldKind = fkData
      FieldName = 'SHOP_KUNDE_ID'
      Index = 64
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabSHOP_CHANGE_FLAG: TWordField
      FieldKind = fkData
      FieldName = 'SHOP_CHANGE_FLAG'
      Index = 65
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabSHOP_DEL_FLAG: TStringField
      FieldKind = fkData
      FieldName = 'SHOP_DEL_FLAG'
      Index = 66
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object KunTabSHOP_PASSWORD: TStringField
      FieldKind = fkData
      FieldName = 'SHOP_PASSWORD'
      Index = 67
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabUSERFELD_01: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_01'
      Index = 68
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_02: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_02'
      Index = 69
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_03: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_03'
      Index = 70
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_04: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_04'
      Index = 71
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_05: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_05'
      Index = 72
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_06: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_06'
      Index = 73
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_07: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_07'
      Index = 74
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_08: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_08'
      Index = 75
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_09: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_09'
      Index = 76
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object KunTabUSERFELD_10: TStringField
      FieldKind = fkData
      FieldName = 'USERFELD_10'
      Index = 77
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 624
    Top = 200
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
      object ArtikelHinzufgen1: TMenuItem
        Caption = 'Artikel hinzufügen'
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
        OnClick = AddTextBtnClick
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
      object N5: TMenuItem
        Caption = '-'
      end
      object SpeichernundBuchen1: TMenuItem
        Caption = 'Speichern und Buchen'
        ImageIndex = 18
        ShortCut = 32848
        OnClick = BuchenBtnClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
        OnClick = Suchen1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        ImageIndex = 15
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        ImageIndex = 16
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
        GroupIndex = 2
        RadioItem = True
        ShortCut = 117
      end
      object Allgemein1: TMenuItem
        Caption = 'Allgemein'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 118
      end
      object Positionen1: TMenuItem
        Caption = 'Positionen'
        RadioItem = True
        ShortCut = 119
      end
      object Fertigstellen1: TMenuItem
        Caption = 'Fertigstellen'
        RadioItem = True
        ShortCut = 123
      end
      object N4: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        GroupIndex = 3
        ImageIndex = 13
        ShortCut = 116
      end
    end
  end
  object OffBestTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = OffBestTabAfterOpen
    SQL.Strings = (
      'select JOURNAL.VRENUM, JOURNAL.RDATUM, JOURNAL.LDATUM,'
      'IFNULL(SUM(JP2.MENGE),0) as MENGE_EK,'
      'IFNULL(JOURNALPOS.MENGE-SUM(JP2.MENGE),JOURNALPOS.MENGE) as MENGE_OFFEN,'
      'JOURNALPOS.MENGE as MENGE_BEST,'
      'JOURNALPOS.REC_ID as POSREC_ID,JOURNALPOS.MATCHCODE, JOURNALPOS.ARTNUM, '
      'JOURNALPOS.ARTIKEL_ID, JOURNALPOS.EPREIS, JOURNALPOS.RABATT, JOURNALPOS.RABATT2, '
      'JOURNALPOS.RABATT3, JOURNALPOS.BEZEICHNUNG'
      'from JOURNALPOS, JOURNAL'
      'left outer join JOURNALPOS as JP2 on JP2.QUELLE_SRC = JOURNALPOS.REC_ID and JP2.ADDR_ID=:AID '
      'where JOURNALPOS.QUELLE=6 and JOURNALPOS.ADDR_ID=:AID '
      'and JOURNALPOS.ARTIKELTYP in (''N'',''S'') and JOURNAL.REC_ID=JOURNALPOS.JOURNAL_ID '
      'and JOURNAL.STADIUM BETWEEN 20 and 99'
      'group by POSREC_ID'
      'having MENGE_OFFEN>0'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '3'
      end>
    Left = 480
    Top = 264
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '3'
      end>
    object OffBestTabVRENUM: TLongintField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OffBestTabRDATUM: TDateField
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
    end
    object OffBestTabLDATUM: TDateField
      FieldKind = fkData
      FieldName = 'LDATUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OffBestTabMENGE_EK: TFloatField
      FieldKind = fkData
      FieldName = 'MENGE_EK'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;-,#0.00,-'
    end
    object OffBestTabMENGE_OFFEN: TFloatField
      FieldKind = fkData
      FieldName = 'MENGE_OFFEN'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;-,#0.00,-'
    end
    object OffBestTabMENGE_BEST: TFloatField
      FieldKind = fkData
      FieldName = 'MENGE_BEST'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;-,#0.00,-'
    end
    object OffBestTabPOSREC_ID: TLongintField
      FieldKind = fkData
      FieldName = 'POSREC_ID'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OffBestTabMATCHCODE: TStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OffBestTabARTNUM: TStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OffBestTabARTIKEL_ID: TLongintField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OffBestTabEPREIS: TFloatField
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.000'
    end
    object OffBestTabRABATT: TFloatField
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.0%'
    end
    object OffBestTabRABATT2: TFloatField
      FieldKind = fkData
      FieldName = 'RABATT2'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.0%'
    end
    object OffBestTabRABATT3: TFloatField
      FieldKind = fkData
      FieldName = 'RABATT3'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.0%'
    end
    object OffBestTabBEZEICHNUNG: TMemoField
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
  end
  object SNTab: TZQuery
    Connection = DM1.DB1
    BeforePost = SNTabBeforePost
    SQL.Strings = (
      'select * from ARTIKEL_SERNUM'
    )
    Params = <>
    Left = 224
    Top = 264
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
    object SNTabEINK_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'EINK_NUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object SNTabEK_JOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'EK_JOURNAL_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object SNTabEK_JOURNALPOS_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'EK_JOURNALPOS_ID'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object SNDS: TDataSource
    DataSet = SNTab
    Left = 288
    Top = 264
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
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 352
    Top = 200
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
      Required = False
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
    object PosTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabMATCHCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBARCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBEZEICHNUNG: TZRawCLobField
      DisplayLabel = 'Artikelbezeichnung'
      DisplayWidth = 80
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
    object PosTabLAENGE: TZRawStringField
      FieldKind = fkData
      FieldName = 'LAENGE'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGROESSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'GROESSE'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabDIMENSION: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIMENSION'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEWICHT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 16
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
      Index = 17
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
      Index = 18
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
      Index = 19
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
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.000;-,###,##0.000; '
      EditFormat = '#0.000'
    end
    object PosTabRABATT: TZDoubleField
      DisplayLabel = 'Rabatt'
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'RABATT'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0"%";-,###,##0.0"%"; '
      EditFormat = '#0.0'
    end
    object PosTabE_RGEWINN: TZDoubleField
      FieldKind = fkData
      FieldName = 'E_RGEWINN'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabGEGENKTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GEGENKTO'
      Index = 23
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
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabMSumme: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MSumme'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabBSumme: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'BSumme'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabSTEUER_CODE: TZSmallIntField
      DisplayLabel = 'S'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 27
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
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 8
    end
    object PosTabALTTEIL_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'ALTTEIL_PROZ'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Precision = 10
    end
    object PosTabMATCH_ARTNUM: TStringField
      DisplayLabel = 'Matchcode'
      FieldKind = fkCalculated
      FieldName = 'MATCH_ARTNUM'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object PosTabQUELLE_SRC: TZIntegerField
      FieldKind = fkData
      FieldName = 'QUELLE_SRC'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabSN_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'SN_FLAG'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object PosTabBRUTTO_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
  end
  object PosDS: TDataSource
    DataSet = PosTab
    OnDataChange = PosDSDataChange
    Left = 408
    Top = 200
  end
  object ReEdiTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ReEdiTabAfterScroll
    BeforeClose = ReEdiTabBeforeClose
    AfterScroll = ReEdiTabAfterScroll
    OnCalcFields = ReEdiTabCalcFields
    BeforePost = ReEdiTabBeforePost
    AfterPost = ReEdiTabAfterPost
    BeforeDelete = ReEdiTabBeforeDelete
    OnNewRecord = ReEdiTabOnNewRecord
    SQL.Strings = (
      'select * FROM JOURNAL'
      'where QUELLE=:QUELLE'
      'order by VRENUM'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    Left = 464
    Top = 200
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
    end
    object ReEdiTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabQUELLE_SUB: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE_SUB'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabATRNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabVLSNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabFOLGENR: TZIntegerField
      FieldKind = fkData
      FieldName = 'FOLGENR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabKM_STAND: TZIntegerField
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabKFZ_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'KFZ_ID'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabVERTRETER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'VERTRETER_ID'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabGLOBRABATT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GLOBRABATT'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabADATUM: TZDateField
      FieldKind = fkData
      FieldName = 'ADATUM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabTERMIN: TZDateField
      FieldKind = fkData
      FieldName = 'TERMIN'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
    end
    object ReEdiTabKOST_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'KOST_NETTO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabWERT_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'WERT_NETTO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabLOHN: TZDoubleField
      FieldKind = fkData
      FieldName = 'LOHN'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabWARE: TZDoubleField
      FieldKind = fkData
      FieldName = 'WARE'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabTKOST: TZDoubleField
      FieldKind = fkData
      FieldName = 'TKOST'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMWST_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMWST_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMWST_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMWST_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMSUMME_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMSUMME_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_1'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMSUMME_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_2'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMSUMME_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_3'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabMSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabBSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabATSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'ATSUMME'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabATMSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'ATMSUMME'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabGEGENKONTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GEGENKONTO'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabSOLL_STAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_STAGE'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabSOLL_SKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_SKONTO'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 5
    end
    object ReEdiTabSOLL_NTAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabSOLL_RATEN: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_RATEN'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabSOLL_RATBETR: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_RATBETR'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabSOLL_RATINTERVALL: TZIntegerField
      FieldKind = fkData
      FieldName = 'SOLL_RATINTERVALL'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabSTADIUM: TZSmallIntField
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabERST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabKUN_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NUM'
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabKUN_NAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabKUN_NAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME3'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabKUN_ABTEILUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ABTEILUNG'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabKUN_STRASSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_STRASSE'
      Index = 49
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabKUN_LAND: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_LAND'
      Index = 50
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object ReEdiTabKUN_PLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_PLZ'
      Index = 51
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object ReEdiTabKUN_ORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ORT'
      Index = 52
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabUSR1: TZRawStringField
      FieldKind = fkData
      FieldName = 'USR1'
      Index = 53
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ReEdiTabUSR2: TZRawStringField
      FieldKind = fkData
      FieldName = 'USR2'
      Index = 54
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ReEdiTabPROJEKT: TZRawStringField
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 55
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ReEdiTabORGNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 56
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabBEST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'BEST_NAME'
      Index = 57
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabBEST_CODE: TZShortIntField
      FieldKind = fkData
      FieldName = 'BEST_CODE'
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 59
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ReEdiTabLIEFART: TZSmallIntField
      FieldKind = fkData
      FieldName = 'LIEFART'
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabZAHLART: TZSmallIntField
      FieldKind = fkData
      FieldName = 'ZAHLART'
      Index = 61
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabNSUMME: TZDoubleField
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 62
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 10
    end
    object ReEdiTabWAEHRUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 63
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 5
    end
    object ReEdiTabRDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 64
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabWV_DatumStr: TStringField
      DisplayLabel = 'Termin'
      FieldKind = fkCalculated
      FieldName = 'WV_Datum-Str'
      Index = 65
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object ReEdiTabZahlart_Str: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Zahlart_Str'
      Index = 66
      KeyFields = 'ZAHLART'
      LookupCache = False
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'LANGBEZ'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object ReEdiTabWaehrung_Str: TStringField
      FieldKind = fkLookup
      FieldName = 'Waehrung_Str'
      Index = 67
      KeyFields = 'WAEHRUNG'
      LookupCache = False
      LookupDataSet = DM1.WhrungTab
      LookupKeyFields = 'WAEHRUNG'
      LookupResultField = 'LANGBEZ'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 68
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
      Index = 69
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 533
    Top = 200
  end
  object OffBestDS: TDataSource
    DataSet = OffBestTab
    Left = 544
    Top = 264
  end
end
