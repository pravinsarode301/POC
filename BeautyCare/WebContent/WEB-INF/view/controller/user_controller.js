'use strict';



App.controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
          var self = this;
          self.address={email:'',contactNumber:''};
          self.login={password:'',rePassword:''};
          self.user={firstName:'',lastName:'',address:'',login:''};
          self.user.address=self.address;
          self.user.login=self.login;
          alert("login");
          self.users=[];
              
          
          self.createUser = function(user){
        	 // alert(user);
        	 // console.log(user);
              UserService.createUser(user)
		             .then(function(response){
					               console.error('Error while creating User.');
					               errField=response.data;
				              }	
                  );
          };
          
          self.submit = function() {
             
                  console.log('Saving New User', self.user);    
                  self.createUser(self.user);
          };
         
          
          self.reset = function(){
              self.user={id:null,username:'',address:'',email:''};
              $scope.myForm.$setPristine(); //reset Form
          };

      }]);


App.config(['$routeProvider', function($routeProvider) {
	$routeProvider
		.when('/login', {
			
			templateUrl: '/registerMeee',
			controller : "UserController as itemListCtrl"
			
		})}]);