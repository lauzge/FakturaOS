object RegEdiForm: TRegEdiForm
  Left = 86
  Height = 446
  Top = 85
  Width = 764
  HelpContext = 100050
  Caption = 'Registrierungseditor'
  ClientHeight = 446
  ClientWidth = 764
  Color = clBtnFace
  Font.Color = clWindowText
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object StatusBar1: TStatusBar
    Left = 0
    Height = 23
    Top = 423
    Width = 764
    Panels = <>
  end
  object TV: TTreeView
    Left = 0
    Height = 423
    Top = 0
    Width = 177
    Align = alLeft
    Images = ImageList1
    TabOrder = 1
    OnChange = TVChange
  end
  object Panel1: TPanel
    Left = 177
    Height = 423
    Top = 0
    Width = 587
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 423
    ClientWidth = 587
    TabOrder = 2
    object EdiPanel: TPanel
      Left = 0
      Height = 62
      Top = 336
      Width = 587
      Align = alBottom
      BevelOuter = bvNone
      ClientHeight = 62
      ClientWidth = 587
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Height = 15
        Top = 13
        Width = 32
        Caption = 'Name'
        ParentColor = False
      end
      object Label2: TLabel
        Left = 8
        Height = 15
        Top = 40
        Width = 25
        Caption = 'Wert'
        ParentColor = False
      end
      object Label3: TLabel
        Left = 240
        Height = 15
        Top = 13
        Width = 18
        Caption = 'Typ'
        ParentColor = False
      end
      object KeyEdit: TDBEdit
        Left = 48
        Height = 23
        Top = 8
        Width = 183
        DataField = 'NAME'
        DataSource = DataSource1
        MaxLength = 0
        TabOrder = 0
      end
      object WertEdi: TDBEdit
        Left = 48
        Height = 23
        Top = 35
        Width = 399
        DataSource = DataSource1
        MaxLength = 0
        TabOrder = 1
      end
      object FormSaveBtn: TSpeedButton
        Left = 456
        Height = 50
        Top = 8
        Width = 131
        Caption = 'Formular speichern'
        OnClick = FormSaveBtnClick
      end
      object TypAWCB: TRxDBComboBox
        Left = 264
        Height = 23
        Top = 8
        Width = 183
        Style = csDropDownList
        DataField = 'VAL_TYP'
        DataSource = DataSource1
        EnableValues = True
        ItemHeight = 15
        Items.Strings = (
          'Char'
          'DateTime'
          'Integer'
          'Double'
          'Blob'
          'Binär'
          'Formular'
        )
        MaxLength = 0
        TabOrder = 2
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
        )
        OnChange = TypAWCBChange
      end
    end
    object NaviPanel: TPanel
      Left = 0
      Height = 25
      Top = 398
      Width = 587
      Align = alBottom
      BevelOuter = bvNone
      ClientHeight = 25
      ClientWidth = 587
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 0
        Height = 25
        Top = 0
        Width = 587
        Align = alClient
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 25
        ClientWidth = 587
        DataSource = DataSource1
        Options = []
        TabOrder = 0
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Height = 336
      Top = 0
      Width = 587
      Align = alClient
      Color = clWindow
      Columns = <      
        item
          Title.Caption = 'Name'
          Width = 135
          FieldName = 'NAME'
        end      
        item
          Title.Caption = 'Typ'
          Width = 78
          FieldName = 'Typ_Str'
        end      
        item
          Title.Caption = 'Wert'
          Width = 254
          FieldName = 'Value_Str'
        end>
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 312
    Top = 183
  end
  object ImageList1: TImageList
    Left = 80
    Top = 264
    Bitmap = {
      4C7A0D0000001000000010000000A00100000000000078DAED5A8B0E83200CDC
      C7F36DFE16333A12565BFA001DCED390CE6CD72BAE8742C9AF3CC5B91E993617
      36EF476D2D3E385E4BD3B8355B7C6CD689CD040FFE3EFE6559DCED90031D3984
      7380FE4B1E55D6A37F8AAD7DB4E26A615B3EADFCA26DF08772B16057BBE5B7C1
      1EB01F2D59B1F47FB7626BFD856267EEFF95DA87DAFB9FBFDFB91B6B23B84BEE
      E44F6E796CAD9F880FF0CFC1DF95BB0FD2B1866F1D9A0F0B9E8EDD117E298E1A
      9FD6CF75E37C79F93D78CA4FE300FFB9FC51FC9DC70DE8FFF7F903FCBDF1D0FF
      7FE97FFBD92B9E3F4FC7F7EAEF6EF13F7D0DA1A75F651D20E2A36053DA9B77ED
      B1C67A7DD0758CE87FDCD3FFD178718D53B896EEE3F71A9F7C6D5943B6C48013
      F5BF99EA7F4DDF96FA97E25BE267FB7C21FFB0FEA3FE87FA1FEA7FEEFA9F47C3
      877E1935CCD5FF282F1B23A3FFACF0486387A5FEC77D87FA1FF48FFAFFC9F57F
      26C69412EAFFD03FF6FF9DB9FF4E1B23B0FF0FEFFF13EA5FDA9F7185FEA37B47
      EAFC8FEC5D01FF187EE87F3EFD47B0D23B32DEFF3BE6FFCA33949DFF737EC95A
      A23AFFA7B8C6F3FFACF93F9D9BFCE3FBFF1B2785E2B2
    }
  end
  object DataSource1: TDataSource
    DataSet = ValQuery
    Left = 80
    Top = 328
  end
  object ValQuery: TZQuery
    Connection = DM1.DB1
    AfterOpen = ValQueryAfterScroll
    AfterScroll = ValQueryAfterScroll
    OnCalcFields = ValQueryCalcFields
    BeforePost = ValQueryBeforePost
    SQL.Strings = (
      'select * from REGISTERY'
      'where MAINKEY=''MAIN'''
      'order by MAINKEY, NAME'
    )
    Params = <>
    Left = 80
    Top = 190
    object ValQueryNAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 100
    end
    object ValQueryVAL_TYP: TZSmallIntField
      FieldKind = fkData
      FieldName = 'VAL_TYP'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ValQueryTyp_Str: TStringField
      FieldKind = fkCalculated
      FieldName = 'Typ_Str'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object ValQueryValue_Str: TStringField
      FieldKind = fkCalculated
      FieldName = 'Value_Str'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object ValQueryMAINKEY: TZRawStringField
      FieldKind = fkData
      FieldName = 'MAINKEY'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object ValQueryVAL_CHAR: TZRawStringField
      FieldKind = fkData
      FieldName = 'VAL_CHAR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ValQueryVAL_DATE: TZDateTimeField
      FieldKind = fkData
      FieldName = 'VAL_DATE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NADT'
    end
    object ValQueryVAL_INT: TZIntegerField
      FieldKind = fkData
      FieldName = 'VAL_INT'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ValQueryVAL_DOUBLE: TZDoubleField
      FieldKind = fkData
      FieldName = 'VAL_DOUBLE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 22
    end
    object ValQueryVAL_BLOB: TZRawCLobField
      FieldKind = fkData
      FieldName = 'VAL_BLOB'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ValQueryVAL_BIN: TZBlobField
      FieldKind = fkData
      FieldName = 'VAL_BIN'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object RootQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'SELECT MAINKEY FROM REGISTERY GROUP BY MAINKEY ORDER BY MAINKEY'
    )
    Params = <>
    Left = 80
    Top = 128
    object RootQueryMAINKEY: TZRawStringField
      FieldKind = fkData
      FieldName = 'MAINKEY'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
  end
end
