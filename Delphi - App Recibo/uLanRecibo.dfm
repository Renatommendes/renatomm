inherited FrmLanRecibo: TFrmLanRecibo
  Caption = 'Lan'#231'amento de Recibo'
  ClientHeight = 672
  ClientWidth = 1090
  OnCreate = nil
  ExplicitLeft = -319
  ExplicitTop = -221
  ExplicitWidth = 1106
  ExplicitHeight = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1090
    Caption = 'Lan'#231'amento de Recibo'
    ExplicitWidth = 1090
  end
  inherited Panel2: TPanel
    Width = 1090
    Height = 623
    ExplicitWidth = 1090
    ExplicitHeight = 623
    object PageControl1: TPageControl
      Left = 0
      Top = 24
      Width = 1090
      Height = 539
      ActivePage = tbsLanRecibo
      TabOrder = 0
      object tbsPesquisaRecibo: TTabSheet
        Caption = 'Pesquisar Recibo'
        ImageIndex = 1
        ExplicitWidth = 1010
        object Label1: TLabel
          Left = 3
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Pesquisar:'
        end
        object Label12: TLabel
          Left = 479
          Top = 2
          Width = 99
          Height = 13
          Caption = 'Pesquisar por data:'
        end
        object Label24: TLabel
          Left = 479
          Top = 24
          Width = 33
          Height = 13
          Caption = 'Inicial:'
        end
        object Label25: TLabel
          Left = 634
          Top = 24
          Width = 28
          Height = 13
          Caption = 'Final:'
        end
        object Label29: TLabel
          Left = 616
          Top = 335
          Width = 182
          Height = 13
          Caption = 'Valor Total do Recibo Selecionado: '
        end
        object lblTotalDespesaTBSPesqRecibo: TLabel
          Left = 805
          Top = 335
          Width = 100
          Height = 13
        end
        object edtPesquisarRecibo: TEdit
          Left = 61
          Top = 21
          Width = 391
          Height = 21
          TabOrder = 0
          OnChange = edtPesquisarReciboChange
        end
        object btnPesquisarTbsRecibo: TButton
          Left = 788
          Top = 17
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarTbsReciboClick
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 48
          Width = 1079
          Height = 265
          DataSource = DM.dsPesquisarRecibo2
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGrid2CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TRECIBO_DATAREFERENCIA'
              Title.Caption = 'M'#234's/Ano Refer'#234'ncia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRECIBO_CODIGO'
              Title.Caption = 'Cod. Recibo'
              Width = 64
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
              Width = 276
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRECIBO_TIPO_DESPESA'
              Title.Caption = 'Tipo Recibo'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRECIBO_VL_TOTAL'
              Title.Caption = 'Valor Total'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRECIBO_CODIGO_1'
              Title.Caption = 'TRC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TTPDESPESA_CODIGO'
              Title.Caption = 'TTPDC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TTPDESPESA_DESCR'
              Title.Caption = 'Despesa'
              Width = 139
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRECIBOITENS_VL'
              Title.Caption = 'Valor Despesa'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRECIBOITENS_CODIGO'
              Title.Caption = 'TRIC'
              Visible = True
            end>
        end
        object DateTimePicker4: TDateTimePicker
          Left = 518
          Top = 21
          Width = 105
          Height = 21
          Date = 44682.604490717590000000
          Format = 'MM/yyyy'
          Time = 44682.604490717590000000
          DateMode = dmUpDown
          TabOrder = 3
        end
        object DateTimePicker5: TDateTimePicker
          Left = 668
          Top = 21
          Width = 105
          Height = 21
          Date = 44711.604490717590000000
          Format = 'MM/yyyy'
          Time = 44711.604490717590000000
          DateMode = dmUpDown
          TabOrder = 4
        end
      end
      object tbsLanRecibo: TTabSheet
        Caption = 'Lan'#231'amento de Recibo'
        ExplicitWidth = 1010
        object BoxItensRecibo: TGroupBox
          Left = -4
          Top = 355
          Width = 321
          Height = 160
          Caption = 'Box Itens do Recibo'
          TabOrder = 0
          object Label8: TLabel
            Left = 7
            Top = 102
            Width = 149
            Height = 13
            Caption = 'Selecione o Tipo de Despesa:'
          end
          object Label9: TLabel
            Left = 126
            Top = 130
            Width = 30
            Height = 13
            Caption = 'Valor:'
          end
          object Label20: TLabel
            Left = 83
            Top = 75
            Width = 79
            Height = 13
            Caption = 'Codigo Recibo:'
          end
          object Label21: TLabel
            Left = 55
            Top = 49
            Width = 109
            Height = 13
            Caption = 'Codigo Tipo Despesa'
          end
          object Label23: TLabel
            Left = 43
            Top = 22
            Width = 116
            Height = 13
            Caption = 'Codigo  TRECIBOITENS'
          end
          object edtValor: TEdit
            Left = 161
            Top = 127
            Width = 151
            Height = 21
            TabOrder = 0
          end
          object DBLookupComboBoxH: TDBLookupComboBox
            Left = 161
            Top = 100
            Width = 145
            Height = 21
            DataField = 'TTPDESPESA_CODIGO'
            DataSource = DM.dsRecItens
            KeyField = 'TTPDESPESA_CODIGO'
            ListField = 'TTPDESPESA_DESCR'
            ListSource = DM.dsLookupH
            TabOrder = 1
            OnExit = DBLookupComboBoxHExit
          end
          object btnNovoItemRecibo: TButton
            Left = 88
            Top = 164
            Width = 101
            Height = 25
            Caption = 'Novo Item Recibo'
            TabOrder = 2
            OnClick = btnNovoItemReciboClick
          end
          object GridItemDespesa: TDBGrid
            Left = 392
            Top = 40
            Width = 257
            Height = 180
            DataSource = DM.dsRecItens
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnCellClick = GridItemDespesaCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'TRECIBO_CODIGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TTPDESPESA_CODIGO'
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TTPDESPESA_DESCR'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBOITENS_VL'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBOITENS_CODIGO'
                Width = 64
                Visible = True
              end>
          end
          object edtCodRecibo: TEdit
            Left = 161
            Top = 72
            Width = 145
            Height = 21
            TabOrder = 4
          end
          object edtCodTPDespesa: TEdit
            Left = 161
            Top = 46
            Width = 145
            Height = 21
            TabOrder = 5
          end
          object edtCodReciboItens: TEdit
            Left = 161
            Top = 19
            Width = 145
            Height = 21
            TabOrder = 6
          end
          object btnEditarItensRecibo: TButton
            Left = 195
            Top = 164
            Width = 111
            Height = 25
            Caption = 'Editar Itens Recibo'
            TabOrder = 7
            OnClick = btnEditarItensReciboClick
          end
          object btnSalvarItensRecibo: TButton
            Left = 88
            Top = 195
            Width = 101
            Height = 25
            Caption = 'Salvar Itens Recibo'
            TabOrder = 8
            OnClick = btnSalvarItensReciboClick
          end
          object btnCancelarItensRecibo: TButton
            Left = 195
            Top = 195
            Width = 111
            Height = 25
            Caption = 'Cancelar Itens Recibo'
            TabOrder = 9
            OnClick = btnCancelarItensReciboClick
          end
          object DBLookupComboBoxI: TDBLookupComboBox
            Left = 161
            Top = 100
            Width = 151
            Height = 21
            DataField = 'TTPDESPESA_CODIGO'
            DataSource = DM.dsRecItens
            KeyField = 'TTPDESPESA_CODIGO'
            ListField = 'TTPDESPESA_DESCR'
            ListSource = DM.dsLookupI
            TabOrder = 10
            OnExit = DBLookupComboBoxHExit
          end
        end
        object BoxRecibo: TGroupBox
          Left = -4
          Top = 268
          Width = 321
          Height = 184
          Caption = 'Box Recibo'
          TabOrder = 1
          object Label4: TLabel
            Left = 84
            Top = 48
            Width = 72
            Height = 13
            Caption = 'Nome Cliente:'
          end
          object Label5: TLabel
            Left = 157
            Top = 48
            Width = 3
            Height = 13
            Color = clInfoBk
            ParentColor = False
          end
          object Label3: TLabel
            Left = 157
            Top = 26
            Width = 3
            Height = 13
            Color = clInfoBk
            ParentColor = False
          end
          object Label2: TLabel
            Left = 76
            Top = 26
            Width = 80
            Height = 13
            Caption = 'Codigo Cliente:'
          end
          object Label22: TLabel
            Left = 77
            Top = 74
            Width = 79
            Height = 13
            Caption = 'Codigo Recibo:'
          end
          object Label7: TLabel
            Left = 34
            Top = 103
            Width = 122
            Height = 13
            Caption = 'M'#234's/Ano de Refer'#234'ncia:'
          end
          object Label6: TLabel
            Left = 15
            Top = 135
            Width = 141
            Height = 13
            Caption = 'Selecione o Tipo de Recibo:'
          end
          object Label10: TLabel
            Left = 98
            Top = 160
            Width = 58
            Height = 13
            Caption = 'Valor Total:'
          end
          object edtCodRecibo2: TEdit
            Left = 161
            Top = 71
            Width = 152
            Height = 21
            TabOrder = 0
          end
          object DateTimePicker1: TDateTimePicker
            Left = 161
            Top = 98
            Width = 151
            Height = 21
            Date = 44682.555405185190000000
            Format = 'MM/yyyy'
            Time = 44682.555405185190000000
            DateMode = dmUpDown
            TabOrder = 1
          end
          object RadioGroup2: TRadioGroup
            Left = 161
            Top = 122
            Width = 153
            Height = 31
            Columns = 2
            Items.Strings = (
              'Honor'#225'rio'
              'Imposto')
            TabOrder = 2
            OnClick = RadioGroup2Click
          end
          object edtValorTotal: TEdit
            Left = 161
            Top = 157
            Width = 152
            Height = 21
            TabOrder = 3
          end
          object btnNovoRecibo: TButton
            Left = 114
            Top = 185
            Width = 81
            Height = 25
            Caption = 'Novo RECIBO'
            TabOrder = 4
            OnClick = btnNovoReciboClick
          end
          object btnEditarRecibo: TButton
            Left = 201
            Top = 185
            Width = 89
            Height = 25
            Caption = 'Editar Recibo'
            TabOrder = 5
            OnClick = btnEditarReciboClick
          end
          object btnSalvarRecibo: TButton
            Left = 114
            Top = 216
            Width = 81
            Height = 25
            Caption = 'Salvar Recibo'
            TabOrder = 6
            OnClick = btnSalvarReciboClick
          end
          object btnCancelarRecibo: TButton
            Left = 201
            Top = 216
            Width = 89
            Height = 25
            Caption = 'Cancelar Recibo'
            TabOrder = 7
            OnClick = btnCancelarReciboClick
          end
        end
        object BoxPesquisarRecibo: TGroupBox
          Left = -1
          Top = -2
          Width = 1071
          Height = 168
          Caption = 'Box Pesquisar Recibo'
          TabOrder = 2
          object Label19: TLabel
            Left = 16
            Top = 37
            Width = 90
            Height = 13
            Caption = 'Pesquisar Recibo:'
          end
          object Label17: TLabel
            Left = 14
            Top = 17
            Width = 209
            Height = 13
            Caption = 'Selecione abaixo um Recibo para edi'#231#227'o!'
          end
          object Label27: TLabel
            Left = 559
            Top = 35
            Width = 33
            Height = 13
            Caption = 'Inicial:'
          end
          object Label28: TLabel
            Left = 723
            Top = 35
            Width = 28
            Height = 13
            Caption = 'Final:'
          end
          object Label26: TLabel
            Left = 457
            Top = 13
            Width = 138
            Height = 13
            Caption = 'Pesquisar Recibo por Data:'
          end
          object edtPesquisarReciboEditar: TEdit
            Left = 107
            Top = 34
            Width = 330
            Height = 21
            TabOrder = 0
            OnChange = edtPesquisarReciboEditarChange
          end
          object GridReciboEditar: TDBGrid
            Left = 5
            Top = 57
            Width = 1063
            Height = 108
            DataSource = DM.dsPesquisarRecibo2
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnCellClick = GridReciboEditarCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'TRECIBO_DATAREFERENCIA'
                Title.Caption = 'M'#234's/Ano Refer'#234'ncia'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBO_CODIGO'
                Title.Caption = 'Cod. Recibo'
                Width = 64
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
                Width = 276
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBO_TIPO_DESPESA'
                Title.Caption = 'Tipo Recibo'
                Width = 83
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TTPDESPESA_DESCR'
                Title.Caption = 'Despesa'
                Width = 139
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBOITENS_VL'
                Title.Caption = 'Valor Despesa'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBO_VL_TOTAL'
                Title.Caption = 'Valor Total'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBO_CODIGO_1'
                Title.Caption = 'TRC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TTPDESPESA_CODIGO'
                Title.Caption = 'TTPDC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRECIBOITENS_CODIGO'
                Title.Caption = 'TRIC'
                Visible = True
              end>
          end
          object DateTimePicker2: TDateTimePicker
            Left = 598
            Top = 32
            Width = 105
            Height = 21
            Date = 44682.460374895830000000
            Format = 'MM/yyyy'
            Time = 44682.460374895830000000
            DateMode = dmUpDown
            TabOrder = 2
          end
          object DateTimePicker3: TDateTimePicker
            Left = 757
            Top = 32
            Width = 105
            Height = 21
            Date = 44711.460374895830000000
            Format = 'MM/yyyy'
            Time = 44711.460374895830000000
            DateMode = dmUpDown
            TabOrder = 3
          end
          object btnPesquisarData: TButton
            Left = 872
            Top = 28
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 4
            OnClick = btnPesquisarDataClick
          end
        end
        object BoxPesquisarCliente: TGroupBox
          Left = 0
          Top = 160
          Width = 1070
          Height = 128
          Caption = 'Box Pesquisar Cliente'
          TabOrder = 3
          object Label18: TLabel
            Left = 11
            Top = 15
            Width = 91
            Height = 13
            Caption = 'Pesquisar Cliente:'
          end
          object GridCadClienteLan: TDBGrid
            Left = 2
            Top = 39
            Width = 1065
            Height = 86
            DataSource = DM.dsPesqClienteLan
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnCellClick = GridCadClienteLanCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'TCLIENTE_CODIGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TCLIENTE_NOME'
                Width = 222
                Visible = True
              end>
          end
          object edtPesquisarClienteL: TEdit
            Left = 103
            Top = 12
            Width = 330
            Height = 21
            TabOrder = 1
            OnChange = edtPesquisarClienteLChange
          end
        end
        object btnEditarClienteRecibo: TButton
          Left = 323
          Top = 390
          Width = 118
          Height = 25
          Caption = 'Alterar o Cliente'
          TabOrder = 4
          OnClick = btnEditarClienteReciboClick
        end
        object btnAlterarRecibo: TButton
          Left = 323
          Top = 432
          Width = 118
          Height = 25
          Caption = 'Editar Recibo'
          TabOrder = 5
          OnClick = btnAlterarReciboClick
        end
        object btnNovoReciboLan: TButton
          Left = 323
          Top = 347
          Width = 118
          Height = 25
          Caption = 'Novo Recibo'
          TabOrder = 6
          OnClick = btnNovoReciboLanClick
        end
      end
      object tbsAdicionarDespesa: TTabSheet
        Caption = 'Adicionar Despesa'
        ImageIndex = 2
        ExplicitWidth = 1077
        object Label11: TLabel
          Left = 3
          Top = 24
          Width = 98
          Height = 13
          Caption = 'Pesquisar Despesa:'
        end
        object Label13: TLabel
          Left = -1
          Top = 267
          Width = 149
          Height = 13
          Caption = 'Selecione o Tipo de Despesa:'
        end
        object Label14: TLabel
          Left = 34
          Top = 296
          Width = 114
          Height = 13
          Caption = 'Descri'#231#227'o da Despesa:'
        end
        object Label15: TLabel
          Left = 61
          Top = 232
          Width = 87
          Height = 13
          Caption = 'Codigo Despesa:'
        end
        object Label16: TLabel
          Left = 149
          Top = 232
          Width = 39
          Height = 13
          Caption = 'Label16'
        end
        object edtPesquisarTbsDespesa: TEdit
          Left = 107
          Top = 21
          Width = 614
          Height = 21
          TabOrder = 0
          OnChange = edtPesquisarTbsDespesaChange
        end
        object GridCadDespesa: TDBGrid
          Left = 3
          Top = 48
          Width = 1067
          Height = 120
          DataSource = DM.dsCadDespesa
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = GridCadDespesaCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TTPDESPESA_CODIGO'
              Title.Caption = 'Cod. Despesa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TTPDESPESA_DESCR'
              Title.Caption = 'Despesa'
              Width = 392
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TTPDESPESA_TIPO'
              Title.Caption = 'Tipo de Despesa'
              Width = 226
              Visible = True
            end>
        end
        object edtDescrDespesaCadD: TEdit
          Left = 149
          Top = 293
          Width = 252
          Height = 21
          TabOrder = 2
        end
        object RadioGroup1: TRadioGroup
          Left = 149
          Top = 252
          Width = 149
          Height = 36
          Columns = 2
          Items.Strings = (
            'Honor'#225'rio'
            'Imposto')
          TabOrder = 3
        end
        object btnNovaDespesa: TButton
          Left = 149
          Top = 336
          Width = 156
          Height = 25
          Caption = 'Nova Despesa'
          TabOrder = 4
          OnClick = btnNovaDespesaClick
        end
        object btnEditarCadDespesa: TButton
          Left = 327
          Top = 336
          Width = 138
          Height = 25
          Caption = 'Editar Despesa'
          TabOrder = 5
          OnClick = btnEditarCadDespesaClick
        end
        object btnCancelarCadDespesa: TButton
          Left = 569
          Top = 336
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 6
          OnClick = btnCancelarCadDespesaClick
        end
        object btnSalvarCadDespesa: TButton
          Left = 488
          Top = 336
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 7
          OnClick = btnSalvarCadDespesaClick
        end
      end
    end
  end
  object btnPesquisarRecibo: TButton
    Left = 0
    Top = 618
    Width = 118
    Height = 25
    Caption = 'Pesquisar Recibo'
    TabOrder = 2
    OnClick = btnPesquisarReciboClick
  end
  object btnSalvarLan: TButton
    Left = 773
    Top = 618
    Width = 77
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarLanClick
  end
  object btnCancelarReciboMenu: TButton
    Left = 856
    Top = 618
    Width = 77
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarReciboMenuClick
  end
  object btnVoltar: TButton
    Left = 939
    Top = 618
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 5
    OnClick = btnVoltarClick
  end
  object btnEmitirRecibo: TButton
    Left = 124
    Top = 618
    Width = 117
    Height = 25
    Caption = 'Emitir Recibo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btTesteClick
  end
  object btnGerarRecibo: TButton
    Left = 592
    Top = 618
    Width = 114
    Height = 25
    Caption = 'Gerar Recibo'
    TabOrder = 7
    OnClick = btnGerarReciboClick
  end
  object btnNovaDespesaLan: TButton
    Left = 460
    Top = 618
    Width = 118
    Height = 25
    Caption = 'Criar Nova Despesa'
    TabOrder = 8
    OnClick = btnNovaDespesaLanClick
  end
end
