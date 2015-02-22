# Module Documentation

## Module Data.Html

#### `EffHtml`

``` purescript
type EffHtml e a = Eff (dom :: DOM | e) a
```


#### `VTree`

``` purescript
type VTree = E.VTree
```


#### `Html`

``` purescript
data Html :: *
```


#### `createElement`

``` purescript
createElement :: VTree -> EffHtml _ Html
```


#### `createElementOptions`

``` purescript
createElementOptions :: forall opts. {  | opts } -> VTree -> EffHtml _ Html
```


#### `getNode`

``` purescript
getNode :: forall e. Html -> EffHtml e Node
```


#### `patch`

``` purescript
patch :: VTree -> Html -> EffHtml _ Unit
```




