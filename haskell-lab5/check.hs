--Maybe

data Maybe' a = Nothing' | Just' a deriving Show

instance Functor Maybe' where
    fmap _ Nothing' = Nothing'
    fmap f (Just' a) = Just' (f a)

instance Applicative Maybe' where
    pure = Just'
    Nothing' <*> _ = Nothing'
    (Just' f) <*> w = fmap f w

--Either
data Either' a b = Left' a | Right' b deriving Show

instance Functor (Either' a) where
    fmap _ (Left' x) = Left' x
    fmap f (Right' x) = Right' (f x)

instance Applicative (Either' a) where
    pure = Right' 
    (Left' e) <*> _ = Left' e
    (Right' f) <*> w = fmap f w 

--[]

instance Functor [] where
    fmap = map

instance Applicative [] where
    pure a = [a]
    fx <*> gx = [f g | f <- fx, g<-gx]

-- IO

instance Functor IO where
    fmap f action = do 
        x <- action 
        return (f x)

instance Applicative IO where
    pure = returnIO
    a <*> b = do 
        f <- a
        x <- b
        return (f x)