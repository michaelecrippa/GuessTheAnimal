import GuessTheAnimal(startGame)
import IOService(print, fetchEntryData, getUserResponse)
import DataTypes(Tree(Leaf, Node))
import Test.HUnit( runTestTT, assertEqual, Test(TestLabel, TestCase, TestList))
import System.IO ()

main = do runTestTT
            tests
          
tests = TestList [TestLabel "Test printing leaf" printLeaf, TestLabel "Test printing node" printNode, TestLabel "Test fetching db data" fetchDbData, TestLabel "test" test]  

printLeaf = TestCase (assertEqual "Leaf" (IOService.print (DataTypes.Leaf "cat")) "cat")
printNode = TestCase (assertEqual "Node" (IOService.print (DataTypes.Node "cat" (DataTypes.Leaf "l") (DataTypes.Leaf "r"))) "cat")

fetchDbData = TestCase (do entryData <- IOService.fetchEntryData
                           assertEqual "Entry data" entryData "Node \"Is it warm-blooded?\" (Node \"Does it fly?\" (Node \"Does it have furr?\" (Leaf \"Bat\") (Leaf \"bird\")) (Leaf \"dog\")) (Node \"Does it have 4 legs?\" (Leaf \"lizard\") (Leaf \"snake\"))")

