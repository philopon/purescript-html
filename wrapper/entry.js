var diff    = require('virtual-dom/diff');
var patch   = require('virtual-dom/patch');
var create  = require('virtual-dom/create-element');
var VNode   = require('virtual-dom/vnode/vnode');
var VText   = require('virtual-dom/vnode/vtext');

var evHook = require('virtual-dom/virtual-hyperscript/hooks/ev-hook');

var thunk = require('vdom-thunk');
var partial = require('vdom-thunk/partial');

module.exports =
  { diff:   diff
  , patch:  patch
  , create: create
  , vnode:  VNode
  , vtext:  VText
  , evHook: evHook
  , thunk: thunk
  , partial: partial
  }
