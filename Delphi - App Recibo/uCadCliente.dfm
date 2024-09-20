inherited FrmCadCliente: TFrmCadCliente
  Caption = 'Cadastro Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Caption = 'Cadastro de Cliente'
  end
  inherited Panel2: TPanel
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 993
      Height = 490
      ActivePage = tbsCadCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tbsCadCliente: TTabSheet
        Caption = 'Cadastro Cliente'
        object Label1: TLabel
          Left = 45
          Top = 311
          Width = 36
          Height = 15
          Caption = 'Nome:'
        end
        object Label2: TLabel
          Left = 13
          Top = 341
          Width = 68
          Height = 15
          Caption = 'Raz'#227'o Social:'
        end
        object Label3: TLabel
          Left = 49
          Top = 369
          Width = 32
          Height = 15
          Caption = 'RG/IE:'
        end
        object Label4: TLabel
          Left = 24
          Top = 401
          Width = 57
          Height = 15
          Caption = 'CPF/CNPJ:'
        end
        object Label6: TLabel
          Left = 44
          Top = 430
          Width = 37
          Height = 15
          Caption = 'E-mail:'
        end
        object Label7: TLabel
          Left = 520
          Top = 254
          Width = 49
          Height = 15
          Caption = 'Telefone:'
        end
        object Label8: TLabel
          Left = 529
          Top = 286
          Width = 40
          Height = 15
          Caption = 'Celular:'
        end
        object Label9: TLabel
          Left = 505
          Top = 318
          Width = 65
          Height = 15
          Caption = 'Logradouro:'
        end
        object Label10: TLabel
          Left = 535
          Top = 382
          Width = 34
          Height = 15
          Caption = 'Bairro:'
        end
        object Label11: TLabel
          Left = 860
          Top = 320
          Width = 47
          Height = 15
          Caption = 'Numero:'
        end
        object Label12: TLabel
          Left = 529
          Top = 411
          Width = 40
          Height = 15
          Caption = 'Cidade:'
        end
        object Label13: TLabel
          Left = 869
          Top = 411
          Width = 38
          Height = 15
          Caption = 'Estado:'
        end
        object Label14: TLabel
          Left = 504
          Top = 438
          Width = 65
          Height = 15
          Caption = 'Observa'#231#227'o:'
        end
        object Label15: TLabel
          Left = 490
          Top = 352
          Width = 80
          Height = 15
          Caption = 'Complemento:'
        end
        object Label5: TLabel
          Left = -1
          Top = 258
          Width = 82
          Height = 15
          Caption = 'Tipo de Pessoa:'
        end
        object Label16: TLabel
          Left = 28
          Top = 30
          Width = 53
          Height = 15
          Caption = 'Pesquisar:'
        end
        object Label17: TLabel
          Left = 26
          Top = 3
          Width = 290
          Height = 15
          Caption = 'Para Editar, clique em um dos cadastros da lista abaixo!'
        end
        object Label18: TLabel
          Left = 13
          Top = 284
          Width = 68
          Height = 15
          Caption = 'Cod. Cliente:'
        end
        object edtNomeC: TEdit
          Left = 84
          Top = 308
          Width = 384
          Height = 23
          TabOrder = 0
        end
        object edtNumeroC: TEdit
          Left = 909
          Top = 317
          Width = 38
          Height = 23
          TabOrder = 1
        end
        object edtCidadeC: TEdit
          Left = 572
          Top = 408
          Width = 284
          Height = 23
          TabOrder = 2
        end
        object edtEstadoC: TEdit
          Left = 909
          Top = 408
          Width = 62
          Height = 23
          TabOrder = 3
        end
        object edtObservacaoC: TEdit
          Left = 572
          Top = 435
          Width = 284
          Height = 23
          TabOrder = 4
        end
        object edtComplementoC: TEdit
          Left = 572
          Top = 349
          Width = 284
          Height = 23
          TabOrder = 5
        end
        object edtRazaoSocialC: TEdit
          Left = 84
          Top = 338
          Width = 384
          Height = 23
          TabOrder = 6
        end
        object edtEmailC: TEdit
          Left = 84
          Top = 427
          Width = 284
          Height = 23
          TabOrder = 7
          OnExit = edtEmailCExit
        end
        object edtTelefoneC: TEdit
          Left = 572
          Top = 251
          Width = 284
          Height = 23
          TabOrder = 8
        end
        object edtCelularC: TEdit
          Left = 572
          Top = 283
          Width = 284
          Height = 23
          TabOrder = 9
        end
        object edtLogradouroC: TEdit
          Left = 572
          Top = 315
          Width = 284
          Height = 23
          TabOrder = 10
        end
        object edtBairroC: TEdit
          Left = 572
          Top = 379
          Width = 284
          Height = 23
          TabOrder = 11
        end
        object DateTimePicker1: TDateTimePicker
          Left = 371
          Top = 240
          Width = 97
          Height = 23
          Date = 44683.621850925930000000
          Time = 44683.621850925930000000
          TabOrder = 12
        end
        object RadioGroup1: TRadioGroup
          Left = 84
          Top = 242
          Width = 122
          Height = 36
          Columns = 2
          Items.Strings = (
            'Fisica'
            'Juridica')
          TabOrder = 13
          OnClick = RadioGroup1Click
        end
        object GridCliente: TDBGrid
          Left = 1
          Top = 53
          Width = 979
          Height = 174
          DataSource = DM.dsCliente
          TabOrder = 14
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = GridClienteCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TCLIENTE_DATACADASTRO'
              Title.Caption = 'Data de Cadastro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_CODIGO'
              Title.Caption = 'Cod. Cliente'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_NOME'
              Title.Caption = 'Cliente'
              Width = 440
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_RAZAOSOCIAL'
              Title.Caption = 'Raz'#227'o Social'
              Width = 257
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_RG_IE'
              Title.Caption = 'RG/IE'
              Width = 164
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_CPF_CNPJ'
              Title.Caption = 'CNPJ/CPF'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_TIPOPESSOA'
              Title.Caption = 'Tipo de Cliente(PJ/PF)'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_EMAIL'
              Title.Caption = 'E-mail'
              Width = 217
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_TELEFONE'
              Title.Caption = 'Telefone'
              Width = 141
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_CELULAR'
              Title.Caption = 'Celular'
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_LOGRADOURO'
              Title.Caption = 'Endere'#231'o'
              Width = 346
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_NUM'
              Title.Caption = 'Numero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_COMPLEMENTO'
              Title.Caption = 'Complemento'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_BAIRRO'
              Title.Caption = 'Bairro'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_CIDADE'
              Title.Caption = 'Cidade'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_ESTADO'
              Title.Caption = 'Estado'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TCLIENTE_OBS'
              Title.Caption = 'Observa'#231#227'o'
              Width = 64
              Visible = True
            end>
        end
        object edtPesquisarC: TEdit
          Left = 84
          Top = 27
          Width = 413
          Height = 23
          TabOrder = 15
          OnChange = edtPesquisarCChange
        end
        object edtCodClienteC: TEdit
          Left = 84
          Top = 281
          Width = 284
          Height = 23
          TabOrder = 16
        end
      end
    end
    object btnPesquisar: TButton
      Left = 28
      Top = 496
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object btnNovo: TButton
      Left = 120
      Top = 496
      Width = 75
      Height = 25
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 383
      Top = 496
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnEditar: TButton
      Left = 209
      Top = 496
      Width = 75
      Height = 25
      Caption = 'Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnEditarClick
    end
    object btnCancelar: TButton
      Left = 464
      Top = 496
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnCancelarClick
    end
  end
  object edtRgIeC: TMaskEdit
    Left = 88
    Top = 441
    Width = 384
    Height = 23
    EditMask = '00.000.000-0;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 12
    ParentFont = False
    TabOrder = 2
    Text = ''
  end
  object edtCpfCnpjC: TMaskEdit
    Left = 88
    Top = 470
    Width = 384
    Height = 23
    EditMask = '00.000.000-0;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 12
    ParentFont = False
    TabOrder = 3
    Text = ''
    OnExit = edtCpfCnpjCExit
  end
end
