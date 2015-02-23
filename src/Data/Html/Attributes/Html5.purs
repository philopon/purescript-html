module Data.Html.Attributes.Html5 where

import qualified Data.Html.Attributes as A

type Attribute = A.Attribute

style :: forall styles. {|styles} -> Attribute
style = A.style

innerHTML :: String -> Attribute
innerHTML = A.stringAttribute "innerHTML"

-- global attributes http://www.w3schools.com/tags/ref_standardattributes.asp
accessKey :: String -> Attribute
accessKey = A.stringAttribute "accessKey"

class_ :: String -> Attribute
class_ = A.stringAttribute "className"

contentEditable :: Boolean -> Attribute
contentEditable = A.booleanAttribute "contentEditable"

dir :: String -> Attribute
dir = A.stringAttribute "dir"

draggable :: String -> Attribute
draggable = A.stringAttribute "draggable"

-- TODO: dropzone

hidden :: Boolean -> Attribute
hidden = A.booleanAttribute "hidden"

id_ :: String -> Attribute
id_ = A.stringAttribute "id"

lang :: String -> Attribute
lang = A.stringAttribute "lang"

spellcheck :: Boolean -> Attribute
spellcheck = A.booleanAttribute "spellcheck"

tabIndex :: Number -> Attribute
tabIndex = A.numberAttribute "tabIndex"

title :: String -> Attribute
title = A.stringAttribute "title"

-- TODO: translate

-- a attributes http://www.w3schools.com/tags/tag_a.asp
download :: Boolean -> Attribute
download = A.booleanAttribute "download"

downloadAs :: String -> Attribute
downloadAs = A.stringAttribute "download"

href :: String -> Attribute
href = A.stringAttribute "href"

hreflang :: String -> Attribute
hreflang = A.stringAttribute "hreflang"

media :: String -> Attribute
media = A.stringAttribute "media"

rel :: String -> Attribute
rel = A.stringAttribute "rel"

target :: String -> Attribute
target = A.stringAttribute "target"

type_ :: String -> Attribute
type_ = A.stringAttribute "type"

-- area attributes http://www.w3schools.com/tags/tag_area.asp
alt :: String -> Attribute
alt = A.stringAttribute "alt"

coords :: String -> Attribute
coords = A.stringAttribute "coords"

-- download, href, hreflang, media, rel

shape :: String -> Attribute
shape = A.stringAttribute "shape"

-- target, type

-- audio attribute http://www.w3schools.com/tags/tag_audio.asp
autoplay :: Boolean -> Attribute
autoplay = A.booleanAttribute "autoplay"

controls :: Boolean -> Attribute
controls = A.booleanAttribute "controls"

loop :: Boolean -> Attribute
loop = A.booleanAttribute "loop"

muted :: Boolean -> Attribute
muted = A.booleanAttribute "muted"

preload :: String -> Attribute
preload = A.stringAttribute "preload"

src :: String -> Attribute
src = A.stringAttribute "src"

-- base attributes: href, target
-- bdo attributes: dir

-- blockquote attributes http://www.w3schools.com/tags/tag_blockquote.asp
cite :: String -> Attribute
cite = A.stringAttribute "cite"

-- button attributes http://www.w3schools.com/tags/tag_button.asp
autofocus :: Boolean -> Attribute
autofocus = A.booleanAttribute "autofocus"

disabled :: Boolean -> Attribute
disabled = A.booleanAttribute "disabled"

form :: String -> Attribute
form = A.stringAttribute "form"

formAction :: String -> Attribute
formAction = A.stringAttribute "formAction"

formEnctype :: String -> Attribute
formEnctype = A.stringAttribute "formEnctype"

formMethod :: String -> Attribute
formMethod = A.stringAttribute "formMethod"

formNoValidate :: Boolean -> Attribute
formNoValidate = A.booleanAttribute "formNoValidate"

formTarget :: String -> Attribute
formTarget = A.stringAttribute "formTarget"

name :: String -> Attribute
name = A.stringAttribute "name"

