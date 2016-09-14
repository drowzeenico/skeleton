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
    collection: new LocationsCollection(cities),

    getData: ()->
      data =
        locations: this.collection.toJSON(),
        name: 'Nicota'


    render: ()->
      JST['weather/index'] this.getData()
  });
);