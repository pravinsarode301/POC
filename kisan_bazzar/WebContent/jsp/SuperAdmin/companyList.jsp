<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
		
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home">
							<use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Company List</li>
				
			</ol>
		</div>
				
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
		<div id="container">
			
			
  <div class="row">
	<div class="col-lg-12">
		<div class="panel-body" id="demo">
		<%
					if (request.getAttribute("deleteStatus") != null) {
				%>
			<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("deleteStatus")%>
					</strong>
					<%
						}
					%>
					</div>
					
					<%
				if (request.getAttribute("addNewCompanyStatus") != null) {
			%>
					
					<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong> <%=request.getAttribute("addNewCompanyStatus")%>
				</strong>
				<%
					}
				%>
				
				<div class="panel panel-default">
				<div class="panel-heading">
					Company List
						
				</div>
				
				<div class="panel-body">
					<table data-toggle="table" style="width: 100%;" id="example"
						class="pull-center table table-hover text-center">

						<thead>
							<tr>
								<th data-align="center" class="text-center">Sr.No</th>
								<th data-align="center" class="text-center">Company Name</th>
								
								<th data-align="center" class="text-center">E-mail</th>
								<th data-align="center" class="text-center">Contact Number</th>
								
								<th data-align="center" class="text-center">Address</th>
								<th data-align="center" class="text-center">Action</th>

							</tr>
						</thead>
						<tbody>
				<%
							ResultSet rt = (ResultSet) request.getAttribute("rt");
							int counter = 1;
							try {
								//if(rt.next()){
								while (rt.next()) {
						%>
						
						<tr class="gradeX">
								<td><%=counter%></td>
								<%
								counter++;
							%>
								<td class="sorting_1"><%=rt.getString(2)%></td>
								
								<td><%=rt.getString(8)%></td>
								<td><%=rt.getLong(9)%></td>
								
								<td><%=rt.getString(11)%></td>
								<td>
									<table>
										<tr class="gradeC">
											<td style="border: 1px #eee;"><a
												href="SuperAdmin?customParameterString=viewCompany&status=comSpecsData&companyId=<%=rt.getInt("company_id")%>"><span
													class="glyphicon glyphicon-search" style="margin-right: 6px;"></a></span></td>
											<td style="border: 1px #eee;"><a
												href="SuperAdmin?customParameterString=editCompanyData&companyId=<%=rt.getInt("company_id")%>&status=comSpecsData"><span
													class="glyphicon glyphicon-edit" style="margin-right: 6px;"></a></span></td>
											<td style="border: 1px #eee;"><a
												href="SuperAdmin?customParameterString=removeCompany&companyId=<%=rt.getInt("company_id")%>&comSpecsData=currentCompany"><span
													class="glyphicon glyphicon-remove" ></a></span></td>
										</tr>
									</table>
								</td>
								</tr>

							<%
								}//}}else{
								//out.println("no record found");
							//}
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
						</tbody>
					</table>
					<ul class="pagination pull-right">

						<li><a href="#">&laquo;</a></li>

						<li><a href="#">1</a></li>

						<li><a href="#">2</a></li>

						<li><a href="#">3</a></li>

						<li><a href="#">4</a></li>

						<li><a href="#">5</a></li>

						<li><a href="#">&raquo;</a></li>

					</ul>
				</div>
			</div>
		</div>

	</div>
</div>
</div>
								
								
						
					
	
			</div>
			<div class="spacer"></div>
			
			
			
			<script type="text/javascript" language="javascript" src="../examples_support/syntax/js/shCore.js"></script>
			
			
			
		
			
			
			
		</div>
	</body>
</html>