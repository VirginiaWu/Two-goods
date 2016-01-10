path = require 'path'
utils = require '../../../es/common/utils'
chai = require 'chai'
expect = chai.expect


describe 'promiseWhile', ->
  promiseWhile = utils.promiseWhile
  it 'should loop 3 times', ->
    i = 0
    promiseWhile ->
      i < 3
    , ->
      i++ 
    .then ->
      expect(i).to.equal(3)


describe 'getYamlVersion', ->
  getYamlVersion = utils.getYamlVersion
  it 'should parse version.test.yml', ->
    version = getYamlVersion(path.resolve "#{__dirname}/../../../test/es/data/version.test.yml")
    expect(version).to.deep.equal({version: 0})
