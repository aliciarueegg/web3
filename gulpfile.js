var gulp = require('gulp');
var bs = require('browser-sync').create();

gulp.task('browser-sync', function() {
    bs.init({
        server: {
            baseDir: "./public/"
        }
    });
});

gulp.task('watch', ['browser-sync'], function () {
    gulp.watch(".css").on('change', bs.reload);
    gulp.watch("*.html").on('change', bs.reload);
    gulp.watch("*.js").on('change', bs.reload);
});
