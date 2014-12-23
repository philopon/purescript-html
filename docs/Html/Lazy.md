# Module Documentation

## Module Html.Lazy

### Types

    type A2 a b = { b :: b, a :: a }

    type A3 a b c = { c :: c, b :: b, a :: a }


### Values

    partial1 :: forall a. (a -> a -> Boolean) -> (a -> VTree) -> a -> VTree

    partial2 :: forall a b. (A2 a b -> A2 a b -> Boolean) -> (a -> b -> VTree) -> a -> b -> VTree

    partial3 :: forall a b c. (A3 a b c -> A3 a b c -> Boolean) -> (a -> b -> c -> VTree) -> a -> b -> c -> VTree

    thunk1 :: forall a. (a -> VTree) -> a -> VTree

    thunk2 :: forall a b. (a -> b -> VTree) -> a -> b -> VTree

    thunk3 :: forall a b c. (a -> b -> c -> VTree) -> a -> b -> c -> VTree

    thunk4 :: forall a b c d. (a -> b -> c -> d -> VTree) -> a -> b -> c -> d -> VTree

    thunk5 :: forall a b c d e. (a -> b -> c -> d -> e -> VTree) -> a -> b -> c -> d -> e -> VTree



