module Html.Elements where

  import Html
  import Html.Attributes

  h1 :: [Attribute] -> [VTree] -> VTree
  h1 = vnode "h1"

  h2 :: [Attribute] -> [VTree] -> VTree
  h2 = vnode "h2"

  h3 :: [Attribute] -> [VTree] -> VTree
  h3 = vnode "h3"

  h4 :: [Attribute] -> [VTree] -> VTree
  h4 = vnode "h4"

  h5 :: [Attribute] -> [VTree] -> VTree
  h5 = vnode "h5"

  h6 :: [Attribute] -> [VTree] -> VTree
  h6 = vnode "h6"

  div :: [Attribute] -> [VTree] -> VTree
  div = vnode "div"

  p :: [Attribute] -> [VTree] -> VTree
  p = vnode "p"

  hr :: [Attribute] -> [VTree] -> VTree
  hr = vnode "hr"

  pre :: [Attribute] -> [VTree] -> VTree
  pre = vnode "pre"

  blockquote :: [Attribute] -> [VTree] -> VTree
  blockquote = vnode "blockquote"

  span :: [Attribute] -> [VTree] -> VTree
  span = vnode "span"

  a :: [Attribute] -> [VTree] -> VTree
  a = vnode "a"

  code :: [Attribute] -> [VTree] -> VTree
  code = vnode "code"

  em :: [Attribute] -> [VTree] -> VTree
  em = vnode "em"

  strong :: [Attribute] -> [VTree] -> VTree
  strong = vnode "strong"

  i :: [Attribute] -> [VTree] -> VTree
  i = vnode "i"

  b :: [Attribute] -> [VTree] -> VTree
  b = vnode "b"

  u :: [Attribute] -> [VTree] -> VTree
  u = vnode "u"

  sub :: [Attribute] -> [VTree] -> VTree
  sub = vnode "sub"

  sup :: [Attribute] -> [VTree] -> VTree
  sup = vnode "sup"

  br :: [Attribute] -> [VTree] -> VTree
  br = vnode "br"

  ol :: [Attribute] -> [VTree] -> VTree
  ol = vnode "ol"

  ul :: [Attribute] -> [VTree] -> VTree
  ul = vnode "ul"

  li :: [Attribute] -> [VTree] -> VTree
  li = vnode "li"

  dl :: [Attribute] -> [VTree] -> VTree
  dl = vnode "dl"

  dt :: [Attribute] -> [VTree] -> VTree
  dt = vnode "dt"

  dd :: [Attribute] -> [VTree] -> VTree
  dd = vnode "dd"

  img :: [Attribute] -> [VTree] -> VTree
  img = vnode "img"

  iframe :: [Attribute] -> [VTree] -> VTree
  iframe = vnode "iframe"

  canvas :: [Attribute] -> [VTree] -> VTree
  canvas = vnode "canvas"

  svg :: [Attribute] -> [VTree] -> VTree
  svg = vnode "svg"

  math :: [Attribute] -> [VTree] -> VTree
  math = vnode "math"

  form :: [Attribute] -> [VTree] -> VTree
  form = vnode "form"

  input :: [Attribute] -> [VTree] -> VTree
  input = vnode "input"

  textarea :: [Attribute] -> [VTree] -> VTree
  textarea = vnode "textarea"

  button :: [Attribute] -> [VTree] -> VTree
  button = vnode "button"

  select :: [Attribute] -> [VTree] -> VTree
  select = vnode "select"

  option :: [Attribute] -> [VTree] -> VTree
  option = vnode "option"

  section :: [Attribute] -> [VTree] -> VTree
  section = vnode "section"

  nav :: [Attribute] -> [VTree] -> VTree
  nav = vnode "nav"

  article :: [Attribute] -> [VTree] -> VTree
  article = vnode "article"

  aside :: [Attribute] -> [VTree] -> VTree
  aside = vnode "aside"

  header :: [Attribute] -> [VTree] -> VTree
  header = vnode "header"

  footer :: [Attribute] -> [VTree] -> VTree
  footer = vnode "footer"

  address :: [Attribute] -> [VTree] -> VTree
  address = vnode "address"

  main :: [Attribute] -> [VTree] -> VTree
  main = vnode "main"

  body :: [Attribute] -> [VTree] -> VTree
  body = vnode "body"

  figure :: [Attribute] -> [VTree] -> VTree
  figure = vnode "figure"

  figcaption :: [Attribute] -> [VTree] -> VTree
  figcaption = vnode "figcaption"

  table :: [Attribute] -> [VTree] -> VTree
  table = vnode "table"

  caption :: [Attribute] -> [VTree] -> VTree
  caption = vnode "caption"

  colgroup :: [Attribute] -> [VTree] -> VTree
  colgroup = vnode "colgroup"

  col :: [Attribute] -> [VTree] -> VTree
  col = vnode "col"

  tbody :: [Attribute] -> [VTree] -> VTree
  tbody = vnode "tbody"

  thead :: [Attribute] -> [VTree] -> VTree
  thead = vnode "thead"

  tfoot :: [Attribute] -> [VTree] -> VTree
  tfoot = vnode "tfoot"

  tr :: [Attribute] -> [VTree] -> VTree
  tr = vnode "tr"

  td :: [Attribute] -> [VTree] -> VTree
  td = vnode "td"

  th :: [Attribute] -> [VTree] -> VTree
  th = vnode "th"

  fieldset :: [Attribute] -> [VTree] -> VTree
  fieldset = vnode "fieldset"

  legend :: [Attribute] -> [VTree] -> VTree
  legend = vnode "legend"

  label :: [Attribute] -> [VTree] -> VTree
  label = vnode "label"

  datalist :: [Attribute] -> [VTree] -> VTree
  datalist = vnode "datalist"

  optgroup :: [Attribute] -> [VTree] -> VTree
  optgroup = vnode "optgroup"

  keygen :: [Attribute] -> [VTree] -> VTree
  keygen = vnode "keygen"

  output :: [Attribute] -> [VTree] -> VTree
  output = vnode "output"

  progress :: [Attribute] -> [VTree] -> VTree
  progress = vnode "progress"

  meter :: [Attribute] -> [VTree] -> VTree
  meter = vnode "meter"

  audio :: [Attribute] -> [VTree] -> VTree
  audio = vnode "audio"

  video :: [Attribute] -> [VTree] -> VTree
  video = vnode "video"

  source :: [Attribute] -> [VTree] -> VTree
  source = vnode "source"

  track :: [Attribute] -> [VTree] -> VTree
  track = vnode "track"

  embed :: [Attribute] -> [VTree] -> VTree
  embed = vnode "embed"

  object :: [Attribute] -> [VTree] -> VTree
  object = vnode "object"

  param :: [Attribute] -> [VTree] -> VTree
  param = vnode "param"

  ins :: [Attribute] -> [VTree] -> VTree
  ins = vnode "ins"

  del :: [Attribute] -> [VTree] -> VTree
  del = vnode "del"

  small :: [Attribute] -> [VTree] -> VTree
  small = vnode "small"

  cite :: [Attribute] -> [VTree] -> VTree
  cite = vnode "cite"

  dfn :: [Attribute] -> [VTree] -> VTree
  dfn = vnode "dfn"

  abbr :: [Attribute] -> [VTree] -> VTree
  abbr = vnode "abbr"

  time :: [Attribute] -> [VTree] -> VTree
  time = vnode "time"

  var :: [Attribute] -> [VTree] -> VTree
  var = vnode "var"

  samp :: [Attribute] -> [VTree] -> VTree
  samp = vnode "samp"

  kbd :: [Attribute] -> [VTree] -> VTree
  kbd = vnode "kbd"

  s :: [Attribute] -> [VTree] -> VTree
  s = vnode "s"

  q :: [Attribute] -> [VTree] -> VTree
  q = vnode "q"

  mark :: [Attribute] -> [VTree] -> VTree
  mark = vnode "mark"

  ruby :: [Attribute] -> [VTree] -> VTree
  ruby = vnode "ruby"

  rt :: [Attribute] -> [VTree] -> VTree
  rt = vnode "rt"

  rp :: [Attribute] -> [VTree] -> VTree
  rp = vnode "rp"

  bdi :: [Attribute] -> [VTree] -> VTree
  bdi = vnode "bdi"

  bdo :: [Attribute] -> [VTree] -> VTree
  bdo = vnode "bdo"

  wbr :: [Attribute] -> [VTree] -> VTree
  wbr = vnode "wbr"

  details :: [Attribute] -> [VTree] -> VTree
  details = vnode "details"

  summary :: [Attribute] -> [VTree] -> VTree
  summary = vnode "summary"

  menuitem :: [Attribute] -> [VTree] -> VTree
  menuitem = vnode "menuitem"

  menu :: [Attribute] -> [VTree] -> VTree
  menu = vnode "menu"

