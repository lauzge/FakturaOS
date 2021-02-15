object JournalVKAGBForm: TJournalVKAGBForm
  Left = 430
  Height = 564
  Top = 256
  Width = 690
  Caption = 'Journal Verkauf Angebot'
  ClientHeight = 564
  ClientWidth = 690
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  LCLVersion = '7.2'
  object JournalPanel: TPanel
    Left = 0
    Height = 564
    Top = 0
    Width = 690
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 564
    ClientWidth = 690
    TabOrder = 0
    object ArtPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 690
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
    end
    object ToolBar2: TToolBar
      Left = 0
      Height = 26
      Top = 538
      Width = 690
      Align = alBottom
      AutoSize = True
      BorderWidth = 2
      Caption = 'ToolBar2'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.ImageList1
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 1
      Wrapable = False
    end
    object Panel1: TPanel
      Left = 0
      Height = 511
      Top = 27
      Width = 690
      Align = alClient
      BevelOuter = bvNone
      ClientHeight = 511
      ClientWidth = 690
      TabOrder = 2
      object DetailPan: TPanel
        Left = 0
        Height = 511
        Top = 0
        Width = 690
        Align = alClient
        BevelOuter = bvNone
        ClientHeight = 511
        ClientWidth = 690
        TabOrder = 0
        object ReInfoPC: TPageControl
          Left = 0
          Height = 139
          Top = 372
          Width = 690
          ActivePage = TabSheet1
          Align = alBottom
          TabIndex = 0
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'TabSheet1'
          end
          object TabSheet2: TTabSheet
            Caption = 'TabSheet2'
          end
          object TabSheet3: TTabSheet
            Caption = 'TabSheet3'
          end
          object TabSheet4: TTabSheet
            Caption = 'TabSheet4'
          end
        end
        object Splitter1: TSplitter
          Cursor = crVSplit
          Left = 0
          Height = 5
          Top = 367
          Width = 690
          Align = alBottom
          ResizeAnchor = akBottom
        end
        object JourGrid: TDBGrid
          Left = 0
          Height = 367
          Top = 0
          Width = 690
          Align = alClient
          Color = clWindow
          Columns = <>
          TabOrder = 2
        end
      end
    end
  end
end
