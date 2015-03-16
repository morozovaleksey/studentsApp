App.module "StudentApp", (StudentApp, App, Backbone, Marionette, $, _) ->

  class StudentApp.AppRouter extends App.Base.AppRouter
    initialize: ->

    routes: (r = []) ->
      r[''] = 'createStudent'
#      r[Routes.list_students_path().substr(1)] = 'listStudents'
      r

    createStudent: ->
#      new StudentApp.Show.Controller
      new StudentApp.List.Controller
    listStudents: ->
      new StudentApp.List.Controller
  #    searchEfficiency: ->
  #      new MainApp.SearchEfficiency.Controller
  #    googleResponse: ->
  #      new MainApp.GoogleResponse.Controller
  #    comparisonQueries: ->
  #      new MainApp.ComparisonQuery.Controller

  App.addInitializer ->
    new StudentApp.AppRouter