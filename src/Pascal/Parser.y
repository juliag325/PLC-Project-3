{
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Val
import Pascal.Lexer
}


%name happyParser
%tokentype { Token }

%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

%token 
        int             { Token _ (TokenInt $$) }
        real            { Token _ (TokenReal $$) }
        'true'          { Token _ (TokenBool "true") }
        'false'         { Token _ (TokenBool "false") }
        bool            { Token _ (TokenBool $$)}
        ID              { Token _ (TokenID $$)  }
        string          { Token _ (TokenString $$)  }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        '<>'             { Token _ (TokenOp "<>")   }
        '>'             { Token _ (TokenOp ">")   }
        '<'             { Token _ (TokenOp "<")   }
        '>='             { Token _ (TokenOp ">=")   }
        '<='             { Token _ (TokenOp "<=")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        '\''             { Token _ (TokenK  "'")   }
        'begin'         { Token _ (TokenK "begin") }
        'end.'           { Token _ (TokenK "end.")  }
        'end'           { Token _ (TokenK "end")  }
        ':='            { Token _ (TokenOp ":=")   }
        'break'          { Token _ (TokenK "break") }
        'continue'         { Token _ (TokenK "continue") }
        'and'           { Token _ (TokenK "and") }
        'or'           { Token _ (TokenK "or") }
        'not'           { Token _ (TokenK "not") }
	    ','            { Token _ (TokenK ",")   }
        ':'          { Token _ (TokenOp ":") }
        'boolean'         { Token _ (TokenK "boolean") }
        'real'           { Token _ (TokenK "real") }
        'string'           { Token _ (TokenK "string") }
        'var'           { Token _ (TokenK "var") }
        'program'           { Token _ (TokenK "program") }
        'sin'         { Token _ (TokenK "sin") }
        'cos'           { Token _ (TokenK "cos") }
        'sqrt'           { Token _ (TokenK "sqrt") }
        'exp'           { Token _ (TokenK "exp") }
        'ln'           { Token _ (TokenK "ln") }
        'readln'           { Token _ (TokenK "readln") }
        'writeln'           { Token _ (TokenK "writeln") }
        'if'           { Token _ (TokenK "if") }
        'then'           { Token _ (TokenK "then") }
        'else'           { Token _ (TokenK "else") }
        'while'           { Token _ (TokenK "while") }
        'for'           { Token _ (TokenK "for") }
        'case'           { Token _ (TokenK "case") }
        'function'           { Token _ (TokenK "function") }
        'procedure'           { Token _ (TokenK "procedure") }
        'of'           { Token _ (TokenK "of") }
        'to'           { Token _ (TokenK "to") }
        'do'           { Token _ (TokenK "do") }
        ';'           { Token _ (TokenK ";") }
        ' '           { Token _ (TokenK " ") }

-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '<>'
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {Program}
    : 'program' ID ';' Defs 'begin' Statements 'end.' {($4, $6)}

-- Variable definitions
Defs :: {[Definition]} 
    : { [] } -- nothing; make empty list 
    | Definition Defs {$1:$2 } -- put statement as Definition

Definition :: {Definition}
    : 'var' ID ':' Type ';' {VarDef1 $2 $4 }
    | 'var' ID_list ':' Type ';' {VarDef $2 $4 }
    | 'var' ID ':' Type '=' Exp  ';' {R $2 $4 $6}
    | 'var' ID ':' Type '=' BoolExp ';' {B $2 $4 $6}
--    | 'procedure' ID '(' Method_list')' ';' 'begin' Statements 'end'';' {ProcNV $2 $4 $8}
--    | 'function' ID '(' Method_list')' ':' Type ';' 'begin' Statements 'end'';' {FuncNV $2 $4 $7 $10}
--    | 'procedure' ID '(' Method_list Var_list ')' ';' 'begin' Statements 'end'';' {ProcN $2 $4 $5 $9}
--    | 'function' ID '(' Method_list Var_list ')' ':' Type ';' 'begin' Statements 'end'';' {FuncN $2 $4 $5 $8 $11}
    | 'procedure' ID '(' Method_list Var_list ')' ';' Defs 'begin' Statements 'end'';' {Proc $2 $4 $5 ($8, $10)}
    | 'function' ID '(' Method_list Var_list ')' ':' Type ';' Defs 'begin' Statements 'end'';' {Func $2 $4 $5 $8 ($10, $12)}

Type :: {VType} --ADD TO TOKEN LIST
    : 'boolean' { BOOL }
    | 'real' { REAL }
    | 'string' { STRING }

--Function :: {Function}
--    : 'function' ID 'begin' Statements 'end'. { $2 $5 }

--Procedure :: {Procedure}
--    : 'procedure' ID 'begin' Statements 'end'. { $2 $5 }

Method_list ::  {[([String], VType)]}
    : {[]}
    | List ';' Method_list {$1:$3}

List :: {([String], VType)}
    : ID_list ':' Type  {($1, $3)}

Var_list :: {[(String, VType)]}
    : {[]}
    | Var ';' Var_list {$1:$3}

Var :: {(String, VType)}
    : 'var' ID ':' Type  {($2, $4)} 

ID_list :: {[String]}
    : ID  {[$1]}
    | ID ',' ID_list { $1:$3 }

-- Expressions
RelExp :: {BoolExp}
    : RealExp '=' RealExp { Comp "=" $1 $3}
    | RealExp '<>' RealExp { Comp "<>" $1 $3}
    | RealExp '<' RealExp { Comp "<" $1 $3}
    | RealExp '>' RealExp { Comp ">" $1 $3}
    | RealExp '<=' RealExp { Comp "<=" $1 $3}
    | RealExp '>=' RealExp { Comp ">=" $1 $3}

RealExp :: {Exp}
    : Exp { $1 }
    | SpecialExp { $1 }
    | RealExp '+' RealExp { Op2 "+" $1 $3 }
    | RealExp '*' RealExp { Op2 "*" $1 $3 }
    | RealExp '/' RealExp { Op2 "/" $1 $3 }
    | RealExp '-' RealExp { Op2 "-" $1 $3 }
    | '(' RealExp ')' { $2 }

SpecialExp :: {Exp}
    : 'sin' '(' RealExp ')'  { Op3 "sin" $3 }
    | 'cos' '(' RealExp ')'  { Op3 "cos" $3 }
    | 'sqrt' '(' RealExp ')' { Op3 "sqrt" $3 }
    | 'exp' '(' RealExp ')'  { Op3 "exp" $3 }
    | 'ln' '(' RealExp ')'   { Op3 "ln" $3 }

Exp :: {Exp}
    : Exp '+' Exp { Op2 "+" $1 $3 }
    | Exp '*' Exp { Op2 "*" $1 $3 }
    | Exp '/' Exp { Op2 "/" $1 $3 }
    | Exp '-' Exp { Op2 "-" $1 $3 }
    | '(' Exp ')' { $2 } -- ignore brackets
    | '+' Exp { $2 } -- ignore Plus
    | '-' Exp { Op1 "-" $2}
    | ID '(' Lines ')' { FunCallR $1 $3 }
    | ID {Var $1}
    | real {Reall $1}
    | int {IntR $1}

BoolExp :: {BoolExp}
    : 'false' { False_C }
    | 'true' { True_C }
    | '(' BoolExp ')' { $2 } 
    | 'not' BoolExp { Not $2 }
    | RelExp { $1 }
    | ID '(' Lines ')' { FunCallB $1 $3 }
    | BoolExp 'and' BoolExp { OpB "and" $1 $3 }
    | BoolExp 'or' BoolExp { OpB "or" $1 $3 }
    | ID {VarB $1}

-- Statements
Lines :: {[Line]}
    : Line {[$1]}
    | Line ',' Lines {$1:$3}

Line :: {Line}
    : string {LineS $1}
    | ID {LineId $1}
    | BoolExp {LineB $1}
    | RealExp {LineR $1}

Statements :: {[Statement]}
    : { [] } -- nothing; make empty list
    | Statement Statements { $1:$2 } -- put statement as first element of statements

Statement :: {Statement}
    : ID ':=' ID ';' {Assign $1 $3}
    | ID '(' Lines ')' ';' { FunCall $1 $3 }
    | ID ':=' ID '(' Lines ')' ';' { AssignFunCall $1 $3 $5}
    | ID ':=' RealExp ';' { AssignR $1 $3 }
    | ID ':=' BoolExp ';' { AssignB $1 $3 }
    | BoolExp ';' {EvalB $1}
    | RealExp ';' {EvalR $1}
    --| 'readln' '(' ID_list ')' ';' {IO "readln" $3}
    | 'writeln' '(' Lines ')' ';' {IO "writeln" $3}
    | 'break' ';' { StopLoop "break"}
    | 'continue' ';' { StopLoop "continue"}
    | 'begin' Statements 'end' ';'{Block $2}
    | 'if' '(' BoolExp ')' 'then' Statement 'else' Statement  { If $3 $6 $8}
    | 'case' '(' BoolExp ')' 'of' 'true' ':' Statement  'false' ':' Statement  'end' ';' { Case "t" $3 True $8 False $11} 
    | 'case' '(' BoolExp ')' 'of' 'false' ':' Statement  'true' ':' Statement  'end' ';' { Case "f" $3 False $8 True $11} 
    | 'for' ID ':=' int 'to' int 'do' Statement  {For $2 $4 $6 $8}
    | 'while' '(' BoolExp ')' 'do' Statement  {While $3 $6}
    | ID '(' Lines ')' ';' {ProcCall $1 $3}
 
{}