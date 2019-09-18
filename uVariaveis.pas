unit uVariaveis;

interface

uses assis.strings;

function ResolveVariavel(const VarName: String; var Value: Variant): Boolean;

const
   _LARGURA = 'LARGURA';
   _ALTURA = '@ALTURA';

var VariaveisPublicas: ListaDeStrings;

implementation

uses
  System.SysUtils;


function ResolveVariavel(const VarName: String; var Value: Variant): Boolean;
var Variavel: String;
begin

  if lowercase(VarName) = lowercase(_ALTURA) then
    Value := '1256522'
  else if lowercase(VarName) = lowercase(_LARGURA) then
    Value := '89516';



   result := false;
   for Variavel in VariaveisPublicas do
   begin
    if lowercase(VarName) = LowerCase(Variavel) then
    begin
      result := true;
      break;
    end;
   end;
end;


initialization

  VariaveisPublicas.Add(_LARGURA);
  VariaveisPublicas.Add(_ALTURA);

end.
