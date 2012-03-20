class CptCompass.Routers.MinutesRouter extends Backbone.Router
  initialize: (options) ->
    @minutes = new CptCompass.Collections.MinutesCollection()
    @minutes.reset options.minutes

  routes:
    "/new"      : "newMinute"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newMinute: ->
    @view = new CptCompass.Views.Minutes.NewView(collection: @minutes)
    $("#minutes").html(@view.render().el)

  index: ->
    @view = new CptCompass.Views.Minutes.IndexView(minutes: @minutes)
    $("#minutes").html(@view.render().el)

  show: (id) ->
    minute = @minutes.get(id)

    @view = new CptCompass.Views.Minutes.ShowView(model: minute)
    $("#minutes").html(@view.render().el)

  edit: (id) ->
    minute = @minutes.get(id)

    @view = new CptCompass.Views.Minutes.EditView(model: minute)
    $("#minutes").html(@view.render().el)
