module Lexer (tokenize) where

import Data.Char (isAlpha, isAlphaNum, isDigit, isSpace)

data Token = TokCook
  | TokIdent String 
  | TokInt Int
  | TokAssign
  | TokSemicolon
  deriving (Show, Eq)

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
  | isDigit c =
      let (numStr, rest) = span isDigit (c:cs)
      in fmap (TokInt (read numStr) :) (tokenize' rest row (col + (length numStr)))
  | isAlpha c = 
      let (word, rest) = span isAlphaNum (c:cs)
          token = case word of 
              "cook" -> TokCook
              _      -> TokIdent word
      in fmap (token :) (tokenize' rest row (col + (length word)))
  | otherwise  = Left ("Unexpected character in " ++ show row ++ "," ++ show col ++ " : '" ++ [c] ++ "'")


