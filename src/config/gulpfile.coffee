### 
| ----------------------------------------------------------------
| Gulpfile
| ----------------------------------------------------------------
| 
| This acts as the primary "hub" for Gulp to find the necessary
| tasks needed for pre-processing Slim, Sass and CoffeeScript.
| As you can see, the file is very "slim" itself because of
| all the tasks being modularized and loaded in by the
| "Modularized Task Loader" inside `gulp.litcoffee`.
|
| You'll find all the tasks within the `tasks`
| folder. To know more about how this works,
| I've written an article about it here:
| http://bit.ly/1IJqdWD.
|
###

tasks = [
  'serve',
  'sass',
  'coffee',
  'package',
  'document'
]

gulp = require('./gulp')(tasks)

gulp.task "default", ['serve']

