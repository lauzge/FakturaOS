object FrmSoundDialog: TFrmSoundDialog
  Left = 323
  Height = 474
  Top = 278
  Width = 736
  HorzScrollBar.Page = 401
  VertScrollBar.Page = 261
  Caption = 'FrmSoundDialog'
  ClientHeight = 474
  ClientWidth = 736
  KeyPreview = True
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '6.0'
  object PageControl1: TPageControl
    Left = 0
    Height = 474
    Top = 0
    Width = 736
    TabStop = False
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Select A Sound'
      ClientHeight = 446
      ClientWidth = 728
      object RightPanel: TPanel
        Left = 209
        Height = 446
        Top = 0
        Width = 519
        Align = alClient
        BevelOuter = bvNone
        ClientHeight = 446
        ClientWidth = 519
        TabOrder = 2
        object Panel1: TPanel
          Left = 0
          Height = 27
          Top = 0
          Width = 519
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          ClientHeight = 27
          ClientWidth = 519
          TabOrder = 0
          object CBDefault: TCheckBox
            Left = 4
            Height = 19
            Top = 4
            Width = 73
            BorderSpacing.Around = 4
            Caption = 'CBDefault'
            OnClick = CBDefaultClick
            TabOrder = 0
          end
        end
        object ButtonPanel: TPanel
          Left = 0
          Height = 38
          Top = 408
          Width = 519
          Align = alBottom
          BevelOuter = bvNone
          ClientHeight = 38
          ClientWidth = 519
          TabOrder = 2
          object PlayButton: TSpeedButton
            Left = 4
            Height = 25
            Top = 8
            Width = 29
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666660066666666666666668866666666
              0000666666603086666666666666688886666666000066666603077866686666
              66668887786668660000666660388FF866866666666888877866866600006666
              03B07FF8686666666688787778686666000066003BF07FF8666666668887F877
              7866666600006038BFB00FF866666668887F788778666666000063B7FBF080F8
              6888866877F7F88878688886000063B7BFB070F866666668777F787878666666
              000063F7FBF00FF866666668F7F7F8877866666600006633BFB07FF868666666
              887F787778686666000066663BF07FF8668666666687F8777866866600006666
              63B887F866686666666878877866686600006666663B07766666666666668787
              7866666600006666666380866666666666666888866666660000666666660066
              6666666666666688666666660000666666666666666666666666666666666666
              0000
            }
            NumGlyphs = 2
            OnClick = PlayButtonClick
          end
          object OkBtn: TButton
            Left = 356
            Height = 25
            Top = 8
            Width = 75
            Anchors = [akTop, akRight]
            Caption = 'OkBtn'
            Default = True
            ModalResult = 1
            OnClick = OkBtnClick
            TabOrder = 0
          end
          object CancelBtn: TButton
            Left = 436
            Height = 25
            Top = 8
            Width = 75
            Anchors = [akTop, akRight]
            Cancel = True
            Caption = 'CancelBtn'
            ModalResult = 2
            OnClick = CancelBtnClick
            TabOrder = 1
          end
        end
        object ShellListView: TShellListView
          Left = 0
          Height = 381
          Top = 27
          Width = 515
          Align = alClient
          BorderSpacing.Right = 4
          Color = clDefault
          HideSelection = False
          Mask = '*.wav'
          ReadOnly = True
          TabOrder = 1
          ObjectTypes = [otNonFolders]
          ShellTreeView = ShellTreeView
        end
        object Panel3: TPanel
          Left = 61
          Height = 90
          Top = 110
          Width = 170
          BevelOuter = bvNone
          BorderStyle = bsSingle
          ClientHeight = 86
          ClientWidth = 166
          TabOrder = 3
          object Label3: TLabel
            Left = 0
            Height = 86
            Top = 0
            Width = 166
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'Nothing to select from'
            Layout = tlCenter
            ParentColor = False
            WordWrap = True
          end
        end
      end
      object Splitter1: TSplitter
        Left = 204
        Height = 446
        Top = 0
        Width = 5
      end
      object Panel4: TPanel
        Left = 4
        Height = 438
        Top = 4
        Width = 200
        Align = alLeft
        BorderSpacing.Left = 4
        BorderSpacing.Top = 4
        BorderSpacing.Bottom = 4
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ClientHeight = 434
        ClientWidth = 196
        Constraints.MinWidth = 200
        TabOrder = 0
        object ShellTreeView: TShellTreeView
          Left = 4
          Height = 306
          Top = 136
          Width = 180
          BorderStyle = bsNone
          FileSortType = fstNone
          ReadOnly = True
          TabOrder = 0
          Options = [tvoAutoItemHeight, tvoHideSelection, tvoKeepCollapsedNodes, tvoReadOnly, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoToolTips, tvoThemedDraw]
          ObjectTypes = [otFolders]
          ShellListView = ShellListView
        end
        object Label4: TLabel
          Left = 0
          Height = 86
          Top = 16
          Width = 166
          Alignment = taCenter
          AutoSize = False
          Caption = 'Nothing to select from'
          Layout = tlCenter
          ParentColor = False
          WordWrap = True
        end
      end
    end
  end
end
