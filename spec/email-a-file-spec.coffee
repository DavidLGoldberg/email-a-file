{WorkspaceView} = require 'atom'
EmailAFile = require '../lib/email-a-file'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "EmailAFile", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('email-a-file')

  describe "when the email-a-file:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.email-a-file')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'email-a-file:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.email-a-file')).toExist()
        atom.workspaceView.trigger 'email-a-file:toggle'
        expect(atom.workspaceView.find('.email-a-file')).not.toExist()
