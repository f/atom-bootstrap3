AtomBootstrap3View = require './atom-bootstrap3-view'

module.exports =
  atomBootstrap3View: null

  activate: (state) ->
    @atomBootstrap3View = new AtomBootstrap3View(state.atomBootstrap3ViewState)

  deactivate: ->
    @atomBootstrap3View.destroy()

  serialize: ->
    atomBootstrap3ViewState: @atomBootstrap3View.serialize()
