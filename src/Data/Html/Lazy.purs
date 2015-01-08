module Data.Html.Lazy
  ( thunk1, thunk2, thunk3
  , A2(..), A3(..)
  , partial1, partial2, partial3
  ) where
  
import Data.Html
import Data.Function
import Data.Maybe

foreign import thunkImpl """
var thunkImpl = (function(){
  function Thunk(fn, args, eqFn){
    this.fn   = fn;
    this.args = args;
    this.eqFn = eqFn;
  }

  Thunk.prototype.type = "Thunk";
  Thunk.prototype.render = render;

  function shouldUpdate(current, prev){
    if(!current || !prev) return true;

    var cargs = current.args;
    var pargs = prev.args;

    return !current.eqFn(cargs, pargs);
  }

  function render(prev){
    if(shouldUpdate(this, prev)) {
       return this.fn(this.args);
    } else {
      return prev.vnode;
    }
  }

  return Thunk;
})();""" :: forall a b c. Fn3 a b c VTree

foreign import partial1Impl """
function partial1Impl(Thunk, eqFn, fn, a){
  function compare(x, y){
    return eqFn(x[0])(y[0]);
  }

  return new Thunk(function(a){return fn(a[0]);}, [a], compare);
}""" :: forall a b c d. Fn4 a b c d VTree

partial1 :: forall a. (a -> a -> Boolean) -> (a -> VTree) -> a -> VTree
partial1 = runFn4 partial1Impl thunkImpl

thunk1 :: forall a. (Eq a) => (a -> VTree) -> a -> VTree
thunk1 = partial1 (==)

foreign import partial2Impl """
function partial2Impl(Thunk, eqFn, fn, a, b) {
  function compare(x, y){
    return eqFn({"_0": x[0], "_1": x[1]})({"_0": y[0], "_1": y[1]});
  }

  return new Thunk(function(a){return fn(a[0])(a[1]);}, [a, b], compare);
}""" :: forall a b c d e. Fn5 a b c d e VTree

type A2 a b = {_0 :: a, _1 :: b}

partial2 :: forall a b. (A2 a b -> A2 a b -> Boolean) -> (a -> b -> VTree) -> a -> b -> VTree
partial2 = runFn5 partial2Impl thunkImpl

thunk2 :: forall a b. (Eq a, Eq b) => (a -> b -> VTree) -> a -> b -> VTree
thunk2 = partial2 (\x y -> x._0 == y._0 && x._1 == y._1)

foreign import partial3Impl """
function partial3Impl(Thunk, eqFn, fn, a, b, c) {
  function compare(x, y){
    return eqFn({"_0": x[0], "_1": x[1], "_2": x[2]})({"_0": y[0], "_1": y[1], "_2": y[2]});
  }

  return new Thunk(function(a){return fn(a[0])(a[1])(a[2]);}, [a, b, c], compare);
}""" :: forall a b c d e f. Fn6 a b c d e f VTree

type A3 a b c = {_0 :: a, _1 :: b, _2 :: c}

partial3 :: forall a b c. (A3 a b c -> A3 a b c -> Boolean) -> (a -> b -> c -> VTree) -> a -> b -> c -> VTree
partial3 = runFn6 partial3Impl thunkImpl

thunk3 :: forall a b c. (Eq a, Eq b, Eq c) => (a -> b -> c -> VTree) -> a -> b -> c -> VTree
thunk3 = partial3 (\x y -> x._0 == y._0 && x._1 == y._1 && x._2 == y._2)
