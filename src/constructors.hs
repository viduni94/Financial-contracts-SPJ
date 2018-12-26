zcb :: Date -> Double -> Currency -> Contract
zcb t x k = scaleK x (get (truncate t (one k)))

zcb' :: Date -> Double -> Currency -> Contract
zcb' t x k = Scale (Const x) (Get (Truncate t (One k)))

scaleK x c = Scale (Const x) c
get c = Get c
truncate t c = Truncate t c
one k = One k