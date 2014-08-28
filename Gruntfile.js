module.exports = function (grunt) {
  'use strict';

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    less: {
      main: {
        options: {
          compress: true
        },
        files: {
          'workspace/build/main.css': 'workspace/less/main.less'
        }
      }
    },

    jshint : {
      all: [
        'workspace/js/main.js'
      ]
    },

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'bower_components/jquery/dist/jquery.js',
          'bower_components/bootstrap/dist/js/bootstrap.js',
          'workspace/js/main.js'],
        dest: 'workspace/build/main.js'
      }
    },

    uglify: {
      options: {
        mangle: false
      },
      main: {
        files: {
          'workspace/build/main.min.js': ['workspace/build/main.js']
        }
      }
    },

    clean: [ "manifest/cache/*.jpg" ],

    watch: {
      grunt: { files: ['Gruntfile.js'] },

      sass: {
        files: 'workspace/less/**/*.less',
        tasks: ['less'],
        options: {
          livereload: true,
        }
      }
    }


  });

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.registerTask('core', ['less', 'jshint', 'concat', 'uglify']);
  grunt.registerTask('build', ['core']);
  grunt.registerTask('default', ['build', 'watch']);
}
