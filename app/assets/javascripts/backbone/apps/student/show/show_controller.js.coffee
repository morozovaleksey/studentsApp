App.module "StudentApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Base.Controller

    initialize: (options) ->
      console.log "Show"
      @layoutView = @getLayoutView()
      @createStudent(@layoutView)


    getLayoutView: ->
      new Show.LayoutView
        el: $('#new-student')

    createStudent: (layoutView) ->
      @studentModel = App.request "student:model"
      layoutView.studentModel = @studentModel
      layoutView.on 'submit:button:click', =>
        @studentModel.attributes
        @studentModel.save @studentModel.attributes,
          type: "post"
          success: (model, response) =>
            console.log "Success Model"
#            @showListStudent(layoutView)
          error: (model, response) =>
            console.log "Error"

#    showListStudent: (layoutView) ->
#      @studentCollection = App.request "student:collection"
#      @studentCollection.fetch
#        reset: false,
#        type: "post",
#        success: =>
#          console.log "Success Collection"
#          _(@studentCollection.models).each (value,key) =>
#            $("#all-students > tbody").append("<tr><td class='text-center'>#{value.attributes.id}
#            </td> <td>#{value.attributes.last_name}
#            </td> <td>#{value.attributes.name}
#            </td> <td>#{value.attributes.group}
#            </td> <td>#{value.attributes.email}
#            </td> <td>#{value.attributes.ip_address}
#            </td> <td><a class='btn btn-large btn-success' id='edit-student'>Изменить студента</a> </tr>");