-- type

value :: String -> Attribute
value = A.stringAttribute "value"

-- canvas attributes http://www.w3schools.com/tags/tag_canvas.asp
height :: Number -> Attribute
height = A.numberAttribute "height"

width :: Number -> Attribute
width = A.numberAttribute "width"

-- col attributes http://www.w3schools.com/tags/tag_col.asp
span :: Number -> Attribute
span = A.numberAttribute "span"

-- colgroup attributes: span

-- del attributes http://www.w3schools.com/tags/tag_del.asp
-- cite
dateTime :: String -> Attribute
dateTime = A.stringAttribute "dateTime"

-- dialog attributes http://www.w3schools.com/tags/tag_dialog.asp
open :: Boolean -> Attribute
open = A.booleanAttribute "open"

-- embed attributes: height, src, type, width
-- fieldset attributes: disabled, form, name

-- form attributes http://www.w3schools.com/tags/tag_form.asp
acceptCharset :: String -> Attribute
acceptCharset = A.stringAttribute "acceptCharset"

action :: String -> Attribute
action = A.stringAttribute "action"

autocomplete :: String -> Attribute
autocomplete = A.stringAttribute "autocomplete"

enctype :: String -> Attribute
enctype = A.stringAttribute "enctype"

method :: String -> Attribute
method = A.stringAttribute "method"

-- name

noValidate :: Boolean -> Attribute
noValidate = A.booleanAttribute "noValidate"

-- target

-- iframe attributes http://www.w3schools.com/tags/tag_iframe.asp
-- height, name
sandbox :: String -> Attribute
sandbox = A.stringAttribute "sandbox"

-- TODO: seamless

-- src

srcdoc :: String -> Attribute
srcdoc = A.stringAttribute "srcdoc"

-- width

-- img attributes http://www.w3schools.com/tags/tag_img.asp
-- alt

crossOrigin :: String -> Attribute
crossOrigin = A.stringAttribute "crossOrigin"

-- height

isMap :: Boolean -> Attribute
isMap = A.booleanAttribute "isMap"

useMap :: String -> Attribute
useMap = A.stringAttribute "useMap"

-- width

-- input attribute http://www.w3schools.com/tags/tag_input.asp
accept :: String -> Attribute
accept = A.stringAttribute "accept"

-- alt, autocomplete, autofocus

checked :: Boolean -> Attribute
checked = A.booleanAttribute "checked"

-- disabled, form, formAction, formEnctype, formMethod, formnovalidate, formtarget, height

list :: String -> Attribute
list = A.stringAttribute "list"

max :: String -> Attribute
max = A.stringAttribute "max"

maxLength :: Number -> Attribute
maxLength = A.numberAttribute "maxLength"

min :: String -> Attribute
min = A.stringAttribute "min"

multiple :: Boolean -> Attribute
multiple = A.booleanAttribute "multiple"

-- name

pattern :: String -> Attribute
pattern = A.stringAttribute "pattern"

placeholder :: String -> Attribute
placeholder = A.stringAttribute "placeholder"

readOnly :: Boolean -> Attribute
readOnly = A.booleanAttribute "readOnly"

required :: Boolean -> Attribute
required = A.booleanAttribute "required"

size :: Number -> Attribute
size = A.numberAttribute "size"

-- src

step :: Number -> Attribute
step = A.numberAttribute "step"

-- type, value, width

-- ins attributes: cite, dateTime

-- keygen attribute http://www.w3schools.com/tags/tag_keygen.asp

-- autofocus

-- TODO: challenge

-- disabled, form

-- TODO: keytype

-- name

-- label attribute http://www.w3schools.com/tags/tag_label.asp
for :: String -> Attribute
for = A.stringAttribute "htmlFor"

-- form

-- li attributes: value

-- link attributes http://www.w3schools.com/tags/tag_link.asp
-- crossOrigin, href, hreflang, media, rel

sizes :: String -> Attribute
sizes = A.stringAttribute "sizes"

