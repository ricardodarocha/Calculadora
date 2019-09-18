object frmCalc: TfrmCalc
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Calculadora'
  ClientHeight = 511
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    516
    511)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 84
    Top = 133
    Width = 81
    Height = 31
    Caption = 'MC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 165
    Top = 133
    Width = 76
    Height = 31
    Caption = 'MR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton3: TSpeedButton
    Left = 241
    Top = 133
    Width = 79
    Height = 31
    Caption = 'M+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 320
    Top = 133
    Width = 82
    Height = 31
    Caption = 'M-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton5: TSpeedButton
    Left = 402
    Top = 133
    Width = 105
    Height = 31
    Caption = 'MS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton6: TSpeedButton
    Left = 83
    Top = 265
    Width = 105
    Height = 49
    Hint = '7'
    Caption = '7'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton7: TSpeedButton
    Left = 189
    Top = 265
    Width = 105
    Height = 49
    Hint = '8'
    Caption = '8'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton8: TSpeedButton
    Left = 295
    Top = 265
    Width = 106
    Height = 49
    Hint = '9'
    Caption = '9'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton9: TSpeedButton
    Left = 83
    Top = 314
    Width = 105
    Height = 49
    Hint = '4'
    Caption = '4'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton10: TSpeedButton
    Left = 189
    Top = 314
    Width = 105
    Height = 49
    Hint = '5'
    Caption = '5'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton11: TSpeedButton
    Left = 295
    Top = 314
    Width = 106
    Height = 49
    Hint = '6'
    Caption = '6'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton12: TSpeedButton
    Left = 83
    Top = 363
    Width = 105
    Height = 49
    Hint = '1'
    Caption = '1'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton13: TSpeedButton
    Left = 189
    Top = 363
    Width = 105
    Height = 49
    Hint = '2'
    Caption = '2'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton14: TSpeedButton
    Left = 295
    Top = 363
    Width = 106
    Height = 49
    Hint = '3'
    Caption = '3'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object btnLimparHistorico: TSpeedButton
    Left = 78
    Top = 221
    Width = 105
    Height = 48
    Caption = 'CE'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Limparhistorico
  end
  object btnC: TSpeedButton
    Left = 189
    Top = 216
    Width = 105
    Height = 48
    Caption = 'C'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Clear
  end
  object btnBack: TSpeedButton
    Left = 295
    Top = 216
    Width = 105
    Height = 48
    Caption = '<--'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Backspace
  end
  object SpeedButton18: TSpeedButton
    Left = 83
    Top = 167
    Width = 105
    Height = 48
    Hint = '%'
    Caption = '%'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton19: TSpeedButton
    Left = 189
    Top = 167
    Width = 105
    Height = 48
    Caption = 'raiz'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton20: TSpeedButton
    Left = 295
    Top = 167
    Width = 105
    Height = 48
    Hint = #178
    Caption = 'x'#178
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton21: TSpeedButton
    Left = 402
    Top = 167
    Width = 105
    Height = 48
    Caption = '1/x'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton22: TSpeedButton
    Left = 402
    Top = 216
    Width = 105
    Height = 48
    Hint = '/'
    Caption = '/'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton23: TSpeedButton
    Left = 402
    Top = 265
    Width = 105
    Height = 48
    Hint = '*'
    Caption = 'x'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object btnMinus: TSpeedButton
    Left = 402
    Top = 314
    Width = 105
    Height = 48
    Hint = '-'
    Caption = '-'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton25: TSpeedButton
    Left = 402
    Top = 363
    Width = 105
    Height = 48
    Hint = '+'
    Caption = '+'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object btnInverteSinal: TSpeedButton
    Left = 83
    Top = 412
    Width = 105
    Height = 49
    Caption = '+-'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnInverteSinalClick
  end
  object SpeedButton27: TSpeedButton
    Left = 189
    Top = 412
    Width = 105
    Height = 49
    Hint = '0'
    Caption = '0'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton28: TSpeedButton
    Left = 295
    Top = 412
    Width = 106
    Height = 49
    Hint = ','
    Caption = ','
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object btnIgual: TSpeedButton
    Left = 402
    Top = 412
    Width = 105
    Height = 48
    Caption = '='
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Solve
  end
  object btnEval: TSpeedButton
    Left = 3
    Top = 133
    Width = 81
    Height = 31
    Caption = 'EVAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Solve
  end
  object btnArroba: TSpeedButton
    Left = 9
    Top = 167
    Width = 75
    Height = 48
    Hint = '@'
    Caption = '@'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object btnSharp: TSpeedButton
    Left = 9
    Top = 216
    Width = 75
    Height = 48
    Hint = '#'
    Caption = '#'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton33: TSpeedButton
    Left = 9
    Top = 265
    Width = 75
    Height = 49
    Hint = '\'
    Caption = '\'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton34: TSpeedButton
    Left = 9
    Top = 314
    Width = 75
    Height = 49
    Hint = '('
    Caption = '('
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton35: TSpeedButton
    Left = 9
    Top = 363
    Width = 75
    Height = 49
    Hint = ')'
    Caption = ')'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Digita
  end
  object SpeedButton36: TSpeedButton
    Left = 9
    Top = 412
    Width = 75
    Height = 49
    Caption = '|M'#243'dulo|'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Digita
  end
  object ListHistorico: TListBox
    Left = 3
    Top = 40
    Width = 506
    Height = 87
    AutoCompleteDelay = 2000
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 2
  end
  object VariablesEditor: TValueListEditor
    Left = 48
    Top = 21
    Width = 181
    Height = 106
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    Options = [goFixedHorzLine, goColSizing, goEditing, goAlwaysShowEditor, goThumbTracking]
    ParentFont = False
    TabOrder = 3
    Visible = False
    ColWidths = (
      150
      25)
  end
  object Display: TMemo
    Left = 4
    Top = 8
    Width = 506
    Height = 33
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -27
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    Lines.Strings = (
      '0')
    ParentFont = False
    TabOrder = 0
    WantReturns = False
    WordWrap = False
    OnChange = DisplayChange
    OnKeyPress = DisplayKeyPress
    ExplicitWidth = 505
  end
  object MemoFormula: TMemo
    Left = 4
    Top = 464
    Width = 504
    Height = 47
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 503
  end
  object ListView1: TListView
    Left = 10
    Top = 40
    Width = 499
    Height = 73
    Columns = <
      item
        Width = 200
      end
      item
      end>
    SmallImages = CNV.btnImages
    TabOrder = 4
    ViewStyle = vsReport
    Visible = False
  end
  object Qir_estable_dadosConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=QIR_Estable_Dados')
    LoginPrompt = False
    Left = 112
    Top = 190
  end
  object ConsultaconexaoTable: TFDQuery
    Connection = Qir_estable_dadosConnection
    SQL.Strings = (
      'SELECT * FROM ConsultaConexao')
    Left = 112
    Top = 238
    object ConsultaconexaoTableID: TGuidField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Size = 38
    end
    object ConsultaconexaoTableCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsultaconexaoTableCodigoConsulta: TIntegerField
      FieldName = 'CodigoConsulta'
      Origin = 'CodigoConsulta'
    end
    object ConsultaconexaoTableCodigoConexao: TIntegerField
      FieldName = 'CodigoConexao'
      Origin = 'CodigoConexao'
    end
    object ConsultaconexaoTableCodigoIndicador: TIntegerField
      FieldName = 'CodigoIndicador'
      Origin = 'CodigoIndicador'
    end
    object ConsultaconexaoTableQuery: TWideMemoField
      FieldName = 'Query'
      Origin = '"Query"'
      BlobType = ftWideMemo
    end
    object ConsultaconexaoTableFiltro: TWideMemoField
      FieldName = 'Filtro'
      Origin = 'Filtro'
      BlobType = ftWideMemo
    end
    object ConsultaconexaoTableIndicador: TGuidField
      FieldName = 'Indicador'
      Origin = 'Indicador'
      Size = 38
    end
    object ConsultaconexaoTableParametros: TWideMemoField
      FieldName = 'Parametros'
      Origin = 'Parametros'
      BlobType = ftWideMemo
    end
    object ConsultaconexaoTableMacros: TWideMemoField
      FieldName = 'Macros'
      Origin = 'Macros'
      BlobType = ftWideMemo
    end
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkListControlToField1: TLinkListControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Tags'
      Control = ListView1
      FillExpressions = <
        item
          SourceMemberName = 'Nome'
          ControlMemberName = 'SubItems[0]'
        end>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
  end
  object IndicadoresTable: TFDQuery
    Connection = Qir_estable_dadosConnection
    SQL.Strings = (
      'SELECT * FROM Indicadores')
    Left = 312
    Top = 58
    object IndicadoresTableID: TGuidField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Size = 38
    end
    object IndicadoresTableCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IndicadoresTableNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 200
    end
    object IndicadoresTableFaixaBaixa: TBCDField
      FieldName = 'FaixaBaixa'
      Origin = 'FaixaBaixa'
      Required = True
      Precision = 8
      Size = 3
    end
    object IndicadoresTableFaixaOtima: TBCDField
      FieldName = 'FaixaOtima'
      Origin = 'FaixaOtima'
      Required = True
      Precision = 8
      Size = 3
    end
    object IndicadoresTableCorBaixa: TIntegerField
      FieldName = 'CorBaixa'
      Origin = 'CorBaixa'
    end
    object IndicadoresTableCorMedia: TIntegerField
      FieldName = 'CorMedia'
      Origin = 'CorMedia'
    end
    object IndicadoresTableCorOtima: TIntegerField
      FieldName = 'CorOtima'
      Origin = 'CorOtima'
    end
    object IndicadoresTableValorMaximo: TBCDField
      FieldName = 'ValorMaximo'
      Origin = 'ValorMaximo'
      Precision = 8
      Size = 3
    end
    object IndicadoresTableGrupo: TIntegerField
      FieldName = 'Grupo'
      Origin = 'Grupo'
    end
    object IndicadoresTableTipo: TIntegerField
      FieldName = 'Tipo'
      Origin = 'Tipo'
    end
    object IndicadoresTableTags: TStringField
      FieldName = 'Tags'
      Origin = 'Tags'
      Required = True
      Size = 200
    end
    object IndicadoresTableData: TSQLTimeStampField
      FieldName = 'Data'
      Origin = 'Data'
    end
    object IndicadoresTableConsultor: TStringField
      FieldName = 'Consultor'
      Origin = 'Consultor'
      Required = True
      Size = 38
    end
    object IndicadoresTableFormula: TWideMemoField
      FieldName = 'Formula'
      Origin = 'Formula'
      BlobType = ftWideMemo
    end
    object IndicadoresTableOwnerIndicator: TStringField
      FieldName = 'OwnerIndicator'
      Origin = 'OwnerIndicator'
      Required = True
      Size = 38
    end
    object IndicadoresTableOwnerUser: TStringField
      FieldName = 'OwnerUser'
      Origin = 'OwnerUser'
      Size = 38
    end
    object IndicadoresTableRota: TStringField
      FieldName = 'Rota'
      Origin = 'Rota'
      Size = 200
    end
    object IndicadoresTableIcone: TIntegerField
      FieldName = 'Icone'
      Origin = 'Icone'
      Required = True
    end
    object IndicadoresTableUnidade: TStringField
      FieldName = 'Unidade'
      Origin = 'Unidade'
      Required = True
      Size = 10
    end
    object IndicadoresTableMultiplicador: TIntegerField
      FieldName = 'Multiplicador'
      Origin = 'Multiplicador'
      Required = True
    end
    object IndicadoresTableConsulta: TGuidField
      FieldName = 'Consulta'
      Origin = 'Consulta'
      Size = 38
    end
    object IndicadoresTableStatus: TStringField
      FieldName = 'Status'
      Origin = 'Status'
      Size = 50
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = IndicadoresTable
    ScopeMappings = <>
    Left = 248
    Top = 256
  end
end
