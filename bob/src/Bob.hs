module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor ts 
    | length xs == 0 = "Fine. Be that way!"
    | isShouting xs == True || isSentence xs == False && last xs == '!' = "Whoa, chill out!"
    | last xs == '?' = "Sure."
    | last xs == '.' = "Whatever."
    | otherwise = "Whatever."
    where isShouting = (> (round (toRational (length xs) / 2))) . length . filter id . map isUpper
          isSentence ys = isUpper (head ys) && (length $ filter id (map isUpper ys)) < 3
          trim = filter (/= '\r') .filter (/= '\n') .filter (/= '\t') . filter (/= ' ')
          xs = trim ts
