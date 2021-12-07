data GTree a = Leaf a |
               GNode [GTree a]
               deriving Show

sumGTree :: Num a => GTree a -> a
sumGTree (Leaf a) = a
sumGTree (GNode (x:xs)) = sumGTree x + sumGTree (GNode xs)


--6
data Expr a = Lit a | -- literal/value a, e.g. Lit 2 = 2
              Op Ops (Expr a) (Expr a) |
              If (BExpr a) (Expr a) (Expr a)

data Ops = Add | Substract | Multiply

data BExpr a = BoolLit Bool |
               And (BExpr a) (BExpr a) |
               Or (BExpr a) (BExpr a) |
               Not (BExpr a) |
               Equal (Expr a) (Expr a) |
               Greater (Expr a) (Expr a)


eval :: Num a => Expr a -> a
eval (Lit n) = n
eval (Op Add e1 e2) = eval e1 + eval e2
eval (Op Substract e1 e2) = eval e1 - eval e2
eval (Op Multiply e1 e2) = eval e1 * eval e2
 



show' :: Show a => Expr a -> String
show' (Lit n) = show n
show' (Op Add e1 e2) = "(" ++ show' e1 ++ "+" ++ show' e2 ++ ")"
show' (Op Substract e1 e2) = "(" ++ show' e1 ++ "-" ++ show' e2 ++ ")"
show' (Op Multiply e1 e2) = "(" ++ show' e1 ++ "*" ++ show' e2 ++ ")"
--show' (If BoolLit e1 e2) = "(" ++ show' e1 ++ "||" ++ show' e2 ++ ")"