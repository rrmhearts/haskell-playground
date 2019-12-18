doubleMe x = x+x
doubleUs x y = x*2 + y*2

doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2  

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  

appendLists x y = x ++ y

setComp y = [x*2 | x <- [1..y]]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   
-- ["BOOM!","BOOM!","BANG!","BANG!"]   

-- Own version of length
length' xs = sum [1 | _ <- xs]   

-- Remove all lowercase letters.
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]   

-- Factorial
factorial n = product [1..n]
