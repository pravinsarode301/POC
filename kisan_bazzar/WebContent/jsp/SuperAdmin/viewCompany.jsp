<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp" %>
		
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">View Company Deatails</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
		</div><!--/.row-->
				
			
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> Company Details</div>
				    <div class="panel-body">
				    <% 
			ResultSet rt=(ResultSet)request.getAttribute("rt");
			while(rt.next()){
					%>	
						<form class="form-horizontal" action="" method="post">
							<fieldset>
								<!-- company_name input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">Company Name</label>
									<div class="col-md-4">
									<input value="<%=rt.getString("company_name") %>" id="name" name="name"  type="text" placeholder="Enter Your name" class="form-control" readonly="readonly">
									</div>
								
							
								<!-- company_registred_id input-->
								
									<label class="col-md-2 control-label" for="email">Company Registred Id</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_registred_id") %>" id="email" name="email" type="text" placeholder="Enter email Address" class="form-control" readonly="readonly">
									</div>
								</div>
								<!-- authorised_person_name input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Authorised Person Name</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("authorised_person_name") %>" id="Mobile" name="Mobile" type="text" placeholder="Enter Contact number" class="form-control" readonly="readonly">
									</div>
								
								<!-- authorised_person_mo_number input-->
								
									<label class="col-md-2 control-label" for="Mobile">Authorised Person Number</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("authorised_person_mo_number") %>" id="Address" name="Address" type="text" placeholder="Enter Permanent Address" class="form-control" readonly="readonly">
									</div>
								</div>
								<!-- authorised_person_email_id input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Authorised Person E-mail Id</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("authorised_person_email_id") %>" id="Address" name="Address" type="text" placeholder="Enter Local Address" class="form-control" readonly="readonly">
									</div>
							
								<!-- company_website input-->
								
									<label class="col-md-2 control-label" for="Mobile">Company Website</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_website") %>" id="City" name="City" type="text" placeholder="Enter City Name" class="form-control" readonly="readonly">
									</div>
								</div>
								<!-- company_email_id input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Company Email-Id</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_email_id") %>" id="State" name="State" type="text" placeholder="Enter State Name" class="form-control" readonly="readonly">
									</div>
								
								<!-- company_contact_number input-->
								
									<label class="col-md-2 control-label" for="Country">Company Contact Number</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_contact_number") %>" id="Country" name="Country" type="text" placeholder="Enter Country Name" class="form-control" readonly="readonly">
									</div>
								</div>
								<!--company_fax_number input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Company Fax number</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_fax_number") %>" id="Profile Picture" name="Profile picture" type="text" placeholder="Select Profile Picture" class="form-control" readonly="readonly">
									</div>
								
								<!-- landmark input-->
								
									<label class="col-md-2 control-label" for="Mobile">Landmark</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("landmark") %>" id="Date" name="Date" type="text" placeholder="Enter Date" class="form-control" readonly="readonly">
									</div>
								</div>
								<!-- city  input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">City</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("city") %>" id="Payment" name="Payment" type="text" placeholder="Enter Payment" class="form-control" readonly="readonly">
									</div>
								
								<!-- state input-->
								
									<label class="col-md-2 control-label" for="Mobile">State</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("state") %>" id="Sucribtion Plan" name="Sucribtion Plan" type="text" placeholder="Enter Subcription Plan" class="form-control" readonly="readonly">
									</div>
								</div>
								
								<!-- Country input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Country</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("country") %>" id="Payment" name="Payment" type="text" placeholder="Enter Payment" class="form-control" readonly="readonly">
									</div>
								
								<!-- registration_date input-->
								
									<label class="col-md-2 control-label" for="Mobile">Registration Date</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("registration_date") %>" id="Sucribtion Plan" name="Sucribtion Plan" type="date" placeholder="Enter Subcription Plan" class="form-control" readonly="readonly">
									</div>
								</div>
								
								
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="button" class="btn btn-default btn-md pull-right" onclick="window.location.href='SuperAdmin?customParameterString=gridCompanyData&status=default'">close</button>
										<button type="button" class="btn btn-default btn-md pull-right" style="margin-right: 1%;" onclick="window.location.href='SuperAdmin?customParameterString=editCompanyData&companyId=<%=rt.getInt("company_id")%>&status=comSpecsData'">Edit</button>
									</div>
								</div>
							</fieldset>
						</form>
						<%} %>
					</div>
				</div>
				
	</div>
	
	</div><!--/.main-->
	
	<%@include file="common/footer.jsp" %>