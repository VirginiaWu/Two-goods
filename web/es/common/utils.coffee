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

module.exports =
  promiseWhile: promiseWhile
