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
<SCRIPT language="javascript">
	function addRow(multiOrdersTable) {

		var table = document.getElementById(multiOrdersTable);

		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
		var counts=rowCount-1;
		
		var cell1 = row.insertCell(0);
		var orderMenu = document.createElement("select");
		 orderMenu.type = "optain";  
	 	var cars = [
	 	           "volvo",
	 	           "saab",
	 	           "mercedes",
	 	           "audi"
	 	         ];
	 	var options_str = "";
	 	cars.forEach( function(car) {
	 		  options_str += '<option value="' + car + '">' + car + '</option>';
	 		});
	 	
	 	orderMenu.innerHTML = options_str;
		orderMenu.name="user.orders["+counts+"].orderMenu";
		orderMenu.id="orderMenu"+counts;
		
		cell1.appendChild(orderMenu);
		
		
		
		
		
		
		
		var cell2 = row.insertCell(1);
		
		var orderQuantity = document.createElement("input");
		orderQuantity.type = "text";
		orderQuantity.name="user.orders["+counts+"].orderQuantity";
		orderQuantity.id="orderQuantity"+counts;
		cell2.appendChild(orderQuantity);

		textBoxCount();
	}
</SCRIPT>
<script type="text/javascript">

	function textBoxCount(){
		var count=document.getElementById("count").value;
		count++;
		document.getElementById("count").value=count;
	//	alert(count);

}
	function textBoxValues(){
		var finalString="";
		var count=document.getElementById("count").value;
	//	alert(count)
			
		for(var i=0;i<=count;i++){
			var hosue="orderMenu"+i;
			var orderQuantity="orderQuantity"+i;
			/* var country="country"+i; */

		var address=document.getElementById(hosue).value;
		var orderQuantity=document.getElementById(orderQuantity).value;
		/* var country=document.getElementById(country).value; */
		finalString=finalString+address+":"+orderQuantity+"#";
		}
		//	alert(finalString);
			document.getElementById("allVal").value=finalString;
		
}

</script>

<script language="Javascript" type="text/javascript">
 
        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 32)
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }
        
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
          
        return false;
        return true;
    }    
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
				<li class="active"><b>Order Form</b></li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Order </h1>
			</div>
		</div><!--/.row-->
									
		
		<div class="row">
			<div class="col-md-11" style="margin-left:30px">
				<div class="panel panel-default"style="margin-top: 20px;">
					
					<div class="panel-body">
					<p><%if(request.getAttribute("ordermsg")!=null){
						out.println(request.getAttribute("ordermsg"));
					}%></p>
						<form id="select2Form" class="form-horizontal" action="#" method="get">
						
						
						<input type="hidden" name="orderMenuFormContent" value="orderMenuFormContent"> 
							<fieldset>
							<!-- Customer ID -->
								 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Customer Name</label>
									<div class="col-md-9">
									<input  name="Customer_Name" type="text" onkeypress="return onlyAlphabets(event,this);" placeholder="Customer Name" class="form-control">
									</div>
								</div>
								
								<!-- Date & Time--->
							 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Order Date</label>
									<div class="col-md-9">
									<input  name="Order_Date" type="text" placeholder="<%=request.getParameter("tdate")%>" class="form-control" value="<%=request.getParameter("tdate")%>"  readonly="readonly">
									</div>
								</div>
								
								<!-- Table No -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Table No</label>
									<div class="col-md-9">
									<input  name="table_no" type="text" placeholder="<%=request.getParameter("t_no")%>" class="form-control" value="<%=request.getParameter("t_no")%>" readonly="readonly">
									</div>
								</div>
								
								<!-- Order Number -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Order Number</label>
									<div class="col-md-9">
									<input  name="Order_no" type="text" placeholder="<%=request.getParameter("ordno")%>" class="form-control" value="<%=request.getParameter("ordno")%>" readonly="readonly" >
									</div>
								</div>
							   <!-- Captain Name -->
							   <div class="form-group">
									<label class="col-md-3 control-label" for="name">Captain Name</label>
									<div class="col-md-9">
									<%
								        	
											try
											{
											ResultSet CFDIGCD=	CaptainFormDaoImpl.GridCaptain_detail();
												%>
											
												
										        <select class="form-control" name="Captain_name">
										        <option value="0">Select Menu</option>
										        <%  while(CFDIGCD.next())
										        { %>
										            
										            <option value="<%= CFDIGCD.getString("cap_name") %>"><%= CFDIGCD.getString("cap_name") %></option>
										        <% } %>
										        </select>
												<%
											
											}
											catch(Exception e)
											{
												System.out.println(e);
											}
											%>
									</div>
								</div>
								
							 <!--Item Cost-->
							 <input type="hidden" name="countOrders"	id="count" value="0"/>
<input type="hidden" name="allValues" id="allVal"/>
							 
							 
<!-- <input type="submit" value="SUBMIT" onclick="textBoxValues();"/> -->
								 <div class="form-group">
								 
									<label class="col-md-3 control-label" for="name"></label>
									<div class="col-md-9">

									<TABLE id="multiOrdersTable" width="" border="1" data-toggle="table">
														
										<TR>
											<TD>Order Menu</TD>
											<TD>Quantity</TD>

										</TR>
										<TR>

											<TD>
					
											<select class="form-control"  name="user.orders[0].orderMenu" id="orderMenu0" >
										         <option value="0">Select Menu</option>
										      <%try{
										    	  ResultSet OMDGOM= OrderMenuDao.GridOrderMenu_detail();
										    	  
										    	  while(OMDGOM.next())
										        { %>
										           
										            <option value="<%= OMDGOM.getString("item_name") %>"><%= OMDGOM.getString("item_name") %></option>
										        <% } %>
										        </select>
												<%
											
											}
											catch(Exception e)
											{
												System.out.println(e);
											}
											%>
											
										<!-- 	<INPUT type="text" name="user.orders[0].orderMenu" id="orderMenu0" /></TD> -->
											<TD><INPUT type="text"
												name="user.orders[0].orderQuantity" id="orderQuantity0" /></TD>
										</TR>
									</TABLE>
									<INPUT type="button" value="Add More Order" onclick="addRow('multiOrdersTable')" />
									
									    <%-- <select class="form-control" name="Order_Menu_Name" >
										         <option value="0">Select Menu</option>
										      <%try{
										    	  ResultSet OMDGOM= OrderMenuDao.GridOrderMenu_detail();
										    	  
										    	  while(OMDGOM.next())
										        { %>
										           
										            <option value="<%= OMDGOM.getString("item_name") %>"><%= OMDGOM.getString("item_name") %></option>
										        <% } %>
										        </select>
												<%
											
											}
											catch(Exception e)
											{
												System.out.println(e);
											}
											%>
								 --%>
									</div>
								</div>

								
								
								
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Quantity</label>
									<div class="col-md-9">
									<!-- <input  name="amt" type="text" placeholder="Quantity" class="form-control"> -->
									
									<select class="form-control" name="item_Quantity" >
									<option value="0" selected="selected">Select Quantity</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										         	
										        </select>
									
									</div>
								</div>
								<center>
								<button type="submit" class="btn btn-primary  "  onclick="textBoxValues();">Submit</button>
								<button type="reset" class="btn btn-default  ">Clear</button>
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
	<% }%>

</body>
</html>