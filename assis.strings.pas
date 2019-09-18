unit Assis.Strings;

interface

uses Classes, SysUtils, StrUtils, Generics.Collections, System.Math;

const
  fmtDATA = 'dd/mm/yyyy';
  fmtHORA = 'hh:nn:ss';
  fmtDATAHORA = 'dd/mm/yyyy hh:nn:ss';
  fmtHORA_PRECISA = 'hh:nn:ss.zzz';
  fmtMES = 'mmm';
  fmtMES_EXTENSO = 'mmmm';

  {QuotedSTR formato SQL}
  fmtDATA_SQL = 'mm-dd-yyyy';
  fmtHORA_SQL = fmtHORA;
  fmtDATAHORA_SQL = 'mm/dd/yyyy hh:nn:ss';
  fmtDATAHORA_PRECISA_SQL = 'mm/dd/yyyy hh:nn:ss zzz';

  function Competencia(Data: Tdate): String; overload;
  function Competencia(Data: TdateTime): String; overload;

type
  ListaDeStrings = Array of string;
  ListaDeNumeros = Array of integer;
  ListaDeValores = Array of Currency;

  stringfmt = record helper for string
    /// <summary>
    ///   Substitui uma palavra reservada por um valor
    /// </summary>
    function template(identifier, value: string): string; overload;

    /// <summary>
    ///   Substitui uma palavra reservada por um valor inteiro
    /// </summary>
    function template(identifier: string; value: integer): string; overload;

    /// <summary>
    ///   Substitui uma série de palavras reservadas por uma lista com vários valores de uma só vez
    /// </summary>
    function template(identifier, value: array of const): string; overload;

    /// <summary>
    ///   Percorre todas as chaves de um tipo TDictionary e substitui cada ocorrência pelo valor correspondente
    /// </summary>
    function template(Values: TDictionary<String, String>): String; overload;

    /// <summary>
    ///   Disponibiliza o Format() "Embeded" no tipo string
    /// </summary>
    function format(values: array of const): string; overload;

    /// <summary>
    ///   Disponibiliza o Format() "Embeded" para passar parâmetro %s sem necessidade de [array of const]
    /// </summary>
    function formats(value: string): string;

    /// <summary>
    ///   Disponibiliza o Format() "Embeded" para passar parâmetro %d sem necessidade de [array of const]
    /// </summary>
    function formatd(value: integer): string;

     /// <summary>
    ///   Disponibiliza o Format() "Embeded" para passar parâmetro %s sem necessidade de [array of const]
    /// </summary>
    function formatdt(value: Tdatetime; Formato: String = fmtDATA): string; overload;

     /// <summary>
    ///   Disponibiliza o Format() "Embeded" para passar parâmetro %s sem necessidade de [array of const]
    /// </summary>
    function formatdt(Data1, Data2: Tdatetime;Formato: String = fmtDATA): string; overload;

    /// <summary>
    ///   Disponibiliza o Format() "Embeded" para passar parâmetro %f sem necessidade de [array of const]
    /// </summary>
    function formatf(value: extended): string;


    /// <summary>
    ///   Formata uma string com uma data ou hora, se ela contiver uma data válida.
    /// </summary>
    /// <remarks>
    ///   Utilize os argumentos no formato da função formatdatetime
    /// </remarks>
    function asDateTime(formatacao: string = 'dd/mm/yyyy'; fail: string = ''): string;

    /// <summary>
    ///   Disponibiliza o Format() "Embeded" no tipo string
    /// </summary>
    /// <remarks>
    ///   Utilize os argumentos no formato da função formatfloat
    /// </remarks>
    function asFloat(formatacao: string = '#0.00'; fail: string = ''): string;

    /// <summary>
    ///   Formata uma string com um inteiro, se ela contiver um valor válido.
    /// </summary>
    function asInteger(fail: string = ''): string;

    /// <summary>
    ///   substitui todos caracteres literais \n por enter
    /// </summary>
    function linebreaks(linebreak: string = '\n'; skip: string = '\\n'): string;

    /// <summary>
    ///   se uma string for vazia, retorna o valor do parâmetro
    /// </summary>
    function onfail(valueonfail: string): string;

    function PrimeiraMaiuscula(MinLength: Integer = 0): String;

    /// <summary>
    ///   se uma string for preenchida retorna um valor, senão outro
    /// </summary>
    /// <remarks>
    ///   aceita o curinga %s para substituir pela própria variável
    /// </remarks>
    function fill(const valor_se_verdadeiro: string = '%s'; const valor_se_falso: String = ''): string;

    /// <summary>
    ///   Insere uma nova linha no final da string; Adiciona quebras de linhas
    /// </summary>
    function append(valor: string; valor2: string = ''; valor3: string = ''): string; overload;
    function append(valor: Tlist<string>): string; overload;
    function append(valores: array of const): string; overload;

    /// <summary>
    ///   Retorna todos os índices das ocorrências de uma determinada substring dentro da string
    /// </summary>
    function FindAll(const Search: String): ListaDeNumeros;

    function Split(Delimitador: String = ';'): ListaDeStrings; overload;
    function Split(Delimitadores: ListaDeStrings): ListaDeStrings; overload;

  end;

  ListStrHelper = record helper for ListaDeStrings
    procedure Add(const Value: String);
    procedure Clear;
    function Count: Integer;
    function IsEmpty: Boolean;
    function IndexOf(const Item: String): Integer;
    function Has(const Item: String): Boolean;
    function AsString: String;

    function Sort: ListadeStrings;
    function UnSort: ListadeStrings;
    function Shuffle: ListadeStrings;
    function Distinct: ListadeStrings;
    function UltimoValor: String;
  end;

  ListIntHelper = record helper for ListaDeNumeros
    procedure Add(const Value: Integer);
    procedure Clear;
    function Count: Integer;
    function IsEmpty: Boolean;
    function IndexOf(const Item: Integer): Integer;
    function Has(const Item: Integer): Boolean;
    function AsString: String;
    function Shuffle: ListaDeNumeros;
    function Sort: ListaDeNumeros;
    function UnSort: ListaDeStrings;
    function Maior: Integer;
    function Menor: Integer;
    function Media: Integer;
    function Mediana: Integer;
    function UltimoValor: Integer;
    function PrimeiroValor: Integer;

    /// <summary>
    ///   Produz a curva da tendencia da serie. Não produz uma regressao linear, apenas uma curva mais suave.
    /// </summary>
    /// <remarks>
    ///   A tendência não se ajusta muito bem aos pontos, para produzir uma curva suave que melhor ajuste aos pontos utilize o método SmoothCurve
    /// </remarks>
    function TrendCurve: ListadeNumeros;

    /// <summary>
    ///   Produz uma curva mais suave a partir de uma sequencia de numeros muito variável, interpolando as médias entre cada ponto
    /// </summary>
    /// <remarks>
    ///   Utiliza o método das médias para determinar os pontos. O vetor resultante possui o tamanho de 2*x-2 do vetor original
    /// </remarks>
    function SmoothCurve: ListadeNumeros;
    function Recorta(Params: String = ':'): ListaDeNumeros;
    function InclinacaoUltimoPonto: Single;

  end;

  ListFltHelper = record helper for ListaDeValores
    procedure Add(const Value: Extended); overload;

    procedure Add(const Value: Extended; Key: String; var Keys: ListadeStrings); overload;
    procedure Clear;
    function Count: Integer;
    function IsEmpty: Boolean;
    function IndexOf(const Item: Extended): Extended;
    function Has(const Item: Extended): Boolean;
    function AsString: String;
    function Shuffle: ListaDeValores;
    function Sort: ListaDeValores;
    function UnSort: ListaDeValores;
    function Maior: Extended;
    function Menor: Extended;
    function Media: Extended;
    function Mediana: Extended;
    function UltimoValor: Extended;
    function PrimeiroValor: Extended;

    /// <summary>
    ///   Produz a curva da tendencia da serie. Não produz uma regressao linear, apenas uma curva mais suave.
    /// </summary>
    /// <remarks>
    ///   A tendência não se ajusta muito bem aos pontos, para produzir uma curva suave que melhor ajuste aos pontos utilize o método SmoothCurve
    /// </remarks>
    function TrendCurve: ListadeValores;

    /// <summary>
    ///   Produz uma curva mais suave a partir de uma sequencia de numeros muito variável, interpolando as médias entre cada ponto
    /// </summary>
    /// <remarks>
    ///   Utiliza o método das médias para determinar os pontos. O vetor resultante possui o tamanho de 2*x-2 do vetor original
    /// </remarks>
    function SmoothCurve: ListadeValores;
    function Recorta(Params: String = ':'): ListaDeValores;
    function InclinacaoUltimoPonto: Single;
    function Soma: Extended;
    function Produto: Extended;

    function Acumulado: ListaDeValores;
