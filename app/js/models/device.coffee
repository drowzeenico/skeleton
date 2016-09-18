define([
  'underscore',
  'backbone'
], (_, Backbone)->
  return Backbone.Model.extend(
    defaults:
      name: "",
      status: 0,
      image: ""
  );
);