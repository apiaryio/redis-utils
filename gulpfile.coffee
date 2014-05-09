gulp  = require 'gulp'

coffeelint = require 'gulp-coffeelint'
mocha      = require 'gulp-mocha'
plumber    = require 'gulp-plumber'
gutil      = require 'gulp-util'
watch      = require 'gulp-watch'

handleError = (err) ->
  console.error err.message
  process.exit 1

gulp.task 'test', ->
  gulp.src('test/*-test.*')
    .pipe(mocha(reporter: 'spec'))
    .on 'error', handleError

gulp.task 'integration-test', ->
  gulp.src('test/run-integration-tests.coffee')
  .pipe(mocha(reporter: 'spec'))
  .on 'error', handleError

gulp.task 'lint', ->
  gulp.src(['./src/*', './test/**/*'])
    .pipe(coffeelint(opt: {max_line_length: {value: 1024, level: 'ignore'}}))
    .pipe(coffeelint.reporter())
    .pipe(coffeelint.reporter('fail'))
    .on 'error', handleError

gulp.task 'ci', ['test', 'integration-test']

return
