object KundenImportForm: TKundenImportForm
  Left = 330
  Height = 442
  Top = 256
  Width = 553
  HelpContext = 110600
  BorderStyle = bsDialog
  Caption = 'Adressen - Import / Update'
  ClientHeight = 442
  ClientWidth = 553
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object Panel1: TPanel
    Left = 0
    Height = 32
    Top = 410
    Width = 553
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object PC1: TPageControl
    Left = 0
    Height = 410
    Top = 0
    Width = 553
    ActivePage = TabSheet6
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet6: TTabSheet
      Caption = 'Datei /Profil'
    end
    object TabSheet1: TTabSheet
      Caption = 'Feldzuweisung'
    end
    object TabSheet3: TTabSheet
      Caption = 'Wertzuweisungen'
    end
    object TabSheet5: TTabSheet
      Caption = 'Key-Zuweisungen'
    end
    object TabSheet4: TTabSheet
      Caption = 'Import-Status'
    end
    object Logbuch: TTabSheet
      Caption = 'Logbuch'
      ClientHeight = 384
      ClientWidth = 545
      object Memo1: TMemo
        Left = 0
        Height = 384
        Top = 0
        Width = 545
        Align = alClient
        Color = clWindow
        Lines.Strings = (
          'Memo1'
        )
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object KunQuery: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select *'
      'from ADRESSEN'
      'LIMIT 0,50'
    )
    Params = <>
    Left = 264
    Top = 322
    object KunQueryMATCHCODE: TZRawStringField
      FieldKind = fkData
      FieldName = 'MATCHCODE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object KunQueryKUNDENGRUPPE: TZIntegerField
      FieldKind = fkData
      FieldName = 'KUNDENGRUPPE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KunQueryKUNNUM1: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUNNUM1'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunQueryKUNNUM2: TZRawStringField
      FieldKind = fkData
      FieldName = 'KUNNUM2'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunQueryANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'ANREDE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryNAME1: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME1'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryNAME2: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME2'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryNAME3: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME3'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryABTEILUNG: TZRawStringField
      FieldKind = fkData
      FieldName = 'ABTEILUNG'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryPLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PLZ'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KunQueryORT: TZRawStringField
      FieldKind = fkData
      FieldName = 'ORT'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryLAND: TZRawStringField
      FieldKind = fkData
      FieldName = 'LAND'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 5
    end
    object KunQuerySTRASSE: TZRawStringField
      FieldKind = fkData
      FieldName = 'STRASSE'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryPOSTFACH: TZRawStringField
      FieldKind = fkData
      FieldName = 'POSTFACH'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryPF_PLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'PF_PLZ'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object KunQueryGRUPPE: TZRawStringField
      FieldKind = fkData
      FieldName = 'GRUPPE'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 4
    end
    object KunQueryTELE1: TZRawStringField
      FieldKind = fkData
      FieldName = 'TELE1'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryTELE2: TZRawStringField
      FieldKind = fkData
      FieldName = 'TELE2'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryFAX: TZRawStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryFUNK: TZRawStringField
      FieldKind = fkData
      FieldName = 'FUNK'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryEMAIL: TZRawStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryEMAIL2: TZRawStringField
      FieldKind = fkData
      FieldName = 'EMAIL2'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryINTERNET: TZRawStringField
      FieldKind = fkData
      FieldName = 'INTERNET'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryDIVERSES: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIVERSES'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryBRIEFANREDE: TZRawStringField
      FieldKind = fkData
      FieldName = 'BRIEFANREDE'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryKTO_INHABER: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO_INHABER'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryBLZ: TZRawStringField
      FieldKind = fkData
      FieldName = 'BLZ'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunQueryKTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'KTO'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunQueryBANK: TZRawStringField
      FieldKind = fkData
      FieldName = 'BANK'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 40
    end
    object KunQueryIBAN: TZRawStringField
      FieldKind = fkData
      FieldName = 'IBAN'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQuerySWIFT: TZRawStringField
      FieldKind = fkData
      FieldName = 'SWIFT'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object KunQueryDEB_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'DEB_NUM'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunQueryKRD_NUM: TZIntegerField
      FieldKind = fkData
      FieldName = 'KRD_NUM'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object KunQueryUST_NUM: TZRawStringField
      FieldKind = fkData
      FieldName = 'UST_NUM'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 25
    end
    object KunQuerySHOP_ID: TZSmallIntField
      FieldKind = fkData
      FieldName = 'SHOP_ID'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KunQuerySHOP_KUNDE_ID: TZIntegerField
      FieldKind = fkData
      FieldName = 'SHOP_KUNDE_ID'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object KunQueryPROVIS_PROZ: TZDoubleField
      FieldKind = fkData
      FieldName = 'PROVIS_PROZ'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Precision = 5
    end
    object KunQueryKUN_SEIT: TZDateField
      FieldKind = fkData
      FieldName = 'KUN_SEIT'
      Index = 37
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
    object KunQueryKUN_GEBDATUM: TZDateField
      FieldKind = fkData
      FieldName = 'KUN_GEBDATUM'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      InvalidDisplayText = 'NAD'
    end
  end
  object ProfTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select * from REGISTERY '
      'where NAME !=''DEFAULT'' and MAINKEY=''MAIN\\IMPORT\\ADRESSEN'''
      'order by VAL_CHAR'
    )
    Params = <>
    Left = 126
    Top = 322
    object ProfTabMAINKEY: TZRawStringField
      FieldKind = fkData
      FieldName = 'MAINKEY'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object ProfTabNAME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NAME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 100
    end
    object ProfTabVAL_BLOB: TZRawCLobField
      FieldKind = fkData
      FieldName = 'VAL_BLOB'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Transliterate = False
    end
    object ProfTabLAST_CHANGE: TZDateTimeField
      DisplayLabel = 'le. Änderung'
      DisplayWidth = 18
      FieldKind = fkData
      FieldName = 'LAST_CHANGE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd.mm.yyyy'
      InvalidDisplayText = 'NADT'
    end
  end
  object ProfDS: TDataSource
    DataSet = ProfTab
    Left = 184
    Top = 322
  end
end
