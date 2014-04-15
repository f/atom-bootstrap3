AtomBootstrap3 = require '../lib/atom-bootstrap3'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomBootstrap3", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('atomBootstrap3')

  describe "when the atom-bootstrap3:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.atom-bootstrap3')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'atom-bootstrap3:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.atom-bootstrap3')).toExist()
        atom.workspaceView.trigger 'atom-bootstrap3:toggle'
        expect(atom.workspaceView.find('.atom-bootstrap3')).not.toExist()
