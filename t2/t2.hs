somaQuad :: Int -> Int -> Int
somaQuad x y = (x^2) + (y^2)

hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads lis1 lis2 = if head lis1 == head lis2 then True else False

srName :: [String] -> [String]
srName lis = map ("Sr. " ++) lis

numberSpace :: [Char] -> Int
numberSpace lis = length (filter (==' ') lis)

calcLista :: [Float] -> [Float]
calcLista lis = map ((\n -> 3*n^2 + 2/n + 1)) lis

numberNeg :: [Int] -> [Int]
numberNeg lis = filter(< 0) lis

numberEntre :: [Int] -> [Int]
numberEntre lis = filter ((\x -> x>0 && x<101)) lis

testeIdade :: [Int] -> [Int]
testeIdade lis = filter ((\x -> 1970 <= 2016-x)) lis

numberPar :: [Int] -> [Int]
numberPar lis = filter (even) lis

charFound :: Char -> String -> Bool
charFound _ "" = False
charFound x y = if x == (head y) then True else charFound x (tail y)

--takeWhile (even) [2, 4, 6, 8, 10, 11]

lastChar :: [String] -> [String]
lastChar lis = filter ((\x -> last x == 'a')) lis
