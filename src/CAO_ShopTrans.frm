object ShopTransForm: TShopTransForm
  Left = 373
  Height = 523
  Top = 256
  Width = 829
  HorzScrollBar.Page = 722
  VertScrollBar.Page = 331
  AutoScroll = True
  Caption = 'ShopTransfer'
  ClientHeight = 523
  ClientWidth = 829
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  Menu = MainMenu1
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnDestroy = FormDestroy
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object MainPanel: TPanel
    Left = 0
    Height = 523
    Top = 0
    Width = 829
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 523
    ClientWidth = 829
    TabOrder = 0
    object ArtPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 829
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 825
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 123
        Align = alLeft
        Caption = '  Shop-Transfer ...'
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object PedHaendBtn: TSpeedButton
        Tag = 1
        Left = 403
        Height = 22
        Top = 2
        Width = 72
        Caption = 'Artikel'
        Flat = True
        Visible = False
      end
      object KatalogBtn: TSpeedButton
        Tag = 1
        Left = 524
        Height = 22
        Top = 2
        Width = 97
        Caption = 'Kategorien'
        Flat = True
        Visible = False
      end
      object BestellungenBtn: TSpeedButton
        Tag = 1
        Left = 633
        Height = 22
        Top = 2
        Width = 85
        Caption = 'Bestellungen'
        Flat = True
        Visible = False
      end
    end
    object PC1: TPageControl
      Left = 0
      Height = 496
      Top = 27
      Width = 829
      ActivePage = ArtikelTS
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      OnChange = PC1Change
      object ArtikelTS: TTabSheet
        Caption = 'Artikel'
        ClientHeight = 470
        ClientWidth = 821
        object Panel5: TPanel
          Left = 0
          Height = 22
          Top = 0
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 22
          ClientWidth = 821
          TabOrder = 0
          object Label5: TLabel
            Left = 8
            Height = 13
            Top = 5
            Width = 242
            Caption = 'Liste der Artikel (max 100 Artikel werden mitgeloggt)'
            ParentColor = False
          end
          object Label6: TLabel
            Left = 360
            Height = 13
            Top = 5
            Width = 43
            Caption = 'Fehlerlog'
            ParentColor = False
          end
        end
        object Panel6: TPanel
          Left = 0
          Height = 171
          Top = 22
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 171
          ClientWidth = 821
          TabOrder = 1
          object PLB1: TListBox
            Left = 0
            Height = 171
            Top = 0
            Width = 355
            Align = alLeft
            ItemHeight = 0
            TabOrder = 0
          end
          object PLog: TListBox
            Left = 355
            Height = 171
            Top = 0
            Width = 466
            Align = alClient
            ItemHeight = 0
            TabOrder = 1
          end
        end
        object Splitter2: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 193
          Width = 821
          Align = alTop
          ResizeAnchor = akTop
        end
        object Panel7: TPanel
          Left = 0
          Height = 272
          Top = 198
          Width = 821
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 272
          ClientWidth = 821
          TabOrder = 3
          object Panel8: TPanel
            Left = 0
            Height = 30
            Top = 242
            Width = 821
            Align = alBottom
            BevelOuter = bvNone
            ClientHeight = 30
            ClientWidth = 821
            TabOrder = 0
            object ShopArtReadBtn: TButton
              Tag = 1
              Left = 0
              Height = 25
              Top = 4
              Width = 75
              Caption = 'Einlesen'
              OnClick = ShopBestReadBtnClick
              TabOrder = 0
            end
            object ImportArtikelBtn: TBitBtn
              Left = 88
              Height = 25
              Top = 4
              Width = 105
              Caption = 'Import'
              Enabled = False
              OnClick = ImportArtikelBtnClick
              TabOrder = 1
            end
            object ImportAlleArtikelBtn: TBitBtn
              Left = 205
              Height = 25
              Top = 4
              Width = 140
              Caption = 'alle Artikel importieren'
              Enabled = False
              OnClick = ImportAlleArtikelBtnClick
              TabOrder = 2
            end
            object ArtRefreshBtn: TBitBtn
              Left = 352
              Height = 25
              Top = 4
              Width = 133
              Caption = 'Artikel aktualisieren'
              Enabled = False
              OnClick = ArtRefreshBtnClick
              TabOrder = 3
            end
            object Label8: TLabel
              Left = 504
              Height = 1
              Top = 8
              Width = 1
              ParentColor = False
            end
          end
          object ExRxDBGrid1: TRxDBGrid
            Left = 0
            Height = 242
            Top = 0
            Width = 821
            ColumnDefValues.BlobText = '(blob)'
            TitleButtons = True
            AutoSort = True
            Columns = <            
              item
                Alignment = taRightJustify
                Title.Alignment = taLeftJustify
                Title.Orientation = toHorizontal
                Title.Caption = 'ArtID'
                Width = 35
                FieldName = 'ID'
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
                Title.Caption = 'Importiert'
                Width = 48
                FieldName = 'Importiert'
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
                Title.Caption = 'Existiert'
                Width = 40
                FieldName = 'ArtikelExists'
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
                Title.Caption = 'Modell'
                Width = 80
                FieldName = 'Modell'
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
                Title.Caption = 'Menge'
                Width = 39
                FieldName = 'Menge'
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
                Title.Caption = 'Preis'
                FieldName = 'Preis'
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
                Title.Alignment = taCenter
                Title.Orientation = toHorizontal
                Title.Caption = 'Status'
                Width = 35
                FieldName = 'Status'
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
                Title.Caption = 'Bild'
                Width = 80
                FieldName = 'Bild'
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
                Title.Caption = 'MwStID'
                Width = 25
                FieldName = 'MwStID'
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
                Title.Caption = 'TextDE'
                Width = 385
                FieldName = 'TextDE'
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
            DataSource = OscArt_DS
            DefaultRowHeight = 30
            Flat = True
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgHeaderPushedLook]
            ReadOnly = True
            Scrollbars = ssHorizontal
            TabOrder = 1
          end
        end
      end
      object KatTS: TTabSheet
        Caption = 'Katalog'
        ClientHeight = 470
        ClientWidth = 821
        object Panel10: TPanel
          Left = 0
          Height = 22
          Top = 0
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 22
          ClientWidth = 821
          TabOrder = 0
          object Label12: TLabel
            Left = 8
            Height = 13
            Top = 5
            Width = 117
            Caption = 'Liste der Katalogeinträge'
            ParentColor = False
          end
          object Label13: TLabel
            Left = 360
            Height = 13
            Top = 5
            Width = 43
            Caption = 'Fehlerlog'
            ParentColor = False
          end
        end
        object Panel11: TPanel
          Left = 0
          Height = 171
          Top = 22
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 171
          ClientWidth = 821
          TabOrder = 1
          object KLB1: TListBox
            Left = 0
            Height = 171
            Top = 0
            Width = 355
            Align = alLeft
            ItemHeight = 0
            TabOrder = 0
          end
          object KLog: TListBox
            Left = 355
            Height = 171
            Top = 0
            Width = 466
            Align = alClient
            ItemHeight = 0
            TabOrder = 1
          end
        end
        object Splitter3: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 193
          Width = 821
          Align = alTop
          ResizeAnchor = akTop
        end
        object Panel12: TPanel
          Left = 0
          Height = 30
          Top = 440
          Width = 821
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 30
          ClientWidth = 821
          TabOrder = 4
          object ShopKatReadBtn: TButton
            Left = 0
            Height = 25
            Top = 4
            Width = 75
            Caption = 'Einlesen'
            OnClick = ShopBestReadBtnClick
            TabOrder = 0
          end
          object ImportKatBtn: TBitBtn
            Left = 88
            Height = 25
            Top = 4
            Width = 105
            Caption = 'Import'
            Enabled = False
            OnClick = ImportKatBtnClick
            TabOrder = 1
          end
          object KatImportAlleBtn: TBitBtn
            Left = 205
            Height = 25
            Top = 4
            Width = 140
            Caption = 'alle Kategorien importieren'
            Enabled = False
            OnClick = KatImportAlleBtnClick
            TabOrder = 2
          end
        end
        object ExRxDBGrid2: TRxDBGrid
          Left = 0
          Height = 242
          Top = 198
          Width = 821
          ColumnDefValues.BlobText = '(blob)'
          TitleButtons = True
          AutoSort = True
          Columns = <          
            item
              Alignment = taCenter
              Title.Alignment = taLeftJustify
              Title.Orientation = toHorizontal
              Title.Caption = 'ID'
              Width = 50
              FieldName = 'ID'
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
              Title.Caption = 'ParentPID'
              Width = 54
              FieldName = 'PID'
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
              Title.Caption = 'Importiert'
              Width = 50
              FieldName = 'Importiert'
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
              Title.Caption = 'Existiert'
              Width = 45
              FieldName = 'Exists'
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
              Title.Caption = 'Name'
              Width = 160
              FieldName = 'Name'
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
              Title.Caption = 'Bild-URL'
              Width = 160
              FieldName = 'ImageURL'
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
              Title.Caption = 'SortOrder'
              Width = 55
              FieldName = 'SortOrder'
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
              Title.Caption = 'erstellt'
              Width = 100
              FieldName = 'DateAdded'
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
              Title.Caption = 'le. Änderung'
              Width = 100
              FieldName = 'LastModified'
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
          DataSource = OscKat_DS
          DefaultRowHeight = 16
          Flat = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgHeaderPushedLook]
          ReadOnly = True
          Scrollbars = ssHorizontal
          TabOrder = 3
        end
      end
      object HerstellerTS: TTabSheet
        Caption = 'Hersteller'
        ClientHeight = 470
        ClientWidth = 821
        object Panel13: TPanel
          Left = 0
          Height = 22
          Top = 0
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 22
          ClientWidth = 821
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Height = 13
            Top = 5
            Width = 87
            Caption = 'Liste der Hersteller'
            ParentColor = False
          end
          object Label4: TLabel
            Left = 360
            Height = 13
            Top = 5
            Width = 43
            Caption = 'Fehlerlog'
            ParentColor = False
          end
        end
        object Panel14: TPanel
          Left = 0
          Height = 171
          Top = 22
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 171
          ClientWidth = 821
          TabOrder = 1
          object Hlb1: TListBox
            Left = 0
            Height = 171
            Top = 0
            Width = 355
            Align = alLeft
            ItemHeight = 0
            TabOrder = 0
          end
          object HLog: TListBox
            Left = 355
            Height = 171
            Top = 0
            Width = 466
            Align = alClient
            ItemHeight = 0
            TabOrder = 1
          end
        end
        object Splitter4: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 193
          Width = 821
          Align = alTop
          ResizeAnchor = akTop
        end
        object Panel15: TPanel
          Left = 0
          Height = 272
          Top = 198
          Width = 821
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 272
          ClientWidth = 821
          TabOrder = 3
          object Panel16: TPanel
            Left = 0
            Height = 30
            Top = 242
            Width = 821
            Align = alBottom
            BevelOuter = bvNone
            ClientHeight = 30
            ClientWidth = 821
            TabOrder = 0
            object ShopHerReadBtn: TButton
              Left = 0
              Height = 25
              Top = 4
              Width = 75
              Caption = 'Einlesen'
              OnClick = ShopBestReadBtnClick
              TabOrder = 0
            end
            object ImportHerstellerBtn: TBitBtn
              Left = 88
              Height = 25
              Top = 4
              Width = 105
              Caption = 'Import'
              Enabled = False
              OnClick = ImportHerstellerBtnClick
              TabOrder = 1
            end
            object ImportAlleHerstellerBtn: TBitBtn
              Left = 205
              Height = 25
              Top = 4
              Width = 140
              Caption = 'alle Hersteller importieren'
              OnClick = ImportAlleHerstellerBtnClick
              TabOrder = 2
            end
          end
          object ExRxDBGridHersteller: TRxDBGrid
            Left = 0
            Height = 242
            Top = 0
            Width = 821
            ColumnDefValues.BlobText = '(blob)'
            TitleButtons = True
            AutoSort = True
            Columns = <            
              item
                Alignment = taRightJustify
                ReadOnly = True
                Title.Alignment = taLeftJustify
                Title.Orientation = toHorizontal
                Title.Caption = 'ID'
                Width = 40
                FieldName = 'ID'
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
                Title.Caption = 'Importiert'
                Width = 47
                FieldName = 'Importiert'
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
                Title.Caption = 'Exists'
                Width = 34
                FieldName = 'Exists'
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
                Title.Caption = 'Name'
                Width = 124
                FieldName = 'HERSTELLER_NAME'
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
                Title.Caption = 'Bild-URL'
                Width = 388
                FieldName = 'HERSTELLER_IMAGE'
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
                Title.Caption = 'Hersteller-URL'
                Width = 200
                FieldName = 'HERSTELLER_URL'
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
                Title.Caption = 'erstellt'
                Width = 97
                FieldName = 'DateAdded'
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
                Title.Caption = 'le. Änderung'
                Width = 97
                FieldName = 'LastModified'
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
            DataSource = OscHer_DS
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgHeaderPushedLook]
            ReadOnly = True
            Scrollbars = ssHorizontal
            TabOrder = 1
          end
        end
      end
      object BestellTS: TTabSheet
        Caption = 'Bestellungen'
        ClientHeight = 470
        ClientWidth = 821
        object Panel1: TPanel
          Left = 0
          Height = 22
          Top = 0
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 22
          ClientWidth = 821
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Height = 13
            Top = 5
            Width = 104
            Caption = 'Liste der Bestellungen'
            ParentColor = False
          end
          object Label3: TLabel
            Left = 360
            Height = 13
            Top = 5
            Width = 43
            Caption = 'Fehlerlog'
            ParentColor = False
          end
        end
        object Panel2: TPanel
          Left = 0
          Height = 171
          Top = 22
          Width = 821
          Align = alTop
          BevelOuter = bvNone
          ClientHeight = 171
          ClientWidth = 821
          TabOrder = 1
          object Olb1: TListBox
            Left = 0
            Height = 171
            Top = 0
            Width = 355
            Align = alLeft
            ItemHeight = 0
            TabOrder = 0
          end
          object OLog: TListBox
            Left = 355
            Height = 171
            Top = 0
            Width = 466
            Align = alClient
            ItemHeight = 0
            TabOrder = 1
          end
        end
        object Splitter1: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 193
          Width = 821
          Align = alTop
          ResizeAnchor = akTop
        end
        object Panel3: TPanel
          Left = 0
          Height = 272
          Top = 198
          Width = 821
          Align = alClient
          BevelOuter = bvNone
          ClientHeight = 272
          ClientWidth = 821
          TabOrder = 3
          object Panel4: TPanel
            Left = 0
            Height = 30
            Top = 242
            Width = 821
            Align = alBottom
            BevelOuter = bvNone
            ClientHeight = 30
            ClientWidth = 821
            TabOrder = 0
            object ShopBestReadBtn: TButton
              Left = 0
              Height = 25
              Top = 4
              Width = 75
              Caption = 'Einlesen'
              OnClick = ShopBestReadBtnClick
              TabOrder = 0
            end
            object ShopBestImpBtn: TBitBtn
              Left = 88
              Height = 25
              Top = 4
              Width = 105
              Caption = 'Import'
              Enabled = False
              OnClick = ShopBestImportBtnClick
              TabOrder = 1
            end
            object AlleBestImportBtn: TBitBtn
              Left = 205
              Height = 25
              Top = 4
              Width = 140
              Caption = 'alle Bestellungen import.'
              Enabled = False
              OnClick = AlleBestImportBtnClick
              TabOrder = 2
            end
            object Label7: TLabel
              Left = 351
              Height = 13
              Top = 9
              Width = 89
              Caption = 'ab Bestellnummer :'
              ParentColor = False
            end
            object FromOrderNum: TSpinEdit
              Left = 447
              Height = 21
              Top = 4
              Width = 81
              Color = clWindow
              MaxValue = 9999999
              TabOrder = 3
            end
          end
          object OscReGrid: TRxDBGrid
            Left = 0
            Height = 242
            Top = 0
            Width = 821
            ColumnDefValues.BlobText = '(blob)'
            TitleButtons = True
            AutoSort = True
            Columns = <            
              item
                Title.Alignment = taLeftJustify
                Title.Orientation = toHorizontal
                Title.Caption = 'Importiert'
                Width = 30
                FieldName = 'Importiert'
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
                Title.Caption = 'OrderID'
                Width = 41
                FieldName = 'ID'
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
                Title.Caption = 'KunID'
                Width = 34
                FieldName = 'Kun_ID'
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
                Title.Caption = 'Kunde Importiert'
                Width = 30
                FieldName = 'KundeExists'
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
                Title.Caption = 'Datum'
                FieldName = 'Datum'
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
                Title.Caption = 'Währung'
                Width = 35
                FieldName = 'Waehrung'
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
                Title.Caption = 'Kurs'
                FieldName = 'Kurs'
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
                Title.Caption = 'Firma'
                Width = 100
                FieldName = 'Firma'
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
                Title.Caption = 'Name'
                Width = 100
                FieldName = 'Name'
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
                Title.Caption = 'Strasse'
                Width = 100
                FieldName = 'Strasse'
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
                Title.Caption = 'Land'
                Width = 52
                FieldName = 'Land'
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
                Title.Caption = 'PLZ'
                Width = 40
                FieldName = 'PLZ'
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
                Title.Caption = 'Ort'
                Width = 100
                FieldName = 'Ort'
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
                Title.Caption = 'Positionen'
                Width = 35
                FieldName = 'AnzArtikel'
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
            DataSource = OscRe_DS
            DefaultRowHeight = 16
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgHeaderPushedLook]
            ReadOnly = True
            Scrollbars = ssHorizontal
            TabOrder = 1
          end
        end
      end
      object UpdateTS: TTabSheet
        Caption = 'Update CAO->SHOP'
        ClientHeight = 470
        ClientWidth = 821
        object Panel9: TPanel
          Left = 0
          Height = 30
          Top = 440
          Width = 821
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 30
          ClientWidth = 821
          TabOrder = 0
          object JobsRefreshBtn: TButton
            Left = 0
            Height = 25
            Top = 4
            Width = 75
            Caption = 'Refresh'
            OnClick = JobsRefreshBtnClick
            TabOrder = 0
          end
          object ExecKatBtn: TButton
            Left = 88
            Height = 25
            Top = 4
            Width = 112
            Caption = 'Update Ausführen'
            OnClick = ExecKatBtnClick
            TabOrder = 1
          end
        end
        object SyncLV: TListView
          Left = 0
          Height = 440
          Top = 0
          Width = 821
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Caption = 'Bereich'
              Width = 110
            end          
            item
              Alignment = taRightJustify
              Caption = 'CAO-ID'
              Width = 75
            end          
            item
              Alignment = taRightJustify
              Caption = 'Shop-ID'
              Width = 60
            end          
            item
              Alignment = taCenter
              Caption = 'Status'
              Width = 60
            end          
            item
              Caption = 'Bemerkung'
              Width = 125
            end          
            item
              Caption = 'Ergebnis/ Fehlercode'
              Width = 250
            end>
          TabOrder = 1
          ViewStyle = vsReport
        end
      end
    end
  end
  object OscArtTab: TRxMemoryData
    FieldDefs = <    
      item
        Name = 'ID'
        DataType = ftInteger
      end    
      item
        Name = 'Importiert'
        DataType = ftBoolean
      end    
      item
        Name = 'ArtikelExists'
        DataType = ftBoolean
      end    
      item
        Name = 'CaoArtID'
        DataType = ftInteger
      end    
      item
        Name = 'Modell'
        DataType = ftString
        Size = 100
      end    
      item
        Name = 'Menge'
        DataType = ftFloat
      end    
      item
        Name = 'Status'
        DataType = ftInteger
      end    
      item
        Name = 'Bild'
        DataType = ftString
        Size = 20
      end    
      item
        Name = 'Preis'
        DataType = ftFloat
      end    
      item
        Name = 'MwStID'
        DataType = ftInteger
      end    
      item
        Name = 'Hersteller'
        DataType = ftInteger
      end    
      item
        Name = 'TextDE'
        DataType = ftString
        Size = 254
      end>
    AfterOpen = OscArtTabAfterScroll
    AfterScroll = OscArtTabAfterScroll
    PacketRecords = 0
    Left = 685
    Top = 264
    object OscArtTabID: TLongintField
      FieldKind = fkData
      FieldName = 'ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscArtTabImportiert: TBooleanField
      FieldKind = fkData
      FieldName = 'Importiert'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscArtTabArtikelExists: TBooleanField
      FieldKind = fkData
      FieldName = 'ArtikelExists'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscArtTabCaoArtID: TLongintField
      FieldKind = fkData
      FieldName = 'CaoArtID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscArtTabModell: TStringField
      FieldKind = fkData
      FieldName = 'Modell'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object OscArtTabMenge: TFloatField
      FieldKind = fkData
      FieldName = 'Menge'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 2
    end
    object OscArtTabStatus: TLongintField
      FieldKind = fkData
      FieldName = 'Status'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscArtTabBild: TStringField
      FieldKind = fkData
      FieldName = 'Bild'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscArtTabPreis: TFloatField
      FieldKind = fkData
      FieldName = 'Preis'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 2
    end
    object OscArtTabMwStID: TLongintField
      FieldKind = fkData
      FieldName = 'MwStID'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscArtTabHersteller: TLongintField
      FieldKind = fkData
      FieldName = 'Hersteller'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscArtTabTextDE: TStringField
      FieldKind = fkData
      FieldName = 'TextDE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 254
    end
  end
  object MainMenu1: TMainMenu
    Left = 60
    Top = 121
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.CharSet = 'ISO-8859-1'
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 128
    Top = 120
  end
  object KatTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL_KAT '
      'where SHOP_ID=:SHOP_ID'
      'order by ID, TOP_ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end>
    Left = 406
    Top = 98
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'SHOP_ID'
        ParamType = ptInput
        Value = '1'
      end>
    object KatTabSHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KatTabID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KatTabTOP_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'TOP_ID'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KatTabSORT_NUM: TZCardinalField
      FieldKind = fkData
      FieldName = 'SORT_NUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KatTabNAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 250
    end
    object KatTabIMAGE: TZRawStringField
      FieldKind = fkData
      FieldName = 'IMAGE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object KatTabVISIBLE_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'VISIBLE_FLAG'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object KatTabCHANGE_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'CHANGE_FLAG'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object KatTabDEL_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'DEL_FLAG'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
  end
  object HerTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from HERSTELLER '
      'where SHOP_ID=:SID '
      'order by HERSTELLER_ID'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'SID'
        ParamType = ptInput
      end>
    Left = 406
    Top = 160
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'SID'
        ParamType = ptInput
      end>
    object HerTabSHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object HerTabHERSTELLER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'HERSTELLER_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerTabHERSTELLER_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'HERSTELLER_NAME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 32
    end
    object HerTabHERSTELLER_IMAGE: TZRawStringField
      FieldKind = fkData
      FieldName = 'HERSTELLER_IMAGE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 64
    end
    object HerTabLAST_CHANGE: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'LAST_CHANGE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NADT'
    end
    object HerTabSHOP_DATE_ADDED: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'SHOP_DATE_ADDED'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NADT'
    end
    object HerTabSHOP_DATE_CHANGE: TZDateTimeField
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'SHOP_DATE_CHANGE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NADT'
    end
    object HerTabSYNC_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'SYNC_FLAG'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object HerTabCHANGE_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'CHANGE_FLAG'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object HerTabDEL_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'DEL_FLAG'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
  end
  object ArtTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ARTIKEL '
      'where REC_ID=:ID'
      'limit 0,1'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 472
    Top = 98
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object ArtTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabMATCHCODE: TZRawStringField
      DisplayWidth = 20
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabWARENGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'WARENGRUPPE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabARTIKELTYP: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTIKELTYP'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object ArtTabKAS_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'KAS_NAME'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ArtTabKURZNAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'KURZNAME'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object ArtTabLANGNAME: TZRawCLobField
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
    object ArtTabSHOP_LANGTEXT: TZRawCLobField
      FieldKind = fkData
      FieldName = 'SHOP_LANGTEXT'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ArtTabGEWICHT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK1: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK1'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK1B: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK1B'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 10
    end
    object ArtTabVK2: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK2'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK2B: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK2B'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK3: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK3'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK3B: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK3B'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK4: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK4'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK4B: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK4B'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK5: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK5'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabVK5B: TZDoubleField
      FieldKind = fkData
      FieldName = 'VK5B'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabSTEUER_CODE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabSHOP_ID: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabSHOP_ARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_ARTIKEL_ID'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabSHOP_DATENBLATT: TZRawStringField
      FieldKind = fkData
      FieldName = 'SHOP_DATENBLATT'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ArtTabSHOP_IMAGE_LARGE: TZRawStringField
      FieldKind = fkData
      FieldName = 'SHOP_IMAGE_LARGE'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ArtTabSHOP_PREIS_LISTE: TZDoubleField
      FieldKind = fkData
      FieldName = 'SHOP_PREIS_LISTE'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ArtTabERST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'ERST_NAME'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabSHOP_VISIBLE: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_VISIBLE'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabERLOES_KTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'ERLOES_KTO'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabAUFW_KTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'AUFW_KTO'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabMENGE_AKT: TZDoubleField
      FieldKind = fkData
      FieldName = 'MENGE_AKT'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ArtTabHERSTELLER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'HERSTELLER_ID'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object HerDesTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from HERSTELLER_INFO '
      'where HERSTELLER_ID=:ID'
      'limit 0,1'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 472
    Top = 160
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object HerDesTabSHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerDesTabHERSTELLER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'HERSTELLER_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerDesTabSPRACHE_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SPRACHE_ID'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerDesTabHERSTELLER_URL: TZRawStringField
      FieldKind = fkData
      FieldName = 'HERSTELLER_URL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object HerDesTabURL_CLICKED: TZIntegerField
      FieldKind = fkData
      FieldName = 'URL_CLICKED'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object HerDesTabDATE_LAST_CLICK: TZDateTimeField
      FieldKind = fkData
      FieldName = 'DATE_LAST_CLICK'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NADT'
    end
  end
  object ReEdiTab: TZQuery
    Connection = DM1.DB1
    BeforePost = ReEdiTabBeforePost
    OnNewRecord = ReEdiTabNewRecord
    SQL.Strings = (
      'select * FROM JOURNAL'
      'where QUELLE=:QUELLE and QUELLE_SUB<>2'
      'order by VRENUM'
      'limit 0,1'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    Left = 536
    Top = 98
    ParamData = <    
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    object ReEdiTabQUELLE: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ReEdiTabJAHR: TZDateField
      FieldKind = fkData
      FieldName = 'JAHR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabQUELLE_SUB: TZShortIntField
      FieldKind = fkData
      FieldName = 'QUELLE_SUB'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object ReEdiTabATRNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabVRENUM: TZIntegerField
      DisplayLabel = 'int. Nr.'
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = '"EDI-"0000'
    end
    object ReEdiTabVLSNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VLSNUM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabFOLGENR: TZIntegerField
      FieldKind = fkData
      FieldName = 'FOLGENR'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKM_STAND: TZIntegerField
      FieldKind = fkData
      FieldName = 'KM_STAND'
      Index = 9
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
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabVERTRETER_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'VERTRETER_ID'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabGLOBRABATT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GLOBRABATT'
      Index = 12
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
      Index = 13
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
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabWVORLAGE: TLongintField
      DisplayLabel = 'WV'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'WVORLAGE'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = 'Ja;-;-'
    end
    object ReEdiTabWV_DATUM: TDateField
      FieldKind = fkData
      FieldName = 'WV_DATUM'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabPR_EBENE: TZShortIntField
      FieldKind = fkData
      FieldName = 'PR_EBENE'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKOST_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'KOST_NETTO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Precision = 10
    end
    object ReEdiTabWERT_NETTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'WERT_NETTO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabLOHN: TZDoubleField
      FieldKind = fkData
      FieldName = 'LOHN'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabWARE: TZDoubleField
      FieldKind = fkData
      FieldName = 'WARE'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabTKOST: TZDoubleField
      FieldKind = fkData
      FieldName = 'TKOST'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_0'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_1: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_1'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_2: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_2'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMWST_3: TZDoubleField
      FieldKind = fkData
      FieldName = 'MWST_3'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabMSUMME_0: TZDoubleField
      FieldKind = fkData
      FieldName = 'MSUMME_0'
      Index = 27
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
      Index = 28
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
      Index = 29
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
      Index = 30
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
      Index = 31
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
      Index = 32
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
      Index = 33
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
      Index = 34
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
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_STAGE: TZShortIntField
      FieldKind = fkData
      FieldName = 'SOLL_STAGE'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_SKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_SKONTO'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object ReEdiTabSOLL_NTAGE: TZShortIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATEN: TZShortIntField
      FieldKind = fkData
      FieldName = 'SOLL_RATEN'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATBETR: TZDoubleField
      FieldKind = fkData
      FieldName = 'SOLL_RATBETR'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSOLL_RATINTERVALL: TZIntegerField
      FieldKind = fkData
      FieldName = 'SOLL_RATINTERVALL'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabSTADIUM: TZShortIntField
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 42
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabERSTELLT: TZDateField
      FieldKind = fkData
      FieldName = 'ERSTELLT'
      Index = 43
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
      Index = 44
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKUN_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NUM'
      Index = 45
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabKUN_ANREDE: TZRawStringField
      DisplayWidth = 30
      FieldKind = fkData
      FieldName = 'KUN_ANREDE'
      Index = 46
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 30
    end
    object ReEdiTabKUN_NAME1: TZRawStringField
      DisplayLabel = 'Kunde'
      DisplayWidth = 30
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 47
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object ReEdiTabKUN_NAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME2'
      Index = 48
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 30
    end
    object ReEdiTabKUN_NAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME3'
      Index = 49
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 30
    end
    object ReEdiTabKUN_ABTEILUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ABTEILUNG'
      Index = 50
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 30
    end
    object ReEdiTabKUN_STRASSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_STRASSE'
      Index = 51
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 30
    end
    object ReEdiTabKUN_LAND: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_LAND'
      Index = 52
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 2
    end
    object ReEdiTabKUN_PLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_PLZ'
      Index = 53
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 5
    end
    object ReEdiTabKUN_ORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_ORT'
      Index = 54
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 30
    end
    object ReEdiTabUSR1: TZRawStringField
      FieldKind = fkData
      FieldName = 'USR1'
      Index = 55
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
      Index = 56
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
      Index = 57
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object ReEdiTabORGNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORGNUM'
      Index = 58
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabBEST_NAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'BEST_NAME'
      Index = 59
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
      Index = 60
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabBEST_DATUM: TZDateField
      FieldKind = fkData
      FieldName = 'BEST_DATUM'
      Index = 61
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object ReEdiTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 62
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ReEdiTabLIEFART: TSmallintField
      FieldKind = fkData
      FieldName = 'LIEFART'
      Index = 63
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabZAHLART: TSmallintField
      FieldKind = fkData
      FieldName = 'ZAHLART'
      Index = 64
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ReEdiTabNSUMME: TZDoubleField
      DisplayLabel = 'Gesamt (netto)'
      FieldKind = fkData
      FieldName = 'NSUMME'
      Index = 65
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
      Index = 66
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
      Index = 67
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
      Index = 68
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 15
    end
    object ReEdiTabSHOP_ID: TZShortIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 69
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabSHOP_ORDERID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_ORDERID'
      Index = 70
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabSHOP_STATUS: TZByteField
      FieldKind = fkData
      FieldName = 'SHOP_STATUS'
      Index = 71
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ReEdiTabBRUTTO_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 72
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object ReEdiTabMWST_FREI_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
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
  end
  object KunTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from ADRESSEN'
      'where REC_ID = :ID'
      'limit 0,1'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 536
    Top = 160
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
    end
    object KunTabNAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME1'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KunTabORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabLAND: TZRawStringField
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KunTabNAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME2'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabNAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME3'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabABTEILUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'ABTEILUNG'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabSTRASSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabDEB_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'DEB_NUM'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabWAERUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'WAERUNG'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KunTabGRABATT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GRABATT'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 5
    end
    object KunTabKUN_LIEFART: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUN_LIEFART'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KunTabKUN_ZAHLART: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUN_ZAHLART'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabPR_EBENE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'PR_EBENE'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabNET_SKONTO: TZDoubleField
      FieldKind = fkData
      FieldName = 'NET_SKONTO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabNET_TAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'NET_TAGE'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabBRT_TAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'BRT_TAGE'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabTELE1: TZRawStringField
      FieldKind = fkData
      FieldName = 'TELE1'
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
    object KunTabEMAIL: TZRawStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunTabKUN_GEBDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'KUN_GEBDATUM'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KunTabBRUTTO_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object KunTabMWST_FREI_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'MWST_FREI_FLAG'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object KunTabSHOP_ID: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabSHOP_KUNDE_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_KUNDE_ID'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKUNDENGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUNDENGRUPPE'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKUNNUM1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUNNUM1'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabBLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'BLZ'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabKTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunTabBANK: TZRawStringField
      FieldKind = fkData
      FieldName = 'BANK'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunTabKUN_SEIT: TZDateField
      FieldKind = fkData
      FieldName = 'KUN_SEIT'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KunTabSTATUS: TZIntegerField
      FieldKind = fkData
      FieldName = 'STATUS'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object PosTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = PosTabCalcFields
    BeforeEdit = PosTabBeforeEdit
    BeforePost = PosTabBeforePost
    AfterPost = PosTabAfterPost
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
    Left = 600
    Top = 98
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
    object PosTabJAHR: TLongintField
      FieldKind = fkData
      FieldName = 'JAHR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabJOURNAL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'JOURNAL_ID'
      Index = 4
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
      Index = 5
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
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabARTIKEL_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
    end
    object PosTabATRNUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRNUM'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 10
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
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      DisplayFormat = '0;-;-'
    end
    object PosTabMATCHCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabARTNUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabBARCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BARCODE'
      Index = 14
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
      Index = 15
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
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGROESSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'GROESSE'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabDIMENSION: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIMENSION'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEWICHT: TZDoubleField
      FieldKind = fkData
      FieldName = 'GEWICHT'
      Index = 19
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
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object PosTabPR_EINHEIT: TZDoubleField
      FieldKind = fkData
      FieldName = 'PR_EINHEIT'
      Index = 21
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
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0;-,###,##0.0; '
    end
    object PosTabEPREIS: TZDoubleField
      DisplayLabel = 'E-Preis'
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'EPREIS'
      Index = 23
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
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.0"%";-,###,##0.0"%"; '
    end
    object PosTabE_RGEWINN: TZDoubleField
      FieldKind = fkData
      FieldName = 'E_RGEWINN'
      Index = 25
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
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEGENKTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GEGENKTO'
      Index = 27
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
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',###,##0.00;-,###,##0.00; '
    end
    object PosTabMSumme: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MSumme'
      Index = 29
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
      Index = 30
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
      FieldKind = fkData
      FieldName = 'STEUER_CODE'
      Index = 31
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
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 8
    end
    object PosTabALTTEIL_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'ALTTEIL_PROZ'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object PosTabGEBUCHT: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'GEBUCHT'
      Index = 34
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
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabBEZ_FEST_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'BEZ_FEST_FLAG'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabBRUTTO_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'BRUTTO_FLAG'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabPROVIS_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'PROVIS_PROZ'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object PosTabPROVIS_WERT: TZDoubleField
      FieldKind = fkData
      FieldName = 'PROVIS_WERT'
      Index = 39
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object PosTabSN_FLAG: TZRawStringField
      DisplayWidth = 5
      FieldKind = fkData
      FieldName = 'SN_FLAG'
      Index = 40
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object PosTabVPE: TZUInt64Field
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'VPE'
      Index = 41
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object KunLiefTab: TZQuery
    SQL.Strings = (
      'select * from ADRESSEN_LIEF'
      'where ADDR_ID=:AID and NAME1=:NAME1 and NAME2=:NAME2 and STRASSE=:STRASSE and ORT=:ORT and PLZ=:PLZ and LAND=:LAND'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'NAME1'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'NAME2'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'STRASSE'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'ORT'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'PLZ'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'LAND'
        ParamType = ptInput
      end>
    Left = 600
    Top = 160
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'NAME1'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'NAME2'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'STRASSE'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'ORT'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'PLZ'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'LAND'
        ParamType = ptInput
      end>
  end
  object OscReTab: TRxMemoryData
    FieldDefs = <    
      item
        Name = 'ID'
        DataType = ftInteger
      end    
      item
        Name = 'Kun_ID'
        DataType = ftInteger
      end    
      item
        Name = 'Datum'
        DataType = ftDate
      end    
      item
        Name = 'Waehrung'
        DataType = ftString
      end    
      item
        Name = 'Kurs'
        DataType = ftFloat
      end    
      item
        Name = 'Firma'
        DataType = ftString
        Size = 100
      end    
      item
        Name = 'Name'
        DataType = ftString
        Size = 100
      end    
      item
        Name = 'Strasse'
        DataType = ftString
        Size = 100
      end    
      item
        Name = 'PLZ'
        DataType = ftString
        Size = 20
      end    
      item
        Name = 'Ort'
        DataType = ftString
        Size = 100
      end    
      item
        Name = 'Land'
        DataType = ftString
        Size = 100
      end    
      item
        Name = 'AnzArtikel'
        DataType = ftInteger
      end    
      item
        Name = 'Importiert'
        DataType = ftBoolean
      end    
      item
        Name = 'KundeExists'
        DataType = ftBoolean
      end    
      item
        Name = 'CaoKunID'
        DataType = ftInteger
      end>
    AfterOpen = OscReTabAfterScroll
    AfterScroll = OscReTabAfterScroll
    PacketRecords = 0
    Left = 685
    Top = 312
    object OscReTabID: TLongintField
      DisplayLabel = 'OrderID'
      DisplayWidth = 4
      FieldKind = fkData
      FieldName = 'ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0000'
    end
    object OscReTabKun_ID: TLongintField
      DisplayLabel = 'KunID'
      DisplayWidth = 4
      FieldKind = fkData
      FieldName = 'Kun_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0000'
    end
    object OscReTabDatum: TDateField
      FieldKind = fkData
      FieldName = 'Datum'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
    end
    object OscReTabWaehrung: TStringField
      DisplayLabel = 'Währung'
      DisplayWidth = 3
      FieldKind = fkData
      FieldName = 'Waehrung'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscReTabKurs: TFloatField
      FieldKind = fkData
      FieldName = 'Kurs'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.000000'
    end
    object OscReTabFirma: TStringField
      DisplayWidth = 20
      FieldKind = fkData
      FieldName = 'Firma'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object OscReTabName: TStringField
      DisplayWidth = 20
      FieldKind = fkData
      FieldName = 'Name'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object OscReTabStrasse: TStringField
      DisplayWidth = 20
      FieldKind = fkData
      FieldName = 'Strasse'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object OscReTabPLZ: TStringField
      DisplayWidth = 6
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscReTabOrt: TStringField
      DisplayWidth = 20
      FieldKind = fkData
      FieldName = 'Ort'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object OscReTabLand: TStringField
      DisplayWidth = 8
      FieldKind = fkData
      FieldName = 'Land'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object OscReTabAnzArtikel: TLongintField
      DisplayLabel = 'Positionen'
      FieldKind = fkData
      FieldName = 'AnzArtikel'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0'
    end
    object OscReTabImportiert: TBooleanField
      FieldKind = fkData
      FieldName = 'Importiert'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscReTabKundeExists: TBooleanField
      DisplayLabel = 'Kunde Importiert'
      FieldKind = fkData
      FieldName = 'KundeExists'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscReTabCaoKunID: TLongintField
      FieldKind = fkData
      FieldName = 'CaoKunID'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object OscKatTab: TRxMemoryData
    FieldDefs = <>
    AfterOpen = OscKatTabAfterScroll
    AfterScroll = OscKatTabAfterScroll
    PacketRecords = 0
    Left = 685
    Top = 360
    object OscKatTabID: TLongintField
      DisplayWidth = 4
      FieldKind = fkData
      FieldName = 'ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0000'
    end
    object OscKatTabPID: TLongintField
      DisplayLabel = 'ParentPID'
      DisplayWidth = 4
      FieldKind = fkData
      FieldName = 'PID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0000'
    end
    object OscKatTabImportiert: TBooleanField
      FieldKind = fkData
      FieldName = 'Importiert'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscKatTabExists: TBooleanField
      DisplayLabel = 'Existiert'
      FieldKind = fkData
      FieldName = 'Exists'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscKatTabName: TStringField
      DisplayWidth = 30
      FieldKind = fkData
      FieldName = 'Name'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 200
    end
    object OscKatTabImageURL: TStringField
      DisplayLabel = 'Bild-URL'
      DisplayWidth = 40
      FieldKind = fkData
      FieldName = 'ImageURL'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object OscKatTabSortOrder: TLongintField
      DisplayWidth = 3
      FieldKind = fkData
      FieldName = 'SortOrder'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscKatTabDateAdded: TDateTimeField
      DisplayLabel = 'erstellt'
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'DateAdded'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
    end
    object OscKatTabLastModified: TDateTimeField
      DisplayLabel = 'le. Änderung'
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'LastModified'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
  object OscHerTab: TRxMemoryData
    FieldDefs = <>
    AfterOpen = OscHerTabAfterScroll
    AfterScroll = OscHerTabAfterScroll
    PacketRecords = 0
    Left = 685
    Top = 408
    object OscHerTabID: TLongintField
      FieldKind = fkData
      FieldName = 'ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0000'
    end
    object OscHerTabExists: TBooleanField
      FieldKind = fkData
      FieldName = 'Exists'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscHerTabImportiert: TBooleanField
      FieldKind = fkData
      FieldName = 'Importiert'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayValues = 'True;False'
    end
    object OscHerTabDateAdded: TDateTimeField
      FieldKind = fkData
      FieldName = 'DateAdded'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscHerTabLastModified: TDateTimeField
      FieldKind = fkData
      FieldName = 'LastModified'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscHerTabHERSTELLER_IMAGE: TStringField
      FieldKind = fkData
      FieldName = 'HERSTELLER_IMAGE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 64
    end
    object OscHerTabHERSTELLER_NAME: TStringField
      FieldKind = fkData
      FieldName = 'HERSTELLER_NAME'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object OscHerTabHERSTELLER_URL: TStringField
      DisplayLabel = 'Hersteller-URL'
      FieldKind = fkData
      FieldName = 'HERSTELLER_URL'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
  end
  object OscArt_DS: TDataSource
    DataSet = OscArtTab
    OnDataChange = OscArt_DSDataChange
    Left = 616
    Top = 264
  end
  object OscRe_DS: TDataSource
    DataSet = OscReTab
    OnDataChange = OscRe_DSDataChange
    Left = 616
    Top = 312
  end
  object OscKat_DS: TDataSource
    DataSet = OscKatTab
    OnDataChange = OscKat_DSDataChange
    Left = 616
    Top = 360
  end
  object OscHer_DS: TDataSource
    DataSet = OscHerTab
    OnDataChange = OscHer_DSDataChange
    Left = 616
    Top = 408
  end
end
