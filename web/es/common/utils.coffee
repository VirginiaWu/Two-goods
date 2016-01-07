fs = require 'fs'
yaml = require 'js-yaml'
Promise = require 'bluebird'


promiseWhile = (condition, action) ->
  return new Promise (resolve, reject) ->
    _loop = ->
      if not condition()
        return resolve()
      Promise.resolve(action())
      .then(_loop)
      .catch (err) ->
        reject err

    process.nextTick _loop
    return

getYamlVersion = (_path) ->
  Promise.resolve(
    yaml.safeLoad fs.readFileSync(_path, 'utf-8')
  ).then (version) ->
    version
  .catch (err) ->
    console.log 'getYamlVersion error', err
    version:0



module.exports =
  promiseWhile: promiseWhile
  getYamlVersion: getYamlVersion
