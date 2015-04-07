App.module "StudentApp", (StudentApp, App, Backbone, Marionette, $, _) ->

  class StudentApp.AppRouter extends App.Base.AppRouter
    initialize: ->
      console.log "Student Router"
      @createStudent() if 'welcome' == App.params.controller
#    routes: (r = []) ->
#      r[''] = 'createStudent'
##      r[Routes.list_students_path().substr(1)] = 'listStudents'
#      r
    createStudent: ->
      new StudentApp.List.Controller

  App.addInitializer ->
    new StudentApp.AppRouter
