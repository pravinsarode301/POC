<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="angular.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="service.js"></script>
</head>
<body data-ng-app="myModule">
	<div data-ng-controller="StringProcessor">
		<input type="text" data-ng-model="input" /> 
		<input type="text" data-ng-model="output" />
		 <input type="button" data-ng-click="trnasformString(input)" value="process string" />
	</div>
</body>
</html>