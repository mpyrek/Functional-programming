sum'2 :: Num t => [t]-> t
sum'2 xs = loop 0 xs
    where loop acc [] = acc 
          loop acc (x:xs) = loop (acc+x) xs

sum'3 :: Num t => [t]-> t
sum'3  = loop 0 
    where loop acc [] = acc 
          loop acc (x:xs) = loop (acc+x) xs

prod'2 :: Num t => [t] -> t
prod'2 = loop 1 
    where loop acc [] = acc
          loop acc (x:xs) = loop (acc*x) xs

length'2 :: [a] -> Int 
length'2 = loop 0
    where loop acc [] = acc
          loop acc (_:xs) = loop (1+acc) xs 