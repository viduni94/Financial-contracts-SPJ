{-# LANGUAGE TypeOperators, GADTs #-}
module Render where

import Language

render :: Contract -> String

render Zero = "Zero"
render (One currency) = "One(" ++ show currency ++ ")"
render (Give contract) = "Give(" ++ render contract ++ ")"
render (Get contract) = "Get(" ++ render contract ++ ")"
render (And contract1 contract2) = "And(" ++ render contract1 ++ "," ++ render contract2 ++ ")"
render (Or contract1 contract2) = "Or(" ++ render contract1 ++ "," ++ render contract2 ++ ")"