Registry        = require './registry.coffee'
RegistryReader  = require './registry-reader.coffee'

reader = new RegistryReader()

module.exports = new Registry reader.fromFile('config.json')
