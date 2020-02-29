<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp"%>
<%@page import="com.shetkari_bazzar.dao.ImageLoaderUtility"%>

<div class="container-fluid">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<br>
				<div class="panel panel-default">
					<div class="panel-heading">
						<b> Company Details</b>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">

							<div class="col-md-12">
								<label>State</label>
								<div class="s2-example">
									<p>
										<select aria-hidden="true" tabindex="-1"
											class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
											multiple="multiple">
											<optgroup label="Select your State">
												<option value="MA">Maharatra</option>
												<option value="PB">Panjab</option>
												<option value="MP">Madhya Pradesh</option>
												<option value="GT">Gujarat</option>
												<option value="HA">Hariyana</option>
												<option value="OA">Odisa</option>
												<option value="BL">Bangal</option>
												<option value="BR">Bihar</option>
												<option value="RN">Rajasthan</option>
												<option value="KA">Kerla</option>

											</optgroup>
										</select>
									</p>
								</div>
								<br>

							</div>


							<div class="col-md-12">
								<label>City</label>
								<div class="s2-example">
									<p>
										<select aria-hidden="true" tabindex="-1"
											class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
											multiple="multiple">
											<optgroup label="Select Your City">
												<option value="NR">Nagpur</option>
												<option value="PE">Pune</option>

												<option value="ST">Surat</option>
												<option value="IR">Indor</option>

												<option value="PA">Patana</option>
												<option value="KA">Kalkatta</option>
												<option value="AI">Arvi</option>
												<option value="NK">Nashik</option>
												<option value="BA">Bhandara</option>
												<option value="ND">Nanded</option>
												<option value="AI">Amravati</option>

											</optgroup>
										</select>
									</p>
								</div>
								<br>

							</div>
							</br>

							<div class="col-md-12">
								<label>Product Name</label>
								<div class="s2-example">
									<p>
										<select aria-hidden="true" tabindex="-1"
											class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
											multiple="multiple">
											<optgroup label="Select your Product">
												<option value="WT">Maize</option>
												<option value="RE">Rye</option>
												<option value="BN">Bran</option>
												<option value="BR">Bulgar</option>
												<option value="ST">Spelt</option>
												<option value="CN">Corn</option>
												<option value="CR">Cornflour</option>
												<option value="MT">Millet</option>
												<option value="WR">Wild Rice</option>
												<option value="BR">Beer</option>
												<option value="MF">Montina flour</option>


											</optgroup>
										</select>
									</p>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var $states = $(".js-source-states");
				var statesOptions = $states.html();
				$states.remove();

				$(".js-states").append(statesOptions);

				$("[data-fill-from]").each(function() {
					var $this = $(this);

					var codeContainer = $this.data("fill-from");
					var $container = $(codeContainer);

					var code = $.trim($container.html());

					$this.text(code);
					$this.addClass("prettyprint linenums");
				});

				prettyPrint();

				$.fn.select2.amd
						.require(
								[ "select2/core", "select2/utils",
										"select2/compat/matcher" ],
								function(Select2, Utils, oldMatcher) {
									var $basicSingle = $(".js-example-basic-single");
									var $basicMultiple = $(".js-example-basic-multiple");
									var $limitMultiple = $(".js-example-basic-multiple-limit");

									var $dataArray = $(".js-example-data-array");
									var $dataArraySelected = $(".js-example-data-array-selected");

									var data = [ {
										id : 0,
										text : 'enhancement'
									}, {
										id : 1,
										text : 'bug'
									}, {
										id : 2,
										text : 'duplicate'
									}, {
										id : 3,
										text : 'invalid'
									}, {
										id : 4,
										text : 'wontfix'
									} ];

									var $ajax = $(".js-example-data-ajax");

									var $disabledResults = $(".js-example-disabled-results");

									var $tags = $(".js-example-tags");

									var $matcherStart = $('.js-example-matcher-start');

									var $diacritics = $(".js-example-diacritics");
									var $language = $(".js-example-language");

									$.fn.select2.defaults.set("width", "100%");

									$basicSingle.select2();
									$basicMultiple.select2();
									$limitMultiple.select2({
										maximumSelectionLength : 2
									});

									function formatState(state) {
										if (!state.id) {
											return state.text;
										}
										var $state = $('<span>'
												+ '<img src="vendor/images/flags/'
												+ state.element.value
														.toLowerCase()
												+ '.png" class="img-flag" /> '
												+ state.text + '</span>');
										return $state;
									}
									;

									$(".js-example-templating").select2({
										templateResult : formatState,
										templateSelection : formatState
									});

									$dataArray.select2({
										data : data
									});

									$dataArraySelected.select2({
										data : data
									});

									function formatRepo(repo) {
										if (repo.loading)
											return repo.text;

										var markup = "<div class='select2-result-repository clearfix'>"
												+ "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url + "' /></div>"
												+ "<div class='select2-result-repository__meta'>"
												+ "<div class='select2-result-repository__title'>"
												+ repo.full_name + "</div>";

										if (repo.description) {
											markup += "<div class='select2-result-repository__description'>"
													+ repo.description
													+ "</div>";
										}

										markup += "<div class='select2-result-repository__statistics'>"
												+ "<div class='select2-result-repository__forks'><i class='fa fa-flash'></i> "
												+ repo.forks_count
												+ " Forks</div>"
												+ "<div class='select2-result-repository__stargazers'><i class='fa fa-star'></i> "
												+ repo.stargazers_count
												+ " Stars</div>"
												+ "<div class='select2-result-repository__watchers'><i class='fa fa-eye'></i> "
												+ repo.watchers_count
												+ " Watchers</div>"
												+ "</div>"
												+ "</div></div>";

										return markup;
									}

									function formatRepoSelection(repo) {
										return repo.full_name || repo.text;
									}

									$ajax
											.select2({
												ajax : {
													url : "https://api.github.com/search/repositories",
													dataType : 'json',
													delay : 250,
													data : function(params) {
														return {
															q : params.term, // search term
															page : params.page
														};
													},
													processResults : function(
															data, params) {
														// parse the results into the format expected by Select2
														// since we are using custom formatting functions we do not need to
														// alter the remote JSON data, except to indicate that infinite
														// scrolling can be used
														params.page = params.page || 1;

														return {
															results : data.items,
															pagination : {
																more : (params.page * 30) < data.total_count
															}
														};
													},
													cache : true
												},
												escapeMarkup : function(markup) {
													return markup;
												},
												minimumInputLength : 1,
												templateResult : formatRepo,
												templateSelection : formatRepoSelection
											});

									$(".js-example-disabled").select2();
									$(".js-example-disabled-multi").select2();

									$(".js-example-responsive").select2();

									$disabledResults.select2();

									$(".js-example-programmatic").select2();
									$(".js-example-programmatic-multi")
											.select2();

									$eventSelect.select2();

									$tags.select2({
										tags : [ 'red', 'blue', 'green' ]
									});

									$(".js-example-tokenizer").select2({
										tags : true,
										tokenSeparators : [ ',', ' ' ]
									});

									function matchStart(term, text) {
										if (text.toUpperCase().indexOf(
												term.toUpperCase()) == 0) {
											return true;
										}

										return false;
									}

									$matcherStart.select2({
										matcher : oldMatcher(matchStart)
									});

									$(".js-example-basic-hide-search")
											.select2(
													{
														minimumResultsForSearch : Infinity
													});

									$diacritics.select2();

									$language.select2({
										language : "es"
									});

									$(".js-example-theme-single").select2({
										theme : "classic"
									});

									$(".js-example-theme-multiple").select2({
										theme : "classic"
									});

									$(".js-example-rtl").select2();
								});
				$(".js-example-placeholder-single").select2({
					placeholder : "Select a state",
					allowClear : true
				});
			</script>
			<div class="col-md-9">
				<br>
				<div class="panel panel-default">
					<div class="panel-heading">
						<b> Company Details</b>
					</div>
					<div class="panel-body">


					<%
					ResultSet rt = (ResultSet)request.getAttribute("rt");
					
					if(rt!=null){
						out.println("ahe re");
					}else{
						out.println("nahi re");
					}
					
					while(rt.next()){
					%>
															
						<form class="form-horizontal" action="EditCompanyProfile" method="post">
							<input type="hidden" name="companyId" value="<%=rt.getInt("company_id")%>">
								<input type="hidden" name="status" value="<%=request.getAttribute("status")%>">
								<!-- new updated code -->
								<div class="row">
            	<div class="col-md-4">         <!-- jsp/UsersPanel/ -->
                	<img src="data:image/jpg;base64,<%=ImageLoaderUtility.imageHtmlLoader(rt.getString("profile_pic"))%>" class="img-responsive" /> <br /><%-- <%= rt.getString("profile_pic") %> --%>
                	 	<%-- upload file:<input value="<%=rt.getString("profile_pic") %>" name="profilePic" type="file" /> --%>
                </div>
							
                  <div class="col-md-8">
                	<div class="row margin-inp">
                    	<div class="col-md-4">
                        	<label class="control-label" for="name">Company Name</label>
                        </div>
						
                        <div class="col-md-8">
                        	<input value="<%=rt.getString("company_name") %>" name="companyName" type="text"
											placeholder="Enter Company name" class="form-control" disabled>
											
                        </div>
                    </div>
				<br>
                    <div class="row margin-inp">
                    	<div class="col-md-4">
                        	<label class="control-label" for="name">Registered Id</label>
                        </div>
                        <div class="col-md-8">
                        	<input value="<%=rt.getString("company_registred_id")%>" name="companyRegId" type="text"
											placeholder="Enter Company Registred Id" class="form-control" disabled>
                        </div>
                    </div>
					<br>
                    <div class="row margin-inp">
                    	<div class="col-md-4">
                        	<label class="control-label" for="name">Authorised person Name</label>
                        </div>
                        <div class="col-md-8">
                        	<input value="<%=rt.getString("authorised_person_name")%>"  name="authorisedPersonName"  type="text" placeholder="Enter Authorised person Name" class="form-control" disabled>
                        </div>
                    </div>
                   <br>
                   
                    <div class="row margin-inp">
                    	<div class="col-md-4">
                        	<label class="control-label" for="name">Authorised Person Number</label>
                        </div>
                        <div class="col-md-8">
                        	<input value="<%=rt.getString("authorised_person_mo_number") %>"  name="authorisedPersonMobileNumber"  type="text" placeholder="Enter Authorised Person Number" class="form-control" disabled>
                        </div>
						<br>
                    </div>                    
                </div>                
            </div><br>
							<!-- new updated code -->	
								
								
								<!-- authorised_person_name input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Authorised
										Person Name</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("authorised_person_name")%>" name="companyAuthorisedPersonName" type="text"
											placeholder="Enter Authorised Person Name"
											class="form-control" disabled>
									</div>

									<!-- authorised_person_mo_number input-->

									<label class="col-md-2 control-label" for="Mobile">Authorised
										Person Number</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("authorised_person_mo_number") %>" name="authorisedPersonMobileNumber"
											type="text" placeholder="Enter Authorised Person Number"
											class="form-control" disabled>
									</div>
								</div>
								<!-- authorised_person_email_id input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Authorised
										Person E-mail Id</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("authorised_person_email_id") %>" name="authorisedPersonEmail" type="text"
											placeholder="Enter Authorised Person E-mail Id"
											class="form-control" disabled>
									</div>

									<!-- company_website input-->

									<label class="col-md-2 control-label" for="Mobile">Company
										Website</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_website") %>" name="companyWebsite" type="text"
											placeholder="Enter Company Website" class="form-control" disabled>
									</div>
								</div>
								<!-- company_email_id input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Email-Id</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_email_id") %>" name="companyEmail" type="text"
											placeholder="Enter Company Email-Id" class="form-control" disabled>
									</div>

									<!-- company_contact_number input-->

									<label class="col-md-2 control-label" for="Country">Contact
										Number</label>
									<div class="col-md-4">
										<input value="<%=rt.getInt("company_contact_number") %>" name="companyContactNumber" type="text"
											placeholder="Enter Contact Number" class="form-control" disabled>
									</div>
								</div>
								<!--company_fax_number input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Fax
										number</label>
									<div class="col-md-4">
										<input value="<%=rt.getInt("company_fax_number") %>" name="companyFaxNumber" type="text"
											placeholder="Enter Fax Number" class="form-control" disabled>
									</div>

									<!-- landmark input-->

									<label class="col-md-2 control-label" for="Mobile">Landmark</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("landmark") %>" name="companyLandmark" type="text"
											placeholder="Enter Landmark" class="form-control" disabled>
									</div>
								</div>
								<!-- city  input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">City</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("city") %>" name="company_city" type="text"
											placeholder="Enter City" class="form-control" disabled>
									</div>

									<!-- state input-->

									<label class="col-md-2 control-label" for="Mobile">State</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("state") %>" name="companyCity" type="text"
											placeholder="Enter State" class="form-control" disabled>
									</div>
								</div>

								<!-- Country input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="Mobile">Country</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("country") %>" name="companyCountry" type="text"
											placeholder="Enter Country" class="form-control" disabled>
									</div>
					<!-- registration_date input-->

									<label class="col-md-2 control-label" for="Mobile">Registration
										Date</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("registration_date")%>" name="companyRegistrationDate" type="date"
											placeholder="Enter Registration Date" class="form-control" disabled>
									</div>
								</div>

								<!-- Address -->
								<div class="form-group">

									<label class="col-md-2 control-label" for="companyCreator">Address</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("company_current_address") %>" name="companyAddres" type="text"
											placeholder="Enter Address" class="form-control" disabled>
									</div>
									<label class="col-md-2 control-label" for="companyCreator">Pin
										Code</label>
									<div class="col-md-4">
										<input value="<%=rt.getString("pin_code") %>" name="companyAddres" type="text"
											placeholder="Enter Address" class="form-control" disabled>
									</div>


								</div>




								<div class="form-group">
									<!-- Form actions -->
									<div class="form-group">
										<div class="col-md-12">
<!-- 											<button type="submit" class="btn btn-info btn-md pull-right" name="submit" value="Submit" style="margin-left: 10px; margin-right: 50px;">Submit</button> -->

											<button type="submit" class="btn btn-info btn-md pull-right" value="Edit" style="margin-left: 10px; margin-right: 15px;">Edit</button>
												
												<button  class="btn btn-info btn-md pull-right" name="Reset" style="margin-left: 10px; margin-right: 15px;">Cancle</button>
												
												<!-- <li class="active"><a href="">View Company Deatails</a></li> -->

										</div>
									</div>
						<!-- 	</fieldset> -->
						</form>
						<%} %>
					</div>
				</div>

			</div>




		</div>
	</div>
</div>



<%@include file="common/footerBeforeSession.jsp"%>