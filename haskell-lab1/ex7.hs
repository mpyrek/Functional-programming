not' :: Bool -> Bool 
not' True = False 
not' False = True 


isItTheAnswer :: String -> Bool 
isItTheAnswer "Love" = True 
isItTheAnswer _      = False 

or' :: (Bool,Bool) -> Bool 
or' (False,False) =False 
or' _ = True 

and' :: (Bool,Bool) -> Bool 
and' (True,True) = True 
and' _ =False 

nand' :: (Bool,Bool) -> Bool 
nand' (x,y) = not'(and' (x,y))

xor' :: (Bool,Bool) -> Bool 
xor' (x,y) = not'(or'(x,y))