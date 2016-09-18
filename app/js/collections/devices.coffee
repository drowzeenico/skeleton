define([
  'underscore',
  'backbone',
  'models/device'
], (_, Backbone, Device) ->
  Backbone.Collection.extend({
		model: Device
  })
);