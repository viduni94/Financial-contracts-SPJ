{-# LANGUAGE DeriveFunctor, OverloadedStrings, TypeOperators, MultiParamTypeClasses, FlexibleInstances, FlexibleContexts, GADTs #-}
module Language where

data Contract contract
	= Zero
    | One  Currency
    | Give contract
    | Get contract
    | And  contract contract
    | Or   contract contract
    | Scale   (Obs Int) contract
    deriving Show

data Original contract
  	= Truncate Time contract
  	| Then contract contract
  	| Anytime contract
  	deriving Show

data Horizon = Time Time | Infinite deriving (Eq, Ord, Show)

data Currency = GBP | USD | EUR deriving (Eq, Show)