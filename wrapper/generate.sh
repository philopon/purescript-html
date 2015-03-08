#!/bin/bash

cd `dirname $0`
../node_modules/webpack/bin/webpack.js

./wrap.sh Data.Html.Internal.VirtualDOM ./bundle/virtualDOM.js ../src/Data/Html/Internal/VirtualDOM.purs

./wrap.sh Data.Html.Internal.Stringify ./bundle/stringify.js ../src/Data/Html/Internal/Stringify.purs

./wrap.sh Data.Html.Internal.HtmlToVDom ./bundle/htmlToDOM.js ../src/Data/Html/Internal/HtmlToVDom.purs
