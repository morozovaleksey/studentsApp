App.module "StudentApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.StudentItemView extends App.Base.ItemView
    initialize: ->
    events:
      'click #edit-student': 'editStudent'
      'click #delete-student': 'deleteStudent'

    template: '#row-template'
    tagName: 'tr'

    editStudent: ->
      $("#input-last-name-edit").val(@model.attributes.last_name)
      $("#input-name-edit").val(@model.attributes.name)
      $("#input-group-edit").val(@model.attributes.group)
      $("#input-email-edit").val(@model.attributes.email)
      $("#input-date-of-birth-edit").val(@model.attributes.date_of_birth)
      $("#input-id-edit").val(@model.attributes.id)

    deleteStudent: ->
     console.log @model.destroy
       url: Routes.delete_student_path({ format: 'json', id: @model.id }),
       type: "post",
       success: =>
         console.log "destroy"

  class List.StudentsCompositeView extends App.Base.CompositeView

    childView: List.StudentItemView
    template: "#grid-template"
    childViewContainer: "#test-students"

  class List.LayoutView extends App.Base.LayoutView
    initialize: ->

    events:
      'submit #form-create-new-student': 'submitForm'
      'submit #form-edit-student': 'editStudent'

    submitForm: (e) ->
      e.preventDefault()
      console.log "Submit"
      console.log @studentModel
      @studentModel.set
        "id": @$el.find('#input-id').val()
        "last_name": @$el.find('#input-last-name').val()
        "name": @$el.find('#input-name').val()
        "group": @$el.find('#input-group').val()
        "email": @$el.find('#input-email').val()
        "date_of_birth": @$el.find('#input-date-of-birth').val()
      @trigger 'submit:button:click'

    editStudent: (e)->
      e.preventDefault()
      @studentModel.set
        "id": @$el.find('#input-id-edit').val()
        "last_name": @$el.find('#input-last-name-edit').val()
        "name": @$el.find('#input-name-edit').val()
        "group": @$el.find('#input-group-edit').val()
        "email": @$el.find('#input-email-edit').val()
        "date_of_birth": @$el.find('#input-date-of-birth-edit').val()
      @trigger 'submit:edit:button:click'



