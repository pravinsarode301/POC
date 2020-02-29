<%@page import="com.hotel.Model.AlterCaptaindetails"%>
<%@page import="com.hotel.Model.CaptainFormDaoImpl"%>
<%@page import="com.hotel.Servlet.CaptainDetailsServlet"%>
<%@page import="java.util.Vector"%>
<%@page import="com.hotel.Service.ContactFormGetterSetter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Widgets</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<link href="css/site-demos.css" rel="stylesheet">
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>


<style type="text/css">


#captainupdate-form .fieldgroup {
    background: url("form-divider.gif") repeat-x scroll left top transparent;
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}

#captainupdate-form .fieldgroup label {
    float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 110px;
}

#captainupdate-form .fieldgroup input, #captainupdate-form .fieldgroup textarea, #captainupdate-form .fieldgroup select {
    float: right;
    margin: 10px 0;
    height: 25px;
}

#captainupdate-form .submit {
    padding: 10px;
    width: 220px;
    height: 40px !important;
}

#captainupdate-form .fieldgroup label.error {
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
            $("#captainupdate-form").validate({
                rules: {
                    cname:{ required: true },
                    dob:{ required: true },
                    mob:{ required: true,
                        minlength: 10,
                        maxlength:12
                        },
                        email: {
                            required: true,
                            email: true
                        },
                  address:{ required: true }   
                
                },
                messages: {
                   
                
                    cname:  "<font color=red>Please enter captain name</font>",
                    dob: { required: "<font color=red>Please enter date of birth</font>"},
                    mob :{
                        required: "<font color=red>Please enter a mobile number</font>",
                        minlength: "<font color=red> mobile number must be at least 10 digit long</font>"
                    },
                    email: "<font color=red>Please enter a valid email address</font>",
                    address:"<font color=red>Please enter captain address</font>"
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

<script type="text/javascript">
function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 32)
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if(iKeyCode < 48 || iKeyCode > 57)
      
    return false;
    return true;
}   
</script>


</head>

<body>
	<% 
 if(session==null){
	response.sendRedirect("login.jsp");
}else{	
%>
	<%@include file="Common/header.jsp"%>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active"><b>Captain Details / Edit Data</b></li>
		</ol>
	</div>
	<!--/.row-->

	<div class="row">
		<div class="col-md-11" style="margin-left: 30px">
			<div class="panel panel-default" style="margin-top: 20px;">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-envelope"></span> Contact Form
				</div>
				<div class="panel-body">
						
						<%  String captain_id;
						
						if(request.getAttribute("captain_id")!=null){
						captain_id=(String)request.getAttribute("captain_id");}
						else if(request.getAttribute("updateCaptainFormId")!=null){
						captain_id=(String)request.getAttribute("updateCaptainFormId");
						}else{
							captain_id=(String)request.getAttribute("captainIdFromServlet");
						}
						
					ResultSet rt=AlterCaptaindetails.getCaptaindetails(captain_id);
					
					 if(request.getAttribute("status_code_captain")!=null){
						
						out.println("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+(String)request.getAttribute("status_code_captain")+"</div>");
					} 
					while(rt.next()){
						%>
						
				<form class="form-horizontal" action="Controller" method="post" name="captainupdate-form" id="captainupdate-form" novalidate="novalidate">
						
						<input type="hidden" name="updateCaptainForm" value="updateCaptainForm">
						 
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Captain
									Name</label>
								<div class="col-md-9">
									<input id="name" name="cname" type="text" value="<%=rt.getString("cap_name").trim() %>"
									onkeypress="return onlyAlphabets(event,this);"	placeholder="<%=rt.getString("cap_name") %>" class="form-control" >
								</div>
							</div>
							<!-- Captain Number -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Captain
									ID</label>
								<div class="col-md-9">
									<input id="name" name="cid" type="text" value="<%=rt.getString("cap_id") %>"
									onkeypress="javascript:return isNumber (event)"	placeholder="<%=rt.getString("cap_id") %>" class="form-control" readonly="readonly">
								</div>
							</div>
							<!-- Date Of Birth -->

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Date Of
									Birth</label>
								<div class="col-md-9">
									<input id="dob" name="dob" type="date" value="<%=rt.getString("cap_dob") %>"
										placeholder="<%=rt.getString("cap_dob") %>" class="form-control" >
								</div>
							</div>

							<!-- Mobile Number--->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Mobile
									No.</label>
								<div class="col-md-9">
									<input id="mob" name="mob" type="text" value="<%=rt.getString("cap_mob") %>" minlength="10" maxlength="12"
									onkeypress="javascript:return isNumber (event)"	placeholder="<%=rt.getString("cap_mob") %>" class="form-control" >
								</div>
							</div>
							<!-- Email input-->	
							<div class="form-group">
								<label class="col-md-3 control-label" for="email">Your
									E-mail</label>
								<div class="col-md-9">
									<input id="email" name="email" type="email" value="<%=rt.getString("cap_email") %>"
										placeholder="<%=rt.getString("cap_email") %>" class="form-control" >
								</div>
							</div>

							<!--Joing Date-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Joing
									Date</label>
								<div class="col-md-9">
									<input id="jdate" name="jdate" type="text" value="<%=rt.getString("cap_jdt") %>"
										placeholder="<%=rt.getString("cap_jdt") %>" class="form-control" readonly="readonly">
								</div>
							</div>

							<!-- Message body -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="message">Address</label>
								<div class="col-md-9">
									<textarea class="form-control" id="message" name="address" 
										placeholder="<%=rt.getString("cap_addr") %>" rows="5" ><%=rt.getString("cap_addr").trim() %></textarea>
								</div>
							</div>

							<!-- Form actions -->
							<div class="form-group">
								<div class="col-md-12 widget-right">
									<button type="submit" class="btn btn-primary">Update</button>
									<button type="button" class="btn btn-primary" onclick="window.location.href='Controller?gobacktoCaptain=gobacktoCaptain'">Close</button>
									
								</div>
							</div>
						</fieldset>
					</form>
					<%} %>
				</div>
			</div>


		</div>
		<!--/.col-->

	</div>
	<!--/.col-->

		
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/chart.min.js"></script>
		<script src="js/chart-data.js"></script>
		<script src="js/easypiechart.js"></script>
		<script src="js/easypiechart-data.js"></script>
		<script src="js/bootstrap-datepicker.js"></script>
		<script src="js/bootstrap-table.js"></script>
		<script>
		$('#calendar').datepicker({
		});

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

		<%} %>
	
</body>
</html>