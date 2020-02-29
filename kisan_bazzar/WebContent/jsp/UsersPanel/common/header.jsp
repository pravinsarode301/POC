<!-- header section -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Shetkari bazaar | Homepage</title>

<%
	String JspPagePathHeader = getServletContext().getInitParameter("UsersResources");
%>


<!-- css resources link -->
<link href="<%=JspPagePathHeader%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/navbar.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/carousel.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/styles.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/select2.css" type="text/css" rel="stylesheet">

<link href="<%=JspPagePathHeader%>css/bootstrap-table.css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/bootstrap-theme.css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/bootstrap-theme.css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/bootstrap-theme.min.css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/bootstrap.minold (2).css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/datepicker.css" type="text/css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/datepicker3.css" type="text/css" rel="stylesheet">



<!-- javascript resources link -->
<script type="text/javascript" src="<%=JspPagePathHeader%>js/jquery.js"></script>
<script type="text/javascript"
	src="<%=JspPagePathHeader%>js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript" src="<%=JspPagePathHeader%>js/select2.js"></script>
<script type="text/javascript"
	src="<%=JspPagePathHeader%>js/prettify.js"></script>

<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">


</head>
<body>
	<!-- facebook Intigration -->
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<div class="container-fluid"
		style="background: #01b200 none repeat scroll 0 0; height: 7px;">
	</div>
	<div class="container-fluid header-color">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-2" style="padding: 1px;">
						<a href="UserController?welcomePage"><img style="width: 170px; height: 85px;"
							src="<%=JspPagePathHeader%>img/logo-shetkari-bazaar.png"
							class="img-responsive"> </a>
					</div>
					<div class="col-md-10">
						<!-- Static navbar -->
						<nav class="navbar navbar-default pull-right">
							<%
								if (session.getAttribute("userName") != null) {
									if ("FARMER-USER".equalsIgnoreCase((String) session.getAttribute("userRole"))) {
							%>

							<div class="container-fluid">
								<div class="navbar-header">
									<br>

									<p style="margin-top: 4px;">Welcome!</p>
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse" data-target="#navbar"
										aria-expanded="false" aria-controls="navbar">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</div>
								<div id="navbar" class="navbar-collapse menu-margin collapse">
									<ul class="nav nav-pills">

										<li></a></li>

										<div class="dropdown "
											style="margin-left: 60px; background-color: rgba(0, 0, 0, 0) none repeat scroll 0 0;">


											<button
												style="border: 0px none; background: transparent none repeat scroll 0% 0%;"
												aria-expanded="false" aria-haspopup="true"
												data-toggle="dropdown" type="button">
												<%=session.getAttribute("welcomeName")%>
												&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>
											</button>



											<ul class="dropdown-menu" aria-labelledby="dLabel">
												<li><a
													href="UserController?customParameterString=farmerProfile&status=farmSpecsData&farmerId=<%=session.getAttribute("userId")%>">My
														Profile</a></li>
												<li><a href="#">View Requirment</a></li>
												<li><a href="UserLogout">Logout</a></li>
											</ul>
										</div>

									</ul>
								</div>
								<!--/.nav-collapse -->
							</div>
							<!--/.container-fluid -->
							<%
								} else {
							%>

							<div class="container-fluid">
								<div class="navbar-header">
									<br>

									<p style="margin-top: 4px;">Welcome!</p>
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse" data-target="#navbar"
										aria-expanded="false" aria-controls="navbar">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</div>
								<div id="navbar" class="navbar-collapse menu-margin collapse">
									<ul class="nav nav-pills">

										<li></a></li>

										<div class="dropdown "
											style="margin-left: 60px; background-color: rgba(0, 0, 0, 0) none repeat scroll 0 0;">


											<button
												style="border: 0px none; background: transparent none repeat scroll 0% 0%;"
												aria-expanded="false" aria-haspopup="true"
												data-toggle="dropdown" type="button">
												<%=session.getAttribute("welcomeName")%>
												&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>
											</button>



											<ul class="dropdown-menu" aria-labelledby="dLabel">
												<%-- <li><a href="companyprofileServlet?userName=<%=session.getAttribute("userName")%>&userRole=<%=session.getAttribute("userRole")%>&userId=<%=session.getAttribute("userId")%>">My Profile</a></li> --%>
												<li><a href="viewCompanyProfile?status=comSpecsData">My
														Profile</a></li>
												<li><a href="UserController?postCompReq">Post
														Requirment</a></li>
												<li><a
													href="CompanyInbox?PageId=<%=session.getAttribute("userId")%>">View Requirment</a></li>
												<li><a href="UserLogout">Logout</a></li>
											</ul>
										</div>

									</ul>
								</div>
								<!--/.nav-collapse -->
							</div>
							<!--/.container-fluid -->
							<%
								}
								} else {
							%>
							<div class="container-fluid">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse" data-target="#navbar"
										aria-expanded="false" aria-controls="navbar">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</div>
								<div id="navbar" class="navbar-collapse menu-margin collapse">
									<ul class="nav nav-pills">
										<li class="inactive"><a href="#" data-toggle="modal"
											data-target="#myModal">login</a></li>
										<li><a href="#" data-toggle="modal"
											data-target="#registration">Sign up</a></li>
									</ul>
								</div>
								<!--/.nav-collapse -->
							</div>
							<!--/.container-fluid -->
							<%
								}
							%>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>