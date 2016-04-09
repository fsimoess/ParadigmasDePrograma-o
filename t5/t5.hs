import Data.Char

-- Exercicio 1
addSuffix :: String -> [String] -> [String]
addSuffix str lis = [x ++ str | x <- lis]

-- Exercicio 2
countShorts :: [String] -> Int
countShorts [] = 0
countShorts lis = if length(head lis) < 5
    then 1 + countShorts (tail lis)
    else countShorts (tail lis)

-- Exercicio 3
countShorts2 :: [String] -> Int
countShorts2 lis = length [x | x <- lis, (length x) < 5]

-- Exercicio 4
ciclo :: Int -> [Int] -> [Int]
ciclo 0 _ = []
ciclo _ [] = []
ciclo n lis = if n /= 0
    then lis ++ ciclo (n-1) lis
    else []

-- Exercicio 5
numera :: [String] -> [(Int, String)]
numera [] = []
numera lis = auxN 1 lis

auxN :: Int -> [String] -> [(Int, String)]
auxN _ [] = []
auxN n str = (n, (head str)) : auxN (n+1) (tail str)

-- Exercicio 6
--[ (x,y) | x <- [1..5], even x, y <- [(x + 1)..6], odd y ]
--Resposta: Pega os X pares entre 1 e 5 (2 e 4) e os Y ímpares entre x+1 e 6, resultando em [(2,3),(2,5),(4,5)]
--O 4 só faz par com o 5, pois 5 é o único ímpar no intervalo x+1 e 6 (x+1 = 5, nesse caso).

-- [ a ++ b | a <- ["lazy","big"], b <- ["frog", "dog"]]
--Resposta: Concatena as duas listas, e como não há restrições, combina todos os elementos das duas listas, gerando:
--["lazyfrog","lazydog","bigfrog","bigdog"]

--concat [ [a,'-'] | a <- "paralelepipedo", not (elem a "aeiou")]
--Remove as vogais da palavra em "a", e a concatena com o char '-', gerando a string apenas com consoantes, com '-' no lugar das vogais
--p-r-l-l-p-p-d-"

-- Exercicio 7
crossProduct :: [a] -> [b] -> [(a, b)]
crossProduct [] _ = []
crossProduct _ [] = []
crossProduct xs ys = pairWithAll (head xs) ys ++ crossProduct (tail xs) ys

pairWithAll :: a -> [b] -> [(a,b)]
pairWithAll _ [] = []
pairWithAll x ys = (x, (head ys)) : pairWithAll x (tail ys)

-- Exercicio 8
genRects :: Int -> (Int,Int) -> [(Float,Float,Float,Float)]
genRects 0 (_,_) = []
genRects n (a,b) = [((fromIntegral a)+x, fromIntegral b, 5.5, 5.5) | x <- [0.0, 5.5..5.5*(fromIntegral n)]]

-- Exercicio 9
funcA :: [(a,b)] -> ([a],[b])
funcA lis = (aux1 lis, aux2 lis)

aux1 :: [(a,b)] -> [a]
aux1 [] = []
aux1 lis = fst(head lis) : aux1 (tail lis)

aux2 :: [(a,b)] -> [b]
aux2 [] = []
aux2 lis = snd(head lis) : aux2 (tail lis)

-- Exercicio 10
funcB :: [(a,b)] -> ([a],[b])
funcB lis = ([fst x | x <- lis], [snd y | y <- lis])

-- Exercicio 11
funcC :: [(a,b)] -> ([a],[b])
funcC lis = (map fst lis, map snd lis)

-- Exercicio 12
{-
   Programa em Haskell para validar os digitos de um CPF
   Mais info em: http://pt.wikipedia.org/wiki/Cadastro_de_Pessoas_F%C3%ADsicas
-}

isCpfOk :: [Int] -> Bool
isCpfOk cpf =
  let digitos1 = take 9 cpf
      dv1 = auxCPF 10 digitos1
      digitos2 = digitos1 ++ [dv1]
      dv2 = auxCPF 11 digitos2
   in dv1 == cpf !! 9 && dv2 == cpf !! 10

main = do
  let cpf = "12345678909"
      digitos = (map digitToInt cpf)
      result = isCpfOk digitos
  putStrLn (show result)

auxCPF :: Int -> [Int] -> Int
auxCPF n lis = if expr < 2 then 0 else 11-expr
    where expr = mod (sum $ zipWith (*) lis [n, n-1..2]) 11
