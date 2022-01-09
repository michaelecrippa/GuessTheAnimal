module DataTypes where
    data Tree = Leaf String | Node String Tree Tree deriving (Read, Show)