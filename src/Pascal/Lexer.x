{

{-# LANGUAGE OverloadedStrings                 #-}
{-# LANGUAGE NoMonomorphismRestriction          #-}
{-# LANGUAGE CPP                                #-}
{-# OPTIONS_GHC -fno-warn-unused-binds          #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures    #-}
{-# OPTIONS_GHC -fno-warn-unused-matches        #-}
{-# OPTIONS_GHC -fno-warn-unused-imports        #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing        #-}
{-# OPTIONS_GHC -fno-warn-tabs                  #-}
{-# OPTIONS_GHC -funbox-strict-fields           #-}

module Pascal.Lexer
  ( Alex(..)
  , AlexPosn(..)
  , AlexState(..)
  , Token(..)
  , TokenClass(..)
  , alexError
  , alexMonadScan
  , runAlex
  , tokenToPosN
  )
where

import System.Exit
import qualified Data.ByteString.Lazy.Char8 as B
}

%wrapper "monadUserState-bytestring"

$digit = 0-9                    -- digits
$alpha = [a-zA-Z]               -- alphabetic characters


-- TODO: Map symbols into token types (with or without parameters)
tokens :-
  $white+                               ; -- remove multiple white-spaces
  [ \t\r\n]+                            ;
  "//".*                                ; -- skip one line comments
  "(*"(.* | [\n])* "*)"                 ; -- skip multi line comments
  $digit+                               { tok_read     TokenInt }
  $digit+ '.'? $digit*                  { tok_read     TokenReal }
  true|false                            { tok_string     TokenBool }
  "'" [$alpha $digit \_\ \:\=\+\-\*\/\$\#\@\!\?]* "'"     { tok_string     TokenString}
  [\+]|[\-]|[\*]|[\/]|[=]|[\<]|[\>]|"<="|">="|[\<\>]               { tok_string     TokenOp }
  [\(]|[\)]|[\,]|";"|[\']|" "|begin|"end."|end|boolean|real|string|var|program|or|sin|cos|exp|sqrt|ln|readln|writeln|break|continue|if|while|for|case|function|procedure|of|to|do|then|else|and|or|not       { tok_string     TokenK }
  ":="|[\:]                             { tok_string     TokenOp }
  $alpha [$alpha $digit \_ ]*         { tok_string   TokenID }

{

-- Some action helpers:
tok' f (p, _, input, _) len = return $ Token p (f (B.take (fromIntegral len) input))
tok x = tok' (\s -> x)
tok_string x = tok' (\s -> x (B.unpack s))
tok_read x = tok' (\s -> x (read (B.unpack s)))

-- The token type:
data Token = Token AlexPosn TokenClass
  deriving (Show)

tokenToPosN :: Token -> AlexPosn
tokenToPosN (Token p _) = p


-- TODO: Add your own token types here
data TokenClass
 = TokenOp     String
 | TokenBool   String
 | TokenK      String
 | TokenInt    Int
 | TokenReal   Float
 | TokenID    String
 | TokenString String
 | TokenEOF
 deriving (Eq, Show)

alexEOF :: Alex Token
alexEOF = do
  (p, _, _, _) <- alexGetInput
  return $ Token p TokenEOF

type AlexUserState = ()
alexInitUserState = ()
}
