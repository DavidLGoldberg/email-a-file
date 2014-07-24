EmailAFileView = require './email-a-file-view'

module.exports =
  emailAFileView: null

  activate: (state) ->
    @emailAFileView = new EmailAFileView(state.emailAFileViewState)

  deactivate: ->
    @emailAFileView.destroy()

  serialize: ->
    emailAFileViewState: @emailAFileView.serialize()
