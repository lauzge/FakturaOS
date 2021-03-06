object TeilLieferForm: TTeilLieferForm
  Left = 387
  Height = 352
  Top = 256
  Width = 625
  HelpContext = 110000
  BorderStyle = bsDialog
  Caption = 'Teillieferung bearbeiten'
  ClientHeight = 352
  ClientWidth = 625
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object Panel1: TPanel
    Left = 0
    Height = 31
    Top = 321
    Width = 625
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 31
    ClientWidth = 625
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Height = 25
      Top = 1
      Width = 232
      BevelOuter = bvNone
      ChildSizing.EnlargeHorizontal = crsScaleChilds
      ChildSizing.EnlargeVertical = crsScaleChilds
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 100
      ClientHeight = 25
      ClientWidth = 232
      DataSource = LiefDS
      Options = []
      TabOrder = 0
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
    end
    object MakeLiefBtn: TBitBtn
      Left = 232
      Height = 25
      Top = 1
      Width = 145
      Caption = 'Lieferschein erstellen'
      Glyph.Data = {
        46050000424D4605000000000000360000002800000012000000120000000100
        2000000000001005000064000000640000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000FF000000FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000FFFFFF
        FFFFFFFFFFFF000000FF000000FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00FFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFF000000FF000000FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF000000FFFFFF
        FFFFFFFFFFFF000000FF000000FF000000000000000000000000000000000000
        000000000000000000FFFFFFFFFF000000FFFFFFFFFF808080FFC0C0C0FFFFFF
        FFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFF000000FF000000000000
        000000000000000000000000000000000000000000FFFFFFFFFF808080FF0000
        00FF000000FF808080FFC0C0C0FFFFFFFFFFFFFFFFFF000000FF000000FF0000
        00000000000000000000000000000000000000000000000000FFFFFFFFFF8080
        80FF000000FFFFFFFFFF00FFFFFF000000FF000000FF808080FFC0C0C0FFFFFF
        FFFFFFFFFFFF000000FF00000000000000000000000000000000000000000000
        0000000000FF000000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF0000
        00FF000000FF808080FF000000FF000000000000000000000000000000000000
        00000000000000000000000000FFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
        FFFF00FFFFFFFFFFFFFF00FFFFFF000000FF000000FF00000000000000000000
        0000000000000000000000000000000000FFFFFFFFFF00FFFFFFFFFFFFFF00FF
        FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF0000
        00FF000000000000000000000000000000000000000000000000000000FF0000
        00FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF
        FFFF000000FF0000000000000000000000000000000000000000000000000000
        00000000000000000000000000FF000000FFFFFFFFFF00FFFFFFFFFFFFFF00FF
        FFFFFFFFFFFF000000FF0000000000000000000000FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000FF0000
        00FF00FFFFFFC0C0C0FF000000FF0000000000000000000000FF000000FF0000
        00FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000FF000000FF0000000000000000000000FF0000
        00FF000000FF000000FF000000FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000
      }
      OnClick = MakeLiefBtnClick
      TabOrder = 1
    end
    object AbbruchBtn: TBitBtn
      Left = 527
      Height = 25
      Top = 1
      Width = 97
      Cancel = True
      Caption = 'Abbrechen'
      Glyph.Data = {
        560A0000424D560A000000000000360000002800000024000000120000000100
        200000000000200A000064000000640000000000000000000000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000808080FF8080
        80FF984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        500098475000FFFFFFFF98475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750000000FFFF000080FF000080FF808080FF98475000984750009847
        500098475000984750000000FFFF808080FF9847500098475000984750009847
        500098475000984750009847500098475000808080FF808080FFFFFFFFFF9847
        50009847500098475000984750009847500098475000FFFFFFFF984750009847
        500098475000984750009847500098475000984750000000FFFF000080FF0000
        80FF000080FF808080FF9847500098475000984750000000FFFF000080FF0000
        80FF808080FF9847500098475000984750009847500098475000984750008080
        80FFFFFFFFFF98475000808080FFFFFFFFFF984750009847500098475000FFFF
        FFFF808080FF808080FFFFFFFFFF984750009847500098475000984750009847
        5000984750000000FFFF000080FF000080FF000080FF000080FF808080FF9847
        50000000FFFF000080FF000080FF000080FF000080FF808080FF984750009847
        5000984750009847500098475000808080FFFFFFFFFF98475000984750008080
        80FFFFFFFFFF98475000FFFFFFFF808080FF9847500098475000808080FFFFFF
        FFFF9847500098475000984750009847500098475000984750000000FFFF0000
        80FF000080FF000080FF000080FF808080FF000080FF000080FF000080FF0000
        80FF000080FF808080FF98475000984750009847500098475000984750008080
        80FFFFFFFFFF984750009847500098475000808080FFFFFFFFFF808080FF9847
        5000984750009847500098475000808080FFFFFFFFFF98475000984750009847
        50009847500098475000984750000000FFFF000080FF000080FF000080FF0000
        80FF000080FF000080FF000080FF000080FF808080FF98475000984750009847
        500098475000984750009847500098475000808080FFFFFFFFFF984750009847
        500098475000808080FF98475000984750009847500098475000FFFFFFFF8080
        80FF984750009847500098475000984750009847500098475000984750009847
        50000000FFFF000080FF000080FF000080FF000080FF000080FF000080FF8080
        80FF984750009847500098475000984750009847500098475000984750009847
        500098475000808080FFFFFFFFFF984750009847500098475000984750009847
        500098475000FFFFFFFF808080FF984750009847500098475000984750009847
        50009847500098475000984750009847500098475000000080FF000080FF0000
        80FF000080FF000080FF808080FF984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000808080FFFFFF
        FFFF9847500098475000984750009847500098475000808080FF984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750000000FFFF000080FF000080FF000080FF000080FF808080FF9847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000808080FFFFFFFFFF98475000984750009847
        5000808080FF9847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750000000FFFF000080FF000080FF0000
        80FF000080FF000080FF808080FF984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750008080
        80FF98475000984750009847500098475000808080FFFFFFFFFF984750009847
        5000984750009847500098475000984750009847500098475000984750000000
        FFFF000080FF000080FF000080FF808080FF000080FF000080FF000080FF8080
        80FF984750009847500098475000984750009847500098475000984750009847
        50009847500098475000808080FF984750009847500098475000984750009847
        5000808080FFFFFFFFFF98475000984750009847500098475000984750009847
        500098475000984750000000FFFF000080FF000080FF000080FF808080FF9847
        50000000FFFF000080FF000080FF000080FF808080FF98475000984750009847
        50009847500098475000984750009847500098475000808080FF984750009847
        500098475000808080FFFFFFFFFF9847500098475000808080FFFFFFFFFF9847
        50009847500098475000984750009847500098475000984750000000FFFF0000
        80FF000080FF808080FF9847500098475000984750000000FFFF000080FF0000
        80FF000080FF808080FF98475000984750009847500098475000984750009847
        5000808080FFFFFFFFFF9847500098475000808080FF98475000808080FFFFFF
        FFFF9847500098475000808080FFFFFFFFFF9847500098475000984750009847
        50009847500098475000984750000000FFFF000080FF98475000984750009847
        500098475000984750000000FFFF000080FF000080FF000080FF984750009847
        500098475000984750009847500098475000808080FFFFFFFFFFFFFFFFFF8080
        80FF984750009847500098475000808080FFFFFFFFFF98475000984750008080
        80FFFFFFFFFF9847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750000000
        FFFF000080FF0000FFFF98475000984750009847500098475000984750009847
        500098475000808080FF808080FF984750009847500098475000984750009847
        5000808080FFFFFFFFFFFFFFFFFFFFFFFFFF808080FF98475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        50009847500098475000984750009847500098475000808080FF808080FF8080
        80FF984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000984750009847
        5000984750009847500098475000984750009847500098475000
      }
      NumGlyphs = 2
      OnClick = AbbruchBtnClick
      TabOrder = 2
    end
  end
  object ExRxDBGrid1: TRxDBGrid
    Left = 0
    Height = 321
    Top = 0
    Width = 625
    ColumnDefValues.BlobText = '(blob)'
    TitleButtons = False
    AutoSort = True
    KeyStrokes = <    
      item
        Command = rxgcShowFindDlg
        ShortCut = 16454
        Enabled = True
      end    
      item
        Command = rxgcShowColumnsDlg
        ShortCut = 16471
        Enabled = True
      end    
      item
        Command = rxgcShowFilterDlg
        ShortCut = 16468
        Enabled = True
      end    
      item
        Command = rxgcShowSortDlg
        ShortCut = 16467
        Enabled = True
      end    
      item
        Command = rxgcShowQuickFilter
        ShortCut = 16465
        Enabled = True
      end    
      item
        Command = rxgcHideQuickFilter
        ShortCut = 16456
        Enabled = True
      end    
      item
        Command = rxgcSelectAll
        ShortCut = 16449
        Enabled = True
      end    
      item
        Command = rxgcDeSelectAll
        ShortCut = 16429
        Enabled = True
      end    
      item
        Command = rxgcInvertSelection
        ShortCut = 16426
        Enabled = True
      end    
      item
        Command = rxgcOptimizeColumnsWidth
        ShortCut = 16427
        Enabled = True
      end    
      item
        Command = rxgcCopyCellValue
        ShortCut = 16451
        Enabled = True
      end>
    FooterOptions.DrawFullLine = False
    SearchOptions.QuickSearchOptions = [loCaseInsensitive, loPartialKey]
    SearchOptions.FromStart = False
    OptionsRx = [rdgAllowColumnsForm, rdgAllowDialogFind, rdgAllowQuickFilter]
    Align = alClient
    Color = clWindow
    DrawFullLine = False
    FocusColor = clRed
    SelectedColor = clHighlight
    GridLineStyle = psSolid
    DataSource = LiefDS
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColumnMove, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
  end
  object LiefTab: TZQuery
    Connection = DM1.DB1
    UpdateObject = ZUpdateSql1
    BeforePost = LiefTabBeforePost
    BeforeDelete = LiefTabBeforeDelete
    SQL.Strings = (
      'select JP1.REC_ID, JP1.ARTIKEL_ID,JP1.POSITION, JP1.ARTNUM, JP1.MATCHCODE, JP1.BEZEICHNUNG, JP2.MENGE as ME_RE, JP1.MENGE as LIEFERMENGE, SUM(JP3.MENGE) as MENGE_GELIEFERT, A.MENGE_AKT as LAGERMENGE'
      'from JOURNALPOS JP1, JOURNALPOS JP2'
      'left outer join ARTIKEL A on A.REC_ID = JP1.ARTIKEL_ID'
      'left outer join JOURNALPOS JP3 on JP3.QUELLE_SRC=JP2.REC_ID and JP3.QUELLE=2'
      'where JP1.QUELLE=12 and JP2.QUELLE=13 and JP2.REC_ID = JP1.QUELLE_SRC'
      'and JP1.JOURNAL_ID=:JID'
      'group by JP2.REC_ID'
      'order by JP1.POSITION'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'JID'
        ParamType = ptInput
        Value = '11'
      end>
    Left = 106
    Top = 71
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'JID'
        ParamType = ptInput
        Value = '11'
      end>
    object LiefTabREC_ID: TIntegerField
      FieldKind = fkData
      FieldName = 'REC_ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabARTIKEL_ID: TIntegerField
      FieldKind = fkData
      FieldName = 'ARTIKEL_ID'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabPOSITION: TIntegerField
      FieldKind = fkData
      FieldName = 'POSITION'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabARTNUM: TStringField
      FieldKind = fkData
      FieldName = 'ARTNUM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabMATCHCODE: TStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabBEZEICHNUNG: TMemoField
      FieldKind = fkData
      FieldName = 'BEZEICHNUNG'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object LiefTabME_RE: TFloatField
      FieldKind = fkData
      FieldName = 'ME_RE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabLIEFERMENGE: TFloatField
      FieldKind = fkData
      FieldName = 'LIEFERMENGE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabMENGE_GELIEFERT: TFloatField
      FieldKind = fkData
      FieldName = 'MENGE_GELIEFERT'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object LiefTabLAGERMENGE: TFloatField
      FieldKind = fkData
      FieldName = 'LAGERMENGE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object ZUpdateSql1: TZUpdateSQL
    ModifySQL.Strings = (
      'update JOURNALPOS SET MENGE=:LIEFERMENGE'
      'where JOURNALPOS.REC_ID=:REC_ID and QUELLE=12'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 106
    Top = 136
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'LIEFERMENGE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'REC_ID'
        ParamType = ptUnknown
      end>
  end
  object LiefDS: TDataSource
    DataSet = LiefTab
    Left = 175
    Top = 75
  end
end
