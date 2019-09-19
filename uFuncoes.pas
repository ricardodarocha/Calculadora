unit uFuncoes;

interface

uses assis.strings;

function ResolveFuncao(const FuncName: String;const Args: Variant): Variant;
function Area(x,y: Currency): Variant;

const
   _AREA = 'AREA';
   _ALTURA = '@ALTURA';

var FuncoesPublicas: ListaDeStrings;

implementation

uses
  System.SysUtils;


function ResolveFuncao(const FuncName: String; const Args: Variant): Variant;
begin
    if lowercase(FuncName) = lowercase(_AREA) then
      RESULT := Area(Args[0], Args[1])
    else    if lowercase(FuncName) = lowercase(_AREA) then
      RESULT := Area(Args[0], Args[1])
    else {...};



end;

function Area(x,y: Currency): Variant;
begin
 result := x * y;
end;


initialization

  FuncoesPublicas.Add(_AREA);



end.
