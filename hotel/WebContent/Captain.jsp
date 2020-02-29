<%@page import="com.hotel.Model.AlterCaptaindetails"%>
<%@page import="com.hotel.Model.AlterOrderdetails"%>
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


#captain-form .fieldgroup {
    background: url("form-divider.gif") repeat-x scroll left top transparent;
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}

#captain-form .fieldgroup label {
    float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 110px;
}

#captain-form .fieldgroup input, #captain-form .fieldgroup textarea, #captain-form .fieldgroup select {
    float: right;
    margin: 10px 0;
    height: 25px;
}

#captain-form .submit {
    padding: 10px;
    width: 220px;
    height: 40px !important;
}

#captain-form .fieldgroup label.error {
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
            $("#captain-form").validate({
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
    if (iKeyCode < 48 || iKeyCode > 57)
      
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
			<li class="active"><b>Captain Details</b></li>
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
						<%if(request.getAttribute("Code")!=null){
													
										//out.println(request.getAttribute("Code"));
										out.println("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+(String)request.getAttribute("Code")+"</div>");
												}/* else if(request.getAttribute("status_code_captain")!=null){
						out.println("<div class='alert alert-success'>"+(String)request.getAttribute("status_code_captain")+"</div>");
					}  */
						%>
						
						<%if(request.getAttribute("deleteCaptainStatus")!=null){
							
							out.println("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+(String)request.getAttribute("deleteCaptainStatus")+"</div>");
						}%>
						
					<form class="form-horizontal" action="Controller" method="post" name="captain-form" id="captain-form" novalidate="novalidate">
						
						<input type="hidden" name="CaptionFormDetails" value="CaptionFormDetails">
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Captain
									Name</label>
								<div class="col-md-9">
									<input  name="cname" type="text" placeholder="Captain Name" class="form-control" onkeypress="return onlyAlphabets(event,this);"autofocus="">
								</div>
							</div>
							<!-- Captain Number -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Captain
									ID</label>
								<div class="col-md-9">
								<%!int previous_captainId; %>
									<%! static int cureent_captainId=0; %>
									<%
									previous_captainId=AlterCaptaindetails.last_insert_id_Captain();
									cureent_captainId=previous_captainId+1;
									%>
									<input  name="cid" type="text"
										placeholder="<%=cureent_captainId %>" class="form-control" value="<%=cureent_captainId %>" readonly="readonly">
								</div>
							</div>
							<!-- Date Of Birth -->

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Date Of
									Birth</label>
								<div class="col-md-9">
									<input  name="dob" type="date"
										placeholder="Date Of Birth" class="form-control">
								</div>
							</div>

							<!-- Mobile Number--->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Mobile
									No.</label>
								<div class="col-md-9">
									<input  name="mob" type="text" 
										minlength="10" maxlength="12"	placeholder="Mobile Number" class="form-control" onkeypress="javascript:return isNumber (event)">
								</div>
							</div>
							<!-- Email input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="email">Your
									E-mail</label>
								<div class="col-md-9">
									<input id="email" name="email" type="email"
										placeholder="Your email" class="form-control">
								</div>
							</div>

							<!--Joing Date-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Joing
									Date</label>
								<div class="col-md-9">
								<% java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
										String hh=df.format(new java.util.Date());
										%>
									<input name="jdate" type="text" value="<%=hh  %>"
										 class="form-control" readonly="readonly">
								</div>
							</div>

							<!-- Message body -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="message">Address</label>
								<div class="col-md-9">
									<textarea class="form-control" name="address"
										placeholder="Please enter your Address here..." rows="5" ></textarea>
								</div>
							</div>

							<!-- Form actions -->
							<div class="form-group">
								<div class="col-md-12 widget-right">
									<button type="submit" class="btn btn-default btn-md pull-right">Submit</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>


		</div>
		<!--/.col-->

	</div>
	<!--/.col-->
<div class="row">
			<div class="col-md-11" style="margin-left:30px ; ">
				<div class="panel panel-default">
					<div class="panel-heading">Captain List</div>
					<div class="panel-body" >
						<table data-toggle="table" data-url="">
						<!-- <thead> -->
						<tr>
							<th data-field="id" data-align="right">Captain ID</th>
							<th data-field="name">Captain Name</th>
							<th data-field="name">Mobile No.</th>
							<th data-field="name">Date Of Joining</th>
							<th data-field="price">Action</th>
						</tr> <!-- </thead> -->
						<!-- <tbody> --> 
						<%
							try
							{
							ResultSet rs=CaptainFormDaoImpl.GridCaptain_detail();
								
								
								while(rs.next())
										{
									/*  out.println(rs.getString(2));
									out.println(rs.getString(1));
									out.println(rs.getString(4));
							S		out.println(rs.getString(5));
									out.println(rs.getString(7));  */
									%>
										

						<tr>
							<td><%=rs.getString(2) %></td>
							<td><% out.println(rs.getString(1)); %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(6) %></td>
							<td>
							
							<a href="Controller?CaptainViewEditTrash=CaptainViewEditTrash&CaptaintViewId=CaptaintViewId&captain_id=<%=rs.getString(2)%>" class="search"><span class="glyphicon glyphicon-search" ></span></a>&nbsp;&nbsp;&nbsp;
							 <a href="Controller?CaptainViewEditTrash=CaptainViewEditTrash&CaptaintEditId=CaptaintEditId&captain_id=<%=rs.getString(2)%>" class="edit"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;
							<a href="Controller?CaptainViewEditTrash=CaptainViewEditTrash&CaptaintTrashId=CaptaintTrashId&captain_id=<%=rs.getString(2)%>" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
							</td>
							
						</tr>

						<%
									 	/* System.out.println(rs.getString(1));
									    System.out.println(rs.getString(2)); */
										}
							
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							%>

<!-- </tbody> -->
					</table>

					</div>
				</div>
			</div>

	</div><!--/.row-->
	
	
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