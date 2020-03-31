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
    | FunCallR String [Line]
    -- real value: e.g. Real 1.0
    | Reall Float
    | IntR Int
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
    | FunCallB String [Line]
    -- true and false constants
    | True_C
    | False_C
    -- Boolean Bool
    | VarB String

data Line = 
    LineS String
    | LineId String
    | LineB BoolExp
    | LineR Exp

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
    Assign String String
    | FunCall String [Line]
    | AssignFunCall String String [Line]
    | AssignR String Exp
    | AssignB String BoolExp
    -- Evaluate espression
    | EvalR Exp
    | EvalB BoolExp
     -- IO
    | IO String [Line]
    -- If statement
    | If BoolExp Statement Statement
    | StopLoop String
    -- Case statement
    | Case String BoolExp Bool Statement Bool Statement
    -- For loop
    | For String Int Int Statement 
    -- While loop
    | While BoolExp Statement
    -- Block
    | Block [Statement]
    | ProcCall String [Line]

data VType =  REAL | BOOL | STRING; 

--data Procedure = 
    -- Block Statement

--data Function = 
    --Block [Statement]

data Definition = 
    -- Variable definition, list of var, type  CHECK THIS 
    VarDef1 String VType
    | VarDef [String] VType
    | R String VType Exp
    | B String VType BoolExp
    -- Procedures
    | Proc String [([String], VType)] [(String, VType)] ([Definition],[Statement])
    | Func String [([String], VType)] [(String, VType)] VType ([Definition],[Statement])
--    | ProcN String [([String], VType)] [(String, VType)] [Statement]
--    | FuncN String [([String], VType)] [(String, VType)] VType [Statement]
--    | ProcNV String [([String], VType)] [Statement]
--    | FuncNV String [([String], VType)] VType [Statement]
    -- | Proc String [(String, VType)] Statement 


-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
--main program is list of definitions: use a tuple (check book)
type Program = ([Definition],[Statement])