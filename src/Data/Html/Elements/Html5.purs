module Data.Html.Elements.Html5 where

-- http://www.w3schools.com/tags/ref_byfunc.asp

import Data.Html.Attributes(Attribute())
import qualified Data.Html.Elements as E

type VTree = E.VTree

text :: String -> VTree
text = E.text

-- basic tags
h1 :: [Attribute] -> [VTree] -> VTree
h1 = E.vnode "h1"

h2 :: [Attribute] -> [VTree] -> VTree
h2 = E.vnode "h2"

h3 :: [Attribute] -> [VTree] -> VTree
h3 = E.vnode "h3"

h4 :: [Attribute] -> [VTree] -> VTree
h4 = E.vnode "h4"

h5 :: [Attribute] -> [VTree] -> VTree
h5 = E.vnode "h5"

h6 :: [Attribute] -> [VTree] -> VTree
h6 = E.vnode "h6"

p :: [Attribute] -> [VTree] -> VTree
p = E.vnode "p"

br :: [Attribute] -> [VTree] -> VTree
br = E.vnode "br"

hr :: [Attribute] -> [VTree] -> VTree
hr = E.vnode "hr"

-- formatting
abbr :: [Attribute] -> [VTree] -> VTree
abbr = E.vnode "abbr"

address :: [Attribute] -> [VTree] -> VTree
address = E.vnode "address"

b :: [Attribute] -> [VTree] -> VTree
b = E.vnode "b"

bdi :: [Attribute] -> [VTree] -> VTree
bdi = E.vnode "bdi"

bdo :: [Attribute] -> [VTree] -> VTree
bdo = E.vnode "bdo"

blockquote :: [Attribute] -> [VTree] -> VTree
blockquote = E.vnode "blockquote"

cite :: [Attribute] -> [VTree] -> VTree
cite = E.vnode "cite"

code :: [Attribute] -> [VTree] -> VTree
code = E.vnode "code"

del :: [Attribute] -> [VTree] -> VTree
del = E.vnode "del"

dfn :: [Attribute] -> [VTree] -> VTree
dfn = E.vnode "dfn"

em :: [Attribute] -> [VTree] -> VTree
em = E.vnode "em"

i :: [Attribute] -> [VTree] -> VTree
i = E.vnode "i"

ins :: [Attribute] -> [VTree] -> VTree
ins = E.vnode "ins"

kbd :: [Attribute] -> [VTree] -> VTree
kbd = E.vnode "kbd"

mark :: [Attribute] -> [VTree] -> VTree
mark = E.vnode "mark"

meter :: [Attribute] -> [VTree] -> VTree
meter = E.vnode "meter"

pre :: [Attribute] -> [VTree] -> VTree
pre = E.vnode "pre"

progress :: [Attribute] -> [VTree] -> VTree
progress = E.vnode "progress"

q :: [Attribute] -> [VTree] -> VTree
q = E.vnode "q"

rp :: [Attribute] -> [VTree] -> VTree
rp = E.vnode "rp"

rt :: [Attribute] -> [VTree] -> VTree
rt = E.vnode "rt"

ruby :: [Attribute] -> [VTree] -> VTree
ruby = E.vnode "ruby"

s :: [Attribute] -> [VTree] -> VTree
s = E.vnode "s"

samp :: [Attribute] -> [VTree] -> VTree
samp = E.vnode "samp"

small :: [Attribute] -> [VTree] -> VTree
small = E.vnode "small"

strong :: [Attribute] -> [VTree] -> VTree
strong = E.vnode "strong"

sub :: [Attribute] -> [VTree] -> VTree
sub = E.vnode "sub"

sup :: [Attribute] -> [VTree] -> VTree
sup = E.vnode "sup"

time :: [Attribute] -> [VTree] -> VTree
time = E.vnode "time"

u :: [Attribute] -> [VTree] -> VTree
u = E.vnode "u"

var :: [Attribute] -> [VTree] -> VTree
var = E.vnode "var"

wbr :: [Attribute] -> [VTree] -> VTree
wbr = E.vnode "wbr"

-- forms and input
form :: [Attribute] -> [VTree] -> VTree
form = E.vnode "form"

input :: [Attribute] -> [VTree] -> VTree
input = E.vnode "input"

textarea :: [Attribute] -> [VTree] -> VTree
textarea = E.vnode "textarea"

button :: [Attribute] -> [VTree] -> VTree
button = E.vnode "button"

select :: [Attribute] -> [VTree] -> VTree
select = E.vnode "select"

optgroup :: [Attribute] -> [VTree] -> VTree
optgroup = E.vnode "optgroup"

option :: [Attribute] -> [VTree] -> VTree
option = E.vnode "option"

label :: [Attribute] -> [VTree] -> VTree
label = E.vnode "label"

fieldset :: [Attribute] -> [VTree] -> VTree
fieldset = E.vnode "fieldset"

legend :: [Attribute] -> [VTree] -> VTree
legend = E.vnode "legend"

