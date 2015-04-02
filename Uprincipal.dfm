object Form1: TForm1
  Left = 165
  Top = 124
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 451
  ClientWidth = 1037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object img: TImage
    Left = 8
    Top = 8
    Width = 281
    Height = 305
    Stretch = True
  end
  object img2: TImage
    Left = 735
    Top = 8
    Width = 281
    Height = 305
    Stretch = True
  end
  object memo: TMemo
    Left = 295
    Top = 8
    Width = 434
    Height = 305
    TabOrder = 0
  end
  object btEncode: TButton
    Left = 8
    Top = 319
    Width = 75
    Height = 25
    Caption = 'encode'
    TabOrder = 1
    OnClick = btEncodeClick
  end
  object btDecode: TButton
    Left = 111
    Top = 319
    Width = 75
    Height = 25
    Caption = 'decode'
    TabOrder = 2
    OnClick = btDecodeClick
  end
  object opImage: TOpenPictureDialog
    Filter = '*.jpg'
    Left = 56
    Top = 368
  end
end
