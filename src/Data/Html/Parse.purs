module Data.Html.Parse where

import Data.Html.Elements
import qualified Data.Html.Internal.VirtualDOM as VirtualDOM
import qualified Data.Html.Internal.HtmlToVDom as HtmlToVDOM

parseString :: String -> VTree
parseString = HtmlToVDOM.exports VirtualDOM.exports.vtext
