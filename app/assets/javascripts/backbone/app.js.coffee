@App = do (Backbone, Marionette) ->

  App = new Marionette.Application()
  App.redirect = (path) ->
    window.location.replace path
  App.reloadPage = (options = {}) ->
    location.reload()
  App.on 'before:start', (options) ->
    App.params = options.params
  App.on 'start', ->
     if Backbone.history
       Backbone.history.start(pushState: true)


$(document).on 'ready', -> App.start(params: gon.params)

#$(document.body).on 'click', 'a', (e) ->
#  console.log "fffff"
#  e.preventDefault()
#  Backbone.history.navigate e.currentTarget.pathname, trigger: true


