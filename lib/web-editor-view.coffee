{$, ScrollView} = require 'atom-space-pen-views'

# View that renders the image of an {WebEditor}.
module.exports =
class WebEditorView extends ScrollView

  @content: ->
    @div class: 'web-view-area', =>
      @iframe id: 'web-view-iframe', name: 'disable-x-frame-options', frameborder: 0, src: ""

  constructor: (uri) ->
    super

    loc = location.pathname;
    dir = loc.substring(0, loc.lastIndexOf('/'));

    console.log

    @.find('#web-view-iframe').attr('src', __dirname + '/../icestudio/icestudio.html')
    @uri = uri.split('/').pop()

  reloadIframe: () ->
    @.find('#web-view-iframe')[0].contentWindow.location.reload();

  @deserialize: ({uri}) ->

  # Gets the title of the page based on the uri
  #
  # Returns a {String}
  getTitle: ->
    @uri || 'Uri-web'

  # Serializes this view
  #
  serialize: ->
    {@uri, deserializer: @constructor.name}

  # Retrieves this view's pane.
  #
  # Returns a {Pane}.
  getPane: ->
    @parents('.pane').view()
