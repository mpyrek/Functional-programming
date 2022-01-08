-- ghci> :i Applicative 
-- type Applicative :: (* -> *) -> Constraint
-- class Functor f => Applicative f where
--   pure :: a -> f a
--   (<*>) :: f (a -> b) -> f a -> f b
--   GHC.Base.liftA2 :: (a -> b -> c) -> f a -> f b -> f c
--   (*>) :: f a -> f b -> f b
--   (<*) :: f a -> f b -> f a
--   {-# MINIMAL pure, ((<*>) | liftA2) #-}
--         -- Defined in `GHC.Base'
-- instance Applicative (Either e) -- Defined in `Data.Either'
-- instance Applicative [] -- Defined in `GHC.Base'
-- instance Applicative Solo -- Defined in `GHC.Base'
-- instance Applicative Maybe -- Defined in `GHC.Base'
-- instance Applicative IO -- Defined in `GHC.Base'
-- instance Applicative ((->) r) -- Defined in `GHC.Base'
-- instance (Monoid a, Monoid b, Monoid c) =>
--          Applicative ((,,,) a b c)
--   -- Defined in `GHC.Base'
-- instance (Monoid a, Monoid b) => Applicative ((,,) a b)
--   -- Defined in `GHC.Base'
-- instance Monoid a => Applicative ((,) a) -- Defined in `GHC.Base'

--  ghci> (:) <*> (\x->[x]) $ 2 !!! 2 używana do obu funkcji
-- [2,2]

-- ghci> (+) <$> (+1) <*> (*100) $ 5 5 używana do obu funckji
-- 506

-- ghci> [1..2] *> [11..15]
-- [11,12,13,14,15,11,12,13,14,15]

--ghci> pure (+) <*> ZipList [1,2,3] <*> ZipList [100,101,102]
--ghci> (+) <$> ZipList [1,2,3] <*> ZipList [100,101,102]  


-- ghci> (+) <$> (+1) <*> (*100) $ 5
-- 506

-- ???????????????????????
-- ghci> Left 1 *> Left 2   
-- Left 1
-- ghci> Left 1 <* Left 2 
-- Left 1
-- ghci> Right 1 *> Right 2 
-- Right 2
-- ghci> Right 1 <* Right 2 
-- Right 1
-- ghci> Left 1 <* Left 2   
-- Left 1
-- ghci> Left 1 *> Left 2 
-- Left 1
-- ghci> Right 1 <* Right 2 
-- Right 1
-- ghci> Right 1 *> Right 2 
-- Right 2