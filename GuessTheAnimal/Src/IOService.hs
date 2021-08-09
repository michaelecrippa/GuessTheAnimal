module IOService where
    import System.IO ()
    import Constants ( databasePath )
    import DataTypes ( Tree(Leaf , Node) )
    
    fetchEntryData :: IO String 
    fetchEntryData = readFile Constants.databasePath

    askForRestart :: IO String
    askForRestart = do
        putStrLn $ "Do you want to play again?" ++ " Yes/No " 
        getUserResponse
    
    getUserResponse :: IO String
    getUserResponse = do
        response <- getLine
        putStrLn "\n" 
        if response == "y" || response == "Y" || response == "yes" || response == "Yes" || response == "YES" || response == "YEs" 
            then return "Yes"
            else return "No"
    
    saveGameData :: DataTypes.Tree -> IO ()
    saveGameData gameData = writeFile Constants.databasePath (show gameData)

    start :: IO ()
    start = putStrLn "Guess the animal starting..."

    newGame :: IO ()
    newGame = putStrLn "Think of an animal and we will guess it, or maybe not!? :)"

    endGame :: IO ()
    endGame = putStrLn "Thank you for playing, see you soon! :)"

    animalGuessed :: IO ()
    animalGuessed = putStrLn "I guessed it WOHOOOOOOO, that was fun!"

    animalCannotBeGuessed :: IO ()
    animalCannotBeGuessed = putStrLn "I cannot guess it sorry :("

    requestAnswer :: String -> IO String
    requestAnswer question = do putStrLn question 
                                getUserResponse 
    
    print :: DataTypes.Tree -> String
    print (DataTypes.Leaf animal) = animal
    print (DataTypes.Node n _ _) = n 

    talk :: String -> IO String
    talk s = do putStrLn ("Is your animal" ++ s ++ "? Yes/No")
                getUserResponse

    askForAnimal :: Tree -> IO Tree
    askForAnimal animal = do putStrLn "Please tell me your animal!"
                             animalName <- getLine 
                             let newLeaf = DataTypes.Leaf animalName
                             putStrLn ("Please enter a question that is true for " ++ animalName ++ " and false for " ++ IOService.print animal)
                             question <- getLine 
                             return (DataTypes.Node question newLeaf animal)