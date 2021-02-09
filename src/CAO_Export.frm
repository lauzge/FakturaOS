object ExportForm: TExportForm
  Left = 86
  Height = 540
  Top = 85
  Width = 783
  Caption = 'Export'
  ClientHeight = 520
  ClientWidth = 783
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
    Height = 520
    Top = 0
    Width = 783
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 520
    ClientWidth = 783
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 783
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 779
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object ReEdiTopLab: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 68
        Align = alLeft
        Caption = '  Export ...'
        Color = clBtnShadow
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object FelderBtn: TSpeedButton
        Tag = 4
        Left = 701
        Height = 22
        Top = 0
        Width = 80
        Caption = '&Felder'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AuswahlBtnClick
        OnMouseEnter = AuswahlBtnMouseEnter
        OnMouseLeave = AuswahlBtnMouseLeave
        ParentFont = False
      end
      object SQLBtn: TSpeedButton
        Tag = 3
        Left = 624
        Height = 22
        Top = 0
        Width = 73
        Caption = 'S&QL'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AuswahlBtnClick
        OnMouseEnter = AuswahlBtnMouseEnter
        OnMouseLeave = AuswahlBtnMouseLeave
        ParentFont = False
      end
      object AllgemeinBtn: TSpeedButton
        Tag = 2
        Left = 552
        Height = 22
        Top = 0
        Width = 68
        Caption = 'All&gemein'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        OnClick = AuswahlBtnClick
        OnMouseEnter = AuswahlBtnMouseEnter
        OnMouseLeave = AuswahlBtnMouseLeave
        ParentFont = False
      end
      object AuswahlBtn: TSpeedButton
        Tag = 1
        Left = 488
        Height = 22
        Top = 0
        Width = 65
        Caption = 'Aus&wahl'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        OnClick = AuswahlBtnClick
        OnMouseEnter = AuswahlBtnMouseEnter
        OnMouseLeave = AuswahlBtnMouseLeave
        ParentFont = False
      end
    end
    object PC1: TPageControl
      Left = 0
      Height = 493
      Top = 27
      Width = 783
      ActivePage = SQLExecTS
      Align = alClient
      TabIndex = 2
      TabOrder = 1
      OnChange = PC1Change
      object AuswahlTS: TTabSheet
        Caption = 'Auswahl'
        ClientHeight = 467
        ClientWidth = 775
        object ExportListGrid: TDBGrid
          Left = 0
          Height = 444
          Top = 0
          Width = 775
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Alignment = taRightJustify
              Title.Caption = 'lfd. Nr.'
              Width = 40
              FieldName = 'ID'
            end          
            item
              Title.Caption = 'Beschreibung'
              Width = 490
              FieldName = 'KURZBEZ'
            end          
            item
              Title.Caption = 'le. Änderung'
              Width = 70
              FieldName = 'LAST_CHANGE'
            end          
            item
              Title.Caption = 'geänd. von'
              Width = 110
              FieldName = 'CHANGE_NAME'
            end>
          DataSource = ExportDS
          DefaultRowHeight = 17
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete]
          TabOrder = 1
        end
        object ToolBar1: TToolBar
          Left = 0
          Height = 23
          Top = 444
          Width = 775
          Align = alBottom
          BorderWidth = 2
          ButtonHeight = 22
          ButtonWidth = 91
          Caption = 'ToolBar1'
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 0
          object DBNavigator1: TDBNavigator
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
            Flat = True
            Options = []
            TabOrder = 0
          end
          object ToolButton7: TToolButton
            Left = 242
            Height = 5
            Top = 0
            Caption = 'ToolButton7'
            Style = tbsDivider
          end
          object AuswExportBtn: TToolButton
            Left = 247
            Top = 0
            AutoSize = True
            Caption = 'Export (CSV)'
            ImageIndex = 37
            OnClick = AuswExportBtnClick
          end
          object ToolButton9: TToolButton
            Left = 338
            Height = 5
            Top = 0
            Caption = 'ToolButton9'
            Style = tbsDivider
          end
          object EdiBtn: TToolButton
            Left = 343
            Top = 0
            AutoSize = True
            Caption = '&Bearbeiten'
            ImageIndex = 30
            OnClick = EdiBtnClick
          end
        end
      end
      object AllgTS: TTabSheet
        Caption = 'Allgemein'
      end
      object SQLExecTS: TTabSheet
        Caption = 'SQL'
        ClientHeight = 467
        ClientWidth = 775
        inline SQLEditor: TSynEdit
          Left = 0
          Height = 142
          Top = 5
          Width = 775
          Align = alTop
          Color = clWindow
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
          Highlighter = SynSQLSyn1
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
            'SQLEditor'
          )
          VisibleSpecialChars = [vscSpace, vscTabAtLast]
          ScrollBars = ssVertical
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
          OnChange = SQLEditorChange
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
        object Splitter1: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 0
          Width = 775
          Align = alTop
          ResizeAnchor = akTop
        end
        object ToolBar2: TToolBar
          Left = 0
          Height = 22
          Top = 445
          Width = 775
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 22
          ButtonWidth = 96
          Caption = 'ToolBar1'
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 2
          Wrapable = False
          object Auswahl2Btn: TToolButton
            Left = 1
            Top = 0
            AutoSize = True
            Caption = 'Zurück'
            ImageIndex = 36
            OnClick = AuswahlBtnClick
          end
          object ToolButton2: TToolButton
            Left = 97
            Height = 22
            Top = 0
            Caption = 'ToolButton2'
            Style = tbsDivider
          end
          object DBNavigator2: TDBNavigator
            Left = 102
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
            Flat = True
            Options = []
            TabOrder = 0
          end
          object ToolButton3: TToolButton
            Left = 343
            Height = 22
            Top = 0
            Caption = 'ToolButton3'
            Style = tbsDivider
          end
          object SQLExecBtn: TToolButton
            Left = 348
            Top = 0
            AutoSize = True
            Caption = 'Ausführen (F8)'
            ImageIndex = 18
            OnClick = SQLExecBtnClick
          end
          object ToolButton5: TToolButton
            Left = 444
            Height = 22
            Top = 0
            Caption = 'ToolButton5'
            Style = tbsDivider
          end
          object ExportBtn: TToolButton
            Left = 449
            Top = 0
            AutoSize = True
            Caption = 'Export (CSV)'
            ImageIndex = 37
            OnClick = ExportBtnClick
          end
        end
        object SqlGrid: TDBGrid
          Left = 0
          Height = 298
          Top = 147
          Width = 775
          Align = alClient
          Color = clWindow
          Columns = <>
          DataSource = EDS
          DefaultRowHeight = 17
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 3
        end
      end
      object FelderTS: TTabSheet
        Caption = 'Felder'
      end
    end
  end
  object SynSQLSyn1: TSynSQLSyn
    DefaultFilter = 'SQL-Dateien (*.sql)|*.sql'
    Enabled = False
    CommentAttri.BackPriority = 0
    CommentAttri.ForePriority = 0
    CommentAttri.FramePriority = 0
    CommentAttri.BoldPriority = 0
    CommentAttri.ItalicPriority = 0
    CommentAttri.UnderlinePriority = 0
    CommentAttri.StrikeOutPriority = 0
    DataTypeAttri.BackPriority = 0
    DataTypeAttri.ForePriority = 0
    DataTypeAttri.FramePriority = 0
    DataTypeAttri.BoldPriority = 0
    DataTypeAttri.ItalicPriority = 0
    DataTypeAttri.UnderlinePriority = 0
    DataTypeAttri.StrikeOutPriority = 0
    DefaultPackageAttri.BackPriority = 0
    DefaultPackageAttri.ForePriority = 0
    DefaultPackageAttri.FramePriority = 0
    DefaultPackageAttri.BoldPriority = 0
    DefaultPackageAttri.ItalicPriority = 0
    DefaultPackageAttri.UnderlinePriority = 0
    DefaultPackageAttri.StrikeOutPriority = 0
    ExceptionAttri.BackPriority = 0
    ExceptionAttri.ForePriority = 0
    ExceptionAttri.FramePriority = 0
    ExceptionAttri.BoldPriority = 0
    ExceptionAttri.ItalicPriority = 0
    ExceptionAttri.UnderlinePriority = 0
    ExceptionAttri.StrikeOutPriority = 0
    FunctionAttri.BackPriority = 0
    FunctionAttri.ForePriority = 0
    FunctionAttri.FramePriority = 0
    FunctionAttri.BoldPriority = 0
    FunctionAttri.ItalicPriority = 0
    FunctionAttri.UnderlinePriority = 0
    FunctionAttri.StrikeOutPriority = 0
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
    NumberAttri.BackPriority = 0
    NumberAttri.ForePriority = 0
    NumberAttri.FramePriority = 0
    NumberAttri.BoldPriority = 0
    NumberAttri.ItalicPriority = 0
    NumberAttri.UnderlinePriority = 0
    NumberAttri.StrikeOutPriority = 0
    PLSQLAttri.BackPriority = 0
    PLSQLAttri.ForePriority = 0
    PLSQLAttri.FramePriority = 0
    PLSQLAttri.BoldPriority = 0
    PLSQLAttri.ItalicPriority = 0
    PLSQLAttri.UnderlinePriority = 0
    PLSQLAttri.StrikeOutPriority = 0
    SpaceAttri.BackPriority = 0
    SpaceAttri.ForePriority = 0
    SpaceAttri.FramePriority = 0
    SpaceAttri.BoldPriority = 0
    SpaceAttri.ItalicPriority = 0
    SpaceAttri.UnderlinePriority = 0
    SpaceAttri.StrikeOutPriority = 0
    SQLPlusAttri.BackPriority = 0
    SQLPlusAttri.ForePriority = 0
    SQLPlusAttri.FramePriority = 0
    SQLPlusAttri.BoldPriority = 0
    SQLPlusAttri.ItalicPriority = 0
    SQLPlusAttri.UnderlinePriority = 0
    SQLPlusAttri.StrikeOutPriority = 0
    StringAttri.BackPriority = 0
    StringAttri.ForePriority = 0
    StringAttri.FramePriority = 0
    StringAttri.BoldPriority = 0
    StringAttri.ItalicPriority = 0
    StringAttri.UnderlinePriority = 0
    StringAttri.StrikeOutPriority = 0
    SymbolAttri.BackPriority = 0
    SymbolAttri.ForePriority = 0
    SymbolAttri.FramePriority = 0
    SymbolAttri.BoldPriority = 0
    SymbolAttri.ItalicPriority = 0
    SymbolAttri.UnderlinePriority = 0
    SymbolAttri.StrikeOutPriority = 0
    TableNameAttri.BackPriority = 0
    TableNameAttri.ForePriority = 0
    TableNameAttri.FramePriority = 0
    TableNameAttri.BoldPriority = 0
    TableNameAttri.ItalicPriority = 0
    TableNameAttri.UnderlinePriority = 0
    TableNameAttri.StrikeOutPriority = 0
    VariableAttri.BackPriority = 0
    VariableAttri.ForePriority = 0
    VariableAttri.FramePriority = 0
    VariableAttri.BoldPriority = 0
    VariableAttri.ItalicPriority = 0
    VariableAttri.UnderlinePriority = 0
    VariableAttri.StrikeOutPriority = 0
    SQLDialect = sqlSybase
    Left = 80
    Top = 72
  end
  object ExportDS: TDataSource
    DataSet = ExportTab
    Left = 131
    Top = 272
  end
  object EDS: TDataSource
    DataSet = EQuery
    Left = 336
    Top = 272
  end
  object ExportTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = ExportTabAfterPost
    AfterScroll = ExportTabAfterPost
    BeforePost = ExportTabBeforePost
    AfterPost = ExportTabAfterPost
    SQL.Strings = (
      'select * from EXPORT'
      'order by KURZBEZ'
    )
    Params = <>
    Left = 61
    Top = 272
    object ExportTabID: TZIntegerField
      DisplayLabel = 'lfd. Nr.'
      FieldKind = fkData
      FieldName = 'ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '00000'
    end
    object ExportTabKURZBEZ: TZRawStringField
      DisplayLabel = 'Beschreibung'
      DisplayWidth = 50
      FieldKind = fkData
      FieldName = 'KURZBEZ'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object ExportTabINFO: TZRawCLobField
      FieldKind = fkData
      FieldName = 'INFO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ExportTabQUERY: TZRawCLobField
      FieldKind = fkData
      FieldName = 'QUERY'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Visible = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ExportTabFELDER: TZRawCLobField
      FieldKind = fkData
      FieldName = 'FELDER'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ExportTabFORMULAR: TZBlobField
      FieldKind = fkData
      FieldName = 'FORMULAR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
    end
    object ExportTabFORMAT: TZRawStringField
      FieldKind = fkData
      FieldName = 'FORMAT'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 3
    end
    object ExportTabFILENAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'FILENAME'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Visible = False
      Size = 255
    end
    object ExportTabLAST_CHANGE: TZDateTimeField
      DisplayLabel = 'le. Änderung'
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'LAST_CHANGE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
    object ExportTabCHANGE_NAME: TZRawStringField
      DisplayLabel = 'geänd. von'
      DisplayWidth = 10
      FieldKind = fkData
      FieldName = 'CHANGE_NAME'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
  end
  object EQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = EQueryAfterOpen
    AfterClose = EQueryAfterOpen
    Params = <>
    Options = [doPreferPrepared]
    Left = 280
    Top = 272
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 200
    Top = 272
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Ausfhren1: TMenuItem
        Caption = 'Ausführen'
        ImageIndex = 18
        ShortCut = 119
        OnClick = Ausfhren1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      Enabled = False
      Visible = False
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      Enabled = False
      Visible = False
    end
  end
  object SaveDialog1: TSaveDialog
    Options = [ofHideReadOnly, ofEnableSizing, ofViewDetail]
    Left = 392
    Top = 272
  end
end
