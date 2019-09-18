unit Assis.SolveEquation;

interface

uses System.SysUtils, System.Classes, JvExprParser, assis.strings, SYSTEM.Json, BI.FuncoesDisponiveis;

type
  TEventoCustomFunction = function (Sender: TObject; const FuncName: string; const Args: Variant; var ResVal: Variant): Boolean of object;
  TEventoCustomVariaveis = function (Sender: TObject; const VarName: string; var Value: Variant): Boolean of object;


  /// <summary>
  ///   Resolve equa��es no formato STRING
  /// </summary>
  /// <remarks>
  ///   Usage:
  ///   var Solver: TSolver := TSolver.New(' VendaTotal / !MetaVendas ')
  ///       .setJsonVariaveis({"!MetaVendas" : "1000000.00", "pi" : "3.14159"}
  ///       .setJsonDataset({"VendaTotalBruta" : "980000,00", "VendaTotalLiquida" : "pi() * 300410"}
  ///       .EventoOnCustomFunction (AlgumMetodo)
  ///       .EventoOnCustomVariaveis(AlgumMetodo)
  ///       .Solve;
  ///       If Solver.Erros.Count = 0
  ///       for Solucao in Solver.results do Showmessage(Solucao);
  ///
  /// </remarks>
  TSolver = class
      {M�todos of Object para preencher os eventos ReadVariable e ReadFormula}
      function SolveCustomFunction(Sender: TObject; const FuncName: string; const Args: Variant; var ResVal: Variant): Boolean;
      function ReadVariable(Sender: TObject; const VarName: string; var Value: Variant): Boolean;
    private

      {$REGION 'Eventos'}

      {$ENDREGION}
      JsonVariaveis: String;
      JsonDataset: TJsonObject;
      fFormulas: ListaDeStrings;
      fResults: ListaDeStrings;
      fErros: ListaDeStrings;
      fDatabase: TDatetime;
      FOnCustomFunction: TEventoCustomFunction;
      FOnCustomVariaveis: TEventoCustomVariaveis;
      procedure SetOnCustomFormula(const Value: TEventoCustomFunction);
      procedure SetOnCustomVariaveis(const Value: TEventoCustomVariaveis);

    public
      /// <summary>
      ///   L� as vari�veis de um JSON String e substitui na f�rmula
      /// </summary>
      class function ProcessaFormulaJson(const aFormula: String; aJson: String): String; overload;

      /// <summary>
      ///   L� as vari�veis de um JSON TJsonObject e substitui na f�rmula
      /// </summary>
      class function ProcessaFormulaJson(const aFormula: String; aJson: TJsonObject): String; overload;

      class function New(Formula: String): TSolver; overload;
      class function New(Formulas: ListaDeStrings): TSolver; overload;
    //DATASAMPLE =
      {
       "current_datetime": "2019-07-06 11:20:59.451" ,
        "EMP": "1" ,
        "Indicador": "(A919E6BA-000B-41DE-B22A-75ABFA4037E8)" ,
        "Temperatura": "20�C" ,
        "Pressao" : "1Atm",
        "Largura" : "30cm"
        "Altura" : "100cm"
        "Quantidade" : "=(2*Altura*Largura)'metros' "  /// Por exemplo, toda vez que come�ar com Igual, pode resolver outra equacao
      }
      function SetJsonVariaveis(const JSON: String): TSolver;
      function SetJsonDataset(const JSON: TJsonObject): TSolver; /// Aceita apenas JSON de um registro. Se aceitar v�rios registros, deve passar algum m�todo de SUMMARY , por exemplo AVG(COLUNAX)
