module DataTypes where
    data CommonUserResponse = Yes | No
    data Tree = Leaf | Node String Tree Tree deriving (Read, Show)