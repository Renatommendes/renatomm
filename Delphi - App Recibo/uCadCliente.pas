unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroModelo, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uDM, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmCadCliente = class(TFrmCadastroModelo)
    PageControl1: TPageControl;
    tbsCadCliente: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtNomeC: TEdit;
    edtRazaoSocialC: TEdit;
    edtEmailC: TEdit;
    edtTelefoneC: TEdit;
    edtCelularC: TEdit;
    edtLogradouroC: TEdit;
    edtBairroC: TEdit;
    edtNumeroC: TEdit;
    edtCidadeC: TEdit;
    edtEstadoC: TEdit;
    edtObservacaoC: TEdit;
    Label15: TLabel;
    edtComplementoC: TEdit;
    btnPesquisar: TButton;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    GridCliente: TDBGrid;
    edtPesquisarC: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    edtCodClienteC: TEdit;
    Label18: TLabel;
    edtRgIeC: TMaskEdit;
    edtCpfCnpjC: TMaskEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridClienteCellClick(Column: TColumn);
    procedure edtCpfCnpjCExit(Sender: TObject);
    procedure edtEmailCExit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure edtPesquisarCChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    operacao : String;
    procedure enviardadosC;
    procedure atualizabancoC;
    procedure preenchercampoC;
    procedure editardadosC;
    procedure escondecampo;
    procedure exibecampo;
    procedure habilitacampo;
    procedure limpacampoC;
    procedure buscarClienteCadCliente;
    procedure inicializarTelaCliente;

    function ApenasNumerosStr(pStr:String): String;
    function IIf(pCond:Boolean;pTrue,pFalse:Variant): Variant;
    function CalculaCnpjCpf(Numero : String) : Boolean;
    function validaEmail(email: string): boolean;
    function validarCadastro:boolean;

  end;

var
  FrmCadCliente: TFrmCadCliente;
  pf : String;
  pj : String;

implementation

{$R *.dfm}

function  TFrmCadCliente.validarCadastro;
var
cpf : string;
begin
  dm.qrCliente.Close;
  dm.qrCliente.SQL.clear;
  dm.qrCliente.SQL.Add('SELECT * FROM tcliente where TCLIENTE_CPF_CNPJ = ' + QuotedStr(Trim(edtCpfCnpjC.Text)));
  dm.qrCliente.Open;
  if  not dm.qrCliente.IsEmpty then
  begin
    cpf := dm.qrCliente['TCLIENTE_CPF_CNPJ'];
    MessageDlg('O CPF ou CNPJ: '+ cpf + ' já está cadastrado!', mtInformation, mbOKCancel,0);
    edtCpfCnpjC.Text := '';
    //EditarEdtCPFouCNPJ.SetFocus;
    //edtCPFouCNPJ.SetFocus;
    result := true;
  end;
end;


function TFrmCadCliente.CalculaCnpjCpf(Numero: String): Boolean;
Var
i,d,b,
Digito : Byte;
Soma : Integer;
CNPJ : Boolean;
DgPass,
DgCalc : String;
begin
  Result := False;
  Numero := ApenasNumerosStr(Numero);
  // Caso o número não seja 11 (CPF) ou 14 (CNPJ), aborta
  Case Length(Numero) of
    11: CNPJ := False;
    14: CNPJ := True;
  else Exit;
  end;
  // Separa o número do digito
  DgCalc := '';
  DgPass := Copy(Numero,Length(Numero)-1,2);
  Numero := Copy(Numero,1,Length(Numero)-2);
  // Calcula o digito 1 e 2
  For d := 1 to 2 do begin
    B := IIF(D=1,2,3); // BYTE
    SOMA := IIF(D=1,0,STRTOINTDEF(DGCALC,0)*2);
    for i := Length(Numero) downto 1 do begin
      Soma := Soma + (Ord(Numero[I])-Ord('0'))*b;
      Inc(b);
      If (b > 9) And CNPJ Then
        b := 2;
    end;
   Digito := 11 - Soma mod 11;
   If Digito >= 10 then
     Digito := 0;
   DgCalc := DgCalc + Chr(Digito + Ord('0'));
  end;
  Result := DgCalc = DgPass;
