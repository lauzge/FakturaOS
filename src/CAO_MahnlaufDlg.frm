object MahnForm: TMahnForm
  Left = 430
  Height = 546
  Top = 256
  Width = 811
  Caption = 'MahnForm'
  ClientHeight = 546
  ClientWidth = 811
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  Menu = MainMenu1
  LCLVersion = '7.2'
  object MainPanel: TPanel
    Left = 0
    Height = 546
    Top = 0
    Width = 811
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 546
    ClientWidth = 811
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 811
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 807
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object DatumAW: TVolgaPeriod
        Left = 671
        Height = 23
        Top = 0
        Width = 136
        KindRange = ksYear
        Year = 2000
        Month = 1
        Align = alRight
        ButtonWidth = 17
        Color = clBtnShadow
        EnablePopup = True
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 99
        Align = alLeft
        Caption = '  Mahnungen   '
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object MahnErfassenBtn: TSpeedButton
        Left = 400
        Height = 22
        Top = 0
        Width = 75
        Caption = 'Mahnlauf'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentFont = False
      end
      object MahnDruckenBtn: TSpeedButton
        Left = 476
        Height = 22
        Top = 0
        Width = 73
        Caption = 'Drucken'
        Flat = True
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentFont = False
      end
    end
    object PC1: TPageControl
      Left = 0
      Height = 519
      Top = 27
      Width = 811
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ClientHeight = 493
        ClientWidth = 803
        object ToolBar2: TToolBar
          Left = 0
          Height = 26
          Top = 467
          Width = 803
          Align = alBottom
          AutoSize = True
          BorderWidth = 2
          ButtonHeight = 26
          ButtonWidth = 23
          Caption = 'ToolBar2'
          EdgeBorders = []
          Images = MainForm.ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object DBNavigator1: TDBNavigator
            Left = 1
            Height = 26
            Top = 0
            Width = 135
            BevelOuter = bvNone
            ChildSizing.EnlargeHorizontal = crsScaleChilds
            ChildSizing.EnlargeVertical = crsScaleChilds
            ChildSizing.ShrinkHorizontal = crsScaleChilds
            ChildSizing.ShrinkVertical = crsScaleChilds
            ChildSizing.Layout = cclLeftToRightThenTopToBottom
            ChildSizing.ControlsPerLine = 100
            ClientHeight = 26
            ClientWidth = 135
            DataSource = MahnDS
            Flat = True
            Options = []
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          end
          object ToolButton1: TToolButton
            Left = 136
            Height = 26
            Top = 0
            Caption = 'ToolButton1'
            Style = tbsSeparator
          end
          object AlleFreigebenBtn: TToolButton
            Left = 144
            Top = 0
            AutoSize = True
            Caption = 'alle Freigeben'
            ImageIndex = 18
          end
          object KeineFreigebenBtn: TToolButton
            Left = 236
            Top = 0
            AutoSize = True
            Caption = 'keine Freigeben'
            ImageIndex = 19
          end
          object ToolButton2: TToolButton
            Left = 338
            Height = 26
            Top = 0
            Caption = 'ToolButton2'
            Style = tbsSeparator
          end
          object MahnenBtn: TToolButton
            Left = 346
            Top = 0
            AutoSize = True
            Caption = 'Mahnen'
            ImageIndex = 12
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Height = 467
          Top = 0
          Width = 803
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Mahnen'
              Width = 43
              FieldName = 'FREIGABE1_FLAG'
            end          
            item
              Title.Caption = 'Beleg'
              Width = 51
              FieldName = 'VRENUM'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'Datum'
              FieldName = 'RDATUM'
            end          
            item
              Title.Caption = 'Name des Kunden'
              Width = 167
              FieldName = 'KUN_NAME1'
            end          
            item
              Title.Caption = 'Netto'
              Visible = False
              FieldName = 'NSUMME'
            end          
            item
              Title.Caption = 'MwSt'
              Visible = False
              FieldName = 'MSUMME'
            end          
            item
              Title.Caption = 'Brutto'
              FieldName = 'BSUMME'
            end          
            item
              Title.Caption = 'Ziel'
              FieldName = 'SOLL_NTAGE'
            end          
            item
              Title.Caption = 'Tage offen'
              Width = 59
              FieldName = 'TAGE_OFFEN'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'MS'
              Width = 23
              FieldName = 'MAHNSTUFE'
            end          
            item
              Title.Caption = 'le. Mahnung'
              FieldName = 'MAHNDATUM'
            end          
            item
              Alignment = taCenter
              Title.Caption = 'neue Mahnstufe'
              Width = 87
              FieldName = 'NEW_MAHNSTUFE'
            end>
          DataSource = MahnDS
          Flat = True
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
      end
    end
  end
  object MahnTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select '
      'REC_ID, QUELLE, VRENUM, RDATUM, KUN_NAME1, BSUMME, SOLL_NTAGE, STADIUM, '
      'MAHNSTUFE, MAHNDATUM, MAHNSTUFE+1 as NEW_MAHNSTUFE,  FREIGABE1_FLAG, MAHNPRINT,'
      'TO_DAYS(CURDATE())-TO_DAYS(RDATUM) as TAGE_OFFEN'
      'from JOURNAL'
      'where (QUELLE=3) and (RDATUM>''2001-01-01'') and (BSUMME !=0) and'
      '('
      '  ('
      '    (STADIUM BETWEEN 20 and 29) and  (TO_DAYS(RDATUM)+SOLL_NTAGE<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '  ('
      '    (STADIUM BETWEEN 30 and 39) and  (TO_DAYS(MAHNDATUM)+:STUFE2_TAGE<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '  ('
      '    (STADIUM BETWEEN 40 and 49) and  (TO_DAYS(MAHNDATUM)+:STUFE3_TAGE<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '  ('
      '    (STADIUM BETWEEN 50 and 59) and  (TO_DAYS(MAHNDATUM)+:STUFE4_TAGE<TO_DAYS(CURDATE()) )'
      '  )'
      '  or'
      '    ('
      '      (STADIUM BETWEEN 70 and 79) and   (RDATUM+SOLL_NTAGE<CURDATE()) and'
      '      ('
      '        (MAHNSTUFE=0) or'
      '        ( (MAHNSTUFE>0) and  ( TO_DAYS(MAHNDATUM)+:STUFE1_TAGE < TO_DAYS(CURDATE()) ) )'
      '      )'
      '    )'
      ')'
      'order by RDATUM, VRENUM'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'STUFE2_TAGE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'STUFE3_TAGE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'STUFE4_TAGE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'STUFE1_TAGE'
        ParamType = ptUnknown
      end>
    Left = 95
    Top = 212
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'STUFE2_TAGE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'STUFE3_TAGE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'STUFE4_TAGE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'STUFE1_TAGE'
        ParamType = ptUnknown
      end>
    object MahnTabQUELLE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object MahnTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object MahnTabRDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object MahnTabKUN_NAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object MahnTabBSUMME: TFloatField
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object MahnTabSOLL_NTAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0 Tage'
    end
    object MahnTabTAGE_OFFEN: TZIntegerField
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'TAGE_OFFEN'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0 Tage'
    end
    object MahnTabSTADIUM: TZShortIntField
      FieldKind = fkData
      FieldName = 'STADIUM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object MahnTabMAHNSTUFE: TZShortIntField
      FieldKind = fkData
      FieldName = 'MAHNSTUFE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0;-0; '
    end
    object MahnTabMAHNDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'MAHNDATUM'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NAD'
    end
    object MahnTabNEW_MAHNSTUFE: TZIntegerField
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'NEW_MAHNSTUFE'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0'
    end
    object MahnTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object MahnTabFREIGABE1_FLAG: TBooleanField
      DisplayLabel = 'Mahnen'
      DisplayWidth = 2
      FieldKind = fkData
      FieldName = 'FREIGABE1_FLAG'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayValues = 'True;False'
    end
    object MahnTabMAHNPRINT: TZSmallIntField
      FieldKind = fkData
      FieldName = 'MAHNPRINT'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object MahnPrintTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select '
      'REC_ID, QUELLE, VRENUM, RDATUM, ADDR_ID,'
      'NSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME, BSUMME,'
      'ZAHLART, STADIUM, WAEHRUNG, '
      'SOLL_STAGE, SOLL_SKONTO, SOLL_NTAGE, '
      'IST_ANZAHLUNG, IST_SKONTO, IST_ZAHLDAT, IST_BETRAG, MAHNKOSTEN, GEGENKONTO,'
      'KUN_NUM, KUN_ANREDE, KUN_NAME1, KUN_NAME2, KUN_NAME3, KUN_ABTEILUNG, '
      'KUN_STRASSE, KUN_PLZ, KUN_LAND, KUN_ORT,'
      '(BSUMME - IST_ANZAHLUNG - IST_BETRAG) as SALDO,'
      'MAHNSTUFE, TO_DAYS(CURDATE())-TO_DAYS(RDATUM) as TAGE_OFFEN, MAHNPRINT'
      'from JOURNAL'
      'where STADIUM BETWEEN 30 and 79 and QUELLE=3 and YEAR(RDATUM) > 2000 and BSUMME !=0 and MAHNPRINT>0'
      'order by KUN_NAME1, ADDR_ID, RDATUM, VRENUM'
    )
    Params = <>
    Left = 95
    Top = 276
    object MahnPrintTabQUELLE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'QUELLE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object MahnPrintTabVRENUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'VRENUM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object MahnPrintTabRDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'RDATUM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      InvalidDisplayText = 'NAD'
    end
    object MahnPrintTabADDR_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ADDR_ID'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object MahnPrintTabBSUMME: TFloatField
      FieldKind = fkData
      FieldName = 'BSUMME'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object MahnPrintTabWAEHRUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'WAEHRUNG'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object MahnPrintTabSOLL_NTAGE: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SOLL_NTAGE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0 Tage'
    end
    object MahnPrintTabMAHNKOSTEN: TZDoubleField
      FieldKind = fkData
      FieldName = 'MAHNKOSTEN'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
      Precision = 10
    end
    object MahnPrintTabGEGENKONTO: TZIntegerField
      FieldKind = fkData
      FieldName = 'GEGENKONTO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object MahnPrintTabKUN_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NUM'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object MahnPrintTabKUN_NAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUN_NAME1'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object MahnPrintTabSALDO: TFloatField
      FieldKind = fkData
      FieldName = 'SALDO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = ',#0.00'
    end
    object MahnPrintTabMAHNSTUFE: TZShortIntField
      FieldKind = fkData
      FieldName = 'MAHNSTUFE'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object MahnPrintTabTAGE_OFFEN: TZIntegerField
      DisplayWidth = 15
      FieldKind = fkData
      FieldName = 'TAGE_OFFEN'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '0 Tage'
    end
    object MahnPrintTabREC_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object MahnPrintTabMAHNPRINT: TZShortIntField
      FieldKind = fkData
      FieldName = 'MAHNPRINT'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object SumTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select FREIGABE1_FLAG, COUNT(*) as ANZAHL from JOURNAL '
      'where QUELLE=3 and YEAR(RDATUM) > 2000 and  STADIUM BETWEEN 20 and 79'
      'group BY FREIGABE1_FLAG'
    )
    Params = <>
    Left = 95
    Top = 344
  end
  object MahnDS: TDataSource
    DataSet = MahnTab
    Left = 200
    Top = 212
  end
  object MahnPrintDS: TDataSource
    DataSet = MahnPrintTab
    Left = 200
    Top = 276
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 212
  end
end
