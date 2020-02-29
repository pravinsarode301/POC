<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AJAX with Servlets using AngularJS</title>
<script type="text/javascript" src="angular.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="service.js"></script>

<script>
	
</script>
</head>
<body ng-app="myModule">
	<div >
		<div ng-controller="getDataController">
			<button ng-click="getDataFromServer()">Fetch data from server</button>
			<p>First Name : {{person.firstName}}</p>
			<p>Last Name : {{person.lastName}}</p>
		</div>
	</div>
</body>
</html>