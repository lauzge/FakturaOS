object frmDatePropertyEditor: TfrmDatePropertyEditor
  Left = 349
  Height = 201
  Top = 233
  Width = 231
  HorzScrollBar.Page = 218
  VertScrollBar.Page = 192
  BorderStyle = bsDialog
  Caption = 'Select Date'
  ClientHeight = 201
  ClientWidth = 231
  Position = poDefaultPosOnly
  LCLVersion = '6.0'
  object Button1: TButton
    Left = 69
    Height = 25
    Top = 168
    Width = 75
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 149
    Height = 25
    Top = 168
    Width = 75
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object VpCalendar1: TVpCalendar
    Left = 8
    Height = 152
    Top = 8
    Width = 216
    ParentFont = False
    BorderStyle = bsNone
    Colors.ActiveDay = clRed
    Colors.ColorScheme = cscalCustom
    Colors.DayNames = clMaroon
    Colors.Days = clBlack
    Colors.InactiveDays = clGray
    Colors.MonthAndYear = clBlue
    Colors.Weekend = clRed
    Colors.EventDays = clBlack
    DateFormat = dfLong
    DayNameWidth = 3
    Options = [cdoShortNames, cdoShowYear, cdoShowRevert, cdoShowToday, cdoShowNavBtns]
    ReadOnly = False
    TabOrder = 2
    TabStop = True
    WantDblClicks = True
    WeekStarts = dtSunday
  end
end
