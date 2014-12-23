# Module Documentation

## Module Html.Events.Heavy

### Values

    listenMouseEnter :: forall e. HtmlEff e Unit

    listenMouseLeave :: forall e. HtmlEff e Unit

    listenMouseMove :: forall e. HtmlEff e Unit

    listenMouseOut :: forall e. HtmlEff e Unit

    listenMouseOver :: forall e. HtmlEff e Unit

    listenTo :: forall e. String -> HtmlEff e Unit

    onMouseEnter :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseLeave :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseMove :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseOut :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseOver :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute



