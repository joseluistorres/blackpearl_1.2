class CptCompass.Models.Minute extends Backbone.Model
  paramRoot: 'minute'

  defaults:
    name: null
    content: null
    user_id: null

class CptCompass.Collections.MinutesCollection extends Backbone.Collection
  model: CptCompass.Models.Minute
  url: '/minutes'
