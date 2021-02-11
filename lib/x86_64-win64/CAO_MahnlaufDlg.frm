object MahnForm: TMahnForm
  Left = 430
  Height = 546
  Top = 256
  Width = 811
  Caption = 'MahnForm'
  ClientHeight = 526
  ClientWidth = 811
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
    Height = 526
    Top = 0
    Width = 811
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 526
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
        OnClick = MahnErfassenBtnClick
        OnMouseEnter = MahnDruckenBtnMouseEnter
        OnMouseLeave = MahnDruckenBtnMouseLeave
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
        OnClick = MahnDruckenBtnClick
        OnMouseEnter = MahnDruckenBtnMouseEnter
        OnMouseLeave = MahnDruckenBtnMouseLeave
        ParentFont = False
      end
    end
    object PC1: TPageControl
      Left = 0
      Height = 499
      Top = 27
      Width = 811
      ActivePage = TabSheet3
      Align = alClient
      TabIndex = 1
      TabOrder = 1
      OnChange = PC1Change
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ClientHeight = 473
        ClientWidth = 803
        object ToolBar2: TToolBar
          Left = 0
          Height = 26
          Top = 447
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
            Enabled = False
            ImageIndex = 18
            MenuItem = Allesmarkieren1
          end
          object KeineFreigebenBtn: TToolButton
            Left = 236
            Top = 0
            AutoSize = True
            Caption = 'keine Freigeben'
            ImageIndex = 19
            MenuItem = keineMarkieren1
          end
          object ToolButton3: TToolButton
            Left = 338
            Height = 26
            Top = 0
            Caption = 'ToolButton3'
            Style = tbsSeparator
          end
          object MahnenBtn: TToolButton
            Left = 346
            Top = 0
            AutoSize = True
            Caption = 'Mahnen'
            ImageIndex = 12
            MenuItem = mahnen1
          end
        end
        object MahnGrid: TDBGrid
          Left = 0
          Height = 447
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
          OnDblClick = MahnGridDblClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ClientHeight = 473
        ClientWidth = 803
        object MahnPrintToolBar: TToolBar
          Left = 0
          Height = 26
          Top = 447
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
          object DBNavigator2: TDBNavigator
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
            DataSource = MahnPrintDS
            Flat = True
            Options = []
            TabOrder = 0
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          end
          object ToolButton2: TToolButton
            Left = 136
            Height = 26
            Top = 0
            Caption = 'ToolButton2'
            Style = tbsSeparator
          end
          object B1: TToolButton
            Left = 144
            Top = 0
            AutoSize = True
            Caption = 'alle &drucken'
            ImageIndex = 11
            OnClick = B1Click
          end
          object ToolButton5: TToolButton
            Left = 228
            Height = 26
            Top = 0
            Caption = 'ToolButton5'
            Style = tbsSeparator
          end
          object ToolButton8: TToolButton
            Left = 236
            Top = 0
            AutoSize = True
            Caption = 'ausgewählte drucken'
            ImageIndex = 11
            OnClick = ToolButton8Click
          end
          object ToolButton4: TToolButton
            Left = 364
            Height = 26
            Top = 0
            Caption = 'ToolButton4'
            Style = tbsSeparator
          end
          object ToolButton6: TToolButton
            Left = 372
            Top = 0
            AutoSize = True
            Caption = 'ausgewählte als gedruckt markieren'
            ImageIndex = 12
            OnClick = ToolButton6Click
          end
          object ToolButton9: TToolButton
            Left = 568
            Height = 26
            Top = 0
            Caption = 'ToolButton9'
            Style = tbsSeparator
          end
          object ToolButton7: TToolButton
            Left = 576
            Top = 0
            AutoSize = True
            Caption = 'alle als gedruckt markieren'
            Enabled = False
            ImageIndex = 12
            OnClick = ToolButton7Click
          end
        end
        object MahnPrintGrid: TDBGrid
          Left = 0
          Height = 447
          Top = 0
          Width = 803
          Align = alClient
          Color = clWindow
          Columns = <          
            item
              Title.Caption = 'Beleg'
              Width = 50
              FieldName = 'VRENUM'
            end          
            item
              Title.Caption = 'Datum'
              Width = 61
              FieldName = 'RDATUM'
            end          
            item
              Title.Caption = 'Ku.-Nr.'
              Width = 39
              FieldName = 'KUN_NUM'
            end          
            item
              Title.Caption = 'Name des Kunden'
              Width = 244
              FieldName = 'KUN_NAME1'
            end          
            item
              Title.Caption = 'Brutto'
              Width = 59
              FieldName = 'BSUMME'
            end          
            item
              Title.Caption = 'Mahnkosten'
              FieldName = 'MAHNKOSTEN'
            end          
            item
              Title.Caption = 'Saldo'
              FieldName = 'SALDO'
            end          
            item
              Title.Caption = 'WA'
              Width = 24
              FieldName = 'WAEHRUNG'
            end          
            item
              Title.Caption = 'Stadium'
              Visible = False
              FieldName = 'STADIUM'
            end          
            item
              Title.Caption = 'Ziel'
              Width = 50
              FieldName = 'SOLL_NTAGE'
            end          
            item
              Title.Caption = 'Tage offen'
              Width = 60
              FieldName = 'TAGE_OFFEN'
            end          
            item
              Title.Caption = 'MS'
              Width = 23
              FieldName = 'MAHNSTUFE'
            end          
            item
              Title.Caption = 'G-Kto.'
              Width = 38
              FieldName = 'GEGENKONTO'
            end>
          DataSource = MahnPrintDS
          Flat = True
          TabOrder = 1
        end
      end
    end
  end
  object MahnTab: TZQuery
    Connection = DM1.DB1
    AfterOpen = MahnTabAfterOpen
    AfterScroll = MahnTabAfterScroll
    BeforeDelete = MahnPrintTabBeforeDelete
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
    AfterOpen = MahnPrintTabAfterOpen
    AfterScroll = MahnPrintTabAfterOpen
    BeforeDelete = MahnPrintTabBeforeDelete
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
    AfterOpen = SumTabAfterOpen
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
    Images = MainForm.ImageList1
    Left = 312
    Top = 212
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
      object Suchen1: TMenuItem
        Caption = 'Suchen'
        ImageIndex = 10
        ShortCut = 16454
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Allesmarkieren1: TMenuItem
        Caption = 'alle Freigeben'
        Enabled = False
        ImageIndex = 18
        ShortCut = 16449
        OnClick = Allesmarkieren1Click
      end
      object keineMarkieren1: TMenuItem
        Caption = 'keine Freigeben'
        ImageIndex = 19
        ShortCut = 16459
        OnClick = keineMarkieren1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mahnen1: TMenuItem
        Caption = 'Mahnen'
        ImageIndex = 12
        OnClick = mahnen1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SichtbareSpalten1: TMenuItem
        Caption = 'Sichtbare Spalten'
        ImageIndex = 15
        OnClick = SichtbareSpalten1Click
      end
      object Layoutspeichern1: TMenuItem
        Caption = 'Layout speichern'
        ImageIndex = 16
        OnClick = Layoutspeichern1Click
      end
    end
    object Sortierung1: TMenuItem
      Caption = '&Sortierung'
      Enabled = False
      GroupIndex = 3
      object Belegnummer1: TMenuItem
        Tag = 1
        Caption = 'Belegnummer'
        Checked = True
        Default = True
        GroupIndex = 5
        RadioItem = True
      end
      object Datum1: TMenuItem
        Tag = 2
        Caption = 'Datum'
        GroupIndex = 5
        RadioItem = True
      end
      object Name1: TMenuItem
        Tag = 3
        Caption = 'Name'
        GroupIndex = 5
        RadioItem = True
      end
      object Stadium1: TMenuItem
        Tag = 4
        Caption = 'Stadium'
        GroupIndex = 5
        RadioItem = True
      end
      object Preis1: TMenuItem
        Tag = 5
        Caption = 'Preis'
        GroupIndex = 5
        RadioItem = True
      end
    end
    object Drucken1: TMenuItem
      Caption = '&Drucken'
      Enabled = False
      GroupIndex = 4
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 5
      object Aktualisieren1: TMenuItem
        Caption = 'Aktualisieren'
        ImageIndex = 13
        ShortCut = 116
      end
    end
  end
end
