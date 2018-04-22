module RunLength (decode, encode) where

import Data.Char

decode :: String -> String
decode [] = "" 
decode xs = foldl construct "" 
          . tail -- removes seed
          $ foldl expand [seed] xs
    where seed = ("", '0')
          -- separate numbers and letters
          -- keep count string to concat multiple digits
          expand :: [(String, Char)] -> Char -> [(String, Char)]
          expand ((count, letter):rest) x = 
            if isDigit x
            then (count ++ [x], letter):rest
            else seed:rest ++ [(count, x)]
          -- repeat and concat letters
          construct :: String -> (String, Char) -> String
          construct memo (count, letter) = 
            if (not . null) count
            then memo ++ (take (read count::Int) $ repeat letter)
            else memo ++ [letter]

encode :: String -> String
encode [] = ""
encode xs = foldr construct "" 
          . init -- removes seed
          $ foldl expand [seed] xs
    where seed = (0, '0')
          -- concat numbers and chars
          construct :: (Int, Char) -> String -> String
          construct (count, letter) rest = 
            if count > 1 -- skip single letters
            then rest ++ (show $ count) ++ [letter]
            else rest ++ [letter]
          -- count single letters
          expand :: [(Int, Char)] -> Char -> [(Int, Char)]
          expand ((count, letter):rest) next
            | next == letter = [(count + 1, letter)] ++ rest
            | otherwise = [(1, next), (count, letter)] ++ rest
          