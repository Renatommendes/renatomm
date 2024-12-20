unit uCadastroModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrmCadastroModelo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure btnAdicionarCadClick(Sender: TObject);
    procedure btnCancelarCadClick(Sender: TObject);
    procedure btnEditarCadClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormMouseEnter(Sender: TObject);
    procedure btnPesquisarCadClick(Sender: TObject);
    procedure btnAddNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    operacao : String;
    procedure enviardados;
    procedure atualizabanco;
    procedure buscarregistro;
    procedure Editarcad;
    procedure preencherdadoscad;
    procedure preencherinicialR;
    procedure habilitacampoR (status : boolean);
    procedure limpacampoR;

  end;

var
  FrmCadastroModelo: TFrmCadastroModelo;
  valortotal: double;

implementation
uses uPrincipal1;
var
telaprincipal1 : TFrmPrincipal1;

{$R *.dfm}

procedure TFrmCadastroModelo.atualizabanco;
begin
//  FDQuery1.close;
//  FDQuery1.SQL.Clear;
//  FDQuery1.SQL.Add('select * from recebimento');
//  FDQuery1.open;
end;

procedure TFrmCadastroModelo.btnAddNovoClick(Sender: TObject);
begin

//  tbsCadCliente.Enabled := true;
//  tbsCadCliente.TabVisible := true;
//  tbsPesquisarCliente.TabVisible := false;
//  PageControl1.TabIndex := 0;
end;

procedure TFrmCadastroModelo.btnAdicionarCadClick(Sender: TObject);
begin
  operacao := 'adicionar';
  habilitacampoR(true);
end;

procedure TFrmCadastroModelo.btnCancelarCadClick(Sender: TObject);
begin
limpacampoR;
//edtNomeEmp.Enabled := False;
////edtCodEmp.Enabled := False;
//edtNomeResp.Enabled := False;
//edtCnpj.Enabled := False;
//edtTelefone.Enabled := false;

//btnSalvar.Enabled := False;
//btnEditarCad.Enabled := True;
//btnAdicionarCad.Enabled := True;
end;

procedure TFrmCadastroModelo.btnEditarCadClick(Sender: TObject);
begin
  operacao := 'editar';
  habilitacampoR(true);
end;

procedure TFrmCadastroModelo.btnPesquisarCadClick(Sender: TObject);
begin
//    tbsPesquisarCliente.TabVisible := true;
//    PageControl1.TabIndex := 0;
//    tbsCadCliente.Enabled := false;
//    tbsCadCliente.TabVisible := false;
//
//  tbsCadCliente.TabVisible := false;

end;

procedure TFrmCadastroModelo.btnSalvarClick(Sender: TObject);
begin
  if operacao = 'adicionar' then
  begin
    enviardados;
  end;
  if operacao = 'editar' then
  begin
    Editarcad;
  end;

atualizabanco;
operacao := '';
habilitacampoR(false);
limpacampoR;

end;

procedure TFrmCadastroModelo.buscarregistro;
begin
//  with FDQuery1 do
//  begin
//    close;
//    SQL.Clear;
//    SQL.Add('select * from recebimento WHERE codEmp like :codEmp or nomeemp like :nomeemp or cnpj like :cnpj');
//
//    ParamByName('codEmp').AsString      := edtBuscar.Text + '%';
//    ParamByName('nomeemp').AsString     :=   edtBuscar.Text + '%';
//    ParamByName('cnpj').AsString        := '%' + edtBuscar.Text + '%';
//    open;
//
//  end;

end;

procedure TFrmCadastroModelo.DBGrid1CellClick(Column: TColumn);
begin
preencherdadoscad;
end;

procedure TFrmCadastroModelo.Editarcad;
begin
//FDQuery1.Close;
//FDQuery1.SQL.Clear;
//FDQuery1.SQL.Add('UPDATE Recebimento set nomeemp = :nomeemp, nomeresp = :nomeresp, cnpj = :cnpj, telefone = :telefone where codEmp = :codEmp');
//
////FDQuery1.ParamByName('codEmp').AsString     := edtCodEmp.Text;
////FDQuery1.ParamByName('nomeemp').AsString     := edtNomeEmp.Text;
////FDQuery1.ParamByName('nomeresp').AsString    := edtNomeResp.Text;
////FDQuery1.ParamByName('cnpj').AsString        := edtCnpj.Text;
////FDQuery1.ParamByName('telefone').AsString    := edtTelefone.Text;
//
//try
//  FDQuery1.ExecSQL();
//  ShowMessage('Editado com Sucesso!');
//  Exit;
//  except on E: Exception do
//  begin
//   ShowMessage('Error na operação.');
//   Exit;
//  end;
//  end;
end;

