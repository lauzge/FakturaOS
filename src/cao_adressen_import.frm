object KundenImportForm: TKundenImportForm
  Left = 330
  Height = 416
  Top = 256
  Width = 553
  HelpContext = 110600
  BorderStyle = bsDialog
  Caption = 'Adressen - Import / Update'
  ClientHeight = 416
  ClientWidth = 553
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
  object PC1: TPageControl
    Left = 0
    Height = 384
    Top = 0
    Width = 553
    ActivePage = TabSheet6
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    OnChange = PC1Change
    object TabSheet6: TTabSheet
      Caption = 'Datei /Profil'
      ClientHeight = 358
      ClientWidth = 545
      object Label1: TLabel
        Left = 8
        Height = 13
        Top = 12
        Width = 31
        Caption = '&Datei :'
        ParentColor = False
      end
      object FileEdit: TFileNameEdit
        Left = 82
        Height = 21
        Top = 8
        Width = 439
        DialogOptions = [ofPathMustExist, ofFileMustExist, ofEnableSizing, ofViewDetail]
        Filter = 'Text-Datei|*.txt|Alle Dateien|*.*'
        FilterIndex = 0
        HideDirectories = False
        ButtonWidth = 23
        NumGlyphs = 1
        MaxLength = 0
        TabOrder = 0
        OnChange = FileEditChange
      end
      object Label9: TLabel
        Left = 8
        Height = 13
        Top = 40
        Width = 71
        Caption = 'Trennzeichen :'
        ParentColor = False
      end
      object DelimCB: TComboBox
        Left = 82
        Height = 21
        Top = 36
        Width = 100
        AutoComplete = True
        AutoCompleteText = [cbactEnabled, cbactEndOfLineComplete, cbactSearchAscending]
        Color = clWindow
        ItemHeight = 13
        Items.Strings = (
          'Tab'
          'Komma'
          'Semikolon'
        )
        OnChange = FileEditChange
        Style = csDropDownList
        TabOrder = 1
      end
      object KGRLabel: TLabel
        Left = 189
        Height = 13
        Top = 40
        Width = 113
        Caption = 'Default-Kundengruppe :'
        ParentColor = False
      end
      object Label10: TLabel
        Left = 353
        Height = 13
        Top = 41
        Width = 90
        Caption = 'Zeile(n) ignorieren :'
        ParentColor = False
      end
      object SpinEdit1: TSpinEdit
        Left = 454
        Height = 21
        Top = 36
        Width = 66
        MaxValue = 9999
        OnChange = FileEditChange
        TabOrder = 2
      end
      object Bevel1: TDividerBevel
        Left = 8
        Height = 15
        Top = 93
        Width = 528
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel2: TDividerBevel
        Left = 8
        Height = 15
        Top = 204
        Width = 528
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Height = 13
        Top = 216
        Width = 29
        Caption = 'Profile'
        ParentColor = False
      end
      object DBGrid1: TDBGrid
        Left = 8
        Height = 85
        Top = 232
        Width = 385
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'Beschreibung'
            Width = 264
            FieldName = 'NAME'
          end        
          item
            Title.Caption = 'le. Änderung'
            Width = 83
            FieldName = 'LAST_CHANGE'
          end>
        DataSource = ProfDS
        DefaultRowHeight = 16
        Flat = True
        Options = [dgTitles, dgIndicator, dgColumnMove, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        OnDblClick = ProfLoadBtnClick
      end
      object ProfLoadBtn: TButton
        Left = 413
        Height = 25
        Top = 232
        Width = 123
        Caption = 'Profil laden'
        OnClick = ProfLoadBtnClick
        TabOrder = 4
      end
      object ProfileEdit: TEdit
        Left = 8
        Height = 21
        Top = 328
        Width = 385
        TabOrder = 5
      end
      object ProfSaveBtn: TButton
        Left = 413
        Height = 25
        Top = 324
        Width = 123
        Caption = 'Profil speichern'
        OnClick = ProfSaveBtnClick
        TabOrder = 6
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Feldzuweisung'
      ClientHeight = 358
      ClientWidth = 545
      object ITab: TStringGrid
        Left = 4
        Height = 89
        Top = 8
        Width = 521
        ColCount = 2
        DefaultColWidth = 40
        DefaultRowHeight = 17
        Flat = True
        RowCount = 2
        TabOrder = 0
      end
      object Label2: TLabel
        Left = 4
        Height = 13
        Top = 98
        Width = 93
        Caption = 'Importierbare Felder'
        ParentColor = False
      end
      object Label3: TLabel
        Left = 204
        Height = 13
        Top = 98
        Width = 70
        Caption = 'Feldzuordnung'
        ParentColor = False
      end
      object LB1: TListBox
        Left = 4
        Height = 227
        Top = 114
        Width = 153
        ItemHeight = 0
        OnDblClick = SpeedButton1Click
        TabOrder = 1
      end
      object SpeedButton1: TSpeedButton
        Left = 168
        Height = 22
        Top = 120
        Width = 23
        Caption = '>'
      end
      object SpeedButton2: TSpeedButton
        Left = 168
        Height = 22
        Top = 144
        Width = 23
        Caption = '-'
      end
      object FeldGrid: TStringGrid
        Left = 204
        Height = 227
        Top = 114
        Width = 321
        ColCount = 2
        DefaultColWidth = 148
        DefaultRowHeight = 18
        TabOrder = 2
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Wertzuweisungen'
      ClientHeight = 358
      ClientWidth = 545
      object Label6: TLabel
        Left = 4
        Height = 13
        Top = 98
        Width = 73
        Caption = 'Wertzuordnung'
        ParentColor = False
      end
      object WertGrid: TStringGrid
        Left = 4
        Height = 227
        Top = 114
        Width = 521
        ColCount = 2
        DefaultColWidth = 100
        DefaultRowHeight = 18
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goSmoothScroll]
        TabOrder = 0
        OnSelectCell = WertGridSelectCell
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Key-Zuweisungen'
      ClientHeight = 358
      ClientWidth = 545
      object Label4: TLabel
        Left = 4
        Height = 13
        Top = 98
        Width = 93
        Caption = 'Importierbare Felder'
        ParentColor = False
      end
      object LB4: TListBox
        Left = 4
        Height = 227
        Top = 114
        Width = 153
        ItemHeight = 0
        OnDblClick = SpeedButton3Click
        TabOrder = 0
      end
      object SpeedButton3: TSpeedButton
        Left = 168
        Height = 22
        Top = 120
        Width = 23
        Caption = '>'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 168
        Height = 22
        Top = 144
        Width = 23
        Caption = '-'
        OnClick = SpeedButton4Click
      end
      object KeyGrid: TStringGrid
        Left = 204
        Height = 227
        Top = 114
        Width = 321
        ColCount = 2
        DefaultColWidth = 148
        DefaultRowHeight = 18
        RowCount = 8
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Import-Status'
      ClientHeight = 358
      ClientWidth = 545
      object Sg2: TStringGrid
        Left = 0
        Height = 358
        Top = 0
        Width = 545
        Align = alClient
        DefaultRowHeight = 17
        Flat = True
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goSmoothScroll]
        RowCount = 2
        TabOrder = 0
      end
    end
    object Logbuch: TTabSheet
      Caption = 'Logbuch'
      ClientHeight = 358
      ClientWidth = 545
      object Memo1: TMemo
        Left = 0
        Height = 358
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
  object Panel1: TPanel
    Left = 0
    Height = 32
    Top = 384
    Width = 553
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 32
    ClientWidth = 553
    TabOrder = 1
    object pb1: TProgressBar
      Left = 14
      Height = 20
      Top = 3
      Width = 321
      TabOrder = 0
    end
    object UpdateBtn: TBitBtn
      Left = 344
      Height = 25
      Top = 0
      Width = 75
      Caption = '&Update'
      Enabled = False
      OnClick = UpdateBtnClick
      TabOrder = 1
    end
    object CloseBtn: TBitBtn
      Left = 428
      Height = 25
      Top = 0
      Width = 93
      DefaultCaption = True
      Kind = bkClose
      ModalResult = 11
      TabOrder = 2
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
    BeforePost = ProfTabBeforePost
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
