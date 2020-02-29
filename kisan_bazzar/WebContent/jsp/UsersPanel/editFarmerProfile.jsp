<%@page import="com.shetkari_bazzar.dao.ImageLoaderUtility"%>

<%@include file="common/header.jsp"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileReader"%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.commons.fileupload.FileItem" %>
<%@page import="javax.imageio.ImageIO" %>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="java.io.File" %>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"   %>
<%@page import="javax.servlet.http.*"   %>

<%
	String JspEditFarmer = getServletContext().getInitParameter("UsersResources");
%>
<div class="container-fluid">
	<div class="container">
		<div class="col-md-3">
			<br>
			<h4>Filter</h4>
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
											<option value="WT">Rice</option>
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
											+ state.element.value.toLowerCase()
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
												+ repo.description + "</div>";
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
												processResults : function(data,
														params) {
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
								$(".js-example-programmatic-multi").select2();

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

								$(".js-example-basic-hide-search").select2({
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
			<h4>
				Profile Details
				<h4>
					<div class="panel panel-default">
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
								ResultSet rt = (ResultSet) request.getAttribute("rt");
								if (request.getAttribute("rt") != null) {

									while (rt.next()) {
							%>

							<%-- <%
								String str = rt.getString("profile_pic_path");

										System.out.println("str before " + str);
										str = str.replace("\\", "/");
										System.out.println("string after " + str);

										String b64 = null;
										try {
											File f = new File(str);
											BufferedImage bImage = ImageIO.read(f);//give the path of an image
											ByteArrayOutputStream baos = new ByteArrayOutputStream();
											ImageIO.write(bImage, "jpg", baos);
											baos.flush();
											byte[] imageInByteArray = baos.toByteArray();
											baos.close();
											b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);

										} catch (IOException e) {

										} finally {
											// close the streams
										}
							%> --%>
							

								<form class="form-horizontal" action="UpdateFarmerData"
									method="post" enctype="multipart/form-data">
									<input type="hidden" name="farmerId"
										value="<%=rt.getInt("farmer_id")%>"> <input
										type="hidden" name="status"
										value="<%=request.getAttribute("status")%>">
									<fieldset>
										<div class="row">
											<div class="col-md-4">
												<!-- here am trying to show image to img tag -->
												
												<% 
												String str= ImageLoaderUtility.imageHtmlLoader(rt.getString("profile_pic_path"));
												
												if(str!=""){ %>
												<img src="data:image/jpg;base64,<%=str %>" class="img-responsive" /> <br>
												<%}else{ %>
												<img src="<%=JspEditFarmer %>img/user.jpg" class="img-responsive" /> <br>
												<%} %>
												<input type="file" class="btn btn-success btn-md"
													name="profilePicPath"
													style="margin-left: 1px; margin-right: 15px; background-color: grey; border-color: grey;">Browse
												</button>
											</div>
											<div class="col-md-8">
												<div class="row margin-inp">
													<div class="col-md-4">
														<label class="control-label" for="name">First
															Name:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("first_name")%>"
															name="farmerFirstName" type="text"
															placeholder="Enter first name" class="form-control">
													</div>
												</div>
												<div class="row margin-inp">
													<div class="col-md-4">
														<label class="control-label" for="name">Last Name:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("last_name")%>"
															name="farmerLastName" type="text"
															placeholder="Enter last name" class="form-control">
													</div>
												</div>

												<div class="row margin-inp">
													<div class="col-md-4">
														<label class="control-label" for="name">E-mail:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("email_id")%>"
															name="farmerEmailid" type="text"
															placeholder="Enter E-mail" class="form-control">
													</div>
												</div>
												<div class="row margin-inp">
													<div class="col-md-4">
														<label class="control-label" for="name">contact
															No.:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getLong("contact_number")%>"
															name="farmerContactNumber" type="text"
															placeholder="Enter Contact Number" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-inp">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="control-label" for="name">Date Of
															Birth:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getDate("date_of_birth")%>"
															name="farmerDateOfBirth" type="date"
															placeholder="Enter Date of Birth" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="control-label" for="name">Gender:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("gender")%>"
															name="farmnerGender" type="text"
															placeholder="Enter Gender" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-inp">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="control-label" for="name">Address:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("address")%>"
															name="farmerAddress" type="text"
															placeholder="Enter Address" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="control-label" for="name">Country:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("country")%>"
															name="farmerCountry" type="text"
															placeholder="Enter Country" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-inp">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="control-label" for="name">State:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("state")%>"
															name="farmerState" type="text" placeholder="Enter State"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="col-md-2 control-label" for="Mobile">District:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("district")%>"
															name="farmerDistrict" type="text"
															placeholder="Enter District">
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-inp">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="col-md-2 control-label" for="Mobile">City:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("city")%>" name="farmerCity"
															type="text" placeholder="Enter City" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="control-label" for="name">Landmark:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("landmark")%>"
															name="farmerLandmark" type="text"
															placeholder="Enter Landmark" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-inp">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="col-md-2 control-label" for="Mobile">Pin
															Code:</label>
													</div>
													<div class="col-md-8">
														<input value="<%=rt.getString("pin_code")%>"
															name="farmerPincode" type="text"
															placeholder="Enter Pin code" class="form-control">
													</div>
												</div>
											</div>
											<!-- <div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label class="control-label" for="name">Field 2:</label>
													</div>
													 <div class="col-md-8">
														<input value="" name="companyName" type="text"
															placeholder="Enter Field 2" class="form-control">
													</div> 
												</div>
											</div> -->
										</div>

										<div class="form-group">
											<!-- Form actions -->
											<div class="form-group">
												<div class="col-md-12">
													<button type="submit"
														class="btn btn-success btn-md pull-right" name="submit"
														value="Submit"
														style="margin-left: 10px; margin-right: 15px;">Submit</button>
													<button type="Reset"
														class="btn btn-danger btn-md pull-right" name="Reset"
														value="Submit">Cancle</button>
												</div>
											</div>
									</fieldset>
								</form>
								<%
								}
								}
							%>
							</div>
						</div>
					</div>
		</div>
	</div>
</div>
</div>



<%@include file="common/footerBeforeSession.jsp"%>
