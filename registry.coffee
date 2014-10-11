_ = require 'lodash'

class Registry

  rNodesDelimiter: /\.\.*/

  constructor: (@data) ->
    unless _.isPlainObject data
      # do log
      console.log 'Given value is not an object. Will use {} instead'
      @data = {}

  get: (path) ->
    nodes = String(path).split @rNodesDelimiter
    ref = @data

    while node = nodes.pop()
      unless ref?
        # do exception
        throw 'No error text'
      ref = ref[node]

    ref

module.exports = Registry
