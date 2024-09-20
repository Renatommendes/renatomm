object DM: TDM
  OldCreateOrder = False
  Height = 428
  Width = 604
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=PC34\SQLEXPRESS'
      'Database=EMISSORDERECIBOS'
      'Server=PC34\SQLEXPRESS'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    Left = 32
    Top = 24
  end
  object qrCliente: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from tcliente')
    Left = 24
    Top = 72
    object qrClienteTCLIENTE_CODIGO: TFDAutoIncField
      FieldName = 'TCLIENTE_CODIGO'
      Origin = 'TCLIENTE_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrClienteTCLIENTE_NOME: TStringField
      FieldName = 'TCLIENTE_NOME'
      Origin = 'TCLIENTE_NOME'
      Required = True
      Size = 100
    end
    object qrClienteTCLIENTE_RAZAOSOCIAL: TStringField
      FieldName = 'TCLIENTE_RAZAOSOCIAL'
      Origin = 'TCLIENTE_RAZAOSOCIAL'
      Size = 100
    end
    object qrClienteTCLIENTE_RG_IE: TStringField
      FieldName = 'TCLIENTE_RG_IE'
      Origin = 'TCLIENTE_RG_IE'
      Size = 50
    end
    object qrClienteTCLIENTE_CPF_CNPJ: TStringField
      FieldName = 'TCLIENTE_CPF_CNPJ'
      Origin = 'TCLIENTE_CPF_CNPJ'
      Size = 50
    end
    object qrClienteTCLIENTE_TIPOPESSOA: TStringField
      FieldName = 'TCLIENTE_TIPOPESSOA'
      Origin = 'TCLIENTE_TIPOPESSOA'
      Size = 10
    end
    object qrClienteTCLIENTE_EMAIL: TStringField
      FieldName = 'TCLIENTE_EMAIL'
      Origin = 'TCLIENTE_EMAIL'
      Size = 100
    end
    object qrClienteTCLIENTE_TELEFONE: TStringField
      FieldName = 'TCLIENTE_TELEFONE'
      Origin = 'TCLIENTE_TELEFONE'
      Size = 50
    end
    object qrClienteTCLIENTE_CELULAR: TStringField
      FieldName = 'TCLIENTE_CELULAR'
      Origin = 'TCLIENTE_CELULAR'
      Size = 50
    end
    object qrClienteTCLIENTE_LOGRADOURO: TStringField
      FieldName = 'TCLIENTE_LOGRADOURO'
      Origin = 'TCLIENTE_LOGRADOURO'
      Size = 150
    end
    object qrClienteTCLIENTE_NUM: TIntegerField
      FieldName = 'TCLIENTE_NUM'
      Origin = 'TCLIENTE_NUM'
    end
    object qrClienteTCLIENTE_BAIRRO: TStringField
      FieldName = 'TCLIENTE_BAIRRO'
      Origin = 'TCLIENTE_BAIRRO'
      Size = 50
    end
    object qrClienteTCLIENTE_CIDADE: TStringField
      FieldName = 'TCLIENTE_CIDADE'
      Origin = 'TCLIENTE_CIDADE'
      Size = 50
    end
    object qrClienteTCLIENTE_ESTADO: TStringField
      FieldName = 'TCLIENTE_ESTADO'
      Origin = 'TCLIENTE_ESTADO'
      Size = 50
    end
    object qrClienteTCLIENTE_DATACADASTRO: TDateField
      FieldName = 'TCLIENTE_DATACADASTRO'
      Origin = 'TCLIENTE_DATACADASTRO'
    end
    object qrClienteTCLIENTE_OBS: TStringField
      FieldName = 'TCLIENTE_OBS'
      Origin = 'TCLIENTE_OBS'
      Size = 200
    end
    object qrClienteTCLIENTE_COMPLEMENTO: TStringField
      FieldName = 'TCLIENTE_COMPLEMENTO'
      Origin = 'TCLIENTE_COMPLEMENTO'
      Size = 50
    end
  end
  object dsCliente: TDataSource
    DataSet = qrCliente
    Left = 72
    Top = 72
  end
  object qrRecItens: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM TRECIBOITENS')
    Left = 16
    Top = 184
    object qrRecItensTRECIBO_CODIGO: TIntegerField
      FieldName = 'TRECIBO_CODIGO'
      Origin = 'TRECIBO_CODIGO'
    end
    object qrRecItensTTPDESPESA_CODIGO: TIntegerField
      FieldName = 'TTPDESPESA_CODIGO'
      Origin = 'TTPDESPESA_CODIGO'
    end
    object qrRecItensTTPDESPESA_DESCR: TStringField
      FieldName = 'TTPDESPESA_DESCR'
      Origin = 'TTPDESPESA_DESCR'
      Size = 100
    end
    object qrRecItensTRECIBOITENS_VL: TFloatField
      FieldName = 'TRECIBOITENS_VL'
      Origin = 'TRECIBOITENS_VL'
    end
    object qrRecItensTRECIBOITENS_CODIGO: TFDAutoIncField
      FieldName = 'TRECIBOITENS_CODIGO'
      Origin = 'TRECIBOITENS_CODIGO'
      ReadOnly = True
    end
  end
  object dsRecItens: TDataSource
    DataSet = qrRecItens
    Left = 88
    Top = 184
  end
  object qrCadDespesa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from TTPDESPESA')
    Left = 24
    Top = 248
    object qrCadDespesaTTPDESPESA_CODIGO: TFDAutoIncField
      FieldName = 'TTPDESPESA_CODIGO'
      Origin = 'TTPDESPESA_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrCadDespesaTTPDESPESA_DESCR: TStringField
      FieldName = 'TTPDESPESA_DESCR'
      Origin = 'TTPDESPESA_DESCR'
      Size = 100
    end
    object qrCadDespesaTTPDESPESA_TIPO: TStringField
      FieldName = 'TTPDESPESA_TIPO'
      Origin = 'TTPDESPESA_TIPO'
      Size = 2
    end
  end
  object dsCadDespesa: TDataSource
    DataSet = qrCadDespesa
    Left = 104
    Top = 248
  end
  object qrRecibo: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from  TRECIBO ')
    Left = 24
    Top = 304
    object qrReciboTRECIBO_CODIGO: TFDAutoIncField
      FieldName = 'TRECIBO_CODIGO'
      Origin = 'TRECIBO_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrReciboTCLIENTE_CODIGO: TIntegerField
      FieldName = 'TCLIENTE_CODIGO'
      Origin = 'TCLIENTE_CODIGO'
    end
    object qrReciboTCLIENTE_NOME: TStringField
      FieldName = 'TCLIENTE_NOME'
      Origin = 'TCLIENTE_NOME'
      Required = True
      Size = 100
    end
    object qrReciboTRECIBO_TIPO_DESPESA: TStringField
      FieldName = 'TRECIBO_TIPO_DESPESA'
      Origin = 'TRECIBO_TIPO_DESPESA'
      Size = 2
    end
    object qrReciboTRECIBO_VL_TOTAL: TFloatField
      FieldName = 'TRECIBO_VL_TOTAL'
      Origin = 'TRECIBO_VL_TOTAL'
    end
    object qrReciboTRECIBO_DATAREFERENCIA: TDateField
      FieldName = 'TRECIBO_DATAREFERENCIA'
      Origin = 'TRECIBO_DATAREFERENCIA'
      Required = True
    end
  end
  object dsRecibo: TDataSource
    DataSet = qrRecibo
    Left = 88
    Top = 304
  end
  object dsPesqClienteLan: TDataSource
    DataSet = qrPesqClienteLan
    Left = 128
    Top = 128
  end
  object qrPesqClienteLan: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select TCLIENTE_CODIGO, TCLIENTE_NOME from TCLIENTE')
    Left = 32
    Top = 128
    object qrPesqClienteLanTCLIENTE_CODIGO: TFDAutoIncField
      FieldName = 'TCLIENTE_CODIGO'
      Origin = 'TCLIENTE_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrPesqClienteLanTCLIENTE_NOME: TStringField
      FieldName = 'TCLIENTE_NOME'
      Origin = 'TCLIENTE_NOME'
      Required = True
      Size = 100
    end
  end
  object qryAux: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from TRECIBO')
    Left = 272
    Top = 16
  end
  object qrPesquisarRecibo: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from  TRECIBO inner join TRECIBOITENS'
      'on TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBO_CODIGO')
    Left = 328
    Top = 80
    object qrPesquisarReciboTRECIBO_CODIGO: TFDAutoIncField
      FieldName = 'TRECIBO_CODIGO'
      Origin = 'TRECIBO_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrPesquisarReciboTCLIENTE_CODIGO: TIntegerField
      FieldName = 'TCLIENTE_CODIGO'
      Origin = 'TCLIENTE_CODIGO'
    end
    object qrPesquisarReciboTCLIENTE_NOME: TStringField
      FieldName = 'TCLIENTE_NOME'
      Origin = 'TCLIENTE_NOME'
      Required = True
      Size = 100
    end
    object qrPesquisarReciboTRECIBO_TIPO_DESPESA: TStringField
      FieldName = 'TRECIBO_TIPO_DESPESA'
      Origin = 'TRECIBO_TIPO_DESPESA'
      Size = 2
    end
    object qrPesquisarReciboTRECIBO_VL_TOTAL: TFloatField
      FieldName = 'TRECIBO_VL_TOTAL'
      Origin = 'TRECIBO_VL_TOTAL'
    end
    object qrPesquisarReciboTRECIBO_DATAREFERENCIA: TDateField
      FieldName = 'TRECIBO_DATAREFERENCIA'
      Origin = 'TRECIBO_DATAREFERENCIA'
      Required = True
    end
    object qrPesquisarReciboTRECIBO_CODIGO_1: TIntegerField
      FieldName = 'TRECIBO_CODIGO_1'
      Origin = 'TRECIBO_CODIGO'
    end
    object qrPesquisarReciboTTPDESPESA_CODIGO: TIntegerField
      FieldName = 'TTPDESPESA_CODIGO'
      Origin = 'TTPDESPESA_CODIGO'
    end
    object qrPesquisarReciboTTPDESPESA_DESCR: TStringField
      FieldName = 'TTPDESPESA_DESCR'
      Origin = 'TTPDESPESA_DESCR'
      Size = 100
    end
    object qrPesquisarReciboTRECIBOITENS_VL: TFloatField
      FieldName = 'TRECIBOITENS_VL'
      Origin = 'TRECIBOITENS_VL'
    end
    object qrPesquisarReciboTRECIBOITENS_CODIGO: TFDAutoIncField
      FieldName = 'TRECIBOITENS_CODIGO'
      Origin = 'TRECIBOITENS_CODIGO'
      ReadOnly = True
    end
  end
  object dsPesquisarRecibo: TDataSource
    DataSet = qrPesquisarRecibo
    Left = 424
    Top = 80
  end
  object qrLookupI: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from TTPDESPESA where TTPDESPESA_TIPO = '#39'I'#39)
    Left = 328
    Top = 192
    object qrLookupITTPDESPESA_TIPO: TStringField
      FieldName = 'TTPDESPESA_TIPO'
      Origin = 'TTPDESPESA_TIPO'
      Size = 2
    end
    object qrLookupITTPDESPESA_CODIGO: TFDAutoIncField
      FieldName = 'TTPDESPESA_CODIGO'
      Origin = 'TTPDESPESA_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrLookupITTPDESPESA_DESCR: TStringField
      FieldName = 'TTPDESPESA_DESCR'
      Origin = 'TTPDESPESA_DESCR'
      Size = 100
    end
  end
  object qrLookupH: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from TTPDESPESA where TTPDESPESA_TIPO = '#39'H'#39)
    Left = 328
    Top = 256
    object qrLookupHTTPDESPESA_CODIGO: TFDAutoIncField
      FieldName = 'TTPDESPESA_CODIGO'
      Origin = 'TTPDESPESA_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrLookupHTTPDESPESA_DESCR: TStringField
      FieldName = 'TTPDESPESA_DESCR'
      Origin = 'TTPDESPESA_DESCR'
      Size = 100
    end
    object qrLookupHTTPDESPESA_TIPO: TStringField
      FieldName = 'TTPDESPESA_TIPO'
      Origin = 'TTPDESPESA_TIPO'
      Size = 2
    end
  end
  object dsLookupI: TDataSource
    DataSet = qrLookupI
    Left = 392
    Top = 192
  end
  object dsLookupH: TDataSource
    DataSet = qrLookupH
    Left = 392
    Top = 256
  end
  object qrPesquisarRecibo2: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from  TRECIBO inner join TRECIBOITENS'
      'on TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBO_CODIGO'
      ''
      '')
    Left = 328
    Top = 136
    object qrPesquisarRecibo2TRECIBO_CODIGO: TFDAutoIncField
      FieldName = 'TRECIBO_CODIGO'
      Origin = 'TRECIBO_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrPesquisarRecibo2TCLIENTE_CODIGO: TIntegerField
      FieldName = 'TCLIENTE_CODIGO'
      Origin = 'TCLIENTE_CODIGO'
    end
    object qrPesquisarRecibo2TCLIENTE_NOME: TStringField
      FieldName = 'TCLIENTE_NOME'
      Origin = 'TCLIENTE_NOME'
      Required = True
      Size = 100
    end
    object qrPesquisarRecibo2TRECIBO_TIPO_DESPESA: TStringField
      FieldName = 'TRECIBO_TIPO_DESPESA'
      Origin = 'TRECIBO_TIPO_DESPESA'
      Size = 2
    end
    object qrPesquisarRecibo2TRECIBO_VL_TOTAL: TFloatField
      FieldName = 'TRECIBO_VL_TOTAL'
      Origin = 'TRECIBO_VL_TOTAL'
    end
    object qrPesquisarRecibo2TRECIBO_DATAREFERENCIA: TDateField
      FieldName = 'TRECIBO_DATAREFERENCIA'
      Origin = 'TRECIBO_DATAREFERENCIA'
      Required = True
    end
    object qrPesquisarRecibo2TRECIBO_CODIGO_1: TIntegerField
      FieldName = 'TRECIBO_CODIGO_1'
      Origin = 'TRECIBO_CODIGO'
    end
    object qrPesquisarRecibo2TTPDESPESA_CODIGO: TIntegerField
      FieldName = 'TTPDESPESA_CODIGO'
      Origin = 'TTPDESPESA_CODIGO'
    end
    object qrPesquisarRecibo2TTPDESPESA_DESCR: TStringField
      FieldName = 'TTPDESPESA_DESCR'
      Origin = 'TTPDESPESA_DESCR'
      Size = 100
    end
    object qrPesquisarRecibo2TRECIBOITENS_VL: TFloatField
      FieldName = 'TRECIBOITENS_VL'
      Origin = 'TRECIBOITENS_VL'
    end
    object qrPesquisarRecibo2TRECIBOITENS_CODIGO: TFDAutoIncField
      FieldName = 'TRECIBOITENS_CODIGO'
      Origin = 'TRECIBOITENS_CODIGO'
      ReadOnly = True
    end
  end
  object dsPesquisarRecibo2: TDataSource
    DataSet = qrPesquisarRecibo2
    Left = 432
    Top = 136
  end
  object qrBuscarRecibo: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        '    SELECT TRECIBO.TRECIBO_CODIGO ,TRECIBO.TCLIENTE_CODIGO, TREC' +
        'IBO.TCLIENTE_NOME FROM TRECIBOITENS'
      'join TRECIBO on '
      'TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBOITENS_CODIGO')
    Left = 336
    Top = 24
    object qrBuscarReciboTRECIBO_CODIGO: TFDAutoIncField
      FieldName = 'TRECIBO_CODIGO'
      Origin = 'TRECIBO_CODIGO'
      ReadOnly = True
    end
    object qrBuscarReciboTCLIENTE_CODIGO: TIntegerField
      FieldName = 'TCLIENTE_CODIGO'
      Origin = 'TCLIENTE_CODIGO'
    end
    object qrBuscarReciboTCLIENTE_NOME: TStringField
      FieldName = 'TCLIENTE_NOME'
      Origin = 'TCLIENTE_NOME'
      Required = True
      Size = 100
    end
  end
  object dsBuscarREcibo: TDataSource
    DataSet = qrBuscarRecibo
    Left = 416
    Top = 24
  end
  object qrValorTotal: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select TRECIBO_CODIGO, TRECIBOITENS_VL FROM TRECIBOITENS')
    Left = 328
    Top = 312
  end
  object dsValorTotal: TDataSource
    DataSet = qrValorTotal
    Left = 400
    Top = 312
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 312
    object ClientDataSet1Total: TFloatField
      FieldName = 'Total'
    end
  end
end
