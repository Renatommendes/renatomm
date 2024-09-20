program App_Recibo;

uses
  Vcl.Forms,
  uPrincipal1 in 'uPrincipal1.pas' {FrmPrincipal1},
  uCadastroModelo in 'uCadastroModelo.pas' {FrmCadastroModelo},
  uCadCliente in 'uCadCliente.pas' {FrmCadCliente},
  uLanRecibo in 'uLanRecibo.pas' {FrmLanRecibo},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal1, FrmPrincipal1);
  Application.CreateForm(TFrmLanRecibo, FrmLanRecibo);
  Application.CreateForm(TFrmCadCliente, FrmCadCliente);
  Application.CreateForm(TFrmCadastroModelo, FrmCadastroModelo);
  Application.CreateForm(TDM, DM);
  //  Application.CreateForm(TFrmCadastroModelo1, FrmCadastroModelo1);
//  Application.CreateForm(TFrmCadastroModelo1, FrmCadastroModelo1);
  //  Application.CreateForm(TFrmRecibo1, FrmRecibo1);
//  Application.CreateForm(TFrmCadDespesa, FrmCadDespesa);
  Application.Run;
end.
