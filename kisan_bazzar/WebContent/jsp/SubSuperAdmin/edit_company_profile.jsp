<%@page import="java.sql.Date"%>
<%@include file="common/header.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>

<%! String Company_ID;  %>

<!-- START CONTENT -->
<section id="content">

	<!--breadcrumbs start-->
	<div id="breadcrumbs-wrapper" class=" grey lighten-3">
		<div class="container">
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="row">
						<div class="col s8">
							<h5 class="breadcrumbs-title">Pages</h5>
							<ol class="breadcrumb">
								<li><a href="index.html">Dashboard</a></li>
								<li><a href="#">Pages</a></li>
								<li class="active">User Prafile</li>
							</ol>
						</div>
						<div class="col s4">
							<br />
							<form
								action="<%=request.getContextPath()%>/user_application/edit_user_info.html?Company_ID = <%=Company_ID %>"
								method="post">
								<button type="button"
									class="btn cyan waves-effect waves-light right" onclick="#">Cancel</button>
								<button type="submit"
									class="btn cyan waves-effect waves-light right margin-10">Edit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs end-->

	<%
		ResultSet rt = (ResultSet) request.getAttribute("rt");
		while (rt.next()) {
			Company_ID = rt.getString("company_id");
		
	%>

	<!--start container-->
	<div class="container">
		<!--Form Advance-->
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="card-panel">
					<div class="row">
						<form class="col s12">
							<div class="row">
								<div class="col s12 m4 l3" style="padding: 0px;">
									<i class="mdi-action-account-box user-icon-size"></i>
								</div>
								<div class="col s12 m8 l9">
									<div class="row">
										<div class="input-field col s12 m12 l6">
											<input id="Company_Name" type="text" Name="Company_Name"
												value="<%=rt.getString("company_name")%>"  >
											<label for="Company_ID">Company Name</label>
										</div>

										<div class="input-field col s12 m12 l6">
											<input id="Company_Reg_ID" type="text" Name="Company_Reg_ID"
												value="<%=rt.getString("company_registred_id")%>"  >
											<label for="Company_Reg_ID">Company Reg_ID</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12 m12 l6">
											<input id="Authorised_Person_Name" type="text"
												value="<%=rt.getString("authorised_person_name")%>"
												Name="Authorised_Person_Name"  > <label
												for="Authorised_Person_Name">Authorised Person Name</label>
										</div>

										<div class="input-field col s12 m12 l6">
											<input id="Authorised_Person_Mobile_Number" type="text"
												value="<%=rt.getString("authorised_person_mo_number")%>"
												Name="Authorised_Person_Mobile_Number"  > <label
												for="Authorised_Person_Mobile_Number">Authorised
												Person Mobile Number</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row">

								<div class="input-field col s12 m12 l6">
									<input id="Authorised_Person_Email" type="text"
										value="<%=rt.getString("authorised_person_email_id")%>"
										Name="Authorised_Person_Email"  > <label
										for="Authorised Person Email">Authorised_Person_Email</label>
								</div>
								<div class="input-field col s12 m12 l6">
									<input id="Company_Website" type="text" Name="Company_Website"
										value="<%=rt.getString("company_website")%>"  >
									<label for="Company_Website">Company Website</label>
								</div>
							</div>

							<div class="row">

								<div class="input-field col s12 m12 l6">
									<input id="Company_Email" type="text" Name="Company_Email"
										value="<%=rt.getString("company_email_id")%>"  >
									<label for="Company_Email">Company Email</label>
								</div>
								<div class="input-field col s12 m12 l6">
									<input id="Company_Contact_Number" type="text"
										value="<%=rt.getString("company_contact_number")%>"
										Name="Company_Contact_Number"  > <label
										for="Company_Contact_Number">Company Contact Number</label>
								</div>
							</div>
							<div class="row">

								<div class="input-field col s12 m12 l6">
									<input id="Company_Fax_Number" type="text"
										value="<%=rt.getString("company_fax_number")%>"
										Name="Company_Fax_Number"  > <label
										for="Company_Fax_Number">Company Fax Number</label>
								</div>
								<div class="input-field col s12 m12 l6">
									<input id="Company_Landmark" type="text"
										value="<%=rt.getString("landmark")%>" Name="Company_Landmark"
										 > <label for="Company_Landmark">Company
										Landmark</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12 m12 l6">
									<input id="Company_City" type="text" Name="Company_City"
										value="<%=rt.getString("city")%>"  > <label
										for="Company_City">Company City</label>
								</div>
								<div class="input-field col s12 m12 l6">
									<input id="Company_State" type="text" Name="Company_State"
										value="<%=rt.getString("state")%>"  > <label
										for="Company_State">Company State</label>
								</div>


							</div>
							<div class="row">

								<div class="input-field col s12 m12 l6">
									<input id="Company_Country" type="text" Name="Company_Country"
										value="<%=rt.getString("country")%>"  > <label
										for="Company_Country">Company_Country</label>
								</div>
								<%
									java.text.DateFormat df = new java.text.SimpleDateFormat("dd MMMM, yyyy");
										String hh = df.format(rt.getDate("registration_date"));
										/* out.println(hh); */
								%>
								<div class="input-field col s12 m12 l6">
									<input type="date" class="datepicker" value="<%=hh%>"
										 > <label for="Registration_Date">Registration
										Date</label>
								</div>
							</div>
					</div>
					<!-- <div class="row">
                      <div class="input-field col s12 m12 l6">
                        <input id="Company_ID" type="text" Name="Company_ID" value=""  >
                        <label for="Company_ID">Company ID</label>
                      </div>
					   <div class="file-field col s12 m12 l6">
                        <input class="file-path validate" type="text"/>
                        <div class="btn">
                          <span>Profile Picture</span>
                          <input type="file" \/>
                        </div>
                      </div>
          
                    </div> -->
					<!--  <div class="row">
                      <div class="row">
                        <div class="input-field col s12">
                          <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
                            <i class="mdi-content-send right"></i>
                          </button>
                        </div>
                      </div>
                    </div> -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<%} %>
	</div>
</section>
<!-- END CONTENT -->
<%@include file="common/footer.jsp"%>
