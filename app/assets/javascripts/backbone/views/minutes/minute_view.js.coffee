CptCompass.Views.Minutes ||= {}

class CptCompass.Views.Minutes.MinuteView extends Backbone.View
  template: JST["backbone/templates/minutes/minute"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
