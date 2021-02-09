object PimForm: TPimForm
  Left = 86
  Height = 576
  Top = 85
  Width = 663
  Caption = 'PIM'
  ClientHeight = 556
  ClientWidth = 663
  Font.Color = clWindowText
  Menu = MainMenu1
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  LCLVersion = '7.2'
  object MainPanel: TPanel
    Left = 0
    Height = 556
    Top = 0
    Width = 663
    Align = alClient
    ClientHeight = 556
    ClientWidth = 663
    Color = clBtnFace
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Quality = fqAntialiased
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object PanelCalSplit1: TPanel
      Left = 1
      Height = 554
      Top = 1
      Width = 334
      Align = alClient
      ClientHeight = 554
      ClientWidth = 334
      TabOrder = 0
      object VpDayView1: TVpDayView
        Left = 1
        Height = 552
        Top = 1
        Width = 332
        DataStore = CAO_DS
        ControlLink = VpControlLink1
        Color = clWindow
        Align = alClient
        ReadOnly = False
        TabStop = True
        TabOrder = 0
        AllDayEventAttributes.BackgroundColor = clBtnShadow
        AllDayEventAttributes.EventBorderColor = cl3DDkShadow
        AllDayEventAttributes.EventBackgroundColor = clBtnFace
        ShowEventTimes = False
        DrawingStyle = dsFlat
        TimeSlotColors.Active = 12189695
        TimeSlotColors.Inactive = 14548957
        TimeSlotColors.Holiday = 13421823
        TimeSlotColors.Weekday = 12189695
        TimeSlotColors.Weekend = 16777164
        TimeSlotColors.ActiveRange.RangeBegin = h_00
        TimeSlotColors.ActiveRange.RangeEnd = h_00
        HeadAttributes.Font.Height = -13
        HeadAttributes.Color = clBtnFace
        RowHeadAttributes.HourFont.Height = -24
        RowHeadAttributes.MinuteFont.Height = -12
        RowHeadAttributes.Color = clBtnFace
        ShowResourceName = False
        LineColor = clGray
        GutterWidth = 10
        DateLabelFormat = 'ddd, d. mmmm yyyy'
        Granularity = gr15Min
        DefaultTopHour = h_07
        TimeFormat = tf24Hour
        OnOwnerEditEvent = VpDayView1OwnerEditEvent
      end
    end
    object PanelCalSplit2: TPanel
      Left = 340
      Height = 554
      Top = 1
      Width = 322
      Align = alRight
      ClientHeight = 554
      ClientWidth = 322
      TabOrder = 1
      object VpMonthView1: TVpMonthView
        Left = 1
        Height = 225
        Top = 1
        Width = 320
        DataStore = CAO_DS
        ControlLink = VpControlLink1
        Color = clWindow
        Align = alTop
        TabStop = True
        TabOrder = 0
        KBNavigation = True
        DateLabelFormat = 'mmmm yyyy'
        DayHeadAttributes.Color = clBtnFace
        DayNameStyle = dsShort
        DrawingStyle = dsFlat
        EventDayStyle = [fsBold]
        HeadAttributes.Color = clBtnFace
        OffDayColor = clSilver
        SelectedDayColor = clBlue
        ShowEvents = True
        ShowEventTime = True
        TimeFormat = tf24Hour
        TodayAttributes.Color = clBtnFace
        TodayAttributes.BorderPen.Color = clRed
        TodayAttributes.BorderPen.Width = 3
        WeekStartsOn = dtMonday
      end
      object Splitter2: TSplitter
        Cursor = crVSplit
        Left = 1
        Height = 5
        Top = 226
        Width = 320
        Align = alTop
        ResizeAnchor = akTop
      end
      object VpTaskList1: TVpTaskList
        Left = 1
        Height = 322
        Top = 231
        Width = 320
        DataStore = CAO_DS
        ControlLink = VpControlLink1
        Color = clWindow
        Align = alClient
        TabStop = True
        TabOrder = 1
        ReadOnly = False
        AllowInplaceEditing = False
        DisplayOptions.CheckBGColor = clWindow
        DisplayOptions.CheckColor = clBlack
        DisplayOptions.CheckStyle = csCheck
        DisplayOptions.DueDateFormat = 'dd.mm.yyyy'
        DisplayOptions.ShowCompletedTasks = True
        DisplayOptions.ShowAll = False
        DisplayOptions.ShowDueDate = True
        DisplayOptions.OverdueColor = clRed
        DisplayOptions.NormalColor = clBlack
        DisplayOptions.CompletedColor = clGray
        LineColor = clBlack
        MaxVisibleTasks = 250
        TaskHeadAttributes.Color = clSilver
        TaskHeadAttributes.Font.Color = clWindowText
        TaskHeadAttributes.Font.Height = -11
        TaskHeadAttributes.Font.Name = 'Microsoft Sans Serif'
        TaskHeadAttributes.Font.Quality = fqAntialiased
        DrawingStyle = dsFlat
        ShowResourceName = False
        OnOwnerEditTask = VpTaskList1OwnerEditTask
      end
    end
    object Splitter1: TSplitter
      Left = 335
      Height = 554
      Top = 1
      Width = 5
      Align = alRight
      ResizeAnchor = akRight
    end
  end
  object MainMenu1: TMainMenu
    Images = MainForm.ImageList1
    Left = 176
    Top = 128
    object Bearbeiten1: TMenuItem
      Caption = '&Bearbeiten'
      GroupIndex = 2
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
      Visible = False
    end
    object Ansicht1: TMenuItem
      Caption = '&Ansicht'
      GroupIndex = 4
      object AuflsungTagesansicht1: TMenuItem
        Caption = 'AuflösungTagesansicht'
        ImageIndex = 25
        object N15min1: TMenuItem
          Tag = 3
          Caption = '15 min'
          Checked = True
          GroupIndex = 6
          RadioItem = True
          OnClick = TagViewAufloesungClick
        end
        object N30min1: TMenuItem
          Tag = 5
          Caption = '30 min'
          GroupIndex = 6
          RadioItem = True
          OnClick = TagViewAufloesungClick
        end
        object N60min1: TMenuItem
          Tag = 6
          Caption = '60 min'
          GroupIndex = 6
          RadioItem = True
          OnClick = TagViewAufloesungClick
        end
      end
      object AnzahlTage1: TMenuItem
        Caption = 'Anzahl Tage'
        ImageIndex = 57
        object N1Tag1: TMenuItem
          Tag = 1
          Caption = '1 Tag'
          Checked = True
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N2Tage1: TMenuItem
          Tag = 2
          Caption = '2 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N3Tage1: TMenuItem
          Tag = 3
          Caption = '3 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N4Tage1: TMenuItem
          Tag = 4
          Caption = '4 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N5Tage1: TMenuItem
          Tag = 5
          Caption = '5 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N6Tage1: TMenuItem
          Tag = 6
          Caption = '6 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
        object N7Tage1: TMenuItem
          Tag = 7
          Caption = '7 Tage'
          GroupIndex = 7
          RadioItem = True
          OnClick = TagViewAnzahlTageClick
        end
      end
      object Wochenendeanzeigen1: TMenuItem
        Caption = 'Wochenende anzeigen'
        GroupIndex = 1
        OnClick = Wochenendeanzeigen1Click
      end
    end
  end
  object VpControlLink1: TVpControlLink
    DataStore = CAO_DS
    Printer.DayStart = h_07
    Printer.DayEnd = h_06
    Printer.Granularity = gr30Min
    Printer.MarginUnits = imAbsolutePixel
    Printer.PrintFormats = <>
    Left = 112
    Top = 224
  end
  object VpNotificationDialog1: TVpNotificationDialog
    DataStore = CAO_DS
    BackgroundColor = clBtnFace
    Placement.Position = mpCustom
    Placement.Top = 10
    Placement.Left = 10
    Placement.Height = 250
    Placement.Width = 412
    Left = 249
    Top = 280
  end
  object CAO_DS: TVpCaoDataStore
    CategoryColorMap.Category0.Color = clNavy
    CategoryColorMap.Category0.Description = 'Category 0'
    CategoryColorMap.Category1.Color = clRed
    CategoryColorMap.Category1.Description = 'Category 1'
    CategoryColorMap.Category2.Color = clYellow
    CategoryColorMap.Category2.Description = 'Category 2'
    CategoryColorMap.Category3.Color = clLime
    CategoryColorMap.Category3.Description = 'Category 3'
    CategoryColorMap.Category4.Color = clPurple
    CategoryColorMap.Category4.Description = 'Category 4'
    CategoryColorMap.Category5.Color = clTeal
    CategoryColorMap.Category5.Description = 'Category 5'
    CategoryColorMap.Category6.Color = clFuchsia
    CategoryColorMap.Category6.Description = 'Category 6'
    CategoryColorMap.Category7.Color = clOlive
    CategoryColorMap.Category7.Description = 'Category 7'
    CategoryColorMap.Category8.Color = clAqua
    CategoryColorMap.Category8.Description = 'Category 8'
    CategoryColorMap.Category9.Color = clMaroon
    CategoryColorMap.Category9.Description = 'Category 9'
    HiddenCategories.BackgroundColor = clSilver
    HiddenCategories.Color = clGray
    EnableEventTimer = True
    PlayEventSounds = True
    DayBuffer = 31
    ResourceID = 0
    EventsTabName = 'PIM_TERMINE'
    ContactsTabName = 'PIM_KONTAKTE'
    TasksTabName = 'PIM_AUFGABEN'
    OnPostResources = CAO_DSPostResources
    OnLoadResources = CAO_DSLoadResources
    Left = 249
    Top = 224
  end
  object VpCaoEventEditDialog1: TVpCaoEventEditDialog
    DataStore = CAO_DS
    TimeFormat = tf24Hour
    Options = []
    Placement.Position = mpCenterTop
    Placement.Top = 10
    Placement.Left = 10
    Placement.Height = 415
    Placement.Width = 710
    HelpContext = 0
    Left = 136
    Top = 312
  end
  object VpZeosDatastore1: TVpZeosDatastore
    CategoryColorMap.Category0.Color = clNavy
    CategoryColorMap.Category0.Description = 'Kategorie 0'
    CategoryColorMap.Category1.Color = clRed
    CategoryColorMap.Category1.Description = 'Kategorie 1'
    CategoryColorMap.Category2.Color = clYellow
    CategoryColorMap.Category2.Description = 'Kategorie 2'
    CategoryColorMap.Category3.Color = clLime
    CategoryColorMap.Category3.Description = 'Kategorie 3'
    CategoryColorMap.Category4.Color = clPurple
    CategoryColorMap.Category4.Description = 'Kategorie 4'
    CategoryColorMap.Category5.Color = clTeal
    CategoryColorMap.Category5.Description = 'Kategorie 5'
    CategoryColorMap.Category6.Color = clFuchsia
    CategoryColorMap.Category6.Description = 'Kategorie 6'
    CategoryColorMap.Category7.Color = clOlive
    CategoryColorMap.Category7.Description = 'Kategorie 7'
    CategoryColorMap.Category8.Color = clAqua
    CategoryColorMap.Category8.Description = 'Kategorie 8'
    CategoryColorMap.Category9.Color = clMaroon
    CategoryColorMap.Category9.Description = 'Kategorie 9'
    HiddenCategories.BackgroundColor = clSilver
    HiddenCategories.Color = clGray
    EnableEventTimer = True
    PlayEventSounds = True
    AutoCreate = True
    Daybuffer = 31
    Left = 260
    Top = 98
  end
end
