module.exports = function (grunt) {
	grunt.registerTask('syncAssets', [
    'shell:dev',
		'jst:dev',
		'sass:dev',
		'sync:dev',
		'coffee:dev',
    'clean:dev',
	]);
};
