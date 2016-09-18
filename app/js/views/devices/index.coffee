define([
  'jquery',
  'underscore',
  'backbone',
  'collections/devices'
], ($, _, Backbone, DevicesCollection)->
  devices = [
    {name: 'Climate', status: 'on', image: 'climate'},
    {name: 'Electricity', status: 'off', image: 'electricity'},
    {name: 'Media', status: 'on', image: 'headphones'},
    {name: 'Light', status: 'off', image: 'light'},
    {name: 'Security', status: 'off', image: 'security'},
    {name: 'Water', status: 'on', image: 'water'},
    {name: 'Climate', status: 'on', image: 'climate'},
    {name: 'Electricity', status: 'off', image: 'electricity'},
    {name: 'Media', status: 'on', image: 'headphones'},
    {name: 'Light', status: 'off', image: 'light'},
    {name: 'Security', status: 'off', image: 'security'},
    {name: 'Water', status: 'on', image: 'water'}
  ];

  return Backbone.View.extend ({
    className: '.widget.devices',
    collection: new DevicesCollection(devices),

    initialize: ()->
      this.collection.on('change', this.render, this);
      return

    getData: ()->
      data =
        devices: this.collection.toJSON()


    render: ()->
      html = JST['devices/index'] this.getData();
      this.$el = $(this.className);
      if(this.$el.length > 0)
        this.$el.replaceWith html

      html
  });
);