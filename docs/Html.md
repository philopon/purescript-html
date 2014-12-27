# Module Documentation

## Module Html

### Types

    data Html

    type HtmlEff e a = Eff (ref :: Ref, dom :: DOM | e) a

    data VTree :: *


### Values

    createElement :: forall e. VTree -> HtmlEff e Html

    createElementOptions :: forall opts e. {  | opts } -> VTree -> HtmlEff e Html

    getNode :: forall e. Html -> HtmlEff e Node

    patch :: forall e. VTree -> Html -> HtmlEff e Unit

    text :: String -> VTree

    vnode :: String -> [Attribute] -> [VTree] -> VTree



