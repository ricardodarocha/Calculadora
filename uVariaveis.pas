unit uVariaveis;

interface

uses assis.strings, Data.DB;

/// <summary>
/// pt: Atribui o Valor (Variant) para cada Variável pelo nome
/// en: Set the Value (Variant) for each Variable by name
/// </summary>
function ResolveVariavel(const VarName: String; var Value: Variant): Boolean; overload;

/// <summary>
/// pt: Usa um Dataset e preenche o Valor (Variant) de uma variável pelo valor da coluna na tabela.
/// Se não existir uma coluna
/// com o mesmo nome então aponta para o outro método homonimo
/// en: Use a dataset to fill the Value (Variant) for each Variable with the fieldname.
/// If not find field by name then redirect for another overloaded method
/// </summary>

/// <remarks>
///   pt: Não move cursor da tabela
///   en: Doesn't mmove the cursor of the table
/// </remarks>
function ResolveVariavel(Table: TDataset; const VarName: String; var Value: Variant): Boolean; overload;

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

   result := false;
   for Variavel in VariaveisPublicas do
   begin
    if lowercase(VarName) = LowerCase(Variavel) then
    begin
      result := true;
      break;
    end;
   end;

  if lowercase(VarName) = lowercase(_ALTURA) then
    Value := '1256522'
  else if lowercase(VarName) = lowercase(_LARGURA) then
    Value := '89516';
end;

function ResolveVariavel(Table: TDataset; const VarName: String; var Value: Variant): Boolean; overload;
begin
  result := Table.FindField(VarName) <> nil;
  if result then
    Value := Table.FindField(VarName).Value;
end;

initialization

  VariaveisPublicas.Add(_LARGURA);
  VariaveisPublicas.Add(_ALTURA);

end.
