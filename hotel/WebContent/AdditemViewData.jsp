
<%@page import="com.hotel.Model.AlterItemDetails"%>
<%@page import="com.hotel.Model.OrderMenuDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>


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
if(session==null){
	response.sendRedirect("login.jsp");
}else{	
%>
<%@include file="Common/header.jsp" %>
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active"><b>Item Details / View Details</b></li>
			</ol>
		</div><!--/.row-->
		<% String Item_ID=(String)request.getAttribute("Item_ID");
		
		ResultSet rt= AlterItemDetails.getItemdetails(Item_ID);
		while(rt.next()){
		
		%>
	
		
		<div class="row">
			<div class="col-md-8" style="margin-left:30px">
				<div class="panel panel-default"style="margin-top: 20px;">
					<div class="panel-heading"><span class="glyphicon glyphicon-plus"></span>Add New Item</div>
					<div class="panel-body">
						<form class="form-horizontal" action="Controller" method="POST">
						
						<input type="hidden" name="addItemsEditLink" value="addItemsEditLink">
						<input type="hidden" name="updateItemFormId" value="<%=rt.getString("item_id")%>">
							<fieldset>
								<!-- Item Name -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Item Name</label>
									<div class="col-md-9">
									<input  name="item_name" type="text" onkeypress="return onlyAlphabets(event,this);" placeholder="<%=rt.getString("item_name") %>" value="<%=rt.getString("item_name") %>" class="form-control" readonly="readonly">
									</div>
								</div>
							   <!-- Item ID -->
							   <div class="form-group">
									<label class="col-md-3 control-label" for="name">Item ID</label>
									<div class="col-md-9">
									
										
									<input name="item_id" type="text" placeholder="<%=rt.getString("item_id")%>" value="<%=rt.getString("item_id")%>" class="form-control" readonly="readonly">
										
							
									</div>
								</div>
								
							 <!--Item Cost-->
								 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Item Cost</label>
									<div class="col-md-9">
									<input name="item_cost" type="text" onkeypress="javascript:return isNumber (event)" placeholder="<%=rt.getString("item_amount")%>" value="<%=rt.getString("item_amount")%>" class="form-control" readonly="sreadonly">
									</div>
								</div>

								
								<!--  Captain ID 
								 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Captain ID</label>
									<div class="col-md-9">
									<input  name="captain_id" type="text" placeholder="Captain ID" class="form-control">
									</div>
								</div>  -->
								
								<!-- Date & Time--->
							 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Date &amp; Time</label>
									<div class="col-md-9">
									<input  name="item_add_timedate" type="text" placeholder="<%=rt.getString("item_add_dt")%>" value="<%=rt.getString("item_add_dt")%>" class="form-control" readonly="readonly">
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right">Edit</button>
										<button type="button" class="btn btn-default btn-md pull-right" onclick="window.location.href='Controller?gobacktoAddItoms=gobacktoAddItoms'">Close</button>
									</div>
								</div>
								
							</fieldset>
						</form>
					</div>
				</div>
				<%} %>
				
			</div><!--/.col-->
							
			</div><!--/.col-->


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