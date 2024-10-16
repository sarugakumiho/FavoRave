const { environment } = require('@rails/webpacker')

module.exports = environment

// Bootstrap・レビュー機能　導入用
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)