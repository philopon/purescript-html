var diff        = require('virtual-dom/diff');
var patch       = require('virtual-dom/patch');
var create      = require('virtual-dom/create-element');
var VText       = require('virtual-dom/vnode/vtext');
var hyperscript = require('virtual-dom/h');

module.exports =
  { diff:        diff
  , patch:       patch
  , create:      create
  , vtext:       VText
  , hyperscript: hyperscript
  }
