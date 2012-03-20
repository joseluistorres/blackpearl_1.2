CptCompass.Views.Minutes ||= {}

class CptCompass.Views.Minutes.ShowView extends Backbone.View
  template: JST["backbone/templates/minutes/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
