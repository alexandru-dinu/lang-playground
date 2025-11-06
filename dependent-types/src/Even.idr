module Even

{-
Discussion on "Types representing Even and Odd numbers"
https://groups.google.com/g/idris-lang/c/vJclXpWYM34/m/b7RGWBDGAQAJ
-}

{-
This definition essentially states that `Even x` is valid iff
one can provide a proof that a (k : Nat) exists s.t. `x = k + k`.

For all valid even numbers 2x, `Even 2x` simply needs to be constructed
from `MkEven x`, with the proof `Refl`.
-}
data Even : Nat -> Type where
  MkEven  : (k : Nat)   -> -- seed
            (x = k + k) -> -- proof
            Even x         -- result

zeroEven : Even 0
zeroEven = MkEven 0 Refl

twoEven : Even 2
twoEven = MkEven 1 Refl

{-
threeEven : Even 3
threeEven = MkEven 2 Refl

The definition above will not type-check since the proof `Refl` (x = x)
does not match `3 = 2 + 2`, where x = 3, k = 2.

This means that if one has a proof `Foo` that `3 = 2 + 2`,
then one can use it (here instead of `Refl`) to say that `Even 3` is valid.
That is, the following will type-check:

threeEven : Even 3
threeEven : MkEven 2 Foo
-}
