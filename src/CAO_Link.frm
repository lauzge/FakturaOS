object LinkForm: TLinkForm
  Left = 86
  Height = 336
  Top = 85
  Width = 694
  Caption = 'Dateiverknüpfungen'
  ClientHeight = 336
  ClientWidth = 694
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  ShowInTaskBar = stNever
  LCLVersion = '7.2'
  object MainPanel: TPanel
    Left = 0
    Height = 336
    Top = 0
    Width = 694
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 336
    ClientWidth = 694
    TabOrder = 0
    object StatusBar1: TStatusBar
      Left = 0
      Height = 23
      Top = 313
      Width = 694
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Microsoft Sans Serif'
      Font.Quality = fqAntialiased
      Panels = <>
      ParentFont = False
    end
    object ToolBar1: TToolBar
      Left = 0
      Height = 26
      Top = 0
      Width = 694
      Caption = 'ToolBar1'
      Images = ImageList1
      TabOrder = 1
      object AddBtn: TToolButton
        Left = 1
        Hint = 'Dateilink hinzufügen'
        Top = 2
        Caption = 'AddBtn'
        ImageIndex = 5
        OnClick = AddBtnClick
      end
      object DelBtn: TToolButton
        Left = 24
        Hint = 'Dateilink entfernen'
        Top = 2
        Caption = 'Löschen'
        ImageIndex = 4
        OnClick = DelBtnClick
      end
      object ToolButton7: TToolButton
        Left = 47
        Height = 22
        Top = 2
        Caption = 'ToolButton7'
        Style = tbsSeparator
      end
      object GrSymBtn: TToolButton
        Left = 55
        Hint = 'Große Symbole'
        Top = 2
        Caption = 'gross'
        ImageIndex = 0
        OnClick = GrSymBtnClick
      end
      object KLSymBtn: TToolButton
        Left = 78
        Hint = 'Kleine Symbole'
        Top = 2
        Caption = 'kl. Symbole'
        ImageIndex = 1
        OnClick = KLSymBtnClick
      end
      object ListeBtn: TToolButton
        Left = 101
        Hint = 'Liste'
        Top = 2
        Caption = 'Liste'
        ImageIndex = 2
        OnClick = ListeBtnClick
      end
      object DetailsBtn: TToolButton
        Left = 124
        Hint = 'Details'
        Top = 2
        Caption = 'Details'
        ImageIndex = 3
        OnClick = DetailsBtnClick
      end
    end
    object LV1: TListView
      Left = 0
      Height = 287
      Top = 26
      Width = 694
      Align = alClient
      BorderStyle = bsNone
      Color = clWindow
      Columns = <      
        item
          Caption = 'Datei'
          Width = 180
        end      
        item
          Caption = 'Pfad'
          Width = 200
        end      
        item
          Caption = 'Größe'
          Width = 100
        end      
        item
          Caption = 'Typ'
          Width = 150
        end      
        item
          Caption = 'Geändert'
          Width = 100
        end>
      Font.Color = clWindowText
      ParentFont = False
      TabOrder = 2
      ViewStyle = vsReport
      OnDblClick = LV1DblClick
      OnKeyDown = LV1KeyDown
    end
  end
  object ImageList1: TImageList
    Masked = True
    ShareImages = True
    Left = 176
    Top = 120
    Bitmap = {
      4C7A060000001000000010000000CF0000000000000078DAED57ED0E802008F4
      BDFBEB7BD3C7E666A427A24B3364FC70C7811DE48A1C75B1CD390AAEE59F4B9B
      23F0438E11FC560DB4762C4AB9F5E73BFDF9B2B56A1ACF16D7EB8DBBC7B45D43
      5BD36A4EDD2538D25D82A31AB3F7C5F433FD56B0D4F74D69DFF3BF43E33DEA8F
      7E7EABFFDFFA7FB44B3AE7E9BA96018EB93E1913E3DEDF71CEE5388A9170510E
      293797A3868B72D4F1F5F573E797E440DC528EDC334B7220BD245A966604CDA6
      040F31353D1C66ECD55E9E9F5810E67DAD3CDE63B61AF9E79E3B8F8FDDFA3F87
      EDD4148CF9
    }
  end
  object LinkDS: TDataSource
    DataSet = LinkTab
    Left = 112
    Top = 120
  end
  object LinkTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = LinkTabAfterOpen
    BeforePost = LinkTabBeforePost
    AfterPost = LinkTabAfterOpen
    SQL.Strings = (
      'select * from LINK'
      'where MODUL_ID=:MID and REC_ID=:RID '
      'order by DATEI, PFAD'
      ''
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'MID'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RID'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 120
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'MID'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RID'
        ParamType = ptUnknown
      end>
    object LinkTabPFAD: TZRawStringField
      FieldKind = fkData
      FieldName = 'PFAD'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object LinkTabDATEI: TZRawStringField
      FieldKind = fkData
      FieldName = 'DATEI'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 200
    end
    object LinkTabMODUL_ID: TZSmallIntField
      FieldKind = fkData
      FieldName = 'MODUL_ID'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object LinkTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object OpenDialog1: TOpenDialog
    Title = 'Datei hinzufügen'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing, ofViewDetail]
    Left = 248
    Top = 120
  end
end
