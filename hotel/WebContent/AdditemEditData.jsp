
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


<link href="css/site-demos.css" rel="stylesheet">
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<style type="text/css">


#updateitems-form .fieldgroup {
    background: url("form-divider.gif") repeat-x scroll left top transparent;
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}

#updateitems-form .fieldgroup label {
    float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 110px;
}

#updateitems-form .fieldgroup input, #updateitems-form .fieldgroup textarea, #updateitems-form .fieldgroup select {
    float: right;
    margin: 10px 0;
    height: 25px;
}

#updateitems-form .submit {
    padding: 10px;
    width: 220px;
    height: 40px !important;
}

#updateitems-form .fieldgroup label.error {
    color: #FB3A3A;
    display: inline-block;
    margin: 4px 0 5px 125px;
    padding: 0;
    text-align: left;
    width: 220px;
}


</style>
   <script type="text/javascript">

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#updateitems-form").validate({
                rules: {
                	item_name:{ required: true },
                	item_cost:{ required: true }
                    
                
                },
                messages: {
                   
                
                	item_name:  "<font color=red>Please enter item name</font>",
                	item_cost: { required: "<font color=red>Please enter item cost </font>"}
                    
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
				<li class="active"><b>Item Details / Edit Details</b></li>
			</ol>
		</div><!--/.row-->
		
	
		
		<div class="row">
			<div class="col-md-8" style="margin-left:30px">
				<div class="panel panel-default"style="margin-top: 20px;">
					<div class="panel-heading"><span class="glyphicon glyphicon-plus"></span>Add New Item</div>
					<%  String item_id;
	
			if(request.getAttribute("Item_ID")!=null){
				
				item_id=(String)request.getAttribute("Item_ID");
			}else if(request.getAttribute("updateItemFormId")!=null){
				item_id=(String)request.getAttribute("updateItemFormId");
			}else{
				item_id=(String)request.getAttribute("itemIdFromServlet");
			}
	
	    ResultSet rt =AlterItemDetails.getItemdetails(item_id);
	    if(request.getAttribute("updateItemSuccessStatus")!=null){
	    out.println("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+(String)request.getAttribute("updateItemSuccessStatus")+"</div>");
	    }
	    
	    while(rt.next()){
	 %>
					<div class="panel-body">
						<form class="form-horizontal" action="Controller" method="POST" name="updateitems-form" id="updateitems-form" novalidate="novalidate">
						
						
						<input type="hidden" name="updateItemform" value="updateItemform"> 
							
						
							<fieldset>
								<!-- Item Name -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Item Name</label>
									<div class="col-md-9">
									<input  name="item_name" type="text" onkeypress="return onlyAlphabets(event,this);" placeholder="<%=rt.getString("item_name") %>" value="<%=rt.getString("item_name").trim() %>" class="form-control">
									</div>
								</div>
							   <!-- Item ID -->
							   <div class="form-group">
									<label class="col-md-3 control-label" for="name">Item ID</label>
									<div class="col-md-9">
									
																
									<input  name="item_id" type="text" placeholder="<%=rt.getString("item_id") %>" value="<%=rt.getString("item_id") %>" class="form-control" readonly="readonly">	
										
							
									</div>
								</div>
								
							 <!--Item Cost-->
								 <div class="form-group">
									<label class="col-md-3 control-label" for="name">Item Cost</label>
									<div class="col-md-9">
									<input name="item_cost" type="text" maxlength="4" onkeypress="javascript:return isNumber (event)" placeholder="<%=rt.getString("item_amount") %>" value="<%=rt.getString("item_amount") %>" class="form-control">
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
									<div class="col-md-12 widget-left">
										<button type="submit" class="btn btn-primary ">Update</button>
										<button type="button" class="btn btn-default"  onclick="window.location.href='Controller?gobacktoAddItoms=gobacktoAddItoms'">Close</button>
										
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