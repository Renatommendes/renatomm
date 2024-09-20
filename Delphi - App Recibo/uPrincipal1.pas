unit uPrincipal1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, ShellApi, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage;

type
  TFrmPrincipal1 = class(TForm)
    pnlFundo: TPanel;
    pnlMenuLateral: TPanel;
    btnCadastrar: TSpeedButton;
    btnMenu: TSpeedButton;
    pnlBotaoCadastrar: TPanel;
    Panel2: TPanel;
    pnlSubMenuCad: TPanel;
    btnCadCliente: TSpeedButton;
    Panel7: TPanel;
    pnlSubMenuRelatorio: TPanel;
    btnPesquisarCliente: TSpeedButton;
    Panel8: TPanel;
    pnlLogon: TPanel;
    StatusBar1: TStatusBar;
    pnlSubMenuLanc: TPanel;
    btnLanRecibo: TSpeedButton;
    Panel10: TPanel;
    pnlBotaoLancamento: TPanel;
    btnLancamento: TSpeedButton;
    pnlBotaoRelatorio: TPanel;
    btnRelatorio: TSpeedButton;
    pnlBotaoSair: TPanel;
    btnSair: TSpeedButton;
    Image1: TImage;
    procedure btnMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnLancamentoClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnRelatorio2MouseEnter(Sender: TObject);
    procedure btnCadClienteClick(Sender: TObject);
    procedure btnRelatorio2Click(Sender: TObject);
    procedure btnCadastrarMouseEnter(Sender: TObject);
    procedure btnSair2MouseEnter(Sender: TObject);

    procedure Panel2MouseEnter(Sender: TObject);
    procedure btnLancamento2Click(Sender: TObject);
    procedure btnLancamento2MouseEnter(Sender: TObject);
    procedure btnLanReciboClick(Sender: TObject);
    procedure btnLanImpostoClick(Sender: TObject);
    procedure btnPesquisarClienteClick(Sender: TObject);
    procedure btnRelImpostoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure pnlBotaoCadastrarMouseEnter(Sender: TObject);
    procedure pnlBotaoLancamentoMouseEnter(Sender: TObject);
    procedure btnLancamentoMouseEnter(Sender: TObject);
    procedure btnCadastrarMouseLeave(Sender: TObject);
    procedure pnlBotaoCadastrarMouseLeave(Sender: TObject);
    procedure btnLancamentoMouseLeave(Sender: TObject);
    procedure pnlBotaoLancamentoMouseLeave(Sender: TObject);
    procedure btnRelatorioMouseEnter(Sender: TObject);
    procedure btnRelatorioMouseLeave(Sender: TObject);
    procedure pnlBotaoRelatorioMouseLeave(Sender: TObject);
    procedure pnlBotaoSairMouseEnter(Sender: TObject);
    procedure pnlBotaoSairMouseLeave(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure btnCadClienteMouseEnter(Sender: TObject);
    procedure btnLanReciboMouseEnter(Sender: TObject);
    procedure btnPesquisarClienteMouseEnter(Sender: TObject);
    procedure pnlMenuLateralMouseEnter(Sender: TObject);




  private
    { Private declarations }

  public
    { Public declarations }
    var nivelusuarioRH : integer;
        testeString : String;
        codempRH : String;
        nomerespRH : string;
        cnpjRH : String;
        telefoneRH : String;

        datarefRH : String;
        valorservRH : String;
        valortranspRH : String;
        valordocRH :String;
        valorextraRH : String;
        valortotalRH : String;
    //------------------------------------
        testeStringRI : String;
        codempRI : String;
        nomerespRI : string;
        cnpjRI : String;
        telefoneRI : String;

        datarefRI : String;
        valorfaturamentoRI : String;
        valoricmsRI : String;
        valorissRI : String;
        valoripiRI :String;
        valoriofRI : String;
        valortotaldescRI : String;
        valortotalimRI : String;
        valortotalrecRI : String;

        procedure fecharsubmenu;

  end;

var
  FrmPrincipal1: TFrmPrincipal1;
  bExpandido : Boolean;

implementation

uses  uCadCliente, uLanRecibo;
var
  telaCadCliente : TFrmCadCliente;
  telaRecibo : TFrmLanRecibo;
//  telagerarrechonorario : TFrmGerarReciboHonorario;
//  telaimpressaorh : TFrmImpressaoRH;
//
//  telareciboimposto : TFrmReciboImposto;
//  telagerarrecimposto : TFrmGerarReciboImposto;
//  telaimpressaori : TFrmImpressaoRI;

{$R *.dfm}

procedure TFrmPrincipal1.btnCadastrarClick(Sender: TObject);
begin
pnlSubMenuCad.Visible := Not pnlSubMenuCad.Visible;
  pnlBotaoCadastrar.Color := clWhite;
  btnCadastrar.Font.Color := clBlack;
end;

procedure TFrmPrincipal1.btnCadastrarMouseEnter(Sender: TObject);
begin
pnlSubMenuRelatorio.Visible := false;
pnlSubMenuLanc.Visible := false;
  pnlBotaoCadastrar.Color := clWhite;
    btnCadastrar.Font.Color := clBlack;


end;

procedure TFrmPrincipal1.btnCadastrarMouseLeave(Sender: TObject);
begin
  pnlBotaoCadastrar.Color := $0000008A;
  btnCadastrar.Font.Color := clWhite;
end;

procedure TFrmPrincipal1.btnCadClienteClick(Sender: TObject);
begin
try
  telaCadCliente := TFrmCadCliente.Create(Self);
  telaCadCliente.Show;
  telaCadCliente.Parent := Panel2;
  pnlSubMenuCad.Visible := false;
  telaCadCliente.Align := alClient;
  telaCadCliente.BorderStyle := bsNone;
finally

end;

end;

procedure TFrmPrincipal1.btnCadClienteMouseEnter(Sender: TObject);
begin
    pnlBotaoCadastrar.Color := clWhite;
    btnCadastrar.Font.Color := clBlack;

end;

procedure TFrmPrincipal1.btnLanReciboClick(Sender: TObject);
begin
try
  telaRecibo := TFrmLanRecibo.Create(Self);
  telaRecibo.Show;
  telaRecibo.Parent := Panel2;
  pnlSubMenuLanc.Visible := false;
  telaRecibo.Align := alClient;
  telaRecibo.BorderStyle := bsNone;
finally

end;

end;

procedure TFrmPrincipal1.btnLanReciboMouseEnter(Sender: TObject);
begin
    pnlBotaoLancamento.Color := clWhite;
    btnLancamento.Font.Color := clBlack;
end;

procedure TFrmPrincipal1.btnLanImpostoClick(Sender: TObject);
begin
//  telareciboimposto := TFrmReciboImposto.Create(Self);
//  telareciboimposto.Show;
//  telareciboimposto.Parent := Panel2;
//  pnlSubMenuLanc.Visible := false;
//  telareciboimposto.Align := alClient;
//  telareciboimposto.BorderStyle := bsNone;
end;

procedure TFrmPrincipal1.btnMenuClick(Sender: TObject);
begin
pnlSubMenuCad.Visible := false;
  if bExpandido then
    pnlMenuLateral.Width := 48
  else
    pnlMenuLateral.Width := 80;
    bExpandido := not bExpandido;
  if (pnlMenuLateral.Width <= 48) then
  begin

    btnCadastrar.Enabled := false;

    btnLancamento.Enabled   := false;
        btnRelatorio.Enabled := false;
                btnSair.Enabled      := false;



    btnCadastrar.Visible := False;
    btnLancamento.Visible   := false;
        btnRelatorio.Visible := False;
        btnSair.Visible      := False;
    pnlBotaoCadastrar.Visible := false;
    pnlBotaolancamento.Visible := false;
    pnlBotaorelatorio.Visible := false;
    pnlBotaoSair.Visible := false;
  end
  else if (pnlMenuLateral.Width >= 80) then
  begin

    btnRelatorio.Enabled := true;
    btnLancamento.Enabled := true;
    btnCadastrar.Enabled := true;
    btnSair.Enabled := true;


    btnCadCliente.Enabled := true;
    btnLanRecibo.Enabled := true;

       pnlBotaoSair.Enabled := true;
    pnlBotaoCadastrar.Enabled := true;
    pnlBotaolancamento.Enabled := true;
    pnlBotaorelatorio.Enabled:= true;

    btnRelatorio.Visible := true;
    btnLancamento.Visible := true;
    btnCadCliente.Visible := true;
    pnlBotaoCadastrar.Visible := true;
    pnlBotaolancamento.Visible := true;
    pnlBotaorelatorio.Visible := true;
    pnlBotaoSair.Visible := true;
        btnCadastrar.Visible := true;
            btnSair.Visible := true;
  end;
end;

procedure TFrmPrincipal1.btnRelatorio2Click(Sender: TObject);
begin
  pnlSubMenuRelatorio.Visible := Not pnlSubMenuRelatorio.Visible;
end;

procedure TFrmPrincipal1.btnRelatorio2MouseEnter(Sender: TObject);
begin
pnlSubMenuCad.Visible := False;
pnlSubMenuLanc.Visible := false;
end;

procedure TFrmPrincipal1.btnRelatorioClick(Sender: TObject);
begin
  pnlSubMenuRelatorio.Visible := Not pnlSubMenuRelatorio.Visible;
end;

procedure TFrmPrincipal1.btnRelatorioMouseEnter(Sender: TObject);
begin
pnlSubMenuCad.Visible := False;
pnlSubMenuLanc.Visible := false;

pnlBotaoRelatorio.Color := clWhite;
btnRelatorio.Font.Color := clBlack;
end;

procedure TFrmPrincipal1.btnRelatorioMouseLeave(Sender: TObject);
begin
    pnlBotaoLancamento.Color := $0000008A;
    btnRelatorio.Font.Color := clWhite;
end;

procedure TFrmPrincipal1.btnLancamento2Click(Sender: TObject);
begin
  pnlSubMenuLanc.Visible := Not pnlSubMenuLanc.Visible;
end;

procedure TFrmPrincipal1.btnLancamento2MouseEnter(Sender: TObject);
begin
  pnlSubMenuCad.Visible := False;
  pnlSubMenuRelatorio.Visible := false;
  pnlBotaoCadastrar.Color := $0000008A;
end;

procedure TFrmPrincipal1.btnLancamentoClick(Sender: TObject);
begin
  pnlSubMenuLanc.Visible := Not pnlSubMenuLanc.Visible;
end;

procedure TFrmPrincipal1.btnLancamentoMouseEnter(Sender: TObject);
begin
  pnlSubMenuCad.Visible := False;
  pnlSubMenuRelatorio.Visible := false;

  pnlBotaoLancamento.Color := clWhite;
    btnLancamento.Font.Color := clBlack;
end;

procedure TFrmPrincipal1.btnLancamentoMouseLeave(Sender: TObject);
begin
     pnlBotaoLancamento.Color := $0000008A;
     btnLancamento.Font.Color := clWhite;
end;

procedure TFrmPrincipal1.btnPesquisarClienteClick(Sender: TObject);
begin
//  telagerarrechonorario := TFrmGerarReciboHonorario.Create(Self);
//  telagerarrechonorario.Show;
//  telagerarrechonorario.Parent := Panel2;
//  pnlSubMenuRelatorio.Visible := false;
//  telagerarrechonorario.Align := alClient;
//  telagerarrechonorario.BorderStyle := bsNone;
end;

procedure TFrmPrincipal1.btnPesquisarClienteMouseEnter(Sender: TObject);
begin
    pnlBotaoRelatorio.Color := clWhite;
    btnRelatorio.Font.Color := clBlack;
end;

procedure TFrmPrincipal1.btnRelImpostoClick(Sender: TObject);
begin
// telagerarrecimposto := TFrmGerarReciboImposto.Create(Self);
// telagerarrecimposto.Show;
// telagerarrecimposto.Parent := Panel2;
// pnlSubMenuRelatorio.Visible := false;
// telagerarrecimposto.Align := alClient;
// telagerarrecimposto.BorderStyle := bsNone;
end;

procedure TFrmPrincipal1.btnSair2MouseEnter(Sender: TObject);
begin
  pnlSubMenuRelatorio.Visible := false;
  pnlSubMenuLanc.Visible := false;
end;

procedure TFrmPrincipal1.btnSairMouseEnter(Sender: TObject);
begin
  pnlBotaoSair.Color := clWhite;
  btnSair.Font.Color := clBlack;

  pnlBotaoRelatorio.Color := $0000008A;
  btnRelatorio.Font.Color := clWhite;
end;

procedure TFrmPrincipal1.btnSairMouseLeave(Sender: TObject);
begin
pnlBotaoSair.Color := $0000008A;
    btnSair.Font.Color := clWhite;
end;

procedure TFrmPrincipal1.Button1Click(Sender: TObject);
begin
//  telaimpressaorh := TFrmImpressaoRH.Create(Self);
//
//  telaimpressaorh.Show;

end;

procedure TFrmPrincipal1.FormCreate(Sender: TObject);
begin
pnlMenuLateral.Width := 48;

btnLancamento.Visible := false;
btnCadastrar.Visible := False;
btnRelatorio.Visible := False;
btnSair.Visible := False;
pnlSubMenuCad.Visible := false;
pnlSubMenuRelatorio.Visible := false;
pnlSubMenuLanc.Visible := false;
pnlBotaoCadastrar.Visible := false;
pnlBotaolancamento.Visible := false;
pnlBotaorelatorio.Visible := false;
pnlBotaoSair.Visible := false;

end;


procedure TFrmPrincipal1.pnlBotaoCadastrarMouseEnter(Sender: TObject);
begin
pnlBotaoCadastrar.Color := clwhite;
btnCadastrar.Enabled := true;
  btnCadastrar.Font.Color := clBlack;
end;

procedure TFrmPrincipal1.pnlBotaoCadastrarMouseLeave(Sender: TObject);
begin
  pnlBotaoCadastrar.Color := $0000008A;
    btnCadastrar.Font.Color := clWhite;
end;

procedure TFrmPrincipal1.pnlBotaoLancamentoMouseEnter(Sender: TObject);
begin

  pnlBotaoLancamento.Color := clwhite;
    pnlBotaoCadastrar.Color := $0000008A;
end;

procedure TFrmPrincipal1.pnlBotaoLancamentoMouseLeave(Sender: TObject);
begin
  pnlBotaoLancamento.Color := $0000008A;
end;

procedure TFrmPrincipal1.pnlBotaoRelatorioMouseLeave(Sender: TObject);
begin
  pnlBotaoRelatorio.Color := $0000008A;
end;

procedure TFrmPrincipal1.pnlBotaoSairMouseEnter(Sender: TObject);
begin
  pnlBotaoSair.Color := clWhite;
end;

procedure TFrmPrincipal1.pnlBotaoSairMouseLeave(Sender: TObject);
begin
  pnlBotaoSair.Color := $0000008A;
end;

procedure TFrmPrincipal1.pnlMenuLateralMouseEnter(Sender: TObject);
begin
pnlBotaoCadastrar.Color := $0000008A;
btnCadastrar.Font.Color := clWhite;

pnlBotaoLancamento.Color := $0000008A;
btnLancamento.Font.Color := clWhite;

pnlBotaoRelatorio.Color := $0000008A;
btnRelatorio.Font.Color := clWhite;
end;

procedure TFrmPrincipal1.Panel2MouseEnter(Sender: TObject);
begin
  pnlSubMenuCad.Visible := false;
  pnlSubMenuLanc.Visible := false;
  pnlSubMenuRelatorio.Visible := false;
end;

procedure TFrmPrincipal1.fecharsubmenu;
begin
  pnlSubMenuCad.Visible := False;
  pnlSubMenuLanc.Visible := false;
  pnlSubMenuRelatorio.Visible := false;
end;

end.


