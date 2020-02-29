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

<link href="<%=JspPagePathHeader%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/navbar.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/carousel.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/select2.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="<%=JspPagePathHeader%>js/jquery.js"></script>
<script src="<%=JspPagePathHeader%>js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript" src="<%=JspPagePathHeader%>js/select2.js"></script>
<script type="text/javascript" src="<%=JspPagePathHeader%>js/jquery.form.min.js"></script>
<script type="text/javascript" src="<%=JspPagePathHeader%>js/prettify.js"></script>
<script type="text/javascript" src="<%=JspPagePathHeader%>js/ajax-call.js"></script>



</head>
<body onload="portalProduct()">
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
							src="<%=JspPagePathHeader%>img/logo-shetkari-bazaar.png" class="img-responsive">
						</a>
					</div>
					<div class="col-md-10">
						<!-- Static navbar -->
						<nav class="navbar navbar-default pull-right">
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
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

	  
<!-- Button trigger modal -->
 

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Login</h4>
			</div>
			<div class="modal-body" >
				<%
					if (request.getAttribute("loginFailedStatus") != null) {
						out.println(request.getAttribute("loginFailedStatus"));
					}
				%>
				<!-- to show login status -->
					<div class="panel-body" id="xx" style="display:none;">
					
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><div id="loginStatus" style="display:none;text-align:center;"></div></strong>
					<p id="p1" style="text-align:center;"></p>		
							
						</div>
					</div>
					
					<form method="post" id="verifylogin" action="LoginServlet" >
						<input type="hidden" class="form-control" name="dataFromUserPanel"
							value="dataFromUserPanel" />
						<div class="row">
							<div class="col-md-12">
								<label>Username</label> <input type="text" class="form-control"
									name="userName" id="userName" />
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-12">
								<label>Passward</label> <input type="password"
									class="form-control" name="password" id="password" />
							</div>
						</div>
						<br />
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-success" id="login"
								name="login" onclick="checkLogin()">Login</button>
						</div>
					</form>
						<div class="row">
						<div class="col-md-12">
							<input type="checkbox" name="RememberMe" value=""> Remember Me
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-md-6">
							<a href="#" data-toggle="modal" data-target="#registration">Registration</a>
						</div>
						<div class="col-md-6">
							<a href="#" data-toggle="modal" data-target="#forgetpassword"
								class="pull-right"> Forget Password</a>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
</div>
<!--Modal-->

<script type="text/javascript">
					
</script>

<div class="modal fade" id="registration" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="registration">Register</h4>
			</div>
			<div class="modal-body">
			<div id="emailexiststatus"></div>
				<form action="FarmerSignUp" method="post">
					<div class="row mar-5">
						<div class="col-md-6">
							<label>First Name:</label> <input type="text"
								class="form-control" name="farmerFirstName" />
						</div>
						<div class="col-md-6">
							<label>Last Name:</label> <input type="text" class="form-control"
								name="farmerLastName" />
						</div>
					</div>
					<div class="row mar-5">
						<div class="col-md-12">
							<label>Email ID:</label> <input type="email" class="form-control"
								name="farmerEmailId" id="farmerEmailId" onblur="testFarmerEmailId()"/>
						</div>
					</div>
					<div class="row mar-5">
						<div class="col-md-12">
							<label>Contact No.:</label> <input type="text"
								class="form-control" name="farmerContactNo" />
						</div>
					</div>
					<div class="row mar-5">
						<div class="col-md-6">
							<label>Password:</label> <input type="password"
								class="form-control" name="farmerPassword" />
						</div>
						<div class="col-md-6">
							<label>Confirm Password:</label> <input type="text"
								class="form-control" name="farmerRePassword" />
						</div>
					</div>
					<br />

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--Modal-->

<div class="modal fade" id="forgetpassword" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				
				<h4 class="modal-title" id="forgetpassword">Forget Password</h4>
			</div>
			<div class="modal-body">
			<div id="emailExistForForgotPswdstatus" ></div>
				<form >
					<div class="row">
						<div class="col-md-12">
							<label>Enter Your Username</label>
							 <input type="text"	class="form-control" name="userForgetPasswordEmail" id="userForgetPasswordEmail" onblur="userForgetPasswordCheck()"/>
						</div>
					</div>
					<br />
					<div class="modal-footer">
						<div class="row">
							<div class="col-md-4">
								<a href="#" data-toggle="modal" data-target="#myModal"
									class="pull-left">Login</a>
							</div>
							<div class="col-md-6 pull-right">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Submit</button>
							</div>

						</div>
					</div>
			</div>
		</div>
	</div>
	</div>