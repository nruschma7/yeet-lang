{-# OPTIONS_GHC -F -pgmF htfpp #-}

module Tests.HelloWorldTest(htf_thisModulesTests) where

import Test.Framework
import Lexer 
import Token
import qualified Paths_yeet_lang

test_tokenize :: IO()
test_tokenize = do 
  file <- Paths_yeet_lang.getDataFileName "data/hello_world.yeet"
  contents <- readFile file
  let tokens = tokenize contents
  assertEqual (Right expected) tokens 
  where 
    expected :: [Token] 
    expected = [TokIdent "spawn", TokTypdef, TokVoid, TokIdent "spawn", TokAssign,
      TokCook, TokIdent "x", TokAssign, TokString "Hello World", TokIdent "yap", TokCallBegin, TokIdent "x", TokCallEnd]
