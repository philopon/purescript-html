# Module Documentation

## Module Data.Html.Events.Heavy

### Values

    listenMouseEnter :: EffHtml _ Unit

    listenMouseLeave :: EffHtml _ Unit

    listenMouseMove :: EffHtml _ Unit

    listenMouseOut :: EffHtml _ Unit

    listenMouseOver :: EffHtml _ Unit

    listenTo :: String -> EffHtml _ Unit

    onMouseEnter :: (MouseHoverEvent -> Eff _ Unit) -> Attribute

    onMouseLeave :: (MouseHoverEvent -> Eff _ Unit) -> Attribute

    onMouseMove :: (MouseHoverEvent -> Eff _ Unit) -> Attribute

    onMouseOut :: (MouseHoverEvent -> Eff _ Unit) -> Attribute

    onMouseOver :: (MouseHoverEvent -> Eff _ Unit) -> Attribute



