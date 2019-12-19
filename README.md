# Haskell Play

Using `ghci` on Ubuntu.

Load modules by `:l module` for module `module.hs`.

## Install
`sudo apt-get install haskell-platform`

## Examples
Lots of examples can be found [here](https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/Simple%20examples).

### Language Syntax
#### Input Output
```
module Main where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

main = do putStrLn "What is 5! ?"
          x <- readLn
          if x == factorial 5
              then putStrLn "You're right!"
              else putStrLn "You're wrong!"
```
#### Multiple Definitions
```
secsToWeeks secs = let perMinute = 60
                       perHour   = 60 * perMinute
                       perDay    = 24 * perHour
                       perWeek   =  7 * perDay
                   in  secs / perWeek
```
#### Case Statement
```
classify age = case age of 0 -> "newborn"
                           1 -> "infant"
                           2 -> "toddler"
                           _ -> "senior citizen"
```
### Parallel
Support for parallel and multicore programming. See file [src/parallel.hs](src/parallel.hs). That program can be compiled and run like the following:
```
ghc -O2 --make src/parallel.hs -threaded -rtsopts

# Run with time complexity
time ./parallel +RTS -N2
```
This allows multiple functions to run in parallel on the same machine. Compare time complexity to sequential version.
### Qsort Comparison
**Haskell**
```
qsort [] = []
qsort (x:xs) = qsort [y | y <- xs, y < x] ++ [x] ++ qsort [y | y <- xs, y >= x]
```

A more efficient version
```
import Data.List (partition)

-- Ord is a class used for ordered datatypes.
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort ys ++ x : qsort zs
  where
    (ys, zs) = partition (< x) xs
```
The partition function takes a predicate a list and returns the pair of lists of elements which do and do not satisfy the predicate, respectively; i.e.,
```
partition p xs == (filter p xs, filter (not . p) xs)
```
An example of this would be
```
>>> partition (`elem` "aeiou") "Hello World!"
("eoo","Hll Wrld!")
```

**Joy**
```
DEFINE qsort ==
  [small]            # termination condition: 0 or 1 element
  []                 # do nothing
  [uncons [>] split] # pivot and two lists
  [enconcat]         # insert the pivot after the recursion
  binrec.            # recursion on the two lists
```


