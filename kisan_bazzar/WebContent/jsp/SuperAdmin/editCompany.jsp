<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Edit Company Deatails</li>
	</ol>
</div>
<!--/.row-->



<div class="row">
	<div class="col-md-12">

		<div class="panel panel-default">
			<div class="panel-heading">
				<svg class="glyph stroked email">
					<use xlink:href="#stroked-email"></use></svg>
				Company Details
			</div>
			<div class="panel-body">
				<%
					if (request.getAttribute("resultStatus") != null) {
				%>
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("resultStatus")%>
					</strong>
					<%
						}
					%>

				</div>
				<div class="panel-body">

					<%
						ResultSet rt = (ResultSet) request.getAttribute("rt");
						while (rt.next()) {
					%>
					<form class="form-horizontal" action="updateCompanyData"
						method="post" enctype="multipart/form-data">
						<!-- <input type="hidden" name="customParameterString"
							value="updateCompanyFormDetails" class="form-control"> -->
							 <input	type="hidden" name="companyId"	value="<%=rt.getInt("company_id")%>">
							 <input	type="hidden" name="status"	value="<%=request.getAttribute("status")%>">
						<fieldset>
							<!-- company_name input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="name">Company
									Name</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("company_name")%>"
										name="companyName" type="text" placeholder="Enter Your name"
										class="form-control">
								</div>


								<!-- company_registred_id input-->

								<label class="col-md-2 control-label" for="email">Company
									Registred Id</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("company_registred_id")%>"
										name="companyRegId" type="text"
										placeholder="Enter email Address" class="form-control">
								</div>
							</div>
							<!-- authorised_person_name input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">Authorised
									Person Name</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("authorised_person_name")%>"
										name="authorisedPersonName" type="text"
										placeholder="Enter Contact number" class="form-control">
								</div>

								<!-- authorised_person_mo_number input-->

								<label class="col-md-2 control-label" for="Mobile">Authorised
									Person Number</label>
								<div class="col-md-4">
									<input
										value="<%=rt.getString("authorised_person_mo_number")%>"
										name="authorisedPersonMobileNumber" type="text"
										placeholder="Enter Permanent Address" class="form-control">
								</div>
							</div>
							<!-- authorised_person_email_id input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">Authorised
									Person E-mail Id</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("authorised_person_email_id")%>"
										name="authorisedPersonEmail" type="text"
										placeholder="Enter Local Address" class="form-control">
								</div>

								<!-- company_website input-->

								<label class="col-md-2 control-label" for="Mobile">Company
									Website</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("company_website")%>"
										name="companyWebsite" type="text"
										placeholder="Enter City Name" class="form-control">
								</div>
							</div>
							<!-- company_email_id input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">Company
									Email-Id</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("company_email_id")%>"
										name="companyEmail" type="text" placeholder="Enter State Name"
										class="form-control">
								</div>

								<!-- company_contact_number input-->

								<label class="col-md-2 control-label" for="Country">Company
									Contact Number</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("company_contact_number")%>"
										name="companyContactNumber" type="text"
										placeholder="Enter Country Name" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<!-- Company -->

								<label class="col-md-2 control-label" for="Contactnum">Current
									Address</label>
								<div class="col-md-4">
									<input id="Country" name="companyCurrentAddress" type="text"
										value="<%=rt.getString("company_current_address")%>"
										placeholder="Enter Current Company Address"
										class="form-control">
								</div>
								<!-- Company Address input-->

								<label class="col-md-2 control-label" for="Mobile">Register
									Address</label>
								<div class="col-md-4">
									<input id="State" name="companyRegisterAddress" type="text"
										value="<%=rt.getString("company_register_address")%>"
										placeholder="Enter Company Register Address "
										class="form-control">
								</div>
							</div>

							<!--company_fax_number input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">Company
									Fax number</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("company_fax_number")%>"
										name="companyFaxNumber" type="text"
										placeholder="Select Profile Picture" class="form-control">
								</div>

								<!-- landmark input-->

								<label class="col-md-2 control-label" for="Mobile">Landmark</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("landmark")%>"
										name="companyLandmark" type="text" placeholder="Enter Date"
										class="form-control">
								</div>
							</div>
							<!-- city  input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">City</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("city")%>" name="company_city"
										type="text" placeholder="Enter Payment" class="form-control">
								</div>

								<!-- state input-->

								<label class="col-md-2 control-label" for="Mobile">State</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("state")%>" name="companyCity"
										type="text" placeholder="Enter Subcription Plan"
										class="form-control">
								</div>
							</div>

							<!-- Country input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">Country</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("country")%>"
										name="companyCountry" type="text" placeholder="Enter Payment"
										class="form-control">
								</div>

								<!-- registration_date input-->

								<label class="col-md-2 control-label" for="Mobile">Registration
									Date</label>
								<div class="col-md-4">
									<input value="<%=rt.getString("registration_date")%>"
										name="companyRegistrationDate" type="date"
										placeholder="Enter Subcription Plan" class="form-control">
								</div>
							</div>

							<!-- from here -->
							<div class="form-group">

								<label class="col-md-2 control-label"
									for="companyRegistrationDate">Created By</label>
								<div class="col-md-4">
									<p class="form-control-static"><%=rt.getString("created_by")%></p>
								</div>

								<!-- Re-password input-->

								<label class="col-md-2 control-label" for="image">Select
									Logo</label>
								<div class="col-md-4">
									<input id="Sucribtion Plan" name="profilePic" type="file"
										placeholder="Re-password" class="form-control">
								</div>

								<img alt="" src="<%=rt.getString("profile_pic")%>">
							</div>


							<%
								}
							%>
							<!-- Form actions -->
							<div class="form-group">
								<div class="col-md-12 widget-right">
									<button type="submit" class="btn btn-default btn-md pull-right"
										name="submit" value="Submit">Submit</button>

								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>

		</div>

	</div>
	<!--/.main-->

	<%@include file="common/footer.jsp"%>