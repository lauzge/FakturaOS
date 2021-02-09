object LogForm: TLogForm
  Left = 86
  Height = 427
  Top = 85
  Width = 560
  HorzScrollBar.Page = 368
  VertScrollBar.Page = 114
  AutoScroll = True
  Caption = 'Log'
  ClientHeight = 427
  ClientWidth = 560
  Color = clBtnFace
  Font.Color = clWindowText
  FormStyle = fsStayOnTop
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poMainFormCenter
  ShowInTaskBar = stNever
  LCLVersion = '7.2'
  object StatusBar1: TStatusBar
    Left = 0
    Height = 23
    Top = 404
    Width = 560
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Microsoft Sans Serif'
    Font.Quality = fqAntialiased
    Panels = <>
    ParentFont = False
  end
  object PC1: TPageControl
    Left = 0
    Height = 404
    Top = 0
    Width = 560
    ActivePage = LogTS
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    OnChange = PC1Change
    object LogTS: TTabSheet
      Caption = 'SQL-Log'
      ClientHeight = 376
      ClientWidth = 552
      object Panel1: TPanel
        Left = 0
        Height = 40
        Top = 336
        Width = 552
        Align = alBottom
        ClientHeight = 40
        ClientWidth = 552
        TabOrder = 0
        object Button1: TButton
          Left = 8
          Height = 25
          Top = 8
          Width = 75
          Caption = '&Leeren'
          OnClick = Button1Click
          TabOrder = 0
        end
        object LogAktivCB: TCheckBox
          Left = 88
          Height = 19
          Top = 12
          Width = 45
          Caption = 'aktiv'
          OnClick = LogAktivCBClick
          TabOrder = 1
        end
        object Label1: TLabel
          Left = 136
          Height = 15
          Top = 14
          Width = 23
          Caption = 'max'
          ParentColor = False
        end
        object LogMaxEntryEdit: TSpinEdit
          Left = 160
          Height = 23
          Top = 10
          Width = 80
          MaxValue = 10000
          OnChange = LogMaxEntryEditChange
          TabOrder = 2
        end
        object Label2: TLabel
          Left = 240
          Height = 15
          Top = 14
          Width = 119
          Caption = 'Einträge im Log halten'
          ParentColor = False
        end
      end
      object Memo1: TMemo
        Left = 0
        Height = 336
        Top = 0
        Width = 552
        Align = alClient
        Lines.Strings = (
          ''
        )
        ScrollBars = ssAutoVertical
        TabOrder = 1
      end
    end
    object SrvVarTS: TTabSheet
      Caption = 'Server Variablen'
    end
    object SrvStatusTS: TTabSheet
      Caption = 'Server Status'
      ClientHeight = 378
      ClientWidth = 552
      object SrvStatusGrid: TDBGrid
        Left = 0
        Height = 378
        Top = 0
        Width = 552
        Align = alClient
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'Variable_name'
            FieldName = 'Variable_name'
          end        
          item
            Title.Caption = 'Value'
            FieldName = 'Value'
          end>
        DataSource = SrvStatusDS
        ReadOnly = True
        TabOrder = 0
      end
    end
    object SrvProzListTS: TTabSheet
      Caption = 'Server Prozessliste'
      ClientHeight = 378
      ClientWidth = 552
      object SrvProzessGrid: TDBGrid
        Left = 0
        Height = 378
        Top = 0
        Width = 552
        Align = alClient
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'id'
            Width = 39
            FieldName = 'id'
          end        
          item
            Title.Caption = 'User'
            Width = 96
            FieldName = 'User'
          end        
          item
            Title.Caption = 'Host'
            Width = 137
            FieldName = 'Host'
          end        
          item
            Title.Caption = 'db'
            Width = 93
            FieldName = 'db'
          end        
          item
            Title.Caption = 'Command'
            Width = 76
            FieldName = 'Command'
          end        
          item
            Title.Caption = 'Time'
            Width = 38
            FieldName = 'Time'
          end        
          item
            Title.Caption = 'State'
            Width = 113
            FieldName = 'State'
          end        
          item
            Title.Caption = 'Info'
            Width = 165
            FieldName = 'Info'
          end>
        DataSource = SrvProzDS
        TabOrder = 0
      end
    end
  end
  object SrvStatusDS: TDataSource
    DataSet = SrvStatus
    Left = 304
    Top = 104
  end
  object SrvProzDS: TDataSource
    DataSet = SrvProzList
    Left = 304
    Top = 176
  end
  object SrvProzList: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'SHOW PROCESSLIST'
    )
    Params = <>
    Left = 200
    Top = 177
  end
  object SrvStatus: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'show status'
    )
    Params = <>
    Left = 200
    Top = 104
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 72
    Top = 104
  end
end
