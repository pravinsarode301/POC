<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@include file="common/header.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Add New Sub-SuperAdmin</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
<!-- 				<svg class="glyph stroked email">
					<use xlink:href="#stroked-email"></use></svg> -->
			Sub-SuperAdmin Registration Form

			</div>
			<div class="panel-body">
				<%
					if (request.getAttribute("adminAddStatus") != null) {
				%>
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("adminAddStatus")%>
					</strong>
					<%
						}
					%>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" action="newSubAdmin" method="post" enctype="multipart/form-data" for="Subadmin">

						<fieldset>
							<input type="hidden" name="customParameterString"
								value="createNewSubAdmin" class="form-control"> <input
								type="hidden" name="sessionUser"
								value="<%=session.getAttribute("userName")%>">

							<div class="form-group">
								<!-- sub admin first name -->
								<label class="col-md-2 control-label" for="subAdminFirstName">First
									Name</label>
								<div class="col-md-4">
									<input id="" name="subAdminFirstName" type="text"
										placeholder="" class="form-control">
								</div>
								<!-- sub admin middle name -->

								<label class="col-md-2 control-label" for="email">Middle
									Name</label>
								<div class="col-md-4">
									<input id="" name="subAdminMiddleName" type="text"
										placeholder="" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<!-- sub admin last name -->
								<label class="col-md-2 control-label" for="subAdminLastName">Last
									Name</label>
								<div class="col-md-4">
									<input id="" name="subAdminLastName" type="text" placeholder=""
										class="form-control">
								</div>

								<!-- sub admin username -->

								<label class="col-md-2 control-label" for="subAdminUserName">Username</label>
								<div class="col-md-4">
									<input id="" name="subAdminUserName" type="text" placeholder=""
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<!-- sub admin E-mail Id -->
								<label class="col-md-2 control-label" for="subAdminEmailId">E-mail
									Id</label>
								<div class="col-md-4">
									<input id="" name="subAdminEmailId" type="email" placeholder=""
										class="form-control">
								</div>

								<!-- sub admin contact number -->

								<label class="col-md-2 control-label"
									for="subAdminContactNumber">Contact Number</label>
								<div class="col-md-4">
									<input id="" name="subAdminContactNumber" type="text"
										placeholder="" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<!-- sub admin gender Id -->
								<label class="col-md-2 control-label" for="subAdminEmailId">Gender</label>
								<div class="col-md-4">
									<select name="subAdminGender" class="form-control">
										<option value="select value" disabled="disabled"
											hidden="hideen" selected="selected">Select Gender</option>
										<option value="Male">Male</option>
										<option value="Female">female</option>
										<option value="Other">other</option>
									</select>


								</div>

								<!-- sub admin Address1 -->

								<label class="col-md-2 control-label"
									for="subAdminContactNumber">Address</label>
								<div class="col-md-4">

									<input id="" name="subAdminAddress" type="text" placeholder=""
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<!-- sub admin Landmark -->

								<label class="col-md-2 control-label" for="subAdminLandmark">Landmark</label>
								<div class="col-md-4">
									<input id="" name="subAdminLandmark" type="text" placeholder=""
										class="form-control">
								</div>
								<!-- sub admin city -->
								<label class="col-md-2 control-label" for="subAdminCity">City</label>
								<div class="col-md-4">
									<select name="subAdminCity" class="form-control">
										<option value="select value">Select City</option>
										<option value="Ahmednagar">Ahmednagar</option>
										<option value="Akola">Akola</option>
										<option value="Amravati">Amravati</option>
										<option value="Aurangabad	">Aurangabad</option>
										<option value="Ahmednagar">Ahmednagar</option>
										<option value="Beed">Beed</option>
										<option value="Bhandara">Bhandara</option>
										<option value="Buldhana">Buldhana</option>
										<option value="Chandrapur">Chandrapur</option>
										<option value="Dhule">Dhule</option>
										<option value="Gadchiroli">Gadchiroli</option>
										<option value="Gondia">Gondia</option>
										<option value="Hingoli">Hingoli</option>
										<option value="Jalgaon">Jalgaon</option>
										<option value="Jalna">Jalna</option>
										<option value="Kolhapur">Kolhapur</option>
										<option value="Latur">Latur</option>
										<option value="Mumbai City">Mumbai City</option>
										<option value="Mumbai Suburban">Mumbai Suburban</option>
										<option value="Nagpur">Nagpur</option>
										<option value="Nanded">Nanded</option>
										<option value="Nandurbar">Nandurbar</option>
										<option value="Nashik">Nashik</option>
										<option value="Osmanabad">Osmanabad</option>
										<option value="Parbhani">Parbhani</option>
										<option value="Pune">Pune</option>
										<option value="Raigad">Raigad</option>
										<option value="Nanded">Nanded</option>
										<option value="Ratnagiri">Ratnagiri</option>
										<option value="Sangli">Sangli</option>
										<option value="Satara">Satara</option>
										<option value="Sindhudurg">Sindhudurg</option>
										<option value="Solapur">Solapur</option>
										<option value="Thane">Thane</option>
										<option value="Nanded">Nanded</option>
										<option value="Wardha">Wardha</option>
										<option value="Washim">Washim</option>
										<option value="Yavatmal">Yavatmal</option>
										<option value="Palghar">Palghar</option>
									</select>
								</div>




							</div>



							<div class="form-group">
								<!-- sub admin divison -->
								<label class="col-md-2 control-label" for="subAdminDivison">
									Division</label>
								<div class="col-md-4">
									<input id="" name="subAdminDivision" type="text" placeholder=""
										class="form-control">
								</div>

								<!-- sub admin  state -->

								<label class="col-md-2 control-label" for="subAdminState">State</label>
								<div class="col-md-4">
									<input id="" name="subAdminState" type="text" placeholder=""
										class="form-control">
								</div>
							</div>


							<div class="form-group">
								<!-- sub admin country -->
								<label class="col-md-2 control-label" for="subAdminCountry">Country</label>
								<div class="col-md-4">
									<input id="" name="subAdminCountry" type="text" placeholder=""
										class="form-control">
								</div>

								<!-- sub admin profile pic -->

								<label class="col-md-2 control-label" for="subAdminProfilePic">Profile
									Pic</label>
								<div class="col-md-4">
									<input id="" name="subAdminProfilePic" type="file"
										placeholder="" class="form-control">
								</div>
							</div>



							<!-- <div class="form-group">
								sub admin add permission
								<label class="col-md-2 control-label"
									for="subAdminAddPermissions"> Add Permissions</label>
								<div class="col-md-4">
									<select id="subAdminPrivillages" class="form-control">
										<option hidden="hidden" value="" disabled="disabled"
											selected="selected">please add permission</option>
										<option value="301">Allow to add the sub admin</option>
										<option value="302">Allow to create new company</option>
										<option value="303">Allow to modify company details</option>
										<option value="304">Allow to remove admin</option>
									</select>

								</div>

								sub admin Role
								<label class="col-md-2 control-label" for="subAdminRole">Role</label>
								<div class="col-md-4">
									<select id="subAdminRole" class="form-control">
										<option value="" hidden disabled="disabled"
											selected="selected">Role</option>
										<option value="SUPERADMIN" disabled="disabled">Super
											Admin</option>
										<option value="SUBADMIN">Sub Admin</option>
										<option value="USER" disabled="disabled">User</option>

									</select>
								</div>
							</div>
 -->


							<div class="form-group">
								<!-- sub admin add comapany button-->
								<div class="col-md-12 widget-right">
									<button type="submit" class="btn btn-default btn-md pull-right"
										name="add_comapany_button">Submit</button>
								</div>
							</div>
						</fieldset>

					</form>
				</div>
			</div>

		</div>
	</div>

	<%@include file="common/footer.jsp"%>