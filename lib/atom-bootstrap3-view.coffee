{View} = require 'atom'

module.exports =
class AtomBootstrap3View extends View
  @content: ->
    @div class: 'atom-bootstrap3 overlay from-top', =>
      @div "The AtomBootstrap3 package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "atom-bootstrap3:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AtomBootstrap3View was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
