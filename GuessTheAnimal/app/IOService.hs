module IOService where
    import System.IO ()
    import Constants ( databasePath )
    import DataTypes ( CommonUserResponse(Yes, No), Tree )
    fetchEntryData :: IO String 
    fetchEntryData = readFile Constants.databasePath 

    askForRestart :: IO CommonUserResponse
    askForRestart = do
        putStrLn $ "Do you want to play again?" ++ " Yes/No " 
        getUserResponse
    
    getUserResponse :: IO CommonUserResponse 
    getUserResponse = do
        response <- getLine
        putStrLn "\n" 
        if response == "y" || response == "Y" || response == "yes" || response == "Yes" || response == "YES" || response == "YEs" 
            then return Yes 
            else return No
    
    saveGameData :: DataTypes.Tree -> IO ()
    saveGameData gameData = writeFile Constants.databasePath (show gameData)

    start :: IO ()
    start = putStrLn "Guess the animal starting..."

    startGame :: IO ()
    startGame = putStrLn "Think of an animal and we will guess it, or maybe not!? :)"

    endGame :: IO ()
    endGame = putStrLn "Thank you for playing, see you soon! :)"