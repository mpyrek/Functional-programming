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

safeF5'' :: Int -> Int -> Int -> Either String Int
safeF5'' x y z  = f <$> res1 <*> res2 <*> res3 
    where 
        f i j k = i + j + k 
        res1 = safeDiv 1000 x
        res2 = safeDiv 100 y
        res3 = safeDiv 10 z


join :: Either e (Either e a) -> Either e a
join (Right (Right a)) = Right a
join (Right (Left e)) = Left e
join (Left e) = Left e 