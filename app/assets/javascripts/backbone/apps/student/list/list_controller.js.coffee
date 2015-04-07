App.module "StudentApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Base.Controller
    initialize: ->
      console.log "List"
      @layoutView = @getLayoutView()
      @createStudent(@layoutView)
      @editStudent(@layoutView)
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
        console.log "Create"
        console.log @studentModel.save @studentModel.attributes,
          type: "post"
          success: (model, response) =>
            console.log "Success Model"
            @showStudents()
            alert "Студент успешно добавлен"
            $('#myModal').modal('hide')
            App.vent.trigger "empty:value:student"
          error: (model, response) =>
            console.log "Error"

    editStudent: (layoutView) ->
#      @studentModel = App.request "student:model"
#      layoutView.studentModel = @studentModel
      layoutView.on 'submit:edit:button:click', =>
        console.log "EDIT"
        console.log @studentModel.attributes
        console.log @studentModel.save @studentModel.attributes,
          type: "post"
          success: (model, response) =>
            console.log "Success Model"
            @showStudents()
          error: (model, response) =>
            console.log "Error"

    showStudents: ->
      @studentCollection = App.request "student:collection"
      console.log @studentCollection.fetch
        reset: true,
        sort:false,
        type: "post",
        success: =>
          console.log "Success Collection"
          studentsListView =  @getStudentsCompositeView collection: @studentCollection
          studentsListView.render()
          $("#js-table-all-users").html(studentsListView.el)


