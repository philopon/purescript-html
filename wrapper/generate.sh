#!/bin/bash

cd `dirname $0`

../node_modules/webpack/bin/webpack.js entry.js bundle.js 1>&2

cat <<EOC
module $1 (virtualDOM) where

foreign import virtualDOM """
EOC

cat bundle.js | tr -d '\r'

cat <<EOC
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
