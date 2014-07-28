###
|--------------------------------------------------------------------------
| Gulpfile
|--------------------------------------------------------------------------
|
| Configuration file for Gulp.
|
###

# Load the plugins automatically
gulp        = require "gulp"
run         = require("gulp-load-plugins")()
browserSync = require "browser-sync"
args        = require("yargs").argv
fs          = require "fs"
reload      = browserSync.reload

# Paths
paths =
  slim            : [ "src/**/*.slim" ]
  sass            : [ "src/assets/sass/**/*.scss" ]
  coffee          : [ "src/assets/coffeescript/**/*.coffee" ]

# BrowserSync
gulp.task 'browser-sync', ->
  browserSync.init null,
    notify : true
    proxy : "127.0.0.1:2368"

# Tasks
gulp.task 'slim', ->
  gulp.src paths.slim
  .pipe run.changed "./", extension : ".slim"
  .pipe run.plumber()
  .pipe run.slim pretty : true, options : "attr_delims={'('=>')','['=>']'}"
  .pipe run.rename extname : ".hbs"
  .pipe gulp.dest ""
  .pipe reload stream : true, once : true

gulp.task "sass", ->
  gulp.src paths.sass
  .pipe run.plumber()
  .pipe run.rubySass sourcemap : false, style : 'compressed', sourcemapPath : "src/sass/maps"
  .pipe run.autoprefixer 'last 2 version', 'safari 5', 'ie 9', 'ios 6', 'android 4'
  .pipe run.rename { suffix : '.min' }
  .pipe run.minifyCss()
  .pipe run.filesize()
  .pipe gulp.dest "assets/css/"
  .pipe run.notify message : 'SASS compiled and minified!'
  .pipe reload stream : true

gulp.task "coffee", ->
  gulp.src paths.coffee
  .pipe run.plumber()
  .pipe run.include extensions : "coffee"
  .pipe run.coffee bare : true
  .pipe run.concat( "scripts.min.js" )
  .pipe run.uglify()
  .pipe run.filesize()
  .pipe gulp.dest "assets/js/"
  .pipe run.notify message : 'Coffeescript compiled and minified!'
  .pipe reload stream : true, once : true

gulp.task "document", ->
  gulp.src "./README.md"
  .pipe run.markdownPdf()
  .pipe gulp.dest "documentation"

gulp.task "package", ->
  gulp.src [
          "./assets/**/*",
          "./documentation/**/*",
          "./partials/**/*",
          "./*", "./src/**/*",
          "!./node_modules",
          "!./.gitignore",
          "!./.git",
          "!./README.md"
          ], base : "../"

  .pipe run.zip "theme.zip"
  .pipe gulp.dest ""

# Default
gulp.task "default", [ "browser-sync", "watch" ]

# Watch
gulp.task "watch", ['browser-sync'], () ->
  gulp.watch paths.slim,        ['slim']
  gulp.watch paths.sass,        ['sass']
  gulp.watch paths.coffee,      ['coffee']