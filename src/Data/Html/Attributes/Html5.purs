module Data.Html.Attributes.Html5 where

import qualified Data.Html.Attributes as A

type Attribute = A.Attribute

style :: forall styles. {|styles} -> Attribute
style = A.style

class_ :: String -> Attribute
class_ = A.stringAttribute "className"

id_ :: String -> Attribute
id_ = A.stringAttribute "id"

title :: String -> Attribute
title = A.stringAttribute "title"

hidden :: Boolean -> Attribute
hidden = A.booleanAttribute "hidden"

type_ :: String -> Attribute
type_ = A.stringAttribute "type"

value :: String -> Attribute
value = A.stringAttribute "value"

checked :: Boolean -> Attribute
checked = A.booleanAttribute "checked"

placeholder :: String -> Attribute
placeholder = A.stringAttribute "placeholder"

selected :: Boolean -> Attribute
selected = A.booleanAttribute "selected"

accept :: String -> Attribute
accept = A.stringAttribute "accept"

acceptCharset :: String -> Attribute
acceptCharset = A.stringAttribute "accept-charset"

action :: String -> Attribute
action = A.stringAttribute "action"

autocomplete :: Boolean -> Attribute
autocomplete = A.booleanAttribute "autocomplete"

autofocus :: Boolean -> Attribute
autofocus = A.booleanAttribute "autofocus"

autosave :: Boolean -> Attribute
autosave = A.booleanAttribute "autosave"

disabled :: Boolean -> Attribute
disabled = A.booleanAttribute "disabled"

enctype :: String -> Attribute
enctype = A.stringAttribute "enctype"

formaction :: String -> Attribute
formaction = A.stringAttribute "formaction"

list :: String -> Attribute
list = A.stringAttribute "list"

maxlength :: Number -> Attribute
maxlength = A.numberAttribute "maxlength"

method :: String -> Attribute
method = A.stringAttribute "method"

multiple :: Boolean -> Attribute
multiple = A.booleanAttribute "multiple"

name :: String -> Attribute
name = A.stringAttribute "name"

novalidate :: Boolean -> Attribute
novalidate = A.booleanAttribute "novalidate"

pattern :: String -> Attribute
pattern = A.stringAttribute "pattern"

readonly :: Boolean -> Attribute
readonly = A.booleanAttribute "readonly"

required :: Boolean -> Attribute
required = A.booleanAttribute "required"

size :: Number -> Attribute
size = A.numberAttribute "size"

for :: String -> Attribute
for = A.stringAttribute "for"

form :: String -> Attribute
form = A.stringAttribute "form"

max :: String -> Attribute
max = A.stringAttribute "max"

min :: String -> Attribute
min = A.stringAttribute "min"

step :: Number -> Attribute
step = A.numberAttribute "step"

cols :: Number -> Attribute
cols = A.numberAttribute "cols"

rows :: Number -> Attribute
rows = A.numberAttribute "rows"

wrap :: String -> Attribute
wrap = A.stringAttribute "wrap"

href :: String -> Attribute
href = A.stringAttribute "href"

target :: String -> Attribute
target = A.stringAttribute "target"

download :: Boolean -> Attribute
download = A.booleanAttribute "download"

downloadAs :: String -> Attribute
downloadAs = A.stringAttribute "downloadAs"

hreflang :: String -> Attribute
hreflang = A.stringAttribute "hreflang"

media :: String -> Attribute
media = A.stringAttribute "media"

ping :: String -> Attribute
ping = A.stringAttribute "ping"

rel :: String -> Attribute
rel = A.stringAttribute "rel"

ismap :: String -> Attribute
ismap = A.stringAttribute "ismap"

usemap :: String -> Attribute
usemap = A.stringAttribute "usemap"

shape :: String -> Attribute
shape = A.stringAttribute "shape"

coords :: String -> Attribute
coords = A.stringAttribute "coords"

src :: String -> Attribute
src = A.stringAttribute "src"

height :: Number -> Attribute
height = A.numberAttribute "height"

width :: Number -> Attribute
width = A.numberAttribute "width"

alt :: String -> Attribute
alt = A.stringAttribute "alt"

autoplay :: Boolean -> Attribute
autoplay = A.booleanAttribute "autoplay"

controls :: Boolean -> Attribute
controls = A.booleanAttribute "controls"

loop :: Boolean -> Attribute
loop = A.booleanAttribute "loop"

preload :: Boolean -> Attribute
preload = A.booleanAttribute "preload"

poster :: String -> Attribute
poster = A.stringAttribute "poster"

default :: Boolean -> Attribute
default = A.booleanAttribute "default"

kind :: String -> Attribute
kind = A.stringAttribute "kind"

srclang :: String -> Attribute
srclang = A.stringAttribute "srclang"

sandbox :: String -> Attribute
sandbox = A.stringAttribute "sandbox"

seamless :: Boolean -> Attribute
seamless = A.booleanAttribute "seamless"

srcdoc :: String -> Attribute
srcdoc = A.stringAttribute "srcdoc"

reversed :: Boolean -> Attribute
reversed = A.booleanAttribute "reversed"

start :: Number -> Attribute
start = A.numberAttribute "start"

align :: String -> Attribute
align = A.stringAttribute "align"

colspan :: String -> Attribute
colspan = A.stringAttribute "colspan"

rowspan :: String -> Attribute
rowspan = A.stringAttribute "rowspan"

headers :: String -> Attribute
headers = A.stringAttribute "headers"

scope :: String -> Attribute
scope = A.stringAttribute "scope"

async :: Boolean -> Attribute
async = A.booleanAttribute "async"

charset :: String -> Attribute
charset = A.stringAttribute "charset"

content :: String -> Attribute
content = A.stringAttribute "content"

defer :: Boolean -> Attribute
defer = A.booleanAttribute "defer"

httpEquiv :: String -> Attribute
httpEquiv = A.stringAttribute "http-equiv"

language :: String -> Attribute
language = A.stringAttribute "language"

scoped :: Boolean -> Attribute
scoped = A.booleanAttribute "scoped"

accesskey :: String -> Attribute
accesskey = A.stringAttribute "accesskey"

contenteditable :: Boolean -> Attribute
contenteditable = A.booleanAttribute "contenteditable"

contextmenu :: String -> Attribute
contextmenu = A.stringAttribute "contextmenu"

dir :: String -> Attribute
dir = A.stringAttribute "dir"

draggable :: String -> Attribute
draggable = A.stringAttribute "draggable"

dropzone :: String -> Attribute
dropzone = A.stringAttribute "dropzone"

itemporp :: String -> Attribute
itemporp = A.stringAttribute "itemporp"

lang :: String -> Attribute
lang = A.stringAttribute "lang"

spellcheck :: Boolean -> Attribute
spellcheck = A.booleanAttribute "spellcheck"

tabindex :: Number -> Attribute
tabindex = A.numberAttribute "tabindex"

challenge :: String -> Attribute
challenge = A.stringAttribute "challenge"

keytype :: String -> Attribute
keytype = A.stringAttribute "keytype"

cite :: String -> Attribute
cite = A.stringAttribute "cite"

datetime :: String -> Attribute
datetime = A.stringAttribute "datetime"

pubdate :: String -> Attribute
pubdate = A.stringAttribute "pubdate"

manifest :: String -> Attribute
manifest = A.stringAttribute "manifest"
