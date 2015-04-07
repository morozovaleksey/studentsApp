App.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Base.Controller
    initialize: ->
      layoutView = @getLayoutView()

    getLayoutView: ->
      new Show.LayoutView
        el: $('#header-region')