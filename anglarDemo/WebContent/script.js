var myApp = angular.module("myModule", []);

myApp.controller("myController", function($scope) {
	var technology = [ {
		name : "java",
		likes : 0,
		dislike : 0
	}, {
		name : "php",
		likes : 0,
		dislike : 0
	}, {
		name : ".net",
		likes : 0,
		dislike : 0
	}, {
		name : "angularJs",
		likes : 0,
		dislike : 0
	}, {
		name : "html",
		likes : 0,
		dislike : 0
	}, {
		name : "java2",
		likes : 0,
		dislike : 0
	}, {
		name : "php2",
		likes : 0,
		dislike : 0
	}, {
		name : ".net2",
		likes : 0,
		dislike : 0
	}, {
		name : "angularJs2",
		likes : 0,
		dislike : 0
	}, {
		name : "html2",
		likes : 0,
		dislike : 0
	}, ];

	$scope.technology = technology;

	$scope.incrementLike = function(technology)

	{
		technology.likes++;
	}

	$scope.incrementdisLike = function(technology)

	{
		technology.dislike++;
	}

	$scope.rowLimit = 2;

});

myApp.controller("StringProcessor", function($scope,stringService) {

	$scope.trnasformString = function(input) {
		
		$scope.output=stringService.processString(input);
	}

});




myApp.controller("getDataController",function($scope,detailsService) {

	
$scope.getDataFromServer = function(input) {
		
		$scope.output=detailsService.$http({
			method : 'GET',
			url : 'javaAngularJS'
		}).success(function(data, status, headers, config) {
			$scope.person = data;
		
		
		}).error(function(data, status, headers, config) {
			// called asynchronously if an error occurs
			// or server returns response with an error status.
		});
	}

		//$scope.person=detailsService.processString();
		
	
});



