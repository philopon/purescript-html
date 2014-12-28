module Data.Html.Elements.Html5 where

import Data.Html.Attributes
import qualified Data.Html.Elements as E

type VTree = E.VTree

text :: String -> VTree
text = E.text

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

div :: [Attribute] -> [VTree] -> VTree
div = E.vnode "div"

p :: [Attribute] -> [VTree] -> VTree
p = E.vnode "p"

hr :: [Attribute] -> [VTree] -> VTree
hr = E.vnode "hr"

pre :: [Attribute] -> [VTree] -> VTree
pre = E.vnode "pre"

blockquote :: [Attribute] -> [VTree] -> VTree
blockquote = E.vnode "blockquote"

span :: [Attribute] -> [VTree] -> VTree
span = E.vnode "span"

a :: [Attribute] -> [VTree] -> VTree
a = E.vnode "a"

code :: [Attribute] -> [VTree] -> VTree
code = E.vnode "code"

em :: [Attribute] -> [VTree] -> VTree
em = E.vnode "em"

strong :: [Attribute] -> [VTree] -> VTree
strong = E.vnode "strong"

i :: [Attribute] -> [VTree] -> VTree
i = E.vnode "i"

b :: [Attribute] -> [VTree] -> VTree
b = E.vnode "b"

u :: [Attribute] -> [VTree] -> VTree
u = E.vnode "u"

sub :: [Attribute] -> [VTree] -> VTree
sub = E.vnode "sub"

sup :: [Attribute] -> [VTree] -> VTree
sup = E.vnode "sup"

br :: [Attribute] -> [VTree] -> VTree
br = E.vnode "br"

ol :: [Attribute] -> [VTree] -> VTree
ol = E.vnode "ol"

ul :: [Attribute] -> [VTree] -> VTree
ul = E.vnode "ul"

li :: [Attribute] -> [VTree] -> VTree
li = E.vnode "li"

dl :: [Attribute] -> [VTree] -> VTree
dl = E.vnode "dl"

dt :: [Attribute] -> [VTree] -> VTree
dt = E.vnode "dt"

dd :: [Attribute] -> [VTree] -> VTree
dd = E.vnode "dd"

img :: [Attribute] -> [VTree] -> VTree
img = E.vnode "img"

iframe :: [Attribute] -> [VTree] -> VTree
iframe = E.vnode "iframe"

canvas :: [Attribute] -> [VTree] -> VTree
canvas = E.vnode "canvas"

svg :: [Attribute] -> [VTree] -> VTree
svg = E.vnode "svg"

math :: [Attribute] -> [VTree] -> VTree
math = E.vnode "math"

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

option :: [Attribute] -> [VTree] -> VTree
option = E.vnode "option"

section :: [Attribute] -> [VTree] -> VTree
section = E.vnode "section"

nav :: [Attribute] -> [VTree] -> VTree
nav = E.vnode "nav"

article :: [Attribute] -> [VTree] -> VTree
article = E.vnode "article"

aside :: [Attribute] -> [VTree] -> VTree
aside = E.vnode "aside"

header :: [Attribute] -> [VTree] -> VTree
header = E.vnode "header"

footer :: [Attribute] -> [VTree] -> VTree
footer = E.vnode "footer"

address :: [Attribute] -> [VTree] -> VTree
address = E.vnode "address"

main :: [Attribute] -> [VTree] -> VTree
main = E.vnode "main"

body :: [Attribute] -> [VTree] -> VTree
body = E.vnode "body"

figure :: [Attribute] -> [VTree] -> VTree
figure = E.vnode "figure"

figcaption :: [Attribute] -> [VTree] -> VTree
figcaption = E.vnode "figcaption"

table :: [Attribute] -> [VTree] -> VTree
table = E.vnode "table"

caption :: [Attribute] -> [VTree] -> VTree
caption = E.vnode "caption"

colgroup :: [Attribute] -> [VTree] -> VTree
colgroup = E.vnode "colgroup"

col :: [Attribute] -> [VTree] -> VTree
col = E.vnode "col"

