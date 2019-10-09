# Calculadora
A pretty good expression evaluator for Delphi

I toke one class from the = JEDI.VCL and JEDI.Pas library.
I was just wanting to simplify the code to solve simple equations in string format.
But I discovered two very inspiring resources;

examplo
```Delphi
  var Parser:= TExprParser.Create;
  Parser.onExecFunction := MyCustomFunctionParser;
  Parser.onReadVariable := MyCustomVariableMatch;
  if Parser.Eval(' x-2 + 2 * pii * r  + seno(30)')   then
    showmessage(FORMAT('Full Expression: %s = %s',[P.Expression, P.Value]))
  else
    showmessage(FORMAT('Parser could not solve the equation: %s. %s',[P.Expression,P.ErrorMessage]));
    end;
```
Then just implement your methods
```Delphi
procedure MyCustomFunctionParser(const functionName: String; args: Ole; var Value: Variant);
begin
If functionName = seno then Value := sin(args[0]);
end;
procedure MyCustomVariableMatch(const Variable: String; var Value: Variant);
begin
If Variable = pii then Value := 3.1415
else Value := UserInput_Variable(Variable);
end;
```

----------------------------------------------------------------------
#News
   Implemented methodo MachVariableFromDataset and MachVariableFromJson
   Just pass a Dataset or a Json as a parameter and the parser will find the variable values.
   The dataset doesn't move the cursor;

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
