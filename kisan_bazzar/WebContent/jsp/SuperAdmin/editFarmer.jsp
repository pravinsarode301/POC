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
</div>
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
				Farmer's Requirement
			</div>
			
				<%
					if (request.getAttribute("statusUpdated") != null) {
				%>
				<div class="panel-body">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("statusUpdated")%>
					</strong>
					</div>
					<%
						}
					%>

				
			
			
			<div class="panel-body">
				<%
					int i = 1;
					ResultSet rt = (ResultSet) request.getAttribute("rt");
					while (rt.next()) {
				%>

				<form class="form-horizontal" action="UpdateFarmerData" method="post">
				<!-- <input type="hidden" name="customParameterString" value="updatefarmerDataForm" class="form-control"> -->
				<input type="hidden" name="farmerId" value="<%=rt.getString("farmer_id")%>">
				<input type="hidden" name="status" value="<%=request.getAttribute("status")%>">	
					
					<fieldset>

						<!-- farmer first and last name -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="name">First
								Name</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("first_name")%>"
									name="farmerFirstName" type="text"
									placeholder="Please enter your name" class="form-control">
							</div>


							<!-- Farmer Email ID-->

							<label class="col-md-2 control-label" for="text">Last
								Name</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("last_name")%>"
									name="farmerLastName" type="text"
									placeholder="Please enter your Email ID" class="form-control">
							</div>
						</div>


						<!--Farmer Name-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">Contact
								Number</label>
							<div class="col-md-4">
								<input value="<%=rt.getInt("contact_number")%>"
									name="farmerContactNumber" type="text"
									placeholder="Please enter contact number" class="form-control">
							</div>


							<!-- Farmer Email ID-->

							<label class="col-md-2 control-label" for="text">Farmer
								Email ID</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("email_id")%>"
									name="farmerEmailid" type="text"
									placeholder="Please enter your Email ID" class="form-control">
							</div>
						</div>
						<!-- Farmer Contact Number-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">Address</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("address")%>" name="farmerAddress"
									type="text" placeholder="Please enter your Address"
									class="form-control">
							</div>


							<!-- Farmer Address-->

							<label class="col-md-2 control-label" for="text">Country</label>
							<div class="col-md-4">
								<input value="<%=rt.getString("country")%>" name="farmerCountry"
									type="text" placeholder="Please enter your Country"
									class="form-control">
							</div>

						</div>
						<!-- Farmer Country-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">State</label>
							<div class="col-md-4">
								<select class="form-control" name="farmerState">
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
								<select class="form-control" name="farmerDistrict">
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
								<select class="form-control" name="farmerCity">
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
								<input value="<%=rt.getString("landmark")%>" name="farmerLandmark"
									type="text" placeholder="Please enter your Pin Code"
									class="form-control">
							</div>

						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">Pin Code</label>
							<div class="col-md-4">
								<input value="<%=rt.getInt("pin_code")%>" name="farmerPincode"
									type="text" placeholder="Please enter your Pin Code"
									class="form-control">
							</div>

						</div>
			



			<!-- Form actions -->
			<div class="form-group">
				<div class="col-md-12 widget-right">
					<button type="submit" class="btn btn-default btn-md pull-right"
						name="submit" value="Submit" style="margin-left: 10px;">Update</button>

					<button type="button" class="btn btn-default btn-md pull-right"
						onclick="window.location.href='SuperAdmin?customParameterString=gridFarmerData&status=default'">close</button>

				</div>
			</div>
			</fieldset>
			</form>
<%} %>
			
		</div>
	</div>


	<%@include file="common/footer.jsp"%>