define([
  'jquery',
  'underscore',
  'backbone',
  'views/layout'
], ($, _, Backbone, LayoutView)->

  Controller = 
    index: ()->
      new LayoutView().render()

    light: ()->
      console.log 'lights on! here'

  return Controller;
)