<%@page import="com.hotel.Model.DbModel"%>
<%@page import="com.hotel.Model.OrderFormDaoImpl"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Panels</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
</head>
<body>
	<%
		if (session == null) {
			response.sendRedirect("login.jsp");
		} else {
	%>
	<%@include file="Common/header.jsp"%>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active"><b>Notificaton</b></li>
		</ol>
	</div>
	<!--/.row-->
	<%
		try {

				Connection con = DbModel.getConnection();
				Statement stmt = DbModel.createStatement(con);
	%>

	<div class="col-lg-12">
		<%!static String tblno = null;
	int i = 1;%>
		<h3>Order List</h3>
	</div>

	<div class="row">
		<%
			int numberRow = 0;
		int flag4=0;
					String flag = "";
					boolean flag1 = false;
					String sql1 = "SELECT count(*),	table_status FROM hotel_db.table_status";
					ResultSet rt1 = stmt.executeQuery(sql1);

					while (rt1.next()) {
						numberRow = rt1.getInt("count(*)");
					}
					for (i = 1; i <= numberRow; i++) {
		%>
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					Table No.
					<%=i%></div>
				<div class="panel-body">

					<%
						int tbn = i;
									String sql = "SELECT * FROM hotel_db.order_detail where table_no='" + tbn + "'";
									ResultSet rt = stmt.executeQuery(sql);
					%><table data-toggle="table" data-url=""
						class="table table-striped">
						<tr>
						<th data-field="id" data-align="">#</th>
							<th data-field="id" data-align="">Item</th>
							<th data-field="name">Quantity</th>
						</tr>
						<%
						int counter=1;
						int f=1;
						while (rt.next()) {
							
						%>
						<thead>
						</thead>
						<tbody>
							<tr>
						<%	if(rt.getString(5)==null){
								f=0;
								System.out.println(f);
								//continue;
							} %>
							<td><%=counter%>
							
							<%counter++;%></td>
								<td><%=rt.getString(5)%></td>
								<td><%=rt.getString(7)%></td>
								
							</tr>

							<%
							
							tblno = rt.getString(4);
							}
							%>

						</tbody>
					</table>
				<%-- <%if(f==0){%> --%>
				
					<%-- <a href="Controller?table=table&table_no=<%=tblno%>">
					<button	class="btn btn-primary">Bill</button></a> --%>
					<%-- <% } %> --%>
				
						
				</div>
			</div>
		</div>

		<%
			}
		%>

		<%
			} catch (Exception e) {
					System.out.println(e);
				}
		%>
		<%@include file="Common/footer.jsp"%>
<%
			}
		%>
		<script>
			!function($) {
				$(document).on(
						"click",
						"ul.nav li.parent > a > span.icon",
						function() {
							$(this).find('em:first').toggleClass(
									"glyphicon-minus");
						});
				$(".sidebar span.icon").find('em:first').addClass(
						"glyphicon-plus");
			}(window.jQuery);

			$(window).on('resize', function() {
				if ($(window).width() > 768)
					$('#sidebar-collapse').collapse('show')
			})
			$(window).on('resize', function() {
				if ($(window).width() <= 767)
					$('#sidebar-collapse').collapse('hide')
			})
		</script>

		
	
</body>
</html>