Backbone.ajax = ->
  Backbone.$.ajaxSetup.call Backbone.$, beforeSend: (jqXHR) ->
    token = $('meta[name="csrf-token"]').attr('content')
    jqXHR.setRequestHeader("X-CSRF-Token", token)

  Backbone.$.ajax.apply(Backbone.$, arguments)