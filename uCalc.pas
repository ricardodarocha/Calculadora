unit uCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ValEdit, Vcl.Buttons, JvExprParser, uGeneralIcon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, Vcl.ComCtrls,
  FireDAC.Comp.Client, uFuncoes, uVariaveis;

type
  TfrmCalc = class(TForm)
    Display: TMemo;
    MemoFormula: TMemo;
    ListHistorico: TListBox;
    VariablesEditor: TValueListEditor;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    btnLimparHistorico: TSpeedButton;
    btnC: TSpeedButton;
    btnBack: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    btnMinus: TSpeedButton;
    SpeedButton25: TSpeedButton;
    btnInverteSinal: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    btnIgual: TSpeedButton;
    btnEval: TSpeedButton;
    btnArroba: TSpeedButton;
    btnSharp: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    Qir_estable_dadosConnection: TFDConnection;
    ConsultaconexaoTable: TFDQuery;
    ListView1: TListView;
    ConsultaconexaoTableID: TGuidField;
    ConsultaconexaoTableCodigo: TFDAutoIncField;
    ConsultaconexaoTableCodigoConsulta: TIntegerField;
    ConsultaconexaoTableCodigoConexao: TIntegerField;
    ConsultaconexaoTableCodigoIndicador: TIntegerField;
    ConsultaconexaoTableQuery: TWideMemoField;
    ConsultaconexaoTableFiltro: TWideMemoField;
    ConsultaconexaoTableIndicador: TGuidField;
    ConsultaconexaoTableParametros: TWideMemoField;
    ConsultaconexaoTableMacros: TWideMemoField;
    BindingsList1: TBindingsList;
    IndicadoresTable: TFDQuery;
    IndicadoresTableID: TGuidField;
    IndicadoresTableCodigo: TFDAutoIncField;
    IndicadoresTableNome: TStringField;
    IndicadoresTableFaixaBaixa: TBCDField;
    IndicadoresTableFaixaOtima: TBCDField;
    IndicadoresTableCorBaixa: TIntegerField;
    IndicadoresTableCorMedia: TIntegerField;
    IndicadoresTableCorOtima: TIntegerField;
    IndicadoresTableValorMaximo: TBCDField;
    IndicadoresTableGrupo: TIntegerField;
    IndicadoresTableTipo: TIntegerField;
    IndicadoresTableTags: TStringField;
    IndicadoresTableData: TSQLTimeStampField;
    IndicadoresTableConsultor: TStringField;
    IndicadoresTableFormula: TWideMemoField;
    IndicadoresTableOwnerIndicator: TStringField;
    IndicadoresTableOwnerUser: TStringField;
    IndicadoresTableRota: TStringField;
    IndicadoresTableIcone: TIntegerField;
    IndicadoresTableUnidade: TStringField;
    IndicadoresTableMultiplicador: TIntegerField;
    IndicadoresTableConsulta: TGuidField;
    IndicadoresTableStatus: TStringField;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB1: TBindSourceDB;
    procedure Digita(Sender: TObject);
    procedure btnInverteSinalClick(Sender: TObject);
    procedure Solve(Sender: TObject);
    procedure DisplayKeyPress(Sender: TObject; var Key: Char);
    procedure Clear(Sender: TObject);
    procedure Backspace(Sender: TObject);
    procedure LimparHistorico(Sender: TObject);
    procedure DisplayChange(Sender: TObject);

     function GabrielVariable(Sender: TObject; const VarName: string;
    var Value: Variant): Boolean;
   function gabrielFunction(Sender: TObject; const FuncName: string;
    const Args: Variant; var ResVal: Variant): Boolean;

  private
    function getExpressao: String;
    { Private declarations }
  public
    property Expressao: String read getExpressao;
  end;

var
  frmCalc: TfrmCalc;

implementation

{$R *.dfm}

procedure TfrmCalc.Solve(Sender: TObject);
var
  P: TExprParser;
begin
  P := JvExprParser.TExprParser.Create;
  P.OnGetVariable := GabrielVariable;
  P.OnExecuteFunction := GabrielFunction;

  ListHistorico.Items.Insert(0,Display.lines.Strings[0]);
  if P.Eval(Expressao) then
  begin
    Display.Text :=  P.Value;
    Display.SelectAll;
    if Display.Lines.Strings[0] = '' then
       Display.Lines.Text := '0';
    MemoFormula.Text := P.Expression ;
  end
  else
    MemoFormula.Text := P.Expression +' | '+ P.ErrorMessage;

end;

procedure TfrmCalc.Clear(Sender: TObject);
begin
  Display.Lines.Text := '0';
end;

procedure TfrmCalc.Backspace(Sender: TObject);
begin
Display.SelStart := Length(Display.Text);
Display.Perform(WM_CHAR, VK_BACK, 1);
end;

procedure TfrmCalc.btnInverteSinalClick(Sender: TObject);
begin
  if Length(Display.Lines.Strings[0]) = 0 then
  begin
    Digita(btnMinus);
    Exit;
  end;

  if Display.Text[1] = '-' then
    Display.Text := Copy(Display.Lines.Strings[0],2,length(Display.Lines.Strings[0])-2)
  else
    Display.Text := '-' + Display.Lines.Strings[0];
end;

procedure TfrmCalc.Digita(Sender: TObject);
var
  Curs: Integer;
begin
  if (Display.SelLength = Length(Display.Lines.Strings[0])) and (length(Display.Text)>0) then
  begin
    if TspeedButton(Sender).Hint[1] in ['*','-','+','/','\','%']  then
    begin
      Display.Lines.Text := Display.Lines.Strings[0]
        + TspeedButton(Sender).Hint;
      Display.selstart := length(Display.Lines.Strings[0]);
      Exit;
    end
    else if TspeedButton(Sender).Hint[1] in ['(']  then
    begin

    end else
    begin
      Display.Lines.Text := TSpeedButton(Sender).Hint;
    end;
  end
  else
  begin
    Curs := Display.SelStart;
    if Display.Lines.Strings[0]= '0' then
      Display.Lines.Text := '';
    Display.lines.Text := copy(Display.Lines.Strings[0],1,Display.SelStart)
      + TspeedButton(Sender).Hint
      + Copy(Display.Lines.Strings[0]
        , Display.SelStart + Display.SelLength + 1
        ,length(Display.Lines.Strings[0])-(Display.SelStart + Display.SelLength));

    if Display.Lines.Strings[0] = ''  then
      Display.Lines.Text := '0';

    Display.SelStart := Curs + 1;
  end;
end;

procedure TfrmCalc.DisplayChange(Sender: TObject);
begin
  if Display.Lines.Strings[0] = ',' then
    Display.Lines.Text := '0' + Display.Lines.Strings[0];
  
end;

procedure TfrmCalc.DisplayKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  Solve(btnIgual);
end;

function TfrmCalc.gabrielFunction(Sender: TObject; const FuncName: string; const Args: Variant; var ResVal: Variant): Boolean;
begin
   resVal := ResolveFuncao(FuncName, Args);
end;

function TfrmCalc.GabrielVariable(Sender: TObject; const VarName: string; var Value: Variant): Boolean;
begin
  result := resolveVariavel(Varname, Value);
end;

function TfrmCalc.getExpressao: String;
begin
  RESULT := Display.Lines.Text;
//  System.SysUtils.FormatSettings.DecimalSeparator := '.';
//  result := Display.Lines.Strings[0].Replace(',','.')
end;

procedure TfrmCalc.LimparHistorico(Sender: TObject);
begin
  ListHistorico.Clear;
end;

end.
