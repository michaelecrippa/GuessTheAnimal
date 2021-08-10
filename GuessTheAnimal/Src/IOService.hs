module IOService where
    import Helpers ( in', print)
    import System.IO ()
    import Constants ( databasePath, expectedAnswers, restartMessage, positive, startMessage, newGameMessage, endGameMessage, animalGuessedMessage, animalCannotBeGuessed, askForAnimal, guessAnimal, askForQuestion1, askForQuestion2 )
    import DataTypes ( Tree(Leaf , Node) )
    
    fetchEntryData :: IO String 
    fetchEntryData = readData Constants.databasePath

    readData :: String -> IO String
    readData filePath = readFile filePath

    askForRestart :: IO String
    askForRestart = do
        putStrLn Constants.restartMessage 
        getUserResponse
    
    getUserResponse :: IO String
    getUserResponse = do
        response <- getLine
        if in' response Constants.positive
            then return "Yes"
            else return "No"
    
    saveGameData :: DataTypes.Tree -> IO ()
    saveGameData gameData = writeData gameData Constants.databasePath

    writeData :: DataTypes.Tree -> String -> IO ()
    writeData tree filePath = writeFile filePath (show tree)

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

    talk :: String -> IO String
    talk s = do putStrLn (Constants.guessAnimal  ++ s ++ Constants.expectedAnswers )
                getUserResponse

    askForAnimal :: Tree -> IO Tree
    askForAnimal animal = do putStrLn Constants.askForAnimal 
                             animalName <- getLine 
                             let newLeaf = DataTypes.Leaf animalName
                             putStrLn (Constants.askForQuestion1  ++ animalName ++ Constants.askForQuestion2 ++ Helpers.print animal)
                             question <- getLine 
                             return (DataTypes.Node question newLeaf animal)