<%@include file="common/header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">View Farmer Datails</li>
	</ol>
</div>w
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header"></h1>
	</div>
</div>
<!--/.row-->

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<svg class="glyph stroked email">
					<use xlink:href="#stroked-email"></use></svg>
				Farmer Details
			</div>
			<div class="panel-body">
				<% int i=1; 
				ResultSet rt=(ResultSet)request.getAttribute("rt");
				while(rt.next()){
					
					%>

				<form class="form-horizontal" action="" method="post">
					<%-- <input type="hidden" name="company_id" value="<%=rt.getString("company_id") %>"> --%>
					<fieldset>

						<!-- farmer first and last name -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="name">First
								Name</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("first_name") %>" name="farmerName" type="text"
									placeholder="Please enter your name" class="form-control" readonly="readonly">
							</div>


							<!-- Farmer Email ID-->

							<label class="col-md-2 control-label" for="text">Last
								Name</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("last_name") %>" name="farmerEmailid" type="text"
									placeholder="Please enter your Email ID" class="form-control" readonly="readonly">
							</div>
						</div>


						<!--Farmer Name-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">Contact
								Number</label>
							<div class="col-md-4">
								<input value="<%=rt.getInt("contact_number") %>" name="contactNumber" type="text"
									placeholder="Please enter contact number" class="form-control" readonly="readonly">
							</div>


							<!-- Farmer Email ID-->

							<label class="col-md-2 control-label" for="text">Farmer
								Email ID</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("email_id") %>" name="farmerEmailid" type="text"
									placeholder="Please enter your Email ID" class="form-control" readonly="readonly">
							</div>
						</div>
						<!-- Farmer Contact Number-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">Address</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("address") %>" name="Address " type="text"
									placeholder="Please enter your Address" class="form-control" readonly="readonly">
							</div>


							<!-- Farmer Address-->

							<label class="col-md-2 control-label" for="text">Country</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("country") %>" name="Country " type="text"
									placeholder="Please enter your Country" class="form-control" readonly="readonly">
							</div>

						</div>
						<!-- Farmer Country-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">State</label>
							<div class="col-md-4">
								<select class="form-control" name="state" readonly="readonly">
									<option value="">Please select state</option>
									<option value="AP">AP</option>
									<option value="Maharastra">Maharastra</option>
									<option value="MP">MP</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Goa">Goa</option>
									<option value="Kerala">Kerala</option>
								</select>
							</div>

							<!-- Farmer State-->

							<label class="col-md-2 control-label" for="text">District</label>
							<div class="col-md-4">
								<select class="form-control" name="City" readonly="readonly">
									<option value="">Please select City</option>
									<option value="Nagpur">Nagpur</option>
									<option value="Wardha">Wardha</option>
									<option value="Pune">Pune</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Gondia">Gondia</option>
									<option value="Chandrapur">Chandrapur</option>
								</select>
							</div>

						</div>

						<!-- Farmer City-->

						<div class="form-group">
							<label class="col-md-2 control-label" for="text">City</label>
							<div class="col-md-4">
								<select class="form-control" name="City" readonly="readonly">
									<option value="">Please select City</option>
									<option value="Nagpur">Nagpur</option>
									<option value="Wardha">Wardha</option>
									<option value="Pune">Pune</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Gondia">Gondia</option>
									<option value="Chandrapur">Chandrapur</option>
								</select>
							</div>


							<label class="col-md-2 control-label" for="text">Landmark</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("landmark") %>" name="pinCode" type="text"
									placeholder="Please enter your Pin Code" class="form-control" readonly="readonly">
							</div>

						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">Pin Code</label>
							<div class="col-md-4">
								<input value="<%=rt.getInt("pin_code") %>" name="pinCode" type="text"
									placeholder="Please enter your Pin Code" class="form-control" readonly="readonly">
							</div>

						</div>
			</div>



			<!-- Form actions -->
			<div class="form-group">
				<div class="col-md-12 widget-right">
				<button type="button" class="btn btn-default btn-md pull-right" onclick="window.location.href='SuperAdmin?customParameterString=gridFarmerData&status=default'">close</button>
				<button type="button" class="btn btn-default btn-md pull-right" style="margin-right: 1%;" onclick="window.location.href='SuperAdmin?customParameterString=editFarmerData&status=farmSpecsData&farmerId=<%=rt.getInt("farmer_id") %>'">Edit</button>

				</div>
			</div>
			</fieldset>
			</form>
			
			<%} %>
		</div>
	</div>


	<%@include file="common/footer.jsp"%>