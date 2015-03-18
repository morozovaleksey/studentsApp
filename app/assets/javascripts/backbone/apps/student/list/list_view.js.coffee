App.module "StudentApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.StudentItemView extends App.Base.ItemView
    initialize: ->
    events:
      'click #edit-student': 'editStudent'
      'click #delete-student': 'deleteStudent'

    template: '#row-template'
    tagName: 'tr'

    editStudent: ->
      console.log @model.attributes
      $("#input-last-name-edit").val(@model.attributes.last_name)
      $("#input-name-edit").val(@model.attributes.name)
#      $("#input-group-edit").val(@model.attributes.group_id)
      $("#select-group-edit option:selected").text(@model.attributes.group_name)
      $("#input-email-edit").val(@model.attributes.email)
      $("#input-date-of-birth-edit").val(@model.attributes.date_of_birth)
      $("#input-id-edit").val(@model.attributes.id)

    deleteStudent: ->
      if confirm("Удалить запись?") == true
        console.log @model.destroy
          url: Routes.delete_student_path({ format: 'json', id: @model.id }),
          type: "post",
          success: =>
            console.log "Удалена"

  class List.StudentsCompositeView extends App.Base.CompositeView

    childView: List.StudentItemView
    template: "#grid-template"
    childViewContainer: "#test-students"

  class List.LayoutView extends App.Base.LayoutView
    initialize: ->
      @selectGroup()

    events:
      'submit #form-create-new-student': 'submitForm'
      'submit #form-edit-student': 'editStudent'
      'click #myModal': 'emptyValue'

    submitForm: (e) ->
      e.preventDefault()
      console.log "Submit"
      console.log @studentModel
      @studentModel.set
        "id": @$el.find('#input-id').val()
        "last_name": @$el.find('#input-last-name').val()
        "name": @$el.find('#input-name').val()
        "group_id": @$el.find('#select-group option:selected').val()
        "email": @$el.find('#input-email').val()
        "date_of_birth": @$el.find('#input-date-of-birth').val()
      @trigger 'submit:button:click'
      App.vent.on "empty:value:student", =>
        @$el.find('#input-last-name').val('')
        @$el.find('#input-name').val('')
        @$el.find('#input-email').val('')
        @$el.find('#input-date-of-birth').val('')

    editStudent: (e)->
      e.preventDefault()
      @studentModel.set
        "id": @$el.find('#input-id-edit').val()
        "last_name": @$el.find('#input-last-name-edit').val()
        "name": @$el.find('#input-name-edit').val()
        "group_id": @$el.find('#select-group-edit option:selected').val()
        "email": @$el.find('#input-email-edit').val()
        "date_of_birth": @$el.find('#input-date-of-birth-edit').val()
      @trigger 'submit:edit:button:click'

    selectGroup: ->
      @$el.find('#select-group').change =>
        console.log "Select Group"

    emptyValue: ->
      console.log "ClickModal"



