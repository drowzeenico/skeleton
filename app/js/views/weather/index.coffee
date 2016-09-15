define([
  'jquery',
  'underscore',
  'backbone',
  'collections/locations'
], ($, _, Backbone, LocationsCollection)->
  cities = [
    {city: 'Moscow', country: 'RUS', temperature: 10},
    {city: 'London', country: 'UK', temperature: 5},
    {city: 'Dubai', country: 'UAE', temperature: 20}
  ];

  return Backbone.View.extend ({
    className: '.widget.weather',
    collection: new LocationsCollection(cities),

    initialize: ()->
      this.collection.on('change', this.render, this);
      return

    getData: ()->
      data =
        locations: this.collection.toJSON(),
        name: 'Nicota'


    render: ()->
      html = JST['weather/index'] this.getData();
      this.$el = $(this.className);
      if(this.$el.length > 0)
        this.$el.replaceWith html

      html
  });
);