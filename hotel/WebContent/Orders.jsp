
<%@page import="com.hotel.Model.AlterOrderdetails"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.hotel.Model.OrderFormDaoImpl"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
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

<link href="css/site-demos.css" rel="stylesheet">
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>




<style type="text/css">


#order-one-form .fieldgroup {
    background: url("form-divider.gif") repeat-x scroll left top transparent;
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}

#order-one-form .fieldgroup label {
    float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 110px;
}

#order-one-form .fieldgroup input, #order-one-form .fieldgroup textarea, #order-one-form .fieldgroup select {
    float: right;
    margin: 10px 0;
    height: 25px;
}

#order-one-form .submit {
    padding: 10px;
    width: 220px;
    height: 40px !important;
}

#order-one-form .fieldgroup label.error {
    color: #FB3A3A;
    display: inline-block;
    margin: 4px 0 5px 125px;
    padding: 0;
    text-align: left;
    width: 220px;
}


</style>
   <script type="text/javascript">

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#order-one-form").validate({
                rules: {
                	
                	t_no:{ required: true },
                	
                    
                
                },
                messages: {
                   
                
                	t_no:  "<font color=red>Please select table number from list</font>",
                	
                    
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);
</script>




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
			<li class="active"><b> Order Form </b></li>
		</ol>
	</div>
	<!--/.row-->



	<!--<button class="btn btn-default btn-xs pull-right" data-toggle="modal" data-target="#myModal">Give Order</button>  -->
	<div class="row">
		<div class="col-md-11" style="margin-left: 30px">
			<div class="panel panel-default" style="margin-top: 20px;">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-pencil"></span>Add Order
				</div>
				
				<% if(request.getAttribute("deleteOrderStatus") != null){
				out.println("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> <strong>Done! </strong>"+request.getAttribute("deleteOrderStatus")+"</div>");
				}
				%>
				
				<%	
				if (request.getAttribute("ordermsg") != null) {
					out.println("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+request.getAttribute("ordermsg")+"</div>");
				}
				%>
				<div class="panel-body">
				
					<form  class="form-horizontal" action="Controller" method="post" name="order-one-form" id="order-one-form" novalidate="novalidate">
						<input type="hidden" name="placeOrderDetails"
							value="placeOrderDetails">
						<fieldset>
							<!-- Date & Time--->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Date
									&amp;Time</label>
								<div class="col-md-9">
								<% java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
										String kk=df.format(new java.util.Date());
										%>
									<input name="tdate" type="text" value="<%=kk  %>" class="form-control" readonly="readonly"/>
								</div>
							</div>

							<!-- Order Number -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Order
									Number</label>
								<div class="col-md-9">
									<%!int previous_orderno; %>
									<%! static int cureent_orderno=0; %>
									<%
									previous_orderno=AlterOrderdetails.last_insert_id_order_no();
									cureent_orderno=previous_orderno+1;
							
									%>

									<input name="ordno" type="text"	placeholder="<%=cureent_orderno %>" class="form-control" value="<%=cureent_orderno %>" readonly="readonly">


								</div>
							</div>
							<!-- Table Number -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Table
									Number</label>
								<div class="col-md-9">
									<select class="form-control" name="t_no">
									<option disabled selected hidden value="">-- select table number --</option>
									<%!int i=1;%>
									<%
									ResultSet rt3=OrderFormDaoImpl.getTableStatusDetails();
									while(rt3.next()){
										%>
										<option value="<%=rt3.getString(1)%>">Table No-<%=rt3.getString(1)%></option>
									<%	
									}
									%>
									</select>
									<%-- <select class="form-control" name="t_no">
										<option value="1" <%if (value1 == 3) {
						out.println("selected");
					} else {
						out.println("");
					}%>>Table No-1</option>
										<option value="2">Table No-2</option>
										<option value="3">Table No-3</option>
										<option value="4">Table No-4</option>
										<option value="5">Table No-5</option>
										<option value="6">Table No-6</option>
										<option value="7">Table No-7</option>
										<option value="8">Table No-8</option>
										<option value="9">Table No-9</option>
									
									</select> --%>

								</div>
							</div>



							<!--<div class="form-group">
									<label class="col-md-3 control-label" for="name">Amount</label>
									<div class="col-md-9">
									<input  name="amt" type="text" placeholder="Amount" class="form-control">
									</div>
								</div>-->
							<center>
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-default ">Clear</button>
							</center>
						</fieldset>
					
								</div>
							</fieldset>
					
					</form>
				</div>
			</div>


		</div>
		<!--/.col-->

<div class="row">
			<div class="col-md-11" style="margin-left:30px ; ">
				<div class="panel panel-default">
					<div class="panel-heading">Order List</div>
					<div class="panel-body" >
						<table data-toggle="table" data-url="" class="table table-striped" >
						    <thead class="thead-inverse">
						    <tr>
						        <th data-field="id" data-align="right">Table No.</th>
						        <th data-field="name">Order No.</th>
						        <th data-field="price">Action</th>
						    </tr>
							
						    </thead>
							<tbody>
						 <% ResultSet rt=OrderFormDaoImpl.GridOrderForm_detail();
							while(rt.next()){
						 %> 
							
							<tr>
							<td><%=rt.getString(1) %></td>
							<td><%=rt.getString(2) %></td>
							<td>
							<a href="Controller?OrderViewEditTrash=OrderViewEditTrash&OrderViewID=OrderViewID&Order_ID=<%=rt.getString(2) %>" class="search"><span class="glyphicon glyphicon-search"></span></a>&nbsp;&nbsp;&nbsp;
							<a href="Controller?OrderViewEditTrash=OrderViewEditTrash&OrderEditID=OrderEditID&Order_ID=<%=rt.getString(2) %>" class="edit"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;
							<a href="Controller?OrderViewEditTrash=OrderViewEditTrash&OrderTrashID=OrderTrashID&Order_ID=<%=rt.getString(2) %>&orderDeleteTable_no=<%=rt.getString(1) %>" class="trash"><span class="glyphicon glyphicon-trash"></span></a>&nbsp;&nbsp;&nbsp;
							<a href="Controller?OrderViewEditTrash=OrderViewEditTrash&OrderID=OrderID&table_no=<%=rt.getString(1) %>" class="list-alt"><span class="glyphicon glyphicon-list-alt"></span></a>
							</td>
							</tr>
							 <%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>

	</div><!--/.row-->



	<!--/.main-->



	
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/select2.js"></script>
	<script src="js/select2.min.js"></script>
	
	<%} %>
	
	<script src="js/bootstrap.min.js"></script>
	
	
</body>
</html>