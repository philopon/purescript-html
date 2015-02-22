# Module Documentation

## Module Data.Html.Events

#### `KeyEvent`

``` purescript
type KeyEvent = I.KeyEvent
```


#### `MouseButtonEvent`

``` purescript
type MouseButtonEvent = I.MouseButtonEvent
```


#### `MouseHoverEvent`

``` purescript
type MouseHoverEvent = I.MouseHoverEvent
```


#### `EventLike`

``` purescript
class EventLike e where
```


#### `eventLikeEvent`

``` purescript
instance eventLikeEvent :: EventLike Event
```


#### `eventLikeKeyEvent`

``` purescript
instance eventLikeKeyEvent :: EventLike I.KeyEvent
```


#### `eventLikeMouseButtonEvent`

``` purescript
instance eventLikeMouseButtonEvent :: EventLike I.MouseButtonEvent
```


#### `eventLikeMouseHoverEvent`

``` purescript
instance eventLikeMouseHoverEvent :: EventLike I.MouseHoverEvent
```


#### `targetValue`

``` purescript
targetValue :: forall ev. (EventLike ev) => ev -> String
```


#### `targetChecked`

``` purescript
targetChecked :: forall ev. (EventLike ev) => ev -> Boolean
```


#### `Position`

``` purescript
type Position = { y :: Number, x :: Number }
```


#### `Button`

``` purescript
data Button
  = Left 
  | Middle 
  | Right 
```


#### `showKeyEvent`

``` purescript
instance showKeyEvent :: Show I.KeyEvent
```


#### `showButton`

``` purescript
instance showButton :: Show Button
```


#### `showMouseButtonEvent`

``` purescript
instance showMouseButtonEvent :: Show I.MouseButtonEvent
```


#### `showMouseHoverEvent`

``` purescript
instance showMouseHoverEvent :: Show I.MouseHoverEvent
```


#### `HasModifier`

``` purescript
class HasModifier a where
  altKey :: a -> Boolean
  ctrlKey :: a -> Boolean
  metaKey :: a -> Boolean
  shiftKey :: a -> Boolean
```


#### `keyEventHasModifier`

``` purescript
instance keyEventHasModifier :: HasModifier I.KeyEvent
```


#### `mouseButtonEventHasModifier`

``` purescript
instance mouseButtonEventHasModifier :: HasModifier I.MouseButtonEvent
```


#### `mouseHoverEventHasModifier`

``` purescript
instance mouseHoverEventHasModifier :: HasModifier I.MouseHoverEvent
```


#### `keyCode`

``` purescript
keyCode :: KeyEvent -> Number
```


#### `button`

``` purescript
button :: MouseButtonEvent -> Button
```


#### `HasPosition`

``` purescript
class HasPosition a where
  client :: a -> Position
  page :: a -> Position
  screen :: a -> Position
```


#### `mouseButtonHasPosition`

``` purescript
instance mouseButtonHasPosition :: HasPosition I.MouseButtonEvent
```


#### `mouseHoverHasPosition`

``` purescript
instance mouseHoverHasPosition :: HasPosition I.MouseHoverEvent
```




