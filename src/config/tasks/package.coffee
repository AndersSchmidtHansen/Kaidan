### 
| ----------------------------------------------------------------
| Package
| ----------------------------------------------------------------
| 
| Handles creating a .zip file containing the entire theme itself.
| Just grab the .zip file and upload it to a marketplace or
| similar.
|
###

module.exports = (gulp, run) ->

  () ->

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