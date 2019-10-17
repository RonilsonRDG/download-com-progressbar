object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Download com ProgressBar'
  ClientHeight = 190
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object label1: TLabel
    Left = 143
    Top = 140
    Width = 109
    Height = 13
    Caption = 'Aguardando Download'
  end
  object edtlinkarquivo: TLabeledEdit
    Left = 16
    Top = 24
    Width = 377
    Height = 21
    EditLabel.Width = 146
    EditLabel.Height = 13
    EditLabel.Caption = 'Link do arquivo para download'
    TabOrder = 0
  end
  object btndownload: TButton
    Left = 95
    Top = 95
    Width = 202
    Height = 38
    Caption = 'DOWNLOAD'
    TabOrder = 1
    OnClick = btndownloadClick
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 164
    Width = 377
    Height = 17
    TabOrder = 2
  end
  object edtnomearquivo: TLabeledEdit
    Left = 16
    Top = 68
    Width = 377
    Height = 21
    EditLabel.Width = 141
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome do Arquivo + Extens'#227'o'
    TabOrder = 3
  end
  object IdHTTP1: TIdHTTP
    OnWork = IdHTTP1Work
    OnWorkBegin = IdHTTP1WorkBegin
    OnWorkEnd = IdHTTP1WorkEnd
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = True
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 344
    Top = 108
  end
end
