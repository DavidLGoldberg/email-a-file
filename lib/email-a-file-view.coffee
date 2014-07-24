{View} = require 'atom'

module.exports =
class EmailAFileView extends View
  @content: ->
    @div class: 'email-a-file overlay from-top', =>
      @div "The EmailAFile package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "email-a-file:email-active-file", => @emailActiveFile()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  emailActiveFile: ->
    console.log "EmailAFileView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
