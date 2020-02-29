
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration" %>

<%
Enumeration<String> av = session.getAttributeNames();
ArrayList arr=new ArrayList();
	while (av.hasMoreElements()) {
		arr.add(av.nextElement());
	}
	if (arr.contains("userId")) {
%>
<%@include file="common/header.jsp"%>
<%
	} else {
%>
<%@include file="common/headerBeforeSession.jsp"%>
<%
	}
	
%>

<%@page import="java.sql.ResultSet"%>

<%@page import="com.shetkari_bazzar.dao.ImageLoaderUtility"%>

<%
	String JspPagePathBody = getServletContext().getInitParameter("UsersResources");
%>

<div class="container-fluid img-slider">
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 home-search-margin">
				<div class="row search-box">
					<div class="col-md-5">
						<div class="s2-example">
							<p>
								<select aria-hidden="true" tabindex="-1"
									class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
									multiple="multiple">
									<optgroup label="Alaskan/Hawaiian Time Zone">
										<option value="AK">Alaska</option>
										<option value="HI">Hawaii</option>
										<option value="CA">California</option>
										<option value="NV">Nevada</option>
										<option value="OR">Oregon</option>
										<option value="WA">Washington</option>
										<option value="AZ">Arizona</option>
										<option value="CO">Colorado</option>
										<option value="ID">Idaho</option>
										<option value="MT">Montana</option>
										<option value="NE">Nebraska</option>
										<option value="NM">New Mexico</option>
										<option value="ND">North Dakota</option>
										<option value="UT">Utah</option>
										<option value="WY">Wyoming</option>
										<option value="AL">Alabama</option>
										<option value="AR">Arkansas</option>
										<option value="IL">Illinois</option>
										<option value="IA">Iowa</option>
										<option value="KS">Kansas</option>
										<option value="KY">Kentucky</option>
										<option value="LA">Louisiana</option>
										<option value="MN">Minnesota</option>
										<option value="MS">Mississippi</option>
										<option value="MO">Missouri</option>
										<option value="OK">Oklahoma</option>
										<option value="SD">South Dakota</option>
										<option value="TX">Texas</option>
										<option value="TN">Tennessee</option>
										<option value="WI">Wisconsin</option>
										<option value="CT">Connecticut</option>
										<option value="DE">Delaware</option>
										<option value="FL">Florida</option>
										<option value="GA">Georgia</option>
										<option value="IN">Indiana</option>
										<option value="ME">Maine</option>
										<option value="MD">Maryland</option>
										<option value="MA">Massachusetts</option>
										<option value="MI">Michigan</option>
										<option value="NH">New Hampshire</option>
										<option value="NJ">New Jersey</option>
										<option value="NY">New York</option>
										<option value="NC">North Carolina</option>
										<option value="OH">Ohio</option>
										<option value="PA">Pennsylvania</option>
										<option value="RI">Rhode Island</option>
										<option value="SC">South Carolina</option>
										<option value="VT">Vermont</option>
										<option value="VA">Virginia</option>
										<option value="WV">West Virginia</option>
									</optgroup>
								</select>
							</p>
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

												$.fn.select2.defaults.set(
														"width", "100%");

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
															+ state.text
															+ '</span>');
													return $state;
												}
												;

												$(".js-example-templating")
														.select2(
																{
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
															+ repo.full_name
															+ "</div>";

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

												function formatRepoSelection(
														repo) {
													return repo.full_name
															|| repo.text;
												}

												$ajax
														.select2({
															ajax : {
																url : "https://api.github.com/search/repositories",
																dataType : 'json',
																delay : 250,
																data : function(
																		params) {
																	return {
																		q : params.term, // search term
																		page : params.page
																	};
																},
																processResults : function(
																		data,
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
															escapeMarkup : function(
																	markup) {
																return markup;
															},
															minimumInputLength : 1,
															templateResult : formatRepo,
															templateSelection : formatRepoSelection
														});

												$(".js-example-disabled")
														.select2();
												$(".js-example-disabled-multi")
														.select2();

												$(".js-example-responsive")
														.select2();

												$disabledResults.select2();

												$(".js-example-programmatic")
														.select2();
												$(
														".js-example-programmatic-multi")
														.select2();

												$eventSelect.select2();

												$tags.select2({
													tags : [ 'red', 'blue',
															'green' ]
												});

												$(".js-example-tokenizer")
														.select2(
																{
																	tags : true,
																	tokenSeparators : [
																			',',
																			' ' ]
																});

												function matchStart(term, text) {
													if (text
															.toUpperCase()
															.indexOf(
																	term
																			.toUpperCase()) == 0) {
														return true;
													}

													return false;
												}

												$matcherStart
														.select2({
															matcher : oldMatcher(matchStart)
														});

												$(
														".js-example-basic-hide-search")
														.select2(
																{
																	minimumResultsForSearch : Infinity
																});

												$diacritics.select2();

												$language.select2({
													language : "es"
												});

												$(".js-example-theme-single")
														.select2({
															theme : "classic"
														});

												$(".js-example-theme-multiple")
														.select2({
															theme : "classic"
														});

												$(".js-example-rtl").select2();
											});
							$(".js-example-placeholder-single").select2({
								placeholder : "Select a state",
								allowClear : true
							});
						</script>
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control"
							placeholder="Search for...">
					</div>
					<div class="col-md-1">
						<span class="input-group-btn"> <a href="search.html"
							class="btn btn-default"><span
								class="glyphicon glyphicon-search"></span></a>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<div class="container-fluid  img-slider1">
	<div class="container" style="background-color: #FFFFFF;">
		<div class="row">
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default" style="margin-top: 20px;">
							<div class="panel-heading" style="background-color: #e1e8f3;">
								Search deal by</div>
							<div class="panel-body">
								<form>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<label>Week</label> <input type="text" class="form-control" />
										</div>
									</div>
									<br>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<label>Month</label> <input type="text" class="form-control" />
										</div>
									</div>
									<br>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<label>Year</label> <input type="text" class="form-control" />
										</div>
									</div>
									<br>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<center>
												<button class="btn btn-success">Search</button>
											</center>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color: #e1e8f3;">
								Big deal in Week</div>
							<div class="panel-body">
								<div id="carousel-example1-generic" class="carousel slide"
									data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example1-generic" data-slide-to="0"
											class="active"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="1"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="2"></li>
									</ol>
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item active">
											<img src="<%=JspPagePathBody%>img/12.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/13.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/20.jpg" alt="...">
										</div>
									</div>
									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color: #e1e8f3;">
								Reach Farmers</div>
							<div class="panel-body">
								<div id="carousel-example1-generic" class="carousel slide"
									data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example1-generic" data-slide-to="0"
											class="active"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="1"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="2"></li>
									</ol>
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item active">
											<img src="<%=JspPagePathBody%>img/12.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/13.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/20.jpg" alt="...">
										</div>
									</div>
									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- <script type="text/javascript">
					function portalProduct(){
						 $.ajax({
						        url: 'GridPortalProduct',
						        type: 'get',
						        dataType:'json',
						        success:function(response){
						    var length1= response.length;
						    //alert(length1);
								var itr1=$('#itr');
								var buildhtml="";
								 for(var i=0;i<9;i++){ 
									
								
									
								buildhtml='<div class="img-product"><a href="GridSubCategoryProducts?searchFor='+response[i]+'"><img src="data:image/jpg;base64,'+response[i+1]+'" class="img-circle img-responsive" /></div><h4 class="text-center">'+response[i+2]+'</h4></a></div>';
							i=3;	
								buildhtml='<div class="img-product"><a href="GridSubCategoryProducts?searchFor='+response[i]+'"><img src="data:image/jpg;base64,'+response[i+1]+'" class="img-circle img-responsive" /></div><h4 class="text-center">'+response[i+2]+'</h4></a></div>';
								i=6;
								buildhtml='<div class="img-product"><a href="GridSubCategoryProducts?searchFor='+response[i]+'"><img src="data:image/jpg;base64,'+response[i+1]+'" class="img-circle img-responsive" /></div><h4 class="text-center">'+response[i+2]+'</h4></a></div>';
							//	buildhtml='<div class="img-product"><a href="GridSubCategoryProducts?searchFor='+value+'"><img src="data:image/jpg;base64," class="img-circle img-responsive" /></div><h4 class="text-center">'+value+'</h4></a></div>';
								
								/* alert(buildhtml); */
								$('#itr').append(buildhtml);																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																						
				 
					
								 	} 
								},  
								});
				}
			</script> -->
			<div class="col-md-8" style="margin-top: 20px;">
				<div class="row">
					<!--  <div class="col-md-4">
					<div id="itr">
						
						</div>
					</div> 
 -->
					
					<div class="row">
					<%
						ResultSet rt = (ResultSet) request.getAttribute("productGrid");

						if (rt != null) {

							while (rt.next()) {
					%>

					<div class="col-md-4">
						
						<div class="img-product">
							<a
								href="GridSubCategoryProducts?searchFor=<%=rt.getString("product_id")%>">
								<img
								src="data:image/jpg;base64,<%=ImageLoaderUtility.imageHtmlLoader(rt.getString("product_image"))%>"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center"><%=rt.getString("product_name")%></h4>
						</a>
					</div>

					<%
						}
						} else {
							out.println("sry empty");
						}
					%>
				</div>
					<br />

				</div>
			</div>
		</div>
</div>
</div>

<%@include file="common/footerBeforeSession.jsp"%>