data CartInt2DVec = MkCartInt2DVec X Y 
--wersja z aliasami
type X =Int 
type Y = Int

xCoord :: CartInt2DVec -> X 
xCoord (MkCartInt2DVec x _) = x

yCoord :: CartInt2DVec -> Y
yCoord (MkCartInt2DVec _ y) = y

data Cart2DVec' a = MkCart2DVec' a a 

xCoord' :: Cart2DVec' a -> a 
xCoord' (MkCart2DVec' x _) = x

yCoord' :: Cart2DVec' a -> a
yCoord' (MkCart2DVec' _ x) = x


data Cart2DVec'' a = MkCart2DVec'' {x::a, y::a}

data List a = EmptyL | Cons a (List a) deriving Show

head' :: List a -> a 
head' EmptyL = error "head: the empty List has no head"
head' (Cons x xs) = x


-- enum type example (special case of sum type)
data ThreeColors = Blue |
                   White |
                   R 

type ActorName = String


leadingActor :: ThreeColors -> ActorName
leadingActor Blue  = "Juliette Binoche"
leadingActor White = "Zbigniew Zamachowski"
leadingActor R   = "Irene Jacob"



{-
uwaga: ta sama nazwa* dla:
 - konstruktora typu (po lewej)
 - konstruktora danych/wartości (po prawej)

 * druga (obok omówionej poprzednio -- z prefiksem 'Mk') powszechna konwencja w Haskellu!
-}

data Cart3DVec a = Cart3DVec a a a

xCoord3D :: Cart3DVec a -> a   
xCoord3D (Cart3DVec a _ _) = a

yCoord3D :: Cart3DVec a-> a
yCoord3D (Cart3DVec _ a _) = a

zCoord3D :: Cart3DVec a -> a
zCoord3D (Cart3DVec _ _ a) = a

data Cart3DVec' a = Cart3DVec' {x' :: a, y' :: a, z':: a}

data Cart3DVec'' = Cart3DVec'' {x'' :: Int, y'' :: Int,z'' :: Int} deriving Show



data Shape = Circle Float |
             Rectangle Float Float

area :: Shape -> Float
area (Circle r) = r^2 * pi 
area (Rectangle a b) = a*b



--7
--data Tree a = EmptyT |
--              Node a (Tree a) (Tree a)
--              deriving Show

--rootValue :: Tree a -> a
--rootValue EmptyT = error "nie moze być puste drzewo"
--rootValue Node a (_ _)(_ _) = a


--8 
actionFor :: TrafficLights -> String

data TrafficLights = Red | Orange | Green

actionFor Red = "stay"
actionFor Orange = "get ready"
actionFor Green = "go"




