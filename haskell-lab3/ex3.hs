sqr x = x^2

funcFactory n = case n of
    1 -> id
    2 -> sqr
    3 -> (^3)
    4 -> \x -> x^4
    5 -> intFunc
    _ -> const n
    where
        intFunc x = x^5




expApproxUpTo :: Int -> Double -> Double
expApproxUpTo n =case n of
    0 -> const 1
    1->  (\x -> x)
    2-> (\x -> expApproxUpTo 1 x +x^2/4)
    3->  (\x -> expApproxUpTo 2 x + x^3/12)
    4-> (\x -> expApproxUpTo 3 x + x^4/48)
    5-> (\x -> expApproxUpTo 4 x + x^5/240)


--???????

expApproxUpTo1 :: a -> a -> a -> a 
expApproxUpTo1 0 x = (const 1+ product 1)  
expApproxUpTo1 n x = expApproxUpTo1 n-1 x +  x^n / product[k | k<-[1..n]]