end;

function TFrmCadCliente.IIf(pCond: Boolean; pTrue,
  pFalse: Variant): Variant;
  begin
  If pCond Then Result := pTrue
  else Result := pFalse;
end;

procedure TFrmCadCliente.inicializarTelaCliente;
begin
btnSalvar.Visible := false;
btnCancelar.Visible := false;
end;

function TFrmCadCliente.ApenasNumerosStr(pStr: String): String;
Var
I: Integer;
begin
  Result := '';
  For I := 1 To Length(pStr) do
   If pStr[I] In ['1','2','3','4','5','6','7','8','9','0'] Then
     Result := Result + pStr[I];
end;

function TFrmCadCliente.validaEmail(email: string): boolean;
var
i: integer;
aux: integer;
begin
  result := false;
  aux :=0;
  for i := 0 to Length(email) do
    if(email[i] = '@')then
    begin
      aux:= aux+1;
    end;

    if (aux =1) then
    begin
      result := true;
    end
end;

procedure TFrmCadCliente.atualizabancoC;
begin
  DM.qrCliente.close;
  DM.qrCliente.SQL.Clear;
  DM.qrCliente.SQL.Add('select * from TCLIENTE');
  DM.qrCliente.open;
end;

procedure TFrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpacampoC;

btnPesquisar.Enabled := True;
btnNovo.Enabled := True;
btnEditar.Enabled := True;
btnPesquisar.visible := True;
btnNovo.visible := True;
btnEditar.visible := True;

end;

procedure TFrmCadCliente.btnEditarClick(Sender: TObject);
begin
  inherited;
  limpacampoC;

  tbsCadCliente.Caption := 'Editar Cliente';
  btnSalvar.Visible    := true;
  btnCancelar.Visible  := true;
  btnNovo.visible    := false;
  btnPesquisar.visible  := false;
//-------------------------------------
  exibecampo;
  GridCliente.Visible := true;
  Label16.Visible := true;
  Label17.Visible := true;
  edtPesquisarC.Visible := true;
  label18.enabled := false;
  edtCodClienteC.Enabled := false;
//-------------------------------------


  operacao := 'editar';

end;

procedure TFrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  limpacampoC;
  tbsCadCliente.Caption := 'Cadastrar Novo Cliente';
  exibecampo;
  GridCliente.Visible := false;
  Label16.Visible := false;
  Label17.Visible := false;
  Label18.Visible := false;
  edtPesquisarC.Visible := false;
  edtCodClienteC.Visible := false;

//-------------------------------------
  btnSalvar.Visible   := true;
  btnCancelar.Visible := true;
  btnEditar.visible   := false;
  btnPesquisar.visible   := false;
//-------------------------------------
  operacao := 'novo';

//  tbsCadCliente.Enabled         := true;
//  tbsCadCliente.TabVisible      := true;
//  tbsPesquisaCliente.TabVisible := false;
//  PageControl1.TabIndex         := 0;

end;

procedure TFrmCadCliente.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  limpacampoC;
  atualizabancoC;
//-------------------------------------
  tbsCadCliente.Caption := 'Pesquisar';
  GridCliente.Visible := true;
  Label16.Visible := true;
  Label17.Visible := false;
  edtPesquisarC.Visible := true;
//-------------------------------------
  btnSalvar.Visible    := false;
  btnCancelar.Visible  := false;
//-------------------------------------
  escondecampo;

//    tbsPesquisaCliente.TabVisible := true;
//    PageControl1.TabIndex := 0;
//    tbsCadCliente.Enabled := false;
//    tbsCadCliente.TabVisible := false;
//
//  tbsCadCliente.TabVisible := false;
end;

procedure TFrmCadCliente.btnSalvarClick(Sender: TObject);
begin
  inherited;
//  if (validarCadastro) then
//  begin
//    exit
//  end;

  if operacao = 'novo' then
  begin
    if (validarCadastro) then
    begin
    exit
    end;
  enviardadosC;
  end;

  if operacao = 'editar' then
  begin
    if (validarCadastro) then
    begin
    exit
    end;
        editardadosC;
  end;


