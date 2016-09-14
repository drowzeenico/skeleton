define([
  'jquery',
  'underscore',
  'backbone',
  'controllers/index'
], ($, _, Backbone, IndexCtrl)->

  Router = Backbone.Router.extend({
    routes:
      '': IndexCtrl.index,
      'light': IndexCtrl.light
  })

  initialize = ()->
    router = new Router;
    Backbone.history.start();

  return {
    initialize: initialize
  }
)