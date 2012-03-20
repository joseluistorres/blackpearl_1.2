CptCompass.Views.Minutes ||= {}

class CptCompass.Views.Minutes.NewView extends Backbone.View
  template: JST["backbone/templates/minutes/new"]

  events:
    "submit #new-minute": "save"
    "click input#AutoSave" : "save"
    "blur input#content" : "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (minute) =>
        @model = minute
        window.location.hash = "/index"

      error: (minute, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
