App.module "AcademicReportApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.ReportItemView extends App.Base.ItemView
    initialize: ->
    events:
      'click #edit-student': 'editStudent'
      'click #delete-student': 'deleteStudent'

    template: '#row-template'
    tagName: 'tr'


  class Show.ReportCompositeView extends App.Base.CompositeView

    childView: Show.ReportItemView
    template: "#grid-template"
    childViewContainer: "#test-students"