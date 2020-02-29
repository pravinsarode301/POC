<%@page import="com.hotel.Model.DbModel"%>
<%@page import="com.hotel.Model.OrderMenuTotal"%>
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
body {
	counter-reset: Serial; /* Set the Serial counter to 0 */
}

table {
	border-collapse: separate;
}

tr td:first-child:before {
	counter-increment: Serial; /* Increment the Serial counter */
	content: counter(Serial); /* Display the counter */
}
</style>

</head>
<body>
	<%
		if (session == null) {
			response.sendRedirect("login.jsp");
		} else {
	%>
	<%@include file="Common/header.jsp"%>



	<div class="row">

		<div class="col-md-8" style="margin-left: 120px">
			<div class="panel panel-default" style="margin-top: 20px">
				<div class="panel-heading">Bill</div>
				<%
					if (request.getAttribute("payment_success_message") != null) {

%>
						
							<script>
							 alert("<%=request.getAttribute("payment_success_message") %>");
						
							</script>
							<%
						}
				%>
				
				
				<% String table_no;
				if (request.getAttribute("table_no1") != null) {
					table_no = (String) request.getAttribute("table_no1");
				} else {

					table_no = (String) request.getAttribute("tbl_no");

				} %>
				<div class="panel-body">
					<div class="col-md-8" style="margin-bottom: 20px;">
						<fieldset>

							<label class="col-md-12 control-label" for="name"><h1>Hotel
									Lumino</h1>
								<div style="margin-left: 40px;">
									<h4>
										<b>Not just good... it's Sonic good.</b>
									</h4>
								</div></label> </br>
							<h6>
								<label class="" for="name">Address: Jaymala Building,
									Office Number 2, Survey No 15, Old Naka, Warje 411 058, 14,
									Mutha Canal Rd, Warje, Pune, Maharashtra 411058</label> <label>Phone:086004
									46337</label></br> <label class="" for="name">Date : <%
 	java.text.DateFormat df = new java.text.SimpleDateFormat(
 				"dd/MM/yyyy");
 %>
									<%=df.format(new java.util.Date())%></label></br>
									<label>Venue:<%="table number "+table_no %>
									</label>
							</h6>
						</fieldset>
					</div>

					<table data-toggle="table" data-url="" border="1">

						<tr>
							<th data-field="name">Sr.No</th>
							<th data-field="id" data-align="right">Item Name</th>
							<th data-field="name">Quantity</th>
							<th data-field="name">Rate(1 Pics)</th>
							<th data-field="price">Amount</th>
						</tr>
						<%!static String order_no_payment_done;
	static String oderTableNo;
	 %>
						<%
							
						int total_amount_payment_done=0; 

								

								String qury = "SELECT od.order_no,od.c_date,od.table_no ,od.quantity,itde.item_amount,(od.quantity*itde.item_amount) as amount ,od.ord_menu FROM order_detail od , item_detail itde WHERE itde.item_name=od.ord_menu and od.table_no='"
										+ table_no + "'";
								ResultSet rt = DbModel.getConnection().createStatement()
										.executeQuery(qury);
								/* ResultSet rt= OrderMenuTotal.GridOrderMenu_detail(table_no); */
								while (rt.next()) {
									order_no_payment_done = rt.getString("od.order_no");
									oderTableNo = rt.getString("od.table_no");
									total_amount_payment_done=total_amount_payment_done+Integer.parseInt(rt.getString("amount"));
									
						%>

						<tr>
							<td></td>

							<td><%=rt.getString("od.ord_menu")%></td>
							<td><%=rt.getString("od.quantity")%></td>
							<td><%=rt.getString("itde.item_amount")%></td>
							<td name="1st" value="<%=rt.getString("amount")%>"><%=rt.getString("amount")%>
							</td>
						</tr>
						<%
							}
						%>

					</table>
					<div style="margin-top: 10px;">
						<form action="Controller" method="post">
							<input type="hidden" value="<%=order_no_payment_done%>"	name="order_no_payment_done"> 
							<input type="hidden" value="payment_done" name="payment_done"> 
							<input type="hidden" value="<%=oderTableNo%>" name="table_no_payment_done">
							
							<div class="col-md-8" style="margin-left: 310px;">
								<div class="form-group">
									<label class="col-md-6 control-label" for="name"
										style="margin-top: 0px;"><h4 style="color: #30a5ff;">
											<b>Total Amount:</b>
										</h4></label>
									<div class="col-md-4">
										<input name="total_amount_payment_done" type="text" placeholder="<%=total_amount_payment_done %>"
										value="<%=total_amount_payment_done %>"	class="form-control" readonly="readonly">
									</div>
								</div>
							</div>
					</div>
					</br> </br> </br>
					<div class="form-group" align="right">
						<button type="submit" class="btn btn-primary" onClick="window.print()">Payment Done !</button>
							

					</div>
					</form>	

					<br> <br>

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


	<%
		}
	%>

</body>
</html>