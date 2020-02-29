'use strict';

/*myApp.factory("stringService", function() {
	return {

		processString : function(input) {

			if (!input) {
				return input;
			}

			var output = "";
			for (var i = 0; i < input.length; i++) {
				if (i > 0 && input[i] == input[i].toUpperCase()) {

					output = output + " ";

				}
				output = output + input[i];

			}
			return output;
		}

	};

})
*/
/*myApp.factory("detailsService", function() {

	
	processString = function($scope,$http) {

	$http({
		method : 'GET',
		url : 'javaAngularJS'
	}).success(function(data, status, headers, config) {
		$scope.person = data;
	}).error(function(data, status, headers, config) {
		// called asynchronously if an error occurs
		// or server returns response with an error status.
	});
	}	

});
*/

myApp.factory("detailsService",['$http', function($http){

	return{
	processString : function() {

	 
	}	
	};
}]);