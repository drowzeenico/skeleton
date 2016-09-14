define([
  'jquery',
  'underscore',
  'backbone',
  'collections/locations'
], ($, _, Backbone, LocationsCollection)->
  return Backbone.View.extend ({
    getData: ()->
      cities = [
        {city: 'Moscow', country: 'RUS', temperature: 10},
        {city: 'London', country: 'UK', temperature: 5},
        {city: 'Dubai', country: 'UAE', temperature: 20}
      ];

      data =
        locations: new LocationsCollection(cities).toJSON(),
        name: 'Nicota'

    render: ()->
      JST['weather/index'] this.getData()
  });
);