--(>>) :: Monad m => m a -> m b -> m b
-- ghci> putChar 'a' >> putChar '\n'
-- a

-- ghci> actSeq = putChar 'A' >> putChar 'G' >> putChar 'H' >> putChar '\n'
-- ghci> :t actSeq
-- actSeq :: IO ()


doActSeq = do
    putChar 'a'
    putChar 'g'
    putChar 'h'
    putChar '\n'

--(>>=) :: Monad m => m a -> (a -> m b) -> m b

echo1 = getLine >>= putStrLn

doEcho1 = do 
    line <- getLine 
    putStrLn line

echo2 = getLine >>= \line -> putStrLn $ line ++ "!"

doEcho2 = do 
    line <- getLine 
    putStrLn $ line ++ "!"

echo3 :: IO()
echo3 = getLine >>= \l1 -> getLine  >>= \l2 -> putStrLn $ l1 ++ l2 

doEcho3 :: IO()
doEcho3  = do
    line1 <- getLine 
    line2 <- getLine 
    putStrLn $ line1 ++ line2

dialog :: IO()
dialog = putStr "What is your happy number?" 
        >> getLine
        >>= \n -> let num = read n :: Int in
                if num == 7 
                then putStrLn "Ah, lucky 7!"
                else if odd num 
                    then putStrLn "Odd number! That's most people's choice..."
                    else putStrLn "Hm even number? Unsual!"

doDialog :: IO()
doDialog  = do
    putStrLn "What is your happy number?" 
    line1 <- getLine 
    let num = read line1 :: Int in
        if num == 7
        then putStrLn "Ah, lucky 7!"
        else if odd num 
                then putStrLn "Odd number! That's most people's choice..."
                else putStrLn "Hm even number? Unsual!"

twoQuestionsDo :: IO ()
twoQuestionsDo = do
    putStr "What is your name? "
    name <- getLine
    putStr "How old are you? "
    age <- getLine
    print (name,age)

twoQuestions :: IO()
twoQuestions  = putStrLn "What is your name?"
                >> getLine 
                >>= \name 
                -> putStrLn "How old are you?"
                >> getLine
                >>= \year -> print (name,year) 

myFunc :: IO ()
myFunc = getLine >>= \k -> return (k++k) >>= \l -> print [k,l]

myFunc' :: IO ()
myFunc' = do 
    k <- getLine 
    s <- return (k++k)
    print [k,s]