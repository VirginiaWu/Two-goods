Promise = require 'bluebird'

module.exports = ->
  Promise.resolve(
  ).then ->
    version: 1
  .catch ->
    versio: 0
