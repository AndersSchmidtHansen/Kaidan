### 
| ----------------------------------------------------------------
| Modularized Task Loader
| ----------------------------------------------------------------
| 
| This handles modularizing all of our Gulp tasks in a very easy
| and understandable manner. To ease plugin loading, we require 
| 'gulp-load-plugins' so dependencies from `package.json` get
| autoloaded. It's just called `run` for expressiveness.
|
###

gulp    = require 'gulp'
run     = require('gulp-load-plugins')()
bs      = require('browser-sync').create()
args    = require("yargs").argv
fs      = require "fs"
reload  = bs.reload

paths  =
  sass    : [ "src/assets/sass/**/*.scss" ]
  coffee  : [ "src/assets/coffeescript/**/*.coffee" ]
  hbs     : [ "!./node_modules/**/*.hbs", "./*.hbs", "partials/*.hbs"]

module.exports = (tasks) ->
  tasks.forEach (name) ->
    gulp.task name, require("./tasks/#{name}")(gulp, run, bs, reload, paths)

  return gulp