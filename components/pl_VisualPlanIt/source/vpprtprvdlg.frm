object frmPrintPreview: TfrmPrintPreview
  Left = 325
  Height = 818
  Top = 118
  Width = 540
  HorzScrollBar.Page = 476
  VertScrollBar.Page = 517
  Caption = 'Print Preview'
  ClientHeight = 818
  ClientWidth = 540
  Constraints.MinHeight = 200
  Constraints.MinWidth = 395
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  LCLVersion = '6.0'
  object Panel1: TPanel
    Left = 0
    Height = 58
    Top = 0
    Width = 540
    Align = alTop
    AutoSize = True
    ClientHeight = 58
    ClientWidth = 540
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 1
      Height = 27
      Top = 1
      Width = 538
      AutoSize = True
      ButtonHeight = 25
      ButtonWidth = 25
      Caption = 'ToolBar1'
      EdgeBorders = [ebBottom]
      Images = imMain
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object btnPrint: TToolButton
        Left = 1
        Top = 0
        Action = actPrint
      end
      object ToolButton3: TToolButton
        Left = 52
        Height = 25
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsDivider
      end
      object btnFirstPage: TToolButton
        Left = 60
        Top = 0
        Action = actFirstPage
        ShowCaption = False
      end
      object btnPrevPage: TToolButton
        Left = 85
        Top = 0
        Action = actPrevPage
        ShowCaption = False
      end
      object btnNextPage: TToolButton
        Left = 110
        Top = 0
        Action = actNextPage
        ShowCaption = False
      end
      object btnLastPage: TToolButton
        Left = 135
        Top = 0
        Action = actLastPage
        ShowCaption = False
      end
      object ToolButton8: TToolButton
        Left = 160
        Height = 25
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 6
        Style = tbsDivider
      end
      object btnCancel: TToolButton
        Left = 168
        Top = 0
        Action = actCancel
      end
    end
    object Panel2: TPanel
      Left = 1
      Height = 29
      Top = 28
      Width = 538
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      ClientHeight = 29
      ClientWidth = 538
      TabOrder = 1
      object cboxZoom: TComboBox
        Left = 389
        Height = 23
        Top = 2
        Width = 145
        Align = alRight
        BorderSpacing.Top = 2
        BorderSpacing.Right = 4
        BorderSpacing.Bottom = 4
        ItemHeight = 15
        Items.Strings = (
          'Fit to Control'
          'Actual Size'
          '25%'
          '33%'
          '50%'
          '67%'
          '75%'
        )
        OnChange = cboxZoomChange
        Style = csDropDownList
        TabOrder = 0
      end
      object VpPrintFormatComboBox1: TVpPrintFormatComboBox
        AnchorSideRight.Control = cboxZoom
        Left = 4
        Height = 23
        Top = 2
        Width = 381
        Anchors = [akTop, akLeft, akRight]
        Borderspacing.Left = 4
        Borderspacing.Top = 2
        Borderspacing.Right = 4
        Borderspacing.Bottom = 2
        ItemHeight = 15
        Sorted = True
        TabOrder = 1
        OnChange = VpPrintFormatComboBox1Change
      end
    end
  end
  object VpPrintPreview1: TVpPrintPreview
    Left = 0
    Height = 760
    Top = 58
    Width = 540
    CurPage = 0
    EndDate = 37355.4526088079
    StartDate = 37348.4526088079
    Align = alClient
    Parent = Owner
    TabStop = True
    TabOrder = 1
  end
  object imMain: TImageList
    left = 272
    top = 160
    Bitmap = {
      4C690600000010000000100000005B4848005B4848005B484800564343008679
      799CD1CDCDF3D1CDCDEFD0CCCCEFD1CCCCEFD2CDCDEFD3CDCDF38E8181A75747
      47025D4D4D005D4D4D005D4D4D005642420056424200554242004D3A3A009387
      87AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9494BB4F3F
      3F05584848005948480059484800444141004F4444005C464600563F3F009386
      86ABFDFDFDFFFFFFFFFFFBFFFFFFF8FFFFFFF5FFFFFFFAFFFFFF9F9393B75945
      4504614C4C0050464600464545004041410043444400584C4C00513F3F009B8C
      8CA5FDFDFDFFFEFFFFFFF8FFFFFFF5FFFFFFF1FFFFFFF8FFFFFFA79898B25443
      43005C51510045454500424444004141410041414100454949002A2C2C13958B
      8BC1FFFFFFFFFAFFFFFFF5FFFFFFF2FFFFFFEEFFFFFFF9FFFFFFA29797CC2A2C
      2C1C474A4A0042424200434444003F3F3F094D4D4D686D6B6BB97E7B7BDEACA5
      A6FDF9F7F6FFF5FAF9FFF0FAF8FFECFAF9FFE8FBF9FFEFF9F9FFB4ACADFE7E7D
      7DE2727172BD5351526F4143420C59575787C8C2C2FFF6EFEEFFEAE5E5FFC3B4
      ABFFEEDCCCFFEFE2D4FFECE2D6FFEBE3D7FFEAE3D6FFEADFD0FFC5B6ADFFE0D7
      D9FFEEE4E3FFC7C0BFFF5F5E5E988F8E8EE0FFFBFAFFF8F4F5FFDFDBDBFFE0CB
      ABFFFDE5BBFFFCE0B3FFFBD9A3FFFCD396FFFBD090FFFECF88FFE4C088FFD4CB
      CAFFCDCCBBFFE2DBCFFF968F93E8B0B0B0F0FFFFFFFFF1EEF2FFDDD5CFFFF0C0
      73FFFFB749FFFFA625FFFEA218FFFEA116FFFEA116FFFF9F11FFF09C21FFDBCD
      BDFFE4E3E8FFF2EBEBFFB7B2B3F1A69F9FF1EDE4E4FFEBEBF1FFE5D1C0FFF987
      22FFFF7500FFFF7500FFFF7600FFFF7600FFFF7700FFFF7700FFFA7502FFE7C4
      AAFFECF0F8FFEAE0E0FFB1A6A6F0988D8DEFCEB9B9FFCEBFC1FFD8C3BCFFE0A7
      8AFFE6A580FFE9A276FFE99D6EFFE99D6EFFE9A175FFE6A67EFFE0A88BFFD9C1
      BAFFCEC0C2FFCEB9B9FFA39494F0958E8EE6E2D0D0FFC2B2B2FF625F60FF666A
      71FF6D7279FF6C727AFF6D727AFF6D727AFF6C737BFF6D737AFF686D74FF5F5D
      5EFFB9ACABFFE2D0D0FF9E9696EB878585CEF5E9E9FFD1C8C8FF787676FFB5B5
      B4FFC2C1C1FFBCBBBBFFBCBBBAFFBAB9B9FFB9B8B7FFBBB9B9FFB5B4B4FF7877
      77FFC9C2C2FFF8ECECFF908C8CD96465656BC7C2C2F5DDD5D5FFDED5D5FFFFFF
      FFFFFFFDFDFFFCF8F8FFFAF5F5FFF8F1F1FFF5EDEDFFF1E9E9FFF6EFEFFFE1D6
      D6FFDDD6D6FFCCC8C8F66A6A6A7A52535304666868497E7373A4E8E3E3FFFFFF
      FFFFFBF9F9FFFAF7F7FFF8F4F4FFF6F0F0FFF3ECECFFF0E8E8FFF2EBEBFFECE5
      E5FF827676B6625D5D4D55585806525454006E68680087787884D8D4D4F3DBD7
      D7F0DBD7D7F0DAD7D7F0DAD6D6F0DBD5D5F0D9D4D4F0D9D3D3F0D9D3D3F0DDD8
      D8F38778789C5A4848005E505000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A8360000A8360000A8370000A8370000A936
      0000AD3A036FA74716FF9A35057B99310000942E0000B13D0000C1450000BF43
      0000BC3E0026C35115D5C85511DDA2340000A2330000A3320000A33100009F26
      0068BE7552FFDDBA92FFA0380DC0972600019D2C0000BA410000C0450000BD3D
      0019C14B16C9ECC4A6FFDA7D41FB9B3200009B2D00009C2B00009A25005CAF5A
      32FBF6F4CFFFE9C392FFA43606BE9B2A0001AD370000C6490000BE420007C043
      07C2E7B491FFFFFAD6FFDF7832F89C3200009C2E00009A26004BA95029F1EEDB
      B0FFFFE7ABFFD78D53FFA63602A0A8360000C1460000C1440009BF4102B5E2A2
      7BFFFFE7BDFFF9C383FFDD6618F19C32000098240036A24321E6E8D0A6FFFFD3
      8BFFE38E4BFFAA3C08D5A737001FB4410000BE3D0001BC3A00A3DF986DFFFFD9
      A7FFFBB064FFE26E20FFD8510072982A00299C3916D9E2C397FFFFC475FFE880
      2EFFAC3F0AE1A535002CB6420000C3450004BC3B0093DB8C5DFFFECD96FFFE9B
      42FFE46E1AFFD64C0083D95200009E3B0FD0DEB688FFFFB760FFEE6F0FFFAF3F
      02E6A9370031A93A0000BF450000C144006CD8824DFFFDC185FFFF8622FFE765
      0BFFD953008CDD580000DD590000A04417D8E69950FFFF7D0FFFEC6605FFB347
      0FE1B73F0026C64B0000C5490000C5490374E0803BFFFF8C2AFFFF6D00FFE866
      0CFFE15B0583EF5F0000FB690000992F0034A93904E1EB7A1EFFFF8214FFEA80
      36FFBD5118DAC2460024CC500000C64C0007CE4B00A1E96D13FFFF8219FFFE80
      22FFEF7F32FFEE600276FB6700009C330000A1340043B9490AEDF18022FFFF85
      1AFFEA7C2DFFC7520CC9D0510019CE510000CF510006DA5601AEF1781BFFFF84
      1DFFFE8425FFF6791EFCFA6800649B330000A4370000AF3C0059C6540CF7F685
      25FFFF8318FFE7660AFFD1510098D1520000CF520000DF59000FE86002C0F77F
      1DFFFF8621FFFE7911FFFE6C03ED97300000A0350000AE3C0000B9410066D35E
      10FFFC902DFFF57610FFD85500BED6550001D4540000DE590000EB600011F467
      03CDFE8726FFFF8622FFFF6E02F7B7440000BB460000C1490000C54B0000C94B
      0075E16C17FFF48225FFDF5B03C0DC560001DB570000E05A0000EA610000F566
      0024FE6F07D1FF8C2BFFFF770FFAD0530000D0530000CF520000CE520000CD51
      0000D655027CE36209FFE45F0284E35D0000E35D0000E45C0000EA600000F668
      0000FF6A0031FF7106DFFF7005E4FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000932900009730
      00009A350000952B0000952C00009A330000983100008F20004A9A350FD9A84E
      24FFA23905CCFFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000932900009730
      00009A350000952B0000962C0000983000128F200090A0411EFCDFBEA8FFE7C0
      9DFFA93C0DF7FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000932900009730
      00009A350000952B000094290047922602CFB86F51FFF1D6BBFFFFFFD8FFE9BF
      8BFFAF3F0AF7FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000932900009831
      0000993300069226008C9C3A15F8D5A488FFFDE4C0FFFFD99EFFFDD496FFD588
      4FFFB33F03E8FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000942A00009429
      0036902400CDB26443FFECCDADFFFFD7A1FFFFBA6DFFF1A65FFFC56227FFB039
      00CCB7420041FFFFFF00FFFFFF00FFFFFF00FFFFFF00983100098E2000829832
      0FEBCE9A7BFFFBDBB0FFFFB568FFFD9437FFDC782DFFB5460CF6AC33008CB742
      000EB9460000FFFFFF00FFFFFF00FFFFFF00FFFFFF00952D00C3B25F37FFECC5
      A0FFFFC382FFFF841FFFF6740EFFC2510DFFAE3B00CEB23E0038B13C0000B642
      0000B8460000FFFFFF00FFFFFF00FFFFFF00FFFFFF00962E02CCBA6D40FFF3A9
      61FFFF861AFFFF7201FFF56B03FFC35312FFB6460EC6C0430029CB4B0000D655
      0000E15C0000FFFFFF00FFFFFF00FFFFFF00FFFFFF009832000A92250090A83A
      05F4DC7523FFFD8E29FFFF7A0CFFFD8121FFE28649FFC85A1BEFC746007DD654
      000CE15C0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000972E0001A235
      0045AB3B01D8CD5E14FFF58524FFFF7E10FFFF7C14FFF58C39FFDB6E24FFD554
      02C2E05A002DFFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000972D0000A539
      0000B241000DB842009BC65107FEEB771CFFFE7D14FFFF7307FFFE821EFFEC6E
      13FFE25C00E2FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000972D0000A539
      0000B3420000BA440000C3490058CB4F01DAE36A12FFFB7D18FFFF7608FFF96E
      06FFEA6201F7FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000972D0000A539
      0000B3420000BA440000C44A0000D151001ED653009EE46208FFF87814FFFA72
      0AFFF26500F7FFFFFF00FFFFFF00FFFFFF00FFFFFF0098310000972D0000A539
      0000B3420000BA440000C44A0000D1530000DA570000E2590057ED6303E4F56C
      06FFF76A01D6FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009A3505C7A74D25FF9B36
      11DD9725004FA83B0000B5420000BB410000C5480000D2540000DB560000E659
      0000F0640000FFFFFF00FFFFFF00FFFFFF00FFFFFF009A340CF7E1BB9AFFE2C4
      ACFFAB4A22FFA22B0095B33F0016BB420000C5480000D2540000DB560000E659
      0000F0640000FFFFFF00FFFFFF00FFFFFF00FFFFFF009A330AF7E3BA88FFFFFE
      D7FFF4D9BEFFC97C56FFB13802D3BA3F004EC5480000D2540000DB560000E659
      0000F0640000FFFFFF00FFFFFF00FFFFFF00FFFFFF009F3302E5CD814CFFFDD3
      96FFFFD89EFFFEE4BFFFE5B08CFFC45318FBC4430092D1520009DB560000E659
      0000F0640000FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3380039A63200C9C45F
      24FFF2A65EFFFFB86CFFFFD39EFFF6D2AFFFDB7E48FFD04902D1DA50003CE659
      0000F0650000FFFFFF00FFFFFF00FFFFFF00FFFFFF00A53B0000AD3C000DAF34
      0086C14C0BF3E57C2DFFFE9437FFFFB064FFFDD9AFFFEDAF7FFFE05D12EFE451
      0088F0640009FFFFFF00FFFFFF00FFFFFF00FFFFFF00A53B0000AC3C0000B33D
      0000C0460032C74900C9DB5F0BFFFA750FFFFF801CFFFFBD7DFFFACCA2FFEF84
      3AFFF16100C7FFFFFF00FFFFFF00FFFFFF00FFFFFF00CD510000CD4F0000CD4D
      0000CE4B0024CF550DC0DE6314FFF96D05FFFF7000FFFF8117FFFDAC60FFF791
      43FFF76602D0FFFFFF00FFFFFF00FFFFFF00FFFFFF00CD510000CD4F000BCB48
      0077D56018ECEB8B48FFFE8224FFFF760AFFFE8B27FFF88423FFF46606F7F65E
      0095F969000FFFFFFF00FFFFFF00FFFFFF00FFFFFF00CC500028CC4E01BFDC6C
      22FFF88D3BFFFF7B16FFFF7A0DFFFC8724FFF67515FFF36502DCF664004AF764
      0001F9690000FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE5000DFE46A11FFFD82
      1EFFFF7306FFFF7B12FFF97F1BFFF26A08FFF56400A2F7680010F7660000F764
      0000F9690000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D65601F7F46D07FFFF77
      08FFFC7C16FFF37412FFF06401DDF465005EF6680000F7680000F7660000F764
      0000F9690000FFFFFF00FFFFFF00FFFFFF00FFFFFF00DD5A00F7F66F09FFF978
      14FFF06908FFF06300A5F3660024F4660000F6680000F7680000F7660000F764
      0000F9690000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E45D01D1ED6606FFEE65
      03E8F063005CF3670000F3670000F4650000F6680000F7680000F7660000F764
      0000F9690000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B24810D3B44B17E0B2370031BA410000C548
      0000B5400000973100009D3400009F380468A34517FF972D057C9E330000A036
      0000A03500009F3500009E340000C26838F9E9C3A8FFBA4C1DD1B83B0024C448
      0000C04500009B2B000090230000993109A6D8B18AFFBE7D5BFF97240073A030
      0000A4330000A7360000AB3B0000C36329F6FFF6CEFFE7BB9CFFBC450ACDC044
      0010D2510000AB3600008C210000972C04A4E0B887FFFCFCD2FFB6633CFF9E25
      0066A8310000B2370000BB420000BD5114EBF2BD7EFFFFE9BAFFE3A983FFC144
      04C0C949000ED45200009F320000972D0088CD824BFFFFE5A8FFF3E0B3FFB55D
      30F7A52B0058B0370000B9410000B63D0064C95E1CFDF9AD62FFFFD7A2FFE2A1
      76FFC64200AED5500007B4430000932E001AA03506C9DF8947FFFFCF87FFF0D8
      A8FFB65428ECAD2E0042B9410000B7400000B83C0078D46218FFFC983FFFFFCA
      90FFE19564FFCC46009FDF590006BA460000992E0025A83B07DBE57D2DFFFFC0
      6FFFEDCC9CFFB84D1CE1B63A0034B8400000BA400000C0430082DB5D09FFFF84
      1EFFFEBF80FFE48E54FFD751007FD04F00009B330000A5370027B03F01DFEC6D
      0FFFFFAF58FFEBC08DFFBE5113D9CA4D0000C8490000C54B0478DB600FFEFF6F
      00FFFF8924FFE9883EFFD8560487D3510000AF3E0000AE3A001AB1460DD9EA66
      06FFFF790BFFF09B4EFFC35A1AE0CA4C0000C6490169D9712FFDFC8224FFFF82
      17FFE96F15FFD64E00ABDE590009C74D0000AD39001EB14814D4E57E37FFFF80
      13FFF17E1EFFC34906EABC41003FC94C0056D7651BF7FA8326FFFF841AFFEC77
      1CFFD75401B9DC56000BC34A0000AE3D0012B0430ABDE2762CFFFF851AFFF583
      22FFC5530BF3B841004FBE460000D15302E7F57310FFFF871EFFF07B1FFFD956
      03CADB570016DB570000B4410000AE3E0082D65C08FFFF8316FFF88625FFCA58
      0FFABA410064BB430000BE460000DA5901F6FF871EFFF38327FFD95804D5D955
      001DE05A0000C2490000AD3E0000B44100A4E96E0DFFFE922CFFCD5C12FFBA41
      0070BB430000BB430000BE460000DE630DF9F5872AFFDB5C08DBD853002FDB57
      0000D4530000BA430000B33F0000B94402A6E67923FFD7681AFFBB430082BE46
      0000BF470000BE460000C0480000D95B05DBDD5D07E8D954003BD9560000DC57
      0000CD500000B7450000BB470000BD49016FC65108FFC0490287C0480001C149
      0000C1490000C1490000C1490000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001919770014146E1F252596C32424A8F41A1A
      7B5818187A00161680001515850013138700111188000E0E85000E0E884B2525
      B0F22323A9CF01018A29030393001818731F22228EC35A5AEBFF6868FFFF1D1D
      B3F618187B5B16167E001515850013138700111186000D0D844C1F1FB5F18787
      FDFF8484F2FF1E1EA9CC00008F2B2D2D95C95B5BEDFFC9C9FFFFEDEDFFFF6969
      FBFF1111B9F61515805915158400131386000F0F864A1515B8F17474F8FFEBEB
      FFFFDEDEFFFF8B8BF3FF2D2DB0D53535A8F66E6EFFFFD4D4FFFFDFDFFFFFD3D3
      FFFF5D5DF7FF0808B6F413138553101086450B0BB3F26262F4FFD2D2FFFFD9D9
      FFFFD6D6FFFFAAAAFFFF4343C2FB19197B5A3333B6F46767FDFFBBBBFFFFC8C8
      FFFFC4C4FFFF4D4DF4FF0101B6FB0202B0F84C4CF1FFC1C1FFFFC6C6FFFFBFBF
      FFFF9494FEFF4343CAF80505986A13137900151579592929BDF65C5CFCFFAAAA
      FFFFB4B4FFFFB0B0FDFF3D3DECFF3636EAFFABABFDFFB3B3FFFFACACFFFF8181
      FDFF3B3BCDFB0404936B0000940015157A001010780014147E5B2020B9F74B4B
      FAFF9393FFFFA0A0FFFF9696FDFF9595FDFF9F9FFFFF9696FEFF6A6AFBFF2C2C
      C8FB0303946B000091000101960015157A0012127A000F0F7C00101082501818
      B7F94242F4FF8585FFFF8F8FFFFF8E8EFFFF8787FEFF5757F5FF1F1FC5FC0101
      955D0000920000009400010196000A0A8900080887000A0A8500101084402222
      B5F70E0EE7FF2A2AE8FF4242EAFF4242EAFF3737E7FF2929E7FF2323C2FA0101
      964D0000980000009E000000A3000A0A8900050585000F0F844C2C2CB7F21818
      F0FF0000E0FF0000D5FF0000CCFF0000CCFF0B0BD4FF2020DFFF3D3DEEFF3030
      C6F602029A5B00009C000000A300080888000C0C844A3535BCF11E1EF5FF0000
      EAFF0000DFFF0000D7FF0101DBFF0606DCFF1313D7FF2222DEFF2F2FE7FF4E4E
      F4FF3D3DCCF603039D590000A2000F0F894E3838B8F22525FAFF0000F1FF0000
      E5FF0000DFFF0505E3FF0A0AC5FD0B0BC1FB1616E3FF2121DFFF2E2EE4FF3C3C
      EEFF6060F9FF4343CBF40404A45E3939B1F23030FFFF0000F8FF0000EBFF0000
      E7FF0A0AEBFF1313C7F80A0A9660060695511313C5F42929E9FF2F2FE6FF3C3C
      EAFF4646F4FF7777FFFF4545C9F72E2EAAD43636F3FF0505FAFF0000ECFF1010
      F1FF1C1CCCFB0909956B080893000606940002029A591E1ECBF63A3AEFFF3B3B
      ECFF4C4CF6FF7171F7FF3434C0DF09098B2B2B2BA9CC2E2EF1FF1A1AFBFF2424
      C9FB0A0A966B0505920009099500070795000101970001019C5B2727CAF64F4F
      F7FF6161F5FF2E2EBDD70000A2380A0A8E0006068B292323B2CD2828C2F90909
      9869050593000707940009099500070795000202990000009A000202A45B2A2A
      C9F52525C1DA0000A0370101A400
    }
  end
  object actMain: TActionList
    Images = imMain
    OnUpdate = actMainUpdate
    left = 192
    top = 160
    object actPrint: TAction
      Caption = '&Print'
      Hint = 'Print'
      ImageIndex = 0
      OnExecute = actPrintExecute
      ShortCut = 16464
    end
    object actFirstPage: TAction
      Caption = '&First page'
      Hint = 'First page'
      ImageIndex = 1
      OnExecute = actFirstPageExecute
      ShortCut = 16454
    end
    object actPrevPage: TAction
      Caption = 'Pre&vious page'
      Hint = 'Previous page'
      ImageIndex = 2
      OnExecute = actPrevPageExecute
      ShortCut = 16470
    end
    object actNextPage: TAction
      Caption = '&Next page'
      Hint = 'Next page'
      ImageIndex = 3
      OnExecute = actNextPageExecute
      ShortCut = 16462
    end
    object actLastPage: TAction
      Caption = '&Last page'
      Hint = 'Last page'
      ImageIndex = 4
      OnExecute = actLastPageExecute
      ShortCut = 16460
    end
    object actCancel: TAction
      Caption = 'Cancel preview'
      Hint = 'Cancel preview'
      ImageIndex = 5
      OnExecute = actCancelExecute
      ShortCut = 32835
    end
  end
end
