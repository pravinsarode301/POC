<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>
<body>

<%
if(session==null){
	response.sendRedirect("login.jsp");
}else{	
%>

<%@include file="Common/header.jsp" %>



<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active"><b>Halfyearwise Report</b></li>
			</ol>
		</div><!--/.row-->
		
		
		<div class="container">
		
		<div class="row">
		<div class="col-md-9" style="margin-left:15px">
		<div class="panel panel-default"style="margin-top: 20px;">
					
					<div class="panel-body">
				<div class="form-group">
				<input type="year">
		
									<label>Select Year</label>
									<select class="form-control">
									<option>Select Half Year </option>
										<option>Jan - Jun 2012 </option>
										<option>July - Dec 2012 </option>
										<option>Jan - Jun 2013</option>
										<option>July - Dec 2013</option>
									    <option>Jan - Jun 2014</option>
										<option>July - Dec2014</option>
										<option>Jan - Jun 2015</option>
										
										
									</select>
								</div>
								<button type="submit" class="btn btn-primary ">Pass</button>
								<button type="reset" class="btn btn-default  ">Cancel</button>
						</div>
						</div>	
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
<%@include file="Common/footer.jsp" %>
	<%} %>
			

</body>
</html>