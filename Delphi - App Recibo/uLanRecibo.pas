unit uLanRecibo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroModelo, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, uCadCliente, uDM;

type
  TFrmLanRecibo = class(TFrmCadastroModelo)
    PageControl1: TPageControl;
    tbsLanRecibo: TTabSheet;
    tbsPesquisaRecibo: TTabSheet;
    tbsAdicionarDespesa: TTabSheet;
    Label1: TLabel;
    edtPesquisarRecibo: TEdit;
    Label8: TLabel;
    DBLookupComboBoxH: TDBLookupComboBox;
    Label9: TLabel;
    edtValor: TEdit;
    GridReciboEditar: TDBGrid;
    Label11: TLabel;
    edtPesquisarTbsDespesa: TEdit;
    GridCadDespesa: TDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    edtDescrDespesaCadD: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    btnPesquisarRecibo: TButton;
    btnNovoReciboLan: TButton;
    btnSalvarLan: TButton;
    btnAlterarRecibo: TButton;
    btnCancelarReciboMenu: TButton;
    btnNovoItemRecibo: TButton;
    Label17: TLabel;
    GridItemDespesa: TDBGrid;
    Label19: TLabel;
    edtPesquisarReciboEditar: TEdit;
    RadioGroup1: TRadioGroup;
    btnNovaDespesa: TButton;
    Label20: TLabel;
    edtCodRecibo: TEdit;
    edtCodTPDespesa: TEdit;
    Label21: TLabel;
    btnEditarCadDespesa: TButton;
    btnSalvarCadDespesa: TButton;
    btnCancelarCadDespesa: TButton;
    Label23: TLabel;
    edtCodReciboItens: TEdit;
    btnEditarItensRecibo: TButton;
    btnSalvarItensRecibo: TButton;
    btnCancelarItensRecibo: TButton;
    BoxRecibo: TGroupBox;
    Label18: TLabel;
    edtPesquisarClienteL: TEdit;
    GridCadClienteLan: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    edtCodRecibo2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label7: TLabel;
    Label6: TLabel;
    RadioGroup2: TRadioGroup;
    edtValorTotal: TEdit;
    Label10: TLabel;
    btnNovoRecibo: TButton;
    btnEditarRecibo: TButton;
    btnSalvarRecibo: TButton;
    btnCancelarRecibo: TButton;
    BoxItensRecibo: TGroupBox;
    BoxPesquisarCliente: TGroupBox;
    DBLookupComboBoxI: TDBLookupComboBox;
    BoxPesquisarRecibo: TGroupBox;
    btnEditarClienteRecibo: TButton;
    btnNovaDespesaLan: TButton;
    DateTimePicker2: TDateTimePicker;
    Label12: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    btnPesquisarData: TButton;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    btnPesquisarTbsRecibo: TButton;
    DBGrid2: TDBGrid;
    btnGerarRecibo: TButton;
    btnVoltar: TButton;
    btnEmitirRecibo: TButton;
    Label29: TLabel;
    lblTotalDespesaTBSPesqRecibo: TLabel;
    procedure btnNovoReciboLanClick(Sender: TObject);
    procedure btnAlterarReciboClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure GridCadClienteLanCellClick(Column: TColumn);
    procedure btnSalvarLanClick(Sender: TObject);
    procedure btnNovaDespesaClick(Sender: TObject);
    procedure btnNovoReciboClick(Sender: TObject);
    procedure btnNovoItemReciboClick(Sender: TObject);
    procedure GridReciboEditarCellClick(Column: TColumn);
    procedure DBLookupComboBoxHExit(Sender: TObject);
    procedure GridCadDespesaCellClick(Column: TColumn);
    procedure btnSalvarCadDespesaClick(Sender: TObject);
    procedure btnEditarCadDespesaClick(Sender: TObject);
    procedure btnCancelarCadDespesaClick(Sender: TObject);
    procedure btnSalvarReciboClick(Sender: TObject);
    procedure btnEditarReciboClick(Sender: TObject);
    procedure btnCancelarReciboClick(Sender: TObject);
    procedure btnEditarItensReciboClick(Sender: TObject);
    procedure btnSalvarItensReciboClick(Sender: TObject);
    procedure GridItemDespesaCellClick(Column: TColumn);
    procedure btnCancelarItensReciboClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure btnEditarClienteReciboClick(Sender: TObject);
    procedure btnCancelarReciboMenuClick(Sender: TObject);
    procedure edtPesquisarReciboChange(Sender: TObject);
    procedure btnPesquisarReciboClick(Sender: TObject);
    procedure btnEmitirReciboClick(Sender: TObject);
    procedure btnNovaDespesaLanClick(Sender: TObject);
    procedure edtPesquisarReciboEditarChange(Sender: TObject);
    procedure btnPesquisarDataClick(Sender: TObject);
    procedure btnPesquisarTbsReciboClick(Sender: TObject);
    procedure edtPesquisarClienteLChange(Sender: TObject);
    procedure edtPesquisarTbsDespesaChange(Sender: TObject);
    procedure btnGerarReciboClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btTesteClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);



  private
    { Private declarations }
  public
    { Public declarations }
    operacao : String;
    procedure enviardadositens;
    procedure enviardadosdespesa;
    procedure enviardadosrecibo;
    procedure atualizabancoCadDespesa;
    procedure atualizabancoRecibo;
    procedure atualizabancoItem;
    procedure preenchecampocliente;
    procedure preenchecampoTipoItemDepesa;
    procedure editardadosCadDespesa;
    procedure preenchecampoCadDespesa;
    procedure editardadosRecibo;
    procedure preenchercampoRecibo;
    procedure editardadosRecItens;
    procedure preenchercampoRecItens;
    procedure atualizabancoPesquisaRecibo;
    procedure AtualizabancoQrLookupI;
    procedure AtualizabancoQrLookupH;
    procedure itensinvisiveisBoxRecibo;
    procedure itensinvisiveisBoxItensRecibo;
    procedure itensinvisiveisTbsCadDespesa;
    procedure atualizabancoQrAux;
    procedure pesquisarDadosRecibo;
    procedure atualizabancoqrBuscarRecibo;
    procedure buscarClienteReciboLan;
    procedure atualizabancoQrPesquisarClienteLan;
    procedure inicializarLancamento;
    procedure atualizabancoqrPesquisarReciboLan;
    procedure buscarTbsRecibo;
    procedure buscarClienteCadRecibo;
    procedure buscarDespesaTbsDespesa;
    procedure somarTotalDespesaRecibo;
    procedure pesquisarReciboTBSPesqRecibo;
    procedure somarTotalDespesaClienteTBSPesqRecibo;




  end;

var
  FrmLanRecibo: TFrmLanRecibo;
  honorario : String;
  imposto : String;
  recPJ : String;
  RecPF : String;
  auxdespesa: string;
  valortotalrecibo : double;

  xVariavelCodigo : integer;
  xSoma : Double;

