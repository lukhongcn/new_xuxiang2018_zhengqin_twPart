object frmOptions: TfrmOptions
  Left = 297
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Setting...'
  ClientHeight = 196
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 6
    Top = 8
    Width = 241
    Height = 149
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      object GroupBox1: TGroupBox
        Left = 4
        Top = 2
        Width = 221
        Height = 111
        Caption = 'Work Time Update Range'
        TabOrder = 0
        object Label1: TLabel
          Left = 140
          Top = 26
          Width = 24
          Height = 13
          Caption = 'Days'
        end
        object Label2: TLabel
          Left = 96
          Top = 59
          Width = 23
          Height = 13
          Caption = 'From'
        end
        object Label3: TLabel
          Left = 96
          Top = 84
          Width = 13
          Height = 13
          Caption = 'To'
        end
        object rbByRange: TRadioButton
          Tag = 1
          Left = 10
          Top = 55
          Width = 71
          Height = 17
          Caption = 'By range'
          TabOrder = 0
          OnClick = rbByDaysClick
        end
        object rbByDays: TRadioButton
          Left = 10
          Top = 22
          Width = 63
          Height = 17
          Caption = 'By days'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rbByDaysClick
        end
        object cbDays: TComboBox
          Left = 96
          Top = 22
          Width = 41
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 6
          TabOrder = 2
          Text = '7'
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9')
        end
        object dtFrom: TDateTimePicker
          Left = 124
          Top = 55
          Width = 81
          Height = 21
          CalAlignment = dtaLeft
          Date = 38125.6203175579
          Time = 38125.6203175579
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
        end
        object dtTo: TDateTimePicker
          Left = 124
          Top = 81
          Width = 81
          Height = 21
          CalAlignment = dtaLeft
          Date = 38125.6203175579
          Time = 38125.6203175579
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 4
        end
      end
    end
  end
  object Button1: TButton
    Left = 82
    Top = 163
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 172
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
