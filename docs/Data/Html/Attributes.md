# Module Documentation

## Module Data.Html.Attributes

### Types


    newtype Attribute


    data Event :: *


### Type Class Instances


    instance semigroupAttribute :: Semigroup Attribute


### Values


    booleanAttribute :: String -> Boolean -> Attribute


    key :: String -> Attribute


    namespace :: String -> Attribute


    numberAttribute :: String -> Number -> Attribute


    on_ :: forall event e. String -> (Event -> Eff e Unit) -> Attribute


    stringAttribute :: String -> String -> Attribute


    style :: forall styles. {  | styles } -> Attribute



