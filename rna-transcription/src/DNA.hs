module DNA (toRNA) where

import Data.List

toRNA :: String -> Maybe String
toRNA = fmap (map transcribe) . validate
    where validate dna 
            | length (intersect dna "GCTA") < length dna = Nothing
            | length dna > 0 = Just dna
            | otherwise = Nothing
          transcribe dna = case dna of
                            'G' -> 'C'
                            'C' -> 'G'
                            'T' -> 'A'
                            'A' -> 'U'
