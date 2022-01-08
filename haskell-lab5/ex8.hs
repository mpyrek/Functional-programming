{-# LANGUAGE DeriveFunctor #-}



newtype Box a = MkBox a deriving Show

instance Applicative Box where
  pure = MkBox
  (MkBox f) <*> w = fmap f w


instance Functor Box where
  fmap f (MkBox x) = MkBox (f x)


newtype MyTriple a = MyTriple (a,a,a) deriving Show

instance Applicative MyTriple where
  pure a = MyTriple (a,a,a)
  (MyTriple (f,g,h)) <*> MyTriple (x,y,z) =  MyTriple (f x, g y,h z)
 

instance Functor MyTriple where
    fmap f (MyTriple (a,b,c)) = MyTriple ((f a),(f b),(f c))

data Tree2 a = EmptyT2 | Leaf a | Node (Tree2 a) a (Tree2 a) deriving Show 

instance Functor Tree2 where
    fmap _ EmptyT2 = EmptyT2
    fmap f (Leaf a ) = Leaf (f a)
    fmap f (Node lt a rt) = Node (fmap f lt) (f a) (fmap f rt)

instance Applicative Tree2 where
    pure x = Leaf x
    (Leaf f) <*> (Leaf x) = Leaf (f x)
    (Leaf f) <*> (Node lt a rt) = Node (fmap f lt) (f a) (fmap f rt)
    _ <*> _ = EmptyT2

