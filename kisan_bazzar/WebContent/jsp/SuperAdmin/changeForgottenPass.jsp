<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
	<!-- this page is working without any bug or any error it show every massage 
	written by the dnyaneshwar narwade
	 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forms</title>
<% String jsp=getServletContext().getInitParameter("SuperAdminResources"); %>

<!-- bootstrap CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>


<link href="<%=jsp %>css/bootstrap.min.css"	rel="stylesheet" type="text/css" />
<link href="<%=jsp %>css/datepicker3.css" rel="stylesheet" type="text/css" />
<link href="<%=jsp %>css/bootstrap-table.css" rel="stylesheet" type="text/css" />
<link href="<%=jsp %>css/styles.css" rel="stylesheet" type="text/css" />

<link href="<%=jsp %>css/site-demos.css" rel="stylesheet">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="<%=jsp %>js/jquery.validate.min.js"></script>

<style>
#content {
	background-color: #C6F5F2;
	width: 950px;
	min-height: 550px;
	text-align: left;
	padding: 20px;
}

h1 {
	padding: 20px 10px 20px 10px;
}

h2 {
	padding-left: 0px !important;
}

#header {
	background-color: #CA410B !important;
}

.large {
	font-size: 22px;
}

.orange {
	color: orange;
}

.italic {
	font-style: italic
}

.textmiddle {
	vertical-align: middle;
}

.padout {
	padding-left: 25px;
	padding-right: 25px;
}

.rounded-corners {
	-moz-border-radius: 40px;
	-webkit-border-radius: 40px;
	-khtml-border-radius: 40px;
	border-radius: 40px;
}

.rounded-corners-top {
	-moz-border-top-radius: 40px;
	-webkit-border-radius: 40px;
	-khtml-border-radius: 40px;
	border-radius: 40px;
}

.right {
	float: right;
}

.scrolldown {
	padding-left: 20px;
	color: #EDECE8;
	font-size: 40px;
	font-weight: bold;
	vertical-align: middle;
	text-shadow: #6374AB 2px 2px 2px;
}

.contentblock {
	margin: 0px 20px;
}

.results {
	border: 1px solid blue;
	padding: 20px;
	margin-top: 20px;
	min-height: 50px;
}

.blue-bold {
	font-size: 18px;
	font-weight: bold;
	color: blue;
}

/* example styles for validation form demo */
#register-form {
	border: 1px solid #DFDCDC;
	border-radius: 15px 15px 15px 15px;
	display: inline-block;
	margin-bottom: 30px;
	margin-left: 20px;
	margin-top: 10px;
	padding: 25px 50px 10px;
	width: 350px;
}

#register-form .fieldgroup {
	background: url("form-divider.gif") repeat-x scroll left top transparent;
	display: inline-block;
	padding: 8px 10px;
	width: 340px;
}

#register-form .fieldgroup label {
	float: left;
	padding: 15px 0 0;
	text-align: right;
	width: 110px;
}

#register-form .fieldgroup input, #register-form .fieldgroup textarea,
	#register-form .fieldgroup select {
	float: right;
	margin: 10px 0;
	height: 25px;
}

#register-form .submit {
	padding: 10px;
	width: 220px;
	height: 40px !important;
}

#register-form .fieldgroup label.error {
	color: #FB3A3A;
	display: inline-block;
	margin: 4px 0 5px 125px;
	padding: 0;
	text-align: left;
	width: 220px;
}
</style>
<script type="text/javascript">
function nospaces(t){
if(t.value.match(/\s/g)){
alert('Sorry, you are not allowed to enter any spaces');
t.value=t.value.replace(/\s/g,'');
}
}
</script>
<script type="text/javascript">
/**
  * Basic jQuery Validation Form Demo Code
  * Copyright Sam Deering 2012
  * Licence: http://www.jquery4u.com/license/
  */
(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#register-form").validate({
                rules: {
                    
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    agree: "required"
                },
                messages: {
                   
                    password: {
                        required: "<font color=red>Please enter a password</font>",
                        minlength: "<font color=red>Your password must be at least 5 characters long</font>"
                    },
                    email: "<font color=red>Please enter a valid email address</font>",
                    agree: "Please accept our policy"
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


<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a href="index.html" class="pull-left"><img
			src="<%=jsp %>img/logo-shetkari-bazaar.png" 
			style="height: 88px; width: 190px"></a>

	</div>

</div>
<!-- /.container-fluid --> </nav>
</head>
<body>
	<br />
	<br />
	<br />
	<div class="row">
		<div
			class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default panel-col-sm-8">
				<div class="panel-heading">change password</div>
				
					<% 
					if(request.getAttribute("resultStatus")!=null){
						%>
						<strong><%=request.getAttribute("resultStatus")%></strong>
						<%
					}
					%>
					<% 
					if(request.getAttribute("wrong_maching_pass")!=null){
						%>
						<strong style="color:blue; text-align:center;font-size:10px;"><%=request.getAttribute("wrong_maching_pass")%></strong>
						<%
					}
					%>
				<div class="panel-body">
					<form role="form" action="SuperAdmin?updateforgotpass" method="post"
						name="register-form" id="register-form" novalidate="novalidate">
						<p></p>
						<fieldset>
						<div class="form-group">

								<input name="loginlink" type="hidden" value="loginlink" /> <input
									class="form-control" placeholder="Email" name="UserName"
									type="text" autofocus="" required>
							</div>
							<div class="form-group">

								<input name="loginlink" type="hidden" value="loginlink" /> <input
									class="form-control" placeholder="Enter Your New Password" name="newPassword"
									type="password" autofocus="" required>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Enter Your Conform Password"
									name="reNewPassword" type="password" value="" required>
							</div>

							<!-- <div class="form-group pull-right">
								<a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">Forgot Password?</a>
							</div> -->

							<input type="submit" class="btn btn-primary" value="Change">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>
	<!-- /.row -->


<!-- Button trigger modal -->


<!-- Modal -->
<!-- Small modal -->

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
  
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="panel-body">
				<%
					if (request.getAttribute("validEmailStatus") != null) {
				%>
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("validEmailStatus")%>
					</strong>
					<%
						}
					%>

				</div>
      
       <form role="form" action="SuperAdmin?forgotpass" method="post">
       
       
       	<div class="row" style="margin:20px 0px;">
       		<div class="col-md-12">
       			<input type="text" class="form-control" placeholder="Enter Your Email" name="userName"/>
       		</div>
       	</div>
       	 <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancle</button>
        
        <input type="submit" class="btn btn-primary" value="Send" />
      </div>
       </form>
      
    </div>
    
  </div>
</div>



	<script src="<%=jsp %>js/jquery-1.11.1.min.js"></script>
	<script src="<%=jsp %>js/bootstrap.min.js"></script>
	<script src="<%=jsp %>js/chart.min.js"></script>
	<script src="<%=jsp %>js/chart-data.js"></script>
	<script src="<%=jsp %>js/easypiechart.js"></script>
	<script src="<%=jsp %>js/easypiechart-data.js"></script>
	<script src="<%=jsp %>js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>

</body>
</html>