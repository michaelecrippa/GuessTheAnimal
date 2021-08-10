module IOService where
    import Helpers(in')
    import System.IO ()
    import Constants ( databasePath, expectedAnswers, restartMessage, positive, startMessage, newGameMessage, endGameMessage, animalGuessedMessage, animalCannotBeGuessed, askForAnimal, guessAnimal, askForQuestion1, askForQuestion2 )
    import DataTypes ( Tree(Leaf , Node) )
    
    fetchEntryData :: IO String 
    fetchEntryData = readFile Constants.databasePath

    askForRestart :: IO String
    askForRestart = do
        putStrLn Constants.restartMessage 
        getUserResponse
    
    getUserResponse :: IO String
    getUserResponse = do
        response <- getLine
        putStrLn "\n" 
        if in' response Constants.positive
            then return "Yes"
            else return "No"
    
    saveGameData :: DataTypes.Tree -> IO ()
    saveGameData gameData = writeFile Constants.databasePath (show gameData)

    start :: IO ()
    start = putStrLn Constants.startMessage

    newGame :: IO ()
    newGame = putStrLn Constants.newGameMessage 

    endGame :: IO ()
    endGame = putStrLn Constants.endGameMessage 

    animalGuessed :: IO ()
    animalGuessed = putStrLn Constants.animalGuessedMessage 

    animalCannotBeGuessed :: IO ()
    animalCannotBeGuessed = putStrLn Constants.animalCannotBeGuessed 

    requestAnswer :: String -> IO String
    requestAnswer question = do putStrLn question 
                                getUserResponse 
    
    print :: DataTypes.Tree -> String
    print (DataTypes.Leaf animal) = animal
    print (DataTypes.Node n _ _) = n 

    talk :: String -> IO String
    talk s = do putStrLn (Constants.guessAnimal  ++ s ++ Constants.expectedAnswers )
                getUserResponse

    askForAnimal :: Tree -> IO Tree
    askForAnimal animal = do putStrLn Constants.askForAnimal 
                             animalName <- getLine 
                             let newLeaf = DataTypes.Leaf animalName
                             putStrLn (Constants.askForQuestion1  ++ animalName ++ Constants.askForQuestion2 ++ IOService.print animal)
                             question <- getLine 
                             return (DataTypes.Node question newLeaf animal)