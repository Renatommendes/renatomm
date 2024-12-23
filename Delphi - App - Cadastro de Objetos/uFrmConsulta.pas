unit uFrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, Vcl.StdCtrls, FireDAC.Phys.ODBCBase, uDM,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    btnBuscar: TButton;
    edtBuscar: TEdit;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    //procedure btnBuscarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure edtBuscarKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


//procedure TForm1.btnBuscarClick(Sender: TObject);
//begin
  //DM.FDQuery1.Open('select * from TblCadastro where idMatricula = ' + edtBuscar.Text);
  //with DM.FDQuery1 do
  //begin
    //close;
    //sql.Clear;
    //sql.Add('select * from TblCadastro where');
     // if ComboBox1.ItemIndex = 0 then
     // begin
        //sql.Add('TblCadastro.cust_nome like :nome');
      //end;
     // ParamByName('nome').AsString := '%' + edtBuscar.Text + '%';

    //open;
  //end;
//end;

procedure TForm1.edtBuscarChange(Sender: TObject);
begin

SpeedButton1Click(Sender);
end;

procedure TForm1.edtBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SpeedButton1Click(Sender);
  end;

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  //DM.FDQuery1.Open('select * from TblCadastro where idMatricula = ' + edtBuscar.Text);
  with DM.FDQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from TblCadastro WHERE idMatricula like :idMatricula or nome like :nome or email like :email  ');
      //if ComboBox1.ItemIndex = 1 then
     // begin
     //   sql.Add('where nome like :nome');
     ParamByName('idMatricula').AsString := edtBuscar.Text + '%';
     ParamByName('nome').AsString :=   edtBuscar.Text + '%';
     ParamByName('email').AsString := '%' + edtBuscar.Text + '%';
     // end;

    open;
  end;
end;

end.
