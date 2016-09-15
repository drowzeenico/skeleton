define(['jquery', 'underscore', 'backbone', 'router'], ($, _, backbone, Router) ->
  initialize = () ->
    Router.initialize();
    return;

  return {
    initialize: initialize
  }
)