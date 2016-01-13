Promise = require 'bluebird'

module.exports = ->
  Promise.resolve(
  ).then ->
    doc:
      version: 1
  .catch ->
    doc:
      versio: 0
