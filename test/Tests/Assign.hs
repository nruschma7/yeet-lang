{-# OPTIONS_GHC -F -pgmF htfpp #-}

module Tests.Assign (htf_thisModulesTests) where

import Test.Framework
import Lexer

test_tokenize :: IO()
test_tokenize = do 
  assertEqual [] (tokenize "")
