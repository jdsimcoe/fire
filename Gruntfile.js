module.exports = function (grunt) {
  'use strict';

  grunt.initConfig({
    globalConfig: globalConfig,
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

    cssmin: {
      minify: {
        files: {
          'symphony/assets/css/symphony.min.css':
          [
            'symphony/assets/css/symphony.css',
            'symphony/assets/css/symphony.legacy.css',
            'symphony/assets/css/symphony.grids.css',
            'symphony/assets/css/symphony.forms.css',
            'symphony/assets/css/symphony.tables.css',
            'symphony/assets/css/symphony.frames.css',
            'symphony/assets/css/symphony.tabs.css',
            'symphony/assets/css/symphony.drawers.css',
            'symphony/assets/css/symphony.associations.css',
            'symphony/assets/css/symphony.notices.css',
            'symphony/assets/css/admin.css',
            'workspace/css/admin_css_override.css'
          ]
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
      },
      symphony: {
        src : [
          'symphony/assets/js/jquery.js',
          'symphony/assets/js/symphony.js',
          'symphony/assets/js/symphony.collapsible.js',
          'symphony/assets/js/symphony.orderable.js',
          'symphony/assets/js/symphony.selectable.js',
          'symphony/assets/js/symphony.duplicator.js',
          'symphony/assets/js/symphony.tags.js',
          'symphony/assets/js/symphony.suggestions.js',
          'symphony/assets/js/symphony.pickable.js',
          'symphony/assets/js/symphony.timeago.js',
          'symphony/assets/js/symphony.notify.js',
          'symphony/assets/js/symphony.drawer.js',
          'symphony/assets/js/admin.js'],
        dest: 'workspace/assets/js/symphony.js'
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
      },
      symphony: {
        files: {
          'symphony/assets/js/symphony.min.js': ['workspace/js/symphony.js']
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

  grunt.registerTask('core', ['less', 'jshint', 'concat', 'uglify', 'cssmin']);
  grunt.registerTask('build', ['core']);
  grunt.registerTask('default', ['build', 'watch']);
}
