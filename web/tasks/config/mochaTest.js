module.exports = function (grunt) {
  grunt.loadNpmTasks('grunt-mocha-test');

  grunt.config.set('mochaTest', {
    back: {
      options: {
        reporter: 'spec',
        require: 'coffee-script/register'
      },
      src: [
        'test/es/**/*.test.coffee'
      ]
    },
    route: {
      options: {
        reporter: 'spec',
        require: [
          'coffee-script/register'
        ]
      },
      src: [
        'test/bootstrap.test.js',
        'test/routes/**/*.test.coffee'
      ]
    }
  });
};
