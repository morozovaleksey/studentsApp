App.module "AcademicReportApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Base.Controller

    initialize: (options) ->
      console.log "AcademicReportApp"
      @showReport()

    getReportCompositeView: (options) ->
      new Show.ReportCompositeView options

    showReport: ->
      @reportCollection = App.request "report:collection"
      console.log @reportCollection.fetch
        reset: true,
        sort:false,
        type: "post",
        success: =>
          console.log "Success Collection"
          reportShowView =  @getReportCompositeView collection: @reportCollection
          reportShowView.render()
          $("#js-table-all-users").html(reportShowView.el)


