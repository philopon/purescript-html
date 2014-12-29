module Data.Html.Internal.Delegator (delegator) where

foreign import delegator """
var delegator =
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

	var delegator = __webpack_require__(6);

	module.exports = delegator();


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var createStore = __webpack_require__(9)
	var Individual = __webpack_require__(3)

	var createHash = __webpack_require__(8)

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
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	/* WEBPACK VAR INJECTION */(function(global) {var topLevel = typeof global !== 'undefined' ? global :
	    typeof window !== 'undefined' ? window : {}
	var minDoc = __webpack_require__(16);

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
/* 3 */
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
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	var DataSet = __webpack_require__(1)

	module.exports = addEvent

	function addEvent(target, type, handler) {
	    var ds = DataSet(target)
	    var events = ds[type]

	    if (!events) {
	        ds[type] = handler
	    } else if (Array.isArray(events)) {
	        if (events.indexOf(handler) === -1) {
	            events.push(handler)
	        }
	    } else if (events !== handler) {
	        ds[type] = [events, handler]
	    }
	}


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	var globalDocument = __webpack_require__(2)
	var DataSet = __webpack_require__(1)
	var createStore = __webpack_require__(12)

	var addEvent = __webpack_require__(4)
	var removeEvent = __webpack_require__(15)
	var ProxyEvent = __webpack_require__(14)

	var HANDLER_STORE = createStore()

	module.exports = DOMDelegator

	function DOMDelegator(document) {
	    if (!(this instanceof DOMDelegator)) {
	        return new DOMDelegator(document);
	    }

	    document = document || globalDocument

	    this.target = document.documentElement
	    this.events = {}
	    this.rawEventListeners = {}
	    this.globalListeners = {}
	}

	DOMDelegator.prototype.addEventListener = addEvent
	DOMDelegator.prototype.removeEventListener = removeEvent

	DOMDelegator.allocateHandle =
	    function allocateHandle(func) {
	        var handle = new Handle()

	        HANDLER_STORE(handle).func = func;

	        return handle
	    }

	DOMDelegator.transformHandle =
	    function transformHandle(handle, broadcast) {
	        var func = HANDLER_STORE(handle).func

	        return this.allocateHandle(function (ev) {
	            broadcast(ev, func);
	        })
	    }

	DOMDelegator.prototype.addGlobalEventListener =
	    function addGlobalEventListener(eventName, fn) {
	        var listeners = this.globalListeners[eventName] || [];
	        if (listeners.indexOf(fn) === -1) {
	            listeners.push(fn)
	        }

	        this.globalListeners[eventName] = listeners;
	    }

	DOMDelegator.prototype.removeGlobalEventListener =
	    function removeGlobalEventListener(eventName, fn) {
	        var listeners = this.globalListeners[eventName] || [];

	        var index = listeners.indexOf(fn)
	        if (index !== -1) {
	            listeners.splice(index, 1)
	        }
	    }

	DOMDelegator.prototype.listenTo = function listenTo(eventName) {
	    if (!(eventName in this.events)) {
	        this.events[eventName] = 0;
	    }

	    this.events[eventName]++;

	    if (this.events[eventName] !== 1) {
	        return
	    }

	    var listener = this.rawEventListeners[eventName]
	    if (!listener) {
	        listener = this.rawEventListeners[eventName] =
	            createHandler(eventName, this)
	    }

	    this.target.addEventListener(eventName, listener, true)
	}

	DOMDelegator.prototype.unlistenTo = function unlistenTo(eventName) {
	    if (!(eventName in this.events)) {
	        this.events[eventName] = 0;
	    }

	    if (this.events[eventName] === 0) {
	        throw new Error("already unlistened to event.");
	    }

	    this.events[eventName]--;

	    if (this.events[eventName] !== 0) {
	        return
	    }

	    var listener = this.rawEventListeners[eventName]

	    if (!listener) {
	        throw new Error("dom-delegator#unlistenTo: cannot " +
	            "unlisten to " + eventName)
	    }

	    this.target.removeEventListener(eventName, listener, true)
	}

	function createHandler(eventName, delegator) {
	    var globalListeners = delegator.globalListeners;
	    var delegatorTarget = delegator.target;

	    return handler

	    function handler(ev) {
	        var globalHandlers = globalListeners[eventName] || []

	        if (globalHandlers.length > 0) {
	            var globalEvent = new ProxyEvent(ev);
	            globalEvent.currentTarget = delegatorTarget;
	            callListeners(globalHandlers, globalEvent)
	        }

	        findAndInvokeListeners(ev.target, ev, eventName)
	    }
	}

	function findAndInvokeListeners(elem, ev, eventName) {
	    var listener = getListener(elem, eventName)

	    if (listener && listener.handlers.length > 0) {
	        var listenerEvent = new ProxyEvent(ev);
	        listenerEvent.currentTarget = listener.currentTarget
	        callListeners(listener.handlers, listenerEvent)

	        if (listenerEvent._bubbles) {
	            var nextTarget = listener.currentTarget.parentNode
	            findAndInvokeListeners(nextTarget, ev, eventName)
	        }
	    }
	}

	function getListener(target, type) {
	    // terminate recursion if parent is `null`
	    if (target === null) {
	        return null
	    }

	    var ds = DataSet(target)
	    // fetch list of handler fns for this event
	    var handler = ds[type]
	    var allHandler = ds.event

	    if (!handler && !allHandler) {
	        return getListener(target.parentNode, type)
	    }

	    var handlers = [].concat(handler || [], allHandler || [])
	    return new Listener(target, handlers)
	}

	function callListeners(handlers, ev) {
	    handlers.forEach(function (handler) {
	        if (typeof handler === "function") {
	            handler(ev)
	        } else if (typeof handler.handleEvent === "function") {
	            handler.handleEvent(ev)
	        } else if (handler.type === "dom-delegator-handle") {
	            HANDLER_STORE(handler).func(ev)
	        } else {
	            throw new Error("dom-delegator: unknown handler " +
	                "found: " + JSON.stringify(handlers));
	        }
	    })
	}

	function Listener(target, handlers) {
	    this.currentTarget = target
	    this.handlers = handlers
	}

	function Handle() {
	    this.type = "dom-delegator-handle"
	}


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	var Individual = __webpack_require__(3)
	var cuid = __webpack_require__(7)
	var globalDocument = __webpack_require__(2)

	var DOMDelegator = __webpack_require__(5)

	var versionKey = "12"
	var cacheKey = "__DOM_DELEGATOR_CACHE@" + versionKey
	var cacheTokenKey = "__DOM_DELEGATOR_CACHE_TOKEN@" + versionKey
	var delegatorCache = Individual(cacheKey, {
	    delegators: {}
	})
	var commonEvents = [
	    "blur", "change", "click",  "contextmenu", "dblclick",
	    "error","focus", "focusin", "focusout", "input", "keydown",
	    "keypress", "keyup", "load", "mousedown", "mouseup",
	    "resize", "select", "submit", "touchcancel",
	    "touchend", "touchstart", "unload"
	]

	/*  Delegator is a thin wrapper around a singleton `DOMDelegator`
	        instance.

	    Only one DOMDelegator should exist because we do not want
	        duplicate event listeners bound to the DOM.

	    `Delegator` will also `listenTo()` all events unless
	        every caller opts out of it
	*/
	module.exports = Delegator

	function Delegator(opts) {
	    opts = opts || {}
	    var document = opts.document || globalDocument

	    var cacheKey = document[cacheTokenKey]

	    if (!cacheKey) {
	        cacheKey =
	            document[cacheTokenKey] = cuid()
	    }

	    var delegator = delegatorCache.delegators[cacheKey]

	    if (!delegator) {
	        delegator = delegatorCache.delegators[cacheKey] =
	            new DOMDelegator(document)
	    }

	    if (opts.defaultEvents !== false) {
	        for (var i = 0; i < commonEvents.length; i++) {
	            delegator.listenTo(commonEvents[i])
	        }
	    }

	    return delegator
	}

	Delegator.allocateHandle = DOMDelegator.allocateHandle;
	Delegator.transformHandle = DOMDelegator.transformHandle;


/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

	/**
	 * cuid.js
	 * Collision-resistant UID generator for browsers and node.
	 * Sequential for fast db lookups and recency sorting.
	 * Safe for element IDs and server-side lookups.
	 *
	 * Extracted from CLCTR
	 * 
	 * Copyright (c) Eric Elliott 2012
	 * MIT License
	 */

	/*global window, navigator, document, require, process, module */
	(function (app) {
	  'use strict';
	  var namespace = 'cuid',
	    c = 0,
	    blockSize = 4,
	    base = 36,
	    discreteValues = Math.pow(base, blockSize),

	    pad = function pad(num, size) {
	      var s = "000000000" + num;
	      return s.substr(s.length-size);
	    },

	    randomBlock = function randomBlock() {
	      return pad((Math.random() *
	            discreteValues << 0)
	            .toString(base), blockSize);
	    },

	    safeCounter = function () {
	      c = (c < discreteValues) ? c : 0;
	      c++; // this is not subliminal
	      return c - 1;
	    },

	    api = function cuid() {
	      // Starting with a lowercase letter makes
	      // it HTML element ID friendly.
	      var letter = 'c', // hard-coded allows for sequential access

	        // timestamp
	        // warning: this exposes the exact date and time
	        // that the uid was created.
	        timestamp = (new Date().getTime()).toString(base),

	        // Prevent same-machine collisions.
	        counter,

	        // A few chars to generate distinct ids for different
	        // clients (so different computers are far less
	        // likely to generate the same id)
	        fingerprint = api.fingerprint(),

	        // Grab some more chars from Math.random()
	        random = randomBlock() + randomBlock();

	        counter = pad(safeCounter().toString(base), blockSize);

	      return  (letter + timestamp + counter + fingerprint + random);
	    };

	  api.slug = function slug() {
	    var date = new Date().getTime().toString(36),
	      counter,
	      print = api.fingerprint().slice(0,1) +
	        api.fingerprint().slice(-1),
	      random = randomBlock().slice(-2);

	      counter = safeCounter().toString(36).slice(-4);

	    return date.slice(-2) + 
	      counter + print + random;
	  };

	  api.globalCount = function globalCount() {
	    // We want to cache the results of this
	    var cache = (function calc() {
	        var i,
	          count = 0;

	        for (i in window) {
	          count++;
	        }

	        return count;
	      }());

	    api.globalCount = function () { return cache; };
	    return cache;
	  };

	  api.fingerprint = function browserPrint() {
	    return pad((navigator.mimeTypes.length +
	      navigator.userAgent.length).toString(36) +
	      api.globalCount().toString(36), 4);
	  };

	  // don't change anything from here down.
	  if (app.register) {
	    app.register(namespace, api);
	  } else if (true) {
	    module.exports = api;
	  } else {
	    app[namespace] = api;
	  }

	}(this.applitude || this));


/***/ },
/* 8 */
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
/* 9 */
/***/ function(module, exports, __webpack_require__) {

	var hiddenStore = __webpack_require__(10);

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
/* 10 */
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
/* 11 */
/***/ function(module, exports, __webpack_require__) {

	if (typeof Object.create === 'function') {
	  // implementation from standard node.js 'util' module
	  module.exports = function inherits(ctor, superCtor) {
	    ctor.super_ = superCtor
	    ctor.prototype = Object.create(superCtor.prototype, {
	      constructor: {
	        value: ctor,
	        enumerable: false,
	        writable: true,
	        configurable: true
	      }
	    });
	  };
	} else {
	  // old school shim for old browsers
	  module.exports = function inherits(ctor, superCtor) {
	    ctor.super_ = superCtor
	    var TempCtor = function () {}
	    TempCtor.prototype = superCtor.prototype
	    ctor.prototype = new TempCtor()
	    ctor.prototype.constructor = ctor
	  }
	}


/***/ },
/* 12 */
/***/ function(module, exports, __webpack_require__) {

	var hiddenStore = __webpack_require__(13);

	module.exports = createStore;

	function createStore() {
	    var key = {};

	    return function (obj) {
	        if ((typeof obj !== 'object' || obj === null) &&
	            typeof obj !== 'function'
	        ) {
	            throw new Error('Weakmap-shim: Key must be object')
	        }

	        var store = obj.valueOf(key);
	        return store && store.identity === key ?
	            store : hiddenStore(obj, key);
	    };
	}


/***/ },
/* 13 */
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
/* 14 */
/***/ function(module, exports, __webpack_require__) {

	var inherits = __webpack_require__(11)

	var ALL_PROPS = [
	    "altKey", "bubbles", "cancelable", "ctrlKey",
	    "eventPhase", "metaKey", "relatedTarget", "shiftKey",
	    "target", "timeStamp", "type", "view", "which"
	]
	var KEY_PROPS = ["char", "charCode", "key", "keyCode"]
	var MOUSE_PROPS = [
	    "button", "buttons", "clientX", "clientY", "layerX",
	    "layerY", "offsetX", "offsetY", "pageX", "pageY",
	    "screenX", "screenY", "toElement"
	]

	var rkeyEvent = /^key|input/
	var rmouseEvent = /^(?:mouse|pointer|contextmenu)|click/

	module.exports = ProxyEvent

	function ProxyEvent(ev) {
	    if (!(this instanceof ProxyEvent)) {
	        return new ProxyEvent(ev)
	    }

	    if (rkeyEvent.test(ev.type)) {
	        return new KeyEvent(ev)
	    } else if (rmouseEvent.test(ev.type)) {
	        return new MouseEvent(ev)
	    }

	    for (var i = 0; i < ALL_PROPS.length; i++) {
	        var propKey = ALL_PROPS[i]
	        this[propKey] = ev[propKey]
	    }

	    this._rawEvent = ev
	    this._bubbles = false;
	}

	ProxyEvent.prototype.preventDefault = function () {
	    this._rawEvent.preventDefault()
	}

	ProxyEvent.prototype.startPropagation = function () {
	    this._bubbles = true;
	}

	function MouseEvent(ev) {
	    for (var i = 0; i < ALL_PROPS.length; i++) {
	        var propKey = ALL_PROPS[i]
	        this[propKey] = ev[propKey]
	    }

	    for (var j = 0; j < MOUSE_PROPS.length; j++) {
	        var mousePropKey = MOUSE_PROPS[j]
	        this[mousePropKey] = ev[mousePropKey]
	    }

	    this._rawEvent = ev
	}

	inherits(MouseEvent, ProxyEvent)

	function KeyEvent(ev) {
	    for (var i = 0; i < ALL_PROPS.length; i++) {
	        var propKey = ALL_PROPS[i]
	        this[propKey] = ev[propKey]
	    }

	    for (var j = 0; j < KEY_PROPS.length; j++) {
	        var keyPropKey = KEY_PROPS[j]
	        this[keyPropKey] = ev[keyPropKey]
	    }

	    this._rawEvent = ev
	}

	inherits(KeyEvent, ProxyEvent)


/***/ },
/* 15 */
/***/ function(module, exports, __webpack_require__) {

	var DataSet = __webpack_require__(1)

	module.exports = removeEvent

	function removeEvent(target, type, handler) {
	    var ds = DataSet(target)
	    var events = ds[type]

	    if (!events) {
	        return
	    } else if (Array.isArray(events)) {
	        var index = events.indexOf(handler)
	        if (index !== -1) {
	            events.splice(index, 1)
	        }
	    } else if (events === handler) {
	        ds[type] = null
	    }
	}


/***/ },
/* 16 */
/***/ function(module, exports, __webpack_require__) {

	/* (ignored) */

/***/ }
/******/ ])""" :: forall delegator. delegator
