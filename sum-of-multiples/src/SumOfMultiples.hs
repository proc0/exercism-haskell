module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit
    | length factors <= 0 
        || limit <= 0 = 0
    | otherwise = sum multiples
    where keep = ((not . null) .) . filter
          multiple = ((== 0) .) . mod
          multiples = [ x | x <- [1..limit-1]
                      , keep (multiple x) factors ]
