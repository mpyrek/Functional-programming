import Data.List (sort)
sortDesc :: Ord a => [a] -> [a]
sortDesc xs = (reverse . sort ) xs

--point free
sortDesc2 :: Ord a => [a] -> [a]
sortDesc2  = (reverse . sort ) 

are2FunsEqAt :: Eq a => (t -> a) -> (t -> a) -> [t] -> Bool
are2FunsEqAt f g xs =    -- are2FunsEqAt (+2) (\x -> x + 2) [1..1000] = True

--ghci:((,) $ 1) $ 2
-- ((f .) $ g . h) 3