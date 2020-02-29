<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Widgets</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/select2.css" rel="stylesheet">
<link href="css/select2-bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<style>

body
{
    counter-reset: Serial;           /* Set the Serial counter to 0 */
}

table
{
    border-collapse: separate;
}

tr td:first-child:before
{
  counter-increment: Serial;      /* Increment the Serial counter */
  content:counter(Serial); /* Display the counter */
}

</style>

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Lumino</span>Admin</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		
		<ul class="nav menu">
			<li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
		    <li><a href="captain.jsp"><span class="glyphicon glyphicon-th"></span>Captain Details</a></li>
			<li class="active"><a href="caporder.jsp"><span class="glyphicon glyphicon-pencil"></span> Order Forms</a></li>
			<li><a href="additem.jsp"><span class="glyphicon glyphicon-plus"></span> Add New Item</a></li>
			
			<li><a href="alert.jsp"><span class="glyphicon glyphicon-info-sign"></span>Notifications</a></li>
			<li class="parent ">
				<a href="#">
					<span class="glyphicon glyphicon-list"></span> Reports<span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li>
						<a class="" href="perday.jsp">
							<span class="glyphicon glyphicon-share-alt"></span>Perday Reports
						</a>
					</li>
					<li>
						<a class="" href="monwise.jsp">
							<span class="glyphicon glyphicon-share-alt"></span>Month Reports
						</a>
					</li>
					<li>
						<a class="" href="halfyear.jsp">
							<span class="glyphicon glyphicon-share-alt"></span>Halfyear Reports
 						</a>
					</li>
					
					
				</ul>
			</li>
			<li role="presentation" class="divider"></li>
			<li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Login Page</a></li>
		</ul>
	</div><!--/.sidebar-->	
     	
  <div class="row">
  
			<div class="col-md-8" style="margin-left:320px">
				<div class="panel panel-default"style="margin-top:20px">
					<div class="panel-heading">Bill</div>
					<div class="panel-body">
						<table data-toggle="table" data-url="tables/data2.json" border="1" >
						   
						    <tr>
						        <th data-field="name">Sr.No</th>
						        <th data-field="id" data-align="right">Item Name</th>
						        <th data-field="name">Quantity</th>
						        <th data-field="price">Amount</th>
						     </tr>
							
							
														
											<tr><td></td>
												<td> </td>
												<td> </td>
												<td> </td>
												
											</tr>
											  										     
										  
																			
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>
											  
											   
										     
										
																			
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>
											  
											   
										     
										    							
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>
											  
											   
										    							
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>
											  
											   
										    
																			
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>
											  
											   
										    
																			
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>
											  
											   
										   
																			
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>
											  
											   
										     
										   							
											<tr><td></td>
												<td> </td>
												<td> </td>
												
											</tr>				   
										     
										   
							
						   
							
						</table>
						<br><br>
								    <div class="form-group">
										<label class="col-md-2 control-label" for="name"style="margin-top:-20px;"><h3 style="color:#30a5ff;"><b>Total:-</b></h3></label>
										<div class="col-md-10">
										    <input  name="total" type="text" class="form-control">				
										</div>
									</div>
								  
					</div>
				</div>
              </div>
          </div>
    <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
</body>
</html>