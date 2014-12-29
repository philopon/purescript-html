#!/bin/bash

cd `dirname $0`
WEBPACK=../node_modules/webpack/bin/webpack.js

$WEBPACK --output-library virtualDOM virtual-dom.js bundle.js 1>&2

OUT=../src/Data/Html/Internal/VirtualDOM.purs

cat <<EOC > $OUT
module Data.Html.Internal.VirtualDOM (virtualDOM) where

foreign import virtualDOM """
EOC

cat bundle.js | tr -d '\r' >> $OUT

cat <<EOC >> $OUT
""" :: forall diff patch vnode vtext create dsHook evHook isHook softSetHook thunk partial.
  { diff        :: diff
  , patch       :: patch
  , create      :: create
  , vnode       :: vnode
  , vtext       :: vtext
  , dsHook      :: dsHook
  , evHook      :: evHook
  , isHook      :: isHook
  , softSetHook :: softSetHook
  , thunk       :: thunk
  , partial     :: partial
  }
EOC

##################

$WEBPACK --output-library delegator delegator.js delegator-bundle.js 1>&2

OUT=../src/Data/Html/Internal/Delegator.purs

cat <<EOC > $OUT
module Data.Html.Internal.Delegator (delegator) where

foreign import delegator """
EOC

cat delegator-bundle.js | tr -d '\r' >> $OUT

cat <<EOC >> $OUT
""" :: forall delegator. delegator
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
