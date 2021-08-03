module Main where 
  import System.IO
  import DataTypes
  import IOService
  import Constants
  import qualified Data.Tree as DataTypes
  main :: IO ()
  main = do 
    IOService.start
    entry <- IOService.fetchEntryData 
    gameOn (read entry) -- parse tree, catch errors
    return ()

  gameOn :: DataTypes.Tree -> IO DataTypes.Tree
  gameOn entry = do 
    IOService.startGame 
    gameInfo <- play entry -- play
    IOService.saveGameData gameInfo
    restart <- IOService.askForRestart 
    case restart of
      Yes -> play gameInfo
      No -> do 
        IOService.endGame 
        return gameInfo
  
  play :: DataTypes.Tree -> IO DataTypes.Tree
  play Leaf = do ...

  play Node = do ... TODO




