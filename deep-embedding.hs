{-# LANGUAGE DeriveFunctor, OverloadedStrings, TypeOperators, MultiParamTypeClasses, FlexibleInstances, FlexibleContexts, GADTs #-}
module Language where

import Control.Monad.Free

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
  	| Get contract
  	| Anytime contract
  	deriving Show