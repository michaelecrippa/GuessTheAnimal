import IOService ( writeData, readData, print )
import DataTypes ( Tree(Leaf, Node) )
import Test.HUnit ( runTestTT, assertEqual, Test(TestLabel, TestCase, TestList) )
import Helpers ( in' )
import Constants ( positive, testDatabasePath )
import Data.Bool ( Bool(True, False) )

main = do runTestTT printTypes
          runTestTT helpers
          runTestTT ioservices
          
printTypes = TestList [TestLabel "Prints" printLeaf, printNode] 
helpers = TestList [TestLabel "Test helpers" listContains, listDoesntContain]
ioservices = TestList [TestLabel "Test IOServices" fetchDbData, saveGameProgress]

printLeaf = TestCase (assertEqual "Leaf" (IOService.print (DataTypes.Leaf "cat")) "cat")
printNode = TestCase (assertEqual "Node" (IOService.print (DataTypes.Node "Is it left?" (DataTypes.Leaf "l") (DataTypes.Leaf "r"))) "Is it left?")

listContains = TestCase ( assertEqual "Contains YES" Data.Bool.True (Helpers.in' "YES" Constants.positive))
listDoesntContain = TestCase ( assertEqual "Doesnt contain No" Data.Bool.False (Helpers.in' "No" Constants.positive))

fetchDbData = TestCase (do entryData <- readData Constants.testDatabasePath
                           assertEqual "Entry data" entryData "Node \"Does it swim?\" (Leaf \"fish\") (Leaf \"bird\")")

saveGameProgress = TestCase (do IOService.writeData (DataTypes.Node "Does it swim?" (DataTypes.Leaf "fish") (DataTypes.Leaf "bird")) Constants.testDatabasePath
                                str <- IOService.readData Constants.testDatabasePath 
                                assertEqual "Data saved is" str "Node \"Does it swim?\" (Leaf \"fish\") (Leaf \"bird\")") 
