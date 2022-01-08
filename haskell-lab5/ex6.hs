{-# LANGUAGE DeriveFunctor #-}

newtype Box a = MkBox a deriving (Show, Functor)

-- instance Functor Box where 
--     fmap f (MkBox x) = MkBox (f x)


data MyList a = EmptyList
              | Cons a (MyList a) deriving Show

instance Functor MyList where
  fmap _ EmptyList    = EmptyList
  fmap f (Cons x mxs) = Cons (f x) (fmap f mxs)

--automatyczny functor nie działa

data BinTree a = EmptyBT |
                 NodeBT a (BinTree a) (BinTree a) deriving (Show)

instance Functor BinTree where 
    fmap _ EmptyBT = EmptyBT
    fmap f (NodeBT a lt rt)  = NodeBT (f a) (fmap f lt) (fmap f rt)

newtype Pair b a = Pair { getPair :: (a,b) }  deriving Show-- fmap should change the first element

instance Functor (Pair c) where
    fmap f (Pair (a,b)) = Pair (f a, b) 

data Tree2 a = EmptyT2 |
               Leaf a  |
               Node (Tree2 a) a (Tree2 a) deriving Show

instance Functor Tree2 where
    fmap _ EmptyT2 = EmptyT2
    fmap f (Leaf a) = Leaf (f a)
    fmap f (Node lt a rt) = Node (fmap f lt) (f a) (fmap f rt)

data GTree a = Leaf2 a |
               GNode [GTree a] deriving Show

instance Functor GTree where
    fmap f (Leaf2 a) = Leaf2 (f a)
    fmap f (GNode a) = GNode (map (fmap f) a)