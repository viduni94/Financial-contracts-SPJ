{-# LANGUAGE TypeOperators, GADTs #-}
module Count where

import Language

count :: Contract -> Int

count Zero = 1
count (One _) = 1
count (Give c) = 1 + (count c)
count (Get c) = 1 + (count c)
count (And c1 c2) = 1 + (count c1) + (count c2)
count (Or c1 c2) = 1 + (count c1) + (count c2)