object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Calculo de Indice Corporal'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 105
    Height = 25
    Caption = 'Sua Altura:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 92
    Height = 25
    Caption = 'Seu Peso:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 111
    Width = 93
    Height = 25
    Caption = 'Seu Sexo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnResultados: TButton
    Left = 96
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Resultado'
    TabOrder = 0
    OnClick = BtnResultadosClick
  end
  object BtnRequisitos: TButton
    Left = 280
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Ver Requisitos'
    TabOrder = 1
    OnClick = BtnRequisitosClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 8
    Width = 449
    Height = 41
    Caption = 'Calculadora de Indice de Massa Corporal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EdtAltura: TEdit
    Left = 144
    Top = 55
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object EdtPeso: TEdit
    Left = 144
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object CmbSexo: TComboBox
    Left = 144
    Top = 115
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    Items.Strings = (
      'M'
      'F')
  end
end