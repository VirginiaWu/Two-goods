Promise = require 'bluebird'
elasticsearch = require 'elasticsearch'


es_host = ->
  if process.env.ES_IP and process.env.ES_PORT
    return process.env.ES_IP + ":" + process.env.ES_PORT
  "127.0.0.1:9200"

client = new elasticsearch.Client
  host: es_host()
  defer: ->
    return Promise.defer() 





module.exports =
  es_host: es_host
  es_client: client



