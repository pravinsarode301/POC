
<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Farmer List</li>
	</ol>
</div>
 
<!--  Sorting and search created by Nilesh -->

				
		<script type="text/javascript" language="javascript" src="jsp/SuperAdmin/js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="jsp/SuperAdmin/js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			/* Note 'unshift' does not work in IE6. A simply array concatenation would. This is used
			 * to give the custom type top priority
			 */
			jQuery.fn.dataTableExt.aTypes.unshift(
				function ( sData )
				{
					var sValidChars = "0123456789-,";
					var Char;
					var bDecimal = false;
					
					/* Check the numeric part */
					for ( i=0 ; i<sData.length ; i++ )
					{
						Char = sData.charAt(i);
						if (sValidChars.indexOf(Char) == -1)
						{
							return null;
						}
						
						/* Only allowed one decimal place... */
						if ( Char == "," )
						{
							if ( bDecimal )
							{
								return null;
							}
							bDecimal = true;
						}
					}
					
					return 'numeric-comma';
				}
			);
			
			jQuery.fn.dataTableExt.oSort['numeric-comma-asc']  = function(a,b) {
				var x = (a == "-") ? 0 : a.replace( /,/, "." );
				var y = (b == "-") ? 0 : b.replace( /,/, "." );
				x = parseFloat( x );
				y = parseFloat( y );
				return ((x < y) ? -1 : ((x > y) ?  1 : 0));
			};
			
			jQuery.fn.dataTableExt.oSort['numeric-comma-desc'] = function(a,b) {
				var x = (a == "-") ? 0 : a.replace( /,/, "." );
				var y = (b == "-") ? 0 : b.replace( /,/, "." );
				x = parseFloat( x );
				y = parseFloat( y );
				return ((x < y) ?  1 : ((x > y) ? -1 : 0));
			};
			
			$(document).ready(function() {
				$('#example').dataTable();
			} );
		</script>
	</head>
	<body >


<body >
		
<div class="row">
	<div class="col-lg-12">
	<div class="panel-body" id="demo">	<%
					if (request.getAttribute("deleteStatus") != null) {
				%>
	
	<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong><%=request.getAttribute("deleteStatus")%>
					</strong></div>
					<%
						}
					%>
			
		<div class="panel panel-default">
					<div class="panel-heading">
				Farmer List
				</div>
			
			
			<div class="panel-body">
				<table data-toggle="table" style="width: 100%;"
					class="pull-center table table-hover text-center" id="example">

					<thead>
					  <div class="form-group pull-right" >
					
						</div>
						<tr>
							<th data-align="center" class="text-center">Sr.No</th>
							<th data-align="center" class="text-center">Full Name</th>
							<th data-align="center" class="text-center">Contact Number</th>
							<th data-align="center" class="text-center">E-mail ID</th>
							<th data-align="center" class="text-center"> Product Name</th>
							<th data-align="center" class="text-center">Quantity</th>
							<th data-align="center" class="text-center">Action</th>
							
							

						</tr>
					</thead>
					<tbody>
			
<% int i=1; 
ResultSet rt=(ResultSet)request.getAttribute("rt");
while(rt.next()){
	
	%>
	<tr class="gradeX">
							<td><%=i %></td>
							<% i++; %>
							<td><%=rt.getString("first_name")+" "+rt.getString("last_name") %></td>
							<td><%=rt.getLong("contact_number") %></td>
							<td><%=rt.getString("email_id") %></td>
							<td><%=rt.getString("product_name") %></td>
							<td><%=rt.getInt("product_quantity") %></td>
								          
								
							<td>
								<table>
									<tr class="gradeC">
										<td style="border: 1px #eee;"><a
											href="SuperAdmin?customParameterString=viewFarmerData&status=farmSpecsData&farmerId=<%=rt.getInt("farmer_id") %>"><span
												class="glyphicon glyphicon-search" style="margin-right: 6px;"></a></span></td>
										<td style="border: 1px #eee;"><a
											href="SuperAdmin?customParameterString=editFarmerData&status=farmSpecsData&farmerId=<%=rt.getInt("farmer_id") %>"><span
												class="glyphicon glyphicon-edit" style="margin-right: 6px;"></a></span></td>
										<td style="border: 1px #eee;"><a
											href="SuperAdmin?customParameterString=removeFarmerData&status=currentFarmer&farmerId=<%=rt.getInt("farmer_id") %>"><span
												class="glyphicon glyphicon-remove"></a></span></td>
									</tr>
								</table>
							</td>
						</tr>
						<% }
%>
			
			
			
<!-- End  Sorting and search created by Nilesh -->
			
			
		</div>
	</body>