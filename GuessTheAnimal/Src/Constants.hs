module Constants where
    databasePath = "./Database/entryData.txt"
    testDatabasePath = "./Database/testData.txt"
    yes = "Yes"
    expectedAnswers = " Yes/No"
    restartMessage = "Do you want to play again? " ++ expectedAnswers
    startMessage = "Guess the animal starting...\nPlease answer with Yes or No to the questions and most importantly have fun :)\n"
    newGameMessage = "Think of an animal and we will guess it, or maybe not!? :)"
    endGameMessage = "Thank you for playing, see you soon! :)"
    animalGuessedMessage = "I guessed it WOHOOOOOOO, that was fun!"
    animalCannotBeGuessed = "I cannot guess it sorry :("
    askForAnimal = "Please tell me your animal!"
    guessAnimal = "Your animal is "
    askForQuestion1 = "Please enter a question that is true for "
    askForQuestion2 = " and false for "

    positive :: [[Char]]
    positive = ["y", "Y" , "yes", "Yes", "YES", "YEs"]