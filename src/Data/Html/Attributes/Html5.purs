module Data.Html.Attributes.Html5 where

-- https://github.com/evancz/elm-html/blob/master/src/Html/Attributes.elm
-- https://github.com/alexmingoia/virtual-dom-stringify/blob/master/dist/virtual-dom-stringify.js#L488-L613

import qualified Data.Html.Attributes as A

type Attribute = A.Attribute

style :: forall styles. {|styles} -> Attribute
style = A.style

abbr :: String -> Attribute
abbr = A.stringAttribute "abbr"

accept :: String -> Attribute
accept = A.stringAttribute "accept"

acceptCharset :: String -> Attribute
acceptCharset = A.stringAttribute "acceptCharset"

accessKey :: String -> Attribute
accessKey = A.stringAttribute "accessKey"

action :: String -> Attribute
action = A.stringAttribute "action"

-- from Elm-html
align :: String -> Attribute
align = A.stringAttribute "align"

allowFullScreen :: Boolean -> Attribute
allowFullScreen = A.booleanAttribute "allowFullScreen"

allowTransparency :: Boolean -> Attribute
allowTransparency = A.booleanAttribute "allowTransparency"

alt :: String -> Attribute
alt = A.stringAttribute "alt"

async :: Boolean -> Attribute
async = A.booleanAttribute "async"

autoComplete :: Boolean -> Attribute
autoComplete = A.booleanAttribute "autoComplete"

autoFocus :: Boolean -> Attribute
autoFocus = A.booleanAttribute "autoFocus"

autoPlay :: Boolean -> Attribute
autoPlay = A.booleanAttribute "autoPlay"

-- from Elm-html
autoSave :: Boolean -> Attribute
autoSave = A.booleanAttribute "autosave"

cellPadding :: String -> Attribute
cellPadding = A.stringAttribute "cellPadding"

cellSpacing :: String -> Attribute
cellSpacing = A.stringAttribute "cellSpacing"

challenge :: String -> Attribute
challenge = A.stringAttribute "challenge"

charset :: String -> Attribute
charset = A.stringAttribute "charset"

checked :: Boolean -> Attribute
checked = A.booleanAttribute "checked"

cite :: String -> Attribute
cite = A.stringAttribute "cite"

class_ :: String -> Attribute
class_ = A.stringAttribute "className"

cols :: Number -> Attribute
cols = A.numberAttribute "cols"

colSpan :: String -> Attribute
colSpan = A.stringAttribute "colSpan"

-- TODO: command?

content :: String -> Attribute
content = A.stringAttribute "content"

contentEditable :: Boolean -> Attribute
contentEditable = A.booleanAttribute "contentEditable"

contextMenu :: String -> Attribute
contextMenu = A.stringAttribute "contextMenu"

controls :: Boolean -> Attribute
controls = A.booleanAttribute "controls"

coords :: String -> Attribute
coords = A.stringAttribute "coords"

crossOrigin :: String -> Attribute
crossOrigin = A.stringAttribute "crossOrigin"

-- TODO: data?

datetime :: String -> Attribute
datetime = A.stringAttribute "datetime"

default :: Boolean -> Attribute
default = A.booleanAttribute "default"

defer :: Boolean -> Attribute
defer = A.booleanAttribute "defer"

dir :: String -> Attribute
dir = A.stringAttribute "dir"

disabled :: Boolean -> Attribute
disabled = A.booleanAttribute "disabled"

download :: Boolean -> Attribute
download = A.booleanAttribute "download"

downloadAs :: String -> Attribute
downloadAs = A.stringAttribute "download"

draggable :: String -> Attribute
draggable = A.stringAttribute "draggable"

dropzone :: String -> Attribute
dropzone = A.stringAttribute "dropzone"

encType :: String -> Attribute
encType = A.stringAttribute "encType"

form :: String -> Attribute
form = A.stringAttribute "form"

formAction :: String -> Attribute
formAction = A.stringAttribute "formAction"

formEncType :: String -> Attribute
formEncType = A.stringAttribute "formEncType"

formMethod :: String -> Attribute
formMethod = A.stringAttribute "formMethod"

formNoValidate :: Boolean -> Attribute
formNoValidate = A.booleanAttribute "formNoValidate"

formTarget :: String -> Attribute
formTarget = A.stringAttribute "formTarget"

headers :: String -> Attribute
headers = A.stringAttribute "headers"

height :: Number -> Attribute
height = A.numberAttribute "height"

hidden :: Boolean -> Attribute
hidden = A.booleanAttribute "hidden"

-- TODO: high?

href :: String -> Attribute
href = A.stringAttribute "href"

hreflang :: String -> Attribute
hreflang = A.stringAttribute "hreflang"

for :: String -> Attribute
for = A.stringAttribute "htmlFor"

httpEquiv :: String -> Attribute
httpEquiv = A.stringAttribute "httpEquiv"

icon :: String -> Attribute
icon = A.stringAttribute "icon"

id_ :: String -> Attribute
id_ = A.stringAttribute "id"

inputMode :: String -> Attribute
inputMode = A.stringAttribute "inputMode"

isMap :: String -> Attribute
isMap = A.stringAttribute "isMap"

itemId :: String -> Attribute
itemId = A.stringAttribute "itemId"

