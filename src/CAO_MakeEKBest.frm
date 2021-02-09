object MakeEKBestForm: TMakeEKBestForm
  Left = 330
  Height = 512
  Top = 256
  Width = 722
  Caption = 'Einkauf Bestellung erfassen'
  ClientHeight = 492
  ClientWidth = 722
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
    Height = 492
    Top = 0
    Width = 722
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 492
    ClientWidth = 722
    Color = 14680063
    ParentColor = False
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 722
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 718
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 231
        Align = alLeft
        Caption = '  Einkauf Bestellung bearbeiten ...'
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
        Left = 430
        Height = 23
        Top = 0
        Width = 288
        Align = alRight
        BevelOuter = bvNone
        ClientHeight = 23
        ClientWidth = 288
        TabOrder = 0
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
        object AllgemeinBtn: TSpeedButton
          Tag = 1
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
        object FertigBtn: TSpeedButton
          Tag = 5
          Left = 208
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
      end
    end
    object PC1: TPageControl
      Left = 0
      Height = 465
      Top = 27
      Width = 722
      ActivePage = AdressTS
      Align = alClient
      TabIndex = 1
      TabOrder = 1
      OnChange = PC1Change
      OnChanging = PC1Changing
      object EdiListTS: TTabSheet
        Caption = 'Aus&wahl'
        ClientHeight = 439
        ClientWidth = 714
        object ToolBar3: TToolBar
          Left = 0
          Height = 26
          Top = 413
          Width = 714
          Align = alBottom
          AutoSize = True
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
          Height = 413
          Top = 0
          Width = 714
          Align = alClient
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
              Title.Caption = 'le.Änderung'
              Width = 66
              FieldName = 'RDATUM'
            end          
            item
              Title.Caption = 'Lieferdatum'
              FieldName = 'LDATUM'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Termin'
              Width = 75
              FieldName = 'WV_Datum-Str'
            end          
            item
              Title.Caption = 'erstellt von'
              Width = 80
              FieldName = 'ERST_NAME'
            end>
          DataSource = ReEdiDS
          DefaultRowHeight = 17
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          OnDblClick = DBGrid1DblClick
        end
      end
      object AdressTS: TTabSheet
        Caption = 'All&gemein'
        ClientHeight = 439
        ClientWidth = 714
        object ToolBar2: TToolBar
          Left = 0
          Height = 26
          Top = 413
          Width = 714
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
            Height = 26
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
            Height = 26
            Top = 0
            Caption = 'ToolButton9'
            Style = tbsSeparator
          end
          object GotoPosBtn: TToolButton
            Left = 455
            Top = 0
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoPosBtnClick
          end
        end
        object KundatGBPan: TPanel
          Left = 0
          Height = 70
          Top = 0
          Width = 714
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 70
          ClientWidth = 714
          TabOrder = 1
          object KundatGB: TGroupBox
            Left = 0
            Height = 70
            Top = 0
            Width = 714
            Align = alClient
            Caption = 'Lieferant'
            ClientHeight = 52
            ClientWidth = 710
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
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
              Top = 25
              Width = 82
              AutoSize = False
              Caption = 'Intern-Nr:'
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
              Top = 25
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
            object Label47: TLabel
              Left = 5
              Height = 13
              Top = 4
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
            object Panel2: TPanel
              Left = 88
              Height = 20
              Top = 21
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
              object DBText1: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 97
                Alignment = taCenter
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
              Width = 425
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 425
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
                Top = 4
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
              Top = 21
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
              Top = 21
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
              Top = 21
              Width = 337
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 337
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
            object KuNrEditBtn: TSpeedButton
              Left = 170
              Height = 22
              Top = -2
              Width = 23
              Caption = '...'
              OnClick = KuNrEditButtonClick
            end
            object KuNrEdit: TDBEdit
              Left = 88
              Height = 21
              Top = -1
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
          end
        end
        object Panel7: TPanel
          Left = 0
          Height = 24
          Top = 389
          Width = 714
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 24
          ClientWidth = 714
          TabOrder = 2
          object Panel16: TPanel
            Left = 0
            Height = 24
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel17: TPanel
            Left = 711
            Height = 24
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel18: TPanel
            Left = 3
            Height = 24
            Top = 0
            Width = 708
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 24
            ClientWidth = 708
            TabOrder = 2
            object Label34: TLabel
              Left = 0
              Height = 24
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
            object Panel19: TPanel
              Left = 608
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BevelWidth = 2
              ClientHeight = 24
              ClientWidth = 100
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
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
            object Label39: TLabel
              Left = 552
              Height = 24
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
            object Panel27: TPanel
              Left = 467
              Height = 24
              Top = 0
              Width = 85
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 85
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object DBText16: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 85
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'MSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Label37: TLabel
              Left = 411
              Height = 24
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
              Left = 311
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 100
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object DBText17: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'NSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Label36: TLabel
              Left = 255
              Height = 24
              Top = 0
              Width = 56
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
          end
        end
        object GBPanel: TPanel
          Left = 0
          Height = 164
          Top = 70
          Width = 714
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 164
          ClientWidth = 714
          TabOrder = 3
          object CaoGroupBox3: TGroupBox
            Left = 0
            Height = 164
            Top = 0
            Width = 328
            Align = alLeft
            Caption = 'Zuweisungen'
            ClientHeight = 146
            ClientWidth = 324
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label23: TLabel
              Left = 5
              Height = 13
              Top = 4
              Width = 79
              AutoSize = False
              Caption = 'Projekt.:'
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
              Top = 28
              Width = 79
              AutoSize = False
              Caption = 'Referenz-Nr.:'
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
              Top = 51
              Width = 79
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
              Top = 75
              Width = 79
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
              Top = 101
              Width = 79
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
              Top = 123
              Width = 79
              AutoSize = False
              Caption = 'Liefer-Datum:'
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
              Top = 101
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
              Top = 101
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
              Top = 101
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
            object Projekt: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 232
              DataField = 'PROJEKT'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
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
            object Ref_Num: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
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
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
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
            object waehrung: TDBEdit
              Left = 88
              Height = 21
              Top = 72
              Width = 28
              DataField = 'WAEHRUNG'
              DataSource = ReEdiDS
              AutoSelect = False
              AutoSize = False
              Enabled = False
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
            object DBEdit13: TDBEdit
              Left = 88
              Height = 21
              Top = 96
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
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit14: TDBEdit
              Left = 152
              Height = 21
              Top = 96
              Width = 40
              DataField = 'SOLL_SKONTO'
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
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit15: TDBEdit
              Left = 232
              Height = 21
              Top = 96
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
              TabOrder = 6
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object ZahlartDB: TDBLookupComboBox
              Tag = 1
              Left = 119
              Height = 21
              Top = 48
              Width = 201
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
              TabOrder = 7
            end
            object WaehrungCB: TDBLookupComboBox
              Tag = 1
              Left = 119
              Height = 21
              Top = 72
              Width = 201
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
              TabOrder = 8
            end
            object LIE_Datum: TRxDBDateEdit
              Left = 88
              Height = 21
              Top = 120
              Width = 101
              AutoSelect = False
              AutoSize = False
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
              TabOrder = 9
              Text = '  .  .    '
              YearDigits = dyFour
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              DataField = 'LDATUM'
              DataSource = ReEdiDS
            end
            object GlobRabatt: TDBEdit
              Left = 232
              Height = 21
              Top = 120
              Width = 88
              DataField = 'GLOBRABATT'
              DataSource = ReEdiDS
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              MaxLength = 0
              ParentFont = False
              TabOrder = 10
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object LiefanschrGB: TGroupBox
            Left = 328
            Height = 164
            Top = 0
            Width = 386
            Align = alClient
            Caption = 'Lieferanschrift'
            ClientHeight = 146
            ClientWidth = 382
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label14: TLabel
              Left = 3
              Height = 13
              Top = 4
              Width = 79
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
              Left = 3
              Height = 13
              Top = 28
              Width = 79
              AutoSize = False
              Caption = 'Name 1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label17: TLabel
              Left = 3
              Height = 13
              Top = 51
              Width = 79
              AutoSize = False
              Caption = 'Name 2:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label21: TLabel
              Left = 3
              Height = 13
              Top = 75
              Width = 79
              AutoSize = False
              Caption = 'Name 3:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label24: TLabel
              Left = 3
              Height = 13
              Top = 101
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
            object Label25: TLabel
              Left = 3
              Height = 13
              Top = 123
              Width = 79
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
              Left = 86
              Height = 21
              Top = 0
              Width = 187
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 0
              Visible = False
            end
            object L_Name1: TEdit
              Left = 86
              Height = 21
              Top = 24
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object L_Name2: TEdit
              Left = 86
              Height = 21
              Top = 48
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 2
            end
            object L_Name3: TEdit
              Left = 86
              Height = 21
              Top = 72
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 3
            end
            object L_Strasse: TEdit
              Left = 86
              Height = 21
              Top = 96
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 4
            end
            object L_LAND: TEdit
              Left = 86
              Height = 21
              Top = 120
              Width = 19
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object L_PLZ: TEdit
              Left = 108
              Height = 21
              Top = 120
              Width = 54
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object L_Ort: TEdit
              Left = 164
              Height = 21
              Top = 120
              Width = 213
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 7
            end
            object LiefAnschriftDelBtn: TSpeedButton
              Left = 278
              Height = 21
              Hint = 'Lieferanschrift löschen'
              Top = 0
              Width = 25
              Flat = True
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
              ParentShowHint = False
            end
            object blGlyphLeft: TSpeedButton
              Left = 308
              Height = 21
              Hint = 'Lieferanschrift auswählen'
              Top = 0
              Width = 25
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
        object InfoGBPan: TPanel
          Left = 0
          Height = 155
          Top = 234
          Width = 714
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 155
          ClientWidth = 714
          TabOrder = 4
          object InfoGB: TGroupBox
            Left = 0
            Height = 155
            Top = 0
            Width = 714
            Align = alClient
            Caption = 'Info'
            ClientHeight = 137
            ClientWidth = 710
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RechInfoMemo: TDBMemo
              Left = 0
              Height = 137
              Hint = 'Zeilenumbruch mit Strg+Enter'
              Top = 0
              Width = 710
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
              ParentShowHint = False
              ScrollBars = ssVertical
              ShowHint = True
              TabOrder = 0
            end
          end
        end
      end
      object PosTS: TTabSheet
        Caption = 'P&ositionen'
        ClientHeight = 439
        ClientWidth = 714
        object ToolBar1: TToolBar
          Left = 0
          Height = 26
          Top = 413
          Width = 714
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 23
          Caption = 'ToolBar1'
          Color = clBtnFace
          EdgeBorders = []
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
            Top = 0
            AutoSize = True
            Caption = 'Löschen'
            ImageIndex = 6
            OnClick = DelBtnClick
          end
          object UpBtn: TToolButton
            Left = 241
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 3
            OnClick = UpBtnClick
          end
          object DownBtn: TToolButton
            Left = 292
            Top = 0
            AutoSize = True
            Caption = 'Pos.'
            ImageIndex = 4
            OnClick = DownBtnClick
          end
          object DBNavigator2: TDBNavigator
            Left = 343
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
            Left = 463
            Height = 8
            Top = 0
            Caption = 'ToolButton2'
            Style = tbsSeparator
          end
          object GotoFertigBtn: TToolButton
            Left = 471
            Top = 0
            AutoSize = True
            Caption = 'Weiter'
            ImageIndex = 9
            OnClick = GotoFertigBtnClick
          end
        end
        object KundatGBPan1: TPanel
          Left = 0
          Height = 70
          Top = 0
          Width = 714
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 70
          ClientWidth = 714
          TabOrder = 1
          object KundatGB4: TGroupBox
            Left = 0
            Height = 70
            Top = 0
            Width = 714
            Align = alClient
            Caption = 'Lieferant'
            ClientHeight = 52
            ClientWidth = 710
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
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
              Top = 25
              Width = 82
              AutoSize = False
              Caption = 'Intern-Nr:'
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
              Top = 25
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
            object Label5: TLabel
              Left = 5
              Height = 13
              Top = 4
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
            object Panel13: TPanel
              Left = 88
              Height = 20
              Top = 21
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
              object DBText11: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 97
                Alignment = taCenter
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
              Width = 425
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 425
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object DBText9: TDBText
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
            object Panel6: TPanel
              Left = 280
              Height = 20
              Top = 21
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
            object Panel4: TPanel
              Left = 308
              Height = 20
              Top = 21
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
              TabOrder = 3
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
              Left = 368
              Height = 20
              Top = 21
              Width = 337
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 337
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              object DBText3: TDBText
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
              TabOrder = 5
              object DBText23: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 97
                Alignment = taCenter
                AutoSize = False
                DataField = 'VRENUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Height = 24
          Top = 389
          Width = 714
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 24
          ClientWidth = 714
          TabOrder = 2
          object Panel14: TPanel
            Left = 0
            Height = 24
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel15: TPanel
            Left = 711
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
            Width = 708
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 24
            ClientWidth = 708
            TabOrder = 2
            object Label33: TLabel
              Left = 0
              Height = 24
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
            object bsumpan: TPanel
              Left = 608
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BevelWidth = 2
              ClientHeight = 24
              ClientWidth = 100
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object DBText10: TDBText
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
            object Label20: TLabel
              Left = 552
              Height = 24
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
            object msumpan: TPanel
              Left = 467
              Height = 24
              Top = 0
              Width = 85
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 85
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object DBText25: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 85
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'MSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Label19: TLabel
              Left = 411
              Height = 24
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
            object nsumpan: TPanel
              Left = 311
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 100
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object DBText26: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'NSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Label18: TLabel
              Left = 255
              Height = 24
              Top = 0
              Width = 56
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
          end
        end
        object Panel36: TPanel
          Left = 0
          Height = 319
          Top = 70
          Width = 714
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 319
          ClientWidth = 714
          TabOrder = 3
          object BestVorGB: TGroupBox
            Left = 0
            Height = 101
            Top = 218
            Width = 714
            Align = alBottom
            Caption = 'Bestellvorschlag'
            ClientHeight = 83
            ClientWidth = 710
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object OffBestGrid: TDBGrid
              Left = 0
              Height = 83
              Top = 0
              Width = 710
              Align = alClient
              BorderStyle = bsNone
              Color = clWindow
              Columns = <              
                item
                  Title.Caption = 'REC_ID'
                  Visible = False
                  FieldName = 'REC_ID'
                end              
                item
                  Title.Caption = 'Match'
                  Width = 80
                  FieldName = 'MATCHCODE'
                end              
                item
                  Title.Caption = 'Artikelnummer'
                  Width = 80
                  FieldName = 'ARTNUM'
                end              
                item
                  Title.Caption = 'Lief.-Bestellnummmer'
                  Width = 80
                  FieldName = 'LIEF_BESTNUM'
                end              
                item
                  Title.Caption = 'Bezeichnung'
                  Width = 180
                  FieldName = 'KURZNAME'
                end              
                item
                  Title.Caption = 'Verkauft'
                  Width = 50
                  FieldName = 'VK_MENGE'
                end              
                item
                  Title.Caption = 'Lager'
                  Width = 50
                  FieldName = 'MENGE_AKT'
                end              
                item
                  Title.Caption = 'Mind.-Best.'
                  Width = 50
                  FieldName = 'MENGE_MIN'
                end              
                item
                  Title.Caption = 'Bestellt'
                  Width = 50
                  FieldName = 'MENGE_BESTELLT'
                end              
                item
                  Title.Caption = 'Best.-Edi'
                  Width = 50
                  FieldName = 'MENGE_EKBEST_EDI'
                end              
                item
                  Title.Caption = 'Fehlmenge'
                  Width = 50
                  FieldName = 'MENGE_DIV'
                end              
                item
                  Title.Caption = 'Bestvor.'
                  Width = 50
                  FieldName = 'MENGE_BVOR'
                end>
              DataSource = BVorDS
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentFont = False
              TabOrder = 1
              OnContextPopup = OffBestGridContextPopup
              OnDblClick = OffBestGridDblClick
            end
            object BestOnlyVK_CB: TCheckBox
              Left = 112
              Height = 19
              Top = -16
              Width = 131
              AutoSize = False
              Caption = 'nur verkaufte Aktikel'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnClick = BestOnlyVK_CBClick
              ParentFont = False
              TabOrder = 0
            end
          end
          object OffBestSplitter: TSplitter
            Cursor = crVSplit
            Left = 0
            Height = 5
            Top = 213
            Width = 714
            Align = alBottom
            ResizeAnchor = akBottom
          end
          object BestPosGB: TGroupBox
            Left = 0
            Height = 213
            Top = 0
            Width = 714
            Align = alClient
            Caption = 'Positionen'
            ClientHeight = 195
            ClientWidth = 710
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object PosGrid: TRxDBGrid
              Left = 0
              Height = 195
              Top = 0
              Width = 710
              ColumnDefValues.BlobText = '(blob)'
              TitleButtons = False
              AutoSort = True
              Columns = <              
                item
                  Alignment = taCenter
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
                  Title.Alignment = taLeftJustify
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
              DefaultRowHeight = 29
              Flat = True
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyDown = PosGridKeyDown
              OnKeyPress = PosGridKeyPress
            end
          end
        end
      end
      object Fertig: TTabSheet
        Caption = '&Fertig'
        ClientHeight = 439
        ClientWidth = 714
        object ToolBar5: TToolBar
          Left = 0
          Height = 26
          Top = 413
          Width = 714
          Align = alBottom
          AutoSize = True
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
            AutoSize = True
            Caption = 'Speichern und Bestellen '
            ImageIndex = 11
            OnClick = BuchenBtnClick
          end
        end
        object KundatGBPan2: TPanel
          Left = 0
          Height = 70
          Top = 0
          Width = 714
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 70
          ClientWidth = 714
          TabOrder = 1
          object KundatGB5: TGroupBox
            Left = 0
            Height = 70
            Top = 0
            Width = 714
            Align = alClient
            Caption = 'Lieferant'
            ClientHeight = 52
            ClientWidth = 710
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
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
              Top = 25
              Width = 82
              AutoSize = False
              Caption = 'Intern-Nr:'
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
              Top = 25
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
            object Label13: TLabel
              Left = 5
              Height = 13
              Top = 4
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
            object Panel24: TPanel
              Left = 88
              Height = 20
              Top = 21
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
              object DBText22: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 97
                Alignment = taCenter
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
              Width = 425
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 425
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object DBText21: TDBText
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
            object Panel22: TPanel
              Left = 280
              Height = 20
              Top = 21
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
              object DBText20: TDBText
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
            object Panel20: TPanel
              Left = 308
              Height = 20
              Top = 21
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
              TabOrder = 3
              object DBText18: TDBText
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
            object Panel21: TPanel
              Left = 368
              Height = 20
              Top = 21
              Width = 337
              Alignment = taRightJustify
              Anchors = [akTop, akLeft, akRight]
              BevelOuter = bvLowered
              ClientHeight = 20
              ClientWidth = 337
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              object DBText19: TDBText
                Left = 2
                Height = 13
                Top = 4
                Width = 158
                AutoSize = False
                DataField = 'KUN_ORT'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
            object Panel26: TPanel
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
              TabOrder = 5
              object DBText24: TDBText
                Left = 3
                Height = 13
                Top = 4
                Width = 97
                Alignment = taCenter
                AutoSize = False
                DataField = 'VRENUM'
                DataSource = ReEdiDS
                ParentColor = False
              end
            end
          end
        end
        object Panel29: TPanel
          Left = 0
          Height = 24
          Top = 389
          Width = 714
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 24
          ClientWidth = 714
          TabOrder = 2
          object Panel30: TPanel
            Left = 0
            Height = 24
            Top = 0
            Width = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel31: TPanel
            Left = 711
            Height = 24
            Top = 0
            Width = 3
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel32: TPanel
            Left = 3
            Height = 24
            Top = 0
            Width = 708
            Align = alClient
            BevelOuter = bvNone
            ClientHeight = 24
            ClientWidth = 708
            TabOrder = 2
            object Label30: TLabel
              Left = 0
              Height = 24
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
            object Panel33: TPanel
              Left = 608
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              BevelWidth = 2
              ClientHeight = 24
              ClientWidth = 100
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object DBText27: TDBText
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
            object Label42: TLabel
              Left = 552
              Height = 24
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
            object Panel34: TPanel
              Left = 467
              Height = 24
              Top = 0
              Width = 85
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 85
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object DBText28: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 85
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'MSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Label41: TLabel
              Left = 411
              Height = 24
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
              Left = 311
              Height = 24
              Top = 0
              Width = 100
              Align = alRight
              Alignment = taRightJustify
              BevelOuter = bvNone
              ClientHeight = 24
              ClientWidth = 100
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object DBText29: TDBText
                Left = 0
                Height = 24
                Top = 0
                Width = 100
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'NSUMME'
                DataSource = ReEdiDS
                Layout = tlCenter
                ParentColor = False
              end
            end
            object Label40: TLabel
              Left = 255
              Height = 24
              Top = 0
              Width = 56
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
          end
        end
        object Panel3: TPanel
          Left = 0
          Height = 164
          Top = 70
          Width = 714
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 164
          ClientWidth = 714
          TabOrder = 3
          object CaoGroupBox1: TGroupBox
            Left = 0
            Height = 164
            Top = 0
            Width = 328
            Align = alLeft
            Caption = 'Zuweisungen'
            ClientHeight = 146
            ClientWidth = 324
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
              Top = 4
              Width = 79
              AutoSize = False
              Caption = 'Projekt.:'
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
              Top = 28
              Width = 79
              AutoSize = False
              Caption = 'Referenz-Nr.:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label29: TLabel
              Left = 5
              Height = 13
              Top = 51
              Width = 79
              AutoSize = False
              Caption = 'Zahlart:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label43: TLabel
              Left = 5
              Height = 13
              Top = 75
              Width = 79
              AutoSize = False
              Caption = 'Währung:'
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
              Top = 101
              Width = 79
              AutoSize = False
              Caption = 'Zahlungsziel:'
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
              Top = 123
              Width = 79
              AutoSize = False
              Caption = 'Liefer-Datum:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label46: TLabel
              Left = 119
              Height = 13
              Top = 101
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
            object Label48: TLabel
              Left = 193
              Height = 13
              Top = 101
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
            object Label49: TLabel
              Left = 264
              Height = 13
              Top = 101
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
            object DBEdit1: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 0
              Width = 232
              DataField = 'PROJEKT'
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
              TabOrder = 0
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit2: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 24
              Width = 232
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
              TabOrder = 1
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit3: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 48
              Width = 232
              DataField = 'Zahlart_Str'
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
              TabOrder = 2
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit4: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 72
              Width = 232
              DataField = 'Waehrung_Str'
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
              TabOrder = 3
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit5: TDBEdit
              Left = 88
              Height = 21
              Top = 96
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
              TabOrder = 4
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit6: TDBEdit
              Left = 152
              Height = 21
              Top = 96
              Width = 40
              DataField = 'SOLL_SKONTO'
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
              TabOrder = 5
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit7: TDBEdit
              Left = 232
              Height = 21
              Top = 96
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
              TabOrder = 6
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
            object DBEdit8: TDBEdit
              Tag = 1
              Left = 88
              Height = 21
              Top = 120
              Width = 232
              DataField = 'LDATUM'
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
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
            end
          end
          object CaoGroupBox2: TGroupBox
            Left = 328
            Height = 164
            Top = 0
            Width = 386
            Align = alClient
            Caption = 'Lieferanschrift'
            ClientHeight = 146
            ClientWidth = 382
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label56: TLabel
              Left = 3
              Height = 13
              Top = 4
              Width = 79
              AutoSize = False
              Caption = 'Anrede:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label55: TLabel
              Left = 3
              Height = 13
              Top = 28
              Width = 79
              AutoSize = False
              Caption = 'Name 1:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label54: TLabel
              Left = 3
              Height = 13
              Top = 51
              Width = 79
              AutoSize = False
              Caption = 'Name 2:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label52: TLabel
              Left = 3
              Height = 13
              Top = 75
              Width = 79
              AutoSize = False
              Caption = 'Name 3:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object Label51: TLabel
              Left = 3
              Height = 13
              Top = 101
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
            object Label50: TLabel
              Left = 3
              Height = 13
              Top = 123
              Width = 79
              AutoSize = False
              Caption = 'Land/PLZ/Ort:'
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              ParentColor = False
              ParentFont = False
            end
            object l_anrede2: TEdit
              Left = 86
              Height = 21
              Top = 0
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 0
              Visible = False
            end
            object l_name1_2: TEdit
              Left = 86
              Height = 21
              Top = 24
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 1
            end
            object l_name2_2: TEdit
              Left = 86
              Height = 21
              Top = 48
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 2
            end
            object l_name3_2: TEdit
              Left = 86
              Height = 21
              Top = 72
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 3
            end
            object l_strasse2: TEdit
              Left = 86
              Height = 21
              Top = 96
              Width = 291
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 4
            end
            object l_land2: TEdit
              Left = 86
              Height = 21
              Top = 120
              Width = 19
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 5
            end
            object l_plz2: TEdit
              Left = 108
              Height = 21
              Top = 120
              Width = 54
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 6
            end
            object l_ort2: TEdit
              Left = 164
              Height = 21
              Top = 120
              Width = 213
              Anchors = [akTop, akLeft, akRight]
              AutoSize = False
              AutoSelect = False
              Color = clBtnFace
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Quality = fqAntialiased
              OnEnter = RechInfoMemoEnter
              OnExit = RechInfoMemoExit
              OnKeyDown = KuNrEditKeyDown
              OnKeyPress = KuNrEditKeyPress
              ParentFont = False
              TabOrder = 7
            end
          end
        end
        object ErrGBPan: TPanel
          Left = 0
          Height = 155
          Top = 234
          Width = 714
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 155
          ClientWidth = 714
          TabOrder = 4
          object CaoGroupBox4: TGroupBox
            Left = 0
            Height = 155
            Top = 0
            Width = 714
            Align = alClient
            Caption = 'festgestellte Probleme'
            ClientHeight = 137
            ClientWidth = 710
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Quality = fqAntialiased
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object ProblemLab: TLabel
              Left = 0
              Height = 137
              Top = 0
              Width = 710
              Align = alClient
              Alignment = taCenter
              AutoSize = False
              Caption = 'keine'
              Font.Color = clWindowText
              Font.Height = -16
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
    Left = 128
    Top = 208
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
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
    Left = 184
    Top = 208
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
      Required = False
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
      Required = False
    end
    object ArtikelTabWARENGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'WARENGRUPPE'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtikelTabMENGE_AKT: TZDoubleField
      FieldKind = fkData
      FieldName = 'MENGE_AKT'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
    object ArtikelTabNO_PROVISION_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_PROVISION_FLAG'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabNO_BEZEDIT_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_BEZEDIT_FLAG'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabNO_EK_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_EK_FLAG'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabNO_VK_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'NO_VK_FLAG'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabSN_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'SN_FLAG'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ArtikelTabVPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'VPE'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '8488'
      end>
    Left = 248
    Top = 208
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
      Alignment = taCenter
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
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabMATCHCODE: TZRawStringField
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
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 18
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
      DisplayFormat = ',###,##0.000;-,###,##0.000; '
      EditFormat = '#0.000'
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
      EditFormat = '#0.0'
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
    object PosTabNSumme: TCurrencyField
      DisplayLabel = 'G-Preis'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'NSumme'
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
    object PosTabBSumme: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'BSumme'
      Index = 29
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
      Index = 30
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
    object PosTabALTTEIL_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'ALTTEIL_FLAG'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object PosTabBEZ_FEST_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BEZ_FEST_FLAG'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object PosTabBRUTTO_FLAG: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'BRUTTO_FLAG'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object PosTabVPE: TZUInt64Field
      FieldKind = fkData
      FieldName = 'VPE'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object PosTabSN_FLAG: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'SN_FLAG'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
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
    Left = 448
    Top = 208
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
    end
    object ReEdiTabFOLGENR: TZIntegerField
      FieldKind = fkData
      FieldName = 'FOLGENR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
      DisplayFormat = 'dd.mm.yyyy'
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
      Visible = False
      DisplayFormat = 'dd.mm.yyyy'
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
      Required = True
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
      Visible = False
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
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 41
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
      Index = 42
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
      Index = 43
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKUN_ANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 44
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
      Visible = False
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
      Visible = False
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
      Visible = False
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
      Visible = False
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
      Visible = False
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
      Visible = False
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
      Visible = False
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
      Visible = False
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
      Visible = False
      Size = 80
    end
    object ReEdiTabPROJEKT: TZRawStringField
      DisplayLabel = 'Projekt / Beschreibung'
      FieldKind = fkData
      FieldName = 'PROJEKT'
      Index = 55
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabORGNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 56
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabBEST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'BEST_NAME'
      Index = 57
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
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 59
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
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '#0'
    end
    object ReEdiTabZAHLART: TZSmallIntField
      FieldKind = fkData
      FieldName = 'ZAHLART'
      Index = 61
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '#0'
    end
    object ReEdiTabNSUMME: TZDoubleField
      DisplayLabel = 'Gesamt (netto)'
      DisplayWidth = 9
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 62
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
      Index = 63
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
      Index = 64
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
    object StringField1: TStringField
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
    object ReEdiTabLIEF_ADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'LIEF_ADDR_ID'
      Index = 68
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 69
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
      Index = 70
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
  end
  object BVorTab: TZQuery
    Connection = DM1.DB1
    BeforeOpen = BVorTabBeforeOpen
    AfterOpen = BVorTabAfterOpen
    SQL.Strings = (
      'select A.REC_ID, A.KURZNAME, A.MATCHCODE, A.ARTNUM,AP.BESTNUM as LIEF_BESTNUM,'
      'SUM(JP2.MENGE) as VK_MENGE, A.MENGE_AKT,'
      'SUM(JP2.MENGE) - A.MENGE_AKT - A.MENGE_BESTELLT -'
      'SUM(JP1.MENGE) + A.MENGE_MIN as MENGE_DIV,'
      'A.MENGE_BESTELLT, SUM(JP1.MENGE) as MENGE_EKBEST_EDI, A.MENGE_BVOR,'
      'A.MENGE_MIN from ARTIKEL A'
      'LEFT OUTER JOIN ARTIKEL_PREIS AP ON AP.ARTIKEL_ID=A.REC_ID'
      'LEFT OUTER JOIN JOURNALPOS JP1 on JP1.ARTIKEL_ID=A.REC_ID and JP1.QUELLE=16'
      'LEFT OUTER JOIN JOURNALPOS JP2 on JP2.ARTIKEL_ID=A.REC_ID and JP2.QUELLE=13'
      'where A.ARTIKELTYP="N" and AP.ADRESS_ID=:AID'
      'group by A.REC_ID'
      'having A.MENGE_AKT + A.MENGE_BESTELLT < VK_MENGE + A.MENGE_MIN'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '-1'
      end>
    Left = 592
    Top = 208
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
        Value = '-1'
      end>
    object BVorTabKURZNAME: TZRawStringField
      DisplayLabel = 'Bezeichnung'
      FieldKind = fkData
      FieldName = 'KURZNAME'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object BVorTabMATCHCODE: TZRawStringField
      DisplayLabel = 'Match'
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object BVorTabARTNUM: TZRawStringField
      DisplayLabel = 'Artikelnummer'
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object BVorTabLIEF_BESTNUM: TZRawStringField
      DisplayLabel = 'Lief.-Bestellnummmer'
      FieldKind = fkData
      FieldName = 'LIEF_BESTNUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object BVorTabVK_MENGE: TZDoubleField
      DisplayLabel = 'Verkauft'
      FieldKind = fkData
      FieldName = 'VK_MENGE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0.00;,#0.00;-'
    end
    object BVorTabMENGE_AKT: TZDoubleField
      DisplayLabel = 'Lager'
      FieldKind = fkData
      FieldName = 'MENGE_AKT'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0.00'
    end
    object BVorTabMENGE_DIV: TZDoubleField
      DisplayLabel = 'Fehlmenge'
      FieldKind = fkData
      FieldName = 'MENGE_DIV'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      DisplayFormat = ',#0.00;-;-'
    end
    object BVorTabMENGE_BESTELLT: TZDoubleField
      DisplayLabel = 'Bestellt'
      FieldKind = fkData
      FieldName = 'MENGE_BESTELLT'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0.00;,#0.00;-'
    end
    object BVorTabMENGE_EKBEST_EDI: TZDoubleField
      DisplayLabel = 'Best.-Edi'
      FieldKind = fkData
      FieldName = 'MENGE_EKBEST_EDI'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = ',#0.00;,#0.00;-'
    end
    object BVorTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object BVorTabMENGE_BVOR: TZDoubleField
      DisplayLabel = 'Bestvor.'
      FieldKind = fkData
      FieldName = 'MENGE_BVOR'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;-;-'
    end
    object BVorTabMENGE_MIN: TZDoubleField
      DisplayLabel = 'Mind.-Best.'
      FieldKind = fkData
      FieldName = 'MENGE_MIN'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00;-;-'
    end
  end
  object BVorDS: TDataSource
    DataSet = BVorTab
    Left = 640
    Top = 208
  end
  object ReEdiDS: TDataSource
    DataSet = ReEdiTab
    OnDataChange = ReEdiDSDataChange
    Left = 488
    Top = 208
  end
  object PosDS: TDataSource
    DataSet = PosTab
    Left = 296
    Top = 208
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 536
    Top = 208
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
      object SpeichernundBuchen1: TMenuItem
        Caption = 'Speichern und Bestellen'
        ImageIndex = 18
        ShortCut = 32848
      end
      object N5: TMenuItem
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
        Caption = 'Auswahl'
        Checked = True
        GroupIndex = 2
        RadioItem = True
        ShortCut = 117
        OnClick = GotoAuswahlBtnClick
      end
      object Allgemein1: TMenuItem
        Caption = 'Allgemein'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 118
        OnClick = GotoAllgBtnClick
      end
      object Positionen1: TMenuItem
        Caption = 'Positionen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 119
        OnClick = GotoPosBtnClick
      end
      object Fertigstellen1: TMenuItem
        Caption = 'Fertigstellen'
        GroupIndex = 2
        RadioItem = True
        ShortCut = 123
        OnClick = GotoFertigBtnClick
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
        OnClick = Aktualisieren1Click
      end
    end
  end
  object AddBestVorschlagPopup: TPopupMenu
    Left = 376
    Top = 208
    object ausgewArtikelhinzufgen1: TMenuItem
      Caption = 'ausgew. Artikel hinzufügen'
      OnClick = ausgewArtikelhinzufgen1Click
    end
  end
  object ArtikelPopupMenu: TPopupMenu
    Images = MainForm.ImageList1
    Left = 376
    Top = 272
    object freierArtikel1: TMenuItem
      Caption = 'freien Artikel hinzufügen'
      ImageIndex = 20
      OnClick = NeuFrArtBtnClick
    end
    object Text1: TMenuItem
      Caption = 'Text hinzufügen'
      ImageIndex = 20
      OnClick = NeuKomBtnClick
    end
  end
end
