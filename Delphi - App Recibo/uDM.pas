unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    qrCliente: TFDQuery;
    dsCliente: TDataSource;
    qrClienteTCLIENTE_CODIGO: TFDAutoIncField;
    qrClienteTCLIENTE_NOME: TStringField;
    qrClienteTCLIENTE_RAZAOSOCIAL: TStringField;
    qrClienteTCLIENTE_RG_IE: TStringField;
    qrClienteTCLIENTE_CPF_CNPJ: TStringField;
    qrClienteTCLIENTE_TIPOPESSOA: TStringField;
    qrClienteTCLIENTE_EMAIL: TStringField;
    qrClienteTCLIENTE_TELEFONE: TStringField;
    qrClienteTCLIENTE_CELULAR: TStringField;
    qrClienteTCLIENTE_LOGRADOURO: TStringField;
    qrClienteTCLIENTE_NUM: TIntegerField;
    qrClienteTCLIENTE_BAIRRO: TStringField;
    qrClienteTCLIENTE_CIDADE: TStringField;
    qrClienteTCLIENTE_ESTADO: TStringField;
    qrClienteTCLIENTE_DATACADASTRO: TDateField;
    qrClienteTCLIENTE_OBS: TStringField;
    qrClienteTCLIENTE_COMPLEMENTO: TStringField;
    qrRecItens: TFDQuery;
    dsRecItens: TDataSource;
    qrCadDespesa: TFDQuery;
    dsCadDespesa: TDataSource;
    qrRecibo: TFDQuery;
    dsRecibo: TDataSource;
    qrCadDespesaTTPDESPESA_CODIGO: TFDAutoIncField;
    qrCadDespesaTTPDESPESA_DESCR: TStringField;
    qrCadDespesaTTPDESPESA_TIPO: TStringField;
    dsPesqClienteLan: TDataSource;
    qrPesqClienteLan: TFDQuery;
    qrPesqClienteLanTCLIENTE_CODIGO: TFDAutoIncField;
    qrPesqClienteLanTCLIENTE_NOME: TStringField;
    qrRecItensTRECIBO_CODIGO: TIntegerField;
    qrRecItensTTPDESPESA_CODIGO: TIntegerField;
    qrRecItensTTPDESPESA_DESCR: TStringField;
    qrRecItensTRECIBOITENS_VL: TFloatField;
    qrRecItensTRECIBOITENS_CODIGO: TFDAutoIncField;
    qryAux: TFDQuery;
    qrPesquisarRecibo: TFDQuery;
    dsPesquisarRecibo: TDataSource;
    qrPesquisarReciboTRECIBO_CODIGO: TFDAutoIncField;
    qrPesquisarReciboTCLIENTE_CODIGO: TIntegerField;
    qrPesquisarReciboTCLIENTE_NOME: TStringField;
    qrPesquisarReciboTRECIBO_TIPO_DESPESA: TStringField;
    qrPesquisarReciboTRECIBO_VL_TOTAL: TFloatField;
    qrPesquisarReciboTRECIBO_DATAREFERENCIA: TDateField;
    qrPesquisarReciboTRECIBO_CODIGO_1: TIntegerField;
    qrPesquisarReciboTTPDESPESA_CODIGO: TIntegerField;
    qrPesquisarReciboTTPDESPESA_DESCR: TStringField;
    qrPesquisarReciboTRECIBOITENS_VL: TFloatField;
    qrPesquisarReciboTRECIBOITENS_CODIGO: TFDAutoIncField;
    qrLookupI: TFDQuery;
    qrLookupH: TFDQuery;
    dsLookupI: TDataSource;
    dsLookupH: TDataSource;
    qrLookupITTPDESPESA_TIPO: TStringField;
    qrLookupHTTPDESPESA_CODIGO: TFDAutoIncField;
    qrLookupHTTPDESPESA_DESCR: TStringField;
    qrLookupHTTPDESPESA_TIPO: TStringField;
    qrLookupITTPDESPESA_CODIGO: TFDAutoIncField;
    qrLookupITTPDESPESA_DESCR: TStringField;
    qrPesquisarRecibo2: TFDQuery;
    dsPesquisarRecibo2: TDataSource;
    qrPesquisarRecibo2TRECIBO_CODIGO: TFDAutoIncField;
    qrPesquisarRecibo2TCLIENTE_CODIGO: TIntegerField;
    qrPesquisarRecibo2TCLIENTE_NOME: TStringField;
    qrPesquisarRecibo2TRECIBO_TIPO_DESPESA: TStringField;
    qrPesquisarRecibo2TRECIBO_VL_TOTAL: TFloatField;
    qrPesquisarRecibo2TRECIBO_DATAREFERENCIA: TDateField;
    qrPesquisarRecibo2TRECIBO_CODIGO_1: TIntegerField;
    qrPesquisarRecibo2TTPDESPESA_CODIGO: TIntegerField;
    qrPesquisarRecibo2TTPDESPESA_DESCR: TStringField;
    qrPesquisarRecibo2TRECIBOITENS_VL: TFloatField;
    qrPesquisarRecibo2TRECIBOITENS_CODIGO: TFDAutoIncField;
    qrReciboTRECIBO_CODIGO: TFDAutoIncField;
    qrReciboTCLIENTE_CODIGO: TIntegerField;
    qrReciboTCLIENTE_NOME: TStringField;
    qrReciboTRECIBO_TIPO_DESPESA: TStringField;
    qrReciboTRECIBO_VL_TOTAL: TFloatField;
    qrReciboTRECIBO_DATAREFERENCIA: TDateField;
    qrBuscarRecibo: TFDQuery;
    dsBuscarREcibo: TDataSource;
    qrBuscarReciboTRECIBO_CODIGO: TFDAutoIncField;
    qrBuscarReciboTCLIENTE_CODIGO: TIntegerField;
    qrBuscarReciboTCLIENTE_NOME: TStringField;
    qrValorTotal: TFDQuery;
    dsValorTotal: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Total: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
uses uCadCliente;
var
telacadcliete : TFrmCadCliente;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
