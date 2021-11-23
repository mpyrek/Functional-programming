sum' :: Num a => [a] -> a
sum' [] = 0 
sum' (x:xs) = x + sum' xs

sumSqr' :: Num a =>  [a] -> a
sumSqr' [] = 0
sumSqr' (x:xs)= x^2 + sumSqr' xs

sumWith :: Num a => (a -> a) -> [a] -> a 
sumWith _ [] = 0
sumWith f (x:xs) = f x + sumWith f xs

sum = sumWith(\x ->x)
sumSqr=sumWith(\x -> x^2)
sumCube = sumWith(\x -> x^3) 
sumAbs= sumWith(\x -> abs x)

--w konsoli : sumWith (\x->x^2) [1..15]
listLength = sumWith (\x -> 1)


prod' :: Num a => [a] -> a
prod' [] = 1
prod' (x:xs) = x * prod' xs

prodWith :: Num a => (a -> a) -> [a] -> a
prodWith _ [] = 1
prodWith f (x:xs) = f x * prodWith f xs

prod = prodWith(\x -> x)
prodSqr = prodWith(\x -> x^2)
prodCube :: [Integer] -> Integer
prodCube = prodWith(\x -> x^3)
prodAbs :: [Integer] -> Integer
prodAbs = prodWith(\x -> abs x)


prodWith2 :: Floating  a => (a -> a) -> [a] -> a
prodWith2 _ [] = 1
prodWith2 f (x:xs) = f x * prodWith2 f xs

prodSqrt = prodWith2 (\x -> sqrt x)