tbody :: [Attribute] -> [VTree] -> VTree
tbody = E.vnode "tbody"

thead :: [Attribute] -> [VTree] -> VTree
thead = E.vnode "thead"

tfoot :: [Attribute] -> [VTree] -> VTree
tfoot = E.vnode "tfoot"

tr :: [Attribute] -> [VTree] -> VTree
tr = E.vnode "tr"

td :: [Attribute] -> [VTree] -> VTree
td = E.vnode "td"

th :: [Attribute] -> [VTree] -> VTree
th = E.vnode "th"

fieldset :: [Attribute] -> [VTree] -> VTree
fieldset = E.vnode "fieldset"

legend :: [Attribute] -> [VTree] -> VTree
legend = E.vnode "legend"

label :: [Attribute] -> [VTree] -> VTree
label = E.vnode "label"

datalist :: [Attribute] -> [VTree] -> VTree
datalist = E.vnode "datalist"

optgroup :: [Attribute] -> [VTree] -> VTree
optgroup = E.vnode "optgroup"

keygen :: [Attribute] -> [VTree] -> VTree
keygen = E.vnode "keygen"

output :: [Attribute] -> [VTree] -> VTree
output = E.vnode "output"

progress :: [Attribute] -> [VTree] -> VTree
progress = E.vnode "progress"

meter :: [Attribute] -> [VTree] -> VTree
meter = E.vnode "meter"

audio :: [Attribute] -> [VTree] -> VTree
audio = E.vnode "audio"

video :: [Attribute] -> [VTree] -> VTree
video = E.vnode "video"

source :: [Attribute] -> [VTree] -> VTree
source = E.vnode "source"

track :: [Attribute] -> [VTree] -> VTree
track = E.vnode "track"

embed :: [Attribute] -> [VTree] -> VTree
embed = E.vnode "embed"

object :: [Attribute] -> [VTree] -> VTree
object = E.vnode "object"

param :: [Attribute] -> [VTree] -> VTree
param = E.vnode "param"

ins :: [Attribute] -> [VTree] -> VTree
ins = E.vnode "ins"

del :: [Attribute] -> [VTree] -> VTree
del = E.vnode "del"

small :: [Attribute] -> [VTree] -> VTree
small = E.vnode "small"

cite :: [Attribute] -> [VTree] -> VTree
cite = E.vnode "cite"

dfn :: [Attribute] -> [VTree] -> VTree
dfn = E.vnode "dfn"

abbr :: [Attribute] -> [VTree] -> VTree
abbr = E.vnode "abbr"

time :: [Attribute] -> [VTree] -> VTree
time = E.vnode "time"

var :: [Attribute] -> [VTree] -> VTree
var = E.vnode "var"

samp :: [Attribute] -> [VTree] -> VTree
samp = E.vnode "samp"

kbd :: [Attribute] -> [VTree] -> VTree
kbd = E.vnode "kbd"

s :: [Attribute] -> [VTree] -> VTree
s = E.vnode "s"

q :: [Attribute] -> [VTree] -> VTree
q = E.vnode "q"

mark :: [Attribute] -> [VTree] -> VTree
mark = E.vnode "mark"

ruby :: [Attribute] -> [VTree] -> VTree
ruby = E.vnode "ruby"

rt :: [Attribute] -> [VTree] -> VTree
rt = E.vnode "rt"

rp :: [Attribute] -> [VTree] -> VTree
rp = E.vnode "rp"

bdi :: [Attribute] -> [VTree] -> VTree
bdi = E.vnode "bdi"

bdo :: [Attribute] -> [VTree] -> VTree
bdo = E.vnode "bdo"

wbr :: [Attribute] -> [VTree] -> VTree
wbr = E.vnode "wbr"

details :: [Attribute] -> [VTree] -> VTree
details = E.vnode "details"

summary :: [Attribute] -> [VTree] -> VTree
summary = E.vnode "summary"

menuitem :: [Attribute] -> [VTree] -> VTree
menuitem = E.vnode "menuitem"

menu :: [Attribute] -> [VTree] -> VTree
menu = E.vnode "menu"

