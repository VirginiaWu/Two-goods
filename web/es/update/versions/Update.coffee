es_client = (require '../../es_client').es_client
Promise = require 'bluebird'
exec = (require 'child_process').exec
execAsync = Promise.promisify(exec)


class Update
  singleton = null
  count = 0
  @getSingleton: ->
    singleton ?= new Update()

  constructor: ->
    @instanceCount = ++count

  putNewTemplate: (tempName, tempContent) ->
    es_client.indices.deleteTemplate
      name: tempName
    .finally ->
      es_client.indices.putTemplate
        name: tempName
        body: tempContent

  putMapping: (params) ->
    es_client.indices.putMapping(params)

  execCommand: (command) ->
    execAsync(command)
    .then (stdout) ->
      true

module.exports = Update
