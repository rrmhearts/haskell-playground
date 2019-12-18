-- Can compile with `ghc example.hs`

-- All executables must contain a Main module
module Main where

-- New Datatype.   = EndlessList a (EndlessList a)
data EndlessList a = Cons a (EndlessList a)
--                   cons arg1 arg2

-- Function define TYPE 
repeatForever :: a -> EndlessList a
-- How to compute function. Infinitely recursive!
repeatForever x = Cons x (repeatForever x)
-- Lazy evaluation allows this to repeat forever without crashing.

-- Define TYPE
genSequence :: a -> (a -> a) -> EndlessList a
-- Function init and next are of type a! trans is function a->a
genSequence init trans = Cons init (genSequence next trans)
--          par1 par2    cons first recusion
    where next = trans init
-- part of definition^ next becomes init+1..

-- TYPE statement, "is a" EndlessList of Integers
naturalNumbers :: EndlessList Integer
-- Calling genSequence
naturalNumbers = genSequence 0 succ

-- Complicated TYPE w/ "Monad"           input/output action which results in value of type b
printAllOf :: Show a => EndlessList a -> IO b
printAllOf (Cons a b) = putStrLn (show a) >> printAllOf b
-- foo >> bar ==> "do foo and discard result, then do bar"
-- putStrLn is IO action that prints String\n (console.log or println)

-- Required for executables, main has IO type
main :: IO ()
main = printAllOf naturalNumbers
