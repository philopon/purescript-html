# Module Documentation

## Module Html

### Types

    data Html

    type HtmlEff e a = Eff (ref :: Ref, dom :: DOM | e) a

    data VTree :: *


### Values

    appendBody :: forall e. Html -> HtmlEff e Unit

    appendSelector :: forall e. String -> Html -> HtmlEff e Unit

    createElement :: forall e. VTree -> HtmlEff e Html

    createElementOptions :: forall opts e. {  | opts } -> VTree -> HtmlEff e Html

    onDOMContentLoaded :: forall e. Eff (dom :: DOM | e) Unit -> Eff (dom :: DOM | e) Unit

    patch :: forall e. VTree -> Html -> HtmlEff e Unit

    text :: String -> VTree

    vnode :: String -> [Attribute] -> [VTree] -> VTree



