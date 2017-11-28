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
    gulp.watch("public/*.css").on('change', bs.reload);
    gulp.watch("public/*.html").on('change', bs.reload);
    gulp.watch("public/tags/*.tag").on('change', bs.reload);
    gulp.watch("public/models/*.js").on('change', bs.reload);
});
