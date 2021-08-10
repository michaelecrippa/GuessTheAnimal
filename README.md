# GuessTheAnimal
## How to run the project ?
 - Fetch/Clone the project  
 - Install dependencies ( ghc, cabal, stack ) 
 - Choose one   
   - Run `stack build`
   - Run `stack exec GuessTheAnimal-exe`  
   or 
   - Run `stack run`  
## How to test the project? 
 - Run `stack test`
## Refs  
 - [Haskell](http://learnyouahaskell.com/)
 - [Testing](https://hackage.haskell.org/package/HUnit) 
 - [GHC](https://www.haskell.org/ghc/)
 - [Cabal](https://www.haskell.org/cabal/)
 - [Stack](https://docs.haskellstack.org/)
### Disclosure
Beware that after playing a game the 'Database' data (that is stored in two txt files) will **change**, tests are for illustrative purposes mainly and may fail due to 'Database' changes. Tests can be extended and rewritten. Please ignore errors occuring before compilation due to module importing like   `Could not find module ‘GuessTheAnimal’ It is not a module in the current program, or in any known package.`
