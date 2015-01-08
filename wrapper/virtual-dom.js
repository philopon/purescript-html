var diff    = require('virtual-dom/diff');
var patch   = require('virtual-dom/patch');
var create  = require('virtual-dom/create-element');
var VNode   = require('virtual-dom/vnode/vnode');
var VText   = require('virtual-dom/vnode/vtext');
var isHook  = require('virtual-dom/vnode/is-vhook');

var softSetHook = require('virtual-dom/virtual-hyperscript/hooks/soft-set-hook');

module.exports =
  { diff:        diff
  , patch:       patch
  , create:      create
  , vnode:       VNode
  , vtext:       VText
  , isHook:      isHook
  , softSetHook: softSetHook
  }
