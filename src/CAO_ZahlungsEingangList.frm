object ZahlForm: TZahlForm
  Left = 430
  Height = 495
  Top = 256
  Width = 874
  Caption = 'Zahlungseingang Kunden (Debitoren)'
  ClientHeight = 495
  ClientWidth = 874
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  Menu = MainMenu1
  LCLVersion = '7.2'
  object ZahlungPanel: TPanel
    Left = 0
    Height = 495
    Top = 0
    Width = 874
    Align = alClient
    BevelOuter = bvNone
    ClientHeight = 495
    ClientWidth = 874
    TabOrder = 0
    object TopPan: TPanel
      Left = 0
      Height = 27
      Top = 0
      Width = 874
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ClientHeight = 23
      ClientWidth = 870
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object Label35: TLabel
        Left = 0
        Height = 23
        Top = 0
        Width = 276
        Align = alLeft
        Caption = '  Zahlungseingang Kunden (Debitoren)   '
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object DatumAW: TVolgaPeriod
        Left = 734
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
    end
    object ToolBar2: TToolBar
      Left = 0
      Height = 22
      Top = 473
      Width = 874
      Align = alBottom
      AutoSize = True
      BorderWidth = 2
      Caption = 'ToolBar2'
      EdgeBorders = []
      Images = MainForm.ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 1
      Wrapable = False
      object DBNavigator1: TDBNavigator
        Left = 1
        Height = 22
        Top = 0
        Width = 135
        BevelOuter = bvNone
        ChildSizing.EnlargeHorizontal = crsScaleChilds
        ChildSizing.EnlargeVertical = crsScaleChilds
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 100
        ClientHeight = 22
        ClientWidth = 135
        DataSource = OPosDetailDS
        Flat = True
        Options = []
        TabOrder = 0
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      end
      object ToolButton1: TToolButton
        Left = 136
        Height = 22
        Top = 0
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object ZahleingangBtn: TToolButton
        Left = 144
        Top = 0
        AutoSize = True
        Caption = 'Zahlungseingang'
        ImageIndex = 12
      end
    end
    object OPosRechGrid: TDBGrid
      Left = 0
      Height = 114
      Top = 359
      Width = 874
      Align = alBottom
      Color = clWindow
      Columns = <>
      DataSource = OPosDetailDS
      DefaultRowHeight = 16
      Flat = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
    end
    object OposKunGrid: TDBGrid
      Left = 0
      Height = 300
      Top = 27
      Width = 874
      Align = alClient
      Color = clWindow
      Columns = <>
      DataSource = OPosDS
      DefaultRowHeight = 16
      Flat = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      Scrollbars = ssAutoBoth
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 0
      Height = 32
      Top = 327
      Width = 874
      Align = alBottom
      BevelOuter = bvNone
      ClientHeight = 32
      ClientWidth = 874
      TabOrder = 4
      object SumUeberfaelligPan: TPanel
        Left = 741
        Height = 32
        Top = 0
        Width = 133
        Align = alRight
        BevelOuter = bvNone
        ClientHeight = 32
        ClientWidth = 133
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object SumUeberfaelligLab: TLabel
          Left = 56
          Height = 32
          Top = 0
          Width = 77
          Align = alRight
          Alignment = taRightJustify
          Caption = '1.000,55 DM '
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object SumUECntLab: TLabel
          Left = 0
          Height = 32
          Top = 0
          Width = 18
          Align = alLeft
          Caption = ' 10'
          Layout = tlCenter
          ParentColor = False
        end
      end
      object Label1: TLabel
        Left = 667
        Height = 32
        Top = 0
        Width = 74
        Align = alRight
        Caption = '  Überfällig : '
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
      object SummePan: TPanel
        Left = 497
        Height = 32
        Top = 0
        Width = 170
        Align = alRight
        BevelOuter = bvNone
        ClientHeight = 32
        ClientWidth = 170
        TabOrder = 1
        object SummeLab: TLabel
          Left = 93
          Height = 32
          Top = 0
          Width = 77
          Align = alRight
          Alignment = taRightJustify
          Caption = '1.000,55 DM '
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
        object SumCntLab: TLabel
          Left = 0
          Height = 32
          Top = 0
          Width = 18
          Align = alLeft
          Caption = ' 10'
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Quality = fqAntialiased
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
        end
      end
      object Label2: TLabel
        Left = 449
        Height = 32
        Top = 0
        Width = 48
        Align = alRight
        Caption = 'Summe: '
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 117
  end
  object OPosDS: TDataSource
    DataSet = OPosQuery
    Left = 155
    Top = 117
  end
  object OPosDetailDS: TDataSource
    DataSet = OPosDetailQuery
    Left = 156
    Top = 177
  end
  object OPosQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select '
      'ADDR_ID, GEGENKONTO,'
      'KUN_NUM, KUN_ANREDE, KUN_NAME1, KUN_NAME2, KUN_NAME3, KUN_ABTEILUNG, '
      'KUN_STRASSE, KUN_PLZ, KUN_LAND, KUN_ORT,'
      'format(count(*),0) as ANZAHL,'
      '(sum(BSUMME) - sum(IST_ANZAHLUNG) - sum(IST_BETRAG)) as SALDO,'
      'WAEHRUNG'
      'from JOURNAL'
      'where STADIUM BETWEEN 20 and 79 and QUELLE=3 and YEAR(RDATUM)>=2000 and BSUMME<>0'
      'group by ADDR_ID, WAEHRUNG'
      'order by KUN_NAME1, KUN_NAME2'
    )
    Params = <>
    Left = 70
    Top = 117
  end
  object OPosDetailQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select '
      'REC_ID, QUELLE, VRENUM, RDATUM, ADDR_ID,'
      'NSUMME, MSUMME_0, MSUMME_1, MSUMME_2, MSUMME_3, MSUMME, BSUMME,'
      'ZAHLART, STADIUM, WAEHRUNG, '
      'SOLL_STAGE, SOLL_SKONTO, SOLL_NTAGE, '
      'IST_ANZAHLUNG, IST_SKONTO, IST_ZAHLDAT, IST_BETRAG, MAHNKOSTEN, GEGENKONTO,'
      '(BSUMME - IST_ANZAHLUNG - IST_BETRAG) as SALDO,'
      'MAHNSTUFE, MAHNDATUM,'
      'TO_DAYS(CURDATE())-TO_DAYS(RDATUM) as TAGE_OFFEN'
      'from JOURNAL'
      'where STADIUM BETWEEN 20 and 79 and QUELLE=3 and YEAR(RDATUM)>=2000 and BSUMME<>0 and '
      'ADDR_ID=:ADDR_ID and WAEHRUNG=:WAEHRUNG'
      'order by RDATUM, VRENUM'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'ADDR_ID'
        ParamType = ptUnknown
        Value = 16522
      end    
      item
        DataType = ftString
        Name = 'WAEHRUNG'
        ParamType = ptUnknown
        Value = '€'
      end>
    Left = 70
    Top = 177
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'ADDR_ID'
        ParamType = ptUnknown
        Value = 16522
      end    
      item
        DataType = ftString
        Name = 'WAEHRUNG'
        ParamType = ptUnknown
        Value = '€'
      end>
  end
  object SumQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select '
      'format(count(*),0) as ANZAHL,'
      'sum(BSUMME) as BSUMME,'
      '(sum(BSUMME) - sum(IST_ANZAHLUNG) - sum(IST_BETRAG)) as SALDO,'
      'WAEHRUNG, TO_DAYS(RDATUM)+SOLL_NTAGE-TO_DAYS(CURDATE())<0 as UEBERFAELLIG'
      'from JOURNAL'
      'where STADIUM BETWEEN 20 and 79 and QUELLE=3 and YEAR(RDATUM)>=2000 and BSUMME<>0'
      'group by WAEHRUNG, UEBERFAELLIG'
    )
    Params = <>
    Left = 336
    Top = 117
  end
end
