<%@page import="org.apache.catalina.Session"%>
<%@ page import="java.io.*,java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Dashboard</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>
<body>


	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><span>Lumino</span>Admin</a>

			<ul class="user-menu">
				<li class="dropdown pull-right">
				<li><a href="login.jsp"><span
						class="glyphicon glyphicon-user"></span> Login</a>
				</li>
				<!-- <a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>
								Profile</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-cog"></span>
								Settings</a></li>
						<li><a href="Controller?LogOut"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul></li> -->
			</ul>
		</div>

	</div>
	<!-- /.container-fluid --> </nav>
	<div id="wrapper">

		<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
			<ul class="nav menu">
				<li><a href="index.jsp"><span
						class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
				<li role="presentation" class="divider"></li>
				<li><a href="login.jsp"><span
						class="glyphicon glyphicon-user"></span> Login</a>
				</li>
			</ul>
		</div>
		<!--/.sidebar-->
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Dashboard</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div>
		<!--/.row-->



		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Site Traffic Overview</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="line-chart" height="200"
								width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.row-->



		<!--/.row-->
	</div>
	<!--/.main-->

	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
	
	    <!-- Menu Toggle Script -->
    <script>
    $("#sidebar-collapse").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
</body>
</html>