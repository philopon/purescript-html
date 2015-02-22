# Module Documentation

## Module Data.Html.Lazy

#### `Compare`

``` purescript
type Compare a = a -> a -> Boolean
```


#### `partial1`

``` purescript
partial1 :: forall a. Compare a -> (a -> VTree) -> a -> VTree
```


#### `thunk1`

``` purescript
thunk1 :: forall a. (Eq a) => (a -> VTree) -> a -> VTree
```


#### `A2`

``` purescript
type A2 a b = { _1 :: b, _0 :: a }
```


#### `partial2`

``` purescript
partial2 :: forall a b. Compare (A2 a b) -> (a -> b -> VTree) -> a -> b -> VTree
```


#### `thunk2`

``` purescript
thunk2 :: forall a b. (Eq a, Eq b) => (a -> b -> VTree) -> a -> b -> VTree
```


#### `A3`

``` purescript
type A3 a b c = { _2 :: c, _1 :: b, _0 :: a }
```


#### `partial3`

``` purescript
partial3 :: forall a b c. Compare (A3 a b c) -> (a -> b -> c -> VTree) -> a -> b -> c -> VTree
```


#### `thunk3`

``` purescript
thunk3 :: forall a b c. (Eq a, Eq b, Eq c) => (a -> b -> c -> VTree) -> a -> b -> c -> VTree
```




