### 
| ----------------------------------------------------------------
| Document
| ----------------------------------------------------------------
| 
| Handles compiling the README.md into a PDF and places it within
| the "documentation" folder of the current theme. Useful for
| preparing your theme for marketplaces like ThemeForest.
|
###

module.exports = (gulp, run) ->

  () ->

    gulp.task "document", ->
      gulp.src "./README.md"
      .pipe run.markdownPdf()
      .pipe gulp.dest "documentation"