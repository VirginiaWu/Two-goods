module.exports = function (grunt) {
  grunt.registerTask('test:back', ['mochaTest:back'])
  grunt.registerTask('test:route', ['mochaTest:route'])
};
