module Html.Lazy
  ( thunk1, thunk2, thunk3, thunk4, thunk5
  , A2(..), A3(..)
  , partial1, partial2, partial3
  ) where
  
import Html
import Html.VirtualDOM
import Data.Function
import Data.Maybe

thunk1 :: forall a. (a -> VTree) -> a -> VTree
thunk1 = runFn2 virtualDOM.thunk

thunk2 :: forall a b. (a -> b -> VTree) -> a -> b -> VTree
thunk2 f = runFn3 virtualDOM.thunk (mkFn2 f)

thunk3 :: forall a b c. (a -> b -> c -> VTree) -> a -> b -> c -> VTree
thunk3 f = runFn4 virtualDOM.thunk (mkFn3 f)

thunk4 :: forall a b c d. (a -> b -> c -> d -> VTree) -> a -> b -> c -> d -> VTree
thunk4 f = runFn5 virtualDOM.thunk (mkFn4 f)

thunk5 :: forall a b c d e. (a -> b -> c -> d -> e -> VTree)
       -> a -> b -> c -> d -> e -> VTree
thunk5 f = runFn6 virtualDOM.thunk (mkFn5 f)

foreign import eq1Func """
function eq1Func(f){
  return function eq1Func_apply(a,b){
    return f(a[0], b[0]);
  }
}""" :: forall a. a

partial1 :: forall a. (a -> a -> Boolean) -> (a -> VTree) -> a -> VTree
partial1 eq = runFn2 (virtualDOM.partial $ eq1Func eq)

foreign import eq2Func """
function eq2Func(f){
  return function eq2Func_apply(a,b){
    return f({a:a[0], b:a[1]}, {a:b[0], b:b[1]});
  }
}""" :: forall a. a

type A2 a b = { a :: a, b :: b }
partial2 :: forall a b. (A2 a b -> A2 a b -> Boolean)
         -> (a -> b -> VTree) -> a -> b -> VTree
partial2 eq f = runFn3 (virtualDOM.partial $ eq2Func eq) (mkFn2 f)

foreign import eq3Func """
function eq3Func(f){
  return function eq3Func_apply(a,b){
    return f( {a:a[0], b:a[1], c:a[2]}
            , {a:b[0], b:b[1], c:b[2]});
  }
}""" :: forall a. a

type A3 a b c = { a :: a, b :: b, c :: c}
partial3 :: forall a b c. (A3 a b c -> A3 a b c -> Boolean)
         -> (a -> b -> c -> VTree) -> a -> b -> c -> VTree
partial3 eq f = runFn4 (virtualDOM.partial $ eq3Func eq) (mkFn3 f)

