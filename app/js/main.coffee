#
# Главный загрузочный файл
# Прописывает пути для основных загружаемых библиотек
#
require.config({
	baseUrl: "/js",
	urlArgs: "fileversion=" + (new Date()).getTime(),
	paths:
    jquery: 'libs/jquery',
    backbone: 'libs/backbone',
    underscore: 'libs/underscore',
    templates: 'templates'
  shim:
  	jquery:
      exports: '$',
    underscore:
      exports: '_',
    backbone:
      deps: ["underscore", "jquery"],
      exports: "Backbone"
});

#
# Загружаем наше приложение и инициализируем его
#
require(['templates', 'app'], (templates, App) ->
  App.initialize();
);