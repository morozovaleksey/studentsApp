App.module "StudentApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.StudentItemView extends App.Base.ItemView
    events:
      'click #edit-student': 'editStudent'
    template: '#row-template'
    tagName: 'tr'


    editStudent: ->
      console.log "Edit"

  class List.StudentsCompositeView extends App.Base.CompositeView

    childView: List.StudentItemView
    template: "#grid-template"
    childViewContainer: "#test-students"

  class List.LayoutView extends App.Base.LayoutView
    initialize: ->

    events:
      'submit form': 'submitForm'

    submitForm: (e) ->
      e.preventDefault()
      console.log "Submit"
      @studentModel.set
        "last_name": @$el.find('#input-last-name').val()
        "name": @$el.find('#input-name').val()
        "group": @$el.find('#input-group').val()
        "email": @$el.find('#input-Email').val()
        "date_of_birth": @$el.find('#input-date-of-birth').val()
      @trigger 'submit:button:click'

    editStudent: ->
      console.log "Edit"
