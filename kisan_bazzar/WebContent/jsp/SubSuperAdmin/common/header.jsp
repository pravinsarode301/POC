<%
	String JspPagePathHeader = getServletContext().getInitParameter("UsersResources");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<link rel="stylesheet" href="<%=JspPagePathHeader%>css/datepicker.css">
<title>Shetkari bazaar | Homepage</title>
<link href="<%=JspPagePathHeader%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/navbar.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/carousel.css" rel="stylesheet">
<link href="<%=JspPagePathHeader%>css/select2.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=JspPagePathHeader%>js/jquery.js"></script>
<script src="<%=JspPagePathHeader%>js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript" src="<%=JspPagePathHeader%>js/select2.js"></script>
<script type="text/javascript" src="<%=JspPagePathHeader%>js/prettify.js"></script>
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


	<script>
		// Select dropdowns
		if ($('select').length) {
			// Traverse through all dropdowns
			$.each($('select'), function(i, val) {
				var $el = $(val);

				// If there's any dropdown with default option selected
				// give them `not_chosen` class to style appropriately
				// We assume default option to have a value of '' (empty string)
				if (!$el.val()) {
					$el.addClass("not_chosen");
				}

				// Add change event handler to do the same thing,
				// i.e., adding/removing classes for proper
				// styling. Basically we are emulating placeholder
				// behaviour on select dropdowns.
				$el.on("change", function() {
					if (!$el.val())
						$el.addClass("not_chosen");
					else
						$el.removeClass("not_chosen");
				});

				// end of each callback
			});
		}
	</script>

	<!-- HEADER SECTION START -->


	<div class="container-fluid"
		style="background: #01b200 none repeat scroll 0 0; height: 7px;">
	</div>
	<div class="container-fluid header-color">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-2" style="padding: 1px;">
						<a href="index.html"><img style="width: 170px; height: 85px;"
							src="img/logo-shetkari-bazaar.png" class="img-responsive">
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
										<li class="inactive" style="margin-right: -55px;"><a
											href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
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

	<!--HEADER SECTION END -->

	<!-- START OF BUTTON TRIGGER MODAL SECTION -->
	<!--Login Modal -->
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
				<div class="modal-body">
					<form>
						<div class="row">
							<div class="col-md-12">
								<label>Username</label> <input type="text"
									placeholder="(Ex.pravindongardive@gmail.com)"
									class="form-control" />
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-12">
								<label>Password</label> <input type="password"
									placeholder="Password" class="form-control" />
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-12">
								<input type="checkbox" name="" value=""> Remember Me
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-6">
								<a href="#" data-toggle="modal" data-target="#registration">Sign
									Up</a>
							</div>
							<div class="col-md-6">
								<a href="#" data-toggle="modal" data-dismiss="modal"
									data-target="#forgetpassword" class="pull-right"> Forgot
									Password</a>
							</div>
						</div>
				</div>

				<div class="modal-footer">
					<input type="reset" class="btn btn-danger" value="Reset" /> <a
						href="indexnext.html" class="btn btn-success">Login</a>
				</div>
				</form>
			</div>
		</div>
	</div>

	<!--End Login Modal -->
	<!--Sign Up Modal-->
	<div class="modal fade" id="registration" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="registration">Sign Up</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="row mar-5">
							<div class="col-md-6">
								<label>First Name:</label> <input type="text"
									placeholder="First name" class="form-control" />
							</div>
							<div class="col-md-6">
								<label>Last Name:</label> <input type="text"
									placeholder="Last name" class="form-control" />
							</div>
						</div>
						<div class="row mar-5">
							<div class="col-md-12">
								<label>Email ID:</label> <input type="text"
									placeholder="Email ID" class="form-control" />
							</div>
						</div>
						<div class="row mar-5">
							<div class="col-md-12">
								<label>Contact No.:</label> <input type="text"
									placeholder="Contact number" class="form-control" />
							</div>
						</div>
						<div class="row mar-5">
							<div class="col-md-6">
								<label>Password:</label> <input type="password"
									placeholder="Password" class="form-control" />
							</div>
							<div class="col-md-6">
								<label>Confirm Password:</label> <input type="password"
									placeholder="Confirm Password" class="form-control" />
							</div>
						</div>
						<br />

						<div class="modal-footer">
							<button type="reset" class="btn btn-danger">Reset</button>
							<a href="index.html" class="btn btn-success">Submit</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--End Sign Up Modal-->
	<!--Forgot Password Modal-->
	<div class="modal fade" id="forgetpassword" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="forgetpassword">Forgot Password</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="row">
							<div class="col-md-12">
								<label>Your Username</label> <input type="text"
									placeholder="(For ex:-pravinDongerdive@gmail.com)"
									class="form-control" />
							</div>
						</div>
						<br />
						<div class="modal-footer">
							<div class="row">
								<!-- <div class="col-md-4"> <a href="#" data-toggle="modal" data-target="#myModal" class="pull-left">Login</a>  </div> -->
								<div class="col-md-6 pull-right">
									<button type="reset" class="btn btn-danger">Reset</button>
									<a href="index.html" class="btn btn-success">Submit</a>
								</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--End Forgot Password Modal-->

	<!-- END OF BUTTON TRIGGER MODAL SECTION -->