# Module Documentation

## Module Data.Html.Attributes

#### `Attribute`

``` purescript
data Attribute :: *
```


#### `semigroupAttribute`

``` purescript
instance semigroupAttribute :: Semigroup Attribute
```


#### `stringAttribute`

``` purescript
stringAttribute :: String -> String -> Attribute
```


#### `booleanAttribute`

``` purescript
booleanAttribute :: String -> Boolean -> Attribute
```


#### `numberAttribute`

``` purescript
numberAttribute :: String -> Number -> Attribute
```


#### `style`

``` purescript
style :: forall styles. {  | styles } -> Attribute
```


#### `key`

``` purescript
key :: String -> Attribute
```


#### `namespace`

``` purescript
namespace :: String -> Attribute
```


#### `Event`

``` purescript
data Event :: *
```


#### `on_`

``` purescript
on_ :: forall event e. String -> (Event -> Eff e Unit) -> Attribute
```


#### `ev_`

``` purescript
ev_ :: forall event e. String -> (Event -> Eff e Unit) -> Attribute
```




