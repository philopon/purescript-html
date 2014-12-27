var gulp       = require('gulp');
var purescript = require('gulp-purescript');
var foreach    = require('gulp-foreach');
var shell      = require('gulp-shell');
var rename     = require('gulp-rename');
var sequence   = require('run-sequence');

var path       = require('path');

var bowerPurs = 'bower_components/purescript-*/src/**/*.purs';
var sources = [bowerPurs, 'src/**/*.purs', 'examples/**/*.purs'];

gulp.task('wrapper', shell.task([
  './wrapper/generate.sh'
]));

gulp.task('pscMake', function(){
  return gulp
    .src(sources)
    .pipe(purescript.pscMake());
});

gulp.task('dotPsci', function(){
  return gulp
    .src(sources)
    .pipe(purescript.dotPsci());
});

gulp.task('pscDocs', function(){
  return gulp
    .src('src/**/*.purs')
    .pipe(foreach(function(stream, file){
      var p = path.resolve(
        'docs',
        path.dirname(file.relative),
        path.basename(file.relative, ".purs") + ".md")
      return stream
        .pipe(purescript.pscDocs())
        .pipe(gulp.dest(p));
    }));
});

gulp.task('example', function(){
  return gulp
    .src(sources)
    .pipe(purescript.psc(
      { main: "Main"
      , output: 'main.js'
      , modules: ['Main', "Control.Timer"]
      }))
    .pipe(gulp.dest('examples/'));
});

gulp.task('default', function(callback){
  return sequence(
    'wrapper',
    ['pscMake', 'dotPsci', 'pscDocs', 'example'],
    callback
  );
});
