program App_aulaXML;

uses
  Vcl.Forms,
  uFrmLerXML in 'uFrmLerXML.pas' {FrmLerXML};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLerXML, FrmLerXML);
  Application.Run;
end.