//    function Frequencia: ListaDeValores;

end;


  /// <summary>
  /// Retorna uma lista de palavras de uma string. As palavras são separadas por espaço
  /// </summary>
function Palavras(Texto: string): ListaDeStrings;
/// <summary>
/// Divide uma string em uma lista separadas por um ou mais caracteres específicos
/// </summary>
function Split(Texto: string; delimiter: string = ';'): ListaDeStrings; overload;
function Split(Texto: string; delimiters: ListaDeStrings): ListaDeStrings; overload;

function Join(ListaDeStrings: ListaDeStrings; UnionStr: string = ','#13 + '  '): string; overload;
function Join(ListaDeStrings: ListaDeStrings;ListaDeStrings2: ListaDeStrings; UnionStr: string = ','#13 + '  '; const Sep: String = ' '): string; overload;

function JoinFromTList(List: TList<String>; UnionStr: string = ','#13 + '  '): string;

function coalesce(options: array of string): string;

function indexofString(const AText: string; const AValues: listadestrings): integer;

function matchString(const AText: string; const AValues: listadestrings): boolean;

function posany(const substr: string; const source: string): integer;

implementation

  function Competencia(Data: Tdate): String; overload;
  begin
    result := copy(formatdatetime('mmm',Data),1,3) + formatdatetime('yy',Data);
  end;
  function Competencia(Data: TdateTime): String; overload;
  begin
    result := copy(formatdatetime('mmm',Data),1,3) + formatdatetime('yy',Data);
  end;

function matchString(const AText: string; const AValues: listadestrings): boolean;
begin
  result := indexOfString(AText, AValues) > -1;
end;

function indexOfString(const AText: string; const AValues: listadestrings): integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Low(AValues) to High(AValues) do
    if AnsiSameStr(AText, AValues[I]) then
    begin
      Result := I;
      Break;
    end;
end;

function stringfmt.template(identifier, Value: array of const): string;
var
  I: integer;
  MenorTamanho: Integer;
begin
  if Length(identifier) <= Length(Value) then
    MenorTamanho := length(identifier)
  else
    MenorTamanho := length(Value);

  Result := Self;
  for I := 0 to MenorTamanho-1 do
    Result.template(identifier[I],Value[I])
end;


function Split(Texto: string; delimiter: string): ListaDeStrings;
var
  iterador: integer;
  posicao: integer;
  tamanhoMaximo: integer;

  function mover(_input: Integer): Integer;
  begin
    if pos(Texto[iterador], delimiter) > 0 then
      result := _input + 1
    else
      result := _input;
  end;

begin
  if Length(Texto) = 0 then
    begin
      setlength(Result, 0);
      exit;
    end;
  Texto := StringReplace(Texto, #13#10, delimiter[1], [rfReplaceAll]);

  for tamanhoMaximo := length(Texto) downto 1 do
    if (pos(Texto[tamanhoMaximo], delimiter) = 0) then
      break;

  posicao := 0;
  for iterador := 1 to tamanhoMaximo do
    posicao := mover(posicao);

  setLength(Result, posicao + 1);
  // realiza a leitura
  iterador := 1;
  posicao := 1;
  while iterador <= tamanhoMaximo do
  begin
    if pos(Texto[iterador], delimiter) = 0 then
      Result[posicao - 1] := Result[posicao - 1] + Texto[iterador];
    posicao := mover(posicao);
    inc(iterador);
  end;
end;

function Split(Texto: string; delimiters: ListaDeStrings): ListaDeStrings;
var
  iterador: integer;
  posicao: integer;
  tamanhoMaximo: integer;

  function mover(_input: Integer): Integer;
  begin
    if assis.Strings.posAny(Texto[iterador], join(delimiters,'')) > 0 then
      result := _input + 1
    else
      result := _input;
  end;

begin
  if Length(Texto) = 0 then
    begin
      setlength(Result, 0);
      exit;
    end;
  Texto := StringReplace(Texto, #13#10, delimiters[1], [rfReplaceAll]);

  for tamanhoMaximo := length(Texto) downto 1 do
    if assis.Strings.posAny(Texto[TamanhoMaximo], join(delimiters,'')) = 0 then
      break;

  posicao := 0;
  for iterador := 1 to tamanhoMaximo do
    posicao := mover(posicao);

  setLength(Result, posicao + 1);
  // realiza a leitura
  iterador := 1;
  posicao := 1;
  while iterador <= tamanhoMaximo do
  begin
    if posAny(Texto[iterador], join(delimiters,'')) = 0 then
      Result[posicao - 1] := Result[posicao - 1] + Texto[iterador];
    posicao := mover(posicao);
    inc(iterador);
  end;
end;

function Palavras(Texto: string): ListaDeStrings;
begin
  Result := Split(Texto, ' ');
end;

function Join(ListaDeStrings: ListaDeStrings; UnionStr: String): String;
var
  Indice: integer;
begin
  Result := ListaDeStrings[length(ListaDeStrings) - 1];
  for Indice := length(ListaDeStrings) - 2 downto 0 do
    if ListaDeStrings[Indice] <> '' then
      Result := ListaDeStrings[Indice] + UnionStr + Result;
end;

function Join(ListaDeStrings: ListaDeStrings;ListaDeStrings2: ListaDeStrings; UnionStr: String; const Sep: String): String;
var
  Indice: integer;
begin
  if length(ListaDeStrings) <> length(ListaDeStrings2) then
  begin
    result := Join(ListaDeStrings, UnionStr);

  end
  else begin
  Result := ListaDeStrings[length(ListaDeStrings) - 1] + sep + ListaDeStrings2[length(ListaDeStrings) - 1];
  for Indice := length(ListaDeStrings) - 2 downto 0 do
    if ListaDeStrings[Indice] <> '' then
      Result := ListaDeStrings[Indice] + sep + ListaDeStrings2[Indice] + UnionStr + Result;
  end;
end;

function JoinFromTlist(List: TList<String>; UnionStr: String): String;
var
  Indice: integer;
begin
  Result := List[List.Count - 1];
  for Indice := List.Count - 2 downto 0 do
    if List[Indice] <> '' then
      Result := List[Indice] + UnionStr + Result;
end;

function coalesce(options: array of string): string;
var
  localresult: string;
begin
  localresult := '';
  for localresult in Options do
    if localresult <> '' then
        break;
  result := localresult;
end;

function print(args: array of const; sep: string = ' '; &end: string = '\n'): string;
var
  valores: ListaDeStrings;
  I: Integer;
begin
  Setlength(valores, length(args));

  for I := Low(Args) to High(Args) do
  begin
    case TVarRec(Args[I]).VType of
      vtInteger, vtInt64: valores[I] := intToStr(Args[I].VInteger) ;
      vtBoolean:
        begin
          If Args[I].VBoolean then
            valores[I] := 'S' else
            valores[I] := 'N'
        end;
      vtChar, vtString : valores[I] := string(Args[I].VString);
      vtExtended : valores[I] := FormatFloat('#0.00',Args[I].VExtended^);
    end;
  end;

 result := join(Valores, sep);
 if result <> emptystr then
   result := result + &end;
end;


function posany(const substr: string; const source: string): integer;
var
  s: String;
begin
  result := 0;
   for s in substr do
   begin
     result := pos(s,source);
     if result <> 0 then
        break;
   end;
end;

{ stringfmt }

function stringfmt.template(identifier, value: string): string;
begin
    Result := StringReplace(self, identifier, value,[rfReplaceAll]);
    Result := StringReplace(result,'\\n', '**reserved**',[rfReplaceAll]);
    Result := StringReplace(result,'\n', #13,[rfReplaceAll]);
    Result := StringReplace(result,'**reserved**', '\n',[rfReplaceAll]);
end;

function stringfmt.append(valor, valor2, valor3: string): string;
begin
  result := join([self, valor, valor2, valor3], '#13');
end;

function stringfmt.append(valor: Tlist<string>): string;
begin
  result := self + valor.ToString;
end;

function stringfmt.append(valores: array of const): string;
begin
  {Todo: Implementar valores array of const};
end;

function stringfmt.asDateTime(formatacao, fail: string): string;
var
  Data: TDatetime;
begin
  Try
    Data := StrToDateTime(self);
    result := FormatDateTime(formatacao, Data)
  except
    result := fail;
    if result = 'self' then
      result := self;
  End;

end;

function stringfmt.asFloat(formatacao, fail: string): string;
var
  Valor: Double;
begin
  Try
    Valor := StrToFloat(self);
    result := FormatFloat(formatacao, valor)
  except
    result := fail;
    if result = 'self' then
      result := self;
  End;
end;

function stringfmt.asInteger(fail: string): string;
begin
  result := self.asFloat('#0', fail)
end;

function stringfmt.onfail(valueonfail: string): string;
begin
  if self = EmptyStr then
    result := valueonfail
  else
    result := self;
end;

function stringfmt.PrimeiraMaiuscula(MinLength: Integer = 0): String;

var
  Nome: String;
  Nomes: ListaDeStrings;
begin
  Nomes := Self.Split(' ');
  Result := '';
  for Nome in Nomes do
  begin
    if length(Nome) > MinLength then
    begin
      Result := Result + UpperCase(Nome[1]) + Lowercase(Copy(Nome, 2, Length(Nome)-1)) + ' ';
    end else  Result := Result + LowerCase(Nome) + ' ';
  end;
    result := Trim(Result)
      .template('Ç', 'ç');
end;

function stringfmt.Split(Delimitadores: ListaDeStrings): ListaDeStrings;
begin
  result := Assis.Strings.Split(Self, Delimitadores);
end;

function ListIntHelper.Recorta(Params: String = ':'): ListaDeNumeros;
var Inicio, Fin: Integer; a: Integer; test: String;
begin
  Params := StringReplace(Params, '[', '', []);
  Params := StringReplace(Params, ']', '', []);
  if pos (':', Params) > 0 then
   begin
     if pos (':', Params) = 1 then
     begin
       Inicio := 0;
     end;

     Test := '';
     for a := pos (':', Params)+1 to length(Params) do
     begin
       Test := Test + Params[a];
     end;
     Fin := StrToIntDef(Test,-1);
   end else
   begin
     Result.Clear;
     Inicio := StrToIntDef(Params, 9999999);
     if Inicio <  0 then
     begin
       Inicio := length(self) + Inicio;
       Fin := Length(Self);
     end else
     begin
       Fin := StrToIntDef(Test,-1);
       if Fin = -1 then
        exit() else

       if Fin > Length(Self) then
        exit() else
        begin
          result.Clear;
          Result.Add(Self[Fin]);
          Exit;
        end;
     end;
   end;

   if ((Fin<0) and (-Fin> Length(Self)) ) then
    Fin := -Length(Self);

   if Fin < 0 then
      Fin := length(self) + fin;

   if Inicio<0 then
     Inicio := length(self) + fin;

   result.Clear;
   for a := Inicio to Fin-1 do
   begin
    result.Add(Self[a]);
   end;

end;

function stringfmt.Split(Delimitador: String): ListaDeStrings;
begin
  result := Assis.Strings.Split(Self, Delimitador);
end;

function stringfmt.fill(const valor_se_verdadeiro, valor_se_falso: String): string;
begin
  if self <> '' then
    result := valor_se_verdadeiro.template('%s', self)
  else
    result := valor_se_falso.template('%s', self)
end;

function stringfmt.FindAll(const Search: String): ListaDeNumeros;
var I: Integer;
begin
  Result.Clear;
  I := 1;
  while I < length(Self) do
  begin
    if Copy(Self, I, length(Search)) = Search then
      begin
        Result.Add(I);
        I := I + Length(Search);

      end else
      I := I +1;
  end;

end;

function stringfmt.format(values: array of const): string;
begin
  result := SysUtils.Format(self, values);
end;

function stringfmt.formats(value: string): string;
begin
  result := SysUtils.format(self, [value]);
end;

function stringfmt.formatd(value: integer): string;
begin
  result := SysUtils.format(self, [value]);
end;

function stringfmt.formatdt(value: Tdatetime; Formato: String): string;
begin
       result := self
    .formats(FormatDateTime(Formato, value))
end;

function stringfmt.formatdt(Data1, Data2: Tdatetime; Formato: String): string;
begin
  result := self
    .formats(FormatDateTime(Formato, Data1))
    .formats(FormatDateTime(Formato, Data2))
end;

function stringfmt.formatf(value: extended): string;
begin
  result := SysUtils.format(self, [value]);
end;

function stringfmt.linebreaks(linebreak, skip: string): string;
const
  reserved = '**reserved**';
begin
  result := self .template(skip, reserved)
                 .template(linebreak, #13)
                 .template(reserved, linebreak);
end;

function stringfmt.template(identifier: string; value: integer): string;
begin
  result := self.template(identifier, intToStr(value))
end;

function stringfmt.template(Values: TDictionary<String, String>): String;
var
  sKey, sTemp: String;
begin
  sTemp := self;
  for sKey in Values.Keys do
    sTemp := sTemp.Template(sKey, Values.Items[sKey]);

  result := sTemp;
end;

function ListStrHelper.UltimoValor: String;
begin
  if length(self) > 0 then
    result := self[Length(Self)-1]
  else
    result := '';
end;

{ ListStrHelper }

procedure ListStrHelper.Add(const Value: String);
var
  Ultimo: Integer;
begin
  Ultimo := length(self);
  setLength(self, Ultimo+1);
  self[Ultimo] := Value;
end;

function ListStrHelper.AsString: String;
var I: Integer;
begin
  if length(self) = 0 then
    Exit('');

  result := self[0];

  for I  := 1 to length(self)-1 do
    result := result  + ', ' + self[i];
end;

procedure ListStrHelper.Clear;
begin
  setLength(self,0);
end;

function ListStrHelper.Count: Integer;
begin
  result := length(self);
end;

function ListStrHelper.Distinct: ListadeStrings;
var Item: String;
begin
  result := [];
  for Item in Self do
  begin
    if not result.Has(Item) then
      result.Add(Item);
  end;
end;

function ListStrHelper.IndexOf(const Item: String): Integer;
var I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
      if self[i] <> Item then
        Continue
      else
      begin
        result := I;
        break
      end;

end;

function ListStrHelper.Has(const Item: String): Boolean;
var I: Integer;
begin
  Result := False;
  for I := 0 to Count - 1 do
      if self[i] <> Item then
        Continue
      else
      begin
        result := True;
        break
      end;
end;

function ListStrHelper.IsEmpty: Boolean;
begin
  result := length(self) = 0;
end;

function ListStrHelper.Shuffle: ListadeStrings;


var 
  Item: Integer;
  Indices: ListaDeNumeros;
  I: Integer;
begin
  result := [];
  Indices := [];
  
  for I := 1 to Self.Count do
    Indices.Add(I);
  Indices.Shuffle;
  
  for Item in Indices do
  begin
    if not result.Has(Self[Item]) then
      result.Add(Self[Item]);
  end;
end;

function ListStrHelper.Sort: ListadeStrings;
var
   Posicao_1, Posicao_2: Integer;
   Temporario : String; 
begin
   for Posicao_1 := 0 to self.Count - 1 do
   begin
      for Posicao_2 := 0 to ( self.Count- 2 ) do
      begin
         if ( Self[ Posicao_2 ] > Self[ Posicao_2 + 1 ]) then  // Ordem Crescente
         begin
            Temporario := Self[ Posicao_2 ];
            Self[ Posicao_2 ] := Self[ Posicao_2 + 1 ];
            Self[ Posicao_2 + 1 ] := Temporario;
         end;
      end;
   end;
end;

function ListStrHelper.UnSort: ListadeStrings;
var
   Posicao_1, Posicao_2: Integer;
   Temporario : String; 
begin
   for Posicao_1 := 0 to self.Count - 1 do
   begin
      for Posicao_2 := 0 to ( self.Count- 2 ) do
      begin
         if ( Self[ Posicao_2 ] < Self[ Posicao_2 + 1 ]) then  // Ordem Decrescente
         begin
            Temporario := Self[ Posicao_2 ];
            Self[ Posicao_2 ] := Self[ Posicao_2 + 1 ];
            Self[ Posicao_2 + 1 ] := Temporario;
         end;
      end;
   end;
end;

{ ListIntHelper }

procedure ListIntHelper.Add(const Value: Integer);
var
  Ultimo: Integer;
begin
  Ultimo := length(self);
  setLength(self, Ultimo+1);
  self[Ultimo] := Value;
end;

function ListIntHelper.AsString: String;
var I: Integer;
begin

  if length(self) = 0 then
    Exit('');

  result := IntToStr(self[0]);

  for I  := 1 to length(self)-1 do
    result := result  + ', ' + IntToStr(self[i]);

end;

procedure ListIntHelper.Clear;
begin
  setLength(self,0);

end;

function ListIntHelper.Count: Integer;
begin
  result := length(self);

end;

function ListIntHelper.PrimeiroValor: Integer;
begin
  if Self.count > 0 then
  result := self[0]
  else result := -999999999;
end;

function ListIntHelper.Has(const Item: Integer): Boolean;
var I: Integer;
begin
  Result := False;
  for I := 0 to Count - 1 do
      if self[i] <> Item then
        Continue
      else
      begin
        result := True;
        break
      end;
end;

function ListIntHelper.InclinacaoUltimoPonto: Single;
begin
  if length(Self)> 1 then
  begin
    result := (self[length(Self)-2] - self[length(Self)-1])/self[length(Self)-2];
  end else
  begin
    result := 0;
  end;
end;

function ListIntHelper.IndexOf(const Item: Integer): Integer;
var I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
      if self[i] <> Item then
        Continue
      else
      begin
        result := I;
        break
      end;
end;

function ListIntHelper.SmoothCurve: ListadeNumeros;
  var N: Integer;
      Smoot: ListadeNumeros;
begin
  Smoot := Self.TrendCurve;
  result.clear;
  for N := 0 to self.count-2 do
  begin
    result.add(self[N]);
    result.add(Smoot[N+1]);
  end;
end;

function ListIntHelper.IsEmpty: Boolean;
begin
  result := length(self) = 0;
end;

function ListIntHelper.UltimoValor: Integer;
begin
  if Self.count > 0 then
  result := self[self.count-1]
  else result := maxint;
end;

function ListIntHelper.Maior: Integer;
var N: Integer;
begin
  result := -999999999;
  if Self.Count > 0 then
    for N in Self do
    begin
      if N > Result then
        result := N
    end;
end;

function ListIntHelper.Media: Integer;
var I, Soma: Integer;
begin
  Soma := 0;
  for I in Self do
  begin
    Soma := Soma + I
  end;
  if length(Self)>0 then
    result := soma div length(Self)
  else
    result := 0;
end;

function ListIntHelper.Mediana: Integer;
begin
    result := 0;

end;

function ListIntHelper.Menor: Integer;
var N: Integer;
begin
  result := MaxInt;
  if Self.Count > 0 then
    for N in Self do
    begin
      if N < Result then
        result := N
    end;
end;

function ListIntHelper.Shuffle: ListaDeNumeros;
var I: Integer;
begin
  randomize;
  result := [];
  while result.Count < self.Count do
  begin
    I := Random(self.Count);
    if not result.Has(I) then
      result.Add(I);
  end;


end;

function ListIntHelper.TrendCurve: ListadeNumeros;
var I: Integer; Soma, Med: integer;
begin
  if length(self) < 3 then
    Exit(self);

  Result.Clear;
  Result.Add(Self.PrimeiroValor);
  for I := 1 to length(Self)-2 do
  begin
    Soma := Self[I-1] + Self[I] + Self[I+1];
    Med := Soma div 3;
    Result[I] := Med;
  end;
  Result.Add(Self.UltimoValor);

end;

function ListIntHelper.Sort: ListaDeNumeros;

var
   Posicao_1, Posicao_2: Integer;
   Temporario : Integer;
begin
   for Posicao_1 := 0 to self.Count - 1 do
   begin
      for Posicao_2 := 0 to ( self.Count- 2 ) do
      begin
         if ( Self[ Posicao_2 ] > Self[ Posicao_2 + 1 ]) then  // Ordem Crescente
         begin
            Temporario := Self[ Posicao_2 ];
            Self[ Posicao_2 ] := Self[ Posicao_2 + 1 ];
            Self[ Posicao_2 + 1 ] := Temporario;
         end;
      end;
   end;
end;

function ListIntHelper.UnSort: ListaDeStrings;

var
   Posicao_1, Posicao_2: Integer;
   Temporario : Integer; 
begin
   for Posicao_1 := 0 to self.Count - 1 do
   begin
      for Posicao_2 := 0 to ( self.Count- 2 ) do
      begin
         if ( Self[ Posicao_2 ] < Self[ Posicao_2 + 1 ]) then  // Ordem Decrescente
         begin
            Temporario := Self[ Posicao_2 ];
            Self[ Posicao_2 ] := Self[ Posicao_2 + 1 ];
            Self[ Posicao_2 + 1 ] := Temporario;
         end;
      end;
   end;

end;

{ ListFltHelper }

procedure ListFltHelper.Add(const Value: Extended);
var
  Ultimo: Integer;
begin
  Ultimo := length(self);
  setLength(self, Ultimo+1);
  self[Ultimo] := Value;
end;

function ListFltHelper.Acumulado: ListaDeValores;
var
  Valor: Currency;
  Item: Extended;
begin
  result.Clear;
  Valor := 0;
  for Item in Self do
  begin
    Valor := Valor + Item;
    Result.Add(Valor);
  end;
end;

procedure ListFltHelper.Add(const Value: Extended; Key: String; var Keys: ListadeStrings);
var
  Ultimo: Integer;
begin
  if Keys.IndexOf(KEY)>-1 then
    Self[Keys.IndexOf(KEY)] := Self[Keys.IndexOf(KEY)] + Value
  else
  begin
    Ultimo := length(self);
    setLength(self, Ultimo+1);
    self[Ultimo] := Value;
    Keys.Add(Key);
  end;
  end;

function ListFltHelper.AsString: String;
var I: Integer;
begin

  if length(self) = 0 then
    Exit('');

  result := FormatFloat('#.###.###0,00######',self[0]);

  for I  := 1 to length(self)-1 do
    result := result  + '; ' + FormatFloat('#.###.###0,00######',self[i]);
end;

procedure ListFltHelper.Clear;
begin
  SetLength(self,0);
end;

function ListFltHelper.Count: Integer;
begin
  result := length(self);
end;

function ListFltHelper.Has(const Item: Extended): Boolean;
var I: Integer;
begin
  Result := False;
  for I := 0 to Count - 1 do
      if self[i] <> Item then
        Continue
      else
      begin
        result := True;
        break
      end;
end;

function ListFltHelper.InclinacaoUltimoPonto: Single;
begin
  raise Exception.Create('Relação desconhecida dx/dy');
end;

function ListFltHelper.IndexOf(const Item: Extended): Extended;
var I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
      if self[i] <> Item then
        Continue
      else
      begin
        result := I;
        break
      end;
end;

function ListFltHelper.IsEmpty: Boolean;
begin
result := length(Self) = 0
end;

function ListFltHelper.Maior: Extended;
var N: Extended;
begin
  result := -999999999;
  if Self.Count > 0 then
    for N in Self do
    begin
      if N > Result then
        result := N
    end;
end;

function ListFltHelper.Soma: Extended;
var N: Extended;
begin
  result := 0;
  if Self.Count > 0 then
    for N in Self do
    begin
        result := result + N
    end;
end;

function ListFltHelper.Produto: Extended;
var N: Extended;
begin
  result := 0;
  if Self.Count > 0 then
    for N in Self do
    begin
        result := result * N
    end;
end;

function ListFltHelper.Media: Extended;
var I, Soma: Extended;
begin
  Soma := 0;
  for I in Self do
  begin
    Soma := Soma + I
  end;
  if length(Self)>0 then
    result := soma / length(Self)
  else
    result := 0;
end;

function ListFltHelper.Mediana: Extended;
begin
  raise Exception.Create('MEDIANA ainda não implementada');

end;

function ListFltHelper.Menor: Extended;
var N: Extended;
begin
  result := MaxExtended;
  if Self.Count > 0 then
    for N in Self do
    begin
      if N < Result then
        result := N
    end;
end;

function ListFltHelper.PrimeiroValor: Extended;
begin
  if length(self) > 0 then
    result := self[0]
  else
    result := 0;
end;

function ListFltHelper.Recorta(Params: String = ':'): ListaDeValores;
var Inicio, Fin: Integer; a: Integer; test: String;
begin
  Params := StringReplace(Params, '[', '', []);
  Params := StringReplace(Params, ']', '', []);
  if pos (':', Params) > 0 then
   begin
     if pos (':', Params) = 1 then
     begin
       Inicio := 0;
     end;

     Test := '';
     for a := pos (':', Params)+1 to length(Params) do
     begin
       Test := Test + Params[a];
     end;
     Fin := StrToIntDef(Test,-1);
   end else
   begin
     Result.Clear;
     Inicio := StrToIntDef(Params, 9999999);
     if Inicio <  0 then
     begin
       Inicio := length(self) + Inicio;
       Fin := Length(Self);
     end else
     begin
       Fin := StrToIntDef(Test,-1);
       if Fin = -1 then
        exit() else

       if Fin > Length(Self) then
        exit() else
        begin
          result.Clear;
          Result.Add(Self[Fin]);
          Exit;
        end;
     end;
   end;

   if ((Fin<0) and (-Fin> Length(Self)) ) then
    Fin := -Length(Self);

   if Fin < 0 then
      Fin := length(self) + fin;

   if Inicio<0 then
     Inicio := length(self) + fin;

   result.Clear;
   for a := Inicio to Fin-1 do
   begin
    result.Add(Self[a]);
   end;

end;

function ListFltHelper.Shuffle: ListaDeValores;
var I: Integer;
begin
  randomize;
  result := [];
  while result.Count < self.Count do
  begin
    I := Random(self.Count);
    if not result.Has(I) then
      result.Add(I);
  end;
end;

function ListFltHelper.SmoothCurve: ListadeValores;
  var N: Integer;
      Smoot: ListadeValores;
begin
  Smoot := Self.TrendCurve;
  result.clear;
  for N := 0 to self.count-2 do
  begin
    result.add(self[N]);
    result.add(Smoot[N+1]);
  end;
end;

function ListFltHelper.Sort: ListaDeValores;
var
   Posicao_1, Posicao_2: Integer;
   Temporario : Extended;
begin
   for Posicao_1 := 0 to self.Count - 1 do
   begin
      for Posicao_2 := 0 to ( self.Count- 2 ) do
      begin
         if ( Self[ Posicao_2 ] > Self[ Posicao_2 + 1 ]) then  // Ordem Crescente
         begin
            Temporario := Self[ Posicao_2 ];
            Self[ Posicao_2 ] := Self[ Posicao_2 + 1 ];
            Self[ Posicao_2 + 1 ] := Temporario;
         end;
      end;
   end;
   result := self;
end;

function ListFltHelper.TrendCurve: ListadeValores;
var I: Integer; Soma, Med: Extended;
begin
  if length(self) < 3 then
    Exit(self);

  Result.Clear;
  Result.Add(Self.PrimeiroValor);
  for I := 1 to length(Self)-2 do
  begin
    Soma := Self[I-1] + Self[I] + Self[I+1];
    Med := Soma / 3;
    Result[I] := Med;
  end;
  Result.Add(Self.UltimoValor);
end;

function ListFltHelper.UltimoValor: Extended;
begin
  if Self.count > 0 then
  result := self[self.count-1]
  else result := MaxExtended;
end;

function ListFltHelper.UnSort: ListaDeValores;
var
   Posicao_1, Posicao_2: Integer;
   Temporario : Extended;
begin
   for Posicao_1 := 0 to self.Count - 1 do
   begin
      for Posicao_2 := 0 to ( self.Count- 2 ) do
      begin
         if ( Self[ Posicao_2 ] < Self[ Posicao_2 + 1 ]) then  // Ordem Decrescente
         begin
            Temporario := Self[ Posicao_2 ];
            Self[ Posicao_2 ] := Self[ Posicao_2 + 1 ];
            Self[ Posicao_2 + 1 ] := Temporario;
         end;
      end;
   end;
   result := self;
end;

end.