//  xVariavelCodigoTBSPesqRecibo : Integer;
//  xSomaCo

implementation

{$R *.dfm}

procedure TFrmLanRecibo.btnNovoReciboLanClick(Sender: TObject);
begin
  inherited;
  operacao := 'novorecibo';

 edtValorTotal.Visible := True;
 edtCodRecibo2.Visible := false;

 Label22.Visible := false;
 label10.Visible := True;

 btnSalvarLan.Visible := true;
 btnCancelarReciboMenu.Visible := true;
 btnVoltar.Visible := true;

 btnAlterarRecibo.Visible := false;
 btnNovoItemRecibo.Visible := false;
 btnEditarClienteRecibo.Visible := false;
 btnGerarRecibo.Visible := false;
 btnNovaDespesaLan.Visible := false;

  BoxRecibo.Visible := true;
  BoxRecibo.Caption := '';

  BoxPesquisarRecibo.Visible := false;

  BoxPesquisarCliente.Visible := true;
  BoxPesquisarCliente.Caption := '';
  BoxPesquisarCliente.Align := AlTop;

  BoxItensRecibo.Visible := true;



//  GridReciboEditar.Visible := false;
//  edtPesquisarReciboEditar.Visible := false;
//  Label17.Visible := false;
//  Label19.Visible := false;
end;

procedure TFrmLanRecibo.btnPesquisarDataClick(Sender: TObject);
begin
  inherited;
  DM.qrPesquisarRecibo2.Close;
  DM.qrPesquisarRecibo2.SQL.Clear;
  DM.qrPesquisarRecibo2.SQL.Add('select * from  TRECIBO, TRECIBOITENS WHERE TRECIBO_DATAREFERENCIA between :pdat1 and :pdat2 ');
  DM.qrPesquisarRecibo2.ParamByName('pdat1').AsDate := DateTimePicker2.Date;
  DM.qrPesquisarRecibo2.ParamByName('pdat2').AsDate := DateTimePicker3.Date;
  DM.qrPesquisarRecibo2.Open;
end;

procedure TFrmLanRecibo.btnPesquisarReciboClick(Sender: TObject);
begin
  inherited;
  tbsLanRecibo.Caption := 'Pesquisar';
  tbsPesquisaRecibo.TabVisible := true;
  tbsLanRecibo.TabVisible := FALSE;
  tbsAdicionarDespesa.TabVisible := false;
  PageControl1.TabIndex := 0;

  btnNovoReciboLan.Visible := false;
  btnSalvarLan.Visible := false;
  btnAlterarRecibo.Visible := false;
  btnNovaDespesa.Visible := false;
  btnCancelarReciboMenu.Visible := false;
  btnNovaDespesaLan.Visible := false;
  btnGerarRecibo.Visible := false;

  atualizabancoqrPesquisarReciboLan;


//  Label16.Visible := true;
//  Label16.Visible := true;
//  Label17.Visible := false;
//  edtPesquisarC.Visible := true;
end;

procedure TFrmLanRecibo.btnPesquisarTbsReciboClick(Sender: TObject);
begin
  inherited;
  DM.qrPesquisarRecibo2.Close;
  DM.qrPesquisarRecibo2.SQL.Clear;
  DM.qrPesquisarRecibo2.SQL.Add('select * from  TRECIBO, TRECIBOITENS WHERE TRECIBO_DATAREFERENCIA between :pdat4 and :pdat5 ');
  DM.qrPesquisarRecibo2.ParamByName('pdat4').AsDate := DateTimePicker4.Date;
  DM.qrPesquisarRecibo2.ParamByName('pdat5').AsDate := DateTimePicker5.Date;
  DM.qrPesquisarRecibo2.Open;
end;

procedure TFrmLanRecibo.atualizabancoCadDespesa;
begin
  DM.qrCadDespesa.close;
  DM.qrCadDespesa.SQL.Clear;
  DM.qrCadDespesa.SQL.Add('SELECT * FROM TTPDESPESA');
  DM.qrCadDespesa.open;
end;

procedure TFrmLanRecibo.atualizabancoItem;
begin
  DM.qrRecItens.close;
  DM.qrRecItens.SQL.Clear;
  DM.qrRecItens.SQL.Add('SELECT * FROM TRECIBOITENS');
  DM.qrRecItens.open;
end;

procedure TFrmLanRecibo.atualizabancoPesquisaRecibo;
begin
  DM.qrPesquisarRecibo.close;
  DM.qrPesquisarRecibo.SQL.Clear;
  DM.qrPesquisarRecibo.SQL.Add('select * from  TRECIBO inner join TRECIBOITENS on TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBO_CODIGO');
  DM.qrPesquisarRecibo.open;
end;

procedure TFrmLanRecibo.atualizabancoQrAux;
begin
  DM.qryAux.close;
  DM.qryAux.SQL.Clear;
  DM.qryAux.SQL.Add('SELECT * FROM TRECIBOITENS');
  DM.qryAux.open;
end;

procedure TFrmLanRecibo.atualizabancoqrBuscarRecibo;
begin
  DM.qrBuscarRecibo.close;
  DM.qrBuscarRecibo.SQL.Clear;
  DM.qrBuscarRecibo.SQL.Add('SELECT TRECIBO.TRECIBO_CODIGO ,TRECIBO.TCLIENTE_CODIGO, TRECIBO.TCLIENTE_NOME FROM TRECIBOITENS join TRECIBO on TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBOITENS_CODIGO');
  DM.qrBuscarRecibo.open;
end;

procedure TFrmLanRecibo.AtualizabancoQrLookupH;
begin
  DM.qrLookupH.close;
  DM.qrLookupH.open;
end;

procedure TFrmLanRecibo.AtualizabancoQrLookupI;
begin
  DM.qrLookupI.close;
  DM.qrLookupI.open;
end;

procedure TFrmLanRecibo.atualizabancoQrPesquisarClienteLan;
begin
  DM.qrPesqClienteLan.close;
  DM.qrPesqClienteLan.SQL.Clear;
  DM.qrPesqClienteLan.SQL.Add('select TCLIENTE_CODIGO, TCLIENTE_NOME from TCLIENTE');
  DM.qrPesqClienteLan.open;

end;

procedure TFrmLanRecibo.atualizabancoqrPesquisarReciboLan;
begin
  DM.qrPesquisarRecibo2.close;
  DM.qrPesquisarRecibo2.SQL.Clear;
  DM.qrPesquisarRecibo2.SQL.Add('select * from  TRECIBO inner join TRECIBOITENS on TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBO_CODIGO');
  DM.qrPesquisarRecibo2.open;
end;

procedure TFrmLanRecibo.atualizabancoRecibo;
begin
  DM.qrRecibo.close;
  DM.qrRecibo.SQL.Clear;
  DM.qrRecibo.SQL.Add('select * from  TRECIBO inner join TRECIBOITENS on TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBO_CODIGO');
  DM.qrRecibo.open;
