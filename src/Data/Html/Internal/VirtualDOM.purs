module Data.Html.Internal.VirtualDOM (virtualDOM) where

foreign import virtualDOM """
var virtualDOM =
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var diff    = __webpack_require__(19);
	var patch   = __webpack_require__(25);
	var create  = __webpack_require__(18);
	var VNode   = __webpack_require__(32);
	var VText   = __webpack_require__(33);
	var isHook  = __webpack_require__(3);

	var evHook = __webpack_require__(30);
	var softSetHook = __webpack_require__(31);

	var thunk = __webpack_require__(16);
	var partial = __webpack_require__(7);

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


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = isWidget

	function isWidget(w) {
	    return w && w.type === "Widget"
	}


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = "1"


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = isHook

	function isHook(hook) {
	    return hook && typeof hook.hook === "function" &&
	        !hook.hasOwnProperty("hook")
	}


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(2)

	module.exports = isVirtualNode

	function isVirtualNode(x) {
	    return x && x.type === "VirtualNode" && x.version === version
	}


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = isThunk

	function isThunk(t) {
	    return t && t.type === "Thunk"
	}


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(2)

	module.exports = isVirtualText

	function isVirtualText(x) {
	    return x && x.type === "VirtualText" && x.version === version
	}


/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

	var shallowEq = __webpack_require__(17);
	var Thunk = __webpack_require__(15);

	module.exports = createPartial;

	function createPartial(eq) {
	    return function partial(fn) {
	        var args = copyOver(arguments, 1);
	        var firstArg = args[0];
	        var key;

	        var eqArgs = eq || shallowEq;

	        if (typeof firstArg === 'object' && firstArg !== null) {
	            if ('key' in firstArg) {
	                key = firstArg.key;
	            } else if ('id' in firstArg) {
	                key = firstArg.id;
	            }
	        }

	        return new Thunk(fn, args, key, eqArgs);
	    };
	}

	function copyOver(list, offset) {
	    var newList = [];
	    for (var i = list.length - 1; i >= offset; i--) {
	        newList[i - offset] = list[i];
	    }
	    return newList;
	}


/***/ },
/* 8 */
/***/ function(module, exports, __webpack_require__) {

	/* WEBPACK VAR INJECTION */(function(global) {var topLevel = typeof global !== 'undefined' ? global :
	    typeof window !== 'undefined' ? window : {}
	var minDoc = __webpack_require__(35);

	if (typeof document !== 'undefined') {
	    module.exports = document;
	} else {
	    var doccy = topLevel['__GLOBAL_DOCUMENT_CACHE@4'];

	    if (!doccy) {
	        doccy = topLevel['__GLOBAL_DOCUMENT_CACHE@4'] = minDoc;
	    }

	    module.exports = doccy;
	}
	
	/* WEBPACK VAR INJECTION */}.call(exports, (function() { return this; }())))

/***/ },
/* 9 */
/***/ function(module, exports, __webpack_require__) {

	"use strict";

	module.exports = function isObject(x) {
		return typeof x === "object" && x !== null;
	};


/***/ },
/* 10 */
/***/ function(module, exports, __webpack_require__) {

	var nativeIsArray = Array.isArray
	var toString = Object.prototype.toString

	module.exports = nativeIsArray || isArray

	function isArray(obj) {
	    return toString.call(obj) === "[object Array]"
	}


/***/ },
/* 11 */
/***/ function(module, exports, __webpack_require__) {

	var isObject = __webpack_require__(9)
	var isHook = __webpack_require__(3)

	module.exports = applyProperties

	function applyProperties(node, props, previous) {
	    for (var propName in props) {
	        var propValue = props[propName]

	        if (propValue === undefined) {
	            removeProperty(node, props, previous, propName);
	        } else if (isHook(propValue)) {
	            propValue.hook(node,
	                propName,
	                previous ? previous[propName] : undefined)
	        } else {
	            if (isObject(propValue)) {
	                patchObject(node, props, previous, propName, propValue);
	            } else if (propValue !== undefined) {
	                node[propName] = propValue
	            }
	        }
	    }
	}

	function removeProperty(node, props, previous, propName) {
	    if (previous) {
	        var previousValue = previous[propName]

	        if (!isHook(previousValue)) {
	            if (propName === "attributes") {
	                for (var attrName in previousValue) {
	                    node.removeAttribute(attrName)
	                }
	            } else if (propName === "style") {
	                for (var i in previousValue) {
	                    node.style[i] = ""
	                }
	            } else if (typeof previousValue === "string") {
	                node[propName] = ""
	            } else {
	                node[propName] = null
	            }
	        } else if (previousValue.unhook) {
	            previousValue.unhook(node, propName)
	        }
	    }
	}

	function patchObject(node, props, previous, propName, propValue) {
	    var previousValue = previous ? previous[propName] : undefined

	    // Set attributes
	    if (propName === "attributes") {
	        for (var attrName in propValue) {
	            var attrValue = propValue[attrName]

	            if (attrValue === undefined) {
	                node.removeAttribute(attrName)
	            } else {
	                node.setAttribute(attrName, attrValue)
	            }
	        }

	        return
	    }

	    if(previousValue && isObject(previousValue) &&
	        getPrototype(previousValue) !== getPrototype(propValue)) {
	        node[propName] = propValue
	        return
	    }

	    if (!isObject(node[propName])) {
	        node[propName] = {}
	    }

	    var replacer = propName === "style" ? "" : undefined

	    for (var k in propValue) {
	        var value = propValue[k]
	        node[propName][k] = (value === undefined) ? replacer : value
	    }
	}

	function getPrototype(value) {
	    if (Object.getPrototypeOf) {
	        return Object.getPrototypeOf(value)
	    } else if (value.__proto__) {
	        return value.__proto__
	    } else if (value.constructor) {
	        return value.constructor.prototype
	    }
	}


/***/ },
/* 12 */
/***/ function(module, exports, __webpack_require__) {

	var document = __webpack_require__(8)

	var applyProperties = __webpack_require__(11)

	var isVNode = __webpack_require__(4)
	var isVText = __webpack_require__(6)
	var isWidget = __webpack_require__(1)
	var handleThunk = __webpack_require__(13)

	module.exports = createElement

	function createElement(vnode, opts) {
	    var doc = opts ? opts.document || document : document
	    var warn = opts ? opts.warn : null

	    vnode = handleThunk(vnode).a

	    if (isWidget(vnode)) {
	        return vnode.init()
	    } else if (isVText(vnode)) {
	        return doc.createTextNode(vnode.text)
	    } else if (!isVNode(vnode)) {
	        if (warn) {
	            warn("Item is not a valid virtual dom node", vnode)
	        }
	        return null
	    }

	    var node = (vnode.namespace === null) ?
	        doc.createElement(vnode.tagName) :
	        doc.createElementNS(vnode.namespace, vnode.tagName)

	    var props = vnode.properties
	    applyProperties(node, props)

	    var children = vnode.children

	    for (var i = 0; i < children.length; i++) {
	        var childNode = createElement(children[i], opts)
	        if (childNode) {
	            node.appendChild(childNode)
	        }
	    }

	    return node
	}


/***/ },
/* 13 */
/***/ function(module, exports, __webpack_require__) {

	var isVNode = __webpack_require__(4)
	var isVText = __webpack_require__(6)
	var isWidget = __webpack_require__(1)
	var isThunk = __webpack_require__(5)

	module.exports = handleThunk

	function handleThunk(a, b) {
	    var renderedA = a
	    var renderedB = b

	    if (isThunk(b)) {
	        renderedB = renderThunk(b, a)
	    }

	    if (isThunk(a)) {
	        renderedA = renderThunk(a, null)
	    }

	    return {
	        a: renderedA,
	        b: renderedB
	    }
	}

	function renderThunk(thunk, previous) {
	    var renderedThunk = thunk.vnode

	    if (!renderedThunk) {
	        renderedThunk = thunk.vnode = thunk.render(previous)
	    }

	    if (!(isVNode(renderedThunk) ||
	            isVText(renderedThunk) ||
	            isWidget(renderedThunk))) {
	        throw new Error("thunk did not return a valid node");
	    }

	    return renderedThunk
	}


/***/ },
/* 14 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(2)

	VirtualPatch.NONE = 0
	VirtualPatch.VTEXT = 1
	VirtualPatch.VNODE = 2
	VirtualPatch.WIDGET = 3
	VirtualPatch.PROPS = 4
	VirtualPatch.ORDER = 5
	VirtualPatch.INSERT = 6
	VirtualPatch.REMOVE = 7
	VirtualPatch.THUNK = 8

	module.exports = VirtualPatch

	function VirtualPatch(type, vNode, patch) {
	    this.type = Number(type)
	    this.vNode = vNode
	    this.patch = patch
	}

	VirtualPatch.prototype.version = version
	VirtualPatch.prototype.type = "VirtualPatch"


/***/ },
/* 15 */
/***/ function(module, exports, __webpack_require__) {

	function Thunk(fn, args, key, eqArgs) {
	    this.fn = fn;
	    this.args = args;
	    this.key = key;
	    this.eqArgs = eqArgs;
	}

	Thunk.prototype.type = 'Thunk';
	Thunk.prototype.render = render;
	module.exports = Thunk;

	function shouldUpdate(current, previous) {
	    if (!current || !previous || current.fn !== previous.fn) {
	        return true;
	    }

	    var cargs = current.args;
	    var pargs = previous.args;

	    return !current.eqArgs(cargs, pargs);
	}

	function render(previous) {
	    if (shouldUpdate(this, previous)) {
	        return this.fn.apply(null, this.args);
	    } else {
	        return previous.vnode;
	    }
	}


/***/ },
/* 16 */
/***/ function(module, exports, __webpack_require__) {

	var Partial = __webpack_require__(7);

	module.exports = Partial();


/***/ },
/* 17 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = shallowEq;

	function shallowEq(currentArgs, previousArgs) {
	    if (currentArgs.length === 0 && previousArgs.length === 0) {
	        return true;
	    }

	    if (currentArgs.length !== previousArgs.length) {
	        return false;
	    }

	    var len = currentArgs.length;

	    for (var i = 0; i < len; i++) {
	        if (currentArgs[i] !== previousArgs[i]) {
	            return false;
	        }
	    }

	    return true;
	}


/***/ },
/* 18 */
/***/ function(module, exports, __webpack_require__) {

	var createElement = __webpack_require__(12)

	module.exports = createElement


/***/ },
/* 19 */
/***/ function(module, exports, __webpack_require__) {

	var diff = __webpack_require__(34)

	module.exports = diff


/***/ },
/* 20 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = createHash

	function createHash(elem) {
	    var attributes = elem.attributes
	    var hash = {}

	    if (attributes === null || attributes === undefined) {
	        return hash
	    }

	    for (var i = 0; i < attributes.length; i++) {
	        var attr = attributes[i]

	        if (attr.name.substr(0,5) !== "data-") {
	            continue
	        }

	        hash[attr.name.substr(5)] = attr.value
	    }

	    return hash
	}


/***/ },
/* 21 */
/***/ function(module, exports, __webpack_require__) {

	var createStore = __webpack_require__(23)
	var Individual = __webpack_require__(22)

	var createHash = __webpack_require__(20)

	var hashStore = Individual("__DATA_SET_WEAKMAP@3", createStore())

	module.exports = DataSet

	function DataSet(elem) {
	    var store = hashStore(elem)

	    if (!store.hash) {
	        store.hash = createHash(elem)
	    }

	    return store.hash
	}


/***/ },
/* 22 */
/***/ function(module, exports, __webpack_require__) {

	/* WEBPACK VAR INJECTION */(function(global) {var root = typeof window !== 'undefined' ?
	    window : typeof global !== 'undefined' ?
	    global : {};

	module.exports = Individual

	function Individual(key, value) {
	    if (root[key]) {
	        return root[key]
	    }

	    Object.defineProperty(root, key, {
	        value: value
	        , configurable: true
	    })

	    return value
	}
	
	/* WEBPACK VAR INJECTION */}.call(exports, (function() { return this; }())))

/***/ },
/* 23 */
/***/ function(module, exports, __webpack_require__) {

	var hiddenStore = __webpack_require__(24);

	module.exports = createStore;

	function createStore() {
	    var key = {};

	    return function (obj) {
	        if (typeof obj !== 'object' || obj === null) {
	            throw new Error('Weakmap-shim: Key must be object')
	        }

	        var store = obj.valueOf(key);
	        return store && store.identity === key ?
	            store : hiddenStore(obj, key);
	    };
	}


/***/ },
/* 24 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = hiddenStore;

	function hiddenStore(obj, key) {
	    var store = { identity: key };
	    var valueOf = obj.valueOf;

	    Object.defineProperty(obj, "valueOf", {
	        value: function (value) {
	            return value !== key ?
	                valueOf.apply(this, arguments) : store;
	        },
	        writable: true
	    });

	    return store;
	}


/***/ },
/* 25 */
/***/ function(module, exports, __webpack_require__) {

	var patch = __webpack_require__(28)

	module.exports = patch


/***/ },
/* 26 */
/***/ function(module, exports, __webpack_require__) {

	// Maps a virtual DOM tree onto a real DOM tree in an efficient manner.
	// We don't want to read all of the DOM nodes in the tree so we use
	// the in-order tree indexing to eliminate recursion down certain branches.
	// We only recurse into a DOM node if we know that it contains a child of
	// interest.

	var noChild = {}

	module.exports = domIndex

	function domIndex(rootNode, tree, indices, nodes) {
	    if (!indices || indices.length === 0) {
	        return {}
	    } else {
	        indices.sort(ascending)
	        return recurse(rootNode, tree, indices, nodes, 0)
	    }
	}

	function recurse(rootNode, tree, indices, nodes, rootIndex) {
	    nodes = nodes || {}


	    if (rootNode) {
	        if (indexInRange(indices, rootIndex, rootIndex)) {
	            nodes[rootIndex] = rootNode
	        }

	        var vChildren = tree.children

	        if (vChildren) {

	            var childNodes = rootNode.childNodes

	            for (var i = 0; i < tree.children.length; i++) {
	                rootIndex += 1

	                var vChild = vChildren[i] || noChild
	                var nextIndex = rootIndex + (vChild.count || 0)

	                // skip recursion down the tree if there are no nodes down here
	                if (indexInRange(indices, rootIndex, nextIndex)) {
	                    recurse(childNodes[i], vChild, indices, nodes, rootIndex)
	                }

	                rootIndex = nextIndex
	            }
	        }
	    }

	    return nodes
	}

	// Binary search for an index in the interval [left, right]
	function indexInRange(indices, left, right) {
	    if (indices.length === 0) {
	        return false
	    }

	    var minIndex = 0
	    var maxIndex = indices.length - 1
	    var currentIndex
	    var currentItem

	    while (minIndex <= maxIndex) {
	        currentIndex = ((maxIndex + minIndex) / 2) >> 0
	        currentItem = indices[currentIndex]

	        if (minIndex === maxIndex) {
	            return currentItem >= left && currentItem <= right
	        } else if (currentItem < left) {
	            minIndex = currentIndex + 1
	        } else  if (currentItem > right) {
	            maxIndex = currentIndex - 1
	        } else {
	            return true
	        }
	    }

	    return false;
	}

	function ascending(a, b) {
	    return a > b ? 1 : -1
	}


/***/ },
/* 27 */
/***/ function(module, exports, __webpack_require__) {

	var applyProperties = __webpack_require__(11)

	var isWidget = __webpack_require__(1)
	var VPatch = __webpack_require__(14)

	var render = __webpack_require__(12)
	var updateWidget = __webpack_require__(29)

	module.exports = applyPatch

	function applyPatch(vpatch, domNode, renderOptions) {
	    var type = vpatch.type
	    var vNode = vpatch.vNode
	    var patch = vpatch.patch

	    switch (type) {
	        case VPatch.REMOVE:
	            return removeNode(domNode, vNode)
	        case VPatch.INSERT:
	            return insertNode(domNode, patch, renderOptions)
	        case VPatch.VTEXT:
	            return stringPatch(domNode, vNode, patch, renderOptions)
	        case VPatch.WIDGET:
	            return widgetPatch(domNode, vNode, patch, renderOptions)
	        case VPatch.VNODE:
	            return vNodePatch(domNode, vNode, patch, renderOptions)
	        case VPatch.ORDER:
	            reorderChildren(domNode, patch)
	            return domNode
	        case VPatch.PROPS:
	            applyProperties(domNode, patch, vNode.properties)
	            return domNode
	        case VPatch.THUNK:
	            return replaceRoot(domNode,
	                renderOptions.patch(domNode, patch, renderOptions))
	        default:
	            return domNode
	    }
	}

	function removeNode(domNode, vNode) {
	    var parentNode = domNode.parentNode

	    if (parentNode) {
	        parentNode.removeChild(domNode)
	    }

	    destroyWidget(domNode, vNode);

	    return null
	}

	function insertNode(parentNode, vNode, renderOptions) {
	    var newNode = render(vNode, renderOptions)

	    if (parentNode) {
	        parentNode.appendChild(newNode)
	    }

	    return parentNode
	}

	function stringPatch(domNode, leftVNode, vText, renderOptions) {
	    var newNode

	    if (domNode.nodeType === 3) {
	        domNode.replaceData(0, domNode.length, vText.text)
	        newNode = domNode
	    } else {
	        var parentNode = domNode.parentNode
	        newNode = render(vText, renderOptions)

	        if (parentNode) {
	            parentNode.replaceChild(newNode, domNode)
	        }
	    }

	    return newNode
	}

	function widgetPatch(domNode, leftVNode, widget, renderOptions) {
	    var updating = updateWidget(leftVNode, widget)
	    var newNode

	    if (updating) {
	        newNode = widget.update(leftVNode, domNode) || domNode
	    } else {
	        newNode = render(widget, renderOptions)
	    }

	    var parentNode = domNode.parentNode

	    if (parentNode && newNode !== domNode) {
	        parentNode.replaceChild(newNode, domNode)
	    }

	    if (!updating) {
	        destroyWidget(domNode, leftVNode)
	    }

	    return newNode
	}

	function vNodePatch(domNode, leftVNode, vNode, renderOptions) {
	    var parentNode = domNode.parentNode
	    var newNode = render(vNode, renderOptions)

	    if (parentNode) {
	        parentNode.replaceChild(newNode, domNode)
	    }

	    return newNode
	}

	function destroyWidget(domNode, w) {
	    if (typeof w.destroy === "function" && isWidget(w)) {
	        w.destroy(domNode)
	    }
	}

	function reorderChildren(domNode, bIndex) {
	    var children = []
	    var childNodes = domNode.childNodes
	    var len = childNodes.length
	    var i
	    var reverseIndex = bIndex.reverse

	    for (i = 0; i < len; i++) {
	        children.push(domNode.childNodes[i])
	    }

	    var insertOffset = 0
	    var move
	    var node
	    var insertNode
	    for (i = 0; i < len; i++) {
	        move = bIndex[i]
	        if (move !== undefined && move !== i) {
	            // the element currently at this index will be moved later so increase the insert offset
	            if (reverseIndex[i] > i) {
	                insertOffset++
	            }

	            node = children[move]
	            insertNode = childNodes[i + insertOffset] || null
	            if (node !== insertNode) {
	                domNode.insertBefore(node, insertNode)
	            }

	            // the moved element came from the front of the array so reduce the insert offset
	            if (move < i) {
	                insertOffset--
	            }
	        }

	        // element at this index is scheduled to be removed so increase insert offset
	        if (i in bIndex.removes) {
	            insertOffset++
	        }
	    }
	}

	function replaceRoot(oldRoot, newRoot) {
	    if (oldRoot && newRoot && oldRoot !== newRoot && oldRoot.parentNode) {
	        console.log(oldRoot)
	        oldRoot.parentNode.replaceChild(newRoot, oldRoot)
	    }

	    return newRoot;
	}


/***/ },
/* 28 */
/***/ function(module, exports, __webpack_require__) {

	var document = __webpack_require__(8)
	var isArray = __webpack_require__(10)

	var domIndex = __webpack_require__(26)
	var patchOp = __webpack_require__(27)
	module.exports = patch

	function patch(rootNode, patches) {
	    return patchRecursive(rootNode, patches)
	}

	function patchRecursive(rootNode, patches, renderOptions) {
	    var indices = patchIndices(patches)

	    if (indices.length === 0) {
	        return rootNode
	    }

	    var index = domIndex(rootNode, patches.a, indices)
	    var ownerDocument = rootNode.ownerDocument

	    if (!renderOptions) {
	        renderOptions = { patch: patchRecursive }
	        if (ownerDocument !== document) {
	            renderOptions.document = ownerDocument
	        }
	    }

	    for (var i = 0; i < indices.length; i++) {
	        var nodeIndex = indices[i]
	        rootNode = applyPatch(rootNode,
	            index[nodeIndex],
	            patches[nodeIndex],
	            renderOptions)
	    }

	    return rootNode
	}

	function applyPatch(rootNode, domNode, patchList, renderOptions) {
	    if (!domNode) {
	        return rootNode
	    }

	    var newNode

	    if (isArray(patchList)) {
	        for (var i = 0; i < patchList.length; i++) {
	            newNode = patchOp(patchList[i], domNode, renderOptions)

	            if (domNode === rootNode) {
	                rootNode = newNode
	            }
	        }
	    } else {
	        newNode = patchOp(patchList, domNode, renderOptions)

	        if (domNode === rootNode) {
	            rootNode = newNode
	        }
	    }

	    return rootNode
	}

	function patchIndices(patches) {
	    var indices = []

	    for (var key in patches) {
	        if (key !== "a") {
	            indices.push(Number(key))
	        }
	    }

	    return indices
	}


/***/ },
/* 29 */
/***/ function(module, exports, __webpack_require__) {

	var isWidget = __webpack_require__(1)

	module.exports = updateWidget

	function updateWidget(a, b) {
	    if (isWidget(a) && isWidget(b)) {
	        if ("name" in a && "name" in b) {
	            return a.id === b.id
	        } else {
	            return a.init === b.init
	        }
	    }

	    return false
	}


/***/ },
/* 30 */
/***/ function(module, exports, __webpack_require__) {

	var DataSet = __webpack_require__(21)

	module.exports = DataSetHook;

	function DataSetHook(value) {
	    if (!(this instanceof DataSetHook)) {
	        return new DataSetHook(value);
	    }

	    this.value = value;
	}

	DataSetHook.prototype.hook = function (node, propertyName) {
	    var ds = DataSet(node)
	    var propName = propertyName.substr(3)

	    ds[propName] = this.value;
	};

	DataSetHook.prototype.unhook = function(node, propertyName) {
	    var ds = DataSet(node);
	    var propName = propertyName.substr(3);

	    ds[propName] = undefined;
	}


/***/ },
/* 31 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = SoftSetHook;

	function SoftSetHook(value) {
	    if (!(this instanceof SoftSetHook)) {
	        return new SoftSetHook(value);
	    }

	    this.value = value;
	}

	SoftSetHook.prototype.hook = function (node, propertyName) {
	    if (node[propertyName] !== this.value) {
	        node[propertyName] = this.value;
	    }
	};


/***/ },
/* 32 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(2)
	var isVNode = __webpack_require__(4)
	var isWidget = __webpack_require__(1)
	var isThunk = __webpack_require__(5)
	var isVHook = __webpack_require__(3)

	module.exports = VirtualNode

	var noProperties = {}
	var noChildren = []

	function VirtualNode(tagName, properties, children, key, namespace) {
	    this.tagName = tagName
	    this.properties = properties || noProperties
	    this.children = children || noChildren
	    this.key = key != null ? String(key) : undefined
	    this.namespace = (typeof namespace === "string") ? namespace : null

	    var count = (children && children.length) || 0
	    var descendants = 0
	    var hasWidgets = false
	    var hasThunks = false
	    var descendantHooks = false
	    var hooks

	    for (var propName in properties) {
	        if (properties.hasOwnProperty(propName)) {
	            var property = properties[propName]
	            if (isVHook(property) && property.unhook) {
	                if (!hooks) {
	                    hooks = {}
	                }

	                hooks[propName] = property
	            }
	        }
	    }

	    for (var i = 0; i < count; i++) {
	        var child = children[i]
	        if (isVNode(child)) {
	            descendants += child.count || 0

	            if (!hasWidgets && child.hasWidgets) {
	                hasWidgets = true
	            }

	            if (!hasThunks && child.hasThunks) {
	                hasThunks = true
	            }

	            if (!descendantHooks && (child.hooks || child.descendantHooks)) {
	                descendantHooks = true
	            }
	        } else if (!hasWidgets && isWidget(child)) {
	            if (typeof child.destroy === "function") {
	                hasWidgets = true
	            }
	        } else if (!hasThunks && isThunk(child)) {
	            hasThunks = true;
	        }
	    }

	    this.count = count + descendants
	    this.hasWidgets = hasWidgets
	    this.hasThunks = hasThunks
	    this.hooks = hooks
	    this.descendantHooks = descendantHooks
	}

	VirtualNode.prototype.version = version
	VirtualNode.prototype.type = "VirtualNode"


/***/ },
/* 33 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(2)

	module.exports = VirtualText

	function VirtualText(text) {
	    this.text = String(text)
	}

	VirtualText.prototype.version = version
	VirtualText.prototype.type = "VirtualText"


/***/ },
/* 34 */
/***/ function(module, exports, __webpack_require__) {

	var isArray = __webpack_require__(10)
	var isObject = __webpack_require__(9)

	var VPatch = __webpack_require__(14)
	var isVNode = __webpack_require__(4)
	var isVText = __webpack_require__(6)
	var isWidget = __webpack_require__(1)
	var isThunk = __webpack_require__(5)
	var isHook = __webpack_require__(3)
	var handleThunk = __webpack_require__(13)

	module.exports = diff

	function diff(a, b) {
	    var patch = { a: a }
	    walk(a, b, patch, 0)
	    return patch
	}

	function walk(a, b, patch, index) {
	    if (a === b) {
	        return
	    }

	    var apply = patch[index]
	    var applyClear = false

	    if (isThunk(a) || isThunk(b)) {
	        thunks(a, b, patch, index)
	    } else if (b == null) {

	        // If a is a widget we will add a remove patch for it
	        // Otherwise any child widgets/hooks must be destroyed.
	        // This prevents adding two remove patches for a widget.
	        if (!isWidget(a)) {
	            clearState(a, patch, index)
	            apply = patch[index]
	        }

	        apply = appendPatch(apply, new VPatch(VPatch.REMOVE, a, b))
	    } else if (isVNode(b)) {
	        if (isVNode(a)) {
	            if (a.tagName === b.tagName &&
	                a.namespace === b.namespace &&
	                a.key === b.key) {
	                var propsPatch = diffProps(a.properties, b.properties)
	                if (propsPatch) {
	                    apply = appendPatch(apply,
	                        new VPatch(VPatch.PROPS, a, propsPatch))
	                }
	                apply = diffChildren(a, b, patch, apply, index)
	            } else {
	                apply = appendPatch(apply, new VPatch(VPatch.VNODE, a, b))
	                applyClear = true
	            }
	        } else {
	            apply = appendPatch(apply, new VPatch(VPatch.VNODE, a, b))
	            applyClear = true
	        }
	    } else if (isVText(b)) {
	        if (!isVText(a)) {
	            applyClear = true
	        } else if (a.text !== b.text) {
	            apply = appendPatch(apply, new VPatch(VPatch.VTEXT, a, b))
	        }
	    } else if (isWidget(b)) {
	        if (!isWidget(a)) {
	            applyClear = true;
	        }

	        apply = appendPatch(apply, new VPatch(VPatch.WIDGET, a, b))
	    }

	    if (apply) {
	        patch[index] = apply
	    }

	    if (applyClear) {
	        clearState(a, patch, index)
	    }
	}

	function diffProps(a, b) {
	    var diff

	    for (var aKey in a) {
	        if (!(aKey in b)) {
	            diff = diff || {}
	            diff[aKey] = undefined
	        }

	        var aValue = a[aKey]
	        var bValue = b[aKey]

	        if (aValue === bValue) {
	            continue
	        } else if (isObject(aValue) && isObject(bValue)) {
	            if (getPrototype(bValue) !== getPrototype(aValue)) {
	                diff = diff || {}
	                diff[aKey] = bValue
	            } else if (isHook(bValue)) {
	                 diff = diff || {}
	                 diff[aKey] = bValue
	            } else {
	                var objectDiff = diffProps(aValue, bValue)
	                if (objectDiff) {
	                    diff = diff || {}
	                    diff[aKey] = objectDiff
	                }
	            }
	        } else {
	            diff = diff || {}
	            diff[aKey] = bValue
	        }
	    }

	    for (var bKey in b) {
	        if (!(bKey in a)) {
	            diff = diff || {}
	            diff[bKey] = b[bKey]
	        }
	    }

	    return diff
	}

	function getPrototype(value) {
	    if (Object.getPrototypeOf) {
	        return Object.getPrototypeOf(value)
	    } else if (value.__proto__) {
	        return value.__proto__
	    } else if (value.constructor) {
	        return value.constructor.prototype
	    }
	}

	function diffChildren(a, b, patch, apply, index) {
	    var aChildren = a.children
	    var bChildren = reorder(aChildren, b.children)

	    var aLen = aChildren.length
	    var bLen = bChildren.length
	    var len = aLen > bLen ? aLen : bLen

	    for (var i = 0; i < len; i++) {
	        var leftNode = aChildren[i]
	        var rightNode = bChildren[i]
	        index += 1

	        if (!leftNode) {
	            if (rightNode) {
	                // Excess nodes in b need to be added
	                apply = appendPatch(apply,
	                    new VPatch(VPatch.INSERT, null, rightNode))
	            }
	        } else {
	            walk(leftNode, rightNode, patch, index)
	        }

	        if (isVNode(leftNode) && leftNode.count) {
	            index += leftNode.count
	        }
	    }

	    if (bChildren.moves) {
	        // Reorder nodes last
	        apply = appendPatch(apply, new VPatch(VPatch.ORDER, a, bChildren.moves))
	    }

	    return apply
	}

	function clearState(vNode, patch, index) {
	    // TODO: Make this a single walk, not two
	    unhook(vNode, patch, index)
	    destroyWidgets(vNode, patch, index)
	}

	// Patch records for all destroyed widgets must be added because we need
	// a DOM node reference for the destroy function
	function destroyWidgets(vNode, patch, index) {
	    if (isWidget(vNode)) {
	        if (typeof vNode.destroy === "function") {
	            patch[index] = appendPatch(
	                patch[index],
	                new VPatch(VPatch.REMOVE, vNode, null)
	            )
	        }
	    } else if (isVNode(vNode) && (vNode.hasWidgets || vNode.hasThunks)) {
	        var children = vNode.children
	        var len = children.length
	        for (var i = 0; i < len; i++) {
	            var child = children[i]
	            index += 1

	            destroyWidgets(child, patch, index)

	            if (isVNode(child) && child.count) {
	                index += child.count
	            }
	        }
	    } else if (isThunk(vNode)) {
	        thunks(vNode, null, patch, index)
	    }
	}

	// Create a sub-patch for thunks
	function thunks(a, b, patch, index) {
	    var nodes = handleThunk(a, b);
	    var thunkPatch = diff(nodes.a, nodes.b)
	    if (hasPatches(thunkPatch)) {
	        patch[index] = new VPatch(VPatch.THUNK, null, thunkPatch)
	    }
	}

	function hasPatches(patch) {
	    for (var index in patch) {
	        if (index !== "a") {
	            return true;
	        }
	    }

	    return false;
	}

	// Execute hooks when two nodes are identical
	function unhook(vNode, patch, index) {
	    if (isVNode(vNode)) {
	        if (vNode.hooks) {
	            patch[index] = appendPatch(
	                patch[index],
	                new VPatch(
	                    VPatch.PROPS,
	                    vNode,
	                    undefinedKeys(vNode.hooks)
	                )
	            )
	        }

	        if (vNode.descendantHooks || vNode.hasThunks) {
	            var children = vNode.children
	            var len = children.length
	            for (var i = 0; i < len; i++) {
	                var child = children[i]
	                index += 1

	                unhook(child, patch, index)

	                if (isVNode(child) && child.count) {
	                    index += child.count
	                }
	            }
	        }
	    } else if (isThunk(vNode)) {
	        thunks(vNode, null, patch, index)
	    }
	}

	function undefinedKeys(obj) {
	    var result = {}

	    for (var key in obj) {
	        result[key] = undefined
	    }

	    return result
	}

	// List diff, naive left to right reordering
	function reorder(aChildren, bChildren) {

	    var bKeys = keyIndex(bChildren)

	    if (!bKeys) {
	        return bChildren
	    }

	    var aKeys = keyIndex(aChildren)

	    if (!aKeys) {
	        return bChildren
	    }

	    var bMatch = {}, aMatch = {}

	    for (var aKey in bKeys) {
	        bMatch[bKeys[aKey]] = aKeys[aKey]
	    }

	    for (var bKey in aKeys) {
	        aMatch[aKeys[bKey]] = bKeys[bKey]
	    }

	    var aLen = aChildren.length
	    var bLen = bChildren.length
	    var len = aLen > bLen ? aLen : bLen
	    var shuffle = []
	    var freeIndex = 0
	    var i = 0
	    var moveIndex = 0
	    var moves = {}
	    var removes = moves.removes = {}
	    var reverse = moves.reverse = {}
	    var hasMoves = false

	    while (freeIndex < len) {
	        var move = aMatch[i]
	        if (move !== undefined) {
	            shuffle[i] = bChildren[move]
	            if (move !== moveIndex) {
	                moves[move] = moveIndex
	                reverse[moveIndex] = move
	                hasMoves = true
	            }
	            moveIndex++
	        } else if (i in aMatch) {
	            shuffle[i] = undefined
	            removes[i] = moveIndex++
	            hasMoves = true
	        } else {
	            while (bMatch[freeIndex] !== undefined) {
	                freeIndex++
	            }

	            if (freeIndex < len) {
	                var freeChild = bChildren[freeIndex]
	                if (freeChild) {
	                    shuffle[i] = freeChild
	                    if (freeIndex !== moveIndex) {
	                        hasMoves = true
	                        moves[freeIndex] = moveIndex
	                        reverse[moveIndex] = freeIndex
	                    }
	                    moveIndex++
	                }
	                freeIndex++
	            }
	        }
	        i++
	    }

	    if (hasMoves) {
	        shuffle.moves = moves
	    }

	    return shuffle
	}

	function keyIndex(children) {
	    var i, keys

	    for (i = 0; i < children.length; i++) {
	        var child = children[i]

	        if (child.key !== undefined) {
	            keys = keys || {}
	            keys[child.key] = i
	        }
	    }

	    return keys
	}

	function appendPatch(apply, patch) {
	    if (apply) {
	        if (isArray(apply)) {
	            apply.push(patch)
	        } else {
	            apply = [apply, patch]
	        }

	        return apply
	    } else {
	        return patch
	    }
	}


/***/ },
/* 35 */
/***/ function(module, exports, __webpack_require__) {

	/* (ignored) */

/***/ }
/******/ ])""" :: forall diff patch vnode vtext create dsHook evHook isHook softSetHook thunk partial.
  { diff        :: diff
  , patch       :: patch
  , create      :: create
  , vnode       :: vnode
  , vtext       :: vtext
  , dsHook      :: dsHook
  , evHook      :: evHook
  , isHook      :: isHook
  , softSetHook :: softSetHook
  , thunk       :: thunk
  , partial     :: partial
  }
