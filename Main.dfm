object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Custom Connection String Generator'
  ClientHeight = 214
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  TextHeight = 15
  object cmbConnections: TComboBox
    Left = 40
    Top = 80
    Width = 421
    Height = 23
    ItemIndex = 0
    TabOrder = 0
    Text = 'MS Sql'
    Items.Strings = (
      'MS Sql'
      'Sqlite'
      'Mysql'
      'PostgreSql')
  end
  object btnGenerate: TButton
    Left = 467
    Top = 79
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = btnGenerateClick
  end
  object edtServer: TLabeledEdit
    Left = 40
    Top = 51
    Width = 121
    Height = 23
    EditLabel.Width = 49
    EditLabel.Height = 15
    EditLabel.Caption = 'edtServer'
    TabOrder = 2
    Text = 'HOMEPC'
  end
  object edtDatabase: TLabeledEdit
    Left = 167
    Top = 51
    Width = 121
    Height = 23
    EditLabel.Width = 67
    EditLabel.Height = 15
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 3
    Text = 'master'
  end
  object edtUsername: TLabeledEdit
    Left = 294
    Top = 50
    Width = 121
    Height = 23
    EditLabel.Width = 67
    EditLabel.Height = 15
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 4
    Text = 'sa'
  end
  object edtPassword: TLabeledEdit
    Left = 421
    Top = 50
    Width = 121
    Height = 23
    EditLabel.Width = 67
    EditLabel.Height = 15
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 5
    Text = '12345678'
  end
  object mmConnectionString: TMemo
    Left = 40
    Top = 109
    Width = 502
    Height = 60
    TabOrder = 6
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 185
    Width = 551
    Height = 29
    Panels = <
      item
        Width = 200
      end>
    ExplicitTop = 175
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    Left = 304
    Top = 120
  end
end
