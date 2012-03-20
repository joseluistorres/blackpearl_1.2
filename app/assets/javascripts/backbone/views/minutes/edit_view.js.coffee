CptCompass.Views.Minutes ||= {}

class CptCompass.Views.Minutes.EditView extends Backbone.View
  template : JST["backbone/templates/minutes/edit"]

  events :
    "submit #edit-minute" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (minute) =>
        @model = minute
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
