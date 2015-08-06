### 
| ----------------------------------------------------------------
| Sass
| ----------------------------------------------------------------
| 
| Handles compiling all of our Sass files (.scss) into plain,
| minified CSS. Just like we want it. Also, another thank
| you to @simonh1000 for helping me out with SourceMaps.
|
###

module.exports = (gulp, run, bs, reload) ->

  () ->

    gulp.task "sass", ->
      run.rubySass 'src/assets/sass/', sourcemap : true, style : 'compressed', noCache : true
      .pipe run.sourcemaps.init()
      .pipe run.autoprefixer 'last 2 version', 'safari 5', 'ie 9', 'ios 6', 'android 4'
      .pipe run.rename { suffix : '.min' }
      .pipe run.minifyCss()
      .pipe run.filesize()
      .pipe run.sourcemaps.write() # 'maps', includeContent: false, sourceRoot: '../../../src/assets/sass'
      .pipe gulp.dest "assets/css/"
      .pipe run.filter '**/*.css'    # Filter out sourcemaps
      .pipe run.notify message : 'SASS compiled and minified!', onLast: true
      .pipe reload stream : true