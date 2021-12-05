data BinIntTree = EmptyIntBT |
                  IntNodeBT Int BinIntTree BinIntTree

sumBinIntTree :: BinIntTree -> Int
sumBinIntTree EmptyIntBT = 0
sumBinIntTree (IntNodeBT n lt rt) = n + sumBinIntTree lt + sumBinIntTree rt

--ghci> sumBinIntTree  (IntNodeBT  2  (IntNodeBT 3 EmptyIntBT EmptyIntBT)  (IntNodeBT 2 (IntNodeBT 1 EmptyIntBT EmptyIntBT) EmptyIntBT))


data BinTree a = EmptyBT |
                 NodeBT a (BinTree a) (BinTree a)
                 deriving (Show,Read)

sumBinTree :: (Num a) => BinTree a -> a
sumBinTree EmptyBT = 0
sumBinTree (NodeBT n lt rt) = n + sumBinTree lt + sumBinTree rt


depthOfBT :: (Ord a,Show a)=> BinTree a -> Int -- głębokość drzewa binarnego
depthOfBT EmptyBT = 0
depthOfBT (NodeBT _ lt rt) = 1 + max(depthOfBT lt) ( depthOfBT rt)

flattenBT :: BinTree a -> [a]  -- napisać trzy wersje: preorder, inorder, postorder
flattenBT EmptyBT = []
flattenBT  (NodeBT n lt rt) = [n] ++ flattenBT lt ++ flattenBT rt

--inorder
flattenBT' :: BinTree a -> [a]  -- napisać trzy wersje: preorder, inorder, postorder
flattenBT' EmptyBT = []
flattenBT'  (NodeBT n lt rt) =   flattenBT lt ++[n] ++ flattenBT rt

flattenBT'' :: BinTree a -> [a]  -- napisać trzy wersje: preorder, inorder, postorder
flattenBT'' EmptyBT = []
flattenBT''  (NodeBT n lt rt) = flattenBT lt ++ flattenBT rt ++ [n]

mapBT ::(a -> b) -> BinTree a -> BinTree b -- funkcja map dla drzewa binarnego
mapBT f EmptyBT = EmptyBT
mapBT f (NodeBT n lt rt)= NodeBT (f n)(mapBT f lt)(mapBT f rt)

insert :: Ord a => a -> BinTree a -> BinTree a -- insert element into BinTree
insert k EmptyBT = (NodeBT k EmptyBT EmptyBT)
insert k (NodeBT n lt rt)
    | k<=n      = NodeBT n (insert k lt) rt 
    | otherwise = NodeBT n lt (insert k rt)

list2BST :: Ord a => [a] -> BinTree a -- list to Binary Search Tree (BST)
list2BST [] = EmptyBT
list2BST t = foldr insert EmptyBT t 

occurs :: Eq a => a -> BinTree a -> Int -- liczba wystąpień elementu w drzewie binarnym
occurs k EmptyBT = 0
occurs k (NodeBT n lt rt) = if k == n 
                             then  1 + (occurs k lt) + (occurs k rt)
                             else (occurs k lt) + (occurs k rt)


occurs' :: Eq a => a -> BinTree a -> Int -- liczba wystąpień elementu w drzewie binarnym
occurs' k EmptyBT = 0
occurs' k (NodeBT n lt rt) | k == n    =  1 + (occurs k lt) + (occurs k rt)
                          | otherwise = (occurs k lt) + (occurs k rt)

elemOf :: Eq a => a -> BinTree a -> Bool -- sprawdzenie, czy element znajduje się w drzewie
elemOf k EmptyBT = False
elemOf k (NodeBT n lt rt) | k==n      = True
                          | otherwise = elemOf k lt || elemOf k rt  

reflect :: BinTree a -> BinTree a -- 'odbicie lustrzane' drzewa binarnego
reflect EmptyBT = EmptyBT
reflect (NodeBT n lt rt) = (NodeBT n (reflect rt) (reflect lt)) 

--cos nie tak
--minElemOf :: Ord a => BinTree a -> a
--minElemOf EmptyBT = EmptyBT -- min zbioru pustego jest zbiór pusty 
--minElemOf (NodeBT n lt rt) | n == min n (min(minElemOf lt) (minElemOf rt)) = (NodeBT n lt rt)
--                           | otherwise                                     =  min (minElemOf lt) (minElemOf rt)

--??
--foldBinTree :: (a -> b -> b -> b) -> b -> BinTree a -> b -- fold dla drzewa binarnego


--3
data Expr a = Lit a | -- literal/value a, e.g. Lit 2 = 2
              Add (Expr a) (Expr a)

eval :: Num a => Expr a -> a
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2

show' :: Show a => Expr a -> String
show' (Lit n) = show n
show' (Add e1 e2) = "(" ++ show' e1 ++ "+" ++ show' e2 ++ ")"