atualizabancoC;
//operacao := '';
//habilitacampoR(false);
//limpacampoC;
end;

procedure TFrmCadCliente.buscarClienteCadCliente;
begin
  with DM.qrCliente do
  begin
    close;
    SQL.Clear;
   SQL.Add('select * from TCLIENTE WHERE TCLIENTE_CODIGO like :TCLIENTE_CODIGO or TCLIENTE_NOME like :TCLIENTE_NOME');

//   SQL.Add('SELECT TRECIBO.TRECIBO_CODIGO ,TRECIBO.TCLIENTE_CODIGO, TRECIBO.TCLIENTE_NOME');
//   SQL.Add('FROM TRECIBOITENS join TRECIBO on');
//   SQL.Add('TRECIBO.TRECIBO_CODIGO = TRECIBOITENS.TRECIBOITENS_CODIGO');

    ParamByName('TCLIENTE_NOME').AsString :=  '%' + edtPesquisarC.Text + '%';
    ParamByName('TCLIENTE_CODIGO').AsString := '%' + edtPesquisarC.Text + '%';

    open;
  end;
end;

procedure TFrmCadCliente.editardadosC;
begin
DM.qrCliente.Close;
DM.qrCliente.SQL.Clear;
//DM.qrCliente.SQL.Add('UPDATE RecHonorario set  servicosh = :servicosh, transporteh = :transporteh, documentoh = :documentoh, extrash = :extrash, totalhonorarioh = :totalhonorarioh, datah1 = :datah1 where CodHon = :CodHon');
//DM.qrCliente.SQL.Add('UPDATE TCLIENTE set  servicosh = :servicosh, transporteh = :transporteh, documentoh = :documentoh, extrash = :extrash, totalhonorarioh = :totalhonorarioh, datah1 = :datah1 where CodHon = :CodHon');

  DM.qrCliente.SQL.Add('UPDATE TCLIENTE set TCLIENTE_NOME = :TCLIENTE_NOME,');
  DM.qrCliente.SQL.Add('TCLIENTE_RAZAOSOCIAL = :TCLIENTE_RAZAOSOCIAL,');
  DM.qrCliente.SQL.Add('TCLIENTE_RG_IE = :TCLIENTE_RG_IE,');
  DM.qrCliente.SQL.Add('TCLIENTE_CPF_CNPJ = :TCLIENTE_CPF_CNPJ,');
  DM.qrCliente.SQL.Add('TCLIENTE_TIPOPESSOA = :TCLIENTE_TIPOPESSOA,');

  DM.qrCliente.SQL.Add('TCLIENTE_EMAIL = :TCLIENTE_EMAIL,');
  DM.qrCliente.SQL.Add('TCLIENTE_TELEFONE = :TCLIENTE_TELEFONE,');
  DM.qrCliente.SQL.Add('TCLIENTE_CELULAR = :TCLIENTE_CELULAR,');
  DM.qrCliente.SQL.Add('TCLIENTE_LOGRADOURO = :TCLIENTE_LOGRADOURO,');
  DM.qrCliente.SQL.Add('TCLIENTE_NUM = :TCLIENTE_NUM,');
  DM.qrCliente.SQL.Add('TCLIENTE_COMPLEMENTO = :TCLIENTE_COMPLEMENTO,');
  DM.qrCliente.SQL.Add('TCLIENTE_BAIRRO = :TCLIENTE_BAIRRO,');
  DM.qrCliente.SQL.Add('TCLIENTE_CIDADE = :TCLIENTE_CIDADE,');
  DM.qrCliente.SQL.Add('TCLIENTE_ESTADO = :TCLIENTE_ESTADO,');
  DM.qrCliente.SQL.Add('TCLIENTE_DATACADASTRO = :TCLIENTE_DATACADASTRO,');
  DM.qrCliente.SQL.Add('TCLIENTE_OBS = :TCLIENTE_OBS');
  DM.qrCliente.SQL.Add('where TCLIENTE_CODIGO = :TCLIENTE_CODIGO');

  DM.qrCliente.ParamByName('TCLIENTE_CODIGO').AsString    := edtCodClienteC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_NOME').AsString     := edtNomeC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_RAZAOSOCIAL').AsString    := edtRazaoSocialC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_RG_IE').AsString        := edtRgIeC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_CPF_CNPJ').AsString        := edtCpfCnpjC.Text;
    if (RadioGroup1.ItemIndex = 0) then
  begin
      pf := 'PF';
     DM.qrCliente.ParamByName('TCLIENTE_TIPOPESSOA').AsString    := pf;
  end;

  if (RadioGroup1.ItemIndex = 1)then
  begin
    pj := 'PJ';
    DM.qrCliente.ParamByName('TCLIENTE_TIPOPESSOA').AsString    := pj;
  end;
  DM.qrCliente.ParamByName('TCLIENTE_EMAIL').AsString    := edtEmailC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_TELEFONE').AsString    := edtTelefoneC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_CELULAR').AsString    := edtCelularC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_LOGRADOURO').AsString    := edtLogradouroC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_NUM').AsString    := edtNumeroC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_COMPLEMENTO').AsString    := edtComplementoC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_BAIRRO').AsString    := edtBairroC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_CIDADE').AsString    := edtCidadeC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_ESTADO').AsString    := edtEstadoC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_DATACADASTRO').AsDate    := DateTimePicker1.Date;
  DM.qrCliente.ParamByName('TCLIENTE_OBS').AsString    := edtObservacaoC.Text;

