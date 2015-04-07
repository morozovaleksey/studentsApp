App.module "AcademicReportApp", (AcademicReportApp, App, Backbone, Marionette, $, _) ->

  class AcademicReportApp.AppRouter extends App.Base.AppRouter
    initialize: ->

    routes: (r = []) ->
      r[Routes.academic_report_path().substr(1)] = 'showReport'
      r

    showReport: ->
      console.log "ShowREport"
      new AcademicReportApp.Show.Controller


  App.addInitializer ->
    new AcademicReportApp.AppRouter