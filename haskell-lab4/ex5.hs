data MyInt = MkMyInt Int

instance Eq MyInt where
  (==) (MkMyInt i1) (MkMyInt i2) = i1 == i2

instance Ord MyInt where
  (<=) (MkMyInt i1) (MkMyInt i2) = i1 <= i2

instance Num MyInt where
  (+) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 + i2)
  (-) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 - i2)
  (*) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 * i2)
  negate (MkMyInt i)            = MkMyInt (negate i)
  abs (MkMyInt i)               = MkMyInt (abs i)
  signum (MkMyInt i)            = MkMyInt (signum i)
  fromInteger int               = MkMyInt (fromIntegral int)

instance Show MyInt where
  show (MkMyInt i) = "MkMyInt " ++ show i

--6 

newtype MyInt' = MkMyInt' Int

instance Eq MyInt' where
  (==) (MkMyInt' i1) (MkMyInt' i2) = i1 == i2

data BinTree a = EmptyBT |
                 NodeBT a (BinTree a) (BinTree a)
instance Eq a => Eq (BinTree a) where
  (==) (NodeBT a lt rt) (NodeBT b lt' rt') = a==b && lt==lt' && rt == rt'
  (==) EmptyBT EmptyBT                     = True 
  (==) EmptyBT _                           = False 
  (==) _ EmptyBT                           = False 




instance Ord MyInt' where
  (<=) (MkMyInt' i1) (MkMyInt' i2) = i1 <= i2

instance Num MyInt' where
  (+) (MkMyInt' i1) (MkMyInt' i2) = MkMyInt' (i1 + i2)
  (-) (MkMyInt' i1) (MkMyInt' i2) = MkMyInt' (i1 - i2)
  (*) (MkMyInt' i1) (MkMyInt' i2) = MkMyInt' (i1 * i2)
  negate (MkMyInt' i)             = MkMyInt' (negate i)
  abs (MkMyInt' i)                = MkMyInt' (abs i)
  signum (MkMyInt' i)             = MkMyInt' (signum i)
  fromInteger int                 = MkMyInt' (fromIntegral int)

instance Show MyInt' where
  show (MkMyInt' i) = "MkMyInt' " ++ show i


class Mappable t where
  fMap :: (a -> b) -> t a -> t b

data Vec3D a = Vec3D {x::a, y::a, z::a} deriving Show

instance Mappable Vec3D where
  fMap f (Vec3D x y z) = Vec3D (f x) (f y) (f z)

--2
newtype Pair a = Pair (a,a) deriving Show

instance Mappable Pair where
  --nazwa funkcji fmap, f-f. mapująca , konstruktor danych = konstruktor danych
  fMap f (Pair (x,y)) = Pair (f x, f y)

instance Mappable BinTree where
  fMap f (NodeBT n lt rt) = NodeBT (f n) (fMap f lt) (fMap f rt)
  fMap f EmptyBT = EmptyBT
  