-- type Functor :: (* -> *) -> Constraint
-- class Functor f where
--   fmap :: (a -> b) -> f a -> f b
--   (<$) :: a -> f b -> f a
--   {-# MINIMAL fmap #-}
--         -- Defined in `GHC.Base'
-- instance Functor (Either a) -- Defined in `Data.Either'
-- instance Functor [] -- Defined in `GHC.Base'
-- instance Functor Solo -- Defined in `GHC.Base'
-- instance Functor Maybe -- Defined in `GHC.Base'
-- instance Functor IO -- Defined in `GHC.Base'
-- instance Functor ((->) r) -- Defined in `GHC.Base'
-- instance Functor ((,,,) a b c) -- Defined in `GHC.Base'
-- instance Functor ((,,) a b) -- Defined in `GHC.Base'
-- instance Functor ((,) a) -- Defined in `GHC.Base'


-- type Either :: * -> * -> *
-- data Either a b = Left a | Right b
--         -- Defined in `Data.Either'
-- instance Applicative (Either e) -- Defined in `Data.Either'
-- instance (Eq a, Eq b) => Eq (Either a b)
--   -- Defined in `Data.Either'
-- instance Functor (Either a) -- Defined in `Data.Either'
-- instance Monad (Either e) -- Defined in `Data.Either'
-- instance (Ord a, Ord b) => Ord (Either a b)
--   -- Defined in `Data.Either'
-- instance Semigroup (Either a b) -- Defined in `Data.Either'
-- instance (Show a, Show b) => Show (Either a b)
--   -- Defined in `Data.Either'
-- instance (Read a, Read b) => Read (Either a b)
--   -- Defined in `Data.Either'
-- instance Foldable (Either a) -- Defined in `Data.Foldable'
-- instance Traversable (Either a) -- Defined in `Data.Traversable'

-- ghci> fmap (+2) (Left 3) -- daje wynik 3
-- ghci> fmap (+2) (Right 3) -- daje wynik 5

-- ghci> :t ($)             
-- ($) :: (a -> b) -> a -> b

-- ghci> :t (<$>)
-- (<$>) :: Functor f => (a -> b) -> f a -> f b
