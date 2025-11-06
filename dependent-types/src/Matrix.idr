module Matrix

import Data.Vect

Matrix : Nat -> Nat -> Type -> Type
Matrix n m t = Vect n (Vect m t)


mat : Matrix 2 3 Int
mat = [ [0, 1, 2]
      , [3, 4, 5]
      ]

-- apply `f` elementwise: Cij = f(Aij, Bij)
elementwise : (t -> t -> t) -> -- f
              Matrix n m t  -> -- A
              Matrix n m t  -> -- B
              Matrix n m t     -- C
elementwise f = zipWith (zipWith f)

-- example of matrix addition closure
myAdd : (Num t) => Matrix n m t -> Matrix n m t -> Matrix n m t
myAdd = elementwise (+)


myTranspose : Matrix n m t -> Matrix m n t
myTranspose [] = replicate _ []
myTranspose (r :: rs) = zipWith (::) r (myTranspose rs)


dotProduct : (Num t) => Vect n t -> Vect n t -> t
dotProduct x y = sum (zipWith (*) x y)

-- Cij = sum_k Aik * Bkj = dot Ai B'j
-- Ci  = map (dot Ai) B'
myMul : (Num t) =>
        Matrix n m t ->
        Matrix m p t ->
        Matrix n p t
myMul [] _ = []
myMul (x :: xs) ys = let ys' = myTranspose ys in
                     map (dotProduct x) ys' :: myMul xs ys
