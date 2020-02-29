<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="angular.min.js"></script>
<script type="text/javascript" src="script.js"></script>

</head>
<body ng-app="myModule">
	<div ng-controller="myController">
		enter the value to display row <input type="number" min="1" max="10" step="1" ng-model="rowLimit">
		enter the text to search<input type="text" ng-model="searchText">
		hide action<input type="checkbox" ng-model="hide">
		
		<table>
			<thead>
				<tr>
					<td>technology name</td>
					<td>like</td>
					<td>dislike</td>
					<td ng-hide="hide">like/dislike</td>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="tech in technology | limitTo: rowLimit |filter:searchText" >
					<td>{{tech.name |uppercase}}</td>
					<td>{{tech.likes}}</td>
					<td>{{tech.dislike}}</td>
					<td ng-hide="hide">
					<input type="button" value="like" ng-click="incrementLike(tech)">
					<input type="button" value="dislike" ng-click="incrementdisLike(tech)">
					</td>
					
				</tr>

			</tbody>

		</table>
	</div>

</body>
</html>