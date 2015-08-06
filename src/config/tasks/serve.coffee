### 
| ----------------------------------------------------------------
| Serve (BrowserSync + Watch)
| ----------------------------------------------------------------
| 
| Handles live reloading your Ghost theme over multiple devices
| and browsers. Extremely useful for developing themes that
| are both responsive and cross-browser. Learn much more
| about BrowserSync here: http://www.browsersync.io/
| and also about how it ties in with Gulp here:
| http://www.browsersync.io/docs/gulp/.
|
###

module.exports = (gulp, run, bs, reload, paths) ->

  () ->

    gulp.task 'serve', () ->

      bs.init(
        proxy : "127.0.0.1:2368"
      )

      gulp.watch paths.sass,   ['sass']
      gulp.watch paths.coffee, ['coffee']
      gulp.watch paths.hbs, bs.reload

      