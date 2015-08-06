### 
| ----------------------------------------------------------------
| Slim
| ----------------------------------------------------------------
| 
| Handles pre-processing .slim files into the .hbs (handlebars)
| files that Ghost uses for its templates. Huge thank you to
| @cognitom (Tsutomu Kawamura) for making gulp-slim work
| so well for this toolkit.
|
###

module.exports = (gulp, run, bs, reload, paths) ->

  () ->

    gulp.task 'slim', ->
      gulp.src paths.slim
      .pipe run.changed "./", extension : ".slim"
      .pipe run.plumber()
      .pipe run.slim 
        pretty : true, 
        options : "attr_list_delims={'(' => ')', '[' => ']'}"
      .pipe run.rename extname : ".hbs"
      .pipe gulp.dest ""
      .on "end", reload