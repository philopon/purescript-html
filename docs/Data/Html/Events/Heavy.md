# Module Documentation

## Module Data.Html.Events.Heavy

### Values

    listenMouseEnter :: forall e. EffHtml e Unit

    listenMouseLeave :: forall e. EffHtml e Unit

    listenMouseMove :: forall e. EffHtml e Unit

    listenMouseOut :: forall e. EffHtml e Unit

    listenMouseOver :: forall e. EffHtml e Unit

    listenTo :: forall e. String -> EffHtml e Unit

    onMouseEnter :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseLeave :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseMove :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseOut :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onMouseOver :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute



