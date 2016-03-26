-- Ex. 1
eleva2 :: [Int] -> [Int]
eleva2 [] = []
eleva2 lis = (head lis)^2 : eleva2 (tail lis)

-- Ex. 2
srName :: [String] -> [String]
srName [] = []
srName lis = ("Sr. " ++ (head lis)) : srName (tail lis)

-- Ex. 3
numberSpace :: String -> Int
numberSpace [] = 0
numberSpace lis = if head lis == ' '
    then 1 + numberSpace (tail lis)
    else numberSpace (tail lis)

-- Ex. 4
calcLista :: [Float] -> [Float]
calcLista [] = []
calcLista lis = ((\n -> 3*n^2 + 2/n + 1)) (head lis) : calcLista (tail lis)

-- Ex. 5
numberNeg :: [Int] -> [Int]
numberNeg [] = []
numberNeg lis = if head lis < 0
    then (head lis) : numberNeg (tail lis)
    else numberNeg (tail lis)

-- Ex. 6
semVogais :: String -> String
semVogais lis = [x | x <- lis, not (elem x "aeiouAEIOU")]

-- Ex. 7
tiraVogais :: String -> String
tiraVogais [] = []
tiraVogais lis = if (elem (head lis) "aeiouAEIOU")
    then tiraVogais (tail lis)
    else (head lis) : tiraVogais (tail lis)

-- Ex. 8
codifica :: String -> String
codifica lis = map (\c -> if c/=' ' then '-'; else c) lis

-- Ex. 9
codificaRec :: String -> String
codificaRec [] = []
codificaRec lis = if head lis == ' '
    then (head lis) : codificaRec (tail lis)
    else '-' : codificaRec (tail lis)

-- Ex. 10
charFound :: Char -> String -> Bool
charFound _ "" = False
charFound x lis = if x == head lis
    then True
    else charFound x (tail lis)

-- Ex. 11
translate :: [(Float, Float)] -> [(Float, Float)]
translate [] = []
translate lis = ((fst (head lis) + 2.0), (snd (head lis) + 2.0)) : translate (tail lis)

-- Ex. 12
prodVet :: [Int] -> [Int] -> [Int]
prodVet [] [] = []
prodVet lis1 lis2
     | null (lis1) || null (lis2) = []
     | otherwise = ((head lis1) * (head lis2)) : prodVet (tail lis1) (tail lis2)

-- Ex. 13
prodVet2 :: [Int] -> [Int] -> [Int]
prodVet2 lis1 lis2 = zipWith (*) lis1 lis2

-- Ex. 14
geraTabela :: Int -> [(Int, Int)]
geraTabela 0 = []
geraTabela x = aux 1 x

aux :: Int -> Int -> [(Int, Int)]
aux 0 n = []
aux e n = if (e <= n)
    then (e, e^2) : aux (e+1) n
    else []
