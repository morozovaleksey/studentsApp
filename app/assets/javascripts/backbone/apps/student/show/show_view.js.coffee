App.module "StudentApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.LayoutView extends App.Base.LayoutView
#    template: ".container"
    initialize: ->
#      @editStudent()
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




