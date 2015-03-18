App.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.LayoutView extends App.Base.LayoutView
    initialize: ->

    events:
      'click #main': 'mainClick'
      'click #report': 'reportClick'

#    mainClick: (e) ->
#      App.redirect(Routes.root_path())
#
#    reportClick: (e) ->
#      App.redirect(Routes.academic_report_path())