//      procedure SetDataset(const Table: TfdMemTable); /// Imagina voc� passar uma lista com os datasets e a f�rmula pode ler uma coluna do dataset. A f�rmula n�o percorre o dataset, ele deve ser percorrido por outro m�todo
//      procedure SetData(const JSON: TJsonValue); Overload;
      function Results: ListaDeStrings;
      function Erros: ListaDeStrings;

      /// <summary>
      ///   Atribua um evento OnCustomFunction para o Solver resolver fun��es customizadas
      /// </summary>
      /// <remarks>
      ///   Usage: Quando voc� atribui um evento OnCustomFunction, ao resolver uma Function dentro da equa��o, o Solver tenta
      ///   primeiro encontrar a fun��o dentro do m�todo OnCustomFunction, se n�o encontrar ele procura no pr�prio evento interno.
      ///   Se n�o encontrar a fun��o em nenhum m�todo, o solver retorna uma Exception
      ///   Exp = " 2 * MeuPi * R "
      ///   OnCustomFunction --> function MeuPii: Double <== 3.15
      ///   Erro: Fun��o MeuPi n�o encontrada
       /// </remarks>
      function EventoOnCustomFunction(Value: TEventoCustomFunction): TSolver;

      /// <summary>
      ///   Atribua um evento OnCustomVariaveis para o Solver resolver vari�veis customizadas.
      ///   As vari�veis podem ser informadas pelo pr�prio usu�rio
      /// </summary>
      /// <remarks>
      ///   Usage: Quando voc� atribui um evento OnCustomFunction, ao resolver uma vari�vel que n�o esteja no JSON, o Solver tenta
      ///   primeiro encontrar a vari�vel dentro do m�todo OnCustomVariaveis, se n�o encontrar ele procura no pr�prio evento interno.
      ///   O Solver sempre vai procurar primeiro pela vari�vel nos arquivos Json "JSONVar" e "JSONDat"
      ///   Se n�o encontrar a vari�vel em nenhum m�todo, o solver retorna uma Exception
      ///   Data = { "x' : "2", "a" : "1" }
      ///   Exp = " 2 * x * x + a*m "
      ///   OnCustomVariaveis --> x <== 3.15  ~desconsidera, pois x j� foi encontrado no objeto "JSONVar"
      ///   Erro: vari�vel m n�o encontrada
       /// </remarks>
      function EventoOnCustomVariaveis(Value: TEventoCustomVariaveis): TSolver;

      /// <summary>
      ///  Passa a data de refer�ncia que est� sendo feito o c�lculo.
      ///  Por exemplo M�dia do pedido de jun de 2019. dever� ser passada uma data v�lida do m�s de jun 2019
      /// </summary>
      function SetDataBase(Value: TDatetime): TSolver;

      /// <summary>
      ///   Para cada Formula em "Formulas[0...n-1], preenche a matriz de vari�veis "Results[0...n-1]" com os resultados. Se ocorrer erro, preenche os erros Erros[0...n-1]
      /// </summary>
      function Solve: TSolver;

    published
      property OnCustomFunction: TEventoCustomFunction read FOnCustomFunction write SetOnCustomFormula;
      property OnCustomVariaveis: TEventoCustomVariaveis read FOnCustomVariaveis write SetOnCustomVariaveis;
  end;

implementation

{ TSolver }

  class function TSolver.ProcessaFormulaJson(const aFormula: String; aJson: String): String;
  var
    JObject: TJsonObject;
    JValue: TJSONPair;
  begin
    result := aFormula;
    JObject:=TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(aJSON),0) as TJSONObject;
    If (JObject <> Nil) then
      if JObject.Count > 0 then
        for JValue in JObject do
          result := result.template(JValue.JsonString.ToString.template('"',''), JValue.JsonValue.ToString.template('"',''));
  end;

  class function TSolver.ProcessaFormulaJson(const aFormula: String; aJson: TJsonObject): String;
  var
    JValue: TJSONPair;
  begin
    result := aFormula;
    for JValue in aJson do
      result := result.template(JValue.JsonString.ToString.template('"',''), JValue.JsonValue.ToString.template('"',''));
  end;



function TSolver.Erros: ListaDeStrings;
begin
  result := fErros;
