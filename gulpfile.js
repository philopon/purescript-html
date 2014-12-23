var gulp       = require('gulp');
var purescript = require('gulp-purescript');
var foreach    = require('gulp-foreach');
var shell      = require('gulp-shell');
var rename     = require('gulp-rename');
var sequence   = require('run-sequence');

var path       = require('path');

var bowerPurs = 'bower_components/purescript-*/src/**/*.purs';
var sources = [bowerPurs, 'src/**/*.purs'];


gulp.task('wrapper', shell.task([
  './wrapper/generate.sh Html.VirtualDOM > src/Html/VirtualDOM.purs'
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
      return stream
        .pipe(purescript.pscDocs())
        .pipe(gulp.dest(path.join('docs', file.relative)));
    }));
});

gulp.task('example', function(){
  return gulp
    .src(sources.concat('example/Main.purs'))
    .pipe(purescript.psc({main: "Main", output: 'main.js'}))
    .pipe(gulp.dest('example/'));
});

gulp.task('default', function(callback){
  return sequence(
    'wrapper',
    ['pscMake', 'dotPsci', 'pscDocs', 'example'],
    callback
  );
});
