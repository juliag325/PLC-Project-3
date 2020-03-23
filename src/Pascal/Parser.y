{
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
}


%name happyParser
%tokentype { Token }

%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

%token 
        int             { Token _ (TokenInt $$) }
        real            { Token _ (TokenReal $$) }
        bool            { Token _ (TokenBool $$)}
        string          { Token _ (TokenString $$) }
        ID              { Token _ (TokenID $$)  }
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
        'begin'         { Token _ (TokenK "begin") }
        'end.'           { Token _ (TokenK "end.")  }
        'end'           { Token _ (TokenK "end")  }
        ':='            { Token _ (TokenOp ":=")   }
        --'true'          { Token _ (TokenBool true) }
        --'false'         { Token _ (TokenBool false) }
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

-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '<>'
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {Program}
    : 'program' ID ';' 'begin' Statements 'end.' { $5 }

-- Variable definitions
Defs :: {[Definition]} 
    : { [] } -- nothing; make empty list 
    | Definition Defs {$1:$2 } -- put statement as Definition

Definition :: {Definition}
    : 'var' ID_list ':' Type  {VarDef $2 $4 }
    | 'var' ID ':' Type '=' Exp  {R $2 $4 $6}
    | 'var' ID ':' Type '=' BoolExp {B $2 $4 $6}

Type :: {VType} --ADD TO TOKEN LIST
    : 'boolean' { BOOL }
    | 'real' { REAL }
    | 'string' { STRING }

Function :: {Function}
    : 'function' ID 'begin' Statements 'end'. { $5 }

Procedure :: {Procedure}
    : 'procedure' ID 'begin' Statements 'end'. 
    

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
    | ID {Var $1}
    | real {Real $1}
    | int {IntR $1}

BoolExp :: {BoolExp}
    : '(' BoolExp ')' { $2 } 
    | 'not' BoolExp { Not $2 }
    | RelExp { $1 }
    | BoolExp 'and' BoolExp { OpB "and" $1 $3 }
    | BoolExp 'or' BoolExp { OpB "or" $1 $3 }
    
    | bool { Boolean $1 }
    --| 'false' { False_C }
    | ID {VarB $1}

-- Statements
Lines :: {[String]}
    : Line {[$1]}
    | Line ',' Lines {$1:$3}

Line :: {String}
    : ID {$1}
    | string {$1}
    --| BoolExp {[]}
    --| RealExp {[]}

Statements :: {[Statement]}
    : { [] } -- nothing; make empty list
    | Statement Statements { $1:$2 } -- put statement as first element of statements

Statement :: {Statement}
    : ID ':=' RealExp ';' { AssignR $1 $3 }
    | ID ':=' BoolExp ';' { AssignB $1 $3 }
    | BoolExp ';' {EvalB $1}
    | RealExp ';' {EvalR $1}
    --| 'readln' '(' ID_list ')' ';' {IO "readln" $3}
    | 'writeln' '(' Lines ')' ';' {IO "writeln" $3}
    | 'break' ';' { StopLoop "break"}
    | 'continue' ';' { StopLoop "continue"}
    | 'begin' Statements 'end' ';'{Block $2}
    | 'if' '(' BoolExp ')' 'then' Statement 'else' Statement  { If $3 $6 $8}
    | 'case' '(' BoolExp ')' 'of' bool ':' Statement  bool ':' Statement  'end' ';' { Case $3 $6 $8 $9 $11} -- Needs to be fixed
    | 'for' ID ':=' int 'to' int 'do' Statement  {For $2 $4 $6 $8}
    | 'while' '(' BoolExp ')' 'do' Statement  {While $3 $6}
 
{}