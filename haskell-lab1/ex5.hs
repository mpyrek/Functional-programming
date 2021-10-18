
sgn :: Int -> Int 
sgn n = if n < 0
    then -1 
    else if n == 0
        then 0 
        else 1

absInt :: Int -> Int
absInt x = if x >= 0
    then x
    else (-x)

minInt :: (Int,Int) -> Int 
minInt (x,y) = if x < y
    then x
    else y

toUpper :: Char -> Char 
toUpper x = toEnum( fromEnum( x ) + 1)

--acii kod 1 = 49
romanDigit :: Char -> String 
romanDigit x = if fromEnum(x) == 1 + 48
    then "I"
    else if fromEnum(x)==2+48
        then "II"
        else if fromEnum(x)== 3+48
            then "III"
            else if fromEnum(x) == 4+48
                then "IV"
                else "V"

