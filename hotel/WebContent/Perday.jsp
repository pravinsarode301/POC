
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hotel.Model.AlterOrderdetails"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.hotel.Model.OrderFormDaoImpl"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


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
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/select2.css" rel="stylesheet">
<link href="css/select2-bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<link href="css/site-demos.css" rel="stylesheet">
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<style type="text/css">


#per_day_report-form .fieldgroup {
    background: url("form-divider.gif") repeat-x scroll left top transparent;
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}

#per_day_report-form .fieldgroup label {
    float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 110px;
}

#per_day_report-form .fieldgroup input, #per_day_report-form .fieldgroup textarea, #per_day_report-form .fieldgroup select {
    float: right;
    margin: 10px 0;
    height: 25px;
}

#per_day_report-form .submit {
    padding: 10px;
    width: 220px;
    height: 40px !important;
}

#per_day_report-form .fieldgroup label.error {
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
            $("#per_day_report-form").validate({
                rules: {
                	
                	per_day_report_date:{ required: true },
                	
                    
                
                },
                messages: {
                   
                
                	per_day_report_date:  "<font color=red>Please select date to generate report</font>",
                	
                    
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
			<li class="active"><b> Reports Form </b></li>
		</ol>
	</div>
	<!--/.row-->



	<!--<button class="btn btn-default btn-xs pull-right" data-toggle="modal" data-target="#myModal">Give Order</button>  -->
	<div class="row">
		<div class="col-md-11" style="margin-left: 30px">
			<div class="panel panel-default" style="margin-top: 20px;">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-pencil"></span>Per Day Report
				</div>
				<div class="panel-body">
				
					<form  class="form-horizontal" action="Controller" method="post" name="per_day_report-form" id="per_day_report-form" novalidate="novalidate">
						<input type="hidden" name="reportmodule" value="reportmodule">
						<input type="hidden" name="perDayReportFormDetails"	value="perDayReportFormDetails">
						<fieldset>
							<!-- Date & Time--->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Date
									&amp;Time</label>
								<div class="col-md-9">
								<% java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
										String kk=df.format(new java.util.Date());
										%>
									<input name="per_day_report_date" type="date" value="" class="form-control"/>
								</div>
							</div>

						
							<center>
								<button type="submit" class="btn btn-primary">Generate Report</button>
								<button type="reset" class="btn btn-default ">Close</button>
							</center>
						</fieldset>
					</form>
				</div>
			</div>


		</div>
		<!--/.col-->

	</div>
	<!--/.col-->
	
	<script>
function printDiv()
{
  var divToPrint=document.getElementById('printtable');
  newWin= window.open("");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>

	<%
	if(request.getAttribute("ary")!=null){
	try{
		ArrayList arry=new ArrayList();
		 
		arry=(ArrayList)request.getAttribute("ary"); %>
		<div id="printtable">
<div class="row">
			<div class="col-md-11" style="margin-left:30px ; ">
				<div class="panel panel-default">
					<div class="panel-heading">Perday Order Report</div>
					<div class="form-group" align="right">
						<button type="submit" class="btn btn-primary" onClick="printDiv();" style="   margin-right: 10px;margin-top: 10px;">Print !</button>
							

					</div>
					<div class="panel-body" >
						<table data-toggle="table" data-url="" class="table table-striped">
						    <thead>
						    <tr>
						        <th data-field="id" data-align="center">No.</th>
						        <th data-field="name">Date</th>
						        <th data-field="price">Order no</th>
						        <th data-field="price">Table no</th>
						        <th data-field="price">Order menu</th>
						        <th data-field="price">Customer bill</th>
						        <th data-field="price">Customer name</th>
						        <th data-field="price">Captain name</th>
						        <th data-field="price">Payment status</th>
						       
						    </tr>
							
						    </thead>
							<tbody>
						 <%
	
		if(arry.isEmpty()){
			out.println("<tr class='span8'>");
			out.println("<th colspan='9' data-align='center'>No orders available to display</th>");
			out.println("</tr>");
		}else{
		
	Iterator it=arry.iterator();
	
	while(it.hasNext())
	{
		%>
							
							<tr>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							<td><%=it.next() %></td>
							</tr>
								
				<%		
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
						</tbody>
						</table>
					</div>
				</div>
			</div>

	</div><!--/.row-->
	</div>
	<%
}
	%>


	<!--/.main-->



	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/select2.js"></script>
	<script src="js/select2.min.js"></script>
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