<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forms</title>
<%
	String jsp = getServletContext().getInitParameter("SuperAdminResources");
%>

<!-- bootstrap CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">



<link href="<%=jsp%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<link href="<%=jsp%>css/styles.css" rel="stylesheet" type="text/css" />

<link href="<%=jsp%>css/site-demos.css" rel="stylesheet">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="<%=jsp%>js/jquery.validate.min.js"></script>
<script src="<%=jsp%>js/jquery-1.11.1.min.js"></script>
<script src="<%=jsp%>js/bootstrap.min.js"></script>
<script src="<%=jsp%>js/chart.min.js"></script>
<script src="<%=jsp%>js/chart-data.js"></script>
<script src="<%=jsp%>js/easypiechart.js"></script>
<script src="<%=jsp%>js/easypiechart-data.js"></script>
<script src="<%=jsp%>js/bootstrap-datepicker.js"></script>

</head>
<body style="padding-top:0px">
	
	<%
		String JspPagePathHeader = getServletContext().getInitParameter("UsersResources");
	%>
	<div class="container-fluid"
		style="background: #01b200 none repeat scroll 0 0; height: 7px;">
	</div>
	<div class="container-fluid header-color" style="border-bottom: 1px solid rgba(0, 0, 0, 0.19);">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-2" style="padding: 1px;">
						<a href="index.html"><img style="width: 170px; height: 85px;"
							src="<%=JspPagePathHeader%>img/logo-shetkari-bazaar.png"
							class="img-responsive"> </a>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div
			class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div id="error-page">

				<div class="row">
					<div class="col s12">
						<div class="browser-window">
							<div class="top-bar">
								<div class="circles">
									<div id="close-circle" class="circle"></div>
									<div id="minimize-circle" class="circle"></div>
									<div id="maximize-circle" class="circle"></div>
								</div>
							</div>
							<div class="content">
								<div class="row">
									<div id="site-layout-example-top" class="col s12">
										<p class="flat-text-logo center white-text caption-uppercase">Sorry
											but we couldn't find this page :</p>
									</div>
									<div id="site-layout-example-right" class="col s12 m12 l12">
										<div class="row center">
											<h1 class="text-long-shadow col s12">HTTP Error 500
												Internal server error</h1>
										</div>
										<div class="row center">
											<p class="center white-text col s12">It seems that this
												page doesn't exist.</p>
											<p class="center s12">
												<button
													onclick="window.location.href='SuperAdmin?serverDownBackLoginLink'"
													class="btn waves-effect waves-light">Back to login
													page !</button>
											<p></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.col-->
	</div>
	<!-- /.row -->
</body>
</html>