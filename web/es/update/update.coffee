path = require 'path'

utils = require '../common/utils'
getYamlVersion = utils.getYamlVersion


getYamlVersion(path.resolve "#{__dirname}/version.yml")
.then (version) ->
  console.log version
