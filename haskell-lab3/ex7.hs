import GHC.Unicode (GeneralCategory(UppercaseLetter), isUpper)
onlyEven [] = []
onlyEven (x:xs)
 | x `mod` 2 == 0 = x : onlyEven xs
 | otherwise      = onlyEven xs


onlyOdd [] = []
onlyOdd (x:xs)
 | x `mod` 2 == 1 = x : onlyOdd xs
 | otherwise      = onlyOdd xs

onlyUpper [] = []
onlyUpper (x:xs)
    |  isUpper(x)   = x :  onlyUpper xs
    | otherwise     =  onlyUpper xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] =[]
filter' p (x:xs)
    | p x == True  = x: filter' p  xs
    | otherwise    = filter' p  xs

onlyEven' :: [Integer] -> [Integer]
onlyEven' = filter'(\x->(x `mod` 2 ==0) )
onlyOdd' = filter'(\x -> (x `mod` 2 ==1))
onlyUpper' = filter'(\x->(isUpper(x))

)