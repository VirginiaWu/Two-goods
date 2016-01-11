path = require 'path'

es_client = (require '../../es/es_client').es_client
es_status = require '../../es/es_status'
Promise = require 'bluebird'

sinon = require 'sinon'
expect = (require 'chai').expect

describe 'getDBVersion', ->
  getDBVersion = es_status.getDBVersion
  it 'mock server reject', ->
    sinon.stub(es_client, 'getSource').returns(Promise.reject())
    getDBVersion()
    .then (version) ->
      expect(version).to.deep.equal(
        version: 0
      )
    .then ->
      es_client.getSource.restore()

describe 'getUpdateCmd', ->
  it 'should return coffee', ->
    updateCmd = es_status.getUpdateCmd()
    targetPath = path.resolve "#{__dirname}/../../es/update/update.coffee"
    expect(updateCmd).to.equal("./node_modules/.bin/coffee #{targetPath}")
