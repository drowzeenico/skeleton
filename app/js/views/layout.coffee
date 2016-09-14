define([
  'jquery',
  'underscore',
  'backbone',
  'views/weather/index'
], ($, _, Backbone, WeatherView)->
  return Backbone.View.extend (
    el: $('#dashboard'),
    render: ()->
      this.$el.append new WeatherView().render()
  );
);