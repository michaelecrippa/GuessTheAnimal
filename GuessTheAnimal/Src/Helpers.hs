module Helpers where
    in' _ [] = False
    in' x (y : ys) = if x == y then True else in' x ys