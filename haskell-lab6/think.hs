safeTail :: [a] -> Either String [a]
safeTail []     = Left "Empty list!"
safeTail (x:xs) = Right xs

doSafeTail3x :: [a] -> Either String [a]
doSafeTail3x xs = do
  t1 <- safeTail xs
  t2 <- safeTail t1
  t3 <- safeTail t2
  return t3

safeDiv :: Int -> Int -> Either String Int
safeDiv x y | y /= 0    = Right $ x `div` y
            | otherwise = Left "Cannot div by zero!"

safeF5 :: Int -> Int -> Int -> Either String Int
safeF5 x y z =
  case (safeDiv 1000 x) of
    Left e -> Left e
    Right (iOverX) ->
      case (safeDiv 100 y) of
        Left e -> Left e
        Right (iOverY) ->
          case (safeDiv 10 z) of
            Left e -> Left e
            Right (iOverZ) -> Right $ iOverX + iOverY + iOverZ

safeF5' :: Int -> Int -> Int -> Either String Int
safeF5' x y z = do
  iOverX <- safeDiv 1000 x
  iOverY <- safeDiv 100 y
  iOverZ <- safeDiv 10 z
  return $ iOverX + iOverY + iOverZ

data Tree  a= Node a (Tree a) (Tree a) | Leaf
pathSum Leaf = pure 0
pathSum (Node a lt rt) = concat $ ([(a+)] <*>) <$> (fmap pathSum [lt,rt])

xd = getLine >>= \s -> return 3 >>= \n -> putStrLn $ s ++ show n 

xddd = do
  s <- getLine 
  n <- return 3 
  putStrLn  $ s ++show n 