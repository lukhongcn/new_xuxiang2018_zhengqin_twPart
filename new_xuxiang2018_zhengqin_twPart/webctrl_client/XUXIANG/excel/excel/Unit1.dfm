object Form1: TForm1
  Left = 190
  Top = 106
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonSmall: TButton
    Left = 80
    Top = 32
    Width = 145
    Height = 25
    Caption = 'Small Module Class'
    TabOrder = 0
    OnClick = ButtonSmallClick
  end
  object ButtonMiddle: TButton
    Left = 384
    Top = 32
    Width = 145
    Height = 25
    Caption = 'Middle Module Class'
    TabOrder = 1
    OnClick = ButtonMiddleClick
  end
end