end;

procedure TFrmLanRecibo.btnNovaDespesaClick(Sender: TObject);
begin
  inherited;
  operacao := 'novocaddespesa';
  btnEditarCadDespesa.Visible := false;
end;

procedure TFrmLanRecibo.btnNovaDespesaLanClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  tbsAdicionarDespesa.Caption := 'Cadastrar Nova Despesa';
  tbsAdicionarDespesa.TabVisible := true;
  tbsLanRecibo.TabVisible := false;
  tbsPesquisaRecibo.TabVisible := FALSE;


  btnSalvarLan.Visible := false;
  btnCancelarReciboMenu.Visible := false;
  btnVoltar.Visible := false;

  btnAlterarRecibo.Visible := false;
  btnNovoReciboLan.Visible := false;
  btnGerarRecibo.Visible := false;
  btnNovaDespesaLan.Visible := true;

  btnNovaDespesa.Visible := true;
end;

procedure TFrmLanRecibo.btnSalvarCadDespesaClick(Sender: TObject);
begin
  inherited;
  if operacao = 'novocaddespesa' then
  begin
    enviardadosdespesa;
  end;
  if operacao = 'editarcaddespesa' then
  begin
    editardadosCadDespesa;
  end;
  atualizabancoCadDespesa;
end;

procedure TFrmLanRecibo.btnSalvarItensReciboClick(Sender: TObject);
begin
  inherited;
    if operacao = 'novoItemRecibo' then
  begin
    enviardadositens;
  end;
  if operacao = 'editarItemRecibo' then
  begin
    editardadosRecItens;
    atualizabancoQrAux;
  end;
  atualizabancoItem;
end;

procedure TFrmLanRecibo.btnNovoReciboClick(Sender: TObject);
begin
  inherited;
  operacao := 'novorecibo';
  btnEditarRecibo.Visible := false;
//  enviardadosrecibo;
//
//  atualizabancoRecibo;

end;

procedure TFrmLanRecibo.btnSalvarLanClick(Sender: TObject);
begin
  inherited;
  if operacao = 'novorecibo' then
  begin
      if Label3.Caption = '' then
      begin
        ShowMessage('ERRO! Selecione um Cliente da lista!');
        abort
      end;
      if edtValor.Text = '' then
      begin
       edtValor.Text := '0';
      end;
      if edtValorTotal.Text = '' then
      begin
       edtValorTotal.Text := '0';
      end;
   enviardadosrecibo;
   enviardadositens;

  end;

    if operacao = 'editarrecibo' then
  begin
    if Label3.Caption = '' then
    begin
      ShowMessage('Selecione um Recibo da lista para editar!');
      abort
    end
    else
    begin
    editardadosRecibo;
    editardadosRecItens;
    atualizabancoQrAux;
    end;
  end;


  if operacao = 'gerarrecibo' then
  begin
    if Label3.Caption = '' then
    begin
      ShowMessage('Selecione um Recibo da lista para editar!');
      abort
    end
    else
    begin
    enviardadosrecibo;
    enviardadositens;
    atualizabancoQrAux;
    end;
  end;

    if operacao = 'alterarclienterecibo' then
  begin
    if Label3.Caption = '' then
    begin
      ShowMessage('Selecione um Cliente da lista para editar!');
      abort
    end
    else
    begin
    editardadosRecibo;
    atualizabancoRecibo;
    end;
  end;


//  if operacao = 'novadespesa' then
//  editardadosRecibo;
//  editardadosRecItens;
//  enviardadosdespesa;
//  atualizabancoCadDespesa;
  atualizabancoqrPesquisarReciboLan;
  atualizabancoItem;
  atualizabancoRecibo;
end;

procedure TFrmLanRecibo.btnSalvarReciboClick(Sender: TObject);
begin
  inherited;
  if edtValorTotal.Text = '' then
  begin
    edtValorTotal.Text := '0';
  end;

    if operacao = 'novorecibo' then
    begin
      if Label3.Caption = '' then
      begin
      ShowMessage('Selecione um Cliente da lista para Gerar o recibo!');

      end
      else
      begin
      enviardadosrecibo;
      end;
    end;


  if operacao = 'editarrecibo' then
  begin
    if Label3.Caption = '' then
    begin
      ShowMessage('Selecione um Recibo da lista para editar!');

    end
    else
    begin
    editardadosRecibo;
    end;
  end;
  atualizabancoRecibo;

end;

procedure TFrmLanRecibo.btnVoltarClick(Sender: TObject);
begin
  inherited;

  if operacao = 'alterarclienterecibo' then
    begin
    btnSalvarLan.Visible := false;
    btnCancelarReciboMenu.Visible := false;

    btnNovoReciboLan.Visible := false;
    btnGerarRecibo.Visible := true;
    btnNovaDespesaLan.Visible := true;

    btnEditarClienteRecibo.Visible := false;

    BoxRecibo.Visible := false;
    BoxItensRecibo.Visible := false;
    BoxPesquisarCliente.Visible := false;
    BoxPesquisarRecibo.Visible := false;


  end;

  if operacao = 'editarrecibo' then
  begin
    btnSalvarLan.Visible := false;
    btnCancelarReciboMenu.Visible := false;

    btnNovoReciboLan.Visible := false;
    btnGerarRecibo.Visible := true;
    btnNovaDespesaLan.Visible := true;
    btnAlterarRecibo.Visible := false;

    btnEditarClienteRecibo.Visible := false;

    BoxRecibo.Visible := false;
    BoxItensRecibo.Visible := false;
    BoxPesquisarCliente.Visible := false;
    BoxPesquisarRecibo.Visible := false;

  end;

    if operacao = 'gerarrecibo' then
  begin
    btnSalvarLan.Visible := false;
    btnCancelarReciboMenu.Visible := false;
    btnVoltar.Visible := false;

    btnNovoReciboLan.Visible := false;
    btnAlterarRecibo.Visible := false;
    btnNovaDespesaLan.Visible := true;

    btnEditarClienteRecibo.Visible := false;

    BoxRecibo.Visible := false;
    BoxItensRecibo.Visible := false;
    BoxPesquisarCliente.Visible := false;
    BoxPesquisarRecibo.Visible := false;


  end;

  if operacao = 'novorecibo' then
  begin
    btnSalvarLan.Visible := false;
    btnCancelarReciboMenu.Visible := false;

    btnGerarRecibo.Visible := true;
    btnAlterarRecibo.Visible := false;
    btnNovaDespesaLan.Visible := true;

    btnEditarClienteRecibo.Visible := false;

    BoxRecibo.Visible := false;
    BoxItensRecibo.Visible := false;
    BoxPesquisarCliente.Visible := false;
    BoxPesquisarRecibo.Visible := false;

    btnNovoReciboLan.Visible := false;
  end;

operacao := '';
end;

