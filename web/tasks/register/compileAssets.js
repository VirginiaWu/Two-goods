module.exports = function (grunt) {
	grunt.registerTask('compileAssets', [
    'shell:dev',
		'jst:dev',
		'sass:dev',
		'copy:dev',
		'coffee:dev',
    'clean:dev'
	]);
};
