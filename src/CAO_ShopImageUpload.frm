object FileUpload: TFileUpload
  Left = 86
  Height = 136
  Top = 85
  Width = 347
  BorderStyle = bsDialog
  Caption = 'FileUpload'
  ClientHeight = 136
  ClientWidth = 347
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Quality = fqAntialiased
  OnCloseQuery = FormCloseQuery
  Position = poMainFormCenter
  LCLVersion = '7.2'
  object FileNameEdit1: TFileNameEdit
    Left = 8
    Height = 21
    Top = 16
    Width = 328
    DialogKind = dkPictureOpen
    DialogTitle = 'Bild auswählen'
    DialogOptions = [ofHideReadOnly]
    Filter = 'Bilder|*.jpg;*.gif|All files (*.*)|*.*'
    FilterIndex = 1
    HideDirectories = False
    ButtonWidth = 23
    NumGlyphs = 1
    BorderStyle = bsSingle
    MaxLength = 0
    TabOrder = 0
    OnChange = FileNameEdit1Change
  end
  object UploadBtn: TBitBtn
    Left = 96
    Height = 30
    Top = 88
    Width = 144
    Caption = 'Upload'
    OnClick = UploadBtnClick
    TabOrder = 1
  end
  object Label1: TLabel
    Left = 8
    Height = 13
    Top = 48
    Width = 304
    AutoSize = False
    ParentColor = False
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 16
    Top = 56
  end
end
