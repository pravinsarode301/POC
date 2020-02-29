'use strict';

App.factory('UserService', [ '$http', '$q', function($http, $q) {

	return {

		createUser : function(user) {
			//console.error(user);
			//return	$http.post('http://localhost:8080/BeautyCare/registerMe.html', user)
			
			return $http({
				url : 'http://localhost:8080/BeautyCare/registerMe.html',
				method : 'POST',
				dataType : 'json',
				data : user
				})
			.then(function(response) {
				console.log(response);
				return response.data;

			}, function(errResponse) {
				console.error('Error while creating user');
				return $q.reject(errResponse);
			});
		}

	};

} ]);
