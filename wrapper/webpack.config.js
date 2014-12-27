var webpack = require('webpack');
module.exports = {
  plugins: [
    new webpack.optimize.OccurenceOrderPlugin(true)
  ]
}
