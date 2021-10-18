not' :: Bool -> Bool 
not' b = case b of
    True -> False 
    False -> True 

absInt n = 
    case (n >= 0) of 
        True -> n
        _    -> -n
    
isItTheAnswer :: String -> Bool 
isItTheAnswer x = 
    case (x=="Love") of
        True -> True 
        _    -> False 


or' :: (Bool,Bool) -> Bool 
or' (x,y) = case (x || y) of
    True -> True
    False -> False 

and' :: (Bool,Bool) -> Bool 
and' (x,y) = case (x && y) of
    True -> True
    False -> False 

nor' :: (Bool,Bool) -> Bool 
nor' (x,y) = case (x || y) of
    True -> False
    False -> True

