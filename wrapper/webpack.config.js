var path = require('path');
var webpack = require('webpack');

require('json-loader');

module.exports = {
  entry: {
    virtualDOM: "./virtual-dom.js",
    stringify: "./stringify.js",
    htmlToDOM: "./html-to-vdom.js"
  },
  output: {
    path: path.join(__dirname, "bundle"),
    filename: "[name].js",
    library: "exports"
  },
  plugins: [
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.OccurenceOrderPlugin(true)
  ],
  module: {
    loaders: [
      { test: /\.json$/, loader: "json" }
    ]
  }
}
