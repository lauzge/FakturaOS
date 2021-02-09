object ContactEditForm: TContactEditForm
  Left = 679
  Height = 629
  Top = 224
  Width = 575
  HorzScrollBar.Page = 432
  VertScrollBar.Page = 320
  ActiveControl = PageControl
  Caption = 'ContactEdit'
  ClientHeight = 629
  ClientWidth = 575
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  Position = poScreenCenter
  LCLVersion = '6.0'
  object PageControl: TPageControl
    Left = 0
    Height = 592
    Top = 0
    Width = 575
    ActivePage = tabContact
    Align = alClient
    TabIndex = 2
    TabOrder = 0
    OnChange = PageControlChange
    object tabBaseData: TTabSheet
      Caption = 'tabBaseData'
      ClientHeight = 564
      ClientWidth = 567
      ImageIndex = 0
      object lblLastName: TLabel
        Left = 9
        Height = 15
        Top = 6
        Width = 54
        Alignment = taRightJustify
        BorderSpacing.Left = 8
        Caption = 'Last name'
        FocusControl = edLastName
        ParentColor = False
      end
      object edLastName: TEdit
        Left = 136
        Height = 23
        Top = 6
        Width = 232
        BorderSpacing.Right = 8
        MaxLength = 100
        OnChange = ItemChanged
        TabOrder = 0
      end
      object lblFirstName: TLabel
        Left = 8
        Height = 15
        Top = 31
        Width = 55
        Alignment = taRightJustify
        BorderSpacing.Left = 8
        Caption = 'First name'
        FocusControl = edFirstName
        ParentColor = False
      end
      object edFirstName: TEdit
        Left = 136
        Height = 23
        Top = 29
        Width = 232
        BorderSpacing.Right = 8
        MaxLength = 100
        OnChange = ItemChanged
        TabOrder = 1
      end
      object lblTitle: TLabel
        Left = 8
        Height = 15
        Top = 58
        Width = 23
        Alignment = taRightJustify
        BorderSpacing.Left = 8
        Caption = 'Title'
        FocusControl = edTitle
        ParentColor = False
      end
      object edTitle: TEdit
        Left = 136
        Height = 23
        Top = 56
        Width = 153
        MaxLength = 50
        OnChange = ItemChanged
        TabOrder = 2
      end
      object lblCategory: TLabel
        Left = 8
        Height = 15
        Top = 90
        Width = 48
        Alignment = taRightJustify
        BorderSpacing.Left = 8
        Caption = 'Category'
        FocusControl = cbCategory
        ParentColor = False
      end
      object cbCategory: TComboBox
        Left = 136
        Height = 23
        Top = 88
        Width = 153
        ItemHeight = 15
        MaxLength = 65535
        TabOrder = 3
      end
      object lblBirthdate: TLabel
        Left = 16
        Height = 15
        Top = 124
        Width = 51
        Alignment = taRightJustify
        BorderSpacing.Left = 8
        Caption = 'Birth date'
        FocusControl = edBirthdate
        ParentColor = False
      end
      object edBirthdate: TDateEdit
        Left = 136
        Height = 23
        Top = 120
        Width = 153
        CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
        DateOrder = doNone
        ButtonWidth = 23
        BorderSpacing.Bottom = 8
        NumGlyphs = 1
        MaxLength = 0
        ParentFont = False
        TabOrder = 4
        Text = 'edBirthdate'
      end
    end
    object tabAddresses: TTabSheet
      Caption = 'tabAddresses'
      ClientHeight = 564
      ClientWidth = 567
      ImageIndex = 1
      object gbWorkAddress: TGroupBox
        Left = 8
        Height = 311
        Top = 8
        Width = 551
        Align = alTop
        AutoSize = True
        BorderSpacing.Left = 8
        BorderSpacing.Top = 8
        BorderSpacing.Right = 8
        BorderSpacing.Bottom = 8
        Caption = 'gbWorkAddress'
        ClientHeight = 291
        ClientWidth = 547
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object edCompany: TEdit
          AnchorSideTop.Control = gbWorkAddress
          AnchorSideRight.Control = gbWorkAddress
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 0
          Width = 338
          Anchors = [akTop, akRight]
          AutoSize = False
          BorderSpacing.Right = 8
          MaxLength = 50
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 0
        end
        object lblCompany: TLabel
          AnchorSideTop.Control = edCompany
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 128
          Height = 15
          Top = 4
          Width = 65
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblCompany'
          FocusControl = edCompany
          ParentColor = False
          ParentFont = False
        end
        object lblDepartment: TLabel
          AnchorSideTop.Control = edDepartment
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 117
          Height = 15
          Top = 31
          Width = 76
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblDepartment'
          FocusControl = edDepartment
          ParentColor = False
          ParentFont = False
        end
        object edDepartment: TEdit
          AnchorSideLeft.Control = edCompany
          AnchorSideTop.Control = edCompany
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edCompany
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 27
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          MaxLength = 50
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 1
        end
        object lblPosition: TLabel
          AnchorSideTop.Control = edPosition
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 137
          Height = 15
          Top = 58
          Width = 56
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblPosition'
          FocusControl = edPosition
          ParentColor = False
          ParentFont = False
        end
        object edPosition: TEdit
          AnchorSideLeft.Control = edDepartment
          AnchorSideTop.Control = edDepartment
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edDepartment
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 54
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          BorderSpacing.Bottom = 17
          MaxLength = 50
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 2
        end
        object lblAddressW: TLabel
          AnchorSideTop.Control = edAddressW
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 138
          Height = 15
          Top = 98
          Width = 55
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblAddress'
          FocusControl = edAddressW
          ParentColor = False
          ParentFont = False
        end
        object edAddressW: TEdit
          AnchorSideLeft.Control = edPosition
          AnchorSideTop.Control = edPosition
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edPosition
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 94
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          MaxLength = 100
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 3
        end
        object lblCityW: TLabel
          AnchorSideTop.Control = edCityW
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 159
          Height = 15
          Top = 125
          Width = 34
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblCity'
          FocusControl = edCityW
          ParentColor = False
          ParentFont = False
        end
        object edCityW: TEdit
          AnchorSideLeft.Control = edAddressW
          AnchorSideTop.Control = edAddressW
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edAddressW
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 121
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          MaxLength = 50
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 4
        end
        object lblStateW: TLabel
          AnchorSideTop.Control = edStateW
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 154
          Height = 15
          Top = 152
          Width = 39
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblState'
          FocusControl = edStateW
          ParentColor = False
          ParentFont = False
        end
        object edStateW: TEdit
          AnchorSideLeft.Control = edCityW
          AnchorSideTop.Control = edCityW
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edCityW
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 148
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          MaxLength = 25
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 5
        end
        object lblStateComboW: TLabel
          AnchorSideTop.Control = cbStateW
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 118
          Height = 15
          Top = 179
          Width = 79
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 4
          Caption = 'lblStateCombo'
          FocusControl = cbStateW
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object cbStateW: TComboBox
          AnchorSideLeft.Control = edStateW
          AnchorSideTop.Control = edStateW
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edStateW
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 175
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object lblZipCodeW: TLabel
          AnchorSideTop.Control = edZipCodeW
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 135
          Height = 15
          Top = 206
          Width = 58
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblZipCode'
          FocusControl = edZipCodeW
          ParentColor = False
          ParentFont = False
        end
        object edZipCodeW: TEdit
          AnchorSideLeft.Control = cbStateW
          AnchorSideTop.Control = cbStateW
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 202
          Width = 120
          BorderSpacing.Top = 4
          BorderSpacing.Right = 8
          MaxLength = 10
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 7
        end
        object lblCountryComboW: TLabel
          AnchorSideTop.Control = cbCountryW
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 97
          Height = 15
          Top = 233
          Width = 96
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblCountryCombo'
          FocusControl = cbCountryW
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object cbCountryW: TComboBox
          AnchorSideLeft.Control = edZipCodeW
          AnchorSideTop.Control = edZipCodeW
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = gbWorkAddress
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 229
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          BorderSpacing.Right = 8
          BorderSpacing.Bottom = 8
          ItemHeight = 15
          MaxLength = 65535
          OnChange = cbCountryChange
          ParentFont = False
          TabOrder = 8
          Visible = False
        end
        object lblCountryW: TLabel
          AnchorSideTop.Control = edCountryW
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCompany
          Left = 137
          Height = 15
          Top = 264
          Width = 56
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblCountry'
          FocusControl = edCountryW
          ParentColor = False
          ParentFont = False
        end
        object edCountryW: TEdit
          AnchorSideLeft.Control = cbCountryW
          AnchorSideTop.Control = cbCountryW
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = gbWorkAddress
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 260
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          BorderSpacing.Right = 8
          BorderSpacing.Bottom = 8
          ParentFont = False
          TabOrder = 9
        end
      end
      object gbHomeAddress: TGroupBox
        Left = 8
        Height = 217
        Top = 335
        Width = 551
        Align = alTop
        AutoSize = True
        BorderSpacing.Left = 8
        BorderSpacing.Top = 16
        BorderSpacing.Right = 8
        BorderSpacing.Bottom = 8
        Caption = 'gbHomeAddress'
        ClientHeight = 197
        ClientWidth = 547
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblAddressH: TLabel
          AnchorSideTop.Control = edAddressH
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edAddressH
          Left = 138
          Height = 15
          Top = 4
          Width = 55
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblAddress'
          FocusControl = edAddressH
          ParentColor = False
          ParentFont = False
        end
        object edAddressH: TEdit
          AnchorSideTop.Control = gbHomeAddress
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 0
          Width = 338
          Anchors = [akTop, akRight]
          MaxLength = 100
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 0
        end
        object lblCityH: TLabel
          AnchorSideTop.Control = edCityH
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCityH
          Left = 159
          Height = 15
          Top = 31
          Width = 34
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblCity'
          FocusControl = edCityH
          ParentColor = False
          ParentFont = False
        end
        object edCityH: TEdit
          AnchorSideLeft.Control = edAddressH
          AnchorSideTop.Control = edAddressH
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edAddressH
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 27
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          MaxLength = 50
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 1
        end
        object lblStateH: TLabel
          AnchorSideTop.Control = edStateH
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edStateH
          Left = 154
          Height = 15
          Top = 58
          Width = 39
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblState'
          FocusControl = edStateH
          ParentColor = False
          ParentFont = False
        end
        object edStateH: TEdit
          AnchorSideLeft.Control = edCityH
          AnchorSideTop.Control = edCityH
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edCityH
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 54
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          MaxLength = 25
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 2
        end
        object lblStateComboH: TLabel
          AnchorSideTop.Control = cbStateH
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = cbStateH
          Left = 118
          Height = 15
          Top = 85
          Width = 79
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 4
          Caption = 'lblStateCombo'
          FocusControl = cbStateH
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object cbStateH: TComboBox
          AnchorSideLeft.Control = edStateH
          AnchorSideTop.Control = edStateH
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = edStateH
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 81
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          TabOrder = 3
          Visible = False
        end
        object lblZipCodeH: TLabel
          AnchorSideTop.Control = edZipCodeH
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edZipCodeH
          Left = 135
          Height = 15
          Top = 112
          Width = 58
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblZipCode'
          FocusControl = edZipCodeH
          ParentColor = False
          ParentFont = False
        end
        object edZipCodeH: TEdit
          AnchorSideLeft.Control = cbStateH
          AnchorSideTop.Control = cbStateH
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 108
          Width = 120
          BorderSpacing.Top = 4
          BorderSpacing.Right = 8
          MaxLength = 10
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 4
        end
        object lblCountryComboH: TLabel
          AnchorSideTop.Control = cbCountryH
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = cbCountryH
          Left = 97
          Height = 15
          Top = 139
          Width = 96
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblCountryCombo'
          FocusControl = cbCountryH
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object cbCountryH: TComboBox
          AnchorSideLeft.Control = edZipCodeH
          AnchorSideTop.Control = edZipCodeH
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = gbHomeAddress
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 135
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          BorderSpacing.Right = 8
          BorderSpacing.Bottom = 8
          ItemHeight = 15
          MaxLength = 65535
          OnChange = cbCountryChange
          ParentFont = False
          TabOrder = 5
          Visible = False
        end
        object lblCountryH: TLabel
          AnchorSideTop.Control = edCountryH
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edCountryH
          Left = 137
          Height = 15
          Top = 170
          Width = 56
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Right = 8
          Caption = 'lblCountry'
          FocusControl = edCountryH
          ParentColor = False
          ParentFont = False
        end
        object edCountryH: TEdit
          AnchorSideLeft.Control = cbCountryH
          AnchorSideTop.Control = cbCountryH
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = gbHomeAddress
          AnchorSideRight.Side = asrBottom
          Left = 201
          Height = 23
          Top = 166
          Width = 338
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Top = 4
          BorderSpacing.Right = 8
          BorderSpacing.Bottom = 8
          ParentFont = False
          TabOrder = 6
        end
      end
    end
    object tabContact: TTabSheet
      Caption = 'tabContact'
      ClientHeight = 564
      ClientWidth = 567
      ImageIndex = 1
      object gbPhone: TGroupBox
        AnchorSideTop.Control = tabContact
        Left = 8
        Height = 159
        Top = 8
        Width = 384
        BorderSpacing.Left = 8
        BorderSpacing.Top = 8
        BorderSpacing.Right = 8
        Caption = 'Phone / fax'
        ClientHeight = 139
        ClientWidth = 380
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cbPhone1: TComboBox
          AnchorSideLeft.Control = gbPhone
          Left = 8
          Height = 23
          Top = 0
          Width = 88
          BorderSpacing.Left = 8
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 0
        end
        object cbPhone2: TComboBox
          AnchorSideLeft.Control = gbPhone
          AnchorSideTop.Control = cbPhone1
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = cbPhone1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 23
          Top = 27
          Width = 88
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 2
        end
        object cbPhone3: TComboBox
          AnchorSideLeft.Control = gbPhone
          AnchorSideTop.Control = cbPhone2
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = cbPhone1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 23
          Top = 54
          Width = 88
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 4
        end
        object cbPhone4: TComboBox
          AnchorSideLeft.Control = gbPhone
          AnchorSideTop.Control = cbPhone3
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = cbPhone1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 23
          Top = 81
          Width = 88
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 6
        end
        object edPhone4: TEdit
          AnchorSideLeft.Control = cbPhone4
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbPhone4
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edPhone3
          AnchorSideRight.Side = asrBottom
          Left = 100
          Height = 23
          Top = 81
          Width = 260
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 4
          MaxLength = 25
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 7
        end
        object edPhone3: TEdit
          AnchorSideLeft.Control = cbPhone3
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbPhone3
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edPhone2
          AnchorSideRight.Side = asrBottom
          Left = 100
          Height = 23
          Top = 54
          Width = 260
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 4
          MaxLength = 25
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 5
        end
        object edPhone2: TEdit
          AnchorSideLeft.Control = cbPhone2
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbPhone2
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edPhone1
          AnchorSideRight.Side = asrBottom
          Left = 100
          Height = 23
          Top = 27
          Width = 260
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 4
          MaxLength = 25
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 3
        end
        object edPhone1: TEdit
          AnchorSideLeft.Control = cbPhone1
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbPhone1
          AnchorSideTop.Side = asrCenter
          Left = 100
          Height = 23
          Top = 0
          Width = 260
          BorderSpacing.Left = 4
          BorderSpacing.Right = 8
          MaxLength = 25
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 1
        end
        object cbPhone5: TComboBox
          AnchorSideLeft.Control = gbPhone
          AnchorSideTop.Control = cbPhone4
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = cbPhone1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 23
          Top = 108
          Width = 88
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 8
        end
        object edPhone5: TEdit
          AnchorSideLeft.Control = cbPhone5
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbPhone5
          AnchorSideTop.Side = asrCenter
          AnchorSideRight.Control = edPhone4
          AnchorSideRight.Side = asrBottom
          Left = 100
          Height = 23
          Top = 108
          Width = 260
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 4
          BorderSpacing.Bottom = 8
          MaxLength = 25
          OnChange = ItemChanged
          ParentFont = False
          TabOrder = 9
        end
      end
      object gbEMail: TGroupBox
        AnchorSideTop.Control = gbPhone
        AnchorSideTop.Side = asrBottom
        Left = 8
        Height = 109
        Top = 183
        Width = 421
        AutoSize = True
        BorderSpacing.Top = 16
        BorderSpacing.Right = 8
        Caption = 'E-Mail'
        ClientHeight = 89
        ClientWidth = 417
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object edEMail1: TEdit
          AnchorSideLeft.Control = cbEMail1
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbEMail1
          AnchorSideTop.Side = asrCenter
          Left = 128
          Height = 23
          Top = 4
          Width = 281
          BorderSpacing.Left = 4
          BorderSpacing.Right = 8
          ParentFont = False
          TabOrder = 1
        end
        object edEMail2: TEdit
          AnchorSideLeft.Control = cbEMail2
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbEMail2
          AnchorSideTop.Side = asrCenter
          Left = 128
          Height = 23
          Top = 31
          Width = 281
          BorderSpacing.Left = 4
          ParentFont = False
          TabOrder = 3
        end
        object edEMail3: TEdit
          AnchorSideLeft.Control = cbEMail3
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbEMail3
          AnchorSideTop.Side = asrCenter
          Left = 128
          Height = 23
          Top = 58
          Width = 281
          BorderSpacing.Left = 4
          BorderSpacing.Bottom = 8
          ParentFont = False
          TabOrder = 5
        end
        object cbEMail1: TComboBox
          AnchorSideLeft.Control = gbEMail
          Left = 8
          Height = 23
          Top = 4
          Width = 116
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 0
        end
        object cbEMail2: TComboBox
          AnchorSideLeft.Control = gbEMail
          AnchorSideTop.Control = cbEMail1
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = cbEMail1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 23
          Top = 31
          Width = 116
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 2
        end
        object cbEMail3: TComboBox
          AnchorSideLeft.Control = gbEMail
          AnchorSideTop.Control = cbEMail2
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = cbEMail1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 23
          Top = 58
          Width = 116
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 4
        end
      end
      object gbWebsites: TGroupBox
        AnchorSideTop.Control = gbEMail
        AnchorSideTop.Side = asrBottom
        Left = 8
        Height = 82
        Top = 308
        Width = 454
        BorderSpacing.Top = 16
        BorderSpacing.Right = 8
        BorderSpacing.Bottom = 8
        Caption = 'Websites'
        ClientHeight = 62
        ClientWidth = 450
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object edWebsite1: TEdit
          AnchorSideLeft.Control = cbWebsite1
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbWebsite1
          AnchorSideTop.Side = asrCenter
          Left = 157
          Height = 23
          Top = 0
          Width = 281
          BorderSpacing.Left = 4
          BorderSpacing.Right = 8
          ParentFont = False
          TabOrder = 1
        end
        object edWebsite2: TEdit
          AnchorSideLeft.Control = cbWebsite2
          AnchorSideLeft.Side = asrBottom
          AnchorSideTop.Control = cbWebsite2
          AnchorSideTop.Side = asrCenter
          Left = 157
          Height = 23
          Top = 27
          Width = 281
          BorderSpacing.Left = 4
          BorderSpacing.Right = 8
          BorderSpacing.Bottom = 8
          ParentFont = False
          TabOrder = 3
        end
        object cbWebsite1: TComboBox
          AnchorSideLeft.Control = gbWebsites
          AnchorSideTop.Control = gbWebsites
          Left = 8
          Height = 23
          Top = 0
          Width = 145
          BorderSpacing.Left = 8
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 0
        end
        object cbWebsite2: TComboBox
          AnchorSideLeft.Control = gbWebsites
          AnchorSideTop.Control = cbWebsite1
          AnchorSideTop.Side = asrBottom
          AnchorSideRight.Control = cbWebsite1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 23
          Top = 27
          Width = 145
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Left = 8
          BorderSpacing.Top = 4
          BorderSpacing.Bottom = 8
          ItemHeight = 15
          MaxLength = 65535
          ParentFont = False
          Style = csDropDownList
          TabOrder = 2
        end
      end
    end
    object tabCustom: TTabSheet
      Caption = 'tabCustom'
      ClientHeight = 538
      ClientWidth = 518
      ImageIndex = 3
      object lblCustom1: TLabel
        Left = 8
        Height = 15
        Top = 12
        Width = 61
        BorderSpacing.Left = 8
        Caption = 'lblCustom1'
        FocusControl = edCustom1
        ParentColor = False
      end
      object lblCustom2: TLabel
        Left = 8
        Height = 15
        Top = 36
        Width = 61
        BorderSpacing.Left = 8
        Caption = 'lblCustom2'
        FocusControl = edCustom2
        ParentColor = False
      end
      object lblCustom3: TLabel
        Left = 8
        Height = 15
        Top = 60
        Width = 61
        BorderSpacing.Left = 8
        Caption = 'lblCustom3'
        FocusControl = edCustom3
        ParentColor = False
      end
      object lblCustom4: TLabel
        Left = 8
        Height = 15
        Top = 84
        Width = 61
        BorderSpacing.Left = 8
        Caption = 'lblCustom4'
        FocusControl = edCustom4
        ParentColor = False
      end
      object edCustom1: TEdit
        Left = 80
        Height = 23
        Top = 8
        Width = 337
        BorderSpacing.Right = 8
        MaxLength = 100
        OnChange = ItemChanged
        TabOrder = 0
      end
      object edCustom2: TEdit
        Left = 80
        Height = 23
        Top = 32
        Width = 337
        BorderSpacing.Right = 8
        MaxLength = 100
        OnChange = ItemChanged
        TabOrder = 1
      end
      object edCustom3: TEdit
        Left = 80
        Height = 23
        Top = 56
        Width = 337
        BorderSpacing.Right = 8
        MaxLength = 100
        OnChange = ItemChanged
        TabOrder = 2
      end
      object edCustom4: TEdit
        Left = 80
        Height = 23
        Top = 80
        Width = 337
        BorderSpacing.Right = 8
        BorderSpacing.Bottom = 8
        MaxLength = 100
        OnChange = ItemChanged
        TabOrder = 3
      end
    end
    object tabNotes: TTabSheet
      Caption = 'tabNotes'
      ClientHeight = 264
      ClientWidth = 472
      ImageIndex = 4
      object memoNotes: TMemo
        Left = 4
        Height = 300
        Top = 4
        Width = 600
        Align = alClient
        BorderSpacing.Around = 4
        Constraints.MinHeight = 300
        Constraints.MinWidth = 600
        MaxLength = 1024
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Height = 37
    Top = 592
    Width = 575
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 37
    ClientWidth = 575
    TabOrder = 1
    object OKBtn: TButton
      AnchorSideTop.Control = pnlBottom
      AnchorSideTop.Side = asrCenter
      Left = 415
      Height = 25
      Top = 6
      Width = 74
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      OnClick = OKBtnClick
      TabOrder = 0
    end
    object CancelBtn: TButton
      AnchorSideTop.Side = asrCenter
      Left = 493
      Height = 25
      Top = 6
      Width = 75
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      OnClick = CancelBtnClick
      TabOrder = 1
    end
  end
end
