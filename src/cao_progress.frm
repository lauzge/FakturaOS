object ProgressForm: TProgressForm
  Left = 86
  Height = 93
  Top = 85
  Width = 320
  BorderStyle = bsToolWindow
  Caption = 'SQL-Ausführen ...'
  ClientHeight = 93
  ClientWidth = 320
  Color = clBtnFace
  Font.Color = clWindowText
  FormStyle = fsStayOnTop
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object PB1: TProgressBar
    Left = 8
    Height = 20
    Top = 8
    Width = 300
    Max = 1000
    Step = 50
    TabOrder = 0
  end
  object Label1: TLabel
    Left = 8
    Height = 15
    Top = 40
    Width = 300
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    ParentColor = False
  end
  object Label2: TLabel
    Left = 8
    Height = 15
    Top = 72
    Width = 300
    Alignment = taCenter
    AutoSize = False
    Caption = 'Befehle werden ausgeführt, bitte warten ...'
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Quality = fqAntialiased
    ParentColor = False
    ParentFont = False
  end
end
