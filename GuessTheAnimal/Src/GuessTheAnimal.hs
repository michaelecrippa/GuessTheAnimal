module GuessTheAnimal( startGame ) where 
    import IOService
    import Constants
    import DataTypes (Tree (Leaf, Node))
    startGame :: IO ()
    startGame = do 
        IOService.start
        entry <- IOService.fetchEntryData 
        gameOn (read entry) -- parse tree, catch errors
        return ()

    gameOn :: DataTypes.Tree -> IO DataTypes.Tree
    gameOn entry = do 
        IOService.newGame 
        gameInfo <- play entry -- play
        IOService.saveGameData gameInfo
        restart <- IOService.askForRestart 
        if restart == "Yes"
            then play gameInfo
            else do IOService.endGame 
                    return gameInfo
    
    play :: DataTypes.Tree -> IO DataTypes.Tree
    play node@(DataTypes.Node h l r) = do res <- IOService.requestAnswer h
                                          if res == "Yes"
                                             then do y <- play l
                                                     return (DataTypes.Node h y r)
                                             else do n <- play r
                                                     return (DataTypes.Node h l n)

    play leaf@(DataTypes.Leaf _) = do res <- IOService.talk (IOService.print leaf)
                                      if res == "Yes" 
                                         then do IOService.animalGuessed 
                                                 return leaf
                                         else do IOService.animalCannotBeGuessed
                                                 IOService.askForAnimal leaf