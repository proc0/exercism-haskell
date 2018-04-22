module Pangram (isPangram) where
import Data.Char (toLower, isLetter)
import Data.List (nub)

isPangram :: String -> Bool
isPangram = (== 26) . length 
                    . filter id 
                    . map isLetter 
                    . nub --unique
                    . map toLower
