define([
  'underscore',
  'backbone',
  'models/location'
], (_, Backbone, Location) ->
  Backbone.Collection.extend({
		model: Location
  })
);