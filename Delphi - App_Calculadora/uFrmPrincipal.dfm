object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Calculadora'
  ClientHeight = 420
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 65
    Align = alTop
    TabOrder = 0
    object lblValor: TLabel
      Left = 1
      Top = 1
      Width = 387
      Height = 63
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlBottom
      ExplicitWidth = 12
      ExplicitHeight = 45
    end
  end
  object Panel2: TPanel
    Left = 296
    Top = 65
    Width = 93
    Height = 355
    Align = alRight
    TabOrder = 1
    DesignSize = (
      93
      355)
    object btnsoma: TButton
      Left = 1
      Top = 3
      Width = 92
      Height = 62
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnsomaClick
    end
    object btnsubtrair: TButton
      Left = 1
      Top = 65
      Width = 92
      Height = 62
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnsubtrairClick
    end
    object btnMultiplica: TButton
      Left = 1
      Top = 127
      Width = 92
      Height = 62
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnMultiplicaClick
    end
    object btnDividir: TButton
      Left = 1
      Top = 189
      Width = 92
      Height = 62
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnDividirClick
    end
    object btnIgual: TButton
      Left = 1
      Top = 251
      Width = 92
      Height = 102
      Anchors = [akLeft, akTop, akBottom]
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnIgualClick
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 65
    Width = 296
    Height = 355
    Align = alClient
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 89
      Width = 294
      Height = 88
      Align = alTop
      AutoSize = True
      TabOrder = 0
      DesignSize = (
        294
        88)
      object btn05: TButton
        Left = 99
        Top = 1
        Width = 98
        Height = 86
        Anchors = [akLeft, akRight]
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btn05Click
      end
      object btn04: TButton
        Left = 1
        Top = 1
        Width = 98
        Height = 86
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btn04Click
      end
      object btn06: TButton
        Left = 197
        Top = 1
        Width = 98
        Height = 86
        Anchors = [akRight]
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn06Click
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 294
      Height = 88
      Align = alTop
      TabOrder = 1
      DesignSize = (
        294
        88)
      object btn01: TButton
        Left = 1
        Top = 2
        Width = 98
        Height = 86
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btn01Click
      end
      object btn02: TButton
        Left = 99
        Top = 2
        Width = 98
        Height = 86
        Anchors = [akLeft, akRight]
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btn02Click
      end
      object btn03: TButton
        Left = 197
        Top = 2
        Width = 98
        Height = 86
        Anchors = [akRight]
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn03Click
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 177
      Width = 294
      Height = 86
      Align = alTop
      TabOrder = 2
      DesignSize = (
        294
        86)
      object btn08: TButton
        Left = 99
        Top = 1
        Width = 98
        Height = 86
        Anchors = [akLeft, akRight]
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btn08Click
      end
      object btn07: TButton
        Left = 1
        Top = 1
        Width = 98
        Height = 86
        Caption = '7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btn07Click
      end
      object btn09: TButton
        Left = 197
        Top = 1
        Width = 98
        Height = 86
        Anchors = [akRight]
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn09Click
      end
    end
    object Panel8: TPanel
      Left = 1
      Top = 263
      Width = 294
      Height = 90
      Align = alTop
      Anchors = [akTop, akBottom]
      TabOrder = 3
      DesignSize = (
        294
        90)
      object btnVirgula: TButton
        Left = 197
        Top = 1
        Width = 98
        Height = 86
        Anchors = [akTop, akRight, akBottom]
        Caption = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnVirgulaClick
      end
      object Button1: TButton
        Left = 1
        Top = 1
        Width = 98
        Height = 86
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object btn00: TButton
        Left = 99
        Top = 1
        Width = 98
        Height = 86
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn00Click
      end
    end
  end
end
