import GuessTheAnimal ( startGame )
import IOService ( fetchEntryData, getUserResponse, writeData, readData )
import DataTypes ( Tree(Leaf, Node) )
import Test.HUnit ( runTestTT, assertEqual, Test(TestLabel, TestCase, TestList) )
import Helpers ( in', print )
import Constants ( positive, testDatabasePath )
import System.IO ()
import Data.Bool ( Bool(True, False) )

main = do runTestTT printTypes
          runTestTT helpers
          runTestTT ioservices
          
printTypes = TestList [TestLabel "Prints" printLeaf, printNode] 
helpers = TestList [TestLabel "Test helpers" listContains, listDoesntContain]
ioservices = TestList [TestLabel "Test IOServices" fetchDbData, saveGameProgress]

printLeaf = TestCase (assertEqual "Leaf" (Helpers.print (DataTypes.Leaf "cat")) "cat")
printNode = TestCase (assertEqual "Node" (Helpers.print (DataTypes.Node "Is it left?" (DataTypes.Leaf "l") (DataTypes.Leaf "r"))) "Is it left?")

listContains = TestCase ( assertEqual "Contains YES" Data.Bool.True (Helpers.in' "YES" Constants.positive))
listDoesntContain = TestCase ( assertEqual "Doesnt contain No" Data.Bool.False (Helpers.in' "No" Constants.positive))

fetchDbData = TestCase (do entryData <- IOService.fetchEntryData
                           assertEqual "Entry data" entryData "Node \"Is it warm-blooded?\" (Leaf \"Bat\") (Leaf \"Snake\")")

saveGameProgress = TestCase (do IOService.writeData (DataTypes.Node "Does it swim?" (DataTypes.Leaf "fish") (DataTypes.Leaf "bird")) Constants.testDatabasePath
                                str <- IOService.readData Constants.testDatabasePath 
                                assertEqual "Data saved is" str "Node \"Does it swim?\" (Leaf \"fish\") (Leaf \"bird\")") 