procedure TFrmLanRecibo.buscarClienteCadRecibo;
begin
  with DM.qrPesqClienteLan do
  begin
    close;
    SQL.Clear;
    SQL.Add('select * from  TCLIENTE WHERE TCLIENTE_CODIGO like :TCLIENTE_CODIGO or TCLIENTE_NOME like :TCLIENTE_NOME');

    ParamByName('TCLIENTE_CODIGO').AsString          := edtPesquisarClienteL.Text + '%';
    ParamByName('TCLIENTE_NOME').AsString            :=  edtPesquisarClienteL.Text + '%';
    open;

  end;
end;

procedure TFrmLanRecibo.buscarClienteReciboLan;
begin
  with DM.qrPesquisarRecibo2 do
  begin
    close;
    SQL.Clear;
    SQL.Add('select * from  TRECIBO,TRECIBOITENS WHERE TRECIBO.TRECIBO_CODIGO like :TRECIBO_CODIGO or TCLIENTE_CODIGO like :TCLIENTE_CODIGO or TCLIENTE_NOME like :TCLIENTE_NOME or TRECIBO_TIPO_DESPESA like :TRECIBO_TIPO_DESPESA');
    ParamByName('TRECIBO_CODIGO').AsString           := edtPesquisarReciboEditar.Text + '%';
    ParamByName('TCLIENTE_CODIGO').AsString          := edtPesquisarReciboEditar.Text + '%';
    ParamByName('TCLIENTE_NOME').AsString            :=  edtPesquisarReciboEditar.Text + '%';
    ParamByName('TRECIBO_TIPO_DESPESA').AsString     := edtPesquisarReciboEditar.Text + '%';
    open;

  end;
end;

procedure TFrmLanRecibo.buscarDespesaTbsDespesa;
begin
  with DM.qrCadDespesa do
  begin
    close;
    SQL.Clear;
    SQL.Add('select * from  TTPDESPESA WHERE TTPDESPESA_CODIGO like :TTPDESPESA_CODIGO or TTPDESPESA_DESCR like :TTPDESPESA_DESCR or TTPDESPESA_TIPO like :TTPDESPESA_TIPO');
    ParamByName('TTPDESPESA_CODIGO').AsString           := edtPesquisarTbsDespesa.Text + '%';
    ParamByName('TTPDESPESA_DESCR').AsString          := edtPesquisarTbsDespesa.Text + '%';
    ParamByName('TTPDESPESA_TIPO').AsString            := edtPesquisarTbsDespesa.Text + '%';
    open;

  end;
end;

procedure TFrmLanRecibo.buscarTbsRecibo;
begin
  with DM.qrPesquisarRecibo2 do
  begin
    close;
    SQL.Clear;
    SQL.Add('select * from  TRECIBO,TRECIBOITENS WHERE TRECIBO.TRECIBO_CODIGO like :TRECIBO_CODIGO or TCLIENTE_CODIGO like :TCLIENTE_CODIGO or TCLIENTE_NOME like :TCLIENTE_NOME or TRECIBO_TIPO_DESPESA like :TRECIBO_TIPO_DESPESA');
    ParamByName('TRECIBO_CODIGO').AsString           := edtPesquisarRecibo.Text + '%';
    ParamByName('TCLIENTE_CODIGO').AsString          := edtPesquisarRecibo.Text + '%';
    ParamByName('TCLIENTE_NOME').AsString            :=  edtPesquisarRecibo.Text + '%';
    ParamByName('TRECIBO_TIPO_DESPESA').AsString     := edtPesquisarRecibo.Text + '%';
    open;

  end;
end;

procedure TFrmLanRecibo.btTesteClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  tbsLanRecibo.Caption   := 'LançarRecibo';
  tbsLanRecibo.TabVisible     := true;
  tbsPesquisaRecibo.TabVisible  := FALSE;
  tbsAdicionarDespesa.TabVisible := false;

  btnSalvarLan.Visible := false;
  btnCancelarReciboMenu.Visible := false;

  btnAlterarRecibo.Visible  := false;
  btnNovoReciboLan.Visible  := false;
  btnNovaDespesaLan.Visible := true;
  btnGerarRecibo.Visible    := true;
  btnEditarClienteRecibo.Visible := false;

  BoxPesquisarCliente.Visible := false;
  BoxPesquisarRecibo.Visible  := false;
  BoxRecibo.Visible := false;
  BoxItensRecibo.Visible := false;

  btnVoltar.Visible := false;
end;

procedure TFrmLanRecibo.btnCancelarReciboMenuClick(Sender: TObject);
begin
  inherited;
  BoxPesquisarCliente.Visible := false;
  BoxRecibo.Visible := false;
  BoxPesquisarRecibo.Visible := true;

  btnPesquisarRecibo.Visible := true;
  btnNovoReciboLan.Visible := true;
  btnAlterarRecibo.Visible := true;

  btnEditarClienteRecibo.Visible := false;
end;

procedure TFrmLanRecibo.btnAlterarReciboClick(Sender: TObject);
begin
  inherited;
  operacao := 'editarrecibo';

  BoxPesquisarCliente.Visible := false;
  btnEditarClienteRecibo.Visible := false;

  btnSalvarLan.Visible := true;
  btnCancelarReciboMenu.Visible := true;
  btnVoltar.Visible := true;

  btnNovoReciboLan.Visible := false;
  btnGerarRecibo.Visible := false;
  btnNovaDespesaLan.Visible := false;

  BoxPesquisarRecibo.Visible := true;
  BoxPesquisarRecibo.Caption := '';
  BoxItensRecibo.Visible := true;
  BoxRecibo.Visible := true;
  boxrecibo.Caption := '';

end;

procedure TFrmLanRecibo.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
somarTotalDespesaRecibo;
lblTotalDespesaTBSPesqRecibo.Caption := FloatToStr(xSoma);
end;

procedure TFrmLanRecibo.DBLookupComboBoxHExit(Sender: TObject);
begin
  inherited;
        if RadioGroup2.ItemIndex = 0 then
        begin
          edtCodTPDespesa.Text := DBLookupComboBoxH.KeyValue;
        end
        else
        begin
          edtCodTPDespesa.Text := DBLookupComboBoxI.KeyValue;
        end;
//            edtCodTPDespesa.Text := DBLookupComboBox1.KeyValue;
end;

procedure TFrmLanRecibo.Edit1Change(Sender: TObject);
begin
  inherited;


//valortotalrecibo := ('select Sum(TRECIBOITENS_VL) as Total from TRECIBOITENS');
//DM.qrValorTotal.SQL.Clear;
//DM.qrValorTotal.SQL.Add(valortotalrecibo);
//DM.qrValorTotal.Open;
//Edit1.text:= IntToStr(DM.qrValorTotal.FieldByName('Total').value);

end;

