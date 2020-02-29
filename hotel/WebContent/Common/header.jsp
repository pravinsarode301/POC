<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"  %>

<% 


if(session.getAttribute("user_name")==null){
	request.setAttribute("directAccessStatus", "Please login First!");
	RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	rd.forward(request, response);
}else{
	
%>



<script src="js/bootstrap.min.js"></script>
<%!static String active="active"; %>
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<span class="glyphicon glyphicon-user"></span> 
						<% if(session.getAttribute("user_name")==null && session.isNew()!=true )
						{
						%>
						 User  <%}
						 else{
							 out.println("Welcome "+session.getAttribute("user_name"));//+" ( Role : " +session.getAttribute("user_role")+" )"); 
							 %>		
						<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="Controller?user_profile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
							<li><a href="Controller?LogOut"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul><%} %>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		<div id ="wrapper">
	
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<form action="Controller" method="get">
		<ul class="nav menu">
		<%
		if("Kitchen staff".equals(session.getAttribute("user_role"))){%>
		<li><a href="Controller?Alert"><span class="glyphicon glyphicon-info-sign"></span>Notification</a></li>
		<%}else if("captain".equals(session.getAttribute("user_role"))){ %>
		
		<li><a href="Controller?afterLoginDashboard"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
		<li><a href="Controller?OrderForms"><span class="glyphicon glyphicon-pencil"></span> Order Forms</a></li>
		<li><a href="Controller?Alert"><span class="glyphicon glyphicon-info-sign"></span>Notification</a></li>
		<%}else{ %>
			<li <%  if("afterLoginDashboard"==request.getAttribute("afterLoginDashboard")){%>class="<%=active %>" <%}%>><a href="Controller?afterLoginDashboard"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
		    <li <%  if("Captain"==request.getAttribute("Captain")){%>class="<%=active %>"<%} %>><a href="Controller?Captain"><span class="glyphicon glyphicon-th"></span>Captain Details</a></li>
			<li <%  if("OrderForms"==request.getAttribute("OrderForms")){%>class="<%=active %>"<%} %>><a href="Controller?OrderForms"><span class="glyphicon glyphicon-pencil"></span> Order Forms</a></li>
			<li <%  if("AddItoms"==request.getAttribute("AddItoms")){%>class="<%=active %>"<%} %>><a href="Controller?AddItoms"><span class="glyphicon glyphicon-plus"></span> Add New Item</a></li>
			
			<li <%  if("Alert"==request.getAttribute("Alert")){%>class="<%=active %>"<%} %>><a href="Controller?Alert"><span class="glyphicon glyphicon-info-sign"></span>Notification</a></li>
			<li <%  if(("PerdayReports"==request.getAttribute("PerdayReports")) ||("MonthReports"==request.getAttribute("MonthReports")) || ("HalfyearReports"==request.getAttribute("HalfyearReports")))		
										{%>class="<%=active %>"<%} %> class="parent"><a href="Controller?Alert">
				<a href="#">
					<span class="glyphicon glyphicon-list"></span> Reports<span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li>
						<a class="" href="Controller?PerdayReports">
							<span class="glyphicon glyphicon-share-alt"></span>Perday Reports
						</a>
					</li>
					<li>
						<a class="" href="Controller?MonthReports">
							<span class="glyphicon glyphicon-share-alt"></span>Month Reports
						</a>
					</li>
					<!-- <li>
						<a class="" href="Controller?HalfyearReports">
							<span class="glyphicon glyphicon-share-alt"></span>Halfyear Reports
 						</a>
					</li> -->
					
					<%} %>
				</ul>
			</li>
			
			
		</ul>
	</div><!--/.sidebar-->
	</form>
		</div>
		<%} %>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
	
	