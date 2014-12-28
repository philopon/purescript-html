# Module Documentation

## Module Data.Html

### Types

    data Html

    type HtmlEff e a = Eff (ref :: Ref, dom :: DOM | e) a


### Values

    createElement :: forall e. VTree -> HtmlEff e Html

    createElementOptions :: forall opts e. {  | opts } -> VTree -> HtmlEff e Html

    getNode :: forall e. Html -> HtmlEff e Node

    patch :: forall e. VTree -> Html -> HtmlEff e Unit



