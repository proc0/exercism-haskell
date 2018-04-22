module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

letterScores = 
    [ ("AEIOULNRST", 1)
    , ("FHVWY", 4)
    , ("BCMP", 3)
    , ("DG", 2)
    , ("K", 5)
    , ("JX", 8)
    , ("QZ", 10)
    ]

scoreLetter :: Char -> Integer
scoreLetter letter = 
    let eval (letters, score) = 
            (score, elem (toUpper letter) letters)
        total result =
            if length result > 0
            then fst $ head result
            else 0 
    in 
    total . filter snd $ map eval letterScores

scoreWord :: String -> Integer
scoreWord = sum . fmap scoreLetter
