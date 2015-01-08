# Module Documentation

## Module Data.Html.Lazy

### Types

    type A2 a b = { _1 :: b, _0 :: a }

    type A3 a b c = { _2 :: c, _1 :: b, _0 :: a }


### Values

    partial1 :: forall a. (a -> a -> Boolean) -> (a -> VTree) -> a -> VTree

    partial2 :: forall a b. (A2 a b -> A2 a b -> Boolean) -> (a -> b -> VTree) -> a -> b -> VTree

    partial3 :: forall a b c. (A3 a b c -> A3 a b c -> Boolean) -> (a -> b -> c -> VTree) -> a -> b -> c -> VTree

    thunk1 :: forall a. (Eq a) => (a -> VTree) -> a -> VTree

    thunk2 :: forall a b. (Eq a, Eq b) => (a -> b -> VTree) -> a -> b -> VTree

    thunk3 :: forall a b c. (Eq a, Eq b, Eq c) => (a -> b -> c -> VTree) -> a -> b -> c -> VTree



