<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>AJAX with Servlets using AngularJS</title>
<script type="text/javascript" src="angular.min.js"></script>
<script type="text/javascript" src="script.js"></script>


<script> 
	
</script>
</head>
<body ng-app="myApp">
	<div >
		<div ng-controller="MyController">
			<button ng-click="loadServer()">Fetch data from server</button>
			<h2>hlo</h2>
			<p>First Name : {{person.firstName}}</p>
			<p>Last Name : {{person.lastName}}</p>
		</div>
	</div>
</body>
</html>