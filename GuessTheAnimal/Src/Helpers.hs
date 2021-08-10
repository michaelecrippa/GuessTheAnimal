module Helpers where
    import DataTypes ( Tree(Leaf, Node) )
    
    in' :: Eq t => t -> [t] -> Bool
    in' _ [] = False
    in' x (y : ys) = if x == y then True else in' x ys

    print :: DataTypes.Tree -> String
    print (DataTypes.Leaf animal) = animal
    print (DataTypes.Node n _ _) = n 