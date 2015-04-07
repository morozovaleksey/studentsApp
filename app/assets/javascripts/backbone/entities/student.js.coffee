App.module "Entities.Student", (Student, App, Backbone, Marionette, $, _) ->

  class Student.Model extends App.Base.Model
    url: ->
      Routes.new_student_path { format: 'json'}

  class Student.Collection extends App.Base.Collection
    model: Student.Model
    url: ->
      Routes.list_students_path { format: 'json' }

  API =
    getStudentModel: (options) ->
      new Student.Model(options)
    getStudentCollection: (options) ->
      new Student.Collection(options)

  App.reqres.setHandler "student:model", (options) ->
    API.getStudentModel(options)
  App.reqres.setHandler "student:collection", (options) ->
    API. getStudentCollection(options)
