path = require 'path'
Promise = require 'bluebird'


es_client = (require '../es_client').es_client
utils = require '../common/utils'
getYamlVersion = utils.getYamlVersion

es_status = (require '../es_status')


class Update
  constructor: (verSrc) ->
    @version = verSrc.version

  doUpdate: ->
    @updateVersion = "versions/#{@version}"
    @update = require "#{__dirname}/#{@updateVersion}"

    Promise.resolve(
      @update(@version)
    ).then (newVersion) ->
      es_client.index
        index: 'version'
        type: 'ver'
        id: 'v'
        body: newVersion
      .then ->
        newVersion

yamlVersion = getYamlVersion(path.resolve "#{__dirname}/version.yml")
doUpdate = (dbVersion) ->
  if dbVersion.version >= yamlVersion.version
    return process.exit 0
  update = new Update(dbVersion)
  update.doUpdate().then doUpdate

es_status.getDBVersion()
.then(doUpdate)
.catch (err) ->
  console.log 'Update version error...', err
  process.exit 1
