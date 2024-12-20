unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Types, System.StrUtils;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    btn01: TButton;
    btn04: TButton;
    btn07: TButton;
    btn02: TButton;
    btn05: TButton;
    btn08: TButton;
    btn03: TButton;
    btn06: TButton;
    btn09: TButton;
    Panel2: TPanel;
    btnsoma: TButton;
    btnsubtrair: TButton;
    btnMultiplica: TButton;
    btnDividir: TButton;
    btnVirgula: TButton;
    Button1: TButton;
    btn00: TButton;
    btnIgual: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    lblValor: TLabel;
    procedure btn00Click(Sender: TObject);
    procedure btn01Click(Sender: TObject);
    procedure btn02Click(Sender: TObject);
    procedure btn03Click(Sender: TObject);
    procedure btn04Click(Sender: TObject);
    procedure btn05Click(Sender: TObject);
    procedure btn06Click(Sender: TObject);
    procedure btn07Click(Sender: TObject);
    procedure btn08Click(Sender: TObject);
    procedure btn09Click(Sender: TObject);
    procedure btnVirgulaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnsomaClick(Sender: TObject);
    procedure btnsubtrairClick(Sender: TObject);
    procedure btnMultiplicaClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

  var
  FrmPrincipal: TFrmPrincipal;
  valor : String;
  valor2 : String;
  n1 : Double;
  n2 : Double;
  operacao : Char;
  limpar : boolean;
  expres : TStringDynArray;
  resultado : String;

implementation

{$R *.dfm}

procedure TFrmPrincipal.btn00Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '0';
end;

procedure TFrmPrincipal.btn01Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '1';
end;

procedure TFrmPrincipal.btn02Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '2';
end;

procedure TFrmPrincipal.btn03Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '3';
end;

procedure TFrmPrincipal.btn04Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '4';
end;

procedure TFrmPrincipal.btn05Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '5';
end;

procedure TFrmPrincipal.btn06Click(Sender: TObject);
begin
 lblValor.Caption := lblValor.Caption + '6';
end;

procedure TFrmPrincipal.btn07Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '7';
end;

procedure TFrmPrincipal.btn08Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '8';
end;

procedure TFrmPrincipal.btn09Click(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + '59';
end;

  procedure TFrmPrincipal.btnDividirClick(Sender: TObject);
begin
  operacao := '/';
  lblValor.Caption := lblValor.Caption + '/';
end;

procedure TFrmPrincipal.btnIgualClick(Sender: TObject);
begin
  begin

    expres := SplitString(lblValor.Caption, operacao);
    valor := expres[0];
    valor2 := expres[1];
    n1 := StrToFloat(valor);
    n2 := StrToFloat(valor2);
    case operacao of
    '+': resultado:= (FloatToStr(n1+n2));
    '-': resultado:= (FloatToStr(n1-n2));
    '*': resultado:= (FloatToStr(n1*n2));
    '/': resultado:= (FloatToStr(n1/n2));
    end;

  lblValor.Caption:= resultado;

   end;
end;

procedure TFrmPrincipal.btnMultiplicaClick(Sender: TObject);
begin
  operacao := '*';
  lblValor.Caption := lblValor.Caption + '*';
end;

procedure TFrmPrincipal.btnsomaClick(Sender: TObject);
begin
  operacao := '+';
  lblValor.Caption := lblValor.Caption + '+';
end;

procedure TFrmPrincipal.btnsubtrairClick(Sender: TObject);
begin
  operacao := '-';
  lblValor.Caption := lblValor.Caption + '-';
end;

procedure TFrmPrincipal.btnVirgulaClick(Sender: TObject);
begin
  lblValor.Caption := lblValor.Caption + ',';
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  lblValor.Caption := '';
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = char ('0') then
  begin
    btn00.Click;
  end;
  if key = char ('1') then
  begin
    btn01.Click;
  end;
  if key = char ('2') then
  begin
    btn02.Click;
  end;
  if key = char ('3') then
  begin
    btn03.Click;
  end;
  if key = char ('4') then
  begin
    btn04.Click;
  end;
  if key = char ('5') then
  begin
    btn05.Click;
  end;
  if key = char ('6') then
  begin
    btn06.Click;
  end;
  if key = char ('7') then
  begin
    btn07.Click;
  if key = char ('8') then
  begin
    btn08.Click;
  end;
  if key = char ('9') then
  begin
    btn09.Click;
  end;
  if key = char (',') then
  begin
    btnVirgula.Click;
  end;
  end;

end;

end.
