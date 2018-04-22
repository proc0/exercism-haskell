module CollatzConjecture (collatz) where

import Control.Monad

collatz :: Integer -> Maybe Integer
collatz i
    | i <= 0 = Nothing
    | otherwise = g $ f [i]
    where g = Just 
            . toInteger 
            . (flip (-) 1) 
            . length
          f xs@(x:s)
            | x > 1 = 
                let h = f . (flip (:) xs)
                in if odd x
                then h $ 3*x + 1
                else h $ x `div` 2
            | otherwise = xs
          