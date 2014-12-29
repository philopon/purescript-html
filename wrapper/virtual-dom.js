var diff    = require('virtual-dom/diff');
var patch   = require('virtual-dom/patch');
var create  = require('virtual-dom/create-element');
var VNode   = require('virtual-dom/vnode/vnode');
var VText   = require('virtual-dom/vnode/vtext');
var isHook  = require('virtual-dom/vnode/is-vhook');

var evHook = require('virtual-dom/virtual-hyperscript/hooks/ev-hook');
var softSetHook = require('virtual-dom/virtual-hyperscript/hooks/soft-set-hook');

var thunk = require('vdom-thunk');
var partial = require('vdom-thunk/partial');

module.exports =
  { diff:        diff
  , patch:       patch
  , create:      create
  , vnode:       VNode
  , vtext:       VText
  , evHook:      evHook
  , isHook:      isHook
  , softSetHook: softSetHook
  , thunk:       thunk
  , partial:     partial
  }
