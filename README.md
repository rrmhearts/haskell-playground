# Haskell Play

Using `ghci` on Ubuntu.

Load modules by `:l module` for module `module.hs`.

## Install
`sudo apt-get install haskell-platform`

## Examples
Lots of examples can be found [here](https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/Simple%20examples).

## Qsort Comparison
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


