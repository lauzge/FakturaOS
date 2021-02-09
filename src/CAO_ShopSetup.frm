object ShopSetupForm: TShopSetupForm
  Left = 86
  Height = 286
  Top = 85
  Width = 437
  BorderStyle = bsDialog
  Caption = 'Shop-Setup'
  ClientHeight = 286
  ClientWidth = 437
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
  object NavPan: TPanel
    Left = 0
    Height = 31
    Top = 255
    Width = 437
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 31
    ClientWidth = 437
    TabOrder = 0
    object Nav1: TDBNavigator
      Left = 4
      Height = 25
      Top = 0
      Width = 241
      BevelOuter = bvNone
      ChildSizing.EnlargeHorizontal = crsScaleChilds
      ChildSizing.EnlargeVertical = crsScaleChilds
      ChildSizing.ShrinkHorizontal = crsScaleChilds
      ChildSizing.ShrinkVertical = crsScaleChilds
      ChildSizing.Layout = cclLeftToRightThenTopToBottom
      ChildSizing.ControlsPerLine = 100
      ClientHeight = 25
      ClientWidth = 241
      Options = []
      TabOrder = 0
    end
    object ShopSaveBtn: TSpeedButton
      Left = 256
      Height = 25
      Top = 0
      Width = 105
      Caption = 'Speichern'
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360000002800000014000000140000000100
        2000000000004006000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0084848400848484008484
        8400848484008484840084848400848484008484840084848400848484008484
        84008484840084848400848484008484840084848400FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008484
        840084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000FFFF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000FFFF00FFFFFF0000FFFF000000000084848400FF00FF00FF00FF000000
        0000FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000FFFF00FFFFFF000000
        000084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000FFFF000000
        0000FFFFFF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000FFFF00FFFFFF0000FFFF000000000084848400FF00FF00FF00FF000000
        0000FFFFFF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000FFFF00FFFFFF000000
        000084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000FFFF00FFFF
        FF0000000000000000000000000000000000000000000000000000000000FFFF
        FF0000FFFF00FFFFFF0000FFFF000000000084848400FF00FF00FF00FF000000
        0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
        000084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF000000000084848400FF00FF00FF00FF000000
        0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
        000084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF000000000084848400FF00FF00FF00FF000000
        0000FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
        000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF000000
        000084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000FFFF00FFFFFF0000FFFF000000000084848400FF00FF00FF00FF000000
        0000FFFFFF0000FFFF0000000000FFFFFF00FF000000FF000000FF000000FF00
        0000FF000000FF000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF000000
        000084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000FFFF00FFFFFF0000FFFF000000000084848400FF00FF00FF00FF000000
        0000FFFFFF0000FFFF0000000000FFFFFF00FF000000FF000000FF000000FF00
        0000FF000000FF000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
        000084848400FF00FF00FF00FF000000000000FFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000FFFF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      }
      OnClick = ShopSaveBtnClick
    end
  end
  object PC1: TPageControl
    Left = 0
    Height = 255
    Top = 0
    Width = 437
    ActivePage = AllgTS
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    OnChange = PC1Change
    object AllgTS: TTabSheet
      Tag = 1
      Caption = 'Allgemein'
      ClientHeight = 229
      ClientWidth = 429
      ImageIndex = 8
      ParentShowHint = False
      object SWCB: TComboBox
        Left = 88
        Height = 21
        Top = 32
        Width = 100
        ItemHeight = 13
        TabOrder = 0
      end
      object ShopPreis: TComboBox
        Left = 88
        Height = 21
        Top = 128
        Width = 100
        ItemHeight = 13
        TabOrder = 1
      end
      object NewOrderStatusLB: TComboBox
        Left = 296
        Height = 21
        Top = 156
        Width = 124
        ItemHeight = 13
        TabOrder = 2
      end
      object ShopWgr: TComboBox
        Left = 296
        Height = 21
        Top = 192
        Width = 124
        ItemHeight = 13
        TabOrder = 3
      end
      object UseShopCB: TCheckBox
        Left = 8
        Height = 19
        Top = 8
        Width = 180
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'Shopfunktionen aktiv'
        TabOrder = 4
      end
      object BruttoCB: TCheckBox
        Left = 8
        Height = 19
        Top = 56
        Width = 180
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'Brutto-Shop'
        TabOrder = 5
      end
      object UseOrderIDCB: TCheckBox
        Left = 200
        Height = 19
        Top = 8
        Width = 220
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'Bestellnummer (OrderID) weiterverwenden'
        TabOrder = 6
      end
      object UseCusomerIDCB: TCheckBox
        Left = 200
        Height = 19
        Top = 32
        Width = 220
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'Kundennummer (CustomersID) weiterverw.'
        TabOrder = 7
      end
      object UpdateMengeCB: TCheckBox
        Left = 200
        Height = 19
        Top = 56
        Width = 220
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'Menge aktualisieren (CAO->SHOP)'
        TabOrder = 8
      end
      object ImportMengeCB: TCheckBox
        Left = 200
        Height = 19
        Top = 80
        Width = 220
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'Menge importieren (SHOP->CAO)'
        TabOrder = 9
      end
      object StatusUpdateSM_CB: TCheckBox
        Left = 200
        Height = 19
        Top = 104
        Width = 220
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'EMail beim Statusupdate versenden'
        TabOrder = 10
      end
      object ChangeOrderstatusCB: TCheckBox
        Left = 200
        Height = 19
        Top = 128
        Width = 220
        Alignment = taLeftJustify
        AutoSize = False
        Caption = 'Orderstatus nach Import ändern'
        OnClick = ChangeOrderstatusCBClick
        TabOrder = 11
      end
      object Label5: TLabel
        Left = 8
        Height = 13
        Top = 38
        Width = 42
        Caption = 'Software'
        ParentColor = False
      end
      object Label2: TLabel
        Left = 8
        Height = 13
        Top = 134
        Width = 57
        Caption = 'Shop Preis :'
        ParentColor = False
      end
      object DefDebNumLab: TLabel
        Left = 8
        Height = 13
        Top = 162
        Width = 64
        Caption = 'Debitorennr. :'
        ParentColor = False
      end
      object Label4: TLabel
        Left = 200
        Height = 13
        Top = 160
        Width = 87
        Caption = 'neuer Orderstatus:'
        ParentColor = False
      end
      object DefDebNum: TSpinEdit
        Left = 88
        Height = 21
        Top = 156
        Width = 100
        MaxValue = 60000
        TabOrder = 12
      end
      object Label1: TLabel
        Left = 8
        Height = 13
        Top = 198
        Width = 237
        Caption = 'Warengruppe für importierte Artikel aus dem Shop:'
        ParentColor = False
      end
    end
    object UrlTS: TTabSheet
      Tag = 2
      Caption = 'URL/Proxy'
      ClientHeight = 229
      ClientWidth = 429
      ImageIndex = 10
      object Label39: TLabel
        Left = 8
        Height = 13
        Top = 24
        Width = 104
        Caption = 'URL zum Importscript:'
        ParentColor = False
      end
      object Label40: TLabel
        Left = 8
        Height = 13
        Top = 48
        Width = 110
        Caption = 'URL zum Updatescript:'
        ParentColor = False
      end
      object Label37: TLabel
        Left = 8
        Height = 13
        Top = 80
        Width = 71
        Caption = 'Benutzername:'
        ParentColor = False
      end
      object Label38: TLabel
        Left = 264
        Height = 13
        Top = 80
        Width = 42
        Caption = 'Paßwort:'
        ParentColor = False
      end
      object Bevel1: TDividerBevel
        Left = 8
        Height = 13
        Top = 104
        Width = 411
        Caption = 'Proxy'
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Quality = fqAntialiased
        ParentFont = False
        Style = gsHorLines
      end
      object Label50: TLabel
        Left = 8
        Height = 13
        Top = 144
        Width = 63
        Caption = 'Proxy-Server:'
        ParentColor = False
      end
      object Label49: TLabel
        Left = 8
        Height = 13
        Top = 184
        Width = 54
        Caption = 'Proxy-User:'
        ParentColor = False
      end
      object Label51: TLabel
        Left = 218
        Height = 13
        Top = 184
        Width = 71
        Caption = 'Proxy-Paßwort:'
        ParentColor = False
      end
      object Label48: TLabel
        Left = 272
        Height = 13
        Top = 144
        Width = 51
        Caption = 'Proxy-Port:'
        ParentColor = False
      end
      object ShopImportURLEdit: TEdit
        Left = 120
        Height = 21
        Top = 16
        Width = 299
        TabOrder = 0
      end
      object ShopUpdateURLEdi: TEdit
        Left = 120
        Height = 21
        Top = 40
        Width = 299
        TabOrder = 1
      end
      object ShopUserEdit: TEdit
        Left = 120
        Height = 21
        Top = 72
        Width = 128
        TabOrder = 2
      end
      object ShopPWEdit: TEdit
        Left = 312
        Height = 21
        Top = 72
        Width = 107
        TabOrder = 3
      end
      object ProxyServer: TEdit
        Left = 88
        Height = 21
        Top = 136
        Width = 168
        TabOrder = 4
      end
      object ProxyUser: TEdit
        Left = 88
        Height = 21
        Top = 176
        Width = 120
        TabOrder = 5
      end
      object ProxyPass: TEdit
        Left = 296
        Height = 21
        Top = 176
        Width = 123
        EchoMode = emPassword
        PasswordChar = '*'
        TabOrder = 6
      end
      object ProxyPort: TSpinEdit
        Left = 328
        Height = 21
        Top = 136
        Width = 91
        MaxValue = 65535
        ParentShowHint = False
        TabOrder = 7
      end
    end
    object TabSheet1: TTabSheet
      Tag = 3
      Caption = 'Order-Status'
      ClientHeight = 229
      ClientWidth = 429
      ImageIndex = 2
      object Label46: TLabel
        Left = 4
        Height = 13
        Top = 8
        Width = 91
        Caption = 'Shop-Orderstadien:'
        ParentColor = False
      end
      object Label47: TLabel
        Left = 4
        Height = 100
        Top = 64
        Width = 112
        AutoSize = False
        Caption = 'Hier bitte die Stadien erfassen, genau wie Sie im Shop deklariert sind ...'
        ParentColor = False
        WordWrap = True
      end
      object ShopOrderstatusGrid: TDBGrid
        Left = 120
        Height = 220
        Top = 4
        Width = 304
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'ID'
            Width = 40
            FieldName = 'ORDERSTATUS_ID'
          end        
          item
            Title.Caption = 'Beschreibung'
            Width = 210
            FieldName = 'LANGBEZ'
          end>
        DefaultRowHeight = 17
        Flat = True
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Tag = 4
      Caption = 'Lieferart'
      ClientHeight = 229
      ClientWidth = 429
      ImageIndex = 3
      object LiefartGrid: TDBGrid
        Left = 8
        Height = 192
        Top = 8
        Width = 416
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'CAO-Lieferart'
            Width = 143
            FieldName = 'ZahlartStr'
          end        
          item
            Title.Caption = 'Shop-Class (shipping_class)'
            Width = 226
            FieldName = 'SHOP_CLASS'
          end>
        DataSource = ShopLiefArtDS
        DefaultRowHeight = 17
        TabOrder = 0
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 8
        Height = 21
        Top = 206
        Width = 136
        DataField = 'ID'
        DataSource = ShopLiefArtDS
        KeyField = 'LIEF_ID'
        ListField = 'LANGBEZ'
        ListFieldIndex = 0
        ListSource = DM1.LiefArtDS
        LookupCache = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 184
        Height = 21
        Top = 206
        Width = 240
        DataField = 'SHOP_CLASS'
        DataSource = ShopLiefArtDS
        MaxLength = 0
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Tag = 5
      Caption = 'Zahlart'
      ClientHeight = 229
      ClientWidth = 429
      ImageIndex = 4
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 8
        Height = 21
        Top = 206
        Width = 136
        DataField = 'ID'
        DataSource = ShopZahlArtDS
        KeyField = 'ZAHL_ID'
        ListField = 'LANGBEZ'
        ListFieldIndex = 0
        ListSource = DM1.ZahlartDS
        LookupCache = False
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 184
        Height = 21
        Top = 206
        Width = 240
        DataField = 'SHOP_CLASS'
        DataSource = ShopZahlArtDS
        MaxLength = 0
        TabOrder = 2
      end
      object ZahlartGrid: TDBGrid
        Left = 8
        Height = 192
        Top = 8
        Width = 416
        Color = clWindow
        Columns = <        
          item
            Title.Caption = 'CAO-Zahlart'
            Width = 143
            FieldName = 'ZahlartStr'
          end        
          item
            Title.Caption = 'Shop-Class (payment_class)'
            Width = 226
            FieldName = 'SHOP_CLASS'
          end>
        DataSource = ShopZahlArtDS
        DefaultRowHeight = 17
        TabOrder = 1
      end
    end
  end
  object ShopZahlArtDS: TDataSource
    DataSet = ShopZahlArt
    Left = 80
    Top = 224
  end
  object ShopLiefArtDS: TDataSource
    DataSet = ShopLiefArt
    Left = 208
    Top = 224
  end
  object ShopZahlArt: TZQuery
    Connection = DM1.DB1
    BeforePost = ShopZahlArtBeforePost
    SQL.Strings = (
      'select MAINKEY, NAME as SHOP_CLASS, VAL_INT as ID'
      'from REGISTERY '
      'where MAINKEY=''SHOP\\ZAHLART_MAP'' and Upper(NAME) !=''DEFAULT'''
      'order by NAME'
    )
    Params = <>
    Left = 32
    Top = 224
    object ShopZahlArtMAINKEY: TZRawStringField
      FieldKind = fkData
      FieldName = 'MAINKEY'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object ShopZahlArtSHOP_CLASS: TZRawStringField
      FieldKind = fkData
      FieldName = 'SHOP_CLASS'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object ShopZahlArtID: TZIntegerField
      FieldKind = fkData
      FieldName = 'ID'
      Index = 2
      LookupCache = False
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'TEXT'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ShopZahlArtZahlartStr: TStringField
      FieldKind = fkLookup
      FieldName = 'ZahlartStr'
      Index = 3
      KeyFields = 'ID'
      LookupCache = False
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'LANGBEZ'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
  object ShopLiefArt: TZQuery
    Connection = DM1.DB1
    BeforePost = ShopLiefArtBeforePost
    SQL.Strings = (
      'select MAINKEY, NAME as SHOP_CLASS, VAL_INT as ID'
      'from REGISTERY '
      'where MAINKEY=''SHOP\\LIEFART_MAP'' and Upper(NAME) !=''DEFAULT'''
      'order by NAME'
    )
    Params = <>
    Left = 168
    Top = 224
    object ShopLiefArtMainKey: TZRawStringField
      FieldKind = fkData
      FieldName = 'MAINKEY'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object StringField2: TZRawStringField
      FieldKind = fkData
      FieldName = 'SHOP_CLASS'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 255
    end
    object IntegerField1: TZIntegerField
      FieldKind = fkData
      FieldName = 'ID'
      Index = 2
      LookupCache = False
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'TEXT'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object ShopLiefArtStringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'ZahlartStr'
      Index = 3
      KeyFields = 'ID'
      LookupCache = False
      LookupDataSet = DM1.LiefArtTab
      LookupKeyFields = 'LIEF_ID'
      LookupResultField = 'LANGBEZ'
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
end
