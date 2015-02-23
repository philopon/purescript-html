module Data.Html.Internal.Virtualize(virtualize) where

foreign import virtualize """
var virtualize =
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

	/*!
	* vdom-virtualize
	* Copyright 2014 by Marcel Klehr <mklehr@gmx.net>
	*
	* (MIT LICENSE)
	* Permission is hereby granted, free of charge, to any person obtaining a copy
	* of this software and associated documentation files (the "Software"), to deal
	* in the Software without restriction, including without limitation the rights
	* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	* copies of the Software, and to permit persons to whom the Software is
	* furnished to do so, subject to the following conditions:
	*
	* The above copyright notice and this permission notice shall be included in
	* all copies or substantial portions of the Software.
	*
	* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	* THE SOFTWARE.
	*/
	var VNode = __webpack_require__(5)
	  , VText = __webpack_require__(6)

	module.exports = createVNode

	function createVNode(domNode, key) {
	  key = key || null // XXX: Leave out `key` for now... merely used for (re-)ordering

	  if(domNode.nodeType == 1) return createFromElement(domNode, key)
	  if(domNode.nodeType == 3) return createFromTextNode(domNode, key)
	  return
	}

	createVNode.fromHTML = function(html, key) {
	  var domNode = document.createElement('div'); // create container
	  domNode.innerHTML = html; // browser parses HTML into DOM tree
	  domNode = domNode.children[0] || domNode; // select first node in tree
	  return createVNode(domNode, key);
	};

	function createFromTextNode(tNode) {
	  return new VText(tNode.nodeValue)
	}


	function createFromElement(el) {
	  var tagName = el.tagName
	  , namespace = el.namespaceURI == 'http://www.w3.org/1999/xhtml'? null : el.namespaceURI
	  , properties = getElementProperties(el)
	  , children = []

	  for (var i = 0; i < el.childNodes.length; i++) {
	    children.push(createVNode(el.childNodes[i]/*, i*/))
	  }

	  return new VNode(tagName, properties, children, null, namespace)
	}


	function getElementProperties(el) {
	  var obj = {}

	  props.forEach(function(propName) {
	    if(!el[propName]) return

	    // Special case: style
	    // .style is a DOMStyleDeclaration, thus we need to iterate over all
	    // rules to create a hash of applied css properties.
	    //
	    // You can directly set a specific .style[prop] = value so patching with vdom
	    // is possible.
	    if("style" == propName) {
	      var css = {}
	        , styleProp
	      for(var i=0; i<el.style.length; i++) {
	        styleProp = el.style[i]
	        css[styleProp] = el.style.getPropertyValue(styleProp) // XXX: add support for "!important" via getPropertyPriority()!
	      }

	      obj[propName] = css
	      return
	    }

	    // Special case: dataset
	    // we can iterate over .dataset with a simple for..in loop.
	    // The all-time foo with data-* attribs is the dash-snake to camelCase
	    // conversion.
	    // However, I'm not sure if this is compatible with h()
	    //
	    // .dataset properties are directly accessible as transparent getters/setters, so
	    // patching with vdom is possible.
	    if("dataset" == propName) {
	      var data = {}
	      for(var p in el.dataset) {
	        data[p] = el.dataset[p]
	      }

	      obj[propName] = data
	      return
	    }
	    
	    // Special case: attributes
	    // some properties are only accessible via .attributes, so 
	    // that's what we'd do, if vdom-create-element could handle this.
	    if("attributes" == propName) return
	    if("tabIndex" == propName && el.tabIndex === -1) return
	    

	    // default: just copy the property
	    obj[propName] = el[propName]
	    return
	  })

	  return obj
	}

	/**
	 * DOMNode property white list
	 * Taken from https://github.com/Raynos/react/blob/dom-property-config/src/browser/ui/dom/DefaultDOMPropertyConfig.js
	 */
	var props =

	module.exports.properties = [
	 "accept"
	,"accessKey"
	,"action"
	,"alt"
	,"async"
	,"autoComplete"
	,"autoPlay"
	,"cellPadding"
	,"cellSpacing"
	,"checked"
	,"className"
	,"colSpan"
	,"content"
	,"contentEditable"
	,"controls"
	,"crossOrigin"
	,"data"
	,"dataset"
	,"defer"
	,"dir"
	,"download"
	,"draggable"
	,"encType"
	,"formNoValidate"
	,"href"
	,"hrefLang"
	,"htmlFor"
	,"httpEquiv"
	,"icon"
	,"id"
	,"label"
	,"lang"
	,"list"
	,"loop"
	,"max"
	,"mediaGroup"
	,"method"
	,"min"
	,"multiple"
	,"muted"
	,"name"
	,"noValidate"
	,"pattern"
	,"placeholder"
	,"poster"
	,"preload"
	,"radioGroup"
	,"readOnly"
	,"rel"
	,"required"
	,"rowSpan"
	,"sandbox"
	,"scope"
	,"scrollLeft"
	,"scrolling"
	,"scrollTop"
	,"selected"
	,"span"
	,"spellCheck"
	,"src"
	,"srcDoc"
	,"srcSet"
	,"start"
	,"step"
	,"style"
	,"tabIndex"
	,"target"
	,"title"
	,"type"
	,"value"

	// Non-standard Properties
	,"autoCapitalize"
	,"autoCorrect"
	,"property"

	, "attributes"
	]

	var attrs =
	module.exports.attrs = [
	 "allowFullScreen"
	,"allowTransparency"
	,"charSet"
	,"cols"
	,"contextMenu"
	,"dateTime"
	,"disabled"
	,"form"
	,"frameBorder"
	,"height"
	,"hidden"
	,"maxLength"
	,"role"
	,"rows"
	,"seamless"
	,"size"
	,"width"
	,"wmode"

	// SVG Properties
	,"cx"
	,"cy"
	,"d"
	,"dx"
	,"dy"
	,"fill"
	,"fx"
	,"fy"
	,"gradientTransform"
	,"gradientUnits"
	,"offset"
	,"points"
	,"r"
	,"rx"
	,"ry"
	,"spreadMethod"
	,"stopColor"
	,"stopOpacity"
	,"stroke"
	,"strokeLinecap"
	,"strokeWidth"
	,"textAnchor"
	,"transform"
	,"version"
	,"viewBox"
	,"x1"
	,"x2"
	,"x"
	,"y1"
	,"y2"
	,"y"
	]


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = "1"


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = isHook

	function isHook(hook) {
	    return hook && typeof hook.hook === "function" &&
	        !hook.hasOwnProperty("hook")
	}


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(1)

	module.exports = isVirtualNode

	function isVirtualNode(x) {
	    return x && x.type === "VirtualNode" && x.version === version
	}


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = isWidget

	function isWidget(w) {
	    return w && w.type === "Widget"
	}


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(1)
	var isVNode = __webpack_require__(3)
	var isWidget = __webpack_require__(4)
	var isVHook = __webpack_require__(2)

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
	    var descendantHooks = false
	    var hooks

	    for (var propName in properties) {
	        if (properties.hasOwnProperty(propName)) {
	            var property = properties[propName]
	            if (isVHook(property)) {
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

	            if (!descendantHooks && (child.hooks || child.descendantHooks)) {
	                descendantHooks = true
	            }
	        } else if (!hasWidgets && isWidget(child)) {
	            if (typeof child.destroy === "function") {
	                hasWidgets = true
	            }
	        }
	    }

	    this.count = count + descendants
	    this.hasWidgets = hasWidgets
	    this.hooks = hooks
	    this.descendantHooks = descendantHooks
	}

	VirtualNode.prototype.version = version
	VirtualNode.prototype.type = "VirtualNode"


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	var version = __webpack_require__(1)

	module.exports = VirtualText

	function VirtualText(text) {
	    this.text = String(text)
	}

	VirtualText.prototype.version = version
	VirtualText.prototype.type = "VirtualText"


/***/ }
/******/ ])""" :: forall a. a