procedure TFrmLanRecibo.btnCancelarCadDespesaClick(Sender: TObject);
begin
  inherited;
  btnNovaDespesa.Visible := true;
  btnEditarCadDespesa.Visible := true;

end;

procedure TFrmLanRecibo.btnCancelarItensReciboClick(Sender: TObject);
begin
  inherited;
  btnNovoItemRecibo.Visible := true;
  btnEditarItensRecibo.Visible := true;
end;

procedure TFrmLanRecibo.btnCancelarReciboClick(Sender: TObject);
begin
  inherited;
  btnNovoRecibo.Visible := true;
  btnEditarRecibo.Visible := true;
end;

procedure TFrmLanRecibo.btnEditarCadDespesaClick(Sender: TObject);
begin
  inherited;
  operacao := 'editarcaddespesa';
  btnNovaDespesa.Visible := false;

end;

procedure TFrmLanRecibo.btnEditarClienteReciboClick(Sender: TObject);
begin
 operacao := 'alterarclienterecibo';

   BoxPesquisarCliente.Visible := true;
   BoxPesquisarCliente.Caption := '';
   BoxPesquisarRecibo.Visible := false;
   btnAlterarRecibo.Visible := false;
   btnGerarRecibo.Visible := false;


    BoxRecibo.Visible := true;
    BoxItensRecibo.Visible := false;

    btnNovoReciboLan.Visible := false;

end;
procedure TFrmLanRecibo.btnEditarItensReciboClick(Sender: TObject);
begin
  inherited;
   operacao := 'editarItemRecibo';
   btnNovoItemRecibo.Visible := false;
end;

procedure TFrmLanRecibo.btnEditarReciboClick(Sender: TObject);
begin
  inherited;
  operacao := 'editarrecibo';
  btnNovoRecibo.Visible := false;
end;

procedure TFrmLanRecibo.btnEmitirReciboClick(Sender: TObject);
begin
  inherited;
    PageControl1.TabIndex := 1;
  tbsLanRecibo.Caption := 'LançarRecibo';
  tbsLanRecibo.TabVisible := true;
  tbsPesquisaRecibo.TabVisible := FALSE;
  tbsAdicionarDespesa.TabVisible := false;

  btnSalvarLan.Visible := false;
  btnCancelarReciboMenu.Visible := false;

  btnAlterarRecibo.Visible := true;
  btnNovoReciboLan.Visible := true;
  btnNovaDespesaLan.Visible := true;
  btnGerarRecibo.Visible := true;
  btnEditarClienteRecibo.Visible := false;

  BoxPesquisarCliente.Visible := false;
  BoxPesquisarRecibo.Visible  := false;
  BoxRecibo.Visible := false;
  BoxItensRecibo.Visible := false;



end;

procedure TFrmLanRecibo.btnGerarReciboClick(Sender: TObject);
begin
  inherited;
  operacao := 'gerarrecibo';

  btnNovoReciboLan.Visible := true;
  btnNovaDespesaLan.Visible := false;
  btnAlterarRecibo.Visible := true;

  BoxPesquisarCliente.Visible := false;
  btnEditarClienteRecibo.Visible := true;

  btnSalvarLan.Visible := true;
  btnCancelarReciboMenu.Visible := true;
  btnVoltar.Visible := true;

  BoxPesquisarRecibo.Visible := true;
  BoxPesquisarRecibo.Caption := '';
  BoxItensRecibo.Visible := true;
  BoxRecibo.Visible := true;
  boxRecibo.Caption := '';

end;

procedure TFrmLanRecibo.btnNovoItemReciboClick(Sender: TObject);
begin
  inherited;
  operacao := 'novoItemRecibo';
  btnEditarItensRecibo.Visible := false;

end;

//salva os dados do cadastro de despesa
procedure TFrmLanRecibo.editardadosCadDespesa;
begin

//   if (RadioGroup1.ItemIndex = 0) then
//  begin
//      honorario := 'H';
//      auxdespesa := honorario
//  end;
//
//  if (RadioGroup1.ItemIndex = 1)then
//  begin
//    imposto := 'I';
//    auxdespesa := imposto;
//  end;
//
//  DM.qrCadDespesa.SQL.Clear;
//    //comando de verificação de credencias dentro do banco de dados
//  DM.qrCadDespesa.SQL.Add('select * from TTPDESPESA TTPD where TTPDESPESA_DESCR ='
//                        + QuotedStr(edtDescrDespesaCadD.Text) + 'and TTPDESPESA_TIPO = ' + QuotedStr(auxdespesa));
//  DM.qrCadDespesa.Open;
//
//    if  not (DM.qrCadDespesa.Eof) then
//  begin
  DM.qrCadDespesa.Close;
  DM.qrCadDespesa.SQL.Clear;

  DM.qrCadDespesa.SQL.Add('UPDATE TTPDESPESA set TTPDESPESA_DESCR = :TTPDESPESA_DESCR, TTPDESPESA_TIPO = :TTPDESPESA_TIPO WHERE TTPDESPESA_CODIGO = :TTPDESPESA_CODIGO');

  DM.qrCadDespesa.ParamByName('TTPDESPESA_CODIGO').AsString    := Label16.Caption;
  DM.qrCadDespesa.ParamByName('TTPDESPESA_DESCR').AsString    := edtDescrDespesaCadD.Text;

   if (RadioGroup1.ItemIndex = 0) then
  begin
      honorario := 'H';
     DM.qrCadDespesa.ParamByName('TTPDESPESA_TIPO').AsString    := honorario;
  end;

  if (RadioGroup1.ItemIndex = 1)then
  begin
    imposto := 'I';
    DM.qrCadDespesa.ParamByName('TTPDESPESA_TIPO').AsString    := imposto;
  end;


    try
    DM.qrCadDespesa.ExecSQL();
    ShowMessage('Salvo com Sucesso!');
    Exit;
    except on E: Exception do
      begin
      ShowMessage('Erro na operação.');
      Exit;
      end;
     end;
    end;


procedure TFrmLanRecibo.editardadosRecibo;
begin
  DM.qrRecibo.Close;
  DM.qrRecibo.SQL.Clear;

  DM.qrRecibo.SQL.Add('UPDATE TRECIBO set TCLIENTE_CODIGO = :TCLIENTE_CODIGO,');
  DM.qrRecibo.SQL.Add('TCLIENTE_NOME = :TCLIENTE_NOME,');
  DM.qrRecibo.SQL.Add('TRECIBO_TIPO_DESPESA = :TRECIBO_TIPO_DESPESA,');
  DM.qrRecibo.SQL.Add('TRECIBO_VL_TOTAL = :TRECIBO_VL_TOTAL,');
  DM.qrRecibo.SQL.Add('TRECIBO_DATAREFERENCIA = :TRECIBO_DATAREFERENCIA');
  DM.qrRecibo.SQL.Add('WHERE TRECIBO_CODIGO = :TRECIBO_CODIGO');

  DM.qrRecibo.ParamByName('TRECIBO_CODIGO').AsString    := edtCodRecibo2.Text;
  DM.qrRecibo.ParamByName('TCLIENTE_CODIGO').AsString    := Label3.Caption;
  DM.qrRecibo.ParamByName('TCLIENTE_NOME').AsString    := Label5.Caption;
  DM.qrRecibo.ParamByName('TRECIBO_VL_TOTAL').AsFloat    := StrToFloat( edtValorTotal.Text);

  //  DM.qrRecibo.ParamByName('TRECIBO_VL_TOTAL').AsFloat    := StrToFloat( edtValorTotal.Text);
