var app = angular.module('myApp', []);

app.controller("MyController", function($scope, $log, detailsService) {

	$scope.loadServer = function() {

		detailsService.processString().then(function(d) {
			$scope.person = d;

		}, function(errResponse) {
			console.error('Error while fetching Currencies');
		});
	}

});

app.factory("detailsService", function($http, $q, $log) {

	return {

		processString : function() {

			return $http({
				method : 'GET',
				url : 'javaAngularJS'
			}).then(function(response) {

				return response.data;
			}, function(errResponse) {
				console.error('Error while fetching users');
				return $q.reject(errResponse);
			});

		}

	};

});
