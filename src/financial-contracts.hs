-- import List
import Numeric
import Control.Monad
-- import System
-- import Text.XHtml.Strict
import Data.Unique
import Data.Time

data Currency = USD | GBP | EUR
                deriving (Eq, Show)

data Contract = Zero
                | One  Currency
                | Give Contract
                | Get Contract
                | And  Contract Contract
                | Or   Contract Contract
                | Scale   (Obs Double) Contract
                | ScaleK Double Contract
                | Anytime (Obs Bool)   Contract
                | Then Contract Contract
                | Truncate Date Contract
                | Perhaps Date Contract
                | Konst a
                deriving Show


zero :: Contract
zero = Zero

one :: Currency -> Contract
one = One

give :: Contract -> Contract
give = Give

get :: Contract -> Contract
get = Get

and :: Contract -> Contract -> Contract
and = And

or :: Contract -> Contract -> Contract
or = Or

scale :: Obs Double -> Contract -> Contract
scale = Scale

scaleK :: Double -> Contract -> Contract
scaleK = ScaleK

anytime :: Obs Bool -> Contract -> Contract
anytime = Anytime

then :: Contract -> Contract -> Contract
then = Then

truncate :: Date -> Contract -> Contract
truncate = Truncate


-- Combinators for observables ---
konst :: a -> Obs a
konst = Konst

lift :: (a -> b) -> Obs a -> Obs b
lift = Lift

lift2 :: (a -> b -> c) -> Obs a -> Obs b -> Obs c
lift2 = Lift2


-- Derived primitive -------------
andGive :: Contract -> Contract -> Contract
andGive c d = c `and` give d


-- Packaged combinator -----------
perhaps :: Date -> Contract -> Contract
perhaps = Perhaps



-- Example Contracts -------------
zcb :: Date -> Double -> Currency -> Contract
zcb t x k = scaleK x (get (truncate t (one k)))

european :: Date -> Contract -> Contract
european t u = get (truncate t (u `or` zero))

american :: (Date, Date) -> Contract -> Contract
american (t1, t2) u = get (truncate t1 opt) `then` opt
						where
							opt :: Contract
							opt = anytime (perhaps t2 u)
