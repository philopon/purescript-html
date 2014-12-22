module Html.Attributes.Html5 where

  import Html.Attributes

  class_ :: String -> Attribute
  class_ = stringAttribute "className"

  id_ :: String -> Attribute
  id_ = stringAttribute "id"

  title :: String -> Attribute
  title = stringAttribute "title"

  hidden :: Boolean -> Attribute
  hidden = booleanAttribute "hidden"

  type_ :: String -> Attribute
  type_ = stringAttribute "type"

  value :: String -> Attribute
  value = stringAttribute "value"

  checked :: Boolean -> Attribute
  checked = booleanAttribute "checked"

  placeholder :: String -> Attribute
  placeholder = stringAttribute "placeholder"

  selected :: Boolean -> Attribute
  selected = booleanAttribute "selected"

  accept :: String -> Attribute
  accept = stringAttribute "accept"

  acceptCharset :: String -> Attribute
  acceptCharset = stringAttribute "accept-charset"

  action :: String -> Attribute
  action = stringAttribute "action"

  autocomplete :: Boolean -> Attribute
  autocomplete = booleanAttribute "autocomplete"

  autofocus :: Boolean -> Attribute
  autofocus = booleanAttribute "autofocus"

  autosave :: Boolean -> Attribute
  autosave = booleanAttribute "autosave"

  disabled :: Boolean -> Attribute
  disabled = booleanAttribute "disabled"

  enctype :: String -> Attribute
  enctype = stringAttribute "enctype"

  formaction :: String -> Attribute
  formaction = stringAttribute "formaction"

  list :: String -> Attribute
  list = stringAttribute "list"

  maxlength :: Number -> Attribute
  maxlength = numberAttribute "maxlength"

  method :: String -> Attribute
  method = stringAttribute "method"

  multiple :: Boolean -> Attribute
  multiple = booleanAttribute "multiple"

  name :: String -> Attribute
  name = stringAttribute "name"

  novalidate :: Boolean -> Attribute
  novalidate = booleanAttribute "novalidate"

  pattern :: String -> Attribute
  pattern = stringAttribute "pattern"

  readonly :: Boolean -> Attribute
  readonly = booleanAttribute "readonly"
