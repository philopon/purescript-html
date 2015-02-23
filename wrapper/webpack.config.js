var webpack = require('webpack');
require('json-loader');

module.exports = {
  plugins: [
    new webpack.optimize.OccurenceOrderPlugin(true)
  ],
  module: {
    loaders: [
      { test: /\.json$/, loader: "json" }
    ]
  }
}
