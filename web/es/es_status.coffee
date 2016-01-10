utils = require './common/utils'

promiseWhile = utils.promiseWhile

es_client = (require './es_client').es_client

pingEs = ->
  console.log 'Ping...'
  ready = false
  promiseWhile ->
    return not ready
  , ->
    es_client.ping
      hello: "elasticsearch"
    .then ->
      console.log 'Ping successfully...'
      ready = true
    .catch ->
      console.log 'Ping failed...'
      ready = false 
    .delay 500

getDBVersion = ->
  es_client.getSource
    index: 'version'
    type: 'ver'
    id: 'v'
  .then (version) ->
    version
  .catch (err) ->
    console.log 'Get database version err'
    version: 0

module.exports =
  pingEs: pingEs
  getDBVersion: getDBVersion
