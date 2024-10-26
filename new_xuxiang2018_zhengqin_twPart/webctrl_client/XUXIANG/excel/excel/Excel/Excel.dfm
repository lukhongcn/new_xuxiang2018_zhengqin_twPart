object Form1: TForm1
  Left = 113
  Top = 185
  Width = 784
  Height = 448
  Caption = #29992'Delphi'#23558#25968#25454#23548#20837#21040'Excel'#24182#25511#21046'Excel'
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 40
    Top = 8
    Width = 65
    Height = 22
    Caption = #23548#20837'Excel'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 296
    Top = 34
    Width = 479
    Height = 385
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_name'
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#21517#31216
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_gg'
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#35268#26684
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_dw'
        Title.Alignment = taCenter
        Title.Caption = #21333#20301
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_quality'
        Title.Alignment = taCenter
        Title.Caption = #25968#37327
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_bz'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 60
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = -1
    Top = 34
    Width = 291
    Height = 385
    DataSource = DataSource2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dk_name'
        Title.Alignment = taCenter
        Title.Caption = #22320#22359#21517#31216
        Width = 190
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dk_quality'
        Title.Alignment = taCenter
        Title.Caption = #22320#22359#38754#31215
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 544
    Top = 256
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 544
    Top = 208
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 344
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = ADOTable1
    Left = 184
    Top = 128
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableName = 'dk_info'
    Left = 184
    Top = 176
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 488
    Top = 304
  end
end
