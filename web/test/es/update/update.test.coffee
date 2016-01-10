exec = (require 'child_process').exec
path = require 'path'

Promise = require 'bluebird'
expect = (require 'chai').expect

getYamlVersion = (require '../../../es/common/utils').getYamlVersion
getDBVersion = (require '../../../es/es_status').getDBVersion

describe 'update', ->
  it 'dbVersion should equal yaml version after update', (done) ->
    updatePath = path.resolve "#{__dirname}/../../../es/update/update.coffee" 
    exec "coffee #{updatePath}", (err, stdout, stderr) -> 
      getDBVersion()
      .then (dbVersion) ->
        yamlVersion = getYamlVersion "#{__dirname}/../../../es/update/version.yml"
        expect(dbVersion).to.deep.equal(yamlVersion)
      .nodeify done
