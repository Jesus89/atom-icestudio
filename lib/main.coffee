path = require 'path'
_ = require 'underscore-plus'
WebEditorView = require './web-editor-view'
{CompositeDisposable} = require 'atom'

module.exports =
  activate: ->
    @disposables = new CompositeDisposable
    @disposables.add atom.workspace.addOpener(openURI)

  deactivate: ->
    @disposables.dispose()

iceExtension = ['.ice']
openURI = (uriToOpen) ->
  uriExtension = path.extname(uriToOpen).toLowerCase()
  if _.include(iceExtension, uriExtension)
    new WebEditorView(uriToOpen)