// DM.qrRecibo.ExecSQL('UPDATE TRECIBO set TRECIBO_VL_TOTAL = :TRECIBO_VL_TOTAL WHERE TRECIBOITENS_CODIGO = :TRECIBOITENS_CODIGO') := valortotalrecibo;
  DM.qrRecibo.ParamByName('TRECIBO_DATAREFERENCIA').AsDate    := DateTimePicker1.Date;

   if (RadioGroup2.ItemIndex = 0) then
  begin
      honorario := 'H';
     DM.qrRecibo.ParamByName('TRECIBO_TIPO_DESPESA').AsString    := honorario;
  end;

  if (RadioGroup2.ItemIndex = 1)then
  begin
    imposto := 'I';
    DM.qrRecibo.ParamByName('TRECIBO_TIPO_DESPESA').AsString    := imposto;
  end;

//  DM.qrRecibo.ExecSQL();
      try
      DM.qrRecibo.ExecSQL();
      ShowMessage('Editado com Sucesso!');
      Exit;
      except on E: Exception do
      begin
      ShowMessage('Erro na operação.');
      Exit;
      end;
     end;
  end;

procedure TFrmLanRecibo.editardadosRecItens;
begin
  DM.qryAux.Close;
  DM.qryAux.SQL.Clear;

  DM.qryAux.SQL.Add('UPDATE TRECIBOITENS set TTPDESPESA_CODIGO = :TTPDESPESA_CODIGO,');
  DM.qryAux.SQL.Add('TTPDESPESA_DESCR = :TTPDESPESA_DESCR,');
  DM.qryAux.SQL.Add('TRECIBOITENS_VL = :TRECIBOITENS_VL');
  DM.qryAux.SQL.Add('WHERE TRECIBOITENS_CODIGO = :TRECIBOITENS_CODIGO');

  DM.qryAux.ParamByName('TRECIBOITENS_CODIGO').AsString    := edtCodReciboItens.Text;
  DM.qryAux.ParamByName('TTPDESPESA_CODIGO').AsString    := edtCodTPDespesa.Text;

  if RadioGroup2.ItemIndex = 0 then
     begin
      DM.qryAux.ParamByName('TTPDESPESA_DESCR').AsString    := DBLookupComboBoxH.Text;
     end
     else
     begin
      DM.qryAux.ParamByName('TTPDESPESA_DESCR').AsString    := DBLookupComboBoxI.Text;
     end;

  DM.qryAux.ParamByName('TRECIBOITENS_VL').AsFloat    := StrToFloat(edtValor.Text);

//  DM.qryAux.ExecSQL();
        try
      DM.qryAux.ExecSQL();
      ShowMessage('Editado com Sucesso!');
      Exit;
      except on E: Exception do
      begin
      ShowMessage('Erro na operação.');
      Exit;
      end;
     end;
end;

procedure TFrmLanRecibo.edtPesquisarClienteLChange(Sender: TObject);
begin
  inherited;
buscarClienteCadRecibo;
end;

procedure TFrmLanRecibo.edtPesquisarReciboChange(Sender: TObject);
begin
  inherited;
  buscarTbsRecibo;
end;

procedure TFrmLanRecibo.edtPesquisarReciboEditarChange(Sender: TObject);
begin
  inherited;
buscarClienteReciboLan;
end;

procedure TFrmLanRecibo.edtPesquisarTbsDespesaChange(Sender: TObject);
begin
  inherited;
  buscarDespesaTbsDespesa;
end;

procedure TFrmLanRecibo.enviardadosdespesa;
begin
//  if (Label3.Caption = '') or (Label5.Caption = '') then
//    begin
//      ShowMessage('Cliente não foi selecionado!');
//      Abort
//    end;


  DM.qrCadDespesa.SQL.Clear;
  DM.qrCadDespesa.SQL.Add('select * from TTPDESPESA TTPD where TTPDESPESA_DESCR ='
                        + QuotedStr(edtDescrDespesaCadD.Text));
  DM.qrCadDespesa.Open;

  if (DM.qrCadDespesa.Eof) then
  begin
  DM.qrCadDespesa.close;
  DM.qrCadDespesa.SQL.Clear;
  DM.qrCadDespesa.SQL.Add('INSERT INTO TTPDESPESA (TTPDESPESA_DESCR,');
  DM.qrCadDespesa.SQL.Add('TTPDESPESA_TIPO)');
  DM.qrCadDespesa.SQL.Add(' VALUES (:TTPDESPESA_DESCR,');
  DM.qrCadDespesa.SQL.Add(' :TTPDESPESA_TIPO)');

  DM.qrCadDespesa.ParamByName('TTPDESPESA_DESCR').AsString    := edtDescrDespesaCadD.Text;

   if (RadioGroup1.ItemIndex = 0) then
  begin
      honorario := 'H';
     DM.qrCadDespesa.ParamByName('TTPDESPESA_TIPO').AsString    := honorario;
  end;

  if (RadioGroup1.ItemIndex = 1)then
  begin
    imposto := 'I';
    DM.qrCadDespesa.ParamByName('TTPDESPESA_TIPO').AsString    := imposto;
  end;

//  DM.qrCadDespesa.ExecSQL();

    try
    DM.qrCadDespesa.ExecSQL();
    ShowMessage('Salvo com Sucesso!');
    Exit;
    except on E: Exception do
   begin
   ShowMessage('Erro na operação.');
     Exit;
    end;
   end;
  end
  else
  begin
  ShowMessage('Erro! A despesa já existe!')
  end;
end;


