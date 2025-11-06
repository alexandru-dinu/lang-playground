module BoundedNat

{-
BoundedNat(lim) = { x | x in Nat, x <= lim }

similar to `Fin` -- see https://www.hacklewayne.com/fin
-}
data BoundedNat : Nat -> Type where
  MkBoundedNat  : (lim : Nat) ->   -- upper limit
                  (x <= lim)  ->   -- proof TODO: why only (=) for proofs?
                  BoundedNat lim x -- result


-- x : BoundedNat 10 5
-- x = MkBoundedNat 10 (5 <= 10)
