<%@page import="com.hotel.Model.AlterOrderdetails"%>
<%@page import="com.hotel.Model.CaptainFormDaoImpl"%>
<%@page import="com.hotel.Model.OrderMenuDao"%>
<%@page import="com.hotel.Model.OrderFormDaoImpl"%>
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



      
</head>
<body>
<% 
if(session==null){
	response.sendRedirect("login.jsp");
}else{	
%>
	<%@include file="Common/header.jsp"%>
	
	
			<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active"><b>Order Form / View Details</b></li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">Order Details </h1>
			</div>
		</div><!--/.row-->
									
		
		<div class="row">
			<div class="col-md-11" style="margin-left:30px">
				<div class="panel panel-default"style="margin-top: 20px;">
					
					<div class="panel-body">
					<p></p>
					<%!static String customer_name;
					static String c_date;
					static String table_no;
					static String order_no;
					static String captain_name;
					//String [] ord_menu=null;
					static String quantity;					
					%>
						<% String Order_ID=(String)request.getAttribute("Order_ID");
						ArrayList abc=new ArrayList();
						
						ResultSet rt = AlterOrderdetails.getOrderdetails(Order_ID);
						
						while(rt.next()){
							customer_name=rt.getString("customer_name");
							c_date=rt.getString("c_date");
							table_no=rt.getString("table_no");
							order_no=rt.getString("order_no");
							captain_name=rt.getString("captain_name");
					abc.add(rt.getString("ord_menu")+"-"+rt.getString("quantity"));
						}
						
						
						String order=abc.toString();
												
												
						%>
						<form id="select2Form" class="form-horizontal" action="Controller" method="POST">
					 	<input type="hidden" name="OrderEditLink" value="OrderEditLink">
						<input type="hidden" name="updateOrderId" value="<%=order_no %>">
							<fieldset>
							<!-- Customer ID -->
								 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Customer Name</label>
									<div class="col-md-9">
									<input  name="Customer_Name" type="text" placeholder="<%=customer_name %>" value="<%=customer_name %>"  class="form-control" readonly="readonly">
									</div>
								</div>
								<!-- Date & Time--->
							 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Order date</label>
									<div class="col-md-9">
									<input  name="Order_Date" type="text" placeholder="<%=c_date %>" value="<%=c_date %>" class="form-control" readonly="readonly">
									</div>
								</div>
								
								<!-- Table No -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Table No</label>
									<div class="col-md-9">
									<input  name="table_no" type="text" placeholder="<%=table_no %>" value="<%=table_no %>" class="form-control"  readonly="readonly">
									</div>
								</div>
								
								<!-- Order Number -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Order Number</label>
									<div class="col-md-9">
									<input  name="Order_no" type="text" placeholder="<%=order_no %>" value="<%=order_no %>" class="form-control"  readonly="readonly" >
									</div>
								</div>
							   <!-- Captain Name -->
							   <div class="form-group">
									<label class="col-md-3 control-label" for="name">Captain Name</label>
									<div class="col-md-9">
									<input  name="Order_no" type="text" placeholder="<%=captain_name %>" value="<%=captain_name %>" class="form-control"  readonly="readonly" >
									</div>
								</div>
								
							 <!--Item Cost-->
							 
							 
							  
								 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Order Menu</label>
									<div class="col-md-9">
									   <input  name="Order_no" type="text" placeholder="<%=order %>" value="<%=order %>" class="form-control"  readonly="readonly" >
							
									</div>
								</div>

								
								
								
								
								<%-- <div class="form-group">
									<label class="col-md-3 control-label" for="name">Quantity</label>
									<div class="col-md-9">
									<input  name="Order_no" type="text" placeholder="<%=rt.getString("quantity") %>" value="<%=rt.getString("quantity") %>" class="form-control"  readonly="readonly" >
									</div>
								</div> --%>
								
								<center>
								<button type="submit" class="btn btn-primary  ">Edit</button>
								<button type="button" class="btn btn-default  " onclick="window.location.href='Controller?gobacktoOrderPage=gobacktoOrderPage'">Close</button>
								</center>
							</fieldset>
						</form>
					</div>
				</div>
				
				
			</div><!--/.col-->
							
			</div><!--/.col-->
	
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/select2.js"></script>
	<script src="js/select2.min.js"></script>
	<%@include file="Common/footer.jsp"%>
	
<%} %>
</body>
</html>