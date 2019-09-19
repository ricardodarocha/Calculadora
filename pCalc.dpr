program pCalc;

uses
  Vcl.Forms,
  uCalc in 'uCalc.pas' {frmCalc},
  JvExprParser in 'JvExprParser.pas',
  uFuncoes in 'uFuncoes.pas',
  uVariaveis in 'uVariaveis.pas',
  assis.strings in 'assis.strings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalc, frmCalc);
  Application.Run;
end.
