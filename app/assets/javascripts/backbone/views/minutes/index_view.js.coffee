CptCompass.Views.Minutes ||= {}

class CptCompass.Views.Minutes.IndexView extends Backbone.View
  template: JST["backbone/templates/minutes/index"]

  initialize: () ->
    @options.minutes.bind('reset', @addAll)

  addAll: () =>
    @options.minutes.each(@addOne)

  addOne: (minute) =>
    view = new CptCompass.Views.Minutes.MinuteView({model : minute})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(minutes: @options.minutes.toJSON() ))
    @addAll()

    return this
