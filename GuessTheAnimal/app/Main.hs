module Main where 
  import System.IO
  import DataTypes
  import IOService
  import Constants
  main :: IO ()
  main = do 
    putStrLn "Game starting..."
    entry <- IOService.fetchEntryData 
    putStrLn entry
    return ()



