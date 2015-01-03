module.exports = function (config) {
    'use strict';

    config.set({
        basePath: '../../',
        frameworks: ['jasmine'],
        files: [
            // 'lib/*.js', // external libraries
            'src/*.js', // source code
            'spec/**/*Spec.js'
        ],
        autoWatch: true,
        singleRun: false,
        // browsers: ['Chrome', Firefox']
        browsers: ['Firefox', 'FirefoxDeveloper', 'FirefoxAurora', 'FirefoxNightly']
    });
};