procedure TFrmCadastroModelo.edtBuscarChange(Sender: TObject);
begin
buscarregistro;

end;

procedure TFrmCadastroModelo.enviardados;
begin
//  if (edtCnpj.Text = '') or (edtNomeEmp.Text = '') then
//    begin
//      ShowMessage('Campos não preenchidos!');
//      Abort
//    end;
//
//      FDQuery1.SQL.Clear;
//    //comando de verificação de credencias dentro do banco de dados
//      FDQuery1.SQL.Add('select * from recebimento cp where cnpj ='
//                         + QuotedStr(edtCnpj.Text));
//      FDQuery1.Open;

//  if (FDQuery1.Eof) then
//  begin
//  FDQuery1.close;
//  FDQuery1.SQL.Clear;
//  FDQuery1.SQL.Add('INSERT INTO recebimento ( nomeemp, nomeresp, telefone, cnpj) values ( :nomeemp, :nomeresp, :telefone, :cnpj)');
//  FDQuery1.ParamByName('nomeemp').AsString     := edtNomeEmp.Text;
//  FDQuery1.ParamByName('nomeresp').AsString    := edtNomeResp.Text;
//  FDQuery1.ParamByName('cnpj').AsString        := edtCnpj.Text;
//  FDQuery1.ParamByName('telefone').AsString    := edtTelefone.Text;
//    try
//    FDQuery1.ExecSQL();
//    ShowMessage('Salvo com Sucesso!');
//    Exit;
//    except on E: Exception do
//   begin
//   ShowMessage('Error na operação.');
//     Exit;
//    end;
//   end;
//  end                   //se não teve retorna a msg
//  else
//  begin
//  ShowMessage('CNPJ já cadastrado!')
//  end;
end;

procedure TFrmCadastroModelo.FormCreate(Sender: TObject);
begin
 atualizabanco;
 preencherinicialR;
end;

procedure TFrmCadastroModelo.FormMouseEnter(Sender: TObject);
begin

FrmPrincipal1.pnlSubMenuCad.Visible := false;
FrmPrincipal1.pnlSubMenuLanc.Visible := false;
FrmPrincipal1.pnlSubMenuRelatorio.Visible := false;
end;

procedure TFrmCadastroModelo.FormShow(Sender: TObject);
begin
//       PageControl1.TabIndex := 1;
end;

procedure TFrmCadastroModelo.habilitacampoR(status: boolean);
begin
// if (operacao = 'editar') or (operacao =  'adicionar') then
// begin
////   edtCodEmp.Enabled   := not status;
////   edtNomeEmp.Enabled  := not status;
////   edtNomeResp.Enabled     := not status;
////   edtCnpj.Enabled     := not status;
////   edtTelefone.Enabled := not status;
// end;

//  edtNomeEmp.Enabled         := status;
//  edtNomeResp.Enabled          := status;
//  edtCnpj.Enabled          := status;
//  edtTelefone.Enabled          := status;


//  btnSalvar.Enabled := status;
//  btnCancelarCad.Enabled  := status;
//  btnEditarCad.Enabled := not status;
//  btnAdicionarCad.Enabled := not status;
end;

procedure TFrmCadastroModelo.limpacampoR;
begin
//edtNomeEmp.Clear;
//edtCodEmp.Clear;
//edtNomeResp.Clear;
//edtCnpj.Clear;
//edtTelefone.Clear;
end;

procedure TFrmCadastroModelo.preencherdadoscad;
begin
//  if DBGrid1.Fields[0].Value <> NULL then
//    edtCodEmp.Text := DBGrid1.Fields[0].Value;
//  if DBGrid1.Fields[1].Value <> NULL then
//    edtNomeEmp.Text := DBGrid1.Fields[1].Value;
//  if DBGrid1.Fields[2].Value <> NULL then
//    edtNomeResp.Text := DBGrid1.Fields[2].Value;
//  if DBGrid1.Fields[3].Value <> NULL then
//    edtCnpj.Text := DBGrid1.Fields[3].Value;
//  if DBGrid1.Fields[4].Value <> NULL then
//    edtTelefone.Text := DBGrid1.Fields[4].Value;
end;

procedure TFrmCadastroModelo.preencherinicialR;
begin
//edtNomeEmp.Enabled := False;
//edtCodEmp.Enabled := False;
//edtNomeResp.Enabled := False;
//edtCnpj.Enabled := False;
//edtTelefone.Enabled := false;

//btnSalvar.Enabled := False;
//btnCancelarCad.Enabled := False;
//btnEditarCad.Enabled := True;
//btnAdicionarCad.Enabled := True;
end;

end.
