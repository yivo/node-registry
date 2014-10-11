unless GLOBAL.rootDirectory
  # do exception
  throw 'No error text'

fs = require 'fs'

class RegistryReader

  rJsonFile: /\.json$/
  rNeighborFilename: /^\.\//

  fromFile: (filename) ->
    filename = String(filename).replace @rNeighborFilename, ''

    if filename.indexOf('/') < 0
      filename = rootDirectory + '/' + filename

    # do exception
    throw "File '#{filename}' not exists!" unless @__fileExists filename

    if @rJsonFile.test filename
      @fromJson filename
    else
      #do exception
      throw 'File type not supported yet'

  fromJson: (filename) ->
    # do exception
    require filename

  __fileExists: (filename) ->
    fs.existsSync filename

  __readFile: (filename) ->
    fs.readFileSync filename, 'utf8'

module.exports = RegistryReader