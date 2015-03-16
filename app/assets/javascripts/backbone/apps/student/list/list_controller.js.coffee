App.module "StudentApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Base.Controller
    initialize: ->
      console.log "List"
      @layoutView = @getLayoutView()
      @createStudent(@layoutView)
      @showStudents()

    getLayoutView: ->
      new List.LayoutView
        el: $('#new-student')
    getStudentsCompositeView: (options) ->
      new List.StudentsCompositeView options

    createStudent: (layoutView) ->
      @studentModel = App.request "student:model"
      layoutView.studentModel = @studentModel
      layoutView.on 'submit:button:click', =>
        @studentModel.attributes
        @studentModel.save @studentModel.attributes,
          type: "post"
          success: (model, response) =>
            console.log "Success Model"
            @showStudents()
          error: (model, response) =>
            console.log "Error"

    showStudents: ->
      @studentCollection = App.request "student:collection"
      @studentCollection.fetch
        reset: false,
        type: "post",
        success: =>
          console.log "Success Collection"
          studentsListView =  @getStudentsCompositeView collection: @studentCollection
          studentsListView.render()
          $("#js-table-all-users").html(studentsListView.el)

