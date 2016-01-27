module.exports = function(grunt) {

  grunt.config.set('shell', {
    dev: {
      command: [
        'rm -rf assets/styles/scss/components',
        'rm -rf .tmp/public/styles/components',
        'mkdir .tmp/public/styles/components',
        'mkdir assets/styles/scss/components',
        'node concatAllScss.js',
        'node generateComponents.js',
        'sh compileScss.sh',
      ].join('&&')
    }
  });

  grunt.loadNpmTasks('grunt-shell');
};
