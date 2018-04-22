module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n 
    |         n <= 0 = Nothing
    | aliquot n <  n = Just Deficient
    | aliquot n >  n = Just Abundant
    | aliquot n == n = Just Perfect
    where aliquot = sum . init . factors
          factors i = [x | x <- [1..i]
                         , i `mod` x == 0]
