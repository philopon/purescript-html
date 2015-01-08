# Module Documentation

## Module Data.Html

### Types

    type EffHtml e a = Eff (dom :: DOM | e) a

    data Html :: *

    type VTree = E.VTree


### Values

    createElement :: VTree -> EffHtml _ Html

    createElementOptions :: forall opts. {  | opts } -> VTree -> EffHtml _ Html

    getNode :: forall e. Html -> EffHtml e Node

    patch :: VTree -> Html -> EffHtml _ Unit



