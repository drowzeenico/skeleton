define([
  'underscore',
  'backbone'
], (_, Backbone)->
  return Backbone.Model.extend(
    defaults:
      city: "",
      temperature: 0,
      country: ""
  );
);