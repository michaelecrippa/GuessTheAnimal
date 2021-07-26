module IOService where
    import System.IO
    import Constants ( dataBasePath )
    fetchEntryData :: IO String 
    fetchEntryData = readFile Constants.dataBasePath 
    