//DM.qrCliente.ParamByName('CodHon').AsString     := edtCodHon.Text;
//DM.qrCliente.ParamByName('servicosh').AsString      := edtServicoH.Text; //parambyname é o que converte o tipo de variavel do edit e leva para o banco de dados.
//DM.qrCliente.ParamByName('transporteh').AsFloat      := StrToFloat(edtTransporteH.Text);
//DM.qrCliente.ParamByName('documentoh').AsFloat    := StrToFloat(edtDocumentoH.Text);
//DM.qrCliente.ParamByName('extrash').AsFloat         := StrToFloat(edtExtraH.Text);
//DM.qrCliente.ParamByName('totalhonorarioh').AsFloat     := StrToFloat(edtTotal.Text);
//DM.qrCliente.ParamByName('datah1').AsDate    := DateTimePicker1.Date;
//DM.qrCliente.ExecSQL();
  try
    DM.qrCliente.ExecSQL();
    ShowMessage('Editado com Sucesso!');
    Exit;
    except on E: Exception do
    begin

    ShowMessage('Error na operação.');
    Exit;
    end;
  end;
end;

procedure TFrmCadCliente.edtCpfCnpjCExit(Sender: TObject);
begin
  inherited;
  if (edtCpfCnpjC.Text) = '' then
  begin
    ShowMessage('CPF está vazio!');
    exit
  end
  else
  begin
     if CalculaCnpjCpf (edtCpfCnpjC.Text) = false then
    begin
    ShowMessage('CPF/CNPJ invalido!');
    edtCpfCnpjC.Text := '';
    edtCpfCnpjC.SetFocus;
    end;
  end;


end;

procedure TFrmCadCliente.edtEmailCExit(Sender: TObject);
begin
  inherited;
    if validaEmail (edtEmailC.Text) = false then
    begin
    ShowMessage('E-mail é invalido!');
    edtEmailC.SetFocus;
    end;
end;

procedure TFrmCadCliente.edtPesquisarCChange(Sender: TObject);
begin
  inherited;
  buscarClienteCadCliente;
end;

procedure TFrmCadCliente.enviardadosC;
begin

    if (edtNomeC.Text = '') or (edtCelularC.Text = '') then
    begin
      ShowMessage('Campos não preenchidos!');
      Abort
    end;

//  if (RadioGroup1.ItemIndex = 0) and (RadioGroup1.ItemIndex = 1)then
//  DM.qrCliente.SQL.Clear;
//    //comando de verificação de credencias dentro do banco de dados
//  DM.qrCliente.SQL.Add('select * from TCLIENTE cp where TCLIENTE_CPF_CNPJ ='
//                        + QuotedStr(edtCpfCnpjC));
//  DM.qrCliente.Open;