-- type

-- map attributes: name

-- menu attributes http://www.w3schools.com/tags/tag_menu.asp

label :: String -> Attribute
label = A.stringAttribute "label"

-- type

-- menuitem attributes http://www.w3schools.com/tags/tag_menuitem.asp

-- checked

-- TODO: command

default :: Boolean -> Attribute
default = A.booleanAttribute "default"

-- disabled

icon :: String -> Attribute
icon = A.stringAttribute "icon"

-- label

radiogroup :: String -> Attribute
radiogroup = A.stringAttribute "radiogroup"

-- type

-- meta attributes http://www.w3schools.com/tags/tag_meta.asp

charset :: String -> Attribute
charset = A.stringAttribute "charset"

content :: String -> Attribute
content = A.stringAttribute "content"

httpEquiv :: String -> Attribute
httpEquiv = A.stringAttribute "httpEquiv"

-- name

-- meter attributes http://www.w3schools.com/tags/tag_meter.asp

-- form,

high :: Number -> Attribute
high = A.numberAttribute "high"

low :: Number -> Attribute
low = A.numberAttribute "high"

-- max, min

optimum :: Number -> Attribute
optimum = A.numberAttribute "optimum"

-- value

-- object attributes http://www.w3schools.com/tags/tag_object.asp

data_ :: String -> Attribute
data_ = A.stringAttribute "data"

-- form, height, name, type, usemap, width

-- ol attributes http://www.w3schools.com/tags/tag_ol.asp
reversed :: Boolean -> Attribute
reversed = A.booleanAttribute "reversed"

start :: Number -> Attribute
start = A.numberAttribute "start"

-- type

-- optgroup attributes: disabled, label

-- option attributes: http://www.w3schools.com/tags/tag_option.asp
-- disabled, label

selected :: Boolean -> Attribute
selected = A.booleanAttribute "selected"

-- value

-- output attributes: for, form, name
-- param attributes: name, value
-- progress attributes: max, value
-- q attributes: cite

-- script attributes http://www.w3schools.com/tags/tag_script.asp
async :: Boolean -> Attribute
async = A.booleanAttribute "async"

-- charset

defer :: Boolean -> Attribute
defer = A.booleanAttribute "defer"

-- select attributes: autofocus, disabled, form, multiple, name, required, size
-- source attributes: media, src, type

-- style attributes http://www.w3schools.com/tags/tag_style.asp
-- media
scoped :: Boolean -> Attribute
scoped = A.booleanAttribute "scoped"

-- type

-- table attributes http://www.w3schools.com/tags/tag_table.asp

-- TODO: sortable

-- td attributes http://www.w3schools.com/tags/tag_td.asp

colSpan :: Number -> Attribute
colSpan = A.numberAttribute "colSpan"

headers :: String -> Attribute
headers = A.stringAttribute "headers"

rowSpan :: Number -> Attribute
rowSpan = A.numberAttribute "rowSpan"

-- textarea attributes http://www.w3schools.com/tags/tag_textarea.asp
-- autofocus
cols :: Number -> Attribute
cols = A.numberAttribute "cols"

-- disabled, form, maxlength, name, placeholder, readOnly, required

rows :: Number -> Attribute
rows = A.numberAttribute "rows"

wrap :: String -> Attribute
wrap = A.stringAttribute "wrap"

-- th attributes http://www.w3schools.com/tags/tag_th.asp
abbr :: String -> Attribute
abbr = A.stringAttribute "abbr"

scope :: String -> Attribute
scope = A.stringAttribute "scope"

-- sorted

-- time attributes: dateTime

-- track attributes http://www.w3schools.com/tags/tag_track.asp
-- default

kind :: String -> Attribute
kind = A.stringAttribute "kind"

-- label, src, srclang

-- video attributes: http://www.w3schools.com/tags/tag_video.asp
-- autoplay, controls, height, loop, muted

poster :: String -> Attribute
poster = A.stringAttribute "poster"

-- preload, src, width
