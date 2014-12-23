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

  required :: Boolean -> Attribute
  required = booleanAttribute "required"

  size :: Number -> Attribute
  size = numberAttribute "size"

  for :: String -> Attribute
  for = stringAttribute "for"

  form :: String -> Attribute
  form = stringAttribute "form"

  max :: String -> Attribute
  max = stringAttribute "max"

  min :: String -> Attribute
  min = stringAttribute "min"

  step :: Number -> Attribute
  step = numberAttribute "step"

  cols :: Number -> Attribute
  cols = numberAttribute "cols"

  rows :: Number -> Attribute
  rows = numberAttribute "rows"

  wrap :: String -> Attribute
  wrap = stringAttribute "wrap"

  href :: String -> Attribute
  href = stringAttribute "href"

  target :: String -> Attribute
  target = stringAttribute "target"

  download :: Boolean -> Attribute
  download = booleanAttribute "download"

  downloadAs :: String -> Attribute
  downloadAs = stringAttribute "downloadAs"

  hreflang :: String -> Attribute
  hreflang = stringAttribute "hreflang"

  media :: String -> Attribute
  media = stringAttribute "media"

  ping :: String -> Attribute
  ping = stringAttribute "ping"

  rel :: String -> Attribute
  rel = stringAttribute "rel"

  ismap :: String -> Attribute
  ismap = stringAttribute "ismap"

  usemap :: String -> Attribute
  usemap = stringAttribute "usemap"

  shape :: String -> Attribute
  shape = stringAttribute "shape"

  coords :: String -> Attribute
  coords = stringAttribute "coords"

  src :: String -> Attribute
  src = stringAttribute "src"

  height :: Number -> Attribute
  height = numberAttribute "height"

  width :: Number -> Attribute
  width = numberAttribute "width"

  alt :: String -> Attribute
  alt = stringAttribute "alt"

  autoplay :: Boolean -> Attribute
  autoplay = booleanAttribute "autoplay"

  controls :: Boolean -> Attribute
  controls = booleanAttribute "controls"

  loop :: Boolean -> Attribute
  loop = booleanAttribute "loop"

  preload :: Boolean -> Attribute
  preload = booleanAttribute "preload"

  poster :: String -> Attribute
  poster = stringAttribute "poster"

  default :: Boolean -> Attribute
  default = booleanAttribute "default"

  kind :: String -> Attribute
  kind = stringAttribute "kind"

  srclang :: String -> Attribute
  srclang = stringAttribute "srclang"

  sandbox :: String -> Attribute
  sandbox = stringAttribute "sandbox"

  seamless :: Boolean -> Attribute
  seamless = booleanAttribute "seamless"

  srcdoc :: String -> Attribute
  srcdoc = stringAttribute "srcdoc"

  reversed :: Boolean -> Attribute
  reversed = booleanAttribute "reversed"

  start :: Number -> Attribute
  start = numberAttribute "start"

  align :: String -> Attribute
  align = stringAttribute "align"

  colspan :: String -> Attribute
  colspan = stringAttribute "colspan"

  rowspan :: String -> Attribute
  rowspan = stringAttribute "rowspan"

  headers :: String -> Attribute
  headers = stringAttribute "headers"

  scope :: String -> Attribute
  scope = stringAttribute "scope"

  async :: Boolean -> Attribute
  async = booleanAttribute "async"

  charset :: String -> Attribute
  charset = stringAttribute "charset"

  content :: String -> Attribute
  content = stringAttribute "content"

  defer :: Boolean -> Attribute
  defer = booleanAttribute "defer"

  httpEquiv :: String -> Attribute
  httpEquiv = stringAttribute "http-equiv"

  language :: String -> Attribute
  language = stringAttribute "language"

  scoped :: Boolean -> Attribute
  scoped = booleanAttribute "scoped"

  accesskey :: String -> Attribute
  accesskey = stringAttribute "accesskey"

  contenteditable :: Boolean -> Attribute
  contenteditable = booleanAttribute "contenteditable"

  contextmenu :: String -> Attribute
  contextmenu = stringAttribute "contextmenu"

  dir :: String -> Attribute
  dir = stringAttribute "dir"

  draggable :: String -> Attribute
  draggable = stringAttribute "draggable"

  dropzone :: String -> Attribute
  dropzone = stringAttribute "dropzone"

  itemporp :: String -> Attribute
  itemporp = stringAttribute "itemporp"

  lang :: String -> Attribute
  lang = stringAttribute "lang"

  spellcheck :: Boolean -> Attribute
  spellcheck = booleanAttribute "spellcheck"

  tabindex :: Number -> Attribute
  tabindex = numberAttribute "tabindex"

  challenge :: String -> Attribute
  challenge = stringAttribute "challenge"

  keytype :: String -> Attribute
  keytype = stringAttribute "keytype"

  cite :: String -> Attribute
  cite = stringAttribute "cite"

  datetime :: String -> Attribute
  datetime = stringAttribute "datetime"

  pubdate :: String -> Attribute
  pubdate = stringAttribute "pubdate"

  manifest :: String -> Attribute
  manifest = stringAttribute "manifest"
