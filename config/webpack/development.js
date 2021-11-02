process.env.NODE_ENV = process.env.NODE_ENV || 'development'
const webpack = require("webpack") 

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
