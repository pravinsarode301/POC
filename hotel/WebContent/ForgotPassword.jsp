<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forms</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/site-demos.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>


<link rel="stylesheet" type="text/css" href="css/bootstrap.css">



<style type="text/css">


#content { background-color:#C6F5F2; width:950px; min-height:550px; text-align:left; padding:20px;  }
h1 {
    padding:20px 10px 20px 10px;
}
h2 {
    padding-left: 0px !important;
}
#header {
    background-color: #CA410B !important;
}
.large { font-size:22px; }
.orange { color:orange; }
.italic { font-style:italic }
.textmiddle {vertical-align:middle;}
.padout { padding-left:25px; padding-right:25px; }
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
.scrolldown { padding-left:20px; color:#EDECE8; font-size:40px; font-weight:bold; vertical-align:middle;
	text-shadow: #6374AB 2px 2px 2px;
 }
 .contentblock { margin: 0px 20px; }
 .results { border: 1px solid blue; padding:20px; margin-top:20px; min-height:50px; }
 .blue-bold { font-size:18px; font-weight:bold; color:blue; }

 /* example styles for validation form demo */
#forgotpass-form {
   
    border: 1px solid #DFDCDC;
    border-radius: 15px 15px 15px 15px;
    display: inline-block;
    margin-bottom: 30px;
    margin-left: 20px;
    margin-top: 10px;
    padding: 25px 50px 10px;
    width: 350px;
}

#forgotpass-form .fieldgroup {
    background: url("form-divider.gif") repeat-x scroll left top transparent;
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}

#forgotpass-form .fieldgroup label {
    float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 110px;
}

#forgotpass-form .fieldgroup input, #forgotpass-form .fieldgroup textarea, #forgotpass-form .fieldgroup select {
    float: right;
    margin: 10px 0;
    height: 25px;
}

#forgotpass-form .submit {
    padding: 10px;
    width: 220px;
    height: 40px !important;
}

#forgotpass-form .fieldgroup label.error {
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

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#forgotpass-form").validate({
                rules: {
                    
                    email: {
                        required: true,
                        email: true
                    },
                    newpassword: {
                        required: true,
                        minlength: 5,
                        maxlength:25
                    },
                    renewpassword: { 
                        equalTo:"#newpassword",
                        	 required: true,
                             minlength: 5
                   },
                   security_question:{ required: true },
                   security_answer:{ required: true }
                
                },
                messages: {
                   
                	newpassword: {
                		required: "<font color=red>Please enter a new password</font>",
                        minlength: "<font color=red>Your password must be at least 5 characters long</font>"
                    },
                    renewpassword: {
                        required: "<font color=red>Please re-enter a new password</font>", 
                        	minlength: "<font color=red>Your password must be at least 5 characters long</font>"
                       
                    },
                    email:  "<font color=red>Please enter a valid email address</font>",
                    security_question:  "<font color=red>Please select any one security question</font>",
                    security_answer:  "<font color=red>Please type security answer</font>",
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




<script language="javascript" type="text/javascript">

//Browser Support Code
function ajaxFunction(){
   var ajaxRequest;  // The variable that makes Ajax possible!
   try{
   
      // Opera 8.0+, Firefox, Safari
      ajaxRequest = new XMLHttpRequest();
   }catch (e){
      
      // Internet Explorer Browsers
      try{
         ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
      }catch (e) {
         
         try{
            ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
         }catch (e){
         
            // Something went wrong
            alert("Your browser broke!");
            return false;
         }
      }
   }
   
   // Create a function that will receive data
   // sent from the server and will update
   // div section in the same page.
   ajaxRequest.onreadystatechange = function(){
   
      if(ajaxRequest.readyState == 4){
         var ajaxDisplay = document.getElementById('ajaxDiv');
         ajaxDisplay.innerHTML = ajaxRequest.responseText;
      }
   }
   
   // Now get the value from user and pass it to
   // server script.
   var email = document.getElementById('email').value;
   
   queryString =  email;
   ajaxRequest.open("GET", "Controller?ajaxemailretrive" + queryString, true);
   ajaxRequest.send(null); 
}

</script>



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
			
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
</head>
<body>
<br/><br/><br/>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Reset Password</div>
				<div class="panel-body">
					<form role="form" action="Controller" method="post" name="forgotpass-form" id="forgotpass-form" novalidate="novalidate">
					<p>
							<%
					if(request.getAttribute("updatePswdSuccessMsg")!=null){
						out.println(request.getAttribute("updatePswdSuccessMsg")+"<a href='login.jsp'> Login again </a>");
					}
					%>	</p>
						<fieldset>
							<div class="form-group">
							<input name="forgotpasswordlink" type="hidden" value="forgotpasswordlink" />
							<input class="form-control" placeholder="E-mail" name="email" type="email" autofocus="" onblur='ajaxFunction()'>
							</div>
							<div class="form-group">
							<select  class="form-control"  name="security_question">
							
							<option disabled selected hidden value="">--choose security question--</option>
							<option value="Enter your pet name">Enter your pet name</option>
							<option value="Enter you 1st school name">Enter you 1st school name</option>
							<option value="Enter you 1st school name">Enter your nick name</option>
							<option value="Enter you 1st school name">Enter your mother name</option>
							<option value="Enter you 1st school name">Enter your village name</option>
							<option value="Enter you 1st school name">Enter your favorite player name</option>
							<option value="Enter you 1st school name">Enter your 1st lover name </option>
							<option value="Enter you 1st school name">Enter your favorite flower name</option>
							</select>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="type your answer"  name="security_answer" type="text" value="" >
							</div>
							
							<div class="form-group">
								<input class="form-control" placeholder="New Password" name="newpassword" id="newpassword"  type="password" >
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Re-enter New Password" name="renewpassword"  type="password">
							</div>
							
							
							<div class="form-group pull-left">
							<a href='login.jsp'>Login again</a>
							</div>
							<input type="submit" class="btn btn-primary pull-right" style="margin-right: 00px;" value="Update Password"></fieldset>
							
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	



	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
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