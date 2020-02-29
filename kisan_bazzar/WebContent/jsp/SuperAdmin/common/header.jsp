
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String JspPagePath = getServletContext().getInitParameter("SuperAdminResources");
%>

<% 
if(session.getAttribute("userName")==null){
request.setAttribute("directAccessStatus", "Please login First!");
RequestDispatcher rd=request.getRequestDispatcher("superAdminLogin.jsp");
rd.forward(request, response);
}else{
}
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<%@ page import="java.io.*,java.util.*"%>

<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shetkari Bazzar | Super Admin Portal</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link href="<%=JspPagePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=JspPagePath%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=JspPagePath%>css/datepicker3.css" rel="stylesheet"
	type="text/css" />
<link href="<%=JspPagePath%>css/bootstrap-table.css" rel="stylesheet"
	type="text/css" />
<link href="<%=JspPagePath%>css/styles.css" rel="stylesheet"
	type="text/css" />

<!--Icons-->
<script src="<%=JspPagePath%>js/lumino.glyphs.js" /></script>

<!--[if lt IE 9]>
<script src="<%=JspPagePath%>js/html5shiv.js" /></script>
<script src="<%=JspPagePath%>js/respond.min.js" /></script>
<![endif]-->

<link rel="shortcut icon" href="<%=JspPagePath%>img/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<%=JspPagePath%>img/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<%=JspPagePath%>img/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<%=JspPagePath%>img/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=JspPagePath%>img/ico/apple-touch-icon-57-precomposed.png">
</head>



<body onload="adminPortalIndexPageDetails()">
	<nav class="navbar navbar navbar-fixed-top header-color">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="index.html" class="pull-left"><img
				src="<%=JspPagePath%>img/logo-shetkari-bazaar.png"
				style="height: 88px; width: 180px"></a>
			<ul class="user-menu">
				<li class="dropdown pull-right" style="margin-top: 15px"><a
					href="#" class="dropdown-toggle" data-toggle="dropdown"
					style="color: #5F6468;"> <%  if (session.getAttribute("userName") != null && session.getAttribute("userRole")!=null) {
 		out.println(session.getAttribute("userName")+"( Role : "+(session.getAttribute("userRole")+" )"));
 	} else {
 %>User <%
 	}
 %> <svg class="glyph stroked male-user">
          <use xlink:href="#stroked-male-user"></use>
        </svg> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#"> <svg class="glyph stroked male-user">
              <use xlink:href="#stroked-male-user"></use>
            </svg> Profile
						</a></li>
						<li><a href="#"> <svg class="glyph stroked gear">
              <use xlink:href="#stroked-gear"></use>
            </svg> Settings
						</a></li>
						<li><a href="SuperAdmin?superAdminLogout"> <svg
									class="glyph stroked cancel">
              <use xlink:href="#stroked-cancel"></use>
            </svg> Logout
						</a></li>
					</ul></li>
			</ul>
		</div>
		</div>
		<!-- /.container-fluid -->
	</nav>



	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar"
		style="margin-top: 3%">
		<!-- <form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form> -->
		<ul class="nav menu">
			<li><a href="SuperAdmin?superAdminIndex" class="active"><svg
						class="glyph stroked dashboard-dial">
						<use xlink:href="#stroked-dashboard-dial"></use></svg> Dashboard</a></li>
			<li><a
				href="SuperAdmin?customParameterString=gridCompanyData&status=default"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Company List</a></li>
			<li><a href="SuperAdmin?addCompanyData"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Add Company</a></li>

			<li><a href="SuperAdmin?addProducts"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Add Products</a></li>
						
			<li><a href="SuperAdmin?addFarmerData"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Add Farmer</a></li>

			<li><a
				href="SuperAdmin?customParameterString=gridFarmerData&status=default"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Farmer List</a></li>
			<%if("SUPERADMIN".equals(session.getAttribute("userRole"))){%>
			<li><a href="SuperAdmin?createAdmin"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Create Sub-Admin</a></li>
			<%} %>
			<li><a href="SuperAdmin?changePassword"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Change Password</a></li>
			<li><a href="SuperAdmin?superAdminLogout"><svg
						class="glyph stroked star">
						<use xlink:href="#stroked-star"></use></svg>Logout</a></li>
		</ul>



	</div>
	<!--/.sidebar-->



	<!--Icons-->
	</br>


	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"
		style="margin-top: 1.5%">