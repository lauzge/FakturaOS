object DBForm: TDBForm
  Left = 86
  Height = 411
  Top = 85
  Width = 561
  HelpContext = 100400
  Caption = 'Datenbank prüfen, optimieren, reparieren'
  ClientHeight = 411
  ClientWidth = 561
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object Panel1: TPanel
    Left = 0
    Height = 41
    Top = 347
    Width = 561
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 41
    ClientWidth = 561
    TabOrder = 0
    object PruefBtn: TBitBtn
      Left = 0
      Height = 30
      Top = 6
      Width = 145
      Caption = 'Prüfen'
      OnClick = PruefBtnClick
      TabOrder = 0
    end
    object OptBtn: TBitBtn
      Left = 208
      Height = 30
      Top = 6
      Width = 145
      Caption = 'Optimieren'
      OnClick = OptBtnClick
      TabOrder = 1
    end
    object RepBtn: TBitBtn
      Left = 416
      Height = 30
      Top = 6
      Width = 145
      Caption = 'Reparieren'
      OnClick = RepBtnClick
      TabOrder = 2
    end
  end
  object SrvStatusGrid: TDBGrid
    Left = 0
    Height = 347
    Top = 0
    Width = 561
    Align = alClient
    Color = clWindow
    Columns = <    
      item
        Title.Caption = 'Tabelle'
        Width = 139
        FieldName = 'Table'
      end    
      item
        Title.Caption = 'Operation'
        FieldName = 'Op'
      end    
      item
        Title.Caption = 'Meldungstyp'
        Width = 74
        FieldName = 'Msg_type'
      end    
      item
        Title.Caption = 'Status'
        Width = 238
        FieldName = 'Msg_text'
      end>
    DataSource = StatusDS
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Height = 23
    Top = 388
    Width = 561
    Panels = <>
  end
  object StatusDS: TDataSource
    DataSet = Status
    Left = 214
    Top = 154
  end
  object Status: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'OPTIMIZE TABLE'
      'ADRESSEN, APARTNER, ARTIKEL, ARTIKEL_LTEXT, ARTIKEL_SERNUM, ARTIKEL_STUECKLIST,'
      'BLZ, FIBU_BUCHUNGEN, FIBU_JOURNAL, FIBU_KASSE, FIBU_KONTEN, FIBU_OPOS, INFO,'
      'JOURNAL, JOURNALPOS, KFZ, LAND, PLZ, REGISTERY, VERTRETER'
    )
    Params = <>
    Left = 144
    Top = 154
    object StatusTable: TZRawStringField
      FieldKind = fkData
      FieldName = 'Table'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Size = 128
    end
    object StatusOp: TZRawStringField
      FieldKind = fkData
      FieldName = 'Op'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Size = 10
    end
    object StatusMsg_type: TZRawStringField
      FieldKind = fkData
      FieldName = 'Msg_type'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Size = 10
    end
    object StatusMsg_text: TZRawCLobField
      FieldKind = fkData
      FieldName = 'Msg_text'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
  end
end
