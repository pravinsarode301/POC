<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp"%>

<script type="text/javascript">

function searchSubCat(){
	var MainCatVal=$('#maincatselect').val();
     $.ajax({
        url: 'GridSubCategoryProductsB',
        type: 'get',
        dataType:'json',
        data: {	searchFor: MainCatVal},
        success:function(response){
        	        	var str=response;
        	var $el = $("#subProductFieldId");
        	$el.empty(); 
        	$.each(str, function(value,key) {
        		//alert(value);
        		if(value!=''){
        	  $el.append($("<option></option>")
        	     .attr("value", value).text(key));
        		}else{
        			//alert('none');
        			$el.append($("<option></option>")
        	        	     .attr("value", 'No Record Found').text(0));
        		}
        	});
       		
        }
    
    	
    
    });
}


</script>

<script type="text/javascript">

    function performAjaxSubmit() {

        var sampleText = document.getElementById("sampleText").value;

        var sampleFile = document.getElementById("sampleFile").files[0];

        var formdata = new FormData();

        formdata.append("sampleText", sampleText);

        formdata.append("sampleFile", sampleFile);

        var xhr = new XMLHttpRequest();       

        xhr.open("POST","/fileUploadTester/FileUploader", true);

        xhr.send(formdata);

        xhr.onload = function(e) {

            if (this.status == 200) {

               alert(this.responseText);

            }

        };                    

    }   

</script>
<div class="container-fluid">
	<div class="container">
		<div class="row">
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
				<h4>Post Company Requirment</h4>
				<div class="panel panel-default">

					<%
						if (request.getAttribute("postMsg") != null) {
					%>
					<div class="panel-body">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong> <%=request.getAttribute("postMsg")%>
							</strong>
						</div>
						<%
							}
						%>


						<div class="panel-body">
							<form class="form-horizontal" action="PostCompanyRequirement" method="post" enctype= "multipart/form-data"> <!-- enctype="multipart/form-data"> -->
								<input type="hidden" name="companyId"
									value="<%=session.getAttribute("userId")%>">
								<!--<input type="hidden" name="companyName"  > <input
									type="hidden" name="productId"  >
 -->

								<fieldset>
									<div class="row margin-inp">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">Product
														Name</label>
												</div>
												<div class="col-md-8">
													<select class="form-control" name="productField" id="maincatselect"  onchange="searchSubCat()">
														<option hidden value="" disabled selected>select category</option>
														<%
															if (request.getAttribute("productGrid") != null) {
																ResultSet rt = (ResultSet) request.getAttribute("productGrid");
																while (rt.next()) {
														%>
														
														<option	value="<%=rt.getString("product_name")%>/<%=rt.getString("product_id")%>"><%=rt.getString("product_name")%></option>
														<%
															}

															} else {
														%><option  >No product available</option>
														<%
															}
														%>

													</select>

												</div>

											</div>
											<br>
										</div>

									<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">Sub Product
														Name</label>
												</div>
												<div class="col-md-8">
													<select class="form-control" name="subProductField" id="subProductFieldId" >
														<option  value=" ">No product available</option>
														</select>
													

												</div>

											</div>
											<br>
										</div>

									</div>
									
									<div class="row margin-inp">
									
									<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">Product
														Quantity</label>
												</div>
												<div class="col-md-8">
													<div class="row">
														<div class="col-md-6">
															<select class="form-control" name="productQuantity">
																<option disabled selected hidden>Quantity</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
																<option value="13">13</option>
																<option value="14">14</option>

															</select>
														</div>
														<div class="col-md-6">
															<select class="form-control" name="productUnit">
																<option disabled selected hidden>Unit</option>
																<option value="grams">grams</option>
																<option value="kg">kg</option>
																<option value="ton">ton</option>
															</select>
														</div>
													</div>
												</div>

											</div>
											<br>
										</div>
									
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">Min.Rate</label>
												</div>
												<div class="col-md-8">
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"><i
															class="fa fa-inr"></i></span> <input  
															name="productMinRate" type="number" step="500"
															placeholder="Enter Min.Rate" class="form-control">

													</div>
												</div>

											</div>
											<br>
										</div>
										</div>
										<div class="row margin-inp">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">Max.Rate</label>
												</div>
												<div class="col-md-8">
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"><i
															class="fa fa-inr"></i></span> <input  
															name="productMaxRate" type="number" step="500"
															placeholder="Enter Max.Rate" class="form-control">

													</div>
												</div>

											</div>
											<br>
										</div>
									
									
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">City</label>
												</div>
												<div class="col-md-8">
													<input name="productForCity" type="text"
														placeholder="Enter City" class="form-control">
												</div>

											</div>
											<br>
										</div>
										</div>
										<div class="row margin-inp">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">Start Date</label>
												</div>
												<div class="col-md-8">
													<input name="startDateOfProduct" type="date"
														placeholder="Enter Start Date" class="form-control">
												</div>

											</div>
											<br>
										</div>
									
									
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">End Date</label>
												</div>
												<div class="col-md-8">
													<input name="endDateOfProduct" type="date"
														placeholder="Enter End Date" class="form-control">
												</div>

											</div>
											<br>
										</div>
										</div>
										<div class="row margin-inp">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="control-label" for="name">Description</label>
												</div>
												<div class="col-md-8">
													<input   name="productDescription" type="text"
														placeholder="Enter Description" class="form-control">
												</div>

											</div>
											<br>
										</div>
									
									<div class="col-md-6">
										<div class="row">
											<div class="col-md-4">
												<label class="control-label" for="name">Image</label>
											</div>
											<div class="col-md-8">

												<input name="productImage" type="file" class="form-control"
													style="background-color: grey; border-color: grey;">

											</div>

										</div>

									</div>
								</div>

									<br>
									<div class="form-group">
										<!-- Form actions -->
										<div class="form-group">
											<div class="col-md-12">
												<button type="submit"
													class="btn btn-success btn-md pull-right"
													style="margin-left: 10px; margin-right: 50px;">Submit</button>

												<button type="Reset"
													class="btn btn-danger btn-md pull-right" name="Reset"
													value="Submit">Cancle</button>

											</div>
										</div>
								</fieldset>
							</form>
						</div>
					</div>

				</div>




			</div>
		</div>
	</div>
	<br> <br> <br> <br> <br> <br>

	<%@include file="common/footerBeforeSession.jsp"%>