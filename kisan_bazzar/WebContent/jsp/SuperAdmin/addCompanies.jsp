<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@include file="common/header.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Add New Company</li>
	</ol>
</div>
<!--/.row-->


<script type="text/javascript">
					function testCompanyRegId(){
						var MainCatVal=$('#companyRegId').val();
						 $.ajax({
						        url: 'CheckByAjaxCall',
						        type: 'post',
						        data: {customQueryString:'companyRegIdForRegistration',companyRegId: MainCatVal},
						        dataType:'json',
						        success:function(response){
						        	
						        	if(response){
						        		$('#companyRegIdexiststatus').html("<span style='color: red; align-self: center; font-weight: bold; padding-left: 57%; font-size: 16px;'>Registration id already in used , try another one ....!</span>");
						        		
						        	}else{
						        		$('#companyRegIdexiststatus').html("<span style='display:none;'></span>");
						        	}
						        }
						 });
					}
</script>
<div class="row">
	<div class="col-md-12">

		<div class="panel panel-default">
		
			<div class="panel-heading">
			
				Company Registration Form

			</div>
			
				<%
					if (request.getAttribute("addNewCompanyStatus") != null) {
				%>
				<div class="panel-body">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("addNewCompanyStatus")%>
					</strong></div>
					<%
						}
					%>
<div id="companyRegIdexiststatus"></div>				
				<div class="panel-body">

					<form class="form-horizontal" action="AddCompanyData" method="post" enctype="multipart/form-data">

						<fieldset>
							<input type="hidden" name="customParameterString"
								value="addCompanyDetails" class="form-control"> <input
								type="hidden" name="sessionUser"
								value="<%=session.getAttribute("userName")%>">
							<!-- Company name input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="name">Company
									Name</label>
								<div class="col-md-4">
									<input id="name" name="companyName" type="text"
										placeholder="Company Name" class="form-control">
								</div>
								<!-- Company Registred Id input-->

								<label class="col-md-2 control-label" for="email">Registred
									Id</label>
								<div class="col-md-4">
									<input name="companyRegId" id="companyRegId" type="text"
										placeholder="Company Registred Id" class="form-control" onblur="testCompanyRegId()">
								</div>
							</div>
							<!-- Authorised Person Name input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">Authorised
									Person Name</label>
								<div class="col-md-4">
									<input id="Mobile" name="authorisedPersonName" type="text"
										placeholder="Authorised Person Name" class="form-control">
								</div>

								<!-- Authorised Person mobile Number input-->

								<label class="col-md-2 control-label" for="Mobile">Authorised
									Person Number</label>
								<div class="col-md-4">
									<input  name="authorisedPersonMobileNumber"
										type="text" placeholder="Authorised Person Mobile Number"
										class="form-control">
								</div>
							</div>
							<!-- Authorised Person E-mail Id input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">
									Authorised Person E-mail Id</label>
								<div class="col-md-4">
									<input  name="authorisedPersonEmail" type="email"
										placeholder="Authorised Person E-mail Id" class="form-control">
								</div>

								<!-- Company Website input-->

								<label class="col-md-2 control-label" for="Mobile">Website</label>
								<div class="col-md-4">
									<input id="website" name="companyWebsite" type="url"
										placeholder="Enter company website" class="form-control">
								</div>
							</div>
							<!-- Company Email-Id input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Mobile">Email-Id</label>
								<div class="col-md-4">
									<input value="" name="companyEmail" type="text"
										placeholder="Enter State Name" class="form-control">
								</div>

								<label class="col-md-2 control-label" for="faxnumber">
									Fax number</label>
								<div class="col-md-4">
									<input id="Profile Picture" name="companyFaxNumber" type="tel"
										placeholder="Company Fax number" class="form-control">
								</div>

							</div>
							<div class="form-group">
								<!-- Company Contact number input-->

								<label class="col-md-2 control-label" for="Contactnum">Contact
									Number</label>
								<div class="col-md-4">
									<input id="Country" name="companyContactNumber" type="tel"
										placeholder="Enter Company Contact Number"
										class="form-control">
								</div>


								<!-- Company Address input-->

								<label class="col-md-2 control-label" for="Mobile">Register
									Address</label>
								<div class="col-md-4">
									<input id="State" name="companyRegisterAddress" type="text"
										placeholder="Enter Company Register Address "
										class="form-control">
								</div>
							</div>
							<div class="form-group">
								<!-- Company Contact number input-->

								<label class="col-md-2 control-label" for="Contactnum">Current
									Address</label>
								<div class="col-md-4">
									<input id="Country" name="companyCurrentAddress" type="text"
										placeholder="Enter Current Company Address"
										class="form-control">
								</div>


								<!-- City input-->

								<label class="col-md-2 control-label" for="Mobile">Country</label>
								<div class="col-md-4">
									<input id="Payment" name="companyCountry" type="text"
										placeholder="Country" value="India" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<!-- State input-->

								<label class="col-md-2 control-label" for="Mobile">State</label>
								<div class="col-md-4">
									<input id="Sucribtion Plan" name="companyState" type="text"
										value="Maharastra" placeholder="State" class="form-control">
								</div>


								<!-- country input-->

								<label class="col-md-2 control-label" for="Mobile">City</label>
								<div class="col-md-4">
									<select name="companyCity" class="form-control">
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
								<!-- Registration date input-->

								<label class="col-md-2 control-label" for="company_landmark">Landmark</label>
								<div class="col-md-4">
									<input id="Sucribtion Plan" name="companyLandmark" type="text"
										placeholder="Enter Landmark" class="form-control">

								</div>


								<!-- Password input-->
								

									<label class="col-md-2 control-label"
										for="companyRegistrationDate">Registration Date</label>
									<div class="col-md-4">
										<input id="Sucribtion Plan" name="companyRegistrationDate"
											type="date" placeholder="Registration Date"
											class="form-control">

									</div>
								</div>
								<div class="form-group">
									<!-- Re-password input-->
									<label class="col-md-2 control-label" for="image">Select
										Logo</label>
									<div class="col-md-4">
										<input id="Sucribtion Plan" name="profilePic" type="file"
											placeholder="Re-password" size="50" class="form-control">
									</div>
</div>
									<!-- Form actions -->
									<div class="form-group">
										<div class="col-md-12 widget-right">
											<button type="submit"
												class="btn btn-default btn-md pull-right"
												name="add_comapany_button">Submit</button>
										</div>
									</div>
								</div>
						</fieldset>

					</form>
				</div>
			</div>

		</div>
	</div>

	<%@include file="common/footer.jsp"%>