{-# OPTIONS_GHC -F -pgmF htfpp #-}

module Main where

import Test.Framework
import Test.Framework.TestManager

import {-@ HTF_TESTS @-} Tests.Assign

main :: IO()
main = htfMain htf_importedTests