//salva os dados na tabela TRECIBOITENS
procedure TFrmLanRecibo.enviardadositens;
begin

    if (Label3.Caption = '') or (Label5.Caption = '') then
    begin
      ShowMessage('Cliente não foi selecionado!');
      Abort
    end;

  DM.qryAux.close;
  DM.qryAux.SQL.Clear;
  DM.qryAux.SQL.Add('INSERT INTO TRECIBOITENS (TRECIBO_CODIGO, TTPDESPESA_CODIGO , TTPDESPESA_DESCR, TRECIBOITENS_VL) values (:TRECIBO_CODIGO, :TTPDESPESA_CODIGO, :TTPDESPESA_DESCR, :TRECIBOITENS_VL)');

  DM.qryAux.ParamByName('TRECIBO_CODIGO').AsString    := edtCodRecibo.Text;
  DM.qryAux.ParamByName('TTPDESPESA_CODIGO').AsString    := edtCodTPDespesa.Text;
    if RadioGroup2.ItemIndex = 0 then
     begin
      DM.qryAux.ParamByName('TTPDESPESA_DESCR').AsString    := DBLookupComboBoxH.Text;
     end
     else
     begin
      DM.qryAux.ParamByName('TTPDESPESA_DESCR').AsString    := DBLookupComboBoxI.Text;
     end;

    DM.qryAux.ParamByName('TRECIBOITENS_VL').AsFloat    := StrToFloat(edtValor.Text);




 // valortotalrecibo := DM.qrValorTotal.ExecSQL('SELECT SUM(TRECIBOITENS_VL) AS Total FROM TRECIBOITENS where TRECIBO_CODIGO = ' + (edtCodRecibo2.Text));


//  edtValorTotal.Text := FloatToStr( Valortotalrecibo);

 //DM.qrRecibo.ExecSQL('UPDATE TRECIBO set TRECIBO_VL_TOTAL = :TRECIBO_VL_TOTAL') := valortotalrecibo;



 // DM.qryAux.ExecSQL();
    try
    DM.qryAux.ExecSQL();
    ShowMessage('Salvo com Sucesso!');
    Exit;
    except on E: Exception do
   begin
   ShowMessage('Error na operação.');
     Exit;
    end
  else
  begin
  ShowMessage('CNPJ já cadastrado!')
  end;
  end;
end;

procedure TFrmLanRecibo.enviardadosrecibo;
begin
      if (Label3.Caption = '') or (Label5.Caption = '') then
    begin
      ShowMessage('Cliente não foi selecionado!');
      Abort
    end;

  DM.qrRecibo.close;
  DM.qrRecibo.SQL.Clear;
  DM.qrRecibo.SQL.Add('INSERT INTO TRECIBO (TCLIENTE_CODIGO, TCLIENTE_NOME, TRECIBO_TIPO_DESPESA, TRECIBO_VL_TOTAL, TRECIBO_DATAREFERENCIA) values (:TCLIENTE_CODIGO, :TCLIENTE_NOME, :TRECIBO_TIPO_DESPESA, :TRECIBO_VL_TOTAL, :TRECIBO_DATAREFERENCIA)');

  DM.qrRecibo.ParamByName('TCLIENTE_CODIGO').AsString    := Label3.Caption;
  DM.qrRecibo.ParamByName('TCLIENTE_NOME').AsString    := Label5.Caption;
  DM.qrRecibo.ParamByName('TRECIBO_VL_TOTAL').AsFloat    := StrToFloat(edtValorTotal.Text);
  DM.qrRecibo.ParamByName('TRECIBO_DATAREFERENCIA').AsDate    := DateTimePicker1.Date;


     if (RadioGroup2.ItemIndex = 0) then
  begin
      honorario := 'H';
     DM.qrRecibo.ParamByName('TRECIBO_TIPO_DESPESA').AsString    := honorario;
  end;

  if (RadioGroup2.ItemIndex = 1)then
  begin
    imposto := 'I';
    DM.qrRecibo.ParamByName('TRECIBO_TIPO_DESPESA').AsString    := imposto;
  end;

//  DM.qrRecibo.ExecSQL();
        try
      DM.qrRecibo.ExecSQL();
      ShowMessage('Salvo com Sucesso!');
      Exit;
      except on E: Exception do
      begin
      ShowMessage('Erro na operação.');
      Exit;
      end;
     end;
end;

procedure TFrmLanRecibo.FormShow(Sender: TObject);
begin
  inherited;

  //atualiza o grid do cadastro do cliente
  DM.qrPesqClienteLan.close;
  DM.qrPesqClienteLan.SQL.Clear;
  DM.qrPesqClienteLan.SQL.Add('select TCLIENTE_CODIGO, TCLIENTE_NOME from TCLIENTE');
  DM.qrPesqClienteLan.open;
   //----------------------------------------------
  atualizabancoCadDespesa;
  atualizabancoItem;
  atualizabancoRecibo;
  atualizabancoPesquisaRecibo;
  AtualizabancoQrLookupI;
  AtualizabancoQrLookupH;
  itensinvisiveisBoxRecibo;
  itensinvisiveisBoxItensRecibo;
  itensinvisiveisTbsCadDespesa;
  atualizabancoqrBuscarRecibo;
  atualizabancoQrPesquisarClienteLan;
  inicializarLancamento;

  atualizabancoqrPesquisarReciboLan;




end;

procedure TFrmLanRecibo.GridCadClienteLanCellClick(Column: TColumn);
begin
  inherited;
  preenchecampocliente;
end;

procedure TFrmLanRecibo.GridCadDespesaCellClick(Column: TColumn);
begin
  inherited;
  preenchecampoCadDespesa;
end;

procedure TFrmLanRecibo.GridItemDespesaCellClick(Column: TColumn);
begin
  inherited;
  preenchercampoRecItens;
end;

procedure TFrmLanRecibo.GridReciboEditarCellClick(Column: TColumn);
begin
  inherited;
  preenchercampoRecibo;
  somarTotalDespesaRecibo;

//  if edtCodRecibo2.Text = edtCodRecibo.Text then
//    begin
//         if not dm.qrRecItens.IsEmpty then
//          begin
//            while not dm.qrRecItens.Eof do
//              begin
//              if((dm.qrRecItens.FieldByName('TRECIBO_CODIGO').AsString) = edtCodRecibo2.Text)then
//              ValorTotalRecibo := ValorTotalRecibo + dm.qrRecItens.FieldByName('TRECIBOITENS_VL').Value;
//              dm.qrRecItens.Next;
// //             edtValorTotal.Text :=  FloatToStr(ValorTotalRecibo);
//
//              end;
//
//          end;
//    end;
//
//  edtValorTotal.Text :=  FloatToStr(ValorTotalRecibo);

end;



procedure TFrmLanRecibo.inicializarLancamento;
begin
    btnSalvarLan.visible := false;
    btnAlterarRecibo.Visible := false;
    btnNovaDespesaLan.Visible := false;
    btnNovoReciboLan.Visible := false;
    btnGerarRecibo.visible := false;
    btnVoltar.Visible := false;
    btnCancelarReciboMenu.visible := false;


    tbsLanRecibo.Tabvisible := false;
    tbsAdicionarDespesa.Tabvisible := false;

    PageControl1.TabIndex := 0;
end;

procedure TFrmLanRecibo.itensinvisiveisBoxItensRecibo;
begin
     edtCodRecibo.Enabled      := false;
     edtCodReciboItens.Enabled := false;
     edtCodTPDespesa.Enabled   := false;
     edtCodReciboItens.Visible := false;
     edtCodTPDespesa.Visible   := false;

     Label21.Visible := false;
     Label23.Visible := false;

end;

