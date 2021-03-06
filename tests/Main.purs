module Test.Main where

import Data.Html
import Data.Html.Stringify
import Data.Html.Parse
import qualified Data.Html.Elements as E
import qualified Data.Html.Attributes as A

import Test.PSpec
import Test.PSpec.Mocha
import Test.Assert.Simple

main = runMocha $ do
  describe "elements" $ do
    it "should be div"  $ show (E.vnode "div" [] []) @?= "<div></div>"
    it "should be text" $ show (E.text "Hello")      @?= "Hello"

  describe "attributes" $ do
    it "should be semigroup" $
      show (E.vnode "a" [A.stringAttribute "href" "#" <> A.stringAttribute "title" "neko"] [])
      @?= "<a href=\"#\" title=\"neko\"></a>"

    it "should be have bool attr" $
      show (E.vnode "input" [A.booleanAttribute "disabled" true] [])
      @?= "<input disabled />"

    it "should be have string attr" $
      show (E.vnode "input" [A.stringAttribute "type_" "button"] [])
      @?= "<input type=\"button\" />"

    it "should be have number attr" $
      show (E.vnode "div" [A.numberAttribute "width" 200] [])
      @?= "<div width=\"200\"></div>"

    it "should be have style" $
      show (E.vnode "div" [A.style {color: "black", "margin-bottom": 200}] [])
      @?= "<div style=\"color: black; margin-bottom: 200;\"></div>"

    it "should be softhooked" $
      show (E.vnode "input" [A.stringAttribute "value" "neko"] [])
      @?= "<input value=\"neko\" />"

    let test = "<div style=\"color: black; margin-bottom: 200;\"><input value=\"neko\" /><a href=\"#\" title=\"neko\">nyan</a></div>"
    it "should inverse function parse and show" $
      show (parseString test) @?= test
