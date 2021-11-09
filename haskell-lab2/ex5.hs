
isPalindrom :: [Char] -> Bool 
isPalindrom s = first == (reverse last)
    where len = length s
          half_len = (div) len 2 
          (first,last_1) = splitAt half_len s
          last = drop (mod len 2) last_1


howMunnyIsPrimeIn1000 = length [a | a<-[2..1000],[i | i<-[2..a-1],a `mod` i == 0]==[]]

howMunnyIsPrimeInN :: Int -> Int 
howMunnyIsPrimeInN 1 = 0
howMunnyIsPrimeInN 2 = 1
howMunnyIsPrimeInN n = length [a | a<-[2..n],[i | i<-[2..a-1],a `mod` i == 0]==[]]

allEqual :: Eq a => [a] -> Bool
allEqual xs = [(x,y) | x <- xs, y <- xs, x/=y] ==[] -- allEqual [1,1] = True, allEqual [1,2] = False


