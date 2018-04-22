module RotationalCipher (rotate) where

import Data.Char

z = 26

rotate :: Int -> String -> String
rotate n s
    | n == z || n == 0 = s
    | otherwise = rot n s
        where rot = (. map ord)
                  . (map (chr . wrp) .)
                  -- whr is ur god now
                  . map . (+) -- (.)(.)
              wrp c
                | isLower char && c > _z = wrp_c
                | isUpper char && c > _Z = wrp_c
                | isLower char || isUpper char = c
                | otherwise = orig_c
                    where char = chr orig_c
                          orig_c = c - n
                          wrp_c  = c - z
                          _z = ord 'z'
                          _Z = ord 'Z'

