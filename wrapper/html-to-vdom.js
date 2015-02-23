var VNode = require('virtual-dom/vnode/vnode');

module.exports = function(VText){
  return require('html-to-vdom')({VNode: VNode, VText: VText})
}
