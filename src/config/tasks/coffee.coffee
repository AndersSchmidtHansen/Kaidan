### 
| ----------------------------------------------------------------
| CoffeeScript
| ----------------------------------------------------------------
| 
| Handles compiling our CoffeeScript files into plain JavaScript.
| Everything gets minified and outputted as a `scripts.min.js`
| file within the main `assets` folder. Also triggers live
| reloading via BrowserSync afterwards.
|
###

module.exports = (gulp, run, bs, reload, paths) ->

  () ->

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
      .pipe reload stream : true