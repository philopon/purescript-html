#!/bin/bash

cd `dirname $0`
WEBPACK=../node_modules/webpack/bin/webpack.js

$WEBPACK --output-library virtualDOM entry.js bundle.js 1>&2

OUT=../src/Data/Html/Internal/VirtualDOM.purs

cat <<EOC > $OUT
module Data.Html.Internal.VirtualDOM (virtualDOM) where

foreign import virtualDOM """
EOC

cat bundle.js | tr -d '\r' >> $OUT

cat <<EOC >> $OUT
""" :: forall diff patch vnode vtext create dsHook evHook delegator thunk partial.
  { diff   :: diff
  , patch  :: patch
  , create :: create
  , vnode  :: vnode
  , vtext  :: vtext
  , dsHook :: dsHook
  , evHook :: evHook
  , delegator :: delegator
  , thunk     :: thunk
  , partial   :: partial
  }
EOC


##################

$WEBPACK --output-library stringify virtual-dom-stringify/lib/stringify.js stringify.js 1>&2

OUT=../src/Data/Html/Internal/Stringify.purs

cat <<EOC > $OUT
module Data.Html.Internal.Stringify (stringify) where

foreign import stringify """
EOC

cat stringify.js | tr -d '\r' >> $OUT

cat <<EOC >> $OUT
""" :: forall stringify. stringify
EOC
