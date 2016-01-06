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
