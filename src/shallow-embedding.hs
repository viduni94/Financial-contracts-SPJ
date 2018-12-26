type Contract = String

truncate :: Date -> Contract -> Contract
truncate d c = "Truncate(" ++ show d ++ "," ++ c ++ ")"

type Contract = Int

truncate :: Date -> Contract -> Contract

truncate _ c = 1 + c

and :: Contract -> Contract -> Contract
and c1 c2 = 1 + c1 + c2

type Contract = (String, Int)

truncate :: Date -> Contract -> Contract
truncate d c = ("Truncate(" ++ show d ++ "," ++ c ++ ")", 1 + c)