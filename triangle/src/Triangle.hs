module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Eq a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c 
    | a <= 0 || b <= 0 || c <= 0 = Illegal
    | a + b < c || a + c < b || b + c < a = Illegal
    | otherwise = 
        if a == b && b == c 
        then Equilateral
        else if a == b || a == c && c == a || c == b
        then Isosceles
        else if a /= c && b /= c && b /= a
        then Scalene
        else Illegal