//  if (RadioGroup1.ItemIndex = 1)then
//  begin
//  DM.qrCliente.SQL.Clear;
//    //comando de verificação de credencias dentro do banco de dados
//  DM.qrCliente.SQL.Add('select * from TCLIENTE cp where TCLIENTE_CPF_CNPJ ='
//                        + QuotedStr(edtCpfCnpjC));
//  DM.qrCliente.Open;
//  end;


//  DM.qrCliente.SQL.Clear;
//    //comando de verificação de credencias dentro do banco de dados
//  DM.qrCliente.SQL.Add('select * from TCLIENTE cp where TCLIENTE_CPF- ='
//                        + QuotedStr(data) + 'and cnpj = ' + QuotedStr(edtCnpjH.Text));
//  DM.qrCliente.Open;

//    if (DM.qrCliente.Eof) then
//  begin

  DM.qrCliente.close;
  DM.qrCliente.SQL.Clear;
  DM.qrCliente.SQL.Add(' INSERT INTO TCLIENTE(TCLIENTE_NOME,');
  DM.qrCliente.SQL.Add(' TCLIENTE_RAZAOSOCIAL,');
  DM.qrCliente.SQL.Add(' TCLIENTE_RG_IE,');
  DM.qrCliente.SQL.Add(' TCLIENTE_CPF_CNPJ,');
  DM.qrCliente.SQL.Add(' TCLIENTE_TIPOPESSOA,');
  DM.qrCliente.SQL.Add('TCLIENTE_EMAIL,');
  DM.qrCliente.SQL.Add('TCLIENTE_TELEFONE,');
  DM.qrCliente.SQL.Add('TCLIENTE_CELULAR,');
  DM.qrCliente.SQL.Add('TCLIENTE_LOGRADOURO,');
  DM.qrCliente.SQL.Add('TCLIENTE_NUM,');
  DM.qrCliente.SQL.Add('TCLIENTE_COMPLEMENTO,');
  DM.qrCliente.SQL.Add('TCLIENTE_BAIRRO,');
  DM.qrCliente.SQL.Add('TCLIENTE_CIDADE,');
  DM.qrCliente.SQL.Add('TCLIENTE_ESTADO,');
  DM.qrCliente.SQL.Add('TCLIENTE_DATACADASTRO,');
  DM.qrCliente.SQL.Add('TCLIENTE_OBS)');
  DM.qrCliente.SQL.Add('values (:TCLIENTE_NOME,');
  DM.qrCliente.SQL.Add(':TCLIENTE_RAZAOSOCIAL,');
  DM.qrCliente.SQL.Add(':TCLIENTE_RG_IE,');
  DM.qrCliente.SQL.Add(':TCLIENTE_CPF_CNPJ,');
  DM.qrCliente.SQL.Add(':TCLIENTE_TIPOPESSOA,');
  //DM.qrCliente.SQL.Add :TCLIENTE_EMAIL, :TCLIENTE_TELEFONE, :TCLIENTE_CELULAR, :TCLIENTE_LOGRADOURO, :TCLIENTE_NUM, :TCLIENTE_COMPLEMENTO, :TCLIENTE_BAIRRO, :TCLIENTE_CIDADE, :TCLIENTE_ESTADO, :TCLIENTE_DATACADASTRO, :TCLIENTE_OBS)');
  DM.qrCliente.SQL.Add(':TCLIENTE_EMAIL,');
  DM.qrCliente.SQL.Add(':TCLIENTE_TELEFONE,');
  DM.qrCliente.SQL.Add(':TCLIENTE_CELULAR,');
  DM.qrCliente.SQL.Add(':TCLIENTE_LOGRADOURO,');
  DM.qrCliente.SQL.Add(':TCLIENTE_NUM,');
  DM.qrCliente.SQL.Add(':TCLIENTE_COMPLEMENTO,');
  DM.qrCliente.SQL.Add(':TCLIENTE_BAIRRO,');
  DM.qrCliente.SQL.Add(':TCLIENTE_CIDADE,');
  DM.qrCliente.SQL.Add(':TCLIENTE_ESTADO,');
  DM.qrCliente.SQL.Add(':TCLIENTE_DATACADASTRO,');
  DM.qrCliente.SQL.Add(':TCLIENTE_OBS)');

  if (RadioGroup1.ItemIndex = 0) then
  begin
      pf := 'PF';
     DM.qrCliente.ParamByName('TCLIENTE_TIPOPESSOA').AsString    := pf;
  end;

  if (RadioGroup1.ItemIndex = 1)then
  begin
    pj := 'PJ';
    DM.qrCliente.ParamByName('TCLIENTE_TIPOPESSOA').AsString    := pj;
  end;

  DM.qrCliente.ParamByName('TCLIENTE_NOME').AsString     := edtNomeC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_RAZAOSOCIAL').AsString    := edtRazaoSocialC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_RG_IE').AsString        := edtRgIeC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_CPF_CNPJ').AsString        := edtCpfCnpjC.Text;

  DM.qrCliente.ParamByName('TCLIENTE_EMAIL').AsString    := edtEmailC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_TELEFONE').AsString    := edtTelefoneC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_CELULAR').AsString    := edtCelularC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_LOGRADOURO').AsString    := edtLogradouroC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_NUM').AsString    := edtNumeroC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_COMPLEMENTO').AsString    := edtComplementoC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_BAIRRO').AsString    := edtBairroC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_CIDADE').AsString    := edtCidadeC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_ESTADO').AsString    := edtEstadoC.Text;
  DM.qrCliente.ParamByName('TCLIENTE_DATACADASTRO').AsDate    := DateTimePicker1.Date;
  DM.qrCliente.ParamByName('TCLIENTE_OBS').AsString    := edtObservacaoC.Text;
