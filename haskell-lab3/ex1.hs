--w konsoli

--f1(x)= x-2 ; xcR
let f1 =( \x -> x-2) :: Double->Double
--f(x,y) = sqrt(x^2+y^2) xcR
let f2 = (\ x y ->sqrt( x^2 + y^2) ):: Double -> Double -> Double
--f(x,y,z)= sqrt(x^2,y^2,z^2)
 let f3 = (\ x y z -> sqrt( fromIntegral x^2 + fromIntegral y^2 + fromIntegral z^2) ) ::  Int -> Int -> Int-> Double
let f4 = \x -> 2*x
let f5 = \x -> x*2
let f6 = \x -> 2^x
let f7 = \x -> x^2
let f8 = \x -> 2/x
let f9 = \x -> 4-x

--odp. wyrażenia anonimowe : f10 x = if x `mod` 2 == 0 then True else False
let f10 = \x -> if (mod x 2 == 0) then True else False
--f11 x = let y = sqrt x in 2*y^3*(y+1)
f11=  \ x -> let y = sqrt x in 2* y^3 * (y+1)
--f12 1 = 3 f 12 _ = 0
f12 = \x -> if (x==1) then 3 else 0

