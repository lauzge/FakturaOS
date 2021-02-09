object ManKasBuchForm: TManKasBuchForm
  Left = 373
  Height = 234
  Top = 256
  Width = 461
  HelpContext = 100100
  BorderStyle = bsDialog
  Caption = 'manuelle Kassenbuchung'
  ClientHeight = 234
  ClientWidth = 461
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object AbortBtn: TBitBtn
    Left = 312
    Height = 25
    Top = 200
    Width = 137
    DefaultCaption = True
    Kind = bkAbort
    ModalResult = 3
    TabOrder = 0
  end
  object BuchenBtn: TBitBtn
    Left = 184
    Height = 25
    Top = 200
    Width = 121
    Caption = 'Buchen'
    Glyph.Data = {
      BA040000424DBA04000000000000360000002800000011000000110000000100
      2000000000008404000064000000640000000000000000000000984750009847
      5000984750009847500098475000984750009847500098475000984750009847
      5000984750009847500098475000984750009847500098475000984750009847
      5000000000FF000000FF000000FF000000FF000000FF000000FF984750009847
      5000984750009847500098475000984750009847500098475000984750009847
      500098475000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF9847
      5000984750009847500098475000984750009847500098475000984750009847
      50009847500098475000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00FF984750009847500098475000984750009847500098475000984750009847
      5000984750009847500098475000000000FF000000FF000000FF000000FF0000
      00FF000000FF9847500098475000984750009847500098475000984750009847
      500098475000984750009847500098475000000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF98475000984750009847500098475000984750009847
      50009847500098475000984750009847500098475000000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF984750009847500098475000984750009847
      5000984750009847500098475000984750009847500098475000000000FF0000
      00FF000000FF000000FF000000FF000000FF9847500098475000BF0000FF9847
      5000000000FF000000FF000000FF000000FF000000FF000000FF984750009847
      5000984750009847500098475000984750009847500098475000BF0000FFBF00
      00FF98475000000000FFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFF000000FF9847
      5000984750009847500098475000984750009847500098475000BF0000FFBF00
      00FFBF0000FFBF0000FF000000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF0000
      00FF984750009847500098475000984750009847500098475000984750009847
      5000BF0000FFBF0000FF98475000000000FF000000FF000000FF000000FF0000
      00FF000000FF98475000000000FF000000FF000000FF000000FF000000FF0000
      00FF9847500098475000BF0000FF984750009847500098475000984750009847
      5000984750009847500098475000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FF9847500098475000984750009847500098475000984750009847
      500098475000984750009847500098475000000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF98475000984750009847500098475000984750009847
      50009847500098475000984750009847500098475000000000FF000000FF0000
      00FF000000FF000000FF000000FF984750009847500098475000984750009847
      5000984750009847500098475000984750009847500098475000984750009847
      5000984750009847500098475000984750009847500098475000984750009847
      5000984750009847500098475000984750009847500098475000984750009847
      5000984750009847500098475000984750009847500098475000984750009847
      500098475000984750009847500098475000984750009847500098475000
    }
    OnClick = BuchenBtnClick
    TabOrder = 4
  end
  object BuDatum: TRxDBDateEdit
    Left = 336
    Height = 21
    Top = 72
    Width = 113
    ButtonWidth = 23
    DialogTitle = 'Select a Date'
    Enabled = False
    MaxLength = 10
    PasswordChar = #0
    PopupColor = clWindow
    TabOrder = 1
    Text = '  .  .    '
    YearDigits = dyFour
    OnChange = GKontoChange
    DataField = 'BDATUM'
    DataSource = DataSource1
  end
  object DBMemo1: TDBMemo
    Left = 104
    Height = 90
    Top = 104
    Width = 345
    DataField = 'BTXT'
    DataSource = DataSource1
    OnChange = GKontoChange
    TabOrder = 2
  end
  object GKonto: TDBEdit
    Left = 104
    Height = 21
    Top = 40
    Width = 145
    DataField = 'GKONTO'
    DataSource = DataSource1
    MaxLength = 0
    TabOrder = 3
    OnChange = GKontoChange
  end
  object Label1: TLabel
    Left = 8
    Height = 13
    Top = 16
    Width = 83
    Caption = 'Art der Buchung :'
    ParentColor = False
  end
  object Label2: TLabel
    Left = 8
    Height = 13
    Top = 44
    Width = 65
    Caption = 'Gegenkonto :'
    ParentColor = False
  end
  object BelNumEdi: TDBEdit
    Left = 336
    Height = 21
    Top = 12
    Width = 113
    DataField = 'BELEGNUM'
    DataSource = DataSource1
    MaxLength = 0
    TabOrder = 5
    OnChange = GKontoChange
  end
  object Betrag: TEuroDMEdit
    Left = 336
    Height = 21
    Top = 40
    Width = 113
    DataField = 'ZU_ABGANG'
    DataSource = DataSource1
    ParentBiDiMode = False
    TabOrder = 6
    OnChange = GKontoChange
    Kurs = 1.95583
    SaveWaehrung = DM
    ViewWaehrung = Euro
  end
  object ArtBuchCB: TComboBox
    Left = 104
    Height = 21
    Top = 12
    Width = 145
    Color = clWindow
    ItemHeight = 13
    Items.Strings = (
      'Privatentnahme'
      'Privateinlage'
      'Transfer Kasse -> Bank'
      'Transfer Bank -> Kasse'
      ''
    )
    OnChange = ArtBuchCBChange
    Style = csDropDownList
    TabOrder = 7
  end
  object Label3: TLabel
    Left = 296
    Height = 13
    Top = 44
    Width = 37
    Alignment = taRightJustify
    Caption = 'Betrag :'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 250
    Height = 13
    Top = 76
    Width = 83
    Alignment = taRightJustify
    Caption = 'Buchungsdatum :'
    ParentColor = False
  end
  object Label5: TLabel
    Left = 8
    Height = 13
    Top = 104
    Width = 71
    Caption = 'Buchungstext :'
    ParentColor = False
  end
  object Label6: TLabel
    Left = 263
    Height = 13
    Top = 16
    Width = 70
    Alignment = taRightJustify
    Caption = 'Belegnummer :'
    ParentColor = False
  end
  object DataSource1: TDataSource
    Left = 24
    Top = 184
  end
end
