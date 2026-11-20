module Lexer (tokenize) where

import Data.Char (isAlpha, isAlphaNum, isDigit, isSpace)
import Token


tokenize :: String -> Either String [Token]
tokenize [] = Right []
tokenize  text = tokenize' text 1 1 

tokenize' :: String -> Int -> Int -> Either String [Token]
tokenize' [] _ _ = Right []
tokenize' (c:cs) row col
  | isSpace c = case c of
      '\n' -> tokenize' cs (row + 1) 1 
      '\r' -> tokenize' cs (row + 1) 1 
      _ -> tokenize' cs row (col + 1)
  | c == '=' = fmap (TokAssign :) (tokenize' cs row (col + 1))
  | c == ';' = fmap (TokSemicolon :) (tokenize' cs row (col + 1))
  | c == '(' = fmap (TokCallBegin :) (tokenize' cs row (col + 1))
  | c == ')' = fmap (TokCallEnd:) (tokenize' cs row (col + 1))
  | c == '"' = 
      let (word, _:cs') = span (\x -> x /= '"') cs
      in fmap (TokString word :) (tokenize' cs' row (col + 2 + length word ))
  | c == ':' = case cs of
      (c':cs')
          | c' == ':' -> fmap (TokTypdef :) (tokenize' cs' row (col + 2))
      _ -> Left ("Unexpected character in " ++ show row ++ "," ++ show col ++ " : '" ++ [c] ++ "'")
  | isDigit c =
      let (numStr, rest) = span isDigit (c:cs)
      in fmap (TokInt (read numStr) :) (tokenize' rest row (col + length numStr))
  | isAlpha c = 
      let (word, rest) = span isAlphaNum (c:cs)
          token = case word of 
              "cook" -> TokCook
              "void" -> TokVoid
              _      -> TokIdent word
      in fmap (token :) (tokenize' rest row (col + length word))
  | otherwise  = Left ("Unexpected character in " ++ show row ++ "," ++ show col ++ " : '" ++ [c] ++ "'")