//    DM.qrCliente.ExecSQL();
    try
    DM.qrCliente.ExecSQL();
    ShowMessage('Salvo com Sucesso!');
    Exit;
    except on E: Exception do
    begin
      ShowMessage('Error na operação.');
     Exit;
      end                   //se não teve retorna a msg
      else
        begin
      ShowMessage('CNPJ já cadastrado!')
        end;
      end;
end;

procedure TFrmCadCliente.escondecampo;
begin
 Label1.Visible := false;
 Label2.Visible := false;
 Label3.Visible := false;
 Label4.Visible := false;
 Label5.Visible := false;
 Label6.Visible := false;
 Label7.Visible := false;
 Label8.Visible := false;
 Label9.Visible := false;
 Label10.Visible := false;
 Label11.Visible := false;
 Label12.Visible := false;
 Label13.Visible := false;
 Label14.Visible := false;
 Label15.Visible := false;
 Label18.Visible := false;

 edtNomeC.Visible := false;
 edtRazaoSocialC.Visible := false;
 edtRgIeC.Visible := false;
 edtCpfCnpjC.Visible := false;
 edtEmailC.Visible := false;
 edtTelefoneC.Visible := false;
 edtCelularC.Visible := false;
 edtLogradouroC.Visible := false;
 edtBairroC.Visible := false;
 edtNumeroC.Visible := false;
 edtCidadeC.Visible := false;
 edtEstadoC.Visible := false;
 edtObservacaoC.Visible := false;
 edtComplementoC.Visible := false;
 edtCodClienteC.Visible := false;
 DateTimePicker1.Visible := false;
 RadioGroup1.Visible := false;
end;

procedure TFrmCadCliente.exibecampo;
begin
 Label1.Visible := true;
 Label2.Visible := true;
 Label3.Visible := true;
 Label4.Visible := true;
 Label5.Visible := true;
 Label6.Visible := true;
 Label7.Visible := true;
 Label8.Visible := true;
 Label9.Visible := true;
 Label10.Visible := true;
 Label11.Visible := true;
 Label12.Visible := true;
 Label13.Visible := true;
 Label14.Visible := true;
 Label15.Visible := true;
 Label18.Visible := true;

 edtNomeC.Visible := true;
 edtRazaoSocialC.Visible := true;
 edtRgIeC.Visible := true;
 edtCpfCnpjC.Visible := true;
 edtEmailC.Visible := true;
 edtTelefoneC.Visible := true;
 edtCelularC.Visible := true;
 edtLogradouroC.Visible := true;
 edtBairroC.Visible := true;
 edtNumeroC.Visible := true;
 edtCidadeC.Visible := true;
 edtEstadoC.Visible := true;
 edtObservacaoC.Visible := true;
 edtComplementoC.Visible := true;
 edtCodClienteC.Visible := true;
 DateTimePicker1.Visible := true;
 RadioGroup1.Visible := true;
