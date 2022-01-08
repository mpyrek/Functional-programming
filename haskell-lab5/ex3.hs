nTimes :: Int -> IO () -> IO ()
nTimes 0 action = return ()
nTimes n action = do
  action
  nTimes (n-1) action

ioActionFactory :: Int -> String -> IO ()
ioActionFactory n = case n of
  1 -> \name -> putStrLn ("Good morning, " ++ name)
  2 -> \name -> putStrLn ("Good afternoon, " ++ name)
  3 -> \name -> putStrLn ("Good night, " ++ name)
  _ -> \name -> putStrLn ("Hello, " ++ name)

actionList :: [IO ()]
actionList = [ioActionFactory 1 "Ben",
              ioActionFactory 2 "Joe",
              ioActionFactory 3 "Ally"]

sequence'        :: [IO ()] -> IO ()
sequence' []     =  return ()
sequence' (a:as) =  do a
                       sequence' as

-- wszytskie trzy wyrażenia dają ten sam wynik 
-- ghci> foldr1 (>>) actionList 
-- ghci> foldl1 (>>) actionList
-- ghci> foldr (>>) (return ()) actionList

sequence1        :: [IO ()] -> IO ()
sequence1 (a:as) =  foldr (>>) (return ()) (a:as)



getLine' :: IO String 
getLine' = do
  x <- getChar 
  if x == '\n'
  then return []
  else do 
    xs <- getLine'
    return (x:xs) 

main :: IO ()
main = do
  line <- getLine' 
  putStrLn line

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = do putChar x 
                    putStr' xs

putStrLn' :: String -> IO ()
putStrLn' xs = do putStr' xs 
                  putChar '\n'
