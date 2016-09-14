copyFiles = (list) ->
  files = [];
  for src, dest of list
    files.push({src: src, dest: dest, expand: true, rename: (dest, src)-> dest});
  return files;

module.exports = (grunt) ->
  BUILD_PATH = "build"
  TEMP_PATH = 'tmp'
  SRC_PATH = "app"
  BOWER = 'bower_components'

  grunt.initConfig
    connect:
      server:
        options:
          base: "static"
          port: 9000,
          base:
            path: 'build'
            options:
              index: 'index.html',
              maxAge: 300000
    jade:
      templates:
        options:
          client: true
          processName: (name) ->
            name.replace("app/js/templates/", "").replace(".jade", "")
        files:
          "#{TEMP_PATH}/js/templates.js": ["#{SRC_PATH}/js/templates/**/*.jade"]
    coffee:
      development:
        files: [
          ext: '.js'
          expand: true
          cwd: SRC_PATH,
          src: ["js/**/*.coffee", "js/*.coffee"],
          dest: "#{TEMP_PATH}"
        ]
    sass:
      dist:
        files:
          "#{TEMP_PATH}/css/skeleton.css": "#{BOWER}/Skeleton-Sass/scss/skeleton.scss"
          "#{TEMP_PATH}/css/styles.css": "#{SRC_PATH}/css/main.scss"

    copy:
      img:
        expand: true
        cwd: SRC_PATH
        src: ["img/**/*"]
        dest: "#{BUILD_PATH}"
      html:
        expand: true
        cwd: SRC_PATH
        src: ["*.html"]
        dest: "#{BUILD_PATH}"
      css:
        expand: true
        cwd: TEMP_PATH
        src: ["css/**/*.css"]
        dest: "#{BUILD_PATH}"
      js:
        expand: true
        cwd: TEMP_PATH
        src: ["js/**/*.js"]
        dest: "#{BUILD_PATH}"
      libs:
        files: copyFiles({
          "#{BOWER}/jquery/dist/jquery.min.js": "#{BUILD_PATH}/js/libs/jquery.js",
          "#{BOWER}/underscore/underscore-min.js": "#{BUILD_PATH}/js/libs/underscore.js",
          "#{BOWER}/backbone/backbone-min.js": "#{BUILD_PATH}/js/libs/backbone.js",
          "#{BOWER}/requirejs/require.js": "#{BUILD_PATH}/js/libs/require.js",
          "#{BOWER}/jade/runtime.js": "#{BUILD_PATH}/js/libs/jade.js"
        })

        
    watch:
      options:
        cwd: SRC_PATH
      js:
        files: ["js/**/*.coffee", "js/*.coffee"]
        tasks: ["coffee:development", "copy:js"]
      jade:
        files: ["js/templates/**/*.jade", "js/templates/*.jade"]
        tasks: ["jade:templates", "copy:js"]
      html:
        files: "*.html"
        tasks: ["copy:html"]
      css:
        files: "css/**/*"
        tasks: ["sass", "copy:css"]

  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks 'grunt-contrib-sass'

  grunt.registerTask "prepare", ["jade", "coffee", "sass", "copy"]
  grunt.registerTask "default", ["prepare", "connect:server", "watch"]