end;

procedure TFrmCadCliente.FormCreate(Sender: TObject);
begin
  //inherited;
//  atualizabancoC;
end;

procedure TFrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
 atualizabancoC;
PageControl1.TabIndex := 1;
inicializarTelaCliente;

end;

procedure TFrmCadCliente.GridClienteCellClick(Column: TColumn);
begin
  inherited;
  
preenchercampoC;



end;

procedure TFrmCadCliente.habilitacampo;
begin

end;

procedure TFrmCadCliente.limpacampoC;
begin
 edtNomeC.Clear;
 edtRazaoSocialC.Clear;
 edtRgIeC.Clear;
 edtCpfCnpjC.Clear;
 edtEmailC.Clear;
 edtTelefoneC.Clear;
 edtCelularC.Clear;
 edtLogradouroC.Clear;
 edtBairroC.Clear;
 edtNumeroC.Clear;
 edtCidadeC.Clear;
 edtEstadoC.Clear;
 edtObservacaoC.Clear;
 edtComplementoC.Clear;
 edtCodClienteC.Clear;
end;

procedure TFrmCadCliente.preenchercampoC;
begin
  if GridCliente.Fields[0].Value <> NULL then
    DateTimePicker1.Date := GridCliente.Fields[0].Value;
  if GridCliente.Fields[1].Value <> NULL then
    edtCodClienteC.Text := GridCliente.Fields[1].Value;
  if GridCliente.Fields[2].Value <> NULL then
    edtNomeC.Text := GridCliente.Fields[2].Value;
  if GridCliente.Fields[3].Value <> NULL then
    edtRazaoSocialC.Text := GridCliente.Fields[3].Value;
  if GridCliente.Fields[4].Value <> NULL then
    edtRgIeC.Text := GridCliente.Fields[4].Value;
  if GridCliente.Fields[5].Value <> NULL then
    edtCpfCnpjC.Text := GridCliente.Fields[5].Value;
  if GridCliente.Fields[7].Value <> NULL then
    edtEmailC.Text := GridCliente.Fields[7].Value;
  if GridCliente.Fields[8].Value <> NULL then
    edtTelefoneC.Text := GridCliente.Fields[8].Value;
  if GridCliente.Fields[9].Value <> NULL then
    edtCelularC.Text := GridCliente.Fields[9].Value;
  if GridCliente.Fields[10].Value <> NULL then
    edtLogradouroC.Text := GridCliente.Fields[10].Value;
  if GridCliente.Fields[11].Value <> NULL then
    edtNumeroC.Text := GridCliente.Fields[11].Value;
  if GridCliente.Fields[12].Value <> NULL then
    edtComplementoC.Text := GridCliente.Fields[12].Value;
  if GridCliente.Fields[13].Value <> NULL then
    edtBairroC.Text := GridCliente.Fields[13].Value;
  if GridCliente.Fields[14].Value <> NULL then
    edtCidadeC.Text := GridCliente.Fields[14].Value;
  if GridCliente.Fields[15].Value <> NULL then
    edtEstadoC.Text := GridCliente.Fields[15].Value;
  if GridCliente.Fields[16].Value <> NULL then
    edtObservacaoC.Text := GridCliente.Fields[16].Value;

end;

procedure TFrmCadCliente.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.itemindex = 0 then
  begin
  edtRgIeC.EditMask := '00.000.000-0;1;_';
  edtCpfCnpjC.EditMask := '000.000.000-00;1;_';
  end
  else
  begin
     edtRgIeC.EditMask := '000000.000.00;1;_';
     edtCpfCnpjC.EditMask := '00.000.000/0000-00;1;_';
  end;
end;

end.