itemProp :: String -> Attribute
itemProp = A.stringAttribute "itemProp"

itemRef :: String -> Attribute
itemRef = A.stringAttribute "itemRef"

itemScope :: String -> Attribute
itemScope = A.stringAttribute "itemScope"

itemType :: String -> Attribute
itemType = A.stringAttribute "itemType"

-- from Elm-html
keytype :: String -> Attribute
keytype = A.stringAttribute "keytype"

kind :: String -> Attribute
kind = A.stringAttribute "kind"

-- TODO: label?

lang :: String -> Attribute
lang = A.stringAttribute "lang"

-- from Elm-html/deprecated
language :: String -> Attribute
language = A.stringAttribute "language"

list :: String -> Attribute
list = A.stringAttribute "list"

loop :: Boolean -> Attribute
loop = A.booleanAttribute "loop"

manifest :: String -> Attribute
manifest = A.stringAttribute "manifest"

max :: String -> Attribute
max = A.stringAttribute "max"

maxLength :: Number -> Attribute
maxLength = A.numberAttribute "maxLength"

media :: String -> Attribute
media = A.stringAttribute "media"

mediaGroup :: String -> Attribute
mediaGroup = A.stringAttribute "mediaGroup"

method :: String -> Attribute
method = A.stringAttribute "method"

min :: String -> Attribute
min = A.stringAttribute "min"

minLength :: Number -> Attribute
minLength = A.numberAttribute "minLength"

multiple :: Boolean -> Attribute
multiple = A.booleanAttribute "multiple"

muted :: Boolean -> Attribute
muted = A.booleanAttribute "muted"

name :: String -> Attribute
name = A.stringAttribute "name"

noValidate :: Boolean -> Attribute
noValidate = A.booleanAttribute "noValidate"

-- TODO: open?

optimum :: Number -> Attribute
optimum = A.numberAttribute "optimum"

pattern :: String -> Attribute
pattern = A.stringAttribute "pattern"

ping :: String -> Attribute
ping = A.stringAttribute "ping"

placeholder :: String -> Attribute
placeholder = A.stringAttribute "placeholder"

-- from Elm-html
pubdate :: String -> Attribute
pubdate = A.stringAttribute "pubdate"

poster :: String -> Attribute
poster = A.stringAttribute "poster"

preload :: Boolean -> Attribute
preload = A.booleanAttribute "preload"

-- TODO: radioGroup?

readOnly :: Boolean -> Attribute
readOnly = A.booleanAttribute "readOnly"

rel :: String -> Attribute
rel = A.stringAttribute "rel"

required :: Boolean -> Attribute
required = A.booleanAttribute "required"

-- from Elm-html
reversed :: Boolean -> Attribute
reversed = A.booleanAttribute "reversed"

role :: String -> Attribute
role = A.stringAttribute "role"

rows :: Number -> Attribute
rows = A.numberAttribute "rows"

rowSpan :: String -> Attribute
rowSpan = A.stringAttribute "rowSpan"

sandbox :: String -> Attribute
sandbox = A.stringAttribute "sandbox"

scope :: String -> Attribute
scope = A.stringAttribute "scope"

scoped :: Boolean -> Attribute
scoped = A.booleanAttribute "scoped"

scrolling :: String -> Attribute
scrolling = A.stringAttribute "scrolling"

seamless :: Boolean -> Attribute
seamless = A.booleanAttribute "seamless"

selected :: Boolean -> Attribute
selected = A.booleanAttribute "selected"

shape :: String -> Attribute
shape = A.stringAttribute "shape"

size :: Number -> Attribute
size = A.numberAttribute "size"

sizes :: String -> Attribute
sizes = A.stringAttribute "sizes"

sortable :: Boolean -> Attribute
sortable = A.booleanAttribute "sortable"

-- TODO: span?

spellCheck :: Boolean -> Attribute
spellCheck = A.booleanAttribute "spellCheck"

src :: String -> Attribute
src = A.stringAttribute "src"

srcDoc :: String -> Attribute
srcDoc = A.stringAttribute "srcDoc"

-- from Elm-html
srcLang :: String -> Attribute
srcLang = A.stringAttribute "srclang"

srcSet :: String -> Attribute
srcSet = A.stringAttribute "srcSet"

start :: Number -> Attribute
start = A.numberAttribute "start"

step :: Number -> Attribute
step = A.numberAttribute "step"

tabIndex :: Number -> Attribute
tabIndex = A.numberAttribute "tabIndex"

target :: String -> Attribute
target = A.stringAttribute "target"

title :: String -> Attribute
title = A.stringAttribute "title"

translate :: String -> Attribute
translate = A.stringAttribute "translate"

type_ :: String -> Attribute
type_ = A.stringAttribute "type"

typeMustMatch :: Boolean -> Attribute
typeMustMatch = A.booleanAttribute "typeMustMatch"

usemap :: String -> Attribute
usemap = A.stringAttribute "usemap"

value :: String -> Attribute
value = A.stringAttribute "value"

width :: Number -> Attribute
width = A.numberAttribute "width"

wmode :: String -> Attribute
wmode = A.stringAttribute "wmode"

wrap :: String -> Attribute
wrap = A.stringAttribute "wrap"
