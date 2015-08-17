/**
 *  Plugin diagnostic
 *
 *  Copyright (c) 2012 AVANTIC ESTUDIO DE INGENIEROS
 *  
**/


var Diagnostic = function() {
};

/**
 * Checks if location is enabled (Device setting for location and authorization).
 *
 * @param successCallback	The callback which will be called when diagnostic of location is successful.
 * 							This callback function have a boolean param with the diagnostic result.
 * @param errorCallback		The callback which will be called when diagnostic of location encounters an error.
 * 							This callback function have a string param with the error.
 */

Diagnostic.prototype.isLocationEnabled = function(successCallback, errorCallback) {
	return cordova.exec(successCallback,
						errorCallback,
						'Diagnostic',
						'isLocationEnabled',
						[]);
};

Diagnostic.prototype.switchToLocationSettings = function() {
	return cordova.exec(null,
		null,
		'Diagnostic',
		'switchToLocationSettings',
		[]);
};
module.exports = new Diagnostic();

