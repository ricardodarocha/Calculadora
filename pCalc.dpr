program pCalc;

uses
  Vcl.Forms,
  uCalc in 'uCalc.pas' {frmCalc},
  JvExprParser in 'JvExprParser.pas',
  uGeneralIcon in '..\telas\uGeneralIcon.pas' {CNV: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalc, frmCalc);
  Application.CreateForm(TCNV, CNV);
  Application.Run;
end.
