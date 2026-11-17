{-# OPTIONS_GHC -F -pgmF htfpp #-}

module Tests.HelloWorldTest(htf_thisModulesTests) where

import Test.Framework
import Lexer 
import Token

test_tokenize :: IO()
test_tokenize = do 
  contents <- readFile "test/Files/hello_world.yeet"
  let tokens = tokenize contents
  assertEqual (Right expected) tokens 
  where 
    expected :: [Token] 
    expected = [TokIdent "spawn", TokTypdef, TokVoid, TokIdent "spawn", TokAssign,
      TokCook, TokIdent "x", TokAssign, TokString "Hello World", TokIdent "yap", TokCallBegin, TokIdent "x", TokCallEnd]
