App.module "Entities.Report", (Report, App, Backbone, Marionette, $, _) ->

  class Report.Model extends App.Base.Model

  class Report.Collection extends App.Base.Collection
    model: Report.Model
    url: ->
      Routes.report_path { format: 'json' }

  API =
    getReportCollection: (options) ->
      new Report.Collection(options)

  App.reqres.setHandler "report:collection", (options) ->
    API. getReportCollection(options)
