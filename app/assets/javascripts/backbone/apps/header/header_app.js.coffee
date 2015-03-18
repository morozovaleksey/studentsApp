App.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->

  App.on 'start', (options) ->
    new HeaderApp.Show.Controller