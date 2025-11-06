module MyList


data MyList : (len : Nat) -> (elem : Type) -> Type where
    Empty : MyList 0 elem
    Cons  : (x : elem) -> (xs : MyList len elem) -> MyList (S len) elem

Show a => Show (MyList n a) where
    show Empty = "[]"
    show (Cons x xs) = (show x) ++ "::" ++ (show xs)

xs : MyList 3 Int
xs = Cons 1 (Cons 2 (Cons 3 Empty))

ys : MyList 2 Int
ys = Cons 4 (Cons 5 Empty)

myAppend : MyList n a -> MyList m a -> MyList (n + m) a
myAppend Empty ys = ys
myAppend (Cons x xs) ys = Cons x (myAppend xs ys)
