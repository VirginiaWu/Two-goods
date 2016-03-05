Promise = require 'bluebird'
UpdateSingleton = (require '../Update').getSingleton()
module.exports = ->
  Promise.join(
    UpdateSingleton.execCommand("ls")
    UpdateSingleton.execCommand("ls")
  ).then ->
    doc:
      version: 2
  .catch ->
    doc:
      version: 1
