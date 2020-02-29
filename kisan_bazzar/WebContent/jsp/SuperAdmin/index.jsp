<%@ include file="common/header.jsp"%>
<%@page import="java.util.Vector"%>
<%@ page import="java.io.*,java.util.*"%>
<%@page import="java.util.Enumeration"%>
<%-- <jsp:include page="common/header.jsp"  /> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%


/* //=request.getHeaderNames();
Enumeration<String> v=request.getHeaderNames();

while(v.hasMoreElements()){
	//out.println(v.nextElement()+"<br>");
} */

%>


<script type="text/javascript">

function adminPortalIndexPageDetails(){

	alert("helo");
	 $.ajax({
	        url: 'CheckByAjaxCall',
	        type: 'post',
	       	data: { customQueryString:"adminPortalIndexPageDetails" },
	        dataType:'json',
	        success:function(response){
	        	alert(response);
	        }
	 });
}


</script>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Icons</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Dashboard</h1>
	</div>
</div>
<!--/.row-->

<div class="row">

	<div class="col-xs-12 col-md-4 col-lg-4">
		<div class="panel panel-teal panel-widget">
			<div class="row no-padding">
				<div class="col-sm-3 col-lg-5 widget-left">
					<svg class="glyph stroked male-user">
						<use xlink:href="#stroked-male-user"></use></svg>
				</div>
				<div class="col-sm-9 col-lg-7 widget-right">
					<div class="large"><%=request.getAttribute("totalregistredfarmer") %></div>
					<div class="text-muted">Farmers registered</div>
				</div>
			</div>
		</div>
	</div>



	<div class="col-xs-12 col-md-4 col-lg-4">
		<div class="panel panel-red panel-widget">
			<div class="row no-padding">
				<div class="col-sm-3 col-lg-5 widget-left">
					<svg class="glyph stroked app-window-with-content">
						<use xlink:href="#stroked-app-window-with-content"></use></svg>
				</div>
				<div class="col-sm-9 col-lg-7 widget-right">
					<div class="large"><%=request.getAttribute("totalregistredcompanies") %></div>
					<div class="text-muted">Companies Registered</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-12 col-md-4 col-lg-4">
		<div class="panel panel-teal panel-widget">
			<div class="row no-padding">
				<div class="col-sm-3 col-lg-5 widget-left">
					<svg class="glyph stroked male-user">
						<use xlink:href="#stroked-male-user"></use></svg>
				</div>
				<div class="col-sm-9 col-lg-7 widget-right">
					<div class="large"><%=request.getAttribute("totalregistredfarmer") %></div>
					<div class="text-muted">complaint registered</div>
				</div>
			</div>
		</div>
	</div>


</div>
<!--/.row-->



<div class="row">
	<div class="col-md-12">
		<div class="charts">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">Farmer Overview</div>
					<div class="panel-body">

						<div class=" charts-grids widget">
							<h4 class="title">Farmers Registered Graph</h4>
							<canvas id="bar" height="300" width="400"> </canvas>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="panel panel-default">
				<div class="panel-heading">Company Overview</div>
					<div class="panel-body" >
						<div class=" charts-grids widge">
							<h4 class="title">Companies Registered Graph</h4>
							<canvas id="line" height="300" width="400"> </canvas>
						</div>

					</div>
				</div>
			</div>
			<script src="jsp/SuperAdmin/js/Chart.js"></script>

			<div class="clearfix"></div>
			<script>
								var barChartData = {
									labels : ["Jan","Feb","March","April","May","June","July"],
									datasets : [
										{
											fillColor : "rgba(233, 78, 2, 0.9)",
											strokeColor : "rgba(233, 78, 2, 0.9)",
											highlightFill: "#e94e02",
											highlightStroke: "#e94e02",
											data : [65,59,90,81,56,55,40]
										},
										{
											fillColor : "rgba(79, 82, 186, 0.9)",
											strokeColor : "rgba(79, 82, 186, 0.9)",
											highlightFill: "#4F52BA",
											highlightStroke: "#4F52BA",
											data : [40,70,55,20,45,70,60]
										}
									]
									
								};
								var lineChartData = {
										labels : ["First","Second","Third","Four"],
										datasets : [
											{
												fillColor : "rgba(242, 179, 63, 1)",
												strokeColor : "#F2B33F",
												pointColor : "rgba(242, 179, 63, 1)",
												pointStrokeColor : "#fff",
												data : [70,60,72,61]

											},
											{
												fillColor : "rgba(97, 100, 193, 1)",
												strokeColor : "#6164C1",
												pointColor : "rgba(97, 100, 193,1)",
												pointStrokeColor : "#9358ac",
												data : [50,65,51,67]

											}
										]
										
									};
								
								
								
							
							new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
							new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData);
						
							
							</script>

		</div>
	</div>
</div>



<%@ include file="common/footer.jsp"%>
