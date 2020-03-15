-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Pascal.Data
    (
        Exp(..),
        BoolExp(..),
        Line(..),
        Statement(..),
        VType(..),
        Definition(..),
        Program
    ) where

-- Data-structure for  numeric expressions
data Exp = 
    -- unary operator: Op name expression
    Op1 String Exp
    -- binary operator: Op name leftExpression rightExpression
    | Op2 String Exp Exp
    -- special operator
    | Op3 String Exp 
    -- function call: FunctionCall name ListArguments
    | FunCall String [Exp]
    -- real value: e.g. Real 1.0
    | Real Float
    -- variable: e.g. Var "x"
    | Var String

-- Data-structure for boolean expressions
data BoolExp = 
    -- binary operator on boolean expressions
    OpB String BoolExp BoolExp
    -- negation, the only unary operator
    | Not BoolExp
    -- comparison operator: Comp name expression expression
    | Comp String Exp Exp
    -- true and false constants
    | True_C
    | False_C

data Line = 
    String

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
     AssignR String Exp
    | AssignB String BoolExp
    -- Evaluate espression
    | EvalR Exp
    | EvalB BoolExp
     -- IO
    | IO String [String]
    -- If statement
    | If BoolExp Statement Statement
    | StopLoop String
    -- Case statement
    | Case BoolExp Bool Statement Bool Statement
    -- For loop
    | For String Int Int Statement 
    -- While loop
    | While BoolExp Statement
    -- Block
    | Block [Statement]

data VType =  REAL | BOOL | STRING; 

data Definition = 
    -- Variable definition, list of var, type  CHECK THIS 
    VarDef [String] VType
    | R String VType Exp
    | B String VType BoolExp
    -- Procedures
    | Proc String [(String, VType)] Statement 


-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
--main program is list of definitions: use a tuple (check book)
type Program = [Statement]