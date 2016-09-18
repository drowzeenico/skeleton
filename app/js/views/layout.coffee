define([
  'jquery',
  'underscore',
  'backbone',
  'views/weather/index',
  'views/devices/index'
], ($, _, Backbone, WeatherView, DevicesView)->
  return Backbone.View.extend (
    el: $('#dashboard'),
    render: ()->
      this.$el.html ''
      this.$el.append new WeatherView().render()
      this.$el.append new DevicesView().render()
  );
);