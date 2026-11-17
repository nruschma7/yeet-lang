module Token (Token(..)) where 

data Token = TokCook
  | TokIdent String 
  | TokString String
  | TokInt Int
  | TokTypdef
  | TokVoid
  | TokAssign
  | TokSemicolon
  | TokCallBegin
  | TokCallEnd
  deriving (Show, Eq)
