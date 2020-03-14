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
        ID              { Token _ (TokenID $$)  }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        'begin'         { Token _ (TokenK "begin") }
        'end'           { Token _ (TokenK "end")  }
        ':='            { Token _ (TokenOp ":=")   }
        'true'          { Token _ (TokenK "true") }
        'false'         { Token _ (TokenK "false") }
        'and'           { Token _ (TokenK "and") }
        'not'           { Token _ (TokenK "not") }
	    ','            { Token _ (TokenK ",")   }
        ':'          { Token _ (TokenOp ":") }
        'boolean'         { Token _ (TokenK "boolean") }
        'real'           { Token _ (TokenK "real") }
        'string'           { Token _ (TokenK "string") }
        'var'           { Token _ (TokenK "var") }

-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '!='
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {Program}
    : 'begin' Statements 'end' { $2 }

-- Variable definitions
Defs :: {[Definition]} 
    : { [] } -- nothing; make empty list 
    | Definition Defs {$1:$2 } -- put statement as Definition

Definition :: {Definition}
    : 'var' ID_list ':' Type  {VarDef $2 $4 }

Type :: {VType} --ADD TO TOKEN LIST
    : 'boolean' { BOOL }
    | 'real' { REAL }
    | 'string' { STRING }

ID_list :: {[String]}
    : ID  {[$1]}
    | ID ',' ID_list { $1:$3 }

-- Expressions
Exp :: {Exp}
    : '+' Exp { $2 } -- ignore Plus
    | '-' Exp { Op1 "-" $2}
    | Exp '+' Exp { Op2 "+" $1 $3 }
    | Exp '*' Exp { Op2 "*" $1 $3 }
    | '(' Exp ')' { $2 } -- ignore brackets

BoolExp :: {BoolExp}
    : 'true' { True_C }
    | 'false' { False_C }
    | 'not' BoolExp { Not $2 }
    | BoolExp 'and' BoolExp { OpB "and" $1 $3 }

Statements :: {[Statement]}
    : { [] } -- nothing; make empty list
    | Statement Statements { $1:$2 } -- put statement as first element of statements

Statement :: {Statement}
    : ID ':=' Exp { Assign $1 $3 }

{}