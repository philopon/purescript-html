# Module Documentation

## Module Data.Html

### Types

    type EffHtml e a = Eff (ref :: Ref, dom :: DOM | e) a

    data Html


### Values

    createElement :: forall e. VTree -> EffHtml e Html

    createElementOptions :: forall opts e. {  | opts } -> VTree -> EffHtml e Html

    getNode :: forall e. Html -> EffHtml e Node

    patch :: forall e. VTree -> Html -> EffHtml e Unit