end;

function TSolver.EventoOnCustomFunction(Value: TEventoCustomFunction): TSolver;
begin
  result := self;
  result.OnCustomFunction := value;
end;

function TSolver.EventoOnCustomVariaveis(Value: TEventoCustomVariaveis): TSolver;
begin
  result := self;
  result.OnCustomVariaveis := value;
end;

class function TSolver.New(Formulas: ListaDeStrings): TSolver;
var
  S: String;
begin
  result := TSolver.Create;
  for S in Formulas do
      Result.FFormulas.Add(S);
  result.fDatabase := now;
end;

class function TSolver.New(Formula: String): TSolver;
begin
  Result := TSolver.New([Formula]);
end;

function TSolver.ReadVariable(Sender: TObject; const VarName: string; var Value: Variant): Boolean;
begin
  result := false;
  if lowercase(VarName) = 'x' then
  begin
    try
      Value := Trunc(10);
      result := true;
    except
      Value := 'Vari�vel x inv�lida';
      Exit;
    end;
  end;

end;

function TSolver.Results: ListaDeStrings;
begin
  Result := fResults
end;

function TSolver.SetDataBase(Value: TDatetime): TSolver;
begin
  result := self;
  fDatabase := Value;
end;

function TSolver.SetJsonDataset(const JSON: TJsonObject): TSolver;
begin
  result := self;
  result.JsonDataset :=  JSON;
end;

function TSolver.SetJsonVariaveis(const JSON: String): TSolver;
begin
  result := self;
  result.JsonVariaveis := JSON;
end;

procedure TSolver.SetOnCustomFormula(const Value: TEventoCustomFunction);
begin
  FOnCustomFunction := Value;
end;

procedure TSolver.SetOnCustomVariaveis(const Value: TEventoCustomVariaveis);
begin
  FOnCustomVariaveis := Value;
end;

function TSolver.Solve: TSolver;
  var 
    Formula: string; 
    FormulaPronta: string;    
    P: TExprParser;
    Indice: Integer;
begin
  while fFormulas.Count > fErros.Count do
    fErros.Add('');
  while fFormulas.Count > fResults.Count do
    fResults.Add('');
  result := self;
  Indice := -1;
  for Formula in fFormulas do
  begin
    Indice := Indice + 1;
    P := TExprParser.Create;
    
    try
      {$REGION 'Atribui eventos'}
        if assigned(FOnCustomFunction) then
          P.OnExecuteFunction := FOnCustomFunction else
          P.OnExecuteFunction := SolveCustomFunction;     
        if assigned(FOnCustomVariaveis) then
          P.OnGetVariable := FOnCustomVariaveis else
          P.OnGetVariable := ReadVariable;
      {$ENDREGION}
    
      {$REGION 'Preprocessar f�rmula, em seguida substituir vari�veis da f�rmula a partir dos arquivos JSON'}
        FormulaPronta := Preprocessar(Formula, fDatabase);
        FormulaPronta := ProcessaFormulaJson(FormulaPronta, JsonVariaveis); 
        FormulaPronta := ProcessaFormulaJson(FormulaPronta, JsonDataset);
      {$ENDREGION}
      P.Eval(FormulaPronta);
      fResults[Indice] := P.Value;
    except on E: Exception do
      begin
        fErros[Indice] := E.Message;
        fResults[Indice] := '0';
      end;
    end;
    FreeAndNil(P);
  end;

end;

function TSolver.SolveCustomFunction(Sender: TObject; const FuncName: string; const Args: Variant; var ResVal: Variant): Boolean;
begin
  result := false;
  if lowercase(FuncName) = 'trunc' then
  begin
    try
      ResVal := Trunc(Args);
      result := true;
    except
      ResVal := 'Trunc(' + Args.ToString + ') n�o retornou um n�mero v�lido';
      Exit;
    end;
  end;

end;

end.
