utils = require './common/utils'

promiseWhile = utils.promiseWhile

es_client = (require './es_client').es_client

ready = false
pingEs = ->
  console.log 'Ping...'
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


module.exports =
  pingEs: pingEs
