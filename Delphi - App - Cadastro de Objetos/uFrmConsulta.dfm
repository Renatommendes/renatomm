object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 279
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 488
    Top = 48
    Width = 81
    Height = 22
    Caption = 'Buscar speed'
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 104
    Width = 369
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnBuscar: TButton
    Left = 488
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
  end
  object edtBuscar: TEdit
    Left = 209
    Top = 8
    Width = 273
    Height = 21
    TabOrder = 2
    OnChange = edtBuscarChange
    OnKeyPress = edtBuscarKeyPress
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 8
    Width = 81
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'Matricula'
      'Nome')
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQuery1
    Left = 448
    Top = 128
  end
end
