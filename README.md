# Calculadora
A magic calculator and evaluator for Delphi

Eu modifiquei essa classe que é parte do componente JEDI.VCL e JEDI.Pas
Eu isolei apenas as partes que me interessavam, para resolver equações simples

exemplo

  var = Parser:= TExprParser.Create;
  if Parser.Eval(' x-2 + 2 * 3.14 * r ')   then
    showmessage('ExpressaoFormatada: ' + P.Expression + ' = ' + P.Value
  else
    showmessage(P.ErrorMessage);
    end;

  Finally
    P.DisposeOf;
    P := nil;
  End;

  Vai retornar "Variable 'x' could not be fetched"

  Aí voce vai substituindo as variáveis por uma valor que você leu do banco até completar toda a equação.

----------------------------------------------------------------------
#Novas funcionalidades
   Implementado o método onGetVariable
   Implementado o método onExecuteFuncion

   Agora é possível criar funções personalizadas





#Comments from JVCL
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

This file is derived from ExprParser.pas of the MP3BookHelper project
http://mp3bookhelper.sourceforge.net and re-licensed under MPL by permission from
the original author Vlad Skarzhevskyy.

The Original Code is: ExprParser.pas, released on 2008-10-24

The Initial Developers of the Original Code are: Vlad Skarzhevskyy, Christian Schiffler
Copyright (c) 2002 Vlad Skarzhevskyy
Copyright (c) 2008 Christian Schiffler
All Rights Reserved.

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.delphi-jedi.org

Known Issues:
  Equality Check is case insensitive due to usage of TMask class in unit Masks.

This unit is used as a helper for JvMemoryDataSet.pas.
