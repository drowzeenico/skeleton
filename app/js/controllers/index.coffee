define([
  'jquery',
  'underscore',
  'backbone',
  'views/layout'
], ($, _, Backbone, LayoutView)->

  Controller = 
    index: ()->
      new LayoutView().render()
      Controller.jqueryMethods()
      return

    light: ()->
      console.log 'lights on! here'

    jqueryMethods: ()->
      $('.sandwitch').click ()->
        if(!$(this).hasClass('active'))
          $(this).addClass('active');
          $('.actions').show();
        else
          $(this).removeClass('active');
          $('.actions').hide();
      return

  return Controller;
)