procedure TFrmLanRecibo.itensinvisiveisBoxRecibo;
begin
    edtCodRecibo2.Enabled := false;
    edtValorTotal.Enabled := false;
end;

procedure TFrmLanRecibo.itensinvisiveisTbsCadDespesa;
begin
  Label15.Visible := false;
  Label16.Visible := false;
end;

procedure TFrmLanRecibo.pesquisarDadosRecibo;
begin
     with DM.qrRecibo do
  begin
    close;
    SQL.Clear;
   SQL.Add('select * from TRECIBO WHERE TRECIBO_CODIGO like :TRECIBO_CODIGO or TCLIENTE_NOME like :TCLIENTE_NOME or TCLIENTE_CODIGO like :TCLIENTE_CODIGO');

//   SQL.Add('SELECT TRECIBO.TRECIBO_CODIGO ,TRECIBO.TCLIENTE_CODIGO, TRECIBO.TCLIENTE_NOME');
//   SQL.Add('FROM TRECIBOITENS join TRECIBO on');
//   SQL.Add('TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBOITENS_CODIGO');


    ParamByName('TRECIBO_CODIGO').AsString  := '%' + edtPesquisarRecibo.Text + '%';
    ParamByName('TCLIENTE_NOME').AsString   :=  '%' + edtPesquisarRecibo.Text + '%';
    ParamByName('TCLIENTE_CODIGO').AsString := '%' + edtPesquisarRecibo.Text + '%';

    open;
  end;
end;

procedure TFrmLanRecibo.pesquisarReciboTBSPesqRecibo;
begin
xVariavelCodigo := DM.qrPesquisarRecibo2.fieldbyname('TRECIBO_CODIGO').asinteger;
XSoma := 0;

DM.qrPesquisarRecibo2.FIRST;

while not (DM.qrPesquisarRecibo2.eof) do
BEGIN
    if DM.qrPesquisarRecibo2.fieldByNAME('TRECIBO_CODIGO').AsINTEGER = xVariavelCodigo THEN
    BEGIN
         XSoma := XSoma  + DM.qrPesquisarRecibo2.fieldByNAME('TRECIBOITENS_VL').AsFloat;
         DM.qrPesquisarRecibo2.next;
    END

    else
    BEGIN
         DM.qrPesquisarRecibo2.next;
    end;

end;

edtValorTotal.Text := FloatToStr(XSoma);
end;

procedure TFrmLanRecibo.preenchecampoCadDespesa;
begin
  if GridCadDespesa.Fields[0].Value <> NULL then
    Label16.Caption := GridCadDespesa.Fields[0].Value;
  if GridCadDespesa.Fields[1].Value <> NULL then
    edtDescrDespesaCadD.Text := GridCadDespesa.Fields[1].Value;
end;

procedure TFrmLanRecibo.preenchecampocliente;
begin
  if GridCadClienteLan.Fields[0].Value <> NULL then
    Label3.Caption := GridCadClienteLan.Fields[0].Value;
  if GridCadClienteLan.Fields[1].Value <> NULL then
    Label5.Caption := GridCadClienteLan.Fields[1].Value;
end;

procedure TFrmLanRecibo.preenchecampoTipoItemDepesa;
begin
  if GridReciboEditar.Fields[0].Value <> NULL then
    edtCodRecibo.Text := GridReciboEditar.Fields[0].Value;
end;

procedure TFrmLanRecibo.preenchercampoRecibo;
begin
  if GridReciboEditar.Fields[0].Value <> NULL then
    DateTimePicker1.Date := GridReciboEditar.Fields[0].Value;


  if GridReciboEditar.Fields[1].Value <> NULL then
    edtCodRecibo2.Text := GridReciboEditar.Fields[1].Value;


  if GridReciboEditar.Fields[2].Value <> NULL then
    Label3.Caption := GridReciboEditar.Fields[2].Value;

  if GridReciboEditar.Fields[3].Value <> NULL then
    Label5.Caption := GridReciboEditar.Fields[3].Value;

    edtCodRecibo.Text := edtCodRecibo2.Text;

  if GridReciboEditar.Fields[6].Value <> NULL then
    edtValor.Text := GridReciboEditar.Fields[6].Value;

  if GridReciboEditar.Fields[7].Value <> NULL then
    edtValorTotal.Text := GridReciboEditar.Fields[7].Value;

//    lblTotalTeste.caption := floatToStr(valortotalrecibo);

    if GridReciboEditar.Fields[8].Value <> NULL then
    edtCodRecibo.Text := GridReciboEditar.Fields[8].Value;

  if GridReciboEditar.Fields[9].Value <> NULL then
    edtCodTPDespesa.Text := GridReciboEditar.Fields[9].Value;

  if GridReciboEditar.Fields[10].Value <> NULL then
    edtCodReciboItens.Text := GridReciboEditar.Fields[10].Value;


end;

procedure TFrmLanRecibo.preenchercampoRecItens;
begin
  if GridItemDespesa.Fields[0].Value <> NULL then
    edtCodRecibo.Text := GridItemDespesa.Fields[0].Value;
  if GridItemDespesa.Fields[1].Value <> NULL then
    edtCodTPDespesa.Text := GridItemDespesa.Fields[1].Value;
  if GridItemDespesa.Fields[3].Value <> NULL then
    edtValor.Text := GridItemDespesa.Fields[3].Value;
  if GridItemDespesa.Fields[4].Value <> NULL then
    edtCodReciboItens.Text := GridItemDespesa.Fields[4].Value;

end;

procedure TFrmLanRecibo.RadioGroup2Click(Sender: TObject);
begin
  inherited;

 if (RadioGroup2.ItemIndex = 0) then
  begin
  DBLookupComboBoxI.visible := false;
  DBLookupComboBoxH.visible := true;
  end

  else
  begin
  DBLookupComboBoxI.visible := true;
  DBLookupComboBoxH.visible := false;
  end;
end;

procedure TFrmLanRecibo.somarTotalDespesaClienteTBSPesqRecibo;
begin

end;

procedure TFrmLanRecibo.somarTotalDespesaRecibo;
begin
xVariavelCodigo := DM.qrPesquisarRecibo2.fieldbyname('TRECIBO_CODIGO').asinteger;
XSoma := 0;

DM.qrPesquisarRecibo2.FIRST;

while not (DM.qrPesquisarRecibo2.eof) do
BEGIN
    if DM.qrPesquisarRecibo2.fieldByNAME('TRECIBO_CODIGO').AsINTEGER = xVariavelCodigo THEN
    BEGIN
         XSoma := XSoma  + DM.qrPesquisarRecibo2.fieldByNAME('TRECIBOITENS_VL').AsFloat;
         DM.qrPesquisarRecibo2.next;
    END

    else
    BEGIN
         DM.qrPesquisarRecibo2.next;
    end;

end;

edtValorTotal.Text := FloatToStr(XSoma);
end;

end.
