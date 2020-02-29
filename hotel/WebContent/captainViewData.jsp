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

<script language="Javascript" type="text/javascript">
 
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
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
          
        return false;
        return true;
    }    
</script>

</head>

<body>
	<% 
if(session.getAttribute("user_name")==null){
	response.sendRedirect("login.jsp");
}else{	
%>
	<%@ include file="Common/header.jsp"%>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active"><b>Captain Details / View Data</b></li>
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
						
						
						<%  String captain_id=(String)request.getAttribute("captain_id"); 
					try{
					ResultSet rt=AlterCaptaindetails.getCaptaindetails(captain_id);
					
					while(rt.next()){
			
						%>
						
				<form class="form-horizontal" action="Controller" method="post">
					<input type="hidden" name="captain_idFromViewData" value="captain_idFromViewData"> 
					<input type="hidden" name="updateCaptainForm" value="<%=captain_id%>">
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Captain
									Name</label>
								<div class="col-md-9">
									<input id="name" name="cname" type="text" value="<%=rt.getString("cap_name") %>"
									onkeypress="return onlyAlphabets(event,this);"	placeholder="<%=rt.getString("cap_name") %>" class="form-control" readonly="readonly">
										
								</div>
							</div>
							<!-- Captain Number -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Captain
									ID</label>
								<div class="col-md-9">
									<input id="name" name="cid" type="text" value="<%=rt.getString("cap_id") %>"
									 onkeypress="javascript:return isNumber (event)"	placeholder="<%=rt.getString("cap_id") %>" class="form-control" readonly="readonly">
										<%request.setAttribute("captain_idFromViewPage", rt.getString("cap_id"));%>
								</div>
							</div>
							<!-- Date Of Birth -->

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Date Of
									Birth</label>
								<div class="col-md-9">
									<input id="dob" name="dob" type="date" value="<%=rt.getString(3) %>"
										placeholder="<%=rt.getString(3) %>" class="form-control" readonly="readonly">
								</div>
							</div>

							<!-- Mobile Number--->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Mobile
									No.</label>
								<div class="col-md-9">
									<input id="mob" name="mob" type="text" value="<%=rt.getString("cap_mob") %>"
									onkeypress="javascript:return isNumber (event)"	placeholder="<%=rt.getString("cap_mob") %>" class="form-control" readonly="readonly">
								</div>
							</div>
							<!-- Email input-->	
							<div class="form-group">
								<label class="col-md-3 control-label" for="email">Your
									E-mail</label>
								<div class="col-md-9">
									<input id="email" name="email" type="email" value="<%=rt.getString("cap_email") %>"
										placeholder="<%=rt.getString("cap_email") %>" class="form-control" readonly="readonly">
								</div>
							</div>

							 <!--Joing Date-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Joing
									Date</label>
								<div class="col-md-9">
									<input id="name" name="jdate" type="date" value="<%=rt.getString("cap_jdt") %>"
										placeholder="<%=rt.getString("cap_jdt") %>" class="form-control" readonly="readonly">
								</div>
							</div>
 
							<!-- Message body -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="message">Address</label>
								<div class="col-md-9">
									<textarea class="form-control" id="message" name="address" value="<%=rt.getString("cap_addr") %>"
										placeholder="<%=rt.getString("cap_addr") %>" rows="5" readonly="readonly"></textarea>
								</div>
							</div>

							<!-- Form actions -->
							<div class="form-group">
								<div class="col-md-12 widget-right">
									<button type="submit" class="btn btn-primary">Edit</button>
									
									<button type="button" class="btn btn-primary" onclick="window.location.href='Controller?gobacktoCaptain=gobacktoCaptain'">Close</button>
								</div>
							</div>
						</fieldset>
					</form>
					<%}}catch(SQLException e){
						out.println(e);
					} %>
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

		<%} 
		%>
	
</body>
</html>