datalist :: [Attribute] -> [VTree] -> VTree
datalist = E.vnode "datalist"

keygen :: [Attribute] -> [VTree] -> VTree
keygen = E.vnode "keygen"

output :: [Attribute] -> [VTree] -> VTree
output = E.vnode "output"

-- frames
iframe :: [Attribute] -> [VTree] -> VTree
iframe = E.vnode "iframe"

-- images
img :: [Attribute] -> [VTree] -> VTree
img = E.vnode "img"

map :: [Attribute] -> [VTree] -> VTree
map = E.vnode "map"

area :: [Attribute] -> [VTree] -> VTree
area = E.vnode "area"

canvas :: [Attribute] -> [VTree] -> VTree
canvas = E.vnode "canvas"

figcaption :: [Attribute] -> [VTree] -> VTree
figcaption = E.vnode "figcaption"

figure :: [Attribute] -> [VTree] -> VTree
figure = E.vnode "figure"

-- audio/video
audio :: [Attribute] -> [VTree] -> VTree
audio = E.vnode "audio"

source :: [Attribute] -> [VTree] -> VTree
source = E.vnode "source"

track :: [Attribute] -> [VTree] -> VTree
track = E.vnode "track"

video :: [Attribute] -> [VTree] -> VTree
video = E.vnode "video"

-- links
a :: [Attribute] -> [VTree] -> VTree
a = E.vnode "a"

link :: [Attribute] -> [VTree] -> VTree
link = E.vnode "link"

nav :: [Attribute] -> [VTree] -> VTree
nav = E.vnode "nav"

-- lists
ul :: [Attribute] -> [VTree] -> VTree
ul = E.vnode "ul"

ol :: [Attribute] -> [VTree] -> VTree
ol = E.vnode "ol"

li :: [Attribute] -> [VTree] -> VTree
li = E.vnode "li"

dl :: [Attribute] -> [VTree] -> VTree
dl = E.vnode "dl"

dt :: [Attribute] -> [VTree] -> VTree
dt = E.vnode "dt"

dd :: [Attribute] -> [VTree] -> VTree
dd = E.vnode "dd"

menu :: [Attribute] -> [VTree] -> VTree
menu = E.vnode "menu"

menuitem :: [Attribute] -> [VTree] -> VTree
menuitem = E.vnode "menuitem"

-- table
table :: [Attribute] -> [VTree] -> VTree
table = E.vnode "table"

caption :: [Attribute] -> [VTree] -> VTree
caption = E.vnode "caption"

th :: [Attribute] -> [VTree] -> VTree
th = E.vnode "th"

tr :: [Attribute] -> [VTree] -> VTree
tr = E.vnode "tr"

td :: [Attribute] -> [VTree] -> VTree
td = E.vnode "td"

thead :: [Attribute] -> [VTree] -> VTree
thead = E.vnode "thead"

tbody :: [Attribute] -> [VTree] -> VTree
tbody = E.vnode "tbody"

tfoot :: [Attribute] -> [VTree] -> VTree
tfoot = E.vnode "tfoot"

col :: [Attribute] -> [VTree] -> VTree
col = E.vnode "col"

colgroup :: [Attribute] -> [VTree] -> VTree
colgroup = E.vnode "colgroup"

-- styles and semantics
style :: [Attribute] -> [VTree] -> VTree
style = E.vnode "style"

div :: [Attribute] -> [VTree] -> VTree
div = E.vnode "div"

span :: [Attribute] -> [VTree] -> VTree
span = E.vnode "span"

header :: [Attribute] -> [VTree] -> VTree
header = E.vnode "header"

hgroup :: [Attribute] -> [VTree] -> VTree
hgroup = E.vnode "hgroup"

footer :: [Attribute] -> [VTree] -> VTree
footer = E.vnode "footer"

main :: [Attribute] -> [VTree] -> VTree
main = E.vnode "main"

section :: [Attribute] -> [VTree] -> VTree
section = E.vnode "section"

article :: [Attribute] -> [VTree] -> VTree
article = E.vnode "article"

aside :: [Attribute] -> [VTree] -> VTree
aside = E.vnode "aside"

details :: [Attribute] -> [VTree] -> VTree
details = E.vnode "details"

dialog :: [Attribute] -> [VTree] -> VTree
dialog = E.vnode "dialog"

summary :: [Attribute] -> [VTree] -> VTree
summary = E.vnode "summary"

-- meta info
meta :: [Attribute] -> [VTree] -> VTree
meta = E.vnode "meta"

base :: [Attribute] -> [VTree] -> VTree
base = E.vnode "base"

-- programming
script :: [Attribute] -> [VTree] -> VTree
script = E.vnode "script"

noscript :: [Attribute] -> [VTree] -> VTree
noscript = E.vnode "noscript"

embed :: [Attribute] -> [VTree] -> VTree
embed = E.vnode "embed"

object :: [Attribute] -> [VTree] -> VTree
object = E.vnode "object"

param :: [Attribute] -> [VTree] -> VTree
param = E.vnode "